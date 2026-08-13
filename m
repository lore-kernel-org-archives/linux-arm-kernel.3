Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D070C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLxuxkEWmtkrUuXmIVaZI8Xooy+ldmx3AqQ9q/E6uec=; b=qAVKAfZNxNsWwCZJvNFKSUsSf4
	TLTIptUYSf0qEsya2jHe4QQOd24bDoIsnPCjf7pFrNXmA/QeWsT/yPgt+Dg0VY226HoDCvmyE5IBF
	BR5m1zUbw4Z6WU0i5tRFo/sw27tjWgtDqCSUfpWGd7XiTqkPeXsAMQGEk/UjmswqT1PBPziCkjNyO
	GS+0id3EElrwQss+h16Q0zRrXQYI/Fqvd/jK5pBVpsZXH+uDqrcbz4hchPW7AeUZIFrXnVnlcfADk
	7Gnh9uySCE/uDzRbhMCs+sl6xjrHveOay4NWS8mzSkE68X7rm3L5+ArKdvpNfYlU/PxteWkKX68QY
	h73TEqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4S-00000000o3D-1sqA;
	Thu, 13 Aug 2026 14:06:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW4L-00000000nzZ-3tMy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:06:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47fe377a217so1355426f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629964; x=1787234764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLxuxkEWmtkrUuXmIVaZI8Xooy+ldmx3AqQ9q/E6uec=;
        b=PTxg7F//I5aRGWTWhLxakUfJpshx1irEnngFo+wdvYj7aR8Js59YcmHEfTKO5afbsq
         9/kuL02B3bQ7AtyLLPpDODLSVZHZlZGfNG64B+3XlLvoLEEhjJLh+Lh1ohNZ8ZqEtyu5
         9NVlJSroepudqHsGoJN0ZM15gaahKEInxBfQHG0dJnhIxtSzRu54j6d/04hlkwmcqOPI
         5eYR2Kzr1J0mZaeK2s5xMkBhx29fy5c+aATheCuz8FipCZI91n5JFnj099raWOm3RrNn
         U6dr7PPIOvrNOR1FqefWKhL08OSu74opDAvDhXq5gKhnMEItVm+BMeYQjsnRoo6e2Iz+
         f/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629964; x=1787234764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLxuxkEWmtkrUuXmIVaZI8Xooy+ldmx3AqQ9q/E6uec=;
        b=phqqqdUH9Ystaw+YcGIXlNw3UaGU9PcNg/rZNocHiX2xb9e1Hz292iwnk5FbkQCBbE
         H7aQskR1+vFvPCBKVf5Inon+GDm8J3Q4djoA+fDa4ThD+8f+ltSMFyTbSjJ59qzHc1BV
         M17MiCLZduAY+hAjpqbLQ3jneyaNj/ennz2EM8+mlqplTWo+ahkCdiu0DAd/TYqGQ2P6
         Tryxw1+8rwOKHd9gNvCNHW1fbrKWQpbLfMaTOoDZMGnrf7ka4C5voOVWw1DRzcgwJKAx
         FT/FTBy6komX0xVgnYxpvU4VZVEL7sKkZ8igkreoppg0c4j87mmgu5Pp/QjtHbPaSlwg
         C68w==
X-Forwarded-Encrypted: i=1; AHgh+RpPOz/56jLoNF1OuNFTlg9WKlKPrfIQb/0ydO6SubMv7nbWXGXW84DiNAqbfcD9jCMUQVgn18DAGn4w1BS4D/Sm@lists.infradead.org
X-Gm-Message-State: AOJu0YyKE2idmPV3blvOhQbSrxlPb3CvJB6G4zGFkeP4bhnC/FkGSi3O
	evi7t30h0rh+qw45Eej8ise0BBtXxSn2R5WlDXeBLOWIwKcq3/lG8UiJ
X-Gm-Gg: AR+sD12+Fo/pGv5z/DvwmFHc4c4zJ1OsE8zjn2T6OlGUSv5pKfm6ZG6K5oB3PzWEaig
	8QorO9cz/Cd3YgK/F1adId7WjBMM0xjamsMDU5UqIirXwuHZ2lPoXQFJ8aPpfoJ85eB/sOEEIY2
	VTTM0j9f/r0LwWyX83jvLfma9MQsXAO6apcEz3I5WX78z5Oduk+MGLVixleAWexvSihv7H75k3L
	MWOEa4gLJm2w/oRQa+IpyVk05fRESKvcJDuOVVG+apk96v6REa0evCsoUQde59VwbI0V3wYjWsT
	dabxGP8y1gVe5F1Hm9TFumqde8L41VCZPwYnHjue/sDtvtnViz7cpY1xv6Ek2zIJCf1a+7rRLlZ
	2OJyvW9Y56aP4Fpfk3nV/HHyyZlOkhzUJq9Vd+9GEFyItu7QsXqJ879vsrbd5hTX4ynVbmGK0Pr
	JPDdH0ekbBxR8bXtId22QDSdHkU26oBv+AuNKIzEVbY9Lw6mDha+IMVesaqN3q1fvwPYwFZln2m
	rkj
