Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B16C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=; b=XbuGu+q58bJvyr2LsN+IOfhkuR
	Cy0FIFJE6/h/uei5A6B3VouxcgN5mrF1UjIgkFceUmJ8gNJsol7bN0/gZYaB7gK6b2+7gqJZsZiE7
	OBIwbWWL5NHly0BUmD0VbQvFUGXXIvotQc1csNkkuwwnrt4R3LGqm7t39/bs8/ZB3E90UO/oYiCaG
	o0cLQtRg86faA4ewXYk5DquT4rPnLthDjZOxkL9BawawEb93lNuCwa5roFl8iFyPrkTRPBDVbQJ6p
	wWU7OCFV/3W043N8WngsYnlmr0eZybth4QrB7WK6GsJk/KOy+OO6zquNp9/VDkZoy242VZJi4FKAf
	qiuWrrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cUM-0000000FCB3-1zDh;
	Fri, 18 Sep 2026 17:35:06 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cUK-0000000FCAJ-0Anp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:35:05 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so1026008e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752901; x=1790357701; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=v60YOQzTwIouy52GykbsxGqohONl2rYh0UXvXLz3Hd6tFdZ0QWSFn9KqNabOVhg9BA
         vMULe+9lwZ/SA5bkrZxbNmFvO3di9xfltFT5PVfwMSWjfRAHuywz992zZ/9Q0IMgV8We
         IjKCUJsMm3u0LdkYwyCLApRIjEmcxsKlQeTNZd21h9wuBjajsDABBy0JtOcjgAPLbmgB
         WoBCkQzM/q7BHXh9VhlpVkx6VLaB8F9wcb7O6GxlgC681AytZAdruuxdtCZrTsvT1WBN
         TiqPHSoMmvA/Uv+7hsTOGNDk4jbEaVaWFAXpBjexluWtbu07IPdo6go+nxsGWtobPQaK
         6THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752901; x=1790357701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3e71ONX+G/tBeD/v6Wra0d6veIuI4yfjRsJjDPREyI=;
        b=AvGki3M1ceCw2OroNlcmdpUBpVtZ2rVcwzE8zpThIcpH7VQ2myyUFz53/ZOm5Tdo8a
         eXprT3chlxMtcznz8xOxWdmG7F/oxuM5QGXAZJqiEfuFe+BOQQQlP5o7NFxZd931A7Ij
         ye7OFA7FixzC7dvpI2979GuJWdLM1wpeby59bc+zfbYmZIL2WeCaFRpcVpa33HI0fZk1
         TRVKb79Afxd/YSVEDn+AMfylzqjKvrn72i7UxkVsCZ5MNEdFOAtcoY3OyyjpNVQ3oa+z
         MMnD00W7lITO5yaN8zbISxqQTV17Ur2stGdND7xzff/cBamRabQ9JwzS5Awgh2KIgopL
         5z5w==
X-Forwarded-Encrypted: i=1; AKwUvBxCWCHZ115icuxlR4eTaRd/w1oe/Hc70DQwyXzYVvqgcUAvh/rv9gmo6y+D+s2gcnt1wlvOiy/Wh7X6VEvinqks@lists.infradead.org
X-Gm-Message-State: AFuF++kBmTVeu/jxSxT8zm7cIOFzrI+97uciGNdtAKdmJrpthYKA3wGM
	T9NiG66oibN1woobmJkVvASTA/gTgSShYB0OPA+RszSd1AQISEex2p/G714lTUtjAhvz5U6a5le
	DoKdoJ1k=
X-Gm-Gg: AYBFou1MROJ1UPcO2mNXzNEe6ZdDCnUs2EZAS30tAJ628az9RsYiljTLFACGUXVrOJc
	5k0/ExD8bHZ+YHijc9UfV0w4CqRM3gIHSzCXN0RIj3n89VO4URz6+tYCZhW/PaLVW6mAgROa50F
	3nrLs0Us05bvl2tyeCC+PCDTAslrhIuD+SUHfx7dLXYLVJ3kFOsNz/ibIRnbfQRluHljJnze7w/
	2+jy4W1cRNH52gsukwCRTBVx3DI1vyQ9WmzTfdZBlbYXc0ZqZMgydXxfGcew26AOKij22emWu22
	0RRd5kcUZSdmemVH6hKwX0/gqq0fj9vrL5vvEGq+iskCeC/aEkEpsK2LCXY35rJSiVqPqGP0Wc4
	4FJQdxmPwIrZhnbd+0g/N64Mv/hw8J92gkh2t25fLiOHduZ5aRuk8PMNiVq/iMhxOAmGzlLw+az
	eK9wv9d0bEt+SRk6zsuXHMW+i9LV9VD5eP7KUKbYXGjxUJdcyjxan+vyM/iRoxh2pB8L1eAjznW
	QPGFa79botKmSXkoV4k19ZJc0ManSE8nRSYm85SUb1VHMa1QqdCMy8NB9QCiiYMLw==
X-Received: by 2002:a17:907:971e:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c2a15699d4cmr283478866b.10.1789752410253;
        Fri, 18 Sep 2026 10:26:50 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:35 +0000
Subject: [PATCH v3 2/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-2-c94e51140509@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
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
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRXFTEYAGEsoS7MUfIrg6CjdIOaifPmsSFmo
 QQ8leTp7q6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10VwAKCRDO6LjWAjRy
 ug/fD/9Urr6DgBP6/xSBuCZzkbqwlAfIRnR0z+L2WO+ksdtXeV/usopNI2AWlnxNecYkTWIZGJa
 nEg5M1CL0S432JJKZVtOBTqNyd3O3himpBwj8neXDBebwgX61R3vSYad2+Ux1jX1O/Klpi4qnPb
 oOqdhdPqvqxSOVUE2sk8HR53f0KERaeGyP0yrfXHq+bYR1M/KtSQoUGXuqfDH/0dIHedUIYy/dh
 X5jFUZvD4fhLsridougvieTgMWG79r/RcfaeeakcMYvEjU2eOgZWA2vxlhQpsHd/T0aBahZhRHr
 VYTEMfKs2DWxuMakwGN39vpfRy630y/vqTowyXYfAUZqFM8Iw/frDfJTm61WD6dvAB3rVU6ToZt
 pEcem4gWuKQcuROBYfK3PepyoPV2dWpA+kwsYy3tMGkw5z334AP7kqOxBt5A83YssgBip21tv9+
 Fp2Fwgi7hYNtNCTiGOEn9mqSsp6ysDQYA9mf/0b7wIehZUycnJrVRAYijVrhOH2K62bvqeMH7ZA
 8Ini+nFiLhcz+uYLVsqNuJfSY8lZ185M79jJY9EzEVarntgmQhWexSBmttBx74LR64QRnudxm1i
 f5x2MsrmsBrVPnJIml/VkouixLbIM9jrTMEqGSfCLiDTtIrDIP1Bh5z7dE3Icy1rqDk8mVlHF51
 btmyUow4Did/arA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_103504_130698_66673322 
X-CRM114-Status: GOOD (  18.89  )
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


