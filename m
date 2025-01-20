Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35736C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KS/16UvSfEHeMPEs5zPlC9256JErSLdmqszpJR3Jvck=; b=U3BvnFqevCRJEVc4dXCluBqiNj
	Uarq1cx4M5+38HJXu556e0V7FtP98yzUXvvEHl5jUlT0tfR3oCXRwSaorRhZujJkb52K5wJsColYJ
	MiII1WXASZkquEYoWcmbQfta3vhqitgTbJtfCnn7H/BWHG/Z63trVQ7gHJOswsIjP8dmnr8hv7ruU
	KGJ9d3e2F633tq/ElS0dqV8TMHNFukisX10yRLRYR2VMw8gFz2paoD2VBlLSITUccJ3Hgm7UKV4il
	4RoW7udRTyAXyRQEaMBfaYw0wHkzd8UicsbsqZua5pdXtFOJ/7cHU0+m3CjkMILdE/DZQcGNAQntR
	yJTgnBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoXX-00000005G6E-2dXL;
	Mon, 20 Jan 2025 09:57:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoMj-00000005EJI-3MfQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:46:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361815b96cso28686675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 01:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737366400; x=1737971200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KS/16UvSfEHeMPEs5zPlC9256JErSLdmqszpJR3Jvck=;
        b=eLz7XmJJaWAc0M1VEVsVGIyQMazKIe1bkEGw+Gnv4llAL2Dq0Q3hV2aAnTtv41Iy+G
         6XnjOdJQJreopwJ8CpE4vw1x/hNm6OJTqD9f2OCuwvqqk/zGVD9TrMRdEWfytddgY0BX
         UDBZz5emqvpfKArAizdnGsXHZ2b3mvOy0qmjgZ78Yuc9pg6Pv3KCAYEmeNbasNvah6s9
         MRzuLWIzn+HhIiK45acsCJERLQ8ZnlUGuTPF6EvciHHUiUX8Gkm/n4Nc1IEGO8Lpozwh
         14Y3DApdlyE9BGyUA8Mx6yC3dNIv4BrCcTHVd7Tnu51hofTYiYzifet0QoQrFqSJ8nje
         SRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737366400; x=1737971200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KS/16UvSfEHeMPEs5zPlC9256JErSLdmqszpJR3Jvck=;
        b=VLpG081noP3bFgsdzDKyFTed418HpYD8kr8HbQi8UlGPZ+8vOsP/DhqYfp2C/nI503
         /PcgMSa+VV166U51LySzbvUemiTeAK8UOZ/z49sd2rim8kXHAE2rHYYb901OIFJI2n6I
         AzEGXpx5h1zPfxDdlsfKslAhXm5ejwouCEj1Nr8Q6e+NtBI4uXIlP/meCpHbdztfEBIU
         y0zx5hFiLA5G+HsvicivfB/5O7I4oq5pziErjPKhgZc+pH886FjR9C/rHwUa7MBEpIqV
         VSHBJF7ueX5Kmcf2lCXOE4bSvhC5SGeyG1bWUSuSi+olAwQw0YGbdzXtuLI8n3eHSTEP
         JbZw==
X-Forwarded-Encrypted: i=1; AJvYcCXRJaOM7ssC26gLPCWtqk5IdDlPQIfYRW8BUI8Y7gZ8Z99TUW9I77jOrZrPq358uAzxuAsPteXBCwMyi7uMJx2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyDom1sFqM0WJTV2uL2lxagJx5oalRJcg11Qh8pdwDWf0TCnNsZ
	r/TmydVFR2e8T13PNJqI89Forf/eHJ3d/fm19rdyb3eS9Di0DpdA
X-Gm-Gg: ASbGncs9zT1xJvpPQzoRh/bFnR9Dc6JA402cQmkuRVbQ7zmRMLDMRdY+DNuMKBJ0vSv
	Xcu1DUPZuCm3eMe1IDHxlLOY2pncu7Jc+bWOd6ovyAzDvWYb7R+SO4b28CtOWunm7BQDXUx3e7V
	w3atKnW9slwYju1QrMyZBQZRubdSqBw6n5CsvwF3n7fk6I3mOa8CzDVCS1djZepxTqLWDaMlNmB
	70Cm4bUHp4FLRGd39FdJeGqXJyhB/ZtKIon+nMKREq8oMPD90e51oi4bqLrIBlBlFkanrM0g48E
	8OtnUFgpzQ==
X-Google-Smtp-Source: AGHT+IE/e8Y0UzEMao6atgZUbcfEv/3tvajzHUJl3OU3gm5cGx1+LX4SFiUZ76g9wAqK/F4I8/8cRw==
X-Received: by 2002:a05:600c:4894:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-43891427762mr99548035e9.20.1737366398007;
        Mon, 20 Jan 2025 01:46:38 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:cc96:d269:5cab:960d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4e38sm191197065e9.21.2025.01.20.01.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:46:37 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	shengjiu.wang@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1] arm64: dts: imx8-apalis: add clock configuration for 44.1 kHz hdmi audio
Date: Mon, 20 Jan 2025 10:45:22 +0100
Message-ID: <20250120094632.13894-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_014641_848224_22C8C31C 
X-CRM114-Status: GOOD (  13.08  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Currently, HDMI audio cannot play sound at a 44.1 kHz sample rate due to
a clock frequency mismatch. This update resolves the issue by allowing
the sai driver to change the clock parent to AUDIO_PLL_1 when the sample
rate is 44.1 kHz. It also ensures that AUDIO_PLL_1 operates at the
correct frequency for this configuration.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
This patch is based on the following discussion:
https://lore.kernel.org/all/20250113094654.12998-1-eichest@gmail.com/
We use the existing mechanisms and just add the missing clock
configuration to our device tree.

 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index a3fc945aea16..dbea1eefdeec 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -790,6 +790,22 @@ &sai1 {
 	status = "okay";
 };
 
+/* Apalis HDMI Audio */
+&sai5 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
+			  <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai5_lpcg 0>;
+	assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
+	assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
+			       <722534400>, <45158400>, <11289600>, <49152000>;
+};
+
 /* TODO: Apalis SATA1 */
 
 /* Apalis SPDIF1 */
-- 
2.45.2


