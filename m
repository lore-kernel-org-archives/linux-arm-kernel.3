Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC91EC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=; b=PBO4HgCUi0ySbaOWdR84iYezDy
	JhkKUAZTBhRLTYF/4d+cc92Gl+ELXcvCCgqWhxqEjSO61KzrVAlQdY0+kOxRl3au9KrKPK5i1nmtj
	UWzb+t//DikhJsXcu4lL9M1votlkTqI2wLCV4bSotdGuAQnfmliOG3zeNVOBWgwkf/cdURbIS1Knh
	CwsYYVlJ9UpYldJX276orqN8KqJuKOB4CWRCFjaIJs+ej5QG9cOw8CA5+1qOAfEGIUP0vju1YCJl7
	aAD+0vX8qtMKFN68LZeCppBmyg3QqxJnX9L1X+pKytYZaP4jl7dL3MfwQ2CNnnnQk+q+4+7UOUdVf
	UP5wGjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dtn-0000000FNcV-2jVQ;
	Fri, 18 Sep 2026 19:05:27 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dtf-0000000FNYa-3WkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:05:21 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so1452062a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758318; x=1790363118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=vtI9ibOjo9mVlSK0r5y0Lx0VjwSyK7R7Lr3EZCYcULdg54iBkG3tiYgjD2w3/q6EBJ
         GkPawLayT4gdxASxJtw/HkWTi4vexmzzMWyjvLKxKLJXpUVp0U39fhjI5/HFcEZy2IK7
         6YKmB5grvIlbWMwvv3pe5oa42Wc5E9IQo/H0ndaEsWvtyCwNabKK+Rxo5EtI3J/s/Zji
         3IuP3EQ2Igyyghwtpa0GK+Id8c9MdGvw269qfg/NgPVjs34i6yltw3GOEjuSg/jxhSst
         YXUJTZ/mEqfAeufYGeb6dRSjDX+l8b5uzFxYncRv1kDZ4Mn0UuexO1PW8jnVGYImC7vT
         RgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758318; x=1790363118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=1m3L9D5lmz/YZdm8ukImOWHZidhl9uMPSzQNMmvb8RG1OiskQNBMjx1nvnFDSMxMPC
         x+vfWDbayzKyH/nUl2G9O/cVm+CyoE/7txie6GL6OoBAZc0ZbjoONQL99K4hpSjY2kCI
         Nmx9o7N715PplFSueqnS499VrmI4Uec5T5R/F6UYyrRE7Su6Rsd/i/sGWIa0Ylt6lj5n
         Kk8QmZUAKhIsyllG3GtrmyOuqVf9XbhrRXUIwBfC8BO8Y1rR9qrfPwjiUXUYRVuIIO/c
         XYeTp6kCVcPHx9FUjXLnH4a5uBb+9l3MLk2DP2MWxv7Vx1g83oVn162Ckm2iAPhjvS+p
         lRBw==
X-Forwarded-Encrypted: i=1; AKwUvBztG2NO0FH4scbym5JzDJPpbXc1z5cXS0vnv6eiU6lnPSkEsrX09Wh5NXePqv99ANJXFc0QpR7dXOUnvEeLGg+m@lists.infradead.org
X-Gm-Message-State: AFuF++kEMDbsxz6yTp9s0Em7G4m7zy77M8LatWP9rQb6akm76qRvMqgg
	i1tjKsM7qnAsq3nnra6jyHgzxbwI0n8mcxMxqL2B6a4aE4IG6T6PftXorTSl/W4t5N0=
