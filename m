Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D7CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=; b=XRrfEot2xM604HvY47aLGJOV4B
	duliyrq+V2ipD66zxGVbQhnsNWfr0B7TDSNQ94KAJdBFtz8iQc0ce5gRfP6o78y3CHh4nb2YR1B+q
	wXMiY7Weap5TBM7Qp3DyGdbhRGgZgFnrmCYXXvqwJRowWvJ1QmIvpKs8MHZUD2titt9qvK2izNY7p
	gw0/Ch0+5fSloq6vbJiinj0+ixF9ekPIY406Q3+fpxXU2LzT90Pvurqk5GQ2Ig+w5Vmn5hmcHPoJB
	1DMvJV6WJibfHFgrbY1WgpWoB7C2Lt4HzpdEKOngKB0Sp9hRgoCEg5eACXUFD69Dj1+C9F5ISfzJy
	TBZSiPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1O-000000017aJ-2XoJ;
	Thu, 13 Aug 2026 16:11:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1L-000000017Xj-0Qq9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:11:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2281f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637465; x=1787242265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=KJXxfXtsUc69vdxEjO8bTqUDW1lf7DbXDiVQl6nWIgvPPf1oU2W5/KeZiLZu7h65Qh
         SE+Q1y/deAkfLHDAGYZrHg591RLY+iJTDNnT8ixQ0VmByTOlvXgBXOnS+/RID3i5xvcF
         3HfVxIuMOn/c2gWpFgTPaAS8QlczasyC5ePcDctpc7cnE/Bb+M/t6IoBCwJUyhNEx0K8
         LhUL3JDcgk1ZsNZmr3n+3QbH1OQBkJrfwIyDc5lu/pOHKEfeDf58SiHPTR3wvw/DVIEG
         vIyYMapMtlPvM0JcVAbOgQupfM1qWQYMfi/1HSYOlwvFtih47z9BxIyf0iro0JpQS672
         Ee/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637465; x=1787242265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=XQOAyPQ10FMpQVRDefKW9CzKzC3r5r5Ve2lacjpcGK5ugNeH/dVxQ+Sgxg7CZF5yG8
         37OVJAL4YsTlWL14C/ofZCQfPir/njtlDO2rwXF482tdMyVerN9Xf8phw/NxXxmK6KNL
         B1GlP58/tuK921g7Lkxc4+V36/MOczq/YJWV1+ae0r8yUXQn3UbgROnYa1iPVeoVoz5R
         4SmMzFvNK9Tym0obqaJJUj1iYNcDyylZiucbe+MRCpLrYknBdvGzkRLjkp77C8aKMzZd
         aT3H0appvtKNd78jGO25T9M8K1+B7WcNtbVYv6f/7uiZI9tcM1cxukXvKrpZ5lcGTpxo
         hZ6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Y7SPc719Qoc2cWq3EZHWlqzJQTQlffdxNULUeMMDRBOqnGaEPWQ+JF2UTgTdJA0CeRnhn+H7nk2YPcgwg6F7@lists.infradead.org
X-Gm-Message-State: AOJu0YwLTmqrd+opHYzVmoRumCVpq+Jk+Bs8Klvw534VOtgam8Sh3RYm
	+PcwI8fz9AFy8kCd0Bno+WpGOQmLSOZCSlm8+tpx/lawC+SizLSgGMkR
X-Gm-Gg: AR+sD10w0Y/cIYGcIJMUueV4x1TFVR7GaEYo7cimffzZF5bCIhndO/iVxBiTv3szn1t
	F/kfRpkBvsn+SbmdaWETDgDvdE4CSz62EVmj7WodpeFmHvbgIKP16udwW2Jg4oU74qFgS+yDb5Y
	zhTgoldtN2fShJ+aStVQ0MU/wW7tOP/4/5fU7dmyyNutPKOGAbBPtCIf+5DLGgRUvpaaeWZDPXy
	1fesUz5eBEr28Xet+t2YEMDsW95NEsAoE0c2fw2xnjvsXzBEEodD47hy9hRt7RjSba/23B4BEjN
	LtPZBF7vPyKhDlKRaYpxL09TYoeyEu9cPXgBp+xUhVc0HQQIx4gypIKECijgwyair82QmccMuFN
	IPHggWw9SOZrYkivR94tk/7l1K2hDoklhwH7mq2imPuBqUVChfnLH2zU0Ioc53YKY7sHiONed3v
	7OxgXEfTD7Srg5W+9DexCi4T31P8cCW1EP3i4yhwBc+8kMyUTzB4XA28G46jAujNQ9Bw==
