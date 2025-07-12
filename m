Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7DAC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMiENT7nzxfoafiX1IT5aN+t/mOi7FUDDhH/7DvLxK8=; b=xgXwxHnjGWfBIqwc9NzYA/c2hh
	aolHR3BDf195J1up0W4xF9Plt2gFABTOFxJylACmoTg0QNI3FTD62ytXJxcP9Kw1QHH/nDxMV6c/V
	uTvS6oGB+I+ojEwLcr9lYEJ6LR35/fLD6ccn4bFwmi/zaWUyug5SXgsjmN9owrR27k9YylPO/z1hV
	wBctFIEhnkM6NpjYYSoEYrMG/HqPnIQ06Odjv71ku8G2rCiStfoccae/ua3JPvm1rvH8Fjxd+mpjA
	yNeQ7sEyKYiGOR4PDZOX/s+xZ4z1G7pQ91N1xNccQfNevgd9H6Kd+bemmlqdD71WmmDJK5lN3IWdK
	gvYQgPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUvX-0000000GNA6-3J4J;
	Sat, 12 Jul 2025 07:45:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUql-0000000GMlf-2czu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2ABEDA5432F;
	Sat, 12 Jul 2025 07:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68302C4CEEF;
	Sat, 12 Jul 2025 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752306045;
	bh=X99T3zLCk1wsD+6/htrl/rppok06x79Qi4swnOe3K4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EXx/CJqomtgwnQpJxpChoXEzdGcCj3/cylxa19BsoEuF0KP+/Czb+5Qtsht5dfxae
	 CfCBnGkU+sEjBuJwqDtweKUohnCss917/CIaza7JWUQ3OFHlXvX8vaTPjiXn+eBYU0
	 2WcoqImW+GvOtb8a5k8TEwlEhQ1kSXqarPhnGgwZOtdCPoHGicfosFiasQmE1w6bGJ
	 7IuM4LeZbRDp37GcVCxW57q1z/0Pl/kVMIakyV71AUstnUZbJSwNYX87eXGsGFibXO
	 u+1ztghFrTCkXwcjHJ+jb4uR1pyzPBel0NZ3C5lRFk5V/FQcOIsKDrBZ1Olu6oWM7p
	 sLY6aEXeVsQow==
Received: by wens.tw (Postfix, from userid 1000)
	id B4E6C5FF71; Sat, 12 Jul 2025 15:40:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 2/5] pmdomain: sunxi: sun20i-ppu: add A523 support
Date: Sat, 12 Jul 2025 15:40:18 +0800
Message-Id: <20250712074021.805953-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712074021.805953-1-wens@kernel.org>
References: <20250712074021.805953-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_004047_727007_2C600882 
X-CRM114-Status: GOOD (  12.10  )
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

From: Chen-Yu Tsai <wens@csie.org>

A523 has a PPU like the one in the Allwinner D1 SoC.

Add a compatible entry and a list of power domain names for it.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pmdomain/sunxi/sun20i-ppu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pmdomain/sunxi/sun20i-ppu.c b/drivers/pmdomain/sunxi/sun20i-ppu.c
index 9f002748d224..b65876a68cc1 100644
--- a/drivers/pmdomain/sunxi/sun20i-ppu.c
+++ b/drivers/pmdomain/sunxi/sun20i-ppu.c
@@ -193,6 +193,19 @@ static const struct sun20i_ppu_desc sun8i_v853_ppu_desc = {
 	.num_domains	= ARRAY_SIZE(sun8i_v853_ppu_pd_names),
 };
 
+static const char *const sun55i_a523_ppu_pd_names[] = {
+	"DSP",
+	"NPU",
+	"AUDIO",
+	"SRAM",
+	"RISCV",
+};
+
+static const struct sun20i_ppu_desc sun55i_a523_ppu_desc = {
+	.names		= sun55i_a523_ppu_pd_names,
+	.num_domains	= ARRAY_SIZE(sun55i_a523_ppu_pd_names),
+};
+
 static const struct of_device_id sun20i_ppu_of_match[] = {
 	{
 		.compatible	= "allwinner,sun20i-d1-ppu",
@@ -202,6 +215,10 @@ static const struct of_device_id sun20i_ppu_of_match[] = {
 		.compatible	= "allwinner,sun8i-v853-ppu",
 		.data		= &sun8i_v853_ppu_desc,
 	},
+	{
+		.compatible	= "allwinner,sun55i-a523-ppu",
+		.data		= &sun55i_a523_ppu_desc,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun20i_ppu_of_match);
-- 
2.39.5


