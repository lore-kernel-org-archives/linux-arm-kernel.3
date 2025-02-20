Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82059C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NR8wjcpxYR1ODwGW2lEP9QG5C1p3MxomWI2/rfhGN4U=; b=mUcVWUN/sz+BE5
	5M/IHxLYT9VN14kLacKLP3gFD+KVdYwRCSDaYx0Fi0jfqXUOcfXQ9GvkZk/3HGvDJIBUSrkTkpWaZ
	4sgwbuXjCHz0oDQ3mcB3vk7ZkzBS1slT5dH9UxV7wfqrYJFh0+B2B+kW8HZV1vED5oYGBXliblWN/
	jZofocm96m9Cw9BodPJzb70NV/E39pCHXc3PfW+tcDKuLtkagYTG4A96c7lwIXP64LTuF8FEKHLAq
	yomXOdkuSPUyvJg0TM77oTCqPObTd0zfZPbaxsvlxIS+A8VOksHOIjFB6oC0u120aaOTUgtspEDdg
	9rpkLEV3B6Kxx8pa/Izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8rk-00000001gcy-07pb;
	Thu, 20 Feb 2025 15:53:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8q0-00000001g1T-3Wxp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:51:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220d132f16dso17987665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066704; x=1740671504; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NR8wjcpxYR1ODwGW2lEP9QG5C1p3MxomWI2/rfhGN4U=;
        b=mruxmiMsOv0WN2Nc+r+HSX6fV5KfPmQk6gtl7IGIN1Qc05IdsB2mPhywNzxabL3W9n
         gVpRkwYQW4EQeQfTGV+z/883rkcKAP14ymASq0aflTkTnHY57Fs2JBpp9NJCqUpItM0v
         OLNIoG1YodgLJlUU+QDjkGtlhMuBKX0BoEwJ6T0ozxbEy9kJm97eHd/8plbIpCvAQ8SL
         cOf+MDHuvyOynbHSY8Dg6725Tx05byGb2p0Bc0Kl0Fki3Tl+//9rNxo+nW0SkSu9mu1Y
         D+k+vygZZNBrkMjXs9Hkgtj8AuItsh4OTVvVH4S7zfkfzeyQTSeC4xgADnDw1pK7yrj7
         Q3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066704; x=1740671504;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NR8wjcpxYR1ODwGW2lEP9QG5C1p3MxomWI2/rfhGN4U=;
        b=EA992eyJAUdlYULhFtmFBqQonpuxKSoYnYMk7gy/VM8mt/UTPEZcnb3RahC66CIUHl
         DPgNpU2YSdqtgMnNsQdjk6YhB0dfCyjwyvrdwhQtqlWb71QbfvKEW6ytCaA7V06r7XST
         nu7IpBVsttss6gJ6ZzcF66y0vymfhpbnsDeTDgBmMf3AgUMdyUSV/4wH18C/vsZCfPcc
         OyhyFyiSOxax+hG1ZMm3HWCT1WjBfuj2AC79/GJPWifjHSp53zASVwifUXhy3O2HqJo+
         TObBM4UY0iQgg3Nfn5EjIBXIg4zqaLeLpPqAk2ZCPWJQOmNyV8d4TAcihNtNvOcewR0T
         oa4g==
X-Forwarded-Encrypted: i=1; AJvYcCUuEzou8a7zMPxgQ0ELb6Iar8BBrnR0j0bOVIE/C/RqnFXhSUrle4IEhd4RjsmP4Ca7BHJmN5so6WOMwQDSq8BW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw76It/R5Juz5hC3nmcYbt4Swe4aUx0LA6YELnLPZJWwqOeC8H+
	H5xzKrc/jxD2iRjXDY99QBCBjoACbIFSsA6IBndwSjvUMGRKkadK
X-Gm-Gg: ASbGncuJF477k7wtjSEjSJtdxxX5oUMFbmnwEBK7tJ21vUmVvXETv1639akDFWeqQja
	VfbVgexTAQtNNBj8AV48wbvNVB8/uRL5knBZCFixMMRccFTk+gU3G1pCvrtIuTzlQXYtGChwCxv
	IRAHUled4my5qgSNjESO8QI+fcr19gz19boHbKdiSBu3Q01EDFIgoZPZbXEhUisxw4SvLGTwSi7
	sWM3d29dNxAMxhfuaBEwLgUsdMbgibOc2mHPOizeDbfOpPHXyZTmnEOW94LdrFFkbfyvZ8RjHaR
	NRitrA/Hb2NnO0T1nQ==
