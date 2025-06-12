Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D5BC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=; b=JMHEmKkWVMYmYmMStrTaH59X+I
	0roDZ43xT1R9LzqAp4zb2RWBoBLAgK/IGLGY/lCfWTgfvHJ65nCbFz5ER4D1GFnhnacVJR/SqWRnH
	DMtmyC/5CXwcky+AjZ4pCAxoGwc+NH3ph1zLEteP9OPVGIq0j42KyQJ1gywWC8+bb63LQV5tRa3qo
	GTUE6oQTmdIYvCeB+z/jh+ZnEfiQjUuZPsLMgF8LE3hfQBflQTyy59VLfZKEE5Sw0b/8mSCCeu9ea
	uE3wGwkKHZF5FS1w6iTRl52JSRRrApEDwqp02Nw0s6XcsZcFn/xDqOVMmXj09RkqIWobPKTlcE5Ye
	VIE+Vk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowQ-0000000EXHK-0qIl;
	Thu, 12 Jun 2025 20:54:30 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPiEK-0000000DV6a-33an
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:44:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso50013f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735871; x=1750340671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=nqSTyrdKC2zxdpc/7eE2IAUZe4a6dEb/8BwstSlspcEpmpmeSIGmpIDPu4SYnIj+Es
         g7OftiJpxkRzRvorbzmfkii6bgMfUK4a9BmvWlbBxEWqb+AnKs41lckW0O/Q8amHnvKR
         Kn/OJ6hF6FRxwkOIfCNgmz6FO9OIPjjuJzGXQwG3C84QSvfeZB8wbRlJTsKVNOHhj1tS
         fT34o+S+aQqn9ytuC5Zje6KkJG0zaa06pK88F71jfZLqXxqK6S0kZ41SdLhPF6wSEaus
         DDzL9RC+Qe+9UyYYKNaHYA8WMK1sfc4MEuRs6vDn64bPkvFuHT1rtQEGduY/FMjZ685W
         SxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735871; x=1750340671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=rLlc09O38gJlse08KBP4hdjv0cfnBFDSvzevfyi+Y9BVD2H9YD5IIccsdX74F6sX4J
         aUeQ13u6f7LmXeg4iVMs3O1iAswTPatdqsqM19kxQ/6GNIFz2CVvUSxPKv3S4iZuJd2Q
         1J6sIs+c2afibh7aXPRy8bBypElSx/s/j0yEnS65daANYYznpSRAXFXwpGx8DLchhCw9
         s49FPUy1i5vRwR7Y1RLYWE28WwvRVBzkWggPh7LRfcC1NxwxgcIdngWj6R68Y1c9Co83
         WMA0dzWBXaFZyKstrFSkciCaxc1og3LjYyOZd08KkA/TYgT2s7RW7t8LxmKerQg8x6Kf
         bE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwANPU3NEwx/fdpnH7FH1RAbawPgA0ttT6Gj9OZHN0yFK0jaAMUFB4C480SUVdFtS34dXphtd8GyV46L4HEnCs@lists.infradead.org
X-Gm-Message-State: AOJu0Yyij/PFfUtVTOi1i02BGPVyXd6KFuH+aQfLLZvv7RiAUFl4q7eF
	YvdyGH8T3i/zUX+fo5hr+5D4GKBAc4Ka96DbrAKaXxWxbojiN7OBm4CdlJxkjfx2j30=
X-Gm-Gg: ASbGncsuF0GHmKHw6whTIxIv3tofjV565R6rkoFSKoh+8Z479OEd4bXqKovGbXKl9RN
	KJ4Cb+sPlUYb5+YFDrsCT/hkZORIXl6hJAKOFgjVvf0RYpy8mUriiA4HIQRwpONADQZKmQcPyhd
	SUALIZ65QYqCeZtczxjhQ2k6GMrsxUZze64J/UfNlzDLbBnWe/KQN/SyFqeaI+K5JLo5flTFv4f
	KP7RcUiI07ATLX+YX+uk+txPwjmNm8210UpJrbQgbWEgpxVmIdjvQLBYZngdOM8BI3LaIbXAUvc
	bMMZBryHOODs8dx4Ozyo5Q5BBZ7BtrzHzQkU/uguXuJ5y96HC1aKwR6mglQG0NJfo3/ZT13x0IL
	0vlrbxm6x
