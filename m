Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B84C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYtwui9Erh4I2K3zHdu+q0zTdYm3AFiykAHnPwI2sAM=; b=BcOv0kZV9IjmXA3a/SCPF4H3Kz
	F2MQ/X75Vieyient00K1cNAegJZH4JKIPaqibuoH3R8WLfeUxEPr01SJlBqjsrDZGuAr+LqpXRKIo
	QYYvRM8m4XtPyQcMpPg4if2GwYYv8m9XeK6Btf1sfTP1Z7oYh3ceIWmiqoy1IPYztHt/ehfntmjnC
	v61SA5LsS/CoHiC8ehVY1J8pr7zjiTMMINel7x7YVkMymvqm5/ZKknEL4xWlq7AQ4Ij1krMm1cqbO
	98087cYUvmAGAyGwSXR7C4gQ5GQjeHVzrQ+V3T1ttTtrtRorr0su7zMJesUi3YnjtUcSxgSEdWria
	uqtNddXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9d6-0000000Aozo-2xtz;
	Thu, 06 Mar 2025 11:43:08 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9D0-0000000Akf2-1qds
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:11 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so894992a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259769; x=1741864569; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYtwui9Erh4I2K3zHdu+q0zTdYm3AFiykAHnPwI2sAM=;
        b=xohiJAfFxfD44196Yo2oTP15DRN30FIhCAcjsE927OA+BQyVfoMIvamFjAKCpbAWLu
         cZvlLLqiyXqOWVmH4QQtGzdyHDDdWRR6vxPUuOL05i5P94QTfyRjbgP+YYoltoCP2dR7
         ak4OnUv7eKdd6jUqktkx5/eVljNr/ALOHtmWsKYRgwa96HVpQzND1FGM4C3e2fZA48R9
         Lc+NvFxWeUAnTh3/FMM8yjwl5xFvKJSLafjPvuiuPoJ8q37m4aMdd+Yi7L8gsS30Enx0
         hVQkXKx0uhOr0tUonXgYnsvkBlaZft3v3RaIdESiLZcBqd5xVLeAEBjMrZmbubACNgLl
         f5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259769; x=1741864569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYtwui9Erh4I2K3zHdu+q0zTdYm3AFiykAHnPwI2sAM=;
        b=h6KzlT9n3CZeonlqecrq58jcYt8/evB9YY6nijiTkmX4nLNVEaiq5cJrCMFmHOPebO
         51NspjmcTQHwzH4osusd6dbHDLqJtClsE2g0LL2nFuOlANs2qfJGydvGqOxaPSVUu/y/
         yfkjrP/Wq+HHQvNH+FeADe0gXaFk6mUiea+4woBIO8PFLuyLWmqdrjBznOgJncuB3scO
         m1WYwO5nqEfDRsoBj+Bfu08qIO0/PlAIyfAyi9JpQymfHPggnjZxdgh9wAUXFMdOTXre
         4XZ3N6oOwUVCpyVTCXJrRHgM+cdeIysWwPEsOTTfnmWIa2Mo04yNDpuygpFsGnS/76Xv
         /+pg==
X-Gm-Message-State: AOJu0YxBeHNIonF5jAbWZ39SwZfYWcAElvOMZBOB3mIjvMYG3EbbseV7
	txkcpMpJBDXJcCUvHkzpLw2QUSAUn4G+Pu6mvPwrHyJzXEUa5KwSO3igQ9QmpQvAB3N0qb7J9t0
	A
X-Gm-Gg: ASbGnctoNkVrWZr0ocO84jJGSLC8WYy5V5ypVjM6IQf4qTXLNh7m3C17iRfE3G+HPcW
	F7mBGFgeep/9ag4tLTzSJoz8UFYoqIZbCBuohfiNzomjdtz27oHSWIXB+OB3PhhFhBMoIeJlc9Q
	970VqANK496sMehZxab2u+3p93nx1Ua+gYFe2+I5PeSe+K/TTJUkql7YooYKUdU+IG64f38oyZm
	j5yRmDTGqYKDQmt//hPfPZd6Y1+/EPUgSos+4dUqxAcpsDhHFcW7rDV0y8fY5c5ipkN5Rk31Lic
	v8BTSnNmvaDzqcfZP2dYqBUP6GJ7NaLgOgC8lf2FzA==
X-Google-Smtp-Source: AGHT+IHLvSc6bXLemWdNMPjb7kOiDfMReioYbM1WlDggWAhYIkoRPKliPoiO8nRDtf8Q913t8YyBCA==
X-Received: by 2002:a05:6402:1e94:b0:5dc:7823:e7e4 with SMTP id 4fb4d7f45d1cf-5e59f3c6c25mr6989946a12.12.1741259768527;
        Thu, 06 Mar 2025 03:16:08 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e5c74a8f3bsm807671a12.44.2025.03.06.03.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:08 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:48 +0100
Subject: [PATCH v5 10/13] arm64: dts: ti: k3-am62p: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-10-f9323d3744a2@baylibre.com>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Kendall Willis <k-willis@ti.com>, 
 linux-can@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=msp@baylibre.com;
 h=from:subject:message-id; bh=d8JktRpsnXtExrDEQg8XETgLfj06OhFCRQiosuwspHg=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNl+Put9e/HPlKiWxlxzN29cIXz7lLa+W8/shT3pn5
 6Mn+fr3O0pZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJMH1k+O++VLSJ6dE2ltNu
 Zfm7Q3O447bICs7mazreEfUlz7LCiJGRYery4qOcrx5+iyvd1CasrftjFcfXA4v9kw/XPz/XdOG
 6NzMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031610_480057_509E6EA9 
X-CRM114-Status: UNSURE (   9.27  )
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

Add the system states that are available on am62p SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 75a15c368c11b068430362fe0b8d2d9ecc052588..64cd070f196fdd2999ddc7bfee3ac9a03f1366b4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -44,6 +44,33 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "Partial-IO";
+		};
+
+		system_io_ddr: system-io-ddr {
+			compatible = "system-idle-state";
+			idle-state-name = "IO+DDR";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "DeepSleep";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "MCU Only";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "Standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.47.2


