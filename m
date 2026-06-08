Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006AFCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWTK0vPDX9/u7hsXS3gp6N0x4YihiQ+Mlh3rTBzALqQ=; b=vuyicc/iw+E2GrYl+xZuDBzGzP
	QNDyTdvYduAwRvxgwoJglvJhonMjOfosGEhhJ+ThA6D5SGK/Qnc5hg6oyO15PKIaREgODHQbGn+Md
	WVJm4NZwF0T7eXCrswOSVMjoYRMmTdzpfdqiuSOU6gWOMP/bgL4BxV7e26Ot2kHTaAXj8EQ/4+ozY
	qhDOz8wl5sAAdTNJ8jct8P6law943+BCLX+amKmZU9///V3dNWEqQnQs1Q6fCGhWKu2ckl+2sFclY
	A1SOdW3LC7gPodBBW23O3n9yHZVVdw7+Q4jHBUdhFxOEZxj8ymdXSboFIdd2G2VK7hLuLkZl4v6N+
	nRkL3HwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAf-00000003oPt-1HWL;
	Mon, 08 Jun 2026 14:41:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAU-00000003oAe-2MDl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4908b92904fso50901165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929693; x=1781534493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWTK0vPDX9/u7hsXS3gp6N0x4YihiQ+Mlh3rTBzALqQ=;
        b=QrSER4Ml5vYzw9+t3kFXobq6asB9iUteXp0xzGoG4JNqEbfn6CE+wz0/edOPNUFmTG
         H8FdGyrhEWcE+ZZYO3KRZhcPRRY/p+dEeRdMkR6hOyM9IR4jfmj6tUfmk0U80FcFVX+v
         kSG6j/jJvtXxX1LXTDMAQ2ikDY76a6IWcjcGUzusatm5SeGacD3nRB6UX7DnzMJWQ3aj
         iweHOcU/f7qDrMz08ix0yRrpnKLdFAXVOacHyaqim3JF41rJS1plD/oEWs6zp0p3LFZs
         ffP0lFmcl97BVVwRQorJS2jrK7I0wYFqLaQ3mAzkLlmBp6wxg/4GUDJkagUyl59cQJzr
         q7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929693; x=1781534493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pWTK0vPDX9/u7hsXS3gp6N0x4YihiQ+Mlh3rTBzALqQ=;
        b=LEVXFJPYqPs7grn/diXT0PoBGckG0HLxy0nFz0dVf0D/ohBWI2+kbuGm9V1E5PU6Q7
         Lavfm52T0rh5PWmHYjsYsv6uhb7uUu/YCd4EAYEga9pH/8rDv0QZk0W+JD98AewuvLbQ
         GxEHTybEzZkzu4+E+aUqEZrM8+Iq5ChZjbudLEHBrl2ER+9AYQDQJ8sWxDu47O3EJb9u
         A8YRSDhTP4Wkdnos80Z2hJ68VbnVHB3LZiwUlXsjMIHRXFYO866i8qLX4GrOYTo0uEb9
         yx3fgbefH0i4uvLS3pWlG/8VdMOG9p20fbWy6JGwpN/53UQ9CYV4MyTezix3EsgLOsq1
         KfYw==
X-Forwarded-Encrypted: i=1; AFNElJ+XjDmKYb8BzApfeCEGZF4aAhxxD4XYlLewVRAkqyM435wSomMawGEAZ1NnbynDzq3gy6CetgL+f2bUyvIFArhs@lists.infradead.org
X-Gm-Message-State: AOJu0YxfW/c2ni5sGMatdLvtDvFjWx2zq8AXnoNHB3szfHpjk+TXWJ76
	WOOEnkUCnKsbQ3v9cW2/wj8W9uZ14+qxAgX55+7eB0YOu/gHolw7J0wc
X-Gm-Gg: Acq92OG8tzJ+7cUxW+xEtmPGlWrS449ch96G8yEGludVmLBZGDmIkRZ47VebeeV0RMD
	tktp/NDN1HXJYlISfu1Cux5FTZsoKi+7pWtV1viUYymMLb0EiXB9AzbZWIui6hem9imxYoCTHVD
	Up+T0cSi1EokVd2kvLh2Nh4Ny5zHBaPAfKoAvl8TzDDBzChUlovZTauFvUrnUEC2aJ3MMVD4K+E
	QKsUu/jixks678DUJ0ORr9LyXOSEf/ejPtoZbYj11APPeYpoWzV3uhnWB0l0L/+ErGhpGhIsaP2
	spgBhhxYJ1QuOnjYC1fYGCbYS/bZEkvGAWs80rVBfxBvG+s/oeALQKlPrN8QG0jNq2Yzkw5EyMP
	6twjU6Plbi3zPVr7ksPhPBpYkBSv37TNsaDzmKEEptHsPvenGeJf6mW+RlLBi8R6RU810xfJZA9
	M2D1M9ERUZC0aV3g7TiP9eXwYbvPWUt0nShOhdNpqyId43qrA7YN0WVmbUQypqb/ifRMUTtCw+i
	w7qBazeXJWIcItqVFzmpdVuWsrqc2fEhg3pjIsPnrK8aje1
X-Received: by 2002:a05:600d:6444:20b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490c26e1acbmr190687155e9.12.1780929692574;
        Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Mon,  8 Jun 2026 16:41:10 +0200
Message-ID: <77a60c287ec6df2915806f80024b3d13a7905198.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074134_625979_4E6C0440 
X-CRM114-Status: GOOD (  10.62  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f8a4b5b2e9fb..387bbe3454c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -327,6 +334,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3


