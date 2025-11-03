Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB279CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=; b=t6oBWeCCovGryyZrDhvi1pY2pW
	z5xnTOQDfsw5M5Q/DixW37Xc2f2eGhrK8Y1XZgTHHT2WQqOWhjEsUxPB9g6+AnQ4Cg5m1fp9n63Xt
	yHW3+CgCEOn+PgfJQ0cFT5PqcHzQ2P53DTO/SlliYW270KoKWGUPuM2saAjFIT+kTrUnl0RmL43Pa
	JI1fk3dSjMAGKEf5VKj7J97iqx/oj9Ha1WuuGBlDtD7iVwcHSkYX1UYxbirLBKQGMPdeOYBStF0aZ
	4Dg/WIMtQ5bi9PWAJK3LHxHkB+8yzvY0AicPOLSZO8lA+FpVlmDpRpSWZzd3LESoReDy9VNHUzE0P
	d5QqOQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr8-00000009pmZ-0tsH;
	Mon, 03 Nov 2025 12:40:18 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFtr5-00000009pko-329d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:40:16 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so2630529a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173614; x=1762778414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=;
        b=QM1xh+brkcciHX3HgWOJG3E7+GGWLYPKk2hDQexiURS1u3Dvu5TME7y3MPxB68VGtf
         ExQamhsHbTfh6l0QhGQi3TMgJkjlbH0MiFTsEgZG7kB89JpBpbIGRTX4hFI4PZFH6Sns
         ULubSTK7KYmQdVBSJj4ftTomLNOVm1DJ7+7cEICeATFqcyYXa7TdWwhlPy1TZlfohhx6
         A9/Jux3x9/anD4QyGbyw+XDrNUDhzPdnzA2V1WEVpTGASwzINyelgictommC0gN3Ynnp
         BzST8s64NHDZppJ17lXWNmhqQ1eIbeMQncv9TnKM1xHiIogqg0sXk6g++ctOYiRb4UYa
         57NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173614; x=1762778414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA4oUZwX0z4qIkAync1NbIUw+gj3BAYqhFw1et34T6w=;
        b=opCT0U8ySWxkfr8s1oc4l8QENgHvfqNXrCW5D/KsEaqQd5x5IVYkEH4CroyTXZRntr
         8VBFOZrvobmYw0Cj14pXrQo3D9NCXDs2eh/GvhAqdvT6HyGHApbSRDsUs06DgXx52dNP
         epkIhOsiOWRJ9fg9QTM636cdfEFLvtmoCf+SzzZBmYehGnZYoVRWwWa2qCOxb3skaZgt
         AzIjUB2+FIPgiNZRLq10uFnYs5jg6vrQT9u347Io0r5I9FMr8exoqipHuli9MCmOtqGW
         3RT9hcr4MYJvefuX1fVcQxeIQjx9+vbPLotIhrJw5PwEjQqgtQbc0pgtlr2S8rpQFSAm
         4FCw==
X-Gm-Message-State: AOJu0Ywg4KOo1l3Sh8pMBHnZjAxg4TOUtmlwSG9WyCSkaeemqgqvx7t4
	kb0RC3oDyaM9ONoQy8De3dnlblXw0xBsmQgOYoMW8d7H8BliXYUKrpj7Fjn1h4P96xg=
X-Gm-Gg: ASbGncsencxn3ewi8RpLb7Th0uWmElqIWaUzTpfKA8+zk3x6Sw2fGs/YbbkitG5dKir
	H67vDzUSIor/RLgu7R56BhZsr6rhw7zO7AgLlD5XYaezjLbQdSaxDL6VM1otW2087ZvA9i/muG8
	qDtF84ymj5Ikuz3DuOgNi8RklzsiKoN5iEUZvL9InREJ4qgLEvx4y7XnmPSI9lKzT5H/8cFCHhk
	IfgAVmF1jcHBoRqNfsB52hUtGLHbIJTxe9Ko0x3675o3sw5XgGdmHvdslbMyG1pjpy985x+ZU/h
	4axNjAmocAbZIMWtJ20mGa1Q6gTiR0TGvA4Xz8ntCV5CTGJa9auWymB0/NZeGx7IQuCutLy8238
	RiiLIsKMNdQ44jT1k4nsvWJnvDXdBmTgWDVZxrVgwogoGEHYQ7+O0tqrlQreSXjEX8/0sWy2/BA
	9PtwGIlA==
X-Google-Smtp-Source: AGHT+IHM8II1RjmfRp3m6g6zyZfuVqzhb0A84HhlWB31HdynPLlNw/TLxPho405hZpT+l0bh6Rwnig==
X-Received: by 2002:a05:6402:3511:b0:640:b99c:de83 with SMTP id 4fb4d7f45d1cf-640b99ce63bmr3446992a12.17.1762173613890;
        Mon, 03 Nov 2025 04:40:13 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-640b39f0d2esm4667335a12.33.2025.11.03.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:40:12 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:39:29 +0100
Subject: [PATCH v5 2/6] arm64: dts: ti: k3-am62a: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-dt-partialio-v6-15-v5-2-b8d9ff5f2742@baylibre.com>
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
 h=from:subject:message-id; bh=ewnVTjrK+RQoWcZSJk3a3VufQN4Z70DOdAXgMXn6M70=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyORf2PxOV9ZQs7ZnCe8TyenLq7VNJSa7p96SWjnHelp
 w8t5VnWUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPxz2P4Xz/rsdhE/b22cfP+
 3fxudkVg4tQj6h4h974tvTX39t3VlxoYGbr79q9fOrcsUjFngtUXlU0mpgzFETIzN90SsNup2G3
 owAsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044015_775714_E6C55343 
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


