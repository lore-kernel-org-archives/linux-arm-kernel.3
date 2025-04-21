Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F373C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xv2vJFkovmvpyKW48QLNHvOxtZkDSAa2Dz+3SaF3+E=; b=rHiRj6CbazWnXaloha2FXDA4Xr
	Cy60/QvdS6pAazZVtkewHBMBfPrepvjJZXI1zibwp+Z84AYJhiz3TwrI12ycbvMEZyt10D0pqtYBH
	C3PMB2gh1LMaovyRDMeWfQDpqSQenFfd2BdCQMPk21ZZH+m/cwOYpV3GYLDX8PdzL/JAzoZUolCpN
	mCvalWUh++sn8IcbPt6Fxy9WgB9+v5cTYTlS4l4txCOTrC6E0sCEOjFXEvXc0wB+23r74VqHNG923
	lRh6ABTwGIGvtpoT5avZJQ0KQTTRhLHJ75PCd/YPoM5el8LFrFrvWAAX613TmUeqxMfoF/pt3MJjM
	Km/EIsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ma6-00000003ujq-0v7M;
	Mon, 21 Apr 2025 08:32:46 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJI-00000003sCQ-2gcr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:25 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so5294123a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223323; x=1745828123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xv2vJFkovmvpyKW48QLNHvOxtZkDSAa2Dz+3SaF3+E=;
        b=I1QMlNyP0vgL4FY0jCXK1YbfM/LXvzWebpkpH9YCTCq7AiqEu3nu7NaqXR7fBxL7Oo
         a5POMyWjZQpc5Ha1/ZDb27hQQeLyuUamfx0haOqBmRkdHykg9OhpifB2isJEEWd4wReu
         K5Obl8NwXB8vPUdGor/AUUa3ojeuxtKEtnfAm0P4zmM7j59DO5QBCXPk1AK9cFBo1UjN
         pwFfabJ+ywbBuo2Q/x6N8D+M2qfXtzhxNdLKMXufJHdpeO793Xc6Uhf7CW9F1REtnnSy
         cyP7kDkn/QWHp/MlqpLkg+if4yzk0UoO7Umhr79pErL85yKVokvUCv4VTWS9U0hZw2Bw
         /MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223323; x=1745828123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xv2vJFkovmvpyKW48QLNHvOxtZkDSAa2Dz+3SaF3+E=;
        b=Bh5gM4SO2M/lcW2MtwoUiSoGMICi4Yv6QyOyJKLwXL7syg6vKbt8BXbBDASDKkJrve
         p52WN2ZEFlMz9GbnKqt6ZNP7ZYuK1rmTXNh+qq/7ngub/zHKqH2Vd6ASA+N6g6t+aH2J
         mU1HLKso5QPGUlh+v1U7WT+PAQYxsWPjik9SrjA2a/V9MSuAzvGN3RPwpX+S+2TPnC2B
         4+wBBPGDpKPXT/Y3xZ7yhDRMx/eWeZAlvoNGVz/C8qSGQ4XaxFVyTE9jqyCu0bziooyE
         RHThm76jFCFSIpUvq3nhM6V+pukCa1TaKWSkU7cTXLBMUUiq+LdG/l8T8LxluYlqkmBF
         xkGw==
X-Gm-Message-State: AOJu0YwbF3dU6tguygRiFYqqlzAZ5rZtewYZa/AeO743n01lrgNbG6AP
	kKrRhazbh8qH/C8yrqbEMdTKZyouRANcN/3gEuz8vngBUQ+TLHAgofEF2sa+px8=
X-Gm-Gg: ASbGncv97mERytgMisg3hfVw/qKL+3I9qqgwtPzGslxywKqAO+eTDaG0BVlsvon0+xl
	+7PThzvskrSDYRuO+ogZr7z+NFBzlL/zb6v4HuVKGlrwavtGbYH+xKF6rzLCyT38YvFU6SiGtaJ
	fZlIyVsB7TnWN6dpecDfEAhJA6FKs7L7oHERWxw4gOnFCl6yBuSNyGX1PdRpqkYjtAP7Z+TuHke
	PlI9b7G5hGpvx6Y+UAHDRRlxP3/WGvpfPwxMq++XSOv6dyO330Tnf20jcexGBEpjAZHII1jzHso
	A/I5+TO1KAqE8AHPk6K8lA2iyISs14aprHki+CWr2X+4bw==
X-Google-Smtp-Source: AGHT+IFyGy/aZv6K0xGfVhdi7ZI6Kcv/gvzsExuIG2ExmgkYKFcEvOhC89+Wox//FbIGAWXvsOz36g==
X-Received: by 2002:a17:907:98b:b0:ac1:e881:8997 with SMTP id a640c23a62f3a-acb74aa9ffemr1086229666b.3.1745223322902;
        Mon, 21 Apr 2025 01:15:22 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb72ced2bfsm452450066b.45.2025.04.21.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:22 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:22 +0200
Subject: [PATCH 4/7] arm64: dts: ti: k3-am62p: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-4-6ced30aafddb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4mbiitJOV2jiTWN9UUogzVPYkr73KyyYvrruA0u3aCA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWfzW+l3YeMl/x+Ebkh023b+j7e/yz7Ge5yflwepP+A
 akIvpiUjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZiIfjfDP/01+7fYmjWx3Vnr
 ZvPoterfbs/yEif+1extJ45XyH74sIuR4d+XltgJ/yrlP50wUlhsF5RX/iRx4fb1YUvbvVUCV+5
 MYwcA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011524_696063_6CAF0A75 
X-CRM114-Status: UNSURE (   9.34  )
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
2.49.0


