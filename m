Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C229C5B56C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=; b=MSCcaQQGYdWTuc4t/jfuGp7y9O
	VlQghoyn/ZQ8rna9MWHIOzwgzoGbH00X8QtyTqMbb/nOSOVlEeYnEF5atPQrP0D6/Jgk1bE3UBUNU
	rkgiarBwn5D1U6nFARpCEzPmYvV1ALVPZGI8Edn9kjPFsIdQYLpUESfTofYAod1RVriR3KDHkp4rw
	bxrPZVLNpmPCy/fhtEiJQBQmEX+8evy1CoRAMqJvmutI/N/TLn/9DzxML4IxEPU9a4od0b0ftuCF5
	0Mdu6Vg/WNmSDWOse6P83z1Ju3/vVQWX7KPkpEIo+U+DTARshebD4EPDztn/UBcNYh9SgC4frLfs0
	/nY3ye9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYq-0000000BwNc-0Hp2;
	Mon, 10 Aug 2026 14:01:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQYl-0000000BwKW-1fsm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:01:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so11588285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786370458; x=1786975258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=Br4B0LN4gk0X4Y1jAVBFXi+WuVrYdqzjEdvpOuG30hfim7sX8ZxBGSuhCAyCcOagY9
         Br5cZuETolkAbRsLgVdR+xl6C/Z7AkwyawZoG8yjWQA71ctd8+8MrU/uVFPGPjwwqU6t
         PT3/pkCBJ/Nu+CFYBeA/ZE8aOpcEIJ4qgXqcCvcQlazRvvdAudxw+piqErAqQixhx9YT
         eA2AA4ZBbWot0FW3V64nlKqYEAyWOInPtVyclNCMKavYnGYNlrm6E4za7Ffor/sv+aOg
         a57EAezrj62PhIy9z52TRmtBR6glzUKgPEuhcq4YQ96Kjt6FikL5xOdbqOcUjeov1fcc
         izdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786370458; x=1786975258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSq7OZ0xeIWTiSwoTzu6Q+tT3niFPej9d4P2mwNfxe8=;
        b=QP+dS8B9RAa2XR56ICGZ8+OXMWpqFpcPmvaqVZ5/e+qhKCmm2+kfwODaa0uF1wVyAI
         I/AeAtYBQEBnR7t/m8RGLrkBWVgPS2WEW20frRgLON4cKq/BchFTPzGOrlVzalRHFX4J
         XJSPGXMkC365uK+6d5mEBLbj2RYst73dlLQuUqXCfISxWsIplbfPlgXDPHqAN+iMBBGG
         rgRmX0DJ/llc8VbiZyjBYC+Uxc3d97Siq9JTd/YNq3OTdEnNCSWRgZp2xmwoRJIaBIra
         8BZo2BRYGyomW1N94Xi9v6ynIH9+WkB8EwxJaU9JTFjeTNOY1mgrlyhuOcYgMKQHEoNU
         O2TQ==
X-Forwarded-Encrypted: i=1; AHgh+RrerefC2+Rd/DZOcZZLe+OJDLY9D9vUo2e0jBNcLuXl5vdsCS1y2ivbFeVWuUpyBUa9c0H328ZF9MiuZCTw+CR9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu210QeCV5Clwbw1aWrsM/Tei0VfKsyY7L/HK5fIBR5amSfaXh
	Ra9rBsg9D4xyWQedDduRuk38uIFv6JHsLWUl0bjyZE3JnsmAnNhuyLeq
X-Gm-Gg: AR+sD13Qc1nPrmgP6NLFizCMzZWA59dWdaws8XEemkyO+V2TQHfZluAUK8A6nFVDaro
	wtD52f+i6RfHjdD5n8GbUvwVdYpomq/YHpU3v6Mgr8gM/p+1jhr/+UCl2opM5Ho4dC1+dfAiRpQ
	aZQO6atueI9aBvy2XNhJ6SmJ1dTQv9wncCrpKXugpdbYaVHMRnfyNiAAzsoBIA774+thl1Y7uQk
	6qDqoLMovdePurU0Xel+ahHCtIEq5oqUWRT25K0iU/2Sv8hM7iqC7bUL6SuzbibJX1PNXw40xK2
	kyASbPVvo6yOioeVImknuNE6/n9cuscH6oypJjP8QyB7a9YVgO7B3n0u7LRoZ6EOFzdoaSku2wP
	0gaMrNQkS36jVTnGYlePVDxS39R2RQ6kLFk1AEnE9RIFfIJJdeW6yPowyYMvLRc4tA0VJexffMC
	T+UAQGf7Jxnbh10Idf88I5OHRSNAPZpnpczjwPwpzcPFUbZeXmSAY4nfLkkr+0wnvNtE4=
X-Received: by 2002:a05:600c:620e:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-4994e70a6f5mr708499675e9.2.1786370457505;
        Mon, 10 Aug 2026 07:00:57 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm291661565e9.4.2026.08.10.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:00:56 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: vf-colibri: name the SODIMM gpio lines
Date: Mon, 10 Aug 2026 16:00:52 +0200
Message-ID: <20260810140053.2793495-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810140053.2793495-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070059_467237_C6CD88E2 
X-CRM114-Status: GOOD (  11.96  )
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
index 74afc7b..04b5d53 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,120 @@
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
@@ -177,6 +291,36 @@
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


