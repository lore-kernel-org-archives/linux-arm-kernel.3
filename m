Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31628C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=; b=fnxiGeU2UH5rG/khVJY4ivr9f2
	NTEQCvGfuL8A/06cp3wc6/brO5QZfoIa8EutlfCXa9qRqkIZiA6Fk1CYW+eL26f6HZOszE2v9QN/Z
	iFgI508JDyu5XNrYyOkVhvJLbLfMPAg8054HoqpyivaLYaymPlzTBI9xVKI0j93WCXB51ijeN446E
	xqAdlW1XGrEc21QONWJK41qD8RrIcVxC18xmdIKLkG/h33t3xksKEzgejQJ6mgZyK1e0Pg8O1Q9XX
	CnO2Vz4gWwzX0jyKvoQLZHPpx5gGnfV7v0pByzxaD0a2673WwUJTsy3cioOZEPbCaCMp90ifs0bsF
	4mXEMpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumdC-00000002Cm1-3tB5;
	Fri, 14 Aug 2026 07:47:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumd8-00000002CjA-2yen
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:47:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49987fb18c0so2042705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693625; x=1787298425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=K1lbpwRDDLbZ29GYbJrrCoQdANKpDdgd0gmCy7tKPidz3eH2cvEL0eIJFWG0AhPIHQ
         hXfEi0X6ll0OQdFxHtr4BESV8s70DoJMDwDEwdfmZ6/AvAQmN44VsyCwu3ouI9pUgiYT
         kQ3hbOqoKZpbG3vwNaCxGjmwc7aRMhSeaguJEyAKANwMJ2naBz1VC5zrqyZVsMsf8hqh
         16tXspi4l7D5Vw3iwxxYuZuPWTcGYPLFcjAAEPaCghI4XbeJRTzKTs3iYa+zaVzuZGHP
         r/pW7NiUUlHeR9ayOrPyss1KX5LzLkA1EthS5Ed/vGioFuEpzBxsA9CjmwSt4vfcvQEY
         dhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693625; x=1787298425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYhCVw+NpWfIZb24NzCd/Bpfh96NwI4s0HyFWrf+QtM=;
        b=VzNrlEa4RN1ic5YbajmKSrSugl67n1Ov40beiH9gbWJQrgj4Zy4ys1SE5UmYRSSMV1
         tgZ8/7TSyYH89aHkmv1n53nM5v8RIaEVTsi04AsI5jtxcKvKgX6N3Z0XSD5rzNGvUQF+
         EANzPNs1BjkRtO/rO+Shn/KTvWaJwEwudDJazJrUxLPmzNMZUQMStrBY1IKXh1ho4qBu
         ZaQJYU5m8uQVFi5UBN/sbmmY3hKj1rrdrLR1fTLyyDWZx7D3zhZKuR88Yesf2Mkz8wlW
         f4qL2W9K6/KjB+oUPfNijZCC+OvPoUPAi877NjhmMZbRJdWdK4tAtUGKDgkat+btq1zg
         cFrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr08jXIXPnsvHy+KdHmUAJ807za2w4BVaLpy08PAFPcX672AlKm9dhtIEJOM3DhZ6lCA/ZG+P0ztBHJqtg6rYl5@lists.infradead.org
X-Gm-Message-State: AOJu0YyEd5888PWBNJ4jzR9yn2F3B3frNzW2ujNFxqhLZNgErYsG82er
	G8KQ2Sfs4jvSEW2bj1ipEgZQyjTYDNwE8WQAhF7JYA/Az7u3tVIEykwV
X-Gm-Gg: AR+sD13aei0Su41k4q9bxVkMsqCEbZTcr7ylnmMjz1Ch9vcX4SIrXSlOxJD9rk+0XPm
	9liqjOps6O41Y0AKJAEdu8TFBQtyANslWaTvWR0Zu4UGL+r5x7fXFewECF4q/nRSetxLJriMFuJ
	M4kA43unAv6LyiYGRzVbtRzEK63fN6WaP+ttfdCQgDDihtIgBLAhrppljBejM34YBlHRJe2HNsO
	eR/vazjZKewm/374vDEp3q10NTeIhyOIfmG1timilJtBjFtLqgBWHgXbRFtzZHl1HWuH69V+vti
	U4/HXBHmilWYOf3phJQzOhd9ZtXgUEnaehWYswf2vp0H+ts4KeZGrPFFTKPTcDAEidwAe9jupEP
	AuC3aPVf8hTWbLhW0nsuPqUqRnrCqdCvZpTVRDEpGCqfxjGYb5dyzqCw3ZX5EXhiFwV4auurNAM
	gbd19GiQpLPJ+Fsi+RlakF2GT9TVUjCjc2BmyKAU/58DawuO4xMwJDYqsOSFOv29kpcg==
X-Received: by 2002:a05:600c:468e:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-49987944202mr40781705e9.1.1786693624449;
        Fri, 14 Aug 2026 00:47:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
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
Subject: [PATCH v5 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Fri, 14 Aug 2026 09:46:58 +0200
Message-ID: <20260814074700.2491256-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_004706_768880_E3FC65F6 
X-CRM114-Status: GOOD (  10.91  )
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


