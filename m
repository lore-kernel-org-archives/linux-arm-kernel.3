Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FC6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/d2kV+gEVUtasqwptmg8OTaBsbS+gUd48Di1IsK5O4=; b=mzZsFZuOIcIw0ak1mRuSF9+qXP
	XlNtrMg73iCqJVjep2yy1khd1MK5iSAUs2rotqQFM3JXZMmtn8jstR8OhVVYBS0ecF7kg2hiIdw4O
	jkd7tZ9/omjpwgq5tOthXoszL3Q3xup7m9grI4FaPa3+3JhhEnrC582Lfz/BCE2z1WshZM6bI//d1
	ssn1b/G6ETYKKg1fLtJjb0//Ck21lxhLbtZyqQsq3bwbMn3QTrR9zOa7v6TYwmkXYlr/Ebi4RHlxE
	I8gwH3jMohD0b/k1ThtCi90I9b1SYKp1nNlNdpW76QrhoOX6pAdf3v+sdKykMUuz2h+6GZzIXr4Q6
	/OtgS/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mWQ-00000003uG3-3JQk;
	Mon, 21 Apr 2025 08:28:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJG-00000003sB9-1Lxc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac29fd22163so569527766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223321; x=1745828121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/d2kV+gEVUtasqwptmg8OTaBsbS+gUd48Di1IsK5O4=;
        b=jFyG7xN7EuiktLOwLy6raeatO61pwi5lEyjjUXux1LP1LogR84vU9CiBqI3oKsEQrb
         shFWDDF1W97Vt2kUFHFIQq41IdKajaadPVdckjlXwNV/KUK9hRhC9Qumq9TqFDeo4cqs
         phAhkfLPkhmC340aDMDVQyA+Co5ged67WNKM9k1JCvqDpN2YRFE9VTnV4FNNJ7H6elJJ
         HRPqisl75MxQsHyAnpsjDCIzG6SsAmf2qlRzUX8ot3392VH8eNB73QKsHyyQTWACQ4fu
         2pBEWT02KKt3kyNOp3igSlZTsqzm9R/TlMlXvTnexuO1x0TLJYxsO6bYaoWa2uFe6feP
         Usag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223321; x=1745828121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/d2kV+gEVUtasqwptmg8OTaBsbS+gUd48Di1IsK5O4=;
        b=nZ91+Dv/2BFosU7RritTJq555eowYNthNiTGE6Kg5JDPdRbOQIn8HqypaOuae+GIAk
         1qvSGwUWhrQD8Jmg6/1IwjYZaJOu9XIyhlMnqUpWcWVPm+3x1orOS3iheeue9tAyjuIY
         criEKac01jRNmdciw6XxwMONnOxlX0YMyUikOnfoXGhIvyDyKT8wq9HNIwj/25irK0F2
         MUJzWaPfhlt6olB6/N6Kb3K6+BZyMd1cntlynH/6NEgYjvKaAsn8lKWOn3T0tW0mEv+E
         zyHYMK07wvizq2gcidx88yqD/DuHpvbHMXMQiTDYEk5tKc6VYnsqP7fwuXipIMJyMN1H
         gAAg==
X-Gm-Message-State: AOJu0YwU10cA4q9+NGcjVVvsDoruk8tlFcEgqWRoRpWkG9vXnCsxZXh6
	F5XI/mcOleipy5wTYSjVg0tlkJkBjtN3PWzU0TLY/dyJ8y6As8BpftP/Yoc1GzM=
X-Gm-Gg: ASbGncsdQC18b0Z+V8eyqrIjNeQ8Qxr0P1zvJP07y15zOBRO0UijVb9NF4SavGeoLV/
	waW3m+QvMsdxGU7CfKafp7E4mjEgSiuiHd4MZujpvJ61z5ficuJzQk5f3hh+jdj6zw7Pp0eRCn9
	9zyJlagChEsba0Is5v4oIWgjl3OPQOihYDe7lrma90qhZQCCP30otlBVFtJj14YEvTn2fDY5I1r
	4WbxFQrn8fUbzBLar2BCOMx456dEh2h1hOaSMXP7F5EGCZA8PhnUx7WmtkGYhvSGwnwujivlDcT
	O7SWsqGaOxqth27kOypH9vBjuPIflFEf2ywY1u9y7o6zwQ==
X-Google-Smtp-Source: AGHT+IH8dCmUUiIYwe6aBK5gZa6nt1qsDCGB6UIqEQKGd3SsYK3y8ADeVEtN0scYBIBP9If0pfXvNw==
X-Received: by 2002:a17:907:7247:b0:acb:1908:6873 with SMTP id a640c23a62f3a-acb74d65b95mr1067470266b.48.1745223320580;
        Mon, 21 Apr 2025 01:15:20 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ec502bcsm482604866b.66.2025.04.21.01.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:20 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:20 +0200
Subject: [PATCH 2/7] arm64: dts: ti: k3-am62: Define possible system states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-2-6ced30aafddb@baylibre.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=msp@baylibre.com;
 h=from:subject:message-id; bh=i2du4lVmWLuvWRHG2K/1O3Jp+NBJz3qmMwCQlIhmr/o=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf4W3NinxJ3hYPDvnfu9vz8oY3gccaxbM3H+3/N+7s
 i/aIpvlOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAinn6MDFvY/hkm3Cr68rTg
 7qM5hWZxf+aWTr/PKfZr2urecJVru/kYGVbv/qxS4Vk4h38S80nWHbNV52sx252bP2OX37wiiQm
 b33ECAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011522_381569_960E484A 
X-CRM114-Status: UNSURE (   9.49  )
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

Add the system states that are available on am62 SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index bfb55ca113239be4367a1cf8edf219187fafa8a0..acc8cbc7e57bc5712ada8b4b225e302ffc368e26 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -46,6 +46,28 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "Partial-IO";
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
 		bootph-all;
 		compatible = "simple-bus";

-- 
2.49.0


