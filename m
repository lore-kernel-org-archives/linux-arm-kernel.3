Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38802CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEpNdkvG3qeZqCTI9NkgE9+3r/xOTGW4/MLX3MDeIt4=; b=djS5Dw3Zmf2bHYZuN+beKYLC0v
	fob3y0XK1gJBN4rx6UY0/qfyLR1b6vbmt3Oe66M5gSnq+QJ0tiZ3C2zjwdezHizx3VQQ9Gdm+73mX
	Cazo2wuIfyAEA1YAeejKc7xWJNiaM/SbEY8o5P64vqug6nj2usGmizcO+6UKcHvx8tUUbV6vUge2E
	6vjK9QU4SpP2kOShuIJ/lZFWkakixsSfRRvA1AeRkcpl6PRB414GMEJC3m9o3frtzt56lvBBzXLvs
	FgdrXGsXOiFj8UB736mqXjtJ7nPXmTh/bLRUZG1ZCxcGlXGtQPua+5XJQw9luO3IiaWiybgOHWYLX
	4uKZeCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGb-0000000F0Qq-0CZK;
	Wed, 03 Jun 2026 12:00:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGX-0000000F0LG-2Inz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4908b92904fso73058035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488008; x=1781092808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEpNdkvG3qeZqCTI9NkgE9+3r/xOTGW4/MLX3MDeIt4=;
        b=Jt+r8gCel6jyqqToHtyGjbU4OiSr9rcRPSOkRZa/tr3B9dVJV1hDvZyenqEE1jnwWP
         YZP0zcXuhlQzu3/Gf5unYANi7aWGhPsm3K1deWAGRvhGHVtrZdq5dK7klqSG8i+KqN+U
         VsIRo+o0bvh2HC+im4xQI3sTCto6NgiuO8f9Grr0l/8xY8v3vKqTRGff4KrWy4+r7Iv7
         lW83bgiJm3cnqb4Of8d1FWpZCZv8CM+K33XXke1RqTN7I6ek4hgvJ/0X4lR92jHf3okU
         zazmZJC/QUF3gA4DGvsnuKDZZxYpEGfH0Oa+2gjABxpIwqGSYlbrheBto5PUzR/Qrgll
         jYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488008; x=1781092808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEpNdkvG3qeZqCTI9NkgE9+3r/xOTGW4/MLX3MDeIt4=;
        b=Tbk0jIjriFvj5rszOmcSHyI3GJ+RUhw1lbQkV7f+9qOqFmuZ7nUXD2mNbvSZ12UTW6
         CRszzHzePSLwdXJ5TPexFPraXCWXhoQDBDdpEe0+4tqO5kNOx2C8QfaGh5nJqjhYnuIz
         EdEtIndwC0XJ2DXxS3GXLxQBhm/+m1hlxn0J4f/22Iq7Q271Vh2PZEkz6EBQvXiR6DUF
         8fLimkv2pOC+7D9aisBOM8xN4wM6zm62fR4Uwanx78Ps3EgKl7tdunnKiepKTABVTTm/
         vr/RCY0sBfvZqNALLw27Iv78Y+dX+cx0Fgp0lYoh5o67+ttrZ89GS5GdwpqU6tpzimxG
         dFUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HGg/eZtAwYrnGYw6JQDwFF1veIbzCzS/ROH9bDES/9R+dvd72q8WzuYtHVqOLAeGH4gWR4y8Zz4fK68d9GHbZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwnfuQcfEfE2zsrGU720htmHCUx6fX2zCVFpXTrLEaE7u6duYml
	CYIxIimOehmjLsnVEA7+1dzmpcyYy4z9BtPncynhHJFsuSDzZY+JmFI9
X-Gm-Gg: Acq92OERe1J/79LldwWpH5WNVGMted0rfmjbyU8cKyvtFYMIBBQpaxWPQuhA8hT6evW
	IJEus68ntkd2m+3Ynqiqb8qB3o0UgsdwX57dmBdLoJ9lVDYQOID0+9Hq8M2Dtl9tIm1zddd4SaZ
	DAw39bs+NDqLOTwhTETqRVgA2grNXChTyMiBqeOb/xm4cvD0pWpAQgDn0C2gSYdQCmqhDDYwBzr
	7SOTT4Tl07FGhYWa+O85Sov8L9EfuERJGVodmq0zcEuy1Oio9EnRec1c11xuuISNmbc6qFX+Wqh
	W2sxNRAlTnrd9bjF8N9p4rPMCaxDNL6vxizv3UdzXZB/6ecSMj/lL/7yG5A+AVvaaJtln6/1ARb
	EWicN3UKGgbMsHqGFOPvW6di1M7Fh431U23r4YtktvscsMBy/FS4z5GqgkaOsPrFZRd/AJOOZ3R
	2QikO4ll9fDnr4tIs/cfpIVQqBQFvXxOJnPBj6oZNz6CTej+gP4BkZMKseqtROyxMi8Yt4Kv6PK
	TrB6t6MFxy29UC/R+m/5tGKPK+cO1ZztqxPEXjWe4yyJpeH
X-Received: by 2002:a05:600c:3e05:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490b6101131mr53564315e9.28.1780488007482;
        Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:07 -0700 (PDT)
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
Subject: [PATCH v1 07/12] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 13:55:45 +0200
Message-ID: <35c4e4182d90db29f447d0ea96794d7230a75fac.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050009_602766_07DFDC7B 
X-CRM114-Status: GOOD (  11.40  )
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

Enable HDMI output on Symphony iMX8MP Carrier Board along with audio
support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index fe1699649414..6878b89c4db8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,41 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
-- 
2.47.3


