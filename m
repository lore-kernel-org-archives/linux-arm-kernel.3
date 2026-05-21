Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6642CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9In61+ZHagccfIlYuNobIHgAoaAUZnAG380XJjBbpfQ=; b=oBg0WeRxkfECqxgIlo9PFjU5Z7
	jjYb6w9HBMFe0IFKTKGMLU/mw6AIFl+6yzw5dtuf4I0nxiWptfZSGgO6bjhP85h1HEvINpwayRyV9
	Gv1hGXKUrmk/D7uyE20veuiSbTW+EsqfcgOKbL43DMjzt39aokQqYJD08GTXfx2lQIwwLhqbPgYL7
	u+Tpo5F9SddIYieqhhmE5jgTbycZH1TfmHAQEHUD22jHPCZqu0bJWMtpayP8G8F/BVqJXxn983nC7
	4n24rtidqjYBPzWF/DQ7QFUShinztKhreyN3XmKjp/E6+Atto8zMkGtLxtF54uqYnOr8b8pGHVcQV
	VYyd0JDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6KL-00000008VIv-3ASM;
	Thu, 21 May 2026 16:32:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6KG-00000008VIA-3mrn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0269740B33;
	Thu, 21 May 2026 16:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD768C2BCB4;
	Thu, 21 May 2026 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779381167;
	bh=z3v6YO+0Wv56+AsTvqL7AMaNeB9qSJnJg6uwyLqlCXQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LT8oEfb9sI945gIfNB7Ll7i8odp/msHWe6c1V0v2SbCfPy5l4EAQkotx9Dudz3bCO
	 fcaL6onQCErdJZQZqWTUEWnnLvItCuEXY4JKKGHgDvP/6p7Kv8wYi8pygIxfewy/UN
	 PRJxNY8Dg1L8s/Vm1k+sWUfY4NqicvnoUBTb7w1DhfPK5hQ8EEhRfpl+h6xX3m1P/I
	 VlqWHbBJ0Nwwot6a1Y+t0ZRbE1Znq9c+rJtvCgElNglIic8at5gZ2kGjs4KsIgilrk
	 2obsJiYVWJzQPCyJPoH29Y/a9rfGMQOBVcXLE1UodFW44w+c0ASPjhVNoLxSDxnsjc
	 fhYSuNK2oa8Rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C320CCD5BAF;
	Thu, 21 May 2026 16:32:47 +0000 (UTC)
From: Abid Ali via B4 Relay <devnull+dev.taqnialabs.gmail.com@kernel.org>
Date: Thu, 21 May 2026 16:32:46 +0000
Subject: [PATCH v2] net: stmmac: mmc: Remove duplicate mmc_rx crc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-xgmac-mmc_rx_crc-cleanup-v2-1-7d9de09f5898@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK0zD2oC/42NUQ6CMBBEr0L67RpaAoJf3sMQsq5b2IQCaZVgS
 O9u5QR+vsnMm10F9sJBXbNdeV4lyDwlMKdM0YBTzyDPxMrkpspLk8PWOyRwjjq/deQJaGSc3gu
 gJcbKItb4UGm+eLayHep7m3iQ8Jr953ha9S/9Q7pq0HDRRWFL09RlY2+pKeOZZqfaGOMX/Bkb+
 8AAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779381166; l=1735;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=YT6MwxbT32LmsJ0Q4toXiSUGLZ0LUkCCQs3ZtA9Xc6A=;
 b=4nb99cKuWhzcka7MVU0baeVQGR1KS14hPy/Qj6o+FR+zkwGaooEwyN2rZln4L5Ctvpa4Fl4/0
 VoiHf/eHZF6CxH9tbvd1DO3g0ClGL8324bUtCG3NHSJgcWl2owhEIwL
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-Endpoint-Received: by B4 Relay for dev.taqnialabs@gmail.com/20260425 with
 auth_id=752
X-Original-From: Abid Ali <dev.taqnialabs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_093249_025183_E4509600 
X-CRM114-Status: UNSURE (   9.99  )
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

MMC_XGMAC_RX_CRC_ERR is clear-on-read, and just a single read would
update the mmc_rx_crc_error counter.

[1] commit b6cdf09 ("net: stmmac: xgmac: Implement MMC counters").
The duplicate read appears to have been unintentionally introduced in
the intial MMC counter implementation. The databook does not mention
MMC_XGMAC_RX_CRC_ERR needing the additional read.

Fixes: b6cdf09 ("net: stmmac: xgmac: Implement MMC counters")
Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
Changes in v2:
- Updated why the redundant read is removed based on feedback.
- Link to v1: https://lore.kernel.org/r/20260520-xgmac-mmc_rx_crc-cleanup-v1-1-7133f529859f@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index 1b3b114e7..d81581dfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -479,8 +479,6 @@ static void dwxgmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
 			     &mmc->mmc_rx_multicastframe_g);
 	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_CRC_ERR,
 			     &mmc->mmc_rx_crc_error);
-	dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_CRC_ERR,
-			     &mmc->mmc_rx_crc_error);
 	mmc->mmc_rx_run_error += readl(mmcaddr + MMC_XGMAC_RX_RUNT_ERR);
 	mmc->mmc_rx_jabber_error += readl(mmcaddr + MMC_XGMAC_RX_JABBER_ERR);
 	mmc->mmc_rx_undersize_g += readl(mmcaddr + MMC_XGMAC_RX_UNDER);

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260520-xgmac-mmc_rx_crc-cleanup-afcea6faa8ab

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>



