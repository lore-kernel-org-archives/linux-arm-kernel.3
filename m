Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3006DCEDDA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aUWB5rfJH8WjlZ6mpwncNQxfl3NZrrgQFt7PCfUFlA=; b=M1wVtyzs9fjbQAHo8fnz3TRt99
	pkYGbzCTe7qNchESMbotuMAs/Dx2ynBv3W9Zcb6ha4Gn8dciIS0ksTt4wMefKY21louZ2f5QFN96e
	A1lcBTVETcBBteHsJgFN9GpA8pS5uUiIMEXRX5Kw2XEYoui2d3gb9gfgG6joDmapVHueN/QZsUwue
	Pr3unVtGmRR1FLf1YETtGERzQLeI0aE28i9baVq//1UFiLNjibgBL8BlbGrBkZQ7NkTjy/bK5Hevf
	X7OMb056N+fn7m2AbSfw7RsHPwfLEzrDEMDUtaOrWneDqyxgP8Ou1N2DXrKx3NkjZ53QjYe+Humuy
	9pYd4e2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKW-00000000bXb-2lGg;
	Tue, 18 Nov 2025 15:09:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKL-00000000bPI-1y4F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:09:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42bb288c219so2550759f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478544; x=1764083344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1aUWB5rfJH8WjlZ6mpwncNQxfl3NZrrgQFt7PCfUFlA=;
        b=aVyyMyqUhAZSq8qOfTrRhv6OLlGowxyRezczJQfEB9yxLKwkLe4vIXWNS2Kdy9aWqL
         DLGQMT/ahxJg/KIdK+PwVrLP/SB0fZ9TpSVWFgHrRg5zFNVo5cs1deZLlRhDb/kIWFtw
         iFXo6jkfYiEHxg/qKpXnUEKT2AhcCL1CWCF0+rxbokTQd5hH2wAAaD8cxOD//lZ/UrER
         JYtlWoxYDtQNK0ki0UZJv37UvrZ36Ai8PgmAvOs56e+brzsATDXK6tts2corXcuKpT9c
         jUlh/h0+vKEWwUFCqTuOXpflWVfoSsReYdaNfiN28/5oxmVs1aO+HFmWknK2NBxsnliB
         zmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478544; x=1764083344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1aUWB5rfJH8WjlZ6mpwncNQxfl3NZrrgQFt7PCfUFlA=;
        b=olKthwIcH4itvXG0mqnhSVEEEIeaRt4KEDk1mcEkmlS/IBEHMhWhWTEnxAMt/USVHC
         erxPsk+Pvi3YsuPZOLBCj2kdsq2X+2jSpgdwaF53F6cevjpVUNKAaW/JkEkpvYziIHK9
         BEKqtZMBHD93mGu3gCBpMVlX6wEimld75Y9nEVWE5vPG4sZqq0s+lnCCiEXyLZj8mtjl
         TRHNXnMKxsHWoGecdd95Ekb1d6sxbcGmkyXlXzfliy7waPlRkkwFAk+PaT7UUSSg79ui
         JQt6pxrpTY4+vFmw7FqT5meRG4IY636hydRosfaUYOfGe/lgAu8ioGs1s/f0+2Kz2FRe
         ryag==
X-Forwarded-Encrypted: i=1; AJvYcCUIz/NWf5O1wFi3sTn6RpGS2eDppL/8IIKF0bWp4a+jhNc6xjnkJ7gFEsdPLkQI5vXxeeK5K8EAauDrz275PYsy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx5Uav0Guh5GiX99bk0cjiDGav5wv+snNg7sBKO26i7tqfPbQC
	mFw+ZAQHcGJidj4O6dkNe7WaqWRnOve4LoPS0mrw2drHYTt8G3WgvFuq
X-Gm-Gg: ASbGncuo9bfEnCqG/gPeba25dQUm6EHrEIrztU8t95bLmS8QG0mDoKao8zZMV9vX238
	oFOqoV02b/W7G9/+t2LKr8CB6FUbNKkic1vs8Wrfo94wh9JjNuMI2Wjg9s28valHfcPeDt767pP
	g/HrDanMMG048zNsFXBc6GjrIKaWp0j5A91Zbzo4h2DHGFgpZrFTuRkRodFhCFDeXEt3EGX7A2j
	fy9m1sEt89sbWiFKd65XjLqkLBVuiDf2LlwWRu5zeM7piRQsANNGee/7eqWy/4qAiiq6V/4gWBb
	EGDxgOJmcAt85uz1s7kGAxbJnVdCig5BC4EjzkVX1WdDNUmKT3DsVNjfkCYS738uF/HDrYqiyoa
	NZCMPvcs7ZxpDF6vHm46jw2JA9X9EFD+bWcJ8l9xjYUW94+8Cr0Q9RVU4iKf7nPlbV2VTf1uKRj
	x0ACU9gYaacd2sU3W5WfRHOOrE43OyiB2+NyRZxDxy5Bo9gwDIN69Tu5kiLK9knHLtBZvfmd10T
	NTxP0PucNyQvvzg
X-Google-Smtp-Source: AGHT+IGSEH+nZH3uDYlPARqsVIhZYpdp0LW2A5ByNrQdTilynl5MJD0kTuaNse/eSWnTTSY+SA+8rw==
X-Received: by 2002:a05:6000:2c0f:b0:42b:3592:1b82 with SMTP id ffacd0b85a97d-42b5933e152mr14529598f8f.1.1763478543680;
        Tue, 18 Nov 2025 07:09:03 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm33027151f8f.41.2025.11.18.07.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:09:03 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:03 +0100
Subject: [PATCH v9 7/7] arm64: dts: st: add DDR channel to stm32mp257f-ev1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-b4-ddr-bindings-v9-7-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-86b30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_070905_529439_461919AF 
X-CRM114-Status: UNSURE (   9.57  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits DDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 6e165073f732..84eb09f8b878 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -42,6 +42,13 @@ pad_clk: pad-clk {
 		};
 	};
 
+	ddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,ddr4-channel";
+		io-width = <32>;
+	};
+
 	imx335_2v9: regulator-2v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "imx335-avdd";

-- 
2.43.0


