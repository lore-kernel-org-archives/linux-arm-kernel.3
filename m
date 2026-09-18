Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88859C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=; b=ED70KWjgTvajpyj/POkcG0ETuT
	a5lrBWYYzkq9YD6eqR0pAJBvfLKnLUselYochLSvxXyyrh1wHPJHKstcpjKrPOPpzGMEZ0pk+ox21
	NvdMw6GimgsUXmMDj2oiJY6PkQ/YC7vF/XoFGYpo2+HkcdBiPGGZl1HRWcRBLBfvQhBBIoabVB+4Z
	qy2ZMsH843r8wcQ1IaXXkQH3IH4M6aVBeo7cwCGVz2fiN28YwlqQtfKtkKX8f3VgsJAXAVMP6ewx8
	dHooUClG640zI4ZB3oW/YKozBFgtTwsvm6W9BDJxBMHC8lEMkPtTe+3SKuGn2/WHWPy8gOgrnqpbD
	VL3uOzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cMb-0000000FB34-1jfm;
	Fri, 18 Sep 2026 17:27:05 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cMP-0000000FAzG-3PLC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:26:55 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa4c24cso163803766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752412; x=1790357212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=IAq6G6lhlAUbBw2LP/8F1GyPqK51zeOEEIN/Qv9IyE5ZUE6OtOjIg6Yvn93chn4HKF
         ODlGT5WE4lAPyDZZz+L7b9DXHWKxhdLy3RL+2BicsFHBrmtP+OhFYqfb7tWTAWFF5aGX
         Lm9MTZBHzeCff1DN14+xG4PeiTXrqWUmA8OzQ4FQq0bVnbfTXTVeoSBHUxG/sYRxvP4p
         SXIzKpvLFv3iOvljo4ViK9OLlNKva52gv93bri++7GYpNI9JEwSOvT3q544bdVsr8Hol
         3gDJcviyHFC+MmdA0MR9J6SgR9vvx5XhoGIBsY9O5Lz4BG4q/OChsOEo7r/ClnWegBHZ
         pXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752412; x=1790357212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=I+BJWCOHjr+vqxjbX/7c5cxiDn5auSEM5MyQ3SQEBPC4+Sgn4joizf6Xq4SiQo037Z
         j7Ghw2uUf3M6CT5ipuQFisxNEvYfvdszcwYrBaZrZtQSkDQrFyC8lhZMnbYmJ0p+B8IH
         9CeTuv6eSm3YB0Pnu/HzGOsiVPENnO8NsfLbpQmwXM9FJtz41O6iSyVl7q34EzAeFYY4
         opqMg7EAgQFoZZtTfbWF+A21R+B4VdyNj/eKLljHU0dDdGepqwlYwyRA0F1QfMcA4+MO
         +pHxkaXt6avCIRwcIbhhFu3QaVG8KNi3khR69k/+3lAiQFtFG33R0CPh2gIqDb621A2L
         tArQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvrNlj7D33a0uVGmEaZ9HA8/IiK++DhRhiEe2DexabgF3zWogN2u571RwxaZ+hASFp50OCnYfUPlAfcYAunXpy@lists.infradead.org
X-Gm-Message-State: AFuF++l92p4Hza9be84c7VANzFAeV0sez1lwNKh+cYtVaxEooFtmtMFG
	cJFlUxaaWrppX80y++hbvLOxjVDmI8KUaoTLa8anWsx4mseQi05DRtPNFVxuVIqPAUU=
X-Gm-Gg: AYBFou1DqM+jw6iu03/MZo0+KhhlRk9Oayl/eAAXXF3Kp1ekL92q35yiIw0rW1FaT00
	cCpjoFGRriHzYwoONfUIJoYAropQls3AVpQD1vtkb2ssdWStZPTkp44s3CdsfquD310HFWyc7dB
	fbO6VxOzxeU2kqv19ivnHsWmduL/jwp8SzfmilExj9bFg/vJhgC1Y4DR+357D68YTyF/rh1UXuB
	kDMWD7hQYMXl6yyOK7bJ5SixWeyYF4Srxz8wzvZFp46k6UsK9k+zCMHlYGi2ReTa6RhMjF/h97W
	Nmb56gm70jaw8We4fMPg1wt5vkvxjQkOGGme4Q+WjN9J3jX9pn5qoPfVF5GjJAILvGX0RYox+w4
	AQLRWpzsPkL97Gj2p5P8crlwJNyxYhg5bPDD+nfWHTg1W/SYuZLvPdbV6RCn1+RP3wu1n25NCo6
	Ob1u1aq6c4qRMgXUwu9qOoDIy58TwSDhZCwbUInB2xVoFDTMymFOlGI20y/4TDEuPKOwr3f6oxy
	fuA7zupNJDHmvGmTdIRoXZ7mLLjZ+Aft6Hg3OpI4sFrGn/T8NZgcWoJv06j2AKdRuI=
X-Received: by 2002:a17:907:1c91:b0:c29:386c:58f2 with SMTP id a640c23a62f3a-c2a15e1ff48mr321275466b.38.1789752412145;
        Fri, 18 Sep 2026 10:26:52 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:51 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:37 +0000
Subject: [PATCH v3 4/4] arm64: defconfig: enable Tensor G5 SoC family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-4-c94e51140509@linaro.org>
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
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRYGuQ5/L4khzKLHRvREUl1l+2lwJGoJSQiY
 SGyFcbuWBCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10WAAKCRDO6LjWAjRy
 utArD/9uj3S4/40eqQyAQNg2mrd8YRRLVD2a+iFnXlDd04AKI6CyH9Aw39xkFrcjJfJ4hkBGr+C
 bq8pFZNwJu3DH6NN/ZgNqnsiuxemOfw/aUIO1dpSTeW6BvQla9JT3YBduKlaAStNeV9HLWE0cdK
 FGDB8mVSVVJ0j/jYlX3BOmNAium/Ewfw9PI0ALpuXmOJ60HZabfOMYnun2JV43MuRmmJx+smUde
 15IsHXU6GQ15cwQFp56h5tCUisTYD31g39lmK7iD0Qpwd6BC7U3SEFO1LiorExYEECyq9C7h+Mm
 ATP1VxNycE8kVWDXVD5BlcWBgeQeyqFLUcp0wexvmyoxLICWQGWrCCnipjciOVlKfY4Tc6OyEbG
 vrlzf1SPtQJMDhH9y26QfsrMaVvnVHHdMrhtrFblU/rHj/mP0MkdHSSktmN0M2Zw/iXgUpfbzBb
 Sgiz3ymLwkb57NgSqWh4ZEmseH5HGA1gI/D7/tMq3a35ZQZsASN2N8vyisAjaCNPSih+SmS0mfT
 RnVnZKuvriyPYy0oGMaosjltQVaBzFjx9Ok1WALSvawKVkVkIzo6Du0GkfXaO6QcdiwsAHRhkz8
 8q31d2t0PWWn05xdNQ7eM6h+2MYYbGKpYmzkwJcNXA6ObhSV2vGM73rn7RO/wrqM0hT1uhF5d2E
 A+fovbmpX/pet2g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_102654_074193_076265D1 
X-CRM114-Status: GOOD (  11.83  )
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

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb66..75000c12ead03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y

-- 
2.55.0.1082.g2b9226bbc0-goog


