Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA06C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 01:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABw4ARhNQAkd4rlXFYixFM0InLDEdXfdXSG/4HG1QLQ=; b=XA0rvA2lB4ASohP+IgS565N6rl
	FEf+1u2obt48YjUHO8Jtz5prQ2HEKFMYdr71C7DS7PAbJ14kDw+147Q5tOcXJmdw7zv2k+Hp7yA4e
	S2wRoXTm1y1GAH0My1VPEKk2Zuxu/XhaYmDBY6/9jmEjgUXwJ6QQIuqL/wlFEFOke7UuvuAPmS7A8
	qZnpQ2MiN8A+OAy8q8EUHq1VUBkutgEVwrfjyl0c6I+5F/AFozP90JDLbXRZe+RABHNSUF3V7kQG1
	DU2cGisYWbysRIUZjhXDnYt9sww5i1i+06nuTise3u9rn90850q9Un788i/NXO4w0WM1cqPCygiGk
	eenbgVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u330e-0000000CDt7-2fLO;
	Fri, 11 Apr 2025 01:16:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32tQ-0000000CCR4-4BBY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 01:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1744333750;
	bh=ABw4ARhNQAkd4rlXFYixFM0InLDEdXfdXSG/4HG1QLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=So5fjgqt9a9pj2mC+YdxESJ/ZFNZh4U8IMB+HEFP0wC04D7yukXU067Ok9Fudgw5m
	 I/eFeoUIFghXlhYObM+Q0OFIVkjRMLYNiu2/zlSSBu0rnT5+AkmvrCztE7AF2i7Zw5
	 do7euB8rxbndWNAiuvpLeL807qtoFuGMPdPKWfjbpQQIiH4VUR44T2fyDXmZ3g7Rdp
	 pzlUl7giYfvNYNWQ9kxC1H7WVwzwln1zHX87DRf4BbF5qbLa4qEzyyvMxHJN06w9Lg
	 YHZO5UtF2UHjq5jitMgrBk8vBnDhj+T9jKTp1rCFPr8YvrhJUP3ufKJtUftKgK3aep
	 a9802cCCXkNWg==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 01ECA7D714;
	Fri, 11 Apr 2025 09:09:09 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 11 Apr 2025 10:38:34 +0930
Subject: [PATCH 4/7] soc: aspeed: lpc-snoop: Constrain parameters in
 channel paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aspeed-lpc-snoop-fixes-v1-4-64f522e3ad6f@codeconstruct.com.au>
References: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
In-Reply-To: <20250411-aspeed-lpc-snoop-fixes-v1-0-64f522e3ad6f@codeconstruct.com.au>
To: linux-aspeed@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Henry Martin <bsdhenrymartin@gmail.com>, 
 Jean Delvare <jdelvare@suse.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Andrew Geissler <geissonator@yahoo.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>, 
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_180917_281294_937B4041 
X-CRM114-Status: UNSURE (   8.07  )
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

Ensure pointers and the channel index are valid before use.

Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 28f034b8a3b7226efe20cbe30a7da0c2b49fbd96..6ab362aeb180c8ad356422d8257717f41a232b3c 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -182,6 +182,7 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	return 0;
 }
 
+__attribute__((nonnull))
 static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				   struct device *dev,
 				   int channel, u16 lpc_port)
@@ -190,6 +191,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
 	int rc = 0;
 
+	if (channel < 0 || channel >= ARRAY_SIZE(lpc_snoop->chan))
+		return -EINVAL;
 
 	if (lpc_snoop->chan[channel].enabled)
 		return -EBUSY;
@@ -252,9 +255,13 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	return rc;
 }
 
+__attribute__((nonnull))
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				     int channel)
 {
+	if (channel < 0 || channel >= ARRAY_SIZE(lpc_snoop->chan))
+		return;
+
 	if (!lpc_snoop->chan[channel].enabled)
 		return;
 

-- 
2.39.5