X-Received: by 2002:a05:6000:46c9:b0:47f:e877:641b with SMTP id ffacd0b85a97d-48159cc7ec8mr5524380f8f.11.1786629963875;
        Thu, 13 Aug 2026 07:06:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Thu, 13 Aug 2026 16:05:58 +0200
Message-ID: <20260813140600.1824949-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_070606_004758_DC4C1114 
X-CRM114-Status: GOOD (  11.37  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Colibri modules expose most of their GPIOs on numbered SODIMM pins,
and the i.MX ones already carry those numbers as gpio-line-names, so the
gpiod tools print SODIMM_43 rather than a bank and an offset. Do the same
for the Vybrid modules.

The 99 names come from the pinout table of the Colibri VFxx datasheet
(Toradex 101355). Verified on a Colibri VF50, where gpioinfo now names
every pin the datasheet lists.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 144 +++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 74afc7b0d74b..04b5d532b2c5 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,120 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio0 {
+	gpio-line-names = "",
+			  "",
+			  "SODIMM_89",
+			  "",
+			  "",
+			  "SODIMM_102",
+			  "SODIMM_18",
+			  "SODIMM_134",
+			  "SODIMM_16",
+			  "SODIMM_14",
+			  "SODIMM_23",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_47",
+			  "SODIMM_190",
+			  "SODIMM_192",
+			  "SODIMM_49",
+			  "SODIMM_51",
+			  "SODIMM_53",
+			  "SODIMM_37",
+			  "SODIMM_29",
+			  "",
+			  "SODIMM_30",
+			  "SODIMM_20",
+			  "SODIMM_24",
+			  "SODIMM_21",
+			  "SODIMM_19",
+			  "SODIMM_94",
+			  "SODIMM_81",
+			  "SODIMM_28";
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_35",
+			  "SODIMM_33",
+			  "SODIMM_27",
+			  "SODIMM_25",
+			  "SODIMM_196",
+			  "SODIMM_194",
+			  "SODIMM_63",
+			  "SODIMM_55",
+			  "SODIMM_65",
+			  "SODIMM_45",
+			  "SODIMM_43",
+			  "SODIMM_73",
+			  "SODIMM_77",
+			  "SODIMM_71",
+			  "SODIMM_98",
+			  "SODIMM_101",
+			  "SODIMM_103",
+			  "SODIMM_79",
+			  "SODIMM_97",
+			  "",
+			  "",
+			  "SODIMM_85",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_106";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_105",
+			  "",
+			  "SODIMM_93",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_95",
+			  "SODIMM_22",
+			  "SODIMM_68",
+			  "SODIMM_82",
+			  "SODIMM_56",
+			  "SODIMM_131",
+			  "SODIMM_44",
+			  "SODIMM_144",
+			  "SODIMM_146",
+			  "SODIMM_52",
+			  "SODIMM_54",
+			  "SODIMM_66",
+			  "SODIMM_64",
+			  "SODIMM_57",
+			  "SODIMM_61",
+			  "SODIMM_140",
+			  "SODIMM_142",
+			  "SODIMM_80",
+			  "SODIMM_46",
+			  "SODIMM_62",
+			  "SODIMM_48",
+			  "SODIMM_74",
+			  "SODIMM_50",
+			  "SODIMM_136",
+			  "SODIMM_138";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_76",
+			  "SODIMM_70",
+			  "SODIMM_60",
+			  "SODIMM_58",
+			  "SODIMM_78",
+			  "SODIMM_72",
+			  "SODIMM_96";
+};
+
 &gpio2 {
 	/*
 	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
@@ -177,6 +291,36 @@ &gpio2 {
 	 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_ext>;
+
+	gpio-line-names = "SODIMM_69",
+			  "SODIMM_99",
+			  "SODIMM_104",
+			  "SODIMM_107",
+			  "SODIMM_127",
+			  "SODIMM_184",
+			  "SODIMM_186",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_38",
+			  "SODIMM_36",
+			  "SODIMM_34",
+			  "SODIMM_32",
+			  "SODIMM_129",
+			  "SODIMM_86",
+			  "SODIMM_90",
+			  "SODIMM_92",
+			  "SODIMM_88",
+			  "SODIMM_133",
+			  "SODIMM_135",
+			  "SODIMM_188",
+			  "SODIMM_75",
+			  "SODIMM_100";
 };
 
 &iomuxc {
-- 
2.54.0


