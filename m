Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE33CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=; b=ts6myHC7g+z2t/eOOuJii0AyTP
	oF68veZ8dFY6ANAxDBFoQVZaUEMbcHnjU7wNMHLmvZI+yukFmkzLzZjcMNLYr6p6w1PHxqZOMPjkc
	97FaN2Ww622TOIslYsJMkuYdKHjnxEFCS3iwiQR8WUApKXGIFM5ds/wg7hdszJ3PPIA3ABbvHXZXC
	hBpzUCJuL4sg0qSGqQCXxyC0CqtuuygRD75G15du+6eQSI3yZbsjusWjkiUvZIrSVKm/mJgk5f9/s
	wcjq5rfY7FXXIz3P9x+2NqZ3i+YIAur+/gN3PNu99hAD94EXUxzr9Td/CBZr5WNNR1O3+C4SbtMX2
	gXehNtqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvP-00000008CEj-1F52;
	Wed, 01 Oct 2025 14:35:23 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xvM-00000008CC5-2UN5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:35:21 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so14412248a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329319; x=1759934119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=;
        b=qNZoap1i3EJwkUfXrrrNBz3tw7A1CX4blQ7WfaaZXUkT7Nrln7E3fJ7EUa3Hd9oJ5D
         GowkIUf8SqTYw1/JzwYezsIO+OYBTkad7xi4w2y9Jkx/KdHRVBktf3eXRrjnV/U0y1Gp
         ZILPFqz3IsKHIrnMhrnM7dy9nzMqEkA2Gf1vjdUbwFdgiMt7jOHiqvydRtHwFe3tLxqS
         cMJrSR10z9xs31x1KE2NVhyF5VCYmkrn4DQEww+p4M6RiQ9cWoU3wqpCl5u7bMo1DlDp
         89H6AWqPykCv5I9huRjpt3+9WYYr2BPyJMOxlVeCLcV0E2e9eFD1XE3N6EYOZgALYdQE
         TcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329319; x=1759934119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJeAn8jSSo6/JIcJaohDppo/oGstUTXUuYjdPwTMcs0=;
        b=qxIdpwnEgZ9ymJRzz/I7LkkZ+Ev00V6JJuHAlqnjjuIsCjqTki3AWUlTnEu90OOSv2
         qMKe3/FjDy8S1Db78W2FqgTRfV3ntXhGw4mytqQc8FUx/O24K/7XaKlS/FODRNku+rZQ
         Om/MIPRiYBe9guLOI9sspt3A2nT/0k+Bw1ybXqJIu6hzTj1BxjRJ3qat5vZFm8kkYUcD
         nuJb2V3TdsEEdVUlihTvpoT1PaUPXRFkhEXLDHEwLisvtyVYd1B25AvjrcXzTFrV2Tdy
         qRbE2MCBXcGGSas9/S/NvslQqUA04ZLbdj4aF1lG+Gh0WOOpep/HeoPZREDl/cajadFD
         smfA==
X-Gm-Message-State: AOJu0YzUImYKPEDEyHQX1NMAl05y9vpMSfSvM+cG0AVuq4pTPACcZUVq
	UdLrYUVv/2ZCJpKSM1f3Ta33odV6p9EVmjLoqU3yl8hnBG/zqe2Gbriv//Sv+OM9uNM=
X-Gm-Gg: ASbGncv90W55kP9bdFYTc0yWzfazE8+4m2IE+Q8I9SzdhdKbUV991kWvGoPpiOqcul4
	PXPk5+nGsMcfMsiv619X/h3Rr3NPbU2TpkadKsUBMbVdJ6VXH4ZRLt/F4FEouD1r5Ifd35N7Jb0
	jtqRP/FuIGuNXgJwfZEPkV2FyLxwZk+JOYCvsJUbZOe64HLCkPhtzy1HRlhvhZyfbzs+b+rfZsD
	RCEhj17e2NBdapin0wxEK9JYAUhNQETGKo/zTZZ9tvQ23dMSTyZkyCq7jD3VfAzu8O+F15xEGJB
	FtbUrKC3J2BjCkVeSDhYseIosAlDi/jxQZJ7QmlWc/X2n9f4Lhn+FMCGjoky0Xn1r3XiDRSlZKe
	i+YMjF0X7tIFCY+9rgt+KEWchZA+jEBnMEUWpkmhmrW/f
X-Google-Smtp-Source: AGHT+IEzvHyBc92HNqPVs3GdFrOt6YeTSsFc4xFWvIA6c2/HM9PJxT6oIh991UA0FNDgVEprf2xa1w==
X-Received: by 2002:a05:6402:2355:b0:636:7c68:6e31 with SMTP id 4fb4d7f45d1cf-6367c6870cfmr3014070a12.4.1759329318650;
        Wed, 01 Oct 2025 07:35:18 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-634c065a67csm9859870a12.36.2025.10.01.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:35:18 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:34:15 +0200
Subject: [PATCH v3 3/6] arm64: dts: ti: k3-am62p: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-dt-partialio-v6-15-v3-3-7095fe263ece@baylibre.com>
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
 h=from:subject:message-id; bh=6hGcnBOkrSMQIKieC/McV84XZyXymXT7FDaWvZWNWbs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy7NkxHbT9olx58ocZ7ZNFJlrrwVAtJLcEQRY6Sctb4x
 L1Bn491lLIwiHExyIopsnQmhqb9l995LHnRss0wc1iZQIYwcHEKwER+VzEyLLrcOd9DfLtaZLf/
 brFtlpz/WZfK/v9YV2Uyxf3kqhqeLQz/czNyeVWmFewsmXDs/nt525hzHgy5i9s7Nq4UvBlydvV
 FLgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073520_650971_DD791A99 
X-CRM114-Status: UNSURE (   9.97  )
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


