Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF53EFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVjljbLxMN1Ao9P5aPmniNVCYmfyzPj9ri1tx9ADzF0=; b=Hka66ZspAVPTHWlSXq6gYC8ESF
	wP+08oOhpJF869gtn5RHnR/bgMsSHk+bSZA5X32NDL8sIaU7NVbZE+VSI6ofpZEoH+do6bTQMQld6
	tMSY2xOme2RjAVZMrgd8MPgTq8l81iFEzsv4hPBLN8db0yU8CVqZSwKnvCpFalztd6XQHEcKWNu6a
	ydyZV05il4/+tAzonpndxvk6MlFadMuBRWrR/oGiWT2Ra9vcSXqvlH6dI0dAWjS3DFXEY+cjkv6XN
	ZuEULkyvx8kezjx/OFzQwsdPmFM+XHPPOmEqwCw79xo4BZ+d7r4aLEb/5KmYQcODlMJAmWfR0YcuL
	YzKMR1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGcHX-0000000ER8P-0hJY;
	Sat, 25 Apr 2026 12:38:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGcHU-0000000ER81-3gqP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 12:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44F6B40DDC;
	Sat, 25 Apr 2026 12:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C958C2BCB0;
	Sat, 25 Apr 2026 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777120723;
	bh=Ind4ewbTlV0VMaMhRBhUOAJ51ivGX/THmUva9v/9gmM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kM7gWoJApE75qJV/GMLkMtKlPQti+IbS5dir8eZXg8vc4a+WDzunSPTzQMNkZaVWy
	 r89J97mlPj1uXpgaHQJVe9TGctiAFPTEuSvFV/i2YMDQI0nHz2Xy6JhSnI0wxR1Us5
	 nX+fDiKU3i1YUfd3ZxCLScAY4smiTuWHHcHCF2DgZNB1Nv/6nMAV1+bpMRLx4HuX3A
	 P8Q+P+tbNMgxbvKMAPADDdGfMB0jIl59/3MmsdWzXGfjFKTZH91fwU80RjSDBvPdU0
	 dwobEhpul06D58KHXahHPqjsVF6BANWvHaQUJsm/E+lNJr9WRpZVMgE22aW9VPe5Pf
	 Vli0FxDwA3KIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124F3FF8861;
	Sat, 25 Apr 2026 12:38:43 +0000 (UTC)
From: Abid Ali via B4 Relay <devnull+dev.taqnialabs.gmail.com@kernel.org>
Date: Sat, 25 Apr 2026 12:38:34 +0000
Subject: [PATCH] net: stmmac: fix RX DMA leak on TX alloc failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-stmmac-rx-desc-cleanup-v1-1-1a18a704c422@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMm17GkC/x3MQQqEMAxA0atI1gZqScXxKoOLUqMGtCPNKELx7
 haXb/F/BuUkrNBXGRKfovKLBU1dQVh8nBllLAZrbGvIOtT/tvmA6cKRNWBY2cdjRyIzGdeRo4+
 FEu+JJ7ne8Xe47we0+LlFaAAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777120721; l=998;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=6KNXYVuQw7qzkBuKkHzTHDqB5iOSzE7NC8yleiDYCcg=;
 b=EahVl7YbST7PFQZTcka11Q36pigH8utz9YqMXE8P+DU+sn23jzKVHG85DfrDfWEzR+sWFhWOw
 /h/aEKBo3ucCFAMZBnSU4000q8fFB8aF7BvvRihgWI7wK5bi7GsKhhe
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-Endpoint-Received: by B4 Relay for dev.taqnialabs@gmail.com/20260425 with
 auth_id=752
X-Original-From: Abid Ali <dev.taqnialabs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_053844_967551_C7967620 
X-CRM114-Status: UNSURE (   9.62  )
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
Reply-To: dev.taqnialabs@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abid Ali <dev.taqnialabs@gmail.com>

Free RX DMA resources when alloc_dma_tx_desc_resources() fails in
alloc_dma_desc_resources().

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 13d3cac05..8bb843b55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2370,8 +2370,12 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret) {
+		free_dma_rx_desc_resources(priv, dma_conf);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 /**

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260425-stmmac-rx-desc-cleanup-440f05845492

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>



