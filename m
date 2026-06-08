Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EDDCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwOWIM8NwelCmbDJNk3NQU3DHsRthmcQGbQekObLd90=; b=VPEB4XcoK2NeGrNi1VG/EwHJsi
	1+QGH7P/VEd5w0n9u//SWJYnTV8RvtIUYGlPNXfYLzD3ZRB9uYNzkezoWLPEbvCytNy7E5np0kR/H
	rBlH8Bsu/ifT6OeT7jL2ads0YqYJGjizKZex0oA4PuRVo8OXJc9/FY+VOfW6InmevMf/z/QHnNMhv
	y1hnaJ7TEjfix8hxWCs4p0SwdpFgUPPs4NQ9AD75NJT7JJxKrvUQE4YB2CFx5jFQ9JtwA5W3Q4BFH
	RBOsxgzanXWwTuJcKMCOYOL6HUHRwKKf4LzwgoIlCD2w1CRwat/SqsqxNl1J+kxRg+11q0fJzp9yH
	gUOq7huw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvZ-00000003Hmg-0czg;
	Mon, 08 Jun 2026 10:09:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvU-00000003Hdr-3d7I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45fd45e596cso1933805f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913387; x=1781518187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwOWIM8NwelCmbDJNk3NQU3DHsRthmcQGbQekObLd90=;
        b=pvCl3iHGNd7s5aFGMhyES4CXM5J6USFpaO0hEHQI7lbIy+xyXaJHOoFZNVlTc+t9ct
         1XBCWu7iHuq2UB8J5EBaDuSg1mhvgq9l0vKQDMl/peOlMx5IN3YBrlSB57Qwcz6KshlS
         Osg73uyeHM8M6QsEvIhIKVupM6+0D6ea2U3cfpbt4NdjLLWgtfA9FFnYJZrsdE7EfFRD
         oJ/hOHOFuNOIgqJ+pEun08MerXDWWg97DiH90zk6DFMwWwgO7BlHXQc18H98J2erwI2G
         alCV7c9lAbkdbViALmXUO9gs9By+Yn794udAQLupL9LN80yw2X3lb1WUtEr3iVzPyEti
         XXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913387; x=1781518187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwOWIM8NwelCmbDJNk3NQU3DHsRthmcQGbQekObLd90=;
        b=bkcbXCrVxNqnpT/06M6lzW8AP4CNG9MSewjE6u8355E010Vn+b9UcpLsKs/P38ZNHT
         +yWwbFtrSvxTVvwMuk/N5C4bIi1qENa8eFW1sfpwfwPUFc6/Rhu7HC2we5qtyn7vxhVc
         F1pbz+SYX38XuAXwhHDF+F1/irxeUJlaErblDICWCVAZcHbt9eOdUQL+lqFnkqf3Leio
         Y77l6V7afmrniL4Xxnumv42p39wqCLcFRHhY8gg2KzbncwfL9bAKe3viH52+IGXIpEYO
         seiJQxI2VGefK0d+g4GSj5GZfBdDmi/Tp89ln0gRMKjaNZIpZc9jsnZebRAPrBcB7uF6
         8fPg==
X-Forwarded-Encrypted: i=1; AFNElJ9j92igpbytOE37fZnJV633ScqJggp6+BZTo1liImdGdpCsa5xrq6MoO2gkApLU3c/dRXPRmX/sFBHpl9cSZm1i@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9GcznNrmniVse0Up2yblWyoaiYA+PNkjIY8Tn1AyjBa++LzuS
	0oe/SQnNkYcrQgj4hEY4pBVZF/vnO4kWGmOW4M9zS3YMmQXjqSxAqq2P
X-Gm-Gg: Acq92OGKiWm9AFFi+cPWM2ilVefomobi8r56W56lexWKbykuBUKheb/kj94liU8NcJF
	Sd+GIYsmd2shJ4zA/ZO35ieickOqqKMziOX982IMfhw+RN3n2v5j4T2/U+PMMQ1rJ/6gSA7tLiX
	I/Az/LSt6vHyYtbfIh/O+hrYwciVG+zlEkUw4BulAHEbjshbEUj++pCbGxkpVBKVtIRto4B3Ds/
	xhtP5JWEsFYA8UPKJTiUXHGnR3DqAj19Bl4xqbpGbm0U0WXTBJS5g8e+5+5HE8w5YmxrvGOp/pE
	YhII4AzCGk15bv4CNHaXApiitkLPoTrChTmeMTC6v4eD7CKctWex/MneEZoxxuQuORRAslkLBNo
	xKvR8IL+FRMFZFcKf92d83h8CBS0ZF2PGznZJYzZajpsN48oJH0A9P7UGNQH7RLKyr585usNQaT
	/EFq4CTJ+tZApZaFawEYWHszfsqI7ZyuYaJ6mOx4cFOO8ekDm4ovD/WrGW9Ae9+Rmt+9nK5UYOP
	SJf/rkXbIXYG6T36xQP8Ak7WVG3B77EPTKvalGCXi075b9VPG29dpBik/8=
X-Received: by 2002:a5d:49cb:0:b0:45e:fa7b:a7d2 with SMTP id ffacd0b85a97d-460304eb5dfmr16501423f8f.7.1780913387160;
        Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:46 -0700 (PDT)
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
Subject: [PATCH v4 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Mon,  8 Jun 2026 12:09:27 +0200
Message-ID: <3875138d135b3aba6e39b585426cd4f641a92013.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030948_944485_D065BCF4 
X-CRM114-Status: GOOD (  10.80  )
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index bac3de6e1530..c7073fcb679e 100644
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


