Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0FCC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1gRK3Ew1hi0PFgqsl/YmhtfeV57oqbHi+ExGuEM3zt8=; b=nHvDiCItKAd0IHkMH2BOxEbs1r
	a17pBJytnwAILpPEtLY+mhyeSwvUq2dq8t2QjWdEAkdhpybfn6wVLxNXnpL1UTRegoJimxveagm4s
	QdK9OBWU/otHS/bwZj/KwdAJkQBybJUrGDTRWH4YmN10izvdORBTzrPEKOfAYhfY32qccCfXFLa7E
	Iq/fhXqZKGbZ3ekDczJfHn5wkveGwQPFlgBQvXuBUSCrfahNMu7grw27oi82JVrWLe7GZO4SLZ8zD
	MC3Q5S0psRZcQsHshwLuten2guFUlRDvf7u0Pj7M1rOBkcq6ATfrcyIPU5OJfHAvQ1Wze7ELehIub
	hHgk7lTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ZE-00000004xbv-207v;
	Mon, 17 Feb 2025 14:57:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2Oc-00000004v2H-2ZnY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:46:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38f22fe889aso3462175f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 06:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739803612; x=1740408412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gRK3Ew1hi0PFgqsl/YmhtfeV57oqbHi+ExGuEM3zt8=;
        b=nmY8X9/WH2Wfr1tRD3wOkj0wLjCWkgV9NhEnSMFuh7LBnwpdWhOF9jBhuKFScYaCaW
         95cGQoKn8a6CsbG/4/2XZ6QhLBKxmYrsJEmXAAWL67Sw0X1EdCttwg/UIASDzjTMH1ll
         971PRDFwBt5cDYBUPmFLMMbZrqSofZ1l8jH/dzW6UTtUl7U1LMIqZWJOpLtuAXOE8rnA
         z9BOVXVMSrjVari2YGfQfMaJwNdwWfCL1xQ3etvcp++MbwOhoolGTGbxikJQUf3r0ZUt
         UYUIfZNZPLmHe9D+/FLEi83puOtp44RKPDyJBsEIdPIoFU3dBSmn42TM/W3goYYqTRZg
         YuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739803612; x=1740408412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gRK3Ew1hi0PFgqsl/YmhtfeV57oqbHi+ExGuEM3zt8=;
        b=Y8KXT7FMZEj+6LnANiMHjY0D08yY2xGWQdxf4uOUZSu4pT98twhnSzoLE/eKqpiBqt
         lJt4YAi6zvIJ9L+IZEWIrcsSemtB4YvroAQvvA48NlOUNVA2AWtxD/46AEECL5BDHnYW
         JtPYgjBAZMEDuEiK8zExFHAG9kI+5BXMtJsMZXD6v0D0rclmBsjPQ6jL3vOeYtEM1759
         ZxGEoAVh50bZyhTByh1l8Ps6k0tH4Yat+TOPW7bam+lgk1oo+SAZqjRZcAaxl3GdHnLR
         RiIr0lowwrpk0W85V6CmVOZ41aXGISe2pWB3acASLOJro/pZ7F5KPee3yHY+8yW7AS/r
         0ooQ==
X-Gm-Message-State: AOJu0Yzf+MChY9Tc0Q+nGWgcaS0bIrPsiizSmIi0Hv6BO4naS4H1mTiV
	SPbCSlOMwcx6TTh5YpiTNk428uSp1M5j9dTn8gIXbwvDYdTidT9D
X-Gm-Gg: ASbGncu/vso2IQcj3X8TeByXPObwaLWZcqCbJQMI4rOSyUL3r2MtcOXRUmLTsE7ClWY
	o8sqHMpJGc0poqnUh0kGIqfwp9ThPyMsK8qXAVaCcD4kMhF/tKlW7jXkV7vk04AQn0MGthAWQZu
	Wrm5gJHI19GgyXtN4JniqE5oLMspxIZEIo2z575NBRDs8AvtnXmYkpC7eSOZvvGA/fCAZ1WWVn4
	s6I+DCB3n0V60lfB1qoMfva3GoqJtc9u5KY+MGyJJx983xHtg6Y/i4Dpe9fKQ1ueAJ6JvjJ0ARm
	h6yaUpd1lCwI7u2Y16hrUO6+pcZlG10=
X-Google-Smtp-Source: AGHT+IEvsVySnJ+l7Fovemaa+2WhfTAXf+xumNmEOKxOaoi6B4K38BG9ABeK/x2mrfAU1A28oIBrvg==
X-Received: by 2002:a05:6000:2c1:b0:38f:474f:f3f3 with SMTP id ffacd0b85a97d-38f474ff5bdmr3521133f8f.13.1739803611955;
        Mon, 17 Feb 2025 06:46:51 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:48e7:ac19:aeba:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258cccd3sm12424688f8f.23.2025.02.17.06.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:46:51 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jai.luthra@linux.dev,
	francesco.dolcini@toradex.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin-dahlia: add Microphone Jack to sound card
Date: Mon, 17 Feb 2025 15:46:04 +0100
Message-ID: <20250217144643.178222-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_064654_651531_33B7321A 
X-CRM114-Status: GOOD (  11.10  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The simple-audio-card's microphone widget currently connects to the
headphone jack. Routing the microphone input to the microphone jack
allows for independent operation of the microphone and headphones.

This resolves the following boot-time kernel log message, which
indicated a conflict when the microphone and headphone functions were
not separated:
  debugfs: File 'Headphone Jack' in directory 'dapm' already present!

Fixes: f5bf894c865b ("arm64: dts: ti: verdin-am62: dahlia: add sound card")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
index 9202181fbd652..fcc4cb2e9389b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi
@@ -28,10 +28,10 @@ sound {
 			"Headphone Jack", "HPOUTR",
 			"IN2L", "Line In Jack",
 			"IN2R", "Line In Jack",
-			"Headphone Jack", "MICBIAS",
-			"IN1L", "Headphone Jack";
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
 		simple-audio-card,widgets =
-			"Microphone", "Headphone Jack",
+			"Microphone", "Microphone Jack",
 			"Headphone", "Headphone Jack",
 			"Line", "Line In Jack";
 
-- 
2.45.2


