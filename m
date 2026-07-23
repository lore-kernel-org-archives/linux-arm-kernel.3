Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C750C4453E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 06:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=; b=f0Y6vA2w+pJ8kcHHyhjx7wNJoa
	PAY7bCQqHyJSJPhBOsTBfR9I9H0bnem7VM0svCMbQRbTRipP+LzO23f5NprD+rzeo5WcNfMN1Giwk
	DHK/SmJSvSUBmZ46gybqKrljmZko3hRQ7yPiESGOe3ECxDdnWgxFZQALD6qMHj/WpaIxbAWDZFOQy
	vzEUuewcdqFDXBPr+DqsebnR3Hx+ZywfRhhMXdoNZWTj//BpDXkp3T4gFxSuylV70fV64FQScltZf
	pATzUSL1TEO8rw9F4FzGmWkudQ4wzzrtCJxh0lQYpyvdjXUxJyRZA8Qa7NHvEQwyJEweGWpLLiUje
	KID/wSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmbg-0000000DWON-3KVC;
	Thu, 23 Jul 2026 06:08:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmbe-0000000DWN6-03yr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 06:08:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cea3004256so3505975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 23:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786909; x=1785391709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=KcElhoA485WyN7r7oSP2UWaAbPtcXru4/XeNIuI4VI6CIl+SEpfH+lLVSP89EO9uOW
         Bs3eEGZf6fD6JxdccEKnS4Q+HEOatc5NiPxfh1vnNsn0QLsK6GmiKTMTE1NZp0HHSWEU
         8R6PQqiNMqIlEHv0A4pb23sf+1hSSXPwz6y+fjOIO5lkcdSwVXTYfQkYpMafdBH8IWuo
         9NL/pHzJLOcJ51dJAc01SyJw+or7bmRTjcXMixpjEWK7C25p4VsjxvDiQe2Vsl/gyKJm
         xlQ5n1ng72ihPAfYx3kCx17wWOsMHARBWEMyfD9NX2irmn1EA0J3ZLn4pPMt1FN8r0Mr
         KJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786909; x=1785391709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=ZrpdAKSr91NVPVdEA7F6cHVCi/Kr+Z+Fe8HPd/18sCVtxVEEcBka0Ax/KlY2tBImdM
         DpCdATmLc1Pv6afpovPBj7V0ohlBs0H9uaosItlGFaCSCuycVpNy7TJZRvAD2ecmgYA2
         YTaFPRICPBTX/qQ/J1EEcF18syiTqrkDdD1fjqjf/2sAZAf+N8HNP94k09BZEu8oGv4q
         ANr3U/xSGTriC1ZsPBnQQRtWBXFPzznSo/vDv9UX+2zL8IgGogItIUKoJt6WImo9U7A9
         XaHdRRY259m9lozBjxTPmYPIZgI68eYCMWhp/z6t0PRbmPZxrM5aedE24R4jf32noG5r
         rtyw==
X-Forwarded-Encrypted: i=1; AHgh+RpqeP/6znoT0q+neaPgklG8/2nKHrd+WBo6LJttKKF1ofM2YUEMiflQ1OaEHDkh1GkLy23iJMbZGFIpIBD8xinQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwiXQmMa8j7ZSiqEGxk6ZXQEIE7vt1ScRuEVr2c/qrD60FPODrV
	5u8DWaxfA0jtFeVs7ltXVRj7Aa9b+ks56Xde0jD0q80MSksYPNGBdkxU
X-Gm-Gg: AR+sD10Ai2puSWfU8RwBeUlWUaEvvzUVnDUhR059ik737HzEiTJjWDqOTK6GjY9Y1I8
	uFOsoROMBN3aK3dCOgWqekolsdfeR5hY5bqfegE6pL82Um1uxCkJ5deec4XCsleC14IZbD6prIP
	5CqRW8GXUV+w1xFKz3xanOyAmm3tnuumKiLBgP6gKfgKFuvzhs30p2PdrSzGa15bnaqZMGN2UTk
	OYWVW0uLhDu0uzEMhubn1ykBv5/O1mlbwjbJzB8FUxOdwQaTdmlOmf1fLK8miHRHQN41U7qv8ID
	9GLWzkUvqhkWbjzv1SwHeww1aM46/PcFepNZbHucDko7W9XbqChCs1XHEp/ICNXBHnMnuSckuMG
	vTQSjltKH3JY5+whJr5jZBoJ7078X5+NHAUHRF1RG/37s3M5QjPwrn4k0/AhlVNaxhT+FqZdMEs
	vpGJZd2mJvoUxe2VFdCfsXpf/Te2q7QAkQbem0JNGBWYMBuG3SDXQ9lHs9zGWP
X-Received: by 2002:a17:903:2444:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2cfa6c7206emr21250435ad.36.1784786909424;
        Wed, 22 Jul 2026 23:08:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm26071285ad.79.2026.07.22.23.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:08:29 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 3/3] arm64: dts: nuvoton: Add WDT node for MA35D1 SoC
Date: Thu, 23 Jul 2026 14:07:54 +0800
Message-Id: <20260723060755.1596858-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723060755.1596858-1-zychennvt@gmail.com>
References: <20260723060755.1596858-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_230830_195657_74E8A1B4 
X-CRM114-Status: GOOD (  10.34  )
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

Add Watchdog Timer (WDT) device node to ma35d1.dtsi.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..14fd17cfdc5a 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -82,6 +82,13 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		wdt1: watchdog@40440000 {
+			compatible = "nuvoton,ma35d1-wdt";
+			reg = <0x0 0x40440000 0x0 0x100>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk WDT1_GATE>;
+		};
+
 		sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
-- 
2.34.1


