Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02724CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CKfS5ttvlMedu/93Lq3K0w3/WbxQqdTyhLGvPMZ7C8=; b=aHroMrmtnIHc50Jb6nAFpxTdiV
	AMjnFuqak6ngc2qGaRp7Ehb2+RMCTaXLSpr50Qha4EbKwoewps9LRI5aa6K1caFNjmoaH17/z8EHH
	FBUl21ZvaUdp4+FPyConmMA5wUJ8q4JWnAw5hV12w0lbGRCkBxsxDQainI0YOS3xXtpso1hgH7HcP
	qbrCLKwJHWD6FixaRWmELDD13X7BYxJAQJgIh/oiOkLrafJL+8kM7MS6PmFJPHFyK5AzIHbaIzF5x
	fcVoT25h99Im2R6+O7eRv5x0khbpPzpWXRPvdefXvJm9p+6GVixT8FnyrIezeazaiYUMQafcyh3Nt
	oo4zbYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsuO-00000006Tkz-3IU5;
	Fri, 31 Oct 2025 17:27:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsuD-00000006ThD-1S7S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41B31437A6;
	Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A0CBC116B1;
	Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761931636;
	bh=RohrhTza2xAFrs7CezlnV5dAmx3p2a4uuSdG6YJAqwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iPNWb7uOYK0sALyAQtVjPwJ9HIZ5dFMoTNwxtSNLb29zOQjrDsGmMRkSIhNvEMxAs
	 arowbfFq5CvvszJo21oTnP6fH820QucS3uoLS67GGrOTupOMMrT8ebih4IT+UhyAPK
	 Af349P5DHeOyOCQ3rCpDYr2i/XX2cghA7b/P8kTmuxB54l0yfhM84VwJLb7Hf7oZLL
	 VkGIGH6yHfPdrdiF9ELnKcsdAj7jTkulQzM3o6fqkrmC4ET9rth/tXlA3lZf5Yy0DR
	 GLXh2FUaCKXBY4qZioXW1rk42WqRPBiZW/ODh1CAU5Fcy+gg8J1sQXRoPogsB5yFdd
	 g+FundlZBu4fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BBECCFA05;
	Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Sat, 01 Nov 2025 01:27:09 +0800
Subject: [PATCH net-next v2 3/4] net: stmmac: socfpga: Enable TSO for
 Agilex5 platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-agilex5_ext-v2-3-a6b51b4dca4d@altera.com>
References: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
In-Reply-To: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761931634; l=898;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=7La402FNfWCHW7j+XKQ6FKNGivUWIK2yY2YFq0PbKn8=;
 b=qyEa1i+Sp+Z+47IiaDkmTF96tqOrqVij/aA0ZAXBlDqEpiqC+S+bZIll82jlrFrbONdseYOmz
 Z6FCoaHOYBWAWe9ddUIaPglfUtbijCuJA8aDZ08S+aAri2TSvsmQwlt
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102717_415038_F0A26FB7 
X-CRM114-Status: UNSURE (   8.51  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Agilex5 supports TCP Segmentation Offload(TSO). This commit enables
TSO for Agilex5 socfpga platforms.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 4f256f0ae05c15d28e4836d676e2f2c052540184..1837346ca2d438018ae161a233f415fe0181c78d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -458,6 +458,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 
 	plat_dat->core_type = DWMAC_CORE_XGMAC;
 
+	/* Enable TSO */
+	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
+
 	/* Enable TBS */
 	switch (plat_dat->tx_queues_to_use) {
 	case 8:

-- 
2.43.7