X-Gm-Gg: AYBFou0nkInNIx7K9mMluix47wS0u0H5hWWp2aoe/y0pVoGIjjt3a6/L41+ytKbdRFK
	iHWrqPH02SKHF+GQeg8CVkRqVoCzzcPsSsAU5dpGRP4RPFh2gaRrDKpNiaHPyAf0eAJXYa4zcE3
	4BNZCZutxoq5S5oyt0uf1i/SLjVxcXxWDTjZP8CahYO/wFH1myG410IM/ZD5vaYlDmcMOTMg3kT
	6jw0vtttKple4+tHXGNluOh967n6lR9uiNoxVEky6+o4zrPdhWBGtU20IRD/TgM54hD7HbSnw4/
	rm1zblESBj1wpBWJnx9pVLb6El2v8n/GvAKN7v1C5NtN8fuWP9zHkrq89y822DBJf6gtYyRuUoi
	mZiDchwKlcjOlmJfbgUw4ZYYdZf8RvcMRxHTxUUPuOLQ382fdHG2G0rMmA6r+DoS7f3p7Nocxl0
	cNhnsVZIwNS/nX0SmPVFLRJiJNTaFtN6NyF/4HfZymE7kJSi4wPyekaRgPCWq3mW4x8Ba6Ae+de
	JwJdPZ+LjnoMHTwx9eyKJI1Dk2/FiH0aW7LH1Os8Zt0o+a5eMnkICF7h3O0vDwB2w==
X-Received: by 2002:a05:6402:44d1:b0:6a9:864c:9d94 with SMTP id 4fb4d7f45d1cf-6aa5478c375mr2128847a12.28.1789758317951;
        Fri, 18 Sep 2026 12:05:17 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:17 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:03 +0000
Subject: [PATCH v4 2/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-2-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2879;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=prHtn5W9Y5dmFFjTBpt1J6sbCTHN8IgoPCiN1ehs4ME=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtr5aHSDKl9noo06BNkd8osr/Plkk20PdGfz
 j0SOaUFP8eJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LawAKCRDO6LjWAjRy
 urjGEACe2s54bcgCahpxj0EnmR+fOJnSwf4ZNZ9wVRtqSfL8ilwhKiumwUxwy2YxgTpk5bpWT/3
 1vZJxrf2LvN6AYhh3ep9mgX2BiamhruP/E21D5Tr6etaFpLJBGTaoYyv1yMwJku7CbTHpbmtqUL
 PhPcQ6O5HmE0c2hH6Q4FxUH9ttGQPOHuXEOiHvW5Lx5DFTosZEF02Oqkd6j8pnAEsxfV01f4lhL
 iFOfysPwUtOmmRMjsd/Mw/EKaUUSBzUKCeKJfmYvl3GtHS/wLs1znPgC3tlgaMNN4MITbdFSkjh
 RrcW1yI7pXCGBLxVfGEAYuT5VoKuctsq/P9Pxd6TqAo1t8scng5yfntyB+Q0/8An8Qe1IktP5ZO
 zw1/jsLGtv3Zt/Rn9mTzf2chHSZn7ZjMxbhaGOjmCQZ2kacipfNhw2UGWCllzlVpRWAP2RRX0yB
 U4BP6v1ajteQlwkl7zFcxziy0078mVaerRjB0eQ4lUK0YIGVycznhxt0eA0A6+iFBnz09ORugMK
 SW8iSjINmQEpRDL1ZWYahwmTAyS7aPoHAqggEffadBhG2X7/KT4ptnvgD2iJw2LpXpCV7xyllNz
 Ggx37X4pYHc9p6J7ArFQnTRTH4s/JhFBcff9hlkJVzWOdvi80uetjTK4niGSmnwD3TX6oIQlCwe
 +lDj6JP/5sACyjQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_120519_898583_1A981F70 
X-CRM114-Status: GOOD (  18.78  )
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

From: Douglas Anderson <dianders@chromium.org>

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Changes by Peter Griffin
 * update config symbol help with at least 4 lines to avoid checkpatch
   warning

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 8 ++++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06760c45c582c..bee67180e93e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11245,6 +11245,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1489bad527d8e..c52dc955df5f0 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -154,6 +154,14 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor SoCs starting at the
+	  Google Tensor G5 (Laguna) found in Pixel 10 and later phones.
+	  Tensor G1 to G4 are offshoots of the Exynos family and are
+	  enabled via ARCH_EXYNOS.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f125..f2d7cd6eb5695 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -19,6 +19,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 0000000000000..a6b187e2d6318
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)

-- 
2.55.0.1082.g2b9226bbc0-goog


