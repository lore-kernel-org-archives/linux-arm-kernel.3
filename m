Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE63CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=; b=KmMKYHFpXO2Vh8Bszo3AVF1pvf
	fHOt5AUxwFfnlFFGFCBTPJolOpyJddgQxPshtMovh1ta2JUlFunwapG2RoTgt95Xg0zG6AsXJzvJy
	A7/cwMoLg+6+swYP0xhyZ3HoK5gFbkyOlr5WhTvbpI4hEiCMX5XHAVZWRLEOBrSlDHjIb84bYXy1n
	7fVOjeIvJ3QSh7cClGqyjLF2FQYMEkv3J/+sifTk+UJwCPbmDkgA3G4V4lh7On/Ll/lYpIqxDPcXP
	Fi5sMhhmL228GUQ581WnfhE8P/pZzzQBub1p4Bp4RjfIVwLUpgWpLEQh6UweEbhdYbmbo3O9ik3Hu
	fCspzWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4F7-00000000wAX-0OIP;
	Wed, 29 Oct 2025 11:21:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ep-00000000vtU-0hPt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4298a028de6so564389f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736869; x=1762341669; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=sFhhiKs4a7vLw2Qbr51YrovqyWhUUhBmu9zaG+VFG8PtK5nlzWZ0vB8GpRRUuM92x3
         3sXzj/CAAp1RzezgJ1LW8BAzW+n1+MJsVnTj8fic26ELC+KZSDyJxzJvucckjzZfDNKj
         IcV7VwLWjCTFW8Ihf+ZQDfmh9F6II7acymMHG6xRCmRzfEfwKwF7JDjNYUU9ZTLaPs49
         r2N9HjsW4zKrHBlUOJAvWGeircHJL9ka5k5feZm8j75kU59xyJRw823EFMX/mTyAUOty
         SK4BWr/H/DyI0bvXsQdrZrojB9qU43EycjlVivjFZrD0l4wrRVqT/9xLpmm3V09U2y9V
         mcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736869; x=1762341669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=gmJTVeCuyyD+pvOFoB89HaXXAnrOC1/d/ZKDX0r7h++poR7IKYSwL7bl/JoifOIaXo
         g2De/N3WWAiAS/Baln2Y0ob8qiMnVqB/Z5aB0en+HZJljzxrbGrbmiFi7qmUfhbPOJlb
         x24pgESnJt2sJtMIeYlZBgbuyBhWkcXhTtDUi8MIG+O4orkJIkQYAwVSP3VbnForr2Fq
         K49qFeyFcFLc/pDYms5hhDU4YazpftoqoSkgWktgJZSq8gMzMiCfE4J+tLuCZ/DdOXWN
         mUd/PVuHtH8kAr5yBS2Ga9msmenk1153CaxiTGV5jvlAKXjfk4KbMsszz7XjpAw+O90H
         dPBg==
X-Forwarded-Encrypted: i=1; AJvYcCXUs5WYNaa1MbI2jxjC6Ln8/hKYhuM5ob/YWY3kF9EmAUsyrHw9yYEz1aqSKLJm9sFPngIFUbM5F3LgbZHUzExY@lists.infradead.org
X-Gm-Message-State: AOJu0YyBBcCgCTge7PyGgWdY/N5U87Xkxdq3Fm5dM/mx/kNSEkOGXSgO
	eQPXcaT1v9GeiR/z+FGyLh7EK8P8nGjnMznDkfy8s/5tzoS9ASUgJWfxbG+PuViN7fE=
X-Gm-Gg: ASbGncu3IOiUSkbrx7HZiDuemOiwMzsJHymMKR0qhhu/okwbnkUIvOOsn5qGHSsMuOy
	HONOrtyAmxNsVitxZv/fKu2RFlqHnGbm7cVgO768e7DBf4uPagDaLsDaJZzzKhDaRaql75gYxmo
	DJOPK/9or1sCWdCJx1wG/lvgEWtb03emyea7CiU7hQeQ6c2oUwLZUyD8xDOvFACBR5j1zJVLlIx
	evdz8l4lNejtjyHJJJipR7oBBn5AEnz32oO4GS6F6sycOBwTP952HJQugp88QDX46vptqQlhKAh
	HmvohGNg9jT7+TTkSefauGkEMiRhgam1uu39dzQt1oSSY/QKgO4NtrN68MiZO9M9gaf2/JEY/Gn
	kv1h/dgNhCXzN9Wa8MYY1+LHYhaJuq9TuyATsQ5MIvvBuCfMUSrI0rvVIEfxQBoP0mc/DZg==
X-Google-Smtp-Source: AGHT+IEH6NN9LOg6FLsVrk8zgYabLR8BtA7vsvA+Q2uvBWc5oO4/7h3wh8g96410ssV5WtlYeIfHGQ==
X-Received: by 2002:a05:6000:611:b0:426:dac0:8ee8 with SMTP id ffacd0b85a97d-429ae8edeedmr1897555f8f.10.1761736869351;
        Wed, 29 Oct 2025 04:21:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:43 +0100
Subject: [PATCH v3 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-7-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LQ6GmHpD/iWFySPYiWNs4nA4WFevXV0FDAv5KxrY5e0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXPD1vu8+WNIIVkn145b8DPfphfMN9ZAQUf
 MgZmrowGRSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 cj+mEACXXeZt45Hp/bebUUP9FRIuCOwBltkwhyGWvMMx9PTg/virvsZSWrsbCDKwVHowTsugvBo
 ojQt+rBZx4fjXjEfaPniWVCRzIZBwM5eYEiyARKHMY5e8mRvLiwdRsDQFE1P/9IHy14ZVveXK9F
 dUGwyeOmdmwcXT65FhiDhn9+GIvNQ5BxaVKUqvfpeN6WThs0dx130XdGjauQ3kIhUdVyXmBpKnw
 L6jROZWZ3HD97GiGvKPDkUW+7DY3DMnl9Zt5F4ttq5ABoz1gUpfpo4VCb9E35lERHQkhJfIL9cI
 YyOMKGpPyeZ+MD3y9yb71MS4rRM+nKqK3oo/G4iYMZjaqjeDM2SgUI6QlOLfpDn5w6cabuHYD4O
 C2EiSXMl+dAzgifvoBldvNEZx1WtgR/sT3kTyxA01JX08FpSCP9pSbhJteuinINVnQALoyg10/f
 aho6Yi47ZdyDhExR8O7KyiLsjZkxPcDpP8ZymCQbRCn98lEVrYoVodLR9uBZE6ZB9yaijXt0m9f
 WkipfJMeZToVjn4CZRYcOkQ49nDv4C2+sgpy1+G6xu6Aee84B4Sb2fqa8WEKntpKBqBiLkQWT0o
 wLWY9t5n/E2aWM8d4UQ5uLNXLRj1PgYGAiX3df6Vv0NdL722eiMaLZj+DdSEmMK4s4zG2rQFsi6
 IakNBGvF+FN3/9w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042111_235830_3914E95F 
X-CRM114-Status: GOOD (  11.65  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some qualcomm platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -316,6 +316,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

-- 
2.48.1


