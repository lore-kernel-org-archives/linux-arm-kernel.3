Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE10C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxjLY+dO2+M6dAPP4O5C2TYlQAkIEGVFn+LqzUU56xk=; b=fXFhitxPWl4ABMj5IakDUjgjic
	x7bAeshxQX1lSMuKZ3P16MQWlRM/Gqo/KhBqGW0CS6IZ4FUW8nU2OFZFsWk0CUqOY+25kMDfwKkgM
	75SIzNy1NgQxZz0UrG/60m4074+ICWPz86njIothSzWmvI0qyWMtzE8eEc3rahST81GG0EewEIaET
	G5SKF1HpU6COOcOphtY93vbzAOmo/JmKXhgBNkPo2u0MZDfR8Q8CgnRKlYOkrnklZFqlQWwoEvhkK
	eMWrC+E4Cltgd8DzK+zc16B/Jc27YkCJtIgh5Fhkf/IeGhXjn3ieI6sfxjWJy0lYa8F5UiDha0BwK
	auFm5xxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVkO-00000005YaP-2yRF;
	Tue, 04 Mar 2025 17:08:00 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUWf-00000005HyD-2hep
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741103385; x=1772639385;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RxjLY+dO2+M6dAPP4O5C2TYlQAkIEGVFn+LqzUU56xk=;
  b=d7WNiG9FNYMW8Nxz7w0koCr+1h6A9xyklfs8GyAtbo6A65WA3AbsaeMl
   RgmSnrXqlW21stycpqiANl91+v/2HgLpepYAJBbI2cS1NImCglEFcL7vJ
   KbYoMs6YTXug7eRrrUM0FEyePhhSXwEcPvKIXAgjfYMwPsItBNOw9HtSP
   Zgnrdyx0OgZ0P865lXXs2VFSUyVrhoE7asoUfrMLinzg1n8JM7R/yhW9f
   +8GV6XXmRIbcjYLwnzyQli95YLCneus7MEMzyQxIpt+6BAEFDBN10gtvh
   TaGjs/0S4aw7kg+dBVITa1eitxrDvuKxWj38ooXRc0+pVco+nvrLLEqPP
   Q==;
X-CSE-ConnectionGUID: srgkOrVoSMGCzSHkE6t96A==
X-CSE-MsgGUID: VITbaLT5S6KiMjEaQghCIg==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; 
   d="scan'208";a="42272731"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:49:44 +0100
X-CheckPoint: {67C72118-1B-B1D34AC3-DEA5B19F}
X-MAIL-CPID: E0D2B10078B4CA83A8D18B3CD17988BB_4
X-Control-Analysis: str=0001.0A00636B.67C72119.00E4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6641016190F;
	Tue,  4 Mar 2025 16:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741103380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxjLY+dO2+M6dAPP4O5C2TYlQAkIEGVFn+LqzUU56xk=;
	b=jDSKMzdKu3rSdQ/LMNCBayk1t2v+VAGcA84zQfLZTsPYgCv+uM4h2jjqV1CHbwe7nS8b26
	kHic7Upuv68wa80OQKIcbUzoL0ErVV2yLyqaZWWTL53rbUP9hlhwWBmY/5HmMiABrdD9pG
	E2qb6RydzNlSYreRljFVZuvIR2osQ1fCo+xtOnW6qlLRAK/iqQtOb+rKnL6eudhTlWsfpd
	FsmfhLZURQJFvoopeZXjKGU0vXKWU4fMsvCVTssJ5YMhMNSM/z5+Lq0DMASoPr8ul9bRj8
	VKxr1Qcu9OeFmbO+knq3/8+7VoGqcY81LtAnkEI2mmj/XGzj5v0JLS+w6n4IIA==
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
Subject: [PATCH v3 1/6] clk: imx: clk-fracn-gppll: Add 477.4MHz config for video pll
Date: Tue,  4 Mar 2025 16:49:20 +0100
Message-ID: <20250304154929.1785200-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074945_977276_F65B6ED9 
X-CRM114-Status: GOOD (  10.11  )
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
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


