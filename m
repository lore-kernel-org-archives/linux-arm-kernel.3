Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC450C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K/O9EvDZo94mWF4xlSzvWet1rbGz7p+KBumP0GD4DM=; b=sR4MItV/XO26tEHMWL2Wary2ZZ
	TqGvCx/s3E9LwNGQq/0EUBtMyTSIaFSdlf87u/oMwi2+N6gthL1vv5M8JbJlyXQ77T2FcFZIsADNs
	vaSdKGECw21iLR2sn7HUW8Ppg0cIeBgHs5C9M9+3zo6qHxV12c2aJrtzvHPriRpJtE9napfuLStc3
	sFqnLuz+TvUDEvryE6rY+qza4vZvmCInehduvrrKb1LTgL317fWKYNv5PWQjXZeLA2L55U6a5afns
	wG9e97cAW2l9BM6jZ0TLxWk4kW8FoQNLgmM0auVm/EDJY4KLNL2g2Nc+6ZGDpyWXeCyQXvdqAkrA5
	p9WIw7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mYG-00000003uQi-1z3I;
	Mon, 21 Apr 2025 08:30:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJH-00000003sBN-1yih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so4546028a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223322; x=1745828122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7K/O9EvDZo94mWF4xlSzvWet1rbGz7p+KBumP0GD4DM=;
        b=Wff2QxPC4P27cBes07+WG36ktVKwcXRuMjiHGlH4UdFXbW/r0XOxFI1PTPZWJ+XAon
         SWqr0VF6jkpkIVJU+gVQS/lgSTLiX8Or8hAlqdblABzDgx9IFC2JJaQxlFP+4i77OVuG
         wVyub5lMzIMWwksZiAZhF9wUE46Kc2FPqBMZWnXe9kFff9ebRXXoevFLtOdMF2OADS3E
         wQ/mFw9Js0r5pDJHjgVZVVhH4u1t0qtkmQXPknhJpV7GTwDcisZnq1bc922bh6fDlH6j
         MHMOWXsxde/9VSTMIZHsyW6AXplAcpMTzjngp65fjbIH7yhLYosp24i2UM9u1FjrmglT
         joAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223322; x=1745828122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K/O9EvDZo94mWF4xlSzvWet1rbGz7p+KBumP0GD4DM=;
        b=pS6b7YvQdBy3hvA8bLbIjGO2l22foQPoAtHk3xKTZdMwACE51F5eatTzlbmS530odF
         Cuxtd47W4EfqRkDSJ2pAsWzZBdS464bp9nDc0q0lf0Jr0/2w9uT6FiXxSlnOp6qwIDNY
         rOo4iDLflQsd5xrWQ+2N+cP7Ht71NOnpRmjalvcXx7+PskPnHoJ7mD1WUPjjnC7MA/CL
         1Uw1tpcOCNASD34hFlPiDmcoBrR5s3wvhsP/VV0s2WWBseuQ8O+d2GzDeo2ivScH2ZFC
         34Q9FYWnkwZThT+aw05soNXFdAl5S7/zh0yNIfuYk2VCZXiUiNEQrGSJgUC8/ouPBu6G
         mmkg==
X-Gm-Message-State: AOJu0YxSLVeNml43z6JyCcHciB1P7qnhkM8bhqQa38OeT23FPzfK1dZy
	Xc0DPW0voZolPI08MatZrxkgYSaCMkKA2mf9uZArpP/HpoYh8U8uGWl8CayBf14=
X-Gm-Gg: ASbGncu48bUr4qhANSx0I9Uu+mVECvYnRinSMTfQ7UvIDJalD2sIr3fmW9UiHd99+z/
	GbxQEEBYBaPD65N/8LqXcRXxSZOtPCTDTvZN3KXpEVDOMRnSJYCmimh8+kMKRgPb1zkgWJJ97Ak
	0DIjDxinYYQa8E5jBe+B/+XkDjD6OWvkpGteMmm67hAAhCLnV7/Gam4cJV8X/BsokfDJi8K/5so
	XLldTZGxNbNO6+MhXbBI8KhIjVy3rZVmEEddMrzl2irDFvOsRC6Di3Pt/Pr7EWfu5qZsHcgu78R
	4B4EvPjhmtpEwmtNkYNb2qmASEzi8zUrf4w=
X-Google-Smtp-Source: AGHT+IGavSHBUnEKp2SLZSsMc+Z3PxkFoYizZmoJvGkx3hfKMDgRJptjKyk6zn1z6gEYNGmCH9jGKg==
X-Received: by 2002:a17:907:9409:b0:ac4:4d2:3867 with SMTP id a640c23a62f3a-acb74b0b022mr848922466b.23.1745223321733;
        Mon, 21 Apr 2025 01:15:21 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ef45784sm468996766b.129.2025.04.21.01.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:21 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:21 +0200
Subject: [PATCH 3/7] arm64: dts: ti: k3-am62a: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-3-6ced30aafddb@baylibre.com>
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
 h=from:subject:message-id; bh=DDUKqJYdItgCK7if8keg+0cOFuGTse8BArfuVENTgzk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf2Wrvy4y+qVzV/X5pdptazMD+byvKPtYSvrF7F9tc
 OJYlv6cjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIknsM/2Mv7iuV5tsus4tx
 W+1D2YwZG3Yqfe/6d4V3TqTHkoI3ThUM/6vnOL4qqr7XGGg+f+WdS08tuCc/3fLtmYuRhbHVm5U
 P/nACAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011523_517423_BFD29637 
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
2.49.0


