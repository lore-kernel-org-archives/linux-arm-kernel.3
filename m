Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07081C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jThRiaQ/26wqHZ1vL8lEl8IaaxJS8aQBBZUVqHcHFM=; b=mKmcmfuZmQVhSRwDWpeZXdFECF
	cukDMC4GXPnjQWW4ruLE8eoCuSBkL68rtI9IpXSFe/MizY4SSJ4qxl7ZAib5T0OitpDYq4yu+3riB
	XEnv/Y2nVcQPN2JidfCEkZ9uMFmRb16gpWffPXPFiMGAoILAQbbj2kXHG22arWeMl2hQkK78LhnEs
	NCeXABZJKJ3HUIuhvGiafUEoMaHkwoiPi9nBvxKWW+DFPpHQy6hcrkeZgUEObBXENoxMVLxlyewXb
	2wRD+aBzPHyG13U+wAgvmeYS5SxXbzbaaFa82zXYIIVg+r/Ox2hrYmGQ+zOr3qXXCWmD5ThYyYtpd
	0VpKWkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6m0-0000000FJV2-2fMR;
	Sun, 23 Aug 2026 11:54:00 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6lt-0000000FJQN-46gu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 11:53:55 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so20667205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 04:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486032; x=1788090832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jThRiaQ/26wqHZ1vL8lEl8IaaxJS8aQBBZUVqHcHFM=;
        b=cJFKY8rFgNR75YSkAbZiw2ZXFANNQTzkGQxghmYJLJLlF0NYCRQBfbb1hlRuay9zjX
         Jn3gJB3HovPuHw+YpC5y6buo0Mu27Mf0HHR/wVczK/4GqyMZq3mfx+/DZV7my4PcdARU
         omUYcGobbUN03MY2mLyTelYC1r/F7ck94OzCGzoZta8nEAmAWOpEHZX7qZ1ukI+WaCMo
         IHRT64X7FaE00M+Ozb/A06uFhXhu3Vhvnrzg0WCa5ZcklXigK/FACNIiJn0WTd2exdle
         9fSH5W3AwDNWui7flvlW3siHNPzulPKN6jSs8XZsIKNWH27iK7aK4PP0MY+02bcmw1Rj
         WVOg==
X-Gm-Message-State: AFuF++kT8HW5ipV2mBlHrY0o4vt5n3siL22Dg0AcYNtcGdzzTj1kLQ8W
	Ras15LzkEUGjHZ1z51ukj4BZvVrtQdtcoSMnSnKtSQFLTsDtRbWJ2OMK
X-Gm-Gg: AR+sD1317BKY6rHtmT0N7Tu2HsJ2Mk0RF15/zVAJNh7/e0J8j4FRPGX7y5GULrMvyF5
	+1VfLKu8aX5t4PflXKWqMYpPscZuHs1qCrN/9e25caubtzhnxHdJ6Ez1GLIGGi8ZVAp8Fj4RUc3
	+WcSk9KDpp6ivHWqCsv5sLM10WG6A8C0Go8zpgv/vDlIrhOnAblrhZ/TO1paeEpJZDDUFRLoVsL
	VB2wzaa85VBbxgOfnDF4morj9y9PkkrvmHW3fGY71WdpSU81MMWUqoVRWbkFbxdD+IHPLvX7T8u
	7m09MYNqvHVWJpj9WxNHbGFWcNzAMIdHVjIlWOc4dmrn3Zf4uyfgJK/MolPz56j0qE/XYraAp6U
	9Q7ClAPLH5GPU6UM66W4LrNNq4+9LN8V/FO92XLxx2SWPdm4KHUsg5Roivzni/aYqVMi3jHPQTC
	9QtlCHKV5D0KhtA+27ei8Wq8IGD/rtL+VBVBzpArU671jQ3inB5DC8yUZ1cp4/PgE9PWNI6j32S
	f+m9S/xuwlaLQKl68Uebj9n006E6s8h1BDKb5I=
X-Received: by 2002:a05:600c:6296:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-499b8327cd8mr242910645e9.7.1787486032189;
        Sun, 23 Aug 2026 04:53:52 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:51 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
Date: Sun, 23 Aug 2026 12:53:35 +0100
Message-ID: <20260823115335.102219-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_045354_023284_E1F5833C 
X-CRM114-Status: GOOD (  11.26  )
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

SD cards start at 3.3V and switch to 1.8V to reach UHS-I speeds. Some
cards refuse that switch, and the SD specification says the only way
to recover is to power the card off and start again.

SD_3V3 is marked regulator-always-on, so the supply never goes off,
the card stays stuck half way through the switch, and the MMC core
retries forever:

  mmc1: error -95 whilst initialising SD card

Drop regulator-always-on. regulator-boot-on still turns the supply on
at boot, and a card that refuses the switch now falls back to high
speed instead of failing to initialise.

Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 75d81ad6830d..c94afaaf8826 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -71,7 +71,6 @@ sd_3v3: regulator-sdcard-3v3 {
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
-		regulator-always-on;
 	};
 
 	sdio_pwrseq: sdio-pwrseq {
-- 
2.55.0


