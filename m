Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88F6D49C71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYbUGVE7c7id+MiIunPPyopC/JujGSCKOd5+ZEtgyBw=; b=rrnNOytUfJs7ygF+Hv4TjXOhVD
	4wT2KQ1yY7AokHqQ5tAeqRRRvBO7wOLPcGtUk/oLPvaanoHDi+dTHG3aOMKYXopxcn17BCR01vIPE
	6M5lUcjUiXbuX28qlifkp4QDYlKfvHRB3mb1u4AGU7oQ/izZ+14fdtTs0peagy9+yNTMvjwezaZid
	ROPf3WG36dnr1f6n7i1L93eVPJxGfweUeLKAs2DFCP+27HtGSOZRSFpNehseKaZPZTDoozz2deZhy
	DB6WBbIRRNczF1LOP7HhrUtfHjx/17wRXULrMYKR25yS3S++wFC9RgergqX2pSWYFGhWkb8eETNsu
	Lst8/APA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljkI-00000001Cfo-1g3E;
	Fri, 30 Jan 2026 08:20:50 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljk2-00000001CUO-0uy6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-81f39438187so1023822b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761233; x=1770366033; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYbUGVE7c7id+MiIunPPyopC/JujGSCKOd5+ZEtgyBw=;
        b=WBWZjbxo+YRkO7aSKgKetk8DNYhmWPaCPldB5ybOa+UEIfHyCMKJPdyNvnPd/Or/EK
         LznwTyLi/nRXaWqyMSQ+fOHucRVdmdVHsvm2HwOW1CS+GNpTUedhQHgIsenvayzUIPDA
         mguRJkUOOYtI2CIVmPCMR/t5gTtGCGAxfgOYlARK3mAV7eLt6D2NJwdedcbtMprwSYD1
         QN3EpbFI4U3NYvRQ1jophNfa+qFZ4AQbsqP/vXcByZBqzEzA6BsBZ7Fg+ECK1s/NYHLM
         uqngYtBMi9cEGyW8zrbs0XFCxX01PbXvULA58qgY7O3n28/qXiP5OQtKWQh9gOy6x83u
         iP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761233; x=1770366033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYbUGVE7c7id+MiIunPPyopC/JujGSCKOd5+ZEtgyBw=;
        b=G7C++MFfbD6GEhhJfLjERWmO/qWVYxKxSmWATX5cQCvEtukDlwtBO8gErolvk+EwNc
         JVGLQRjbviDHjCRt3QPkAiiIAlE1MpNZIGWllQ+KY/MKq8nCzmrRyrUE7BUwv9M7Zd84
         Ze2sxZfZfbK5H2wzOY6Taf9ScWZQ3WqY2CuA6hVYEYY+Z/g2tAa1Dc3wU5GTX6QjOCsp
         iypk6L2DGKC9ZnybkV+8OsPr+BaPQwyO3c307HCtNzopf7MucgY7gK+l7HkcJ9oK/Gak
         XLXcQVEUNRSO9qOIo3lehWXI+Zsc3+Mrtxvn/TJatYVnRCJ2JKI/5OBV5bGx4nIajGn3
         NTXA==
X-Forwarded-Encrypted: i=1; AJvYcCUHNjqo74iDib8sf32qMn73LW/Y2K7VIIz3x+BKBRVh9dXVLXHNg7ewmQHvFmxHImwcKS8KN1VTlCBjkSgqCJ6B@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3CdLSwGtt9eVyEb6rdQ/nNps26LjDQUWPahLvncOvLQuO3bNs
	gsa8emVPQOJu+r3qNRm7AubhXTOS0lN+NokDfXSo5ND0lqOtFAIM8Rm6
