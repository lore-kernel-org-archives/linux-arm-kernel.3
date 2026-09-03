Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12FBC624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Aq7Yc9yLHAAzo2a1VLGYdmtVCdrsptbcUOw8CUCd9/0=; b=zBDqYlv7OTMbyHlRPG+2miuqU3
	+okANOOvw402KrVQXwJfpUXLCowxXnvTiPjTz61ypPJZvtO3PLvdjf9uO2AolWg5qaVCbnjXrk4lb
	j1GDNOyMbvRTQ4nllZZmHmaKHWQm0Od7xl6wWIuEtlhxl0VcHCcl2zDj2P1CVEQlsH+owkld05poE
	tNBPFMwSTl/4mGSvOi68ipLJlGKYz0vmh3ZK1Y3LAqc/hf/5ijAMUrlEcIDTzybuI0c3s6cplHjuD
	Ae/qbO4T9S5B34K+iyhtCcReYAIb4WAvwVezQ7ysC4JgzElrMjAhs342fjaiR0QgAhBqmjw7es/Nb
	tmKDY2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x253Q-0000000H8e6-2ltm;
	Thu, 03 Sep 2026 10:52:24 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x253N-0000000H8bI-0cUC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788432674;
	bh=Aq7Yc9yLHAAzo2a1VLGYdmtVCdrsptbcUOw8CUCd9/0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=p1Svzqv8gv+RKj8d1M7VxVNAopAnvmvPzgruku0XTxRiqPA7iZ6COKRcr+OJcViU+
	 ZdMxdntmdn4JCMfT5V14SMjWUVcy2RBTjSHb8EDsx45MwFNXXr9NpZIhrEF0SEKspa
	 R4M6MFSBXPkWBk2KC0sveHgfY5vKxi7cCs2JfW+M=
X-QQ-mid: esmtpgz14t1788432668tb6cc9c0f
X-QQ-Originating-IP: tF6196t+vWc8kb7gFg0WDvqAQUR9MwK+wQ/rZGZNce8=
Received: from [10.10.7.69] ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 18:50:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12566516252046344313
EX-QQ-RecipientCnt: 16
From: ZhaoJinming <zhaojinming@uniontech.com>
Date: Thu, 03 Sep 2026 18:50:35 +0800
Subject: [PATCH] net: stmmac: clear dma_conf on MTU change failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-fix-stmmac-mtu-change-use-after-free-v1-1-c81dc7d6d18a@uniontech.com>
X-B4-Tracking: v=1; b=H4sIAPpQmWoC/y2NQQrCMBBFr1Jm7UBsJFCvIi4m6cRmkSgzaRFK7
 +4oLh+8//4OylJY4TrsILwVLc9mcD4NkBZqD8YyG8PoxuAm5zGXN2qvlRLWvuJfWpWRcmfBLMw
 YJj9T4Hgh78BSL2Hb/W5ud+NI5kehlpZvvJLaFI7jA9jxgfmPAAAA
X-Change-ID: 20260903-fix-stmmac-mtu-change-use-after-free-693da6eb4a30
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Simon Horman <horms@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>
X-Mailer: b4 0.14.2
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M5SVnYpRxpvK6D7rw/EZ7cJsQ+xGvu8eqQcIaJfOJcol+5RAioyc8sc6
	mOzuWpA9sLAAgmqE4cTAFC/I7xGtRvaHD2HB1qBbAK3WjV1iN32LKLpqYCdTZT96IrQhPnP
	QAnbpaAKJlFFRRsv4LI2uyyHGzm3LjQYbszHc+EOGsFokS+Bmofrb3iyaQyU71vX3gpcPwU
	U7GtYT9gfyq9m/JS5CgB54Q3qS9ggysrPjmDFYTFy2P25Ef0W1fJjiIHAveSA7XLXELqChx
	C/5D6UOQuXZgE2hVMAhZNSCVuSwakHji9q1r4yZ2fWZX/CGxvUkAdCzCTSRLcYqDLBKbQfV
	p5p0qM5joeKkM/RJy7HTs9YVi43L7lLgbA8/Ns9F5kj/BuD9Dg8SrlhzyFHg0WKaSQp0mw9
	vMBs23F/79Q93mIUOIUfuZGtwjb3JIpeR5nHAjvL3cymPmfdECzd/MR2GMDL0M95kJmp7+k
	OODngc4a7+XtJHiniQ+0KxUd2TTrSKOzykfNhdLVxWLNS5YuncGuLfiqO1JiUL1/1nHX9xK
	FlvZIZ5v3IVNS9pQsGhP+1JPfoq6zXLtTO7/81elp99229i1CG0Yc8M41CP9XPPS7q+7+QE
	TfJrz5s4PfBQnCFHFp+LPRzc1aqH0hX3IqtR+qYMmRiwFx6S/+go7LEFL8+zPvea56cIaDq
	OThiXLcDaxSf2agVvcMvN5FSejZPH8juMfmteXKj2bLWyqrA+b5Sl9GsRedWMnpkI6BdHQn
	Ri539BQX4c58RCfr7cR4mTad/oxtcwwfqbNTLxk65HCME1fjNVv8D1J2N1arae7zXcEDwjq
	Vy+49fNXiKx8bTOsqe2xWElgt8L7HAKBjyYsViZH8UkHjK4Hsk/pHfrD/bmjY8bkQDFzKoK
	3Zl5hUvNhP/9cvNZ+amsOPKli9BRNIASeCLBbQx+2mwAEGNTUhNhXINRLgsp4hfXIcZIhKC
	IILhxiVOrYvSDAQ40JMC4lfbmy2EB4ZEKtD1apGCj21arW/x6NrdAnACBOCxhwgqX4fpnNo
	u3gM6Brqlfh5EElHAM
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_035221_711705_5D2A272A 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

stmmac_change_mtu() releases the current DMA configuration and then
reopens the interface with a freshly allocated dma_conf.  __stmmac_open()
copies that dma_conf into priv->dma_conf via memcpy() before it can fail
(e.g. in stmmac_request_irq()).  When it does fail, the error path frees
the dma_conf descriptor resources and the struct itself, but priv->dma_conf
still holds pointers to those freed resources.  The interface remains
running, so a subsequent stmmac_release() or another MTU change releases
those resources a second time, a use-after-free.

Zero out priv->dma_conf after freeing the failed configuration so the
stale pointers are not released again.

Fixes: 30134b7c47bd2 ("net: ethernet: stmicro: stmmac: fix possible memory leak in __stmmac_open")
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f2fc89176654ed07dafc30ea1dd481d9f08fb120..9d4b93a64e32f375ef9ee4917f60c40ce2409f07 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6132,6 +6132,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
 			kfree(dma_conf);
+			memset(&priv->dma_conf, 0, sizeof(priv->dma_conf));
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
 		}

---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
change-id: 20260903-fix-stmmac-mtu-change-use-after-free-693da6eb4a30

Best regards,
-- 
ZhaoJinming <zhaojinming@uniontech.com>