X-Google-Smtp-Source: AGHT+IEPhTJ7Bb4lHaVGDGh+KJhL7uPvRBoISpPixnwur50FdUhQQiFL6DTY+T3N+joX7r91AEIt9Q==
X-Received: by 2002:a17:902:da92:b0:221:7e36:b13e with SMTP id d9443c01a7336-2217e36e109mr106022935ad.12.1740066703713;
        Thu, 20 Feb 2025 07:51:43 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:43 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/5] arm64: dts: apple: Add DWI backlight dt nodes
Date: Thu, 20 Feb 2025 23:51:02 +0800
Message-Id: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZPt2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3ZTyTN2UEt1ky2TzxDRj46QUQzMloOKCotS0zAqwQdGxtbUAUIX
 q01gAAAA=
X-Change-ID: 20250220-dwi-dt-c9c7af33bd16
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oYN3yBwKAFhDDm+1KS08ubJwkHA6hRvCCNjKCImv9Lo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MA7ICfOW6+7b5FNbtbwzzWetcXXX3Ugu7b
 wy4NbpzBBeJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JD9sD/0bhTf5uHb6Eivm89d6HiPlsmiSfNzME1MqWK/3RuukOjP0F9KRGyYTRV1X4EAjahNswEN
 eKiMl2Czugtw4m8N6udUQhbnHgeSRj5ztf6qy9aruaXVKt6WA0OTASzmzhCadhfl8E4oBWriZ8O
 oFMO0m/IHBI50Jhb8uv6EuOeng1HIBtW3oWFiKW99U5Gv6aM/WdOYkKZUUlIFmTkpHpAzBHjNIS
 7zeS5OQnB9FMzTKqt2cQobcVV3wtc1hRg2i2l/hpTJD2MN3yKg/LRo6QTwgTPD1ntqNnFK3ol7G
 SAqq6cogOhqOXl2kFRZKQsIsUuhFZ2evgLJ5JPO/dBN1Fhz4R8o2udBxGoIWV9/o2NkXuBRd78U
 kRdzsMjRrPugHF5/bVlycF74hmNfBeqGT3IDA2ApEn7PtvZ5RY6E5J83aBsEFtPQPUc0yCcE7Oi
 TpcWzEnjJ6I7K88RJS2u65z/JSxmg7HvEKU3Ik8D9stTXpFZ2J6X8Cppx5yAJA3Cyid+b4GSBny
 f+KpBpsoyUoCgMiLkU2LgNhxmVA5+H7cEdxiNC23vzDU2m3ZIYUImQKvAxNtAn3XHd5uZtDWB52
 m06nV2Nbdj4naLaUMiu6bpFG3SZ8ZYwaAy1JMFra7SbCP9kGSgM7/LfniRYNTrEz6zUmZwoWnEo
 DcZhuh9XZ43nSFg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075144_882578_FF33A0E5 
X-CRM114-Status: UNSURE (   8.48  )
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

Add device tree nodes for DWI backlight found on some Apple iPhones, iPads
and iPod touches. Not all devices have this feature, as some devices
instead have their backlights directly connected to the WLED output of a
PMU or use self-emissive panels.

Devicetree bindings are in the driver series. Last version at:
https://lore.kernel.org/asahi/20250214040306.16312-1-towinchenmi@gmail.com/

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (5):
      arm64: dts: apple: s5l8960x: Add backlight nodes
      arm64: dts: apple: t7000: Add backlight nodes
      arm64: dts: apple: s800-0-3: Add backlight nodes
      arm64: dts: apple: t8010: Add backlight nodes
      arm64: dts: apple: t8015: Add backlight nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi     | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi  | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi         | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi           | 7 +++++++
 10 files changed, 55 insertions(+)
---
base-commit: 3febe9de5ca5267618675650871a626d0901f8cb
change-id: 20250220-dwi-dt-c9c7af33bd16

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


