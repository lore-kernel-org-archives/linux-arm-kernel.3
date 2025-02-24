Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2608AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLDKoEHmBNZru20DMSxS9Pw3dDW9jMuSmbZS8x5oymU=; b=WW8R2hBmjTyhSRxZyT6DD6honO
	Y9EmevkQBJaIWMrXa+Yx4bZojPnf/GXO8RzDsB8/U8JLhkb77broCQ0EsSoeskyJc5VRuy57sxdt9
	aYq7qabxw7xXQaVFBJPEJRAujDIFxT/r4TUOw2krnsuEceiX6y3T7EQmBhaLPSbQ4eh6cSezI8wKU
	oi9pb96hy45eqAszrKzIN9aLWPo1gyMov+0/BfDpuUgkSHocjE7UC3l5lhjzjMY39z2H+SMtBnRPq
	bu2qafirXKMaX7sjRH5Xea7DeO2ayJcc+4lnwNw4DzDVv0i7lDdk0sbkhEIrO+dGFKOrkJha9GWrE
	3pOM1rOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZog-0000000EB21-0xMQ;
	Mon, 24 Feb 2025 14:52:18 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZRv-0000000E64v-3Xgy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740407327; x=1771943327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KLDKoEHmBNZru20DMSxS9Pw3dDW9jMuSmbZS8x5oymU=;
  b=EEeay6W5MLMC+jnrYu3RGJNsYB96ZqjYwbNIpTYEB8kfKFoS9sgnvyqf
   l19l/KyZm5Ir5lDpog3ctWYNSEIC2UcTXNkoBHXuDDySmg8jL+Wak/2mC
   tRxXntsw2kLdlAuNGNsOOC74zhfomajshCz299pGH2jIATWsDuxrx0RJb
   tqbbQKwoghklmZy+RgCncq3mRO4XoOdBrmKI14cTjrGKfvBCl0wxeSAGa
   2CscN714uFJlopxDKZqmyP0DNeWt2ZhSnCcdzeL587HQBDR4T7OotVmV7
   5qFYOtzrJT7HD5KODriqH/TdTEkLa/Sh3ArqdVegE8+unKB10UNWSdf6l
   A==;
X-CSE-ConnectionGUID: jNuVcmjMQdu/XzMNYCrMEw==
X-CSE-MsgGUID: +pIsMXW4QX68UZLFm3DBOw==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42042104"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 15:28:46 +0100
X-CheckPoint: {67BC821E-1B-F75C4246-F0BD6D90}
X-MAIL-CPID: 791E6579507C17192F024A34A370D616_3
X-Control-Analysis: str=0001.0A002103.67BC821D.00DE,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87012167930;
	Mon, 24 Feb 2025 15:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740407322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLDKoEHmBNZru20DMSxS9Pw3dDW9jMuSmbZS8x5oymU=;
	b=Bm7iv9QeP09ZvQ0CG8V6YnlSJwXWQ066UmYdvl7P0n29NR06EVQMgL5AIqra9lqP966b/E
	8zztU7NQzepM/2g4fPceO99tcpZBatawxa0IHjY7RDc2Xp7nMqtJNowt+ZvBj0HUvQD9HS
	hBOt5irKjh1gMIrcp0jLrxV0sLd6uYEXD81i3wNtvwlGs5R4mPMQGfNgsyTm3azQuUwf9V
	nL1dfYBhwqjEmtyOZDCyTby6HAv074VfZ5Qa+jrkDY3ipcZ5NHg3lvZDpXDuC1QmR55VGG
	8toWUwbVCrMrSVdy02l16l6pruNpM98ZSYmWMc5kdNpWWR0cA8z4S+HkHxgpYg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/6] clk: imx: clk-fracn-gppll: Add 477.4MHz config for video pll
Date: Mon, 24 Feb 2025 15:28:22 +0100
Message-ID: <20250224142831.485159-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_062848_175822_7A455EF7 
X-CRM114-Status: UNSURE (   9.95  )
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

Add the 477.4MHz frequency support that will be used by video subsystem
on imx93.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 85771afd4698a..f0c34a02acac3 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -85,6 +85,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(519750000U, 173, 25, 100, 1, 8),
 	PLL_FRACN_GP(498000000U, 166, 0, 1, 0, 8),
 	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
+	PLL_FRACN_GP(477400000U, 119, 35, 100, 0, 6),
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
-- 
2.43.0


