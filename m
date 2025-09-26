Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D794CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UoStl/6O0pPwy/s/NQABzja2ZbIsUSjfUYP6v+Jyo+o=; b=I48iKgJxkOctzH0XYrPn4HoYAC
	51jt6fJZmtkICnbZfsRZbOYocjvVLyCtBr/UVCBd4i5TM0TY1OYdB5ksZQ2AiTRJIO51husBU6+LY
	YcX2b3dTpy1Zvki3HMDLW6L1N5mnFEzmkrkb3NexDI0wHujuqI5bi2muzVqpIp1LijAc4KL8CmWJs
	/AM+45YsF2QxQPpwOjxB9ryqkefazOWhzEZhaYuiTluEITW0eL+Ffbhp/UOGXcnYpPImx1jOxoiey
	LRAQily0oLnheqko56Re/FCqzb9W3mbJ5oCCUBXwImn96qlkzNQIoUSh0i48hfGx8SirWzV/rn8zc
	m2bnfxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24tf-000000002Yj-2IQJ;
	Fri, 26 Sep 2025 09:37:47 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24tc-000000002WZ-3E2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 09:37:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3304a57d842so1543044a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879463; x=1759484263; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoStl/6O0pPwy/s/NQABzja2ZbIsUSjfUYP6v+Jyo+o=;
        b=V6bDAnTJfeVHoXVn8IvJpJ8PpNuwqHPZfhcRgPYgnxooVq4ZqA7ysSBvZeZxfGInWN
         P/JsmxU+uJz4TXUVgCb3UJTAQSqnlAMYzqIPtAYNUJy2tkzu6kknmdvmov0sDDtjqK55
         URqRvirPvRqBh8F+SF3Oh40JTdsbz5hWQoesZ1GLYObFvvQ8PqBjr7Z0ozBkTuHFKzUX
         PHgCdgytyxMMfSCKFl1wphqPf/V2DFE/J+W1dA1oy0yPIlsTZt+jiJwFqgZ3cv33kNm2
         D+hpjagEuNFgdgL6D0e+FpfnsyCGEm6eIP4wk2a4Y65NmSLK95bsR/zR9oVMiIahXR3r
         sqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879463; x=1759484263;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoStl/6O0pPwy/s/NQABzja2ZbIsUSjfUYP6v+Jyo+o=;
        b=DPY8VJel2kK1aw7apOaBSKVUgoY1jSfPMVyacRdHjfLqJVLoksKfpFm3BgwblxtxX1
         CvSXZ/Tzh59mRsbY3tLTBfFHMA5pxE96a8fTIPvMZe1TB1Pu+7SaAyoXy7GdTrpy1Paw
         A/ZB4M9wjCPhw5JNaFkJhtipZfemkLcfBUI2NgQX53Sc/uzJrAtsiIM2TzrBXzJHyB0S
         1CxVdz9nKBlpIQ9tV9fIBkwcY12v5lRz2/V7GduaSQ7Qyf8AaQFRpjDlk42uWT8yAq8G
         RHIbaDBw+JddtPdAchTswTFS1DciCAi7jeHajBtzvNu2bdzQhFNvLY4BkJ3gVYYZbX35
         icrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOr+uZVOJwnuwLLc8sPS2K/xAFb+rxMP+ss/3j5vFV3ad0N4pLCFZbihxIyom0G8UtdFPcqwb0qCeyQ9Z6rhBl@lists.infradead.org
X-Gm-Message-State: AOJu0YxyAQ1NXTHDGj4QQl5D9fQAa7JGl4YWnsYLh8DVDv0UFf52lFeQ
	mH6expFksXbeatw97UdWEkQHBqZ4bZab5E/1TmooZCuMfg4JgoNRFwCA