X-Gm-Gg: AZuq6aLdlD4beaLf6uPgP6bd6y9jmfmzTb13UKi8x3plmvfydDh9aUnu5QeTqjNWHeC
	FAZ58pT1WzVJltpe3Jsw8e49oItE/ANgBEBqQzS8CPUnI2a6xoldFqHdaSNumxxm1HF3/6HOisQ
	FHLs4sJ11ALbWJlHrlRsrSqKmdiHgExx5gjGmIoRk2zwEA8OkLJSW+L3Kyf+6jc8uXO5Docd7XX
	yiMxJnxDwfEe3IamMy8JEgaMT1kh0VcXRk5U87rzMwJixGRcg7PN/0lkR9mKJ222G3XNfvx6UYn
	ik705hHrnLyumkRrqiTKkE0AxkJ6XKCkkuueEfF15V03ijgKd+EQmZ75uXdDfJzxqE2hKVnykjX
	J1G4DKO2dJ+iFVVSgryy6h+6uWcF7CQoAl4Wc45dvlX9s1J4OvwWwIxva/c3bp+SUlB2h5Mo4JJ
	mHhz28tzNKE/9MOGm0LEaTXnZ7GZLUBj2csQiK9JYp5gtqjI+D5D4qoF3YIXayjbcfV7unJQcPT
	G//C8MUU8aUb766aHFOQp1mMAsr5JfbXr7IO+p26P5KTih7k0zzEahC7pxOBJqMGT1IHrB4k4oe
	mmykOAb3eMUt
X-Received: by 2002:a05:6a00:b47:b0:81c:446d:6bd0 with SMTP id d2e1a72fcca58-823ab670e70mr2255776b3a.23.1769761233312;
        Fri, 30 Jan 2026 00:20:33 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:33 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:14 +0800
Subject: [PATCH v4 6/7] ARM: dts: aspeed: yosemite5: Add PDB IO expander
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-6-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
In-Reply-To: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=1824;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=NTGKevMUAPMV9E4g5zl0RMUalv3BlRNqGivNE3JH5S0=;
 b=EKe0E7xkKfIl93ATKKmxvOzRrcqGGBGFkA7Oq65hguM7RoXuXfiS4HXbDRBXhjCRF+7YLemSg
 uyF0pu4T5YwA9uz4uT6b+JFmyHCfLYHWs+2IlAaz+l2+H7EOwjbtrtb
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002034_280118_24A82BE6 
X-CRM114-Status: GOOD (  13.16  )
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

The new hardware design adds an IO expander on the PDB to support
fan presence detection and HSC fault monitoring. So Add the PDB
IO expander device node to the DTS.

The IO expander interrupt is connected to SGPIO92, which was
previously named ALERT_PADDLE2_SMB_N and not used by the system.
This pin is now repurposed and renamed to FM_IOE_ALT_N to reflect
its function as the PDB IO expander interrupt.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts    | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 524597a81365ef10cd03b67d35eeb88a965cbe0a..48f864b52d1a22b12f8a39ba9703a90349ed930d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -389,6 +389,25 @@ adc@1d {
 		ti,mode = /bits/ 8 <1>;
 	};
 
+	/* PDB IOEXP */
+	gpio-expander@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <92 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"FM_P52V_AUX_FLT_N", "FM_P12V_AUX_PWRGD",
+			"FM_SLOTX_HSC_FAULT_N_FF", "",
+			"","",
+			"","",
+			"PRSNT_FAN0","PRSNT_FAN1",
+			"PRSNT_FAN2","PRSNT_FAN3",
+			"","",
+			"","";
+	};
+
 	power-sensor@40 {
 		compatible = "ti,ina238";
 		reg = <0x40>;
@@ -937,7 +956,7 @@ &sgpiom0 {
 	"ALERT_OC_PADDLE2_N","",
 	"ALERT_OC_PWR2_N","",
 	"ALERT_OC_PWR11_N","",
-	"ALERT_PADDLE2_SMB_N","",
+	"FM_IOE_ALT_N","",
 	"ALERT_PWR14_SB2_LEAK_DETECT_N","",
 	/*bit48-bit55*/
 	"ALERT_PWR14_SB3_LEAK_DETECT_N","",

-- 
2.52.0


