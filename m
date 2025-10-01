Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CA0CCD180
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=; b=leJeFP3vaXmcfLvv2f3aYAMiro
	C2xoFi81kHL2wiRz0iGknN6GyCJF3gU2P4bLRKKoI5MDyKP/XmU8Iir9eNFvvUPFDQY9eAXCR32m2
	3HXpYF/87fQsGb8MB9nNQSwmL4BtgWYrbLu1TY07ASWE/FOpz1cMLwiIa9mN33XfiGrQf47bFU81P
	vSSXRrVjIBiwYeLdA2qU33e0UMlO6U+HgSXv4BznlGHkxuffzU1nuCfudqWNBTmUIubg6fbrqeI1l
	fNrBcnvkWuDltph4LveoJ43nHMN8yvGXEJxfmFmQfjzt8KcCBPDDS+BkjXkG6ZYBfEob3YLd0pUm8
	6NO6HO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvN-00000008CDZ-4533;
	Wed, 01 Oct 2025 14:35:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvL-00000008CBY-0uSA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:35:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so14209217a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329317; x=1759934117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=;
        b=fulxOW5oRPrJ+oInLixki4D1TqKR4cT0FY4QkfXCNYFBEapqDei7qjCkhzAlvRDQl7
         xQ70CRe9YI6aWXDoJw0xG8VbJVeKQ4DUa2M88moutFc2fXobGNfX4i9zmDmcgmYNU/qR
         kC/MQbsTAot90oIu1Itfbp73QE9Nae7x+JuAcuKIdRk909zrV24bJwc8GdQIHCAIgB1P
         NMxD2j49jICM97THjrCA2WKTBKr734YorBZc+IY+Ipj1sMA6jLe9fGO7yek82YdcRidr
         Nst8Nw7J27zR/V3bzFHWvdUUYkDQ4OSvUjk6jz1vGIMMoUfWMi/M3JJXcjxrA3Cl6+id
         V0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329317; x=1759934117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=;
        b=rpN9Tne1Q/4qGXxI2gHRCLUhxkLlDcHcEhcS/M6sMw3g0Jm0Pty7ctshz62ZA1PniE
         GG8tfDkkTdWcX+ScDRxs1p0nGATCeSjXL+mgWjdAuzWrLPUDImQN/dexVDCmo4w012yU
         NYHtMNKAkRVMcAb0Zc58cG6uyY4PsabhEtn7HghdRQYlrGyCiDH27TbgjmmgFO+tlYK3
         w2Ma8uvqtQvgwC2S9b2peOU/gRBsSI58KosH2eUotdOLSRmVj099np6H2cJJlqejdZYJ
         yni1ObHkL0nBXqVFzTOqmNGc/+6xRx9dW6RouOfAbt2joho+XdtZXVtsvDX8YoHdK2cC
         Te4Q==
X-Gm-Message-State: AOJu0Yyds2rzf3D+zQomI3tBNmmNihUNWvIQzlFqaAXp1emvOTGo7aib
	qPBiescjB/GfBzmZans7vx1DdnEq4p5LwVtFe5DDnWv3AAK2wLeaWj5YGsfjc+eV2lo=
X-Gm-Gg: ASbGncuZnHPfHbv6U3iEEdpxijRibgWjFA6NRnuIe2xaukCviol5MudnhmoqqSh9QPb
	1OjP3H3xgiTbDMebb4wQkS6BgowY4d/0HI5As7qKo3A51FlYjsIPy1jArfPkzYarF1NGOCHN982
	XpHi2vw8dNlHJQ09BJMlJ00WGdNJxzhEf8qv6Z2TTw6abfEvYRIsSWTJ6Hp1O5UhKlRJEC/k7/Z
	/NTmDYZ3Abtxeg80nnJ40k5ywaw7/e35WiUfdwAAhHMQ4teGpmTAWqEgKHMyizkaZQA0ab2wA7R
	mEGz2L5mYjlEjQudWicQANtDB94qRvc94EJio1sbVFmEo8Gk9eVPW6xkp9QVPw0gmFrfYyF7z+P
	lY2Are+QBpH5Sym8U9l+Sm58T36Zk5LWG86JFX5O46yX1
X-Google-Smtp-Source: AGHT+IHK40bR0n1o6ASxI8wGZaOkHpOfafTJRZ22I6XGvERFOv3c+LhRCpasy8hUR+2MejFied1xhw==
X-Received: by 2002:a17:907:d28:b0:b41:c892:2c70 with SMTP id a640c23a62f3a-b46e5460df8mr439394966b.49.1759329317375;
        Wed, 01 Oct 2025 07:35:17 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b478d9e768bsm133692066b.99.2025.10.01.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:35:16 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:34:14 +0200
Subject: [PATCH v3 2/6] arm64: dts: ti: k3-am62a: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-dt-partialio-v6-15-v3-2-7095fe263ece@baylibre.com>
References: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
In-Reply-To: <20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=msp@baylibre.com;
 h=from:subject:message-id; bh=ewnVTjrK+RQoWcZSJk3a3VufQN4Z70DOdAXgMXn6M70=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy71n/+VpZNOnb3UIXInW8vvmzozJ1ect9q6YEfOfNq9
 9WdsXI43VHKwiDGxSArpsjSmRia9l9+57HkRcs2w8xhZQIZwsDFKQAT6bjNyPC39Zb1iYi5Ub82
 R09+0+Z29/K+t5Zqbx227xZfXiwf1a/DyHDwRrHVzhtxe3dum/lOwEjoB//cQGXHBr446733yy/
 ZarACAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073519_287900_6D232683 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Add the system states that are available on TI AM62A SoCs.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
index 4d79b3e9486af18b8813a8980a57937669ff6095..31b2de035f0f748e34b8919f90251aa0551d9b32 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
@@ -46,6 +46,33 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_io_ddr: system-io-ddr {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-deep";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.51.0