X-Received: by 2002:a05:6000:41d5:b0:481:568d:f118 with SMTP id ffacd0b85a97d-4815a02d66dmr11430093f8f.30.1786637465222;
        Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:04 -0700 (PDT)
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
Subject: [PATCH v4 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Thu, 13 Aug 2026 18:10:59 +0200
Message-ID: <20260813161101.2274327-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_091107_187127_CBD6E26F 
X-CRM114-Status: GOOD (  11.13  )
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
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 74afc7b0d74b..a9269857df2c 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,44 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio0 {
+	gpio-line-names = "", "", "SODIMM_89", "",
+			  "", "SODIMM_102", "SODIMM_18", "SODIMM_134",
+			  "SODIMM_16", "SODIMM_14", "SODIMM_23", "",
+			  "", "", "SODIMM_47", "SODIMM_190",
+			  "SODIMM_192", "SODIMM_49", "SODIMM_51", "SODIMM_53",
+			  "SODIMM_37", "SODIMM_29", "", "SODIMM_30",
+			  "SODIMM_20", "SODIMM_24", "SODIMM_21", "SODIMM_19",
+			  "SODIMM_94", "SODIMM_81", "SODIMM_28";
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_35", "SODIMM_33", "SODIMM_27", "SODIMM_25",
+			  "SODIMM_196", "SODIMM_194", "SODIMM_63", "SODIMM_55",
+			  "SODIMM_65", "SODIMM_45", "SODIMM_43", "SODIMM_73",
+			  "SODIMM_77", "SODIMM_71", "SODIMM_98", "SODIMM_101",
+			  "SODIMM_103", "SODIMM_79", "SODIMM_97", "",
+			  "", "SODIMM_85", "", "",
+			  "", "", "", "",
+			  "", "", "", "SODIMM_106";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_105", "", "SODIMM_93", "",
+			  "", "", "", "SODIMM_95",
+			  "SODIMM_22", "SODIMM_68", "SODIMM_82", "SODIMM_56",
+			  "SODIMM_131", "SODIMM_44", "SODIMM_144", "SODIMM_146",
+			  "SODIMM_52", "SODIMM_54", "SODIMM_66", "SODIMM_64",
+			  "SODIMM_57", "SODIMM_61", "SODIMM_140", "SODIMM_142",
+			  "SODIMM_80", "SODIMM_46", "SODIMM_62", "SODIMM_48",
+			  "SODIMM_74", "SODIMM_50", "SODIMM_136", "SODIMM_138";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_76", "SODIMM_70", "SODIMM_60", "SODIMM_58",
+			  "SODIMM_78", "SODIMM_72", "SODIMM_96";
+};
+
 &gpio2 {
 	/*
 	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
@@ -177,6 +215,15 @@ &gpio2 {
 	 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio_ext>;
+
+	gpio-line-names = "SODIMM_69", "SODIMM_99", "SODIMM_104", "SODIMM_107",
+			  "SODIMM_127", "SODIMM_184", "SODIMM_186", "",
+			  "", "", "", "",
+			  "", "", "", "SODIMM_38",
+			  "SODIMM_36", "SODIMM_34", "SODIMM_32", "SODIMM_129",
+			  "SODIMM_86", "SODIMM_90", "SODIMM_92", "SODIMM_88",
+			  "SODIMM_133", "SODIMM_135", "SODIMM_188", "SODIMM_75",
+			  "SODIMM_100";
 };
 
 &iomuxc {
-- 
2.54.0