X-Google-Smtp-Source: AGHT+IE+fhgoMi57FWpyHSYtxYdJ8jLOUeAusqX+ark2CzDRRR4iGxpFzDQ3xzR11gn00SA1jvJm8A==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a5586b8858mr2485885f8f.1.1749735871092;
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Date: Thu, 12 Jun 2025 15:44:22 +0200
Message-ID: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2107; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=fmLKNgtKcJwjP5FDnh9DbIUvWbuQxYQ2VpHaBRIju80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm1fWX3mgWeCfVDeyKr/swV92niRZ1QIQm2L
 x0clvJz/4OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtQAKCRDBN2bmhouD
 16UJD/4gbBqdnKUQ84IoVn0fZjjNqBAcba0ix34ZycfQc2PNtNzj0qZHfGCJGVpQOxzcgkoXOEq
 jhWhHkYFtIo6Lsg0VwNqL/L3ekD4JJHQGo960GpnogiLCrnrbpxbshD0lwLcbDRQXIQjLWt0tQj
 fKUm5PbsBezIb+pefiu1vvOmYAVgD32POwCeudbqt8eq6Zm2Vx2tJ6uWY+oSu5O+7pzdMNNFePK
 7dGjAVGZ5KCVNJozzdJhZlY1YGvqXQM5oC8q1P43A6oo4Ie9b5V0JsNahMzjraH5cludNg96ZLC
 v/4snCT7kkqVoiOHeiPRPOSHOQ89QRyEz70ytN9gU7ZtO9wEKVq6t1uF6EIhjG+BIvELqdO/Uah
 HFLOq6ud/MkyU+F3euRxLvrUvNotkQHr2yQyQY6BGRsJKxQi0jodb8ePJA8KOajiIE4KEUry0dy
 Fyyasl030WAwpGABh4Hf+bd7QZYRerUBaFPYpplwas95E50QgGjNnDDMm7QbPoXiIWFmGA+Yw3K
 xIA4t5W9xTZFf84FQgC8P4MaDrkN8qDh1d6qXTtDDkYqklXdv9bwKe2seNkDmzbY0vziJiDXXDS
 hqBYYohbVXBdyN1IWxk1IP1NQvbo9nwur4ejDfTY9tbEJVoyaTO6gsebVFDwtW/m+FAC5Wu1SJD wDzMrRZ67JlN7Ew==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_064432_776990_29D631E9 
X-CRM114-Status: GOOD (  13.56  )
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

Sound drivers are not essential to boot boards or mount rootfs,
therefore in effort to reduce the size of kernel image (and boot images)
switch the ASoC drivers to modules to decrease the size:

  vmlinux: 152864 kB -> 154528 kB
  Image: 39391 kB -> 39067 kB

No difference in resulting include/generated/autoconf.h, except making
modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
SND_DMAENGINE_PCM.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If patches are fine, I will take them via Samsung SoC.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..14fcd0a85f5b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -979,12 +979,12 @@ CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
+CONFIG_SOUND=m
+CONFIG_SND=m
 CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_HDMI=m
-CONFIG_SND_SOC=y
+CONFIG_SND_SOC=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
@@ -1021,12 +1021,12 @@ CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
-CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_MSIOF=m
 CONFIG_SND_SOC_RZ=m
+CONFIG_SND_SOC_SAMSUNG=m
 CONFIG_SND_SOC_SOF_TOPLEVEL=y
-CONFIG_SND_SOC_SOF_OF=y
+CONFIG_SND_SOC_SOF_OF=m
 CONFIG_SND_SOC_SOF_MTK_TOPLEVEL=y
 CONFIG_SND_SOC_SOF_MT8186=m
 CONFIG_SND_SOC_SOF_MT8195=m
-- 
2.45.2


