Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97947CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=; b=1GXIzMZyoSHSBBGYgKdmpuEDNN
	drgJbBZClvfMUg3Wi6qfT+Aip5TIocHzmWuR1StJeahe7s8tAA8uhDjXWteb+Wj7HPDuMLY1HejTy
	msxasj5u5N7gsIPhn4YI7M3JqssQL9GWS8ChABcWnMtrSDI5Zs8ZUuFG87i4G5dLs2ixeOS33Y8Gw
	rVkIyzjfjnmuKYV4UiWsEamvr2c4qzxPYCfEy59RiFdu7NBNsK31opAjP0UJKUkM3NBzbzBk999al
	Ax8kTl6Dmtp393EcHdRK1CchgB3NkFH2GBXbbjqv4oXTg0IdAaRLshR7V5iIMJohAqRwhPIa5xfuT
	FrpM0dnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtrA-00000009poS-28vc;
	Mon, 03 Nov 2025 12:40:20 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr6-00000009pkz-37u0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:40:17 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b70406feed3so947345566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173615; x=1762778415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=;
        b=eBu1AT4VipLBB+KcUJV/LNKdJOaXIPEoNt1arIpSkXIDAHIIlJzU56Ku1HNi7cEb5h
         iKTuDPi+PGBS/cnsTqEKg6Rv6XWLtRKx1cMGKYfxCwKdajmTnBIWAwK0rmijNrNF82YY
         AbTiMs8IRl49+RfbBJ2QsIq1mfVx41CbBXoSL5gwNcCX/TgaJ0zzfzeBflawXN4FVYZe
         CttmjJ0V9JOh6T/+CLeoWSAfxQxqST26wiTIsI3sIZDCYBc/4/CA4AxWsTg/3HuXi1Vx
         aaIpU0sYTCCjoigIQJX8b2aldQWSerjRCVxHicIxTKmoffLTlnPNMP0c5MeZMNcDfOOm
         vv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173615; x=1762778415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=;
        b=BbgTIueBxGxA+l24vQGkU2svHiS+ZX3DfRj0v5+MZAzba58dSih7JqeXHAaceX3q2Z
         ov0Tw9tvFwq+rw97gfRtVB6dV1ya/rFTQc3W/EmNxflQzMZIQwZ2+ivdzp+4XAhmmkyJ
         SF624HJzpsGj5wtfvHcLHCrgX1ENoaDz+WJ1CyAJu6zW9p9fZa10EUUwEyKSsluXwGsQ
         g9xRDq81biWEersGAQanhYNaNMc/T0Lyg3BFqgPPiEqZeA0yeoQYRHLSSmO0RVN0H8UI
         cS0zNShGxTQ+sHwmwyJ5HKrxWThgopdIT4f3s9YWvCToaNF36U4FPeDdhYO4WHT0hIpg
         3YMQ==
X-Gm-Message-State: AOJu0YxyyhZZ/F7AZEqf712quwelC4XcYH9iWZnx+8w4+CcLle5KfPep
	dONeTpfIDntvE6Iq8Gb8EFJYCfCZSW5xxw+TRRjlOnYAv/ejvw+3+QfdzK7NNQs+un8=
X-Gm-Gg: ASbGncux9Ibv0GiL7ImMdJKIvyXt/2w/eHZzBxj5nNxo4h+BFOm8Pp8gy4R19Gm0xKz
	1OctGlA+M33in2CW0w3wlb804B1eqQER15CbxRTkvCbDss+YXbETi9alPC7cK+JaSIp4u7a9fL2
	3yL7XhM0KX9G3UvB2db85TyoS/kp4fW3BH0S86D01Vm3bQPrIIOap+P77ouCOU5Ae8sTylFUU2F
	PmTbtcv+taVV9c8J+U9Mehp5yEhG9bgCree8r2aj5O+NjuYh8cCpcq0FtihcpgaZj1PyufYkgpt
	ctf1vZsmmRvHMOzSN1jYUG2OTu/EMNjGj2yGnz1sONam4BLaVScNBYB5Kj3wgeIGb88RSW6pXJP
	IW8u2NuGwVp5NDchINwHH1frtOUGgzyU54IB6mGm3z+3Rikpeq+QpOo6CAzwnwOl+DumeSY0=
X-Google-Smtp-Source: AGHT+IFtVVqljuKCW5f4r6Ri/wyAAiuSHubsIp0V9cF0MgqTvnQQpbVTM4xuWKtVwgdiUdE8atDHyQ==
X-Received: by 2002:a17:907:9484:b0:b40:da21:bf38 with SMTP id a640c23a62f3a-b70704b654cmr1222307566b.36.1762173614941;
        Mon, 03 Nov 2025 04:40:14 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6409ad0d7fcsm6763392a12.37.2025.11.03.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:40:14 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:39:30 +0100
Subject: [PATCH v5 3/6] arm64: dts: ti: k3-am62p: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-dt-partialio-v6-15-v5-3-b8d9ff5f2742@baylibre.com>
References: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
In-Reply-To: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
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
 h=from:subject:message-id; bh=6hGcnBOkrSMQIKieC/McV84XZyXymXT7FDaWvZWNWbs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyORVO4zlYb+XjuFNbb80/xB5vjh8z7fb2SysedJPd9r
 +Va+JS5o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbifIiRYVkAL4ton6lHQkOp
 oNsa8dIOnRAu/5D2CT6CruxODC7LGRkmv4sUdeM/JFNwb/Ixj7SuDumLy3y/7lN7VnWE8R733BA
 mAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044016_793160_545974B5 
X-CRM114-Status: UNSURE (   9.21  )
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

Add the system states that are available on TI AM62P SoCs.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 75a15c368c11b068430362fe0b8d2d9ecc052588..c69e16f16c835489f2bc5cba158235ab955347e3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -44,6 +44,33 @@ pmu: pmu {
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


