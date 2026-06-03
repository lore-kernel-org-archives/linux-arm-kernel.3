Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE13CD6E6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRj4oVY66h5BGZjSvCJPxniyCWvCDKuiAB40WEEr1xc=; b=N/ftpP2Bc2IrKz/T1G2IKzIQ0u
	YV7Xr5Np1uylOowOhYKtN2btCDVhW0RvoXA0J2HyfKNqXsg6yrxvkmftOhuN4t1qRdOQZXAVruuU/
	NXcrqptVT3AoEunNK5pRV0IF9Kp9GEbahCtMjRRwcC9KAgkCpZyyCJ8Z6kVCdNNgARfFEYmEEUfbS
	kWz9//uFUeDfyi7iopVhGpP21bpv7RAgzOYKhzUmjGaakhz+gmUv7E5SXRgqMDbl7GvTwtN0rSr4V
	Y9Lv/WSSjdGgrX9XasqY77A/yVdHcMSAZ6LBnm2MdCs+Pv/pikG55YcRUAZxZtsQbKD4mEya2xXGJ
	sqF287nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGh-0000000F0ZM-0CkQ;
	Wed, 03 Jun 2026 12:00:19 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGb-0000000F0QA-420x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2936071f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488012; x=1781092812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRj4oVY66h5BGZjSvCJPxniyCWvCDKuiAB40WEEr1xc=;
        b=e5WtR8i/iWLNI8NYu+pIlxyI9ZMOaHgHvkFQl9aMgTztTqiohvmY0p+NzMu/MNgSha
         GENb6l5Qy+UC9qyxB7XQhynwkeUBd4ARHd9fzAdrETVoY5GL6NfDCRyA8+9fB0Zvx6D6
         xp7SwniEWRKzpbnyxUZjHNvkftquOPKsIufAkupBRPWLxlT7rbB7MsxQbiu5nBV67lW7
         x0Np9vFbZ2v+X1iMULEtx1+PsumKqP8rQrvu2yCe/suSPiGWMSOKRoMvYCpZkHXD0T5l
         7lwWDBMhxFkzFfoNvViDR5UPrvZ8mgjo71b5DMXyhlwJuUEWA7ho0V9iUQ94vAqTtefl
         sCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488012; x=1781092812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRj4oVY66h5BGZjSvCJPxniyCWvCDKuiAB40WEEr1xc=;
        b=b5A7V+Rwjq4SBsEdMyIlbevPRadnZ+Kq78yBFsfxA2solMroL98kZwFx3omCKbliaW
         2GIHST9ru1lhQBkkhgnD4zG6/x97DT0kYUkbmARAeN/2nZwdmDwkudX7pzmKjSnHHOrs
         w6M63cfnvqLa+8wuj6SHPDE9AmJp14QKhFwXmTm4fVJA5xy8ICseXYmR/YV9/fW7fBLw
         sG/Bdy/gdtAudtMyB9Cyq1OCuMxMir+9aplgBjyFwTz4Kt+OzeU/oaRPF41qgvg74Ahf
         ZVHgBc7D7WwY0lg8Rf0kMUPiFiUlkwku3ZRIQL0aZ+7phno0KGeLJpkWZ65VynbcuMDv
         rYmw==
X-Forwarded-Encrypted: i=1; AFNElJ+6QFbCglgb2RELH+qyPucVRUPNaJ1kfxzoJ6VZHwZciCa0ctzCvoLsXC0TZYWrDJB0+o/S7WcOdVKiGYM5X0B0@lists.infradead.org
X-Gm-Message-State: AOJu0YwJQyGD6b9hw5T8NMlprJnxfh6shLHdwRMW0a+KpJ1Twfzox8DZ
	o38kk4M1yDn91VBOn3ZsHTcNN88ol83fGlbf45rhFnEr2EN7U7MH9OJL
X-Gm-Gg: Acq92OHyW+D9rudB2f1X4y4JmvMcbBXIJXkmK5DQG4J92ZY/My0iIErpmGk0rcjAP0s
	U29pzuoonVHjFXYi5jnXn/CXrAC1yp9K9SYtptql7MMFLwj7cygl8sr39kVn7INUSSIS/b/AjGO
	TApP0/KAQldslo7K2fLWj7ZiH6Yai6OnU3WFyeOHimP9jRcXSZZx95Q500s2a5UQNZ4DOaAqqyL
	0E8OLMu7rdHxZQOQ3FrYnDCiVmv9gsJmtewKV9Co0VNmDbjuw4EpINim4U8rhWz1MbKpXrH1R5a
	Y3685d3UCPwk3UMGbNI3lAK1y/7sFsKK1dymDtY/zKU+rB8P9NqHiQq+BBdx5wdSetA+UKgW1pb
	xxK4BLK84Mix00qoBnF3fQM80FLlyu82HU8Jr3xFP2pM9n8MC9JQgVM6zptw/sP3MsXfF3iRuFG
	NIG1//PYoWZBtE28w34g4c/z9QLeIQsAnpj4RVAPNHbfbBll29ZXRStzvpLz5oKQMCYUCDJm4yr
	q0wqRczD8A+y86yZEY1m1doJ4YU1hxOVcgRAc7wIkw63u/J
X-Received: by 2002:a5d:42d1:0:b0:45d:b14b:2409 with SMTP id ffacd0b85a97d-46021783ce1mr3641063f8f.2.1780488011988;
        Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:11 -0700 (PDT)
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
Subject: [PATCH v1 11/12] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 13:55:49 +0200
Message-ID: <f5c19fe05ced09f638953cba857c3694f494a72a.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050014_014747_5182A11F 
X-CRM114-Status: GOOD (  10.79  )
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

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index d796c32f50cc..06baa19d79c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -241,6 +241,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -385,6 +391,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3


