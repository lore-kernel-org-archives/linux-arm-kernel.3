Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBtLLuJtQawAmT+r32Eq/8y5p2QwBqnC69olS/VYW6A=; b=pBrLy2rASbK1hRMpakyTqFwJeK
	5sKyBc7hQodFpWB/S+XUwcsmhVvTkZ476BBo6v/122UWG76JtNz8Ovsq6TxSk786l8EwVhOKkEPFE
	CZH+pX1xGyES11FtzPCj3k/S602VYTEp0AdsJ6ojhRyLimN/WJsDEqOZDvCcK4ZR9E/XcXf5V3WLG
	PTc0J+augglBT+NmKr93REp8zpjRBt1vsroJGA0tdYZpXV4iNtreWeip5kFJZsP70p6MtKreGnNMu
	1sDz4AyQhKF5zwfwYUHkG2YXTnrC8IhalNeQofe4D305s8rPjDZJ2bP6FicyQB5hSkzYxz5ne9Fvm
	RQABYE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Zy-0000000AoTN-3GQn;
	Thu, 06 Mar 2025 11:39:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Cx-0000000Ake4-2AdR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-abf5e1a6cd3so93267366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259766; x=1741864566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBtLLuJtQawAmT+r32Eq/8y5p2QwBqnC69olS/VYW6A=;
        b=cK237owTxoZ095f6ProU6lJtsM3V728VDYypRrwcefNWjEeiYL5Cz8VnbKHbcE0D5i
         LkQ2hcya6BiFifOk6OzYts9vGKUOKFMYIlvJUYBeynSc5077MtgvI3h/k0UFldBJUB2b
         4htOD09VRAHMC9T5943xltTy/iTWbwR/mDmXelBpYl43pj6Mf2ZctyqWDvmJ2Dbtimzl
         GA//9CZx0UMqEAzhaOEEwBkjeX0A6hzQAEymfX+dBV1HlucQT4m94FJpQ+8P/C2GuE4r
         iBwxB9meg7pTBJ2Jnztdud9qLb0WNz5HfyrtSisWLad9U17AOHjZZmMcS7zuDO69BbVv
         KXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259766; x=1741864566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBtLLuJtQawAmT+r32Eq/8y5p2QwBqnC69olS/VYW6A=;
        b=fT+SFbCOlYRs58SrqrDY4JaYTdt5rSQcroxj5yFSVrbI/WJXZ8IA6mhuolrfLThbH+
         UV3oZCa/j+TU7MRNyAETapsrUow2aFhBw+3If7EOZpaa/6p540kR5c5B0eIuM1CJthNQ
         OcqJtTmSS13xPJkRHCVn83w9Oxi5AmbvXMZqThRdf7lZOxCMQsowMFGaECqfK+TSWMRS
         kNHSNahczBoqgAUCcUDhKPP5H9KhzFK9/R4wS1jW2LhgysGwa0U3cO4VM9NxUs4MH5qi
         t0Ka2C6cQSWbslUc9sdOxJTJJrt72ko0hWDs27ZujNDFosyxh1c5WnUybyNx5q2aDGpB
         FKVw==
X-Gm-Message-State: AOJu0YxE2mYZ3O7nASrZ/UgPDa97yPukwzvJBLi9Zhgg8XXfxsXyDf8o
	/3UfztGz7HYMwVx/oRsn87O2oKj6gg/6fD1e6aMNAPirmtru57LRL1kKmXUP1cHaix/RfomrNiO
	N
X-Gm-Gg: ASbGncu5byz6Ob1uGYldrkzp7Dzo+KdZPn7noRi8R+YmsrvOCkXXxQyJCIqpk1DWjjO
	ElGMGzRaxxa0YOS6vN3RKzl1zNDj2op1aScOoDSX1vGwa8dJKbqk5TzgwEgkKbBFfgB3lEVddSY
	putwgX3ta8Nig41MopeKCXk9KIIdAnULx38afI+BjkfL89dRtCUrlifO7Suladjm0xyZV1bmMAz
	+zhqEtMrvZJejhVPr+1mtf6omWvdWSqTgVweLJhP2HndIFzYVOQgMYjMI6MIQLK/N5ROol0ja0f
	NS4bUDla2vebE/b8VWAtR0Gcnfgp1MBfSK2951+57A==
X-Google-Smtp-Source: AGHT+IHDKbTWou3q5mDxSt8FHLnziuo08sCEglEWRUMKQ7Y9hisLFsVJQsvUMtxNQ6c+a5VsArcttw==
X-Received: by 2002:a17:907:d092:b0:abf:56e3:e88b with SMTP id a640c23a62f3a-ac20e152abdmr626151966b.38.1741259766007;
        Thu, 06 Mar 2025 03:16:06 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac2399d850esm79391966b.173.2025.03.06.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:05 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:46 +0100
Subject: [PATCH v5 08/13] arm64: dts: ti: k3-am62: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-8-f9323d3744a2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=msp@baylibre.com;
 h=from:subject:message-id; bh=qOYKpbMRlS3QK+lIBKOrbvUoEPJGZTbJFamIqalYLfY=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNp+V3yGc+qNG9BiLi/1LVZOmpd9PbbxY+8p5uma6l
 sKOh0tNOkpZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJnNnCyLC2pS7zTY2GyuU2
 rtOs2frTs8s5hU92/EzotdTSWrxF6QTDP8W7Na5HLMqn8k+5/UBff/mNm6UR+3/sdr2S8/7K3ZS
 DXhwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031607_559827_FA1DD681 
X-CRM114-Status: UNSURE (   9.31  )
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
2.47.2


