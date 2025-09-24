Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B8CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q74mWuldAlo64ndeRNS24oI/Ec4V9vS4ecuV71IZKSE=; b=3bT9fERCxNnxFR
	+ASmJYnDhS0x5e2r8wXJT4BNuHaU5ZlAl/+/Alpt9MRNtNg1aa8IWLO4pUGesmbaxrjYcUazCu6vV
	qREQbmNGqnrYrcSfb/4Gc6SkC3CJX0KNnJAx35jFxxKaMnA+h075I1wkxuKMkLiQo4uXE1gA083aJ
	i8Gj0YyhHijQKqC1g4oMX4aFEFWtQLsL9YLDzYKOfaXEpp9AFGlahBjxxSq2uAxz9Jd8CNiuPh/QQ
	m6LVNHHtbvVq5QFxXsVoQJgWZ4/Dp9bg8jixlkNaXi3lOciM/ED2aAN3DfuTb+thHXOUflwGChpV6
	CAKw5+XVNS2t+GnOfAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqb-00000000t2B-1xLO;
	Wed, 24 Sep 2025 14:51:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1QqZ-00000000syD-1m5J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:51:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso846412f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725513; x=1759330313; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q74mWuldAlo64ndeRNS24oI/Ec4V9vS4ecuV71IZKSE=;
        b=UVXDwH0FPhULT2HbTWPxwXxj3MgWPzV0egpx8WXz34jvvBYHOHUvwCFIuEoSXLnxi1
         6KfGtIeX5sVyx6ML0DqdPUxsG97V7zeEuNzzU3DRHQjo7sMbG1Byjl0CgHTMbxRoRU6s
         k4MFR6sPaAKHIiDycx6AzSxcuYW1Rym3yvwM/5KTvoqNxYN8xQSIsE55dPnNbsmMmWKE
         MtA5OhBBm/h+h3QBif6RCGW9lefyIGgGI0Ev+LsWTjwPOOjBJYlXh8CfMNnNkB5/OUXl
         lvl6xfKhJa38PZG1X/S/KtNVi6/izwfM3WCDIIKDV5VKzwMn4IQWpyQVPo4mXk8aXduX
         iPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725513; x=1759330313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q74mWuldAlo64ndeRNS24oI/Ec4V9vS4ecuV71IZKSE=;
        b=VW17Aq2E9YhdqgALP3HpmMLF+XFcH3lKSxz909PLG0+/au/zx3ob14cNj+U0qU8un+
         qbGCbKkT/VaRYr44KTppCxg2PtlgTi3Cs5tdzRCLn4PBcKXSn3pJq5MvGG51UQie8FY/
         62u3mQcf03lk0acGvK/S0/pLB/SKAB8WiGKd4DkKIQMm4bP98ZHZk/8hotDK01uhiWgV
         4tNQZqbIKDSBUflVFoVgRni9SmMFI9spqAUA45dyCmWjcqHGwRrQS+5yVxVsem7XY6Iw
         4wSXT9Y8hdcGlixglwQ3v+B/1HP6aOJybu4RqeKWXy9Qc9XUzJimefUATzCV88riek5M
         kT9w==
X-Forwarded-Encrypted: i=1; AJvYcCVFiaJg6IiiYaV5X+Ej2Ljf9fTrcVPvVS3Nwz2pcMF1HU+Gf7E8pG/QVD84KuQMzpPQMZAwxgdbnR549QVwduSI@lists.infradead.org
X-Gm-Message-State: AOJu0YztqIEon+szF7PHijCp7xnH0tGgOHom8gSaxLz0zjmV59+41DOv
	Q2Y0LVRDfmzYq59PMdsE8UtMrrqjjXJLI+glLH3kASqwibKmHQ4tqkvPLqZTbHfgRiQ=
X-Gm-Gg: ASbGncuQkbST/YO1wVyF/JHn5bPspFNpKj0ajCbeNyA6vgydBEmi/8BTUT73N2Gp/MD
	RWOBslLQuFTYTRlF1a6c1GVsiBMOof4F7HBdTfK4Ez8DW+GYtw280bGte1jsgy7Aozf+vAZSxRn
	S4VMUCKAjakaISeEcx+QZyiOMg0RyUNzGF9sRvwlZMga0nCWqWaywy6IYPxFlkQZeluBWJWZbPb
	OvAmaLRrDXuwzR6B1gjBp0OBaEls3Q/lImGQJqfDC7zxKHuJMfIDv2C3HBvogQTv/f5tE8m1BUL
	pc5cFqTkdpb5c0PyCyjJXQLX1eD4u6FfcjK/MjjZ9ccac3U8LxOdQ3KcV9YyhGuOtXtoywG5xuE
	4o0+M0CxWKv1/A5NvWQ==
X-Google-Smtp-Source: AGHT+IFQeBCV46NXhKbKLlcmg+QGzwkfzCrC+Z1TfxjaOV8Luib9zmG856AySVQTu7v+7Px+UQrdaw==
X-Received: by 2002:a05:6000:310f:b0:3e9:4fe4:2621 with SMTP id ffacd0b85a97d-40abdea7feemr2892437f8f.7.1758725512830;
        Wed, 24 Sep 2025 07:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Date: Wed, 24 Sep 2025 16:51:28 +0200
