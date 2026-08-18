Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED09C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 19:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMPOR156M0mqts600G+VeeVQ2Hm+QQSFhaSBmB76XDc=; b=xZEGOu1DbWHUulb1GZ0WB2q+1N
	G/LjCQzzqJlfkq9Df0OW/noPP+5CH73mL7hkKBJUqtaJovkQlW3E+QArFLwy991UbOwcmSfs7lHH5
	jkfHlQ2X0YERG+lHofiapfr9e/QWG1K6c1bnOrzWGuZuy3XaHEdkLG/MbKABhS3/mLxJhTXUq5KIu
	zB2XKZY5G7p4UZpFxVff8vjUASWwFCdxemT3GcnNHOE1iJOt34xUg3ffhSFQFeWxnLpZGTRcaOetb
	CanqOmnmwkyKEE5s32QiDaFnM+pHQIuYlrgmE/s3D4fNe3700rXMtUx+LwzfHeRzzpHczhTJzjYPD
	FOiFsvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEN-00000008Z0Y-0Y3L;
	Tue, 18 Aug 2026 19:12:15 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEI-00000008Yxj-1LoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 19:12:11 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so1928865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080328; x=1787685128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMPOR156M0mqts600G+VeeVQ2Hm+QQSFhaSBmB76XDc=;
        b=f9/lK0Ya/On1ExlbHxExdof8Dcrq72bjIaYKvdX4FfCqhMi63TUdR6l0GnHWJDLcnk
         idTtXV+hhicdqVK3BaSBPvCjW8cO9/3KPIIHcDFwcG1pP+V4aFT1dMrlS+1jfIW8n63z
         +gYuDqVu382Cd8uqnEn8cdmEEUvAJU9gscNqs0iljK8pjNLqZrzyRE8da32WRkgpGDO8
         GhhwvXRXOtQjDut8BGAtHXpXbNm7C7o455ZTGZxAzD2brrLb4oc1UdPMbSLV5aNXNxFl
         xuGtdlVJMACGB7HWbOnedN35lmLU8xNT1GwXUu0sj8B60uWnAkGuawadxPwTv6CUTjxe
         FL/A==
X-Gm-Message-State: AOJu0Yw9c22s7yW/qCGHXTyqXsmmdrYwFt1c/IWGlMIvEeqiTosAmZJN
	52VTMDEQFReyZpe2Zj9O/JQMPl1ve1pSB4ywygyQxz6h6N0EUuzTGeyzPOm1jA==
X-Gm-Gg: AR+sD12uQBzYguodwl9yoQTF44v+05crAy1NbC1pQ+Tv1xt3tuScqjmS6o63FxPpktE
	I5RzRDNCHcPCSbFasm+uLjaXMI2AMZn51bC88fEMEIiEBMO2z/F9y0CoSwWxpxxCR+2M4J36aD0
	hjZkzdNMqyjQtoPe78Z/sTlNjXZpDoNzL95jul7iCzezH9QF+ZraQUBEEFnsjKLn6Ha+YzQeYUt
	i8/Xv8tIjHN/Nmq8V8YFB9+IayH6nhc/R9QCM4ohfKtmICMr7nr9XKUzhYypNj1q/xRrR0a6B3v
	OVy6it648EFSAKZzEL/ZGIXyGM04B9gOTyUiGHxPU1lzyHyOWyNQI1Rhx3Dd1A7sPyAkj0t2+xR
	DTU5bZI+UQAP/lmazRT/5TDUOBCiQcIr8O7+6PbiLn8FA8orFdVoNrrTzOZbREpZj00JBhgMSn7
	t+uo71p6yn23EWJ8AxARXcilJLJwejrVMwwUm26mVqN9V9FFWDEuFgxu1huxHPJSzZgu3DjTjf4
	tUcME5ES8yttE/v3Rsrf/fo3mE=
X-Received: by 2002:a05:600c:5253:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499a8fc25eamr3729925e9.12.1787080328303;
        Tue, 18 Aug 2026 12:12:08 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:07 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
Date: Tue, 18 Aug 2026 20:11:59 +0100
Message-ID: <20260818191159.11523-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191159.11523-1-tanure@linux.com>
References: <20260818191159.11523-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_121210_357826_AFD8CC53 
X-CRM114-Status: GOOD (  11.75  )
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
index 677069e58f30..3f53630e107f 100644
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


