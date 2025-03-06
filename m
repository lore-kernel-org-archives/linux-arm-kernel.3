Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56357C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKuPzbZ56Sy/epGKjdADXzKdvm5oH6KCiW1QGMA8BgE=; b=h5SjYsWg35Li0wCBtGYG0gPsoc
	jytQxgTHNS7SbaTmuUXq3WqrUh4Fd+X8jAIkIotrZFMySfrpAWDPcs0iDpxES0FsllJ+Qxxm6BWTO
	4vj6SfA5lwyBFvOOOFZ/3xzI6W+eS2IvxwVQwt04mngbRI8XYaPfhKu6ofB5H2PnlDE/R5mf7Z57D
	Q01RLkv+xXFiXf8D2MTKfcpY0ehgqGL+H/M/cjZUns0eob5fbDt7fWrcJuftt1wk1a213uLClndih
	mSVFNojzcjX9ss+Y4s7t9BkA8mVjMDJYokDIk3+O4BFg13bmmxMIe4rRVbnLt4CM6Fwe/hLhLTEeh
	dWAx56Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBas-0000000B6Kd-2pNH;
	Thu, 06 Mar 2025 13:48:58 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Cy-0000000AkeS-49CX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so3302829a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259767; x=1741864567; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKuPzbZ56Sy/epGKjdADXzKdvm5oH6KCiW1QGMA8BgE=;
        b=gY772/FGwD5xFxsKMH8bKKFiBRBQk8Ua0D3FKiRhrmoAdRWN6CFFF+jkmb3xQTbMFS
         mmfEw8a/XJn/q8FQrwNA1cMoPWZ9QqtIQkMkplYC96TukUo5Ghl20z85gUVqvkTLXkz4
         VpRQIhJmk0PVtOBXMR+9MfNN7m1BbJwif8xG61jtuSpEJOdx2da6kf+c+2Njy+euZzEr
         q6nMIqyw7j2kHcB5hWDsDRkv7ZJxCEUOqyWWncG6dVs19sxAwQBfXjo53n41lOEYyyU4
         cIU5hoqt0VBLq6WP03aAIrV+vfimkPlkZtw+0eOUZI7o7STyVM+7bBs3d+/g0FMWJm5Z
         fNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259767; x=1741864567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKuPzbZ56Sy/epGKjdADXzKdvm5oH6KCiW1QGMA8BgE=;
        b=WiT+bkmnoa2KZbWhLiL+E2egsTrsCyqCurFOblrsOu7mmAazvC+cV+AGIVPmYocfbS
         bX47IcrgvMvviv/p5dI0HqWsaxIdTpbanvqsuc6XMSeZ6yTrsXvyCz2zcf6AHbbU0lQu
         xmrhgr2/V6gs9oqwKnsKy2B6aaVmZ+ih6SeNn+fTJIhsdBNDSWdtcF735++iTMq6cOBw
         Z0GJxdYvebIddPePAdlbo7dRp+C7oaASA7IbYHMZFSb7WD8MVhoo7FA4P+nJQZtuEcav
         Bil9Y+1cOG2A29sKaIn4J+x9RxD5cCkV01mEVJJ4Uoq7QH+N+NzAvKoIlueusnOfaNLV
         6iUw==
X-Gm-Message-State: AOJu0YykM9uy4nh0WhiyJMcfEW6v1TyFmvP3CbwgdgCOdC7Ebwxr+Bdc
	4Z4vzvfP1aTVuvitKsJUKTaQy8b5DfejQ8auN4EvNNGCycyNYGd7ModumUiIu1ZSJqvyhBH5+vX
	S
X-Gm-Gg: ASbGncvxOmWxwzEQE5/JOJH0Y3NXyjRlneKN5LjeCXCBhvtyN7W3QyP7oQkynosUwFJ
	E9Qp8UPQeB9lkbRQ5zlxYHBuQno09Xz/tCOiHyB5luqdgLmedVG0IPq4LsgLVycMeEuoyl8OOrC
	FBbE7cEAWMulAiWHYkpNY5ymWh5PfQmvi6kyJ2bPfMOLEpwKQ61RDliDf7lpvj1Dl9xY6HRKhhm
	lWl0NzI8y9ltNfQYb35Rb+HJifp+rZcYisVrDec8Fw/qDIOo0A6GppeDxVBK2deDX311L+HXnwQ
	QovAejQ9vF228aTPbuH6VWYpIVP3saVZKALoSVtljA==
X-Google-Smtp-Source: AGHT+IEFVSa18GEIJgxa7KRMd3iFVsH8mF7vScmeGZEq9ZjRWKNOLFR/ZTMFQ4Nw9AMvKsYhWHjA2w==
X-Received: by 2002:a17:906:11ce:b0:ac0:4364:4083 with SMTP id a640c23a62f3a-ac22c54f4b3mr263879366b.0.1741259767248;
        Thu, 06 Mar 2025 03:16:07 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac2394389cesm77908266b.27.2025.03.06.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:06 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:47 +0100
Subject: [PATCH v5 09/13] arm64: dts: ti: k3-am62a: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-9-f9323d3744a2@baylibre.com>
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
 h=from:subject:message-id; bh=d3nIpQjsg552gUrVGPgqy9iTBzYcp5YGOFeSSkRUy00=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNl86LNn5Me/ikXMSPjKMS1/t1V1iu3wuW8Cnukl7v
 261c96e21HKwiDGwSArpshy98PCd3Vy1xdErHvkCDOHlQlkCAMXpwBM5HQDw1+RH723J4oXXTlw
 7Z/VlrLErYq+enNm/pFQjzZt5Fp0UX4Dw//cpVfvTklJWnuBmTHr0JE7dmEl11XaNwocW3Kh+3r
 JdDVmAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031609_029781_B474773E 
X-CRM114-Status: UNSURE (   9.17  )
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

Add the system states that are available on am62a SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
index 4d79b3e9486af18b8813a8980a57937669ff6095..0b58ade9561a3076fc89f3b85dbafa969285162f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
@@ -46,6 +46,33 @@ pmu: pmu {
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