X-Gm-Gg: ASbGncvqA42C2gwGjZIIaYiFPv0rMCNUSnm67zZnuV6ojbNyKuuhpZz9pyiA2I2/TvD
	vstC7r6kghZWnN7lQ95fsln+mALaI8/a7YClUT5bhw2GbY97HkZfrm7cewT2CvPnZ0L8zz6rdjD
	zPcnfCtbQbi8wDvKy6Bb97+5uZZB2ykoSIFN8/YiCIygowntF+OQ2ZQ7+ngMsn+SmA52LXk7WYQ
	xhHxOVtUrMM5fPMVIX9Al2fg0UpOhGEv18CysXIKSBSZEdUc2CBLRanfoQmVffJlVKnxSmgaUuS
	TnP+Bf2Ow4L+VDppQM+8GBtr1UanRXYu/LAax3TUwAIGvc1fdLEdJR3i9v4KHQ0DWsNgVfu38cF
	8iXcgyWlVZWHlPerpVV22S83e0RCX9tntsqDvFIPb4x1Udg3BkPjJyV/8o3c=
X-Google-Smtp-Source: AGHT+IH2wN/vTNpoB41B7wJ4UIGDQlG1DOtuFCeTQt8xZvPtyijptE31fGlsQRHND0LCJie+ahas4g==
X-Received: by 2002:a17:90b:33c4:b0:330:8c87:8668 with SMTP id 98e67ed59e1d1-3342a259df0mr7079061a91.14.1758879463298;
        Fri, 26 Sep 2025 02:37:43 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55bd160sm4211056a12.47.2025.09.26.02.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 02:37:42 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
Date: Fri, 26 Sep 2025 17:37:29 +0800
Subject: [PATCH] ARM: dts: aspeed: clemente: Add HDD LED GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-leo-dts-add-shunt-resistor-v1-1-c871a68792f0@gmail.com>
X-B4-Tracking: v=1; b=H4sIANhe1mgC/x3MSwqDMBAA0KvIrDsQ06rYqxQX+Yw6IEmZiSKId
 2/o8m3eBUrCpPBuLhA6WDmnivbRQFhdWgg5VoM1tjOj7XGjjLEouhhR1z0VFFLWkgVN8O71nIf
 OB4IafIVmPv/5Z7rvHwEMnJFsAAAA
X-Change-ID: 20250926-leo-dts-add-shunt-resistor-0cba43f75bce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758879460; l=1436;
 i=leo.jt.wang@gmail.com; s=20250618; h=from:subject:message-id;
 bh=thNDQviaGyibFyGAqfP3goBA/6Fj0do4LHltc3WJriE=;
 b=T71P6S/+uzqAe2pm19qHzYoz2nhygnZpGVvbKLhyWQcQWVsDSelLeccTY+VnuA6uzE1BPL8L4
 Lvp20VxcTRFDYgHucePFNrm13q3hBU7efTHRYQ5iBAKOa87ktB1nm+E
X-Developer-Key: i=leo.jt.wang@gmail.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_023744_813292_B05BB773 
X-CRM114-Status: GOOD (  11.43  )
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

Define a GPIO expander pin for the HDD LED and expose it via the
LED subsystem. This allows the BMC to control the front panel
HDD activity LED.

Changes include:
 - Add `led-hdd` node under the LED definitions
 - Name the expander pin "HDD_LED_N" in io_expander13

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index a614f947dafc9a6628c3f3d45b62ff3ca9d2b618..450446913e36b1418fab901cde44280468990c7a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -95,6 +95,11 @@ led-3 {
 			label = "bmc_ready_cpld_noled";
 			gpios = <&gpio0 ASPEED_GPIO(P, 5) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
 		};
+
+		led-hdd {
+			label = "hdd_led";
+			gpios = <&io_expander13 1 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	memory@80000000 {
@@ -1199,7 +1204,7 @@ io_expander13: gpio@14 {
 		#gpio-cells = <2>;
 		gpio-line-names =
 			"rmc_en_dc_pwr_on",
-			"",
+			"HDD_LED_N",
 			"",
 			"",
 			"",

---
base-commit: c65261717599d419e9c683d85f515d3ca2261549
change-id: 20250926-leo-dts-add-shunt-resistor-0cba43f75bce

Best regards,
-- 
Leo Wang <leo.jt.wang@gmail.com>