Message-Id: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAF1GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwML3fSCzHzd4ozEotQUXTPz1GRjUyMLC5MkMyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AO4oTHxiAAAA
X-Change-ID: 20250908-gpio-shared-67ec352884b6
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
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4112;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=84D0nu1o6zLXy7/rW3cCWSeFHZtjl2QkEFrkBynjieY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWFf+k+eImY9E3OI4PtgZTFadj9Fn4NB0Kxg
 s5bwRG+2vSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 ctapEACFn/UkK7jIWi7jXPt0E5cF3KVi5VZGT73mQQW43dksQn1fyC2UVMk8XaulHFGwvLw+yZb
 wj4R9fv4Bo6siyXgTWKeyqcU9YM8RNpwLwG0YxHucWJkuiwTrz0H9sppVD8bf/hSinh/XXJlWQN
 41hwSgWEw8weBI+Vf0uFpxVk6dVJ7dnKZdqW3m0l5Xqjod6Mkpwd+vGxfswA4LIT1viIxQQax/3
 fOQ8PacaVQm27KXJyr5zL3qdcwzLR8Gy5WL6sFED2g7RPJTaCDnGiWQTQh/XuKkScJ7U6Nl7fRL
 r5387UfAFhQXv/Ez2UX5FTlRnlLwZuMi3mKu0kZ3u1oAae7VfhaUh6f4RVx0WWhUjyNCgzRiVyy
 y2ZgIpPJWoQPH0m6oozMhINnl+z/Ulc/+s0119GRjmrIaxoqGz1i1elFN0pEojZzEQ8Yq2OF951
 lMh1H61C1bxS6r57/+Wa+NFeY8mboQx1b0hkUGmu5quMUqmunlrJ8NwpjUKxQ7+zyHvAODSefXK
 E/zxac+j4MtxBpwS26bGEfI4dZ/HhLZDy9c66naiSnKICVXDZf+cKKYeZEk8BE1fbddl98YP+13
 zRR6vzGIJe5aPsNExffDFrWtRGZswH8oIdIO23nOkLi/f9W6AEmsc1FVJU66sL6MF4dsBxfSafn
 AqEXD8rwqZdzNUA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075155_617444_366F3FC2 
X-CRM114-Status: GOOD (  22.48  )
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

Here's a functional RFC for improving the handling of shared GPIOs in
linux.

Problem statement: GPIOs are implemented as a strictly exclusive
resource in the kernel but there are lots of platforms on which single
pin is shared by multiple devices which don't communicate so need some
way of properly sharing access to a GPIO. What we have now is the
GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
doesn't do any locking or arbitration of access - it literally just hand
the same GPIO descriptor to all interested users.

The proposed solution is composed of three major parts: the high-level,
shared GPIO proxy driver that arbitrates access to the shared pin and
exposes a regular GPIO chip interface to consumers, a low-level shared
GPIOLIB module that scans firmware nodes and creates auxiliary devices
that attach to the proxy driver and finally a set of core GPIOLIB
changes that plug the former into the GPIO lookup path.

The changes are implemented in a way that allows to seamlessly compile
out any code related to sharing GPIOs for systems that don't need it.

The practical use-case for this are the powerdown GPIOs shared by
speakers on Qualcomm db845c platform, however I have also extensively
tested it using gpio-virtuser on arm64 qemu with various DT
configurations.

I'm Cc'ing some people that may help with reviewing/be interested in
this: OF maintainers (because the main target are OF systems initially),
Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
in audio or regulator drivers and one of the goals of this series is
dropping the hand-crafted GPIO enable counting via struct
regulator_enable_gpio in regulator core), Andy and Mika because I'd like
to also cover ACPI (even though I don't know about any ACPI platform that
would need this at the moment, I think it makes sense to make the
solution complete), Dmitry (same thing but for software nodes), Mani
(because you have a somewhat related use-case for the PERST# signal and
I'd like to hear your input on whether this is something you can use or
maybe it needs a separate, implicit gpio-perst driver similar to what
Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
last week in person and I also use the auxiliary bus for the proxy
devices).

First patch in the series is a bugfix targetting stable, I'm surprised
nobody noticed the lockdep splat yet. The second adds a library function
I use in a later patch. All remaining patches implement or use the
shared GPIO support.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (9):
      gpio: wcd934x: mark the GPIO controller as sleeping
      string: provide strends()
      gpiolib: define GPIOD_FLAG_SHARED
      gpiolib: implement low-level, shared GPIO support
      gpio: shared-proxy: implement the shared GPIO proxy driver
      gpiolib: support shared GPIOs in core subsystem code
      arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
      ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
      ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup

 arch/arm64/Kconfig.platforms     |   1 +
 drivers/gpio/Kconfig             |  17 ++
 drivers/gpio/Makefile            |   2 +
 drivers/gpio/gpio-shared-proxy.c | 328 ++++++++++++++++++++++++++
 drivers/gpio/gpio-wcd934x.c      |   2 +-
 drivers/gpio/gpiolib-shared.c    | 481 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h    |  71 ++++++
 drivers/gpio/gpiolib.c           |  50 +++-
 drivers/gpio/gpiolib.h           |   1 +
 include/linux/string.h           |   2 +
 lib/string.c                     |  19 ++
 lib/tests/string_kunit.c         |  13 ++
 sound/soc/codecs/wsa881x.c       |   3 +-
 sound/soc/codecs/wsa883x.c       |   7 +-
 14 files changed, 980 insertions(+), 17 deletions(-)
---
base-commit: b46f7370d4a0f0b55f05b854e73b2a90dff41e1b
change-id: 20250908-gpio-shared-67ec352884b6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


