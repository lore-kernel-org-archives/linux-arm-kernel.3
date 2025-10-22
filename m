Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D9ACCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6QXbhE5WpAHG+UuY9oJTJMeHQhbXeGIA/P16dT2l+d0=; b=xYNvctdkZflsPh
	qVDVD6UM5G11mN2WdZ6AbtXxGMf1S2+l0jWUFAi8npDETh2gKqxNzyHgkB9UPk/4iy61SLGYjbw9A
	gsIrj0KKh+Lxw98Qo1aj19E7xnBrMfxGSMPBRVackLLHo5JhTTLHMKMhRyP0rbEzj9zdmaKRdmsDn
	CZkN0vmL1U32aljm7dmBEdJikOqQwRe9POg+J6cspnBzr5y0BOcL7iLGD/TyCTPod88SOEAXqTiOv
	gbnMvdtaswg4usxmk/oIA7zOaIq7jjQQP1RhAs2iXs2uaObsYsj/YVP/LMBaGPfYD14Vu94V6feh0
	ZLzHwxRQopIeahec7rnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcH-00000002w4o-1Ffa;
	Wed, 22 Oct 2025 13:11:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcE-00000002w3q-28qW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:11:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-471131d6121so52263095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138657; x=1761743457; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QXbhE5WpAHG+UuY9oJTJMeHQhbXeGIA/P16dT2l+d0=;
        b=DwBaZiuHatXJdVRr6kG2iGAEk5y+5No87j0fODUWC8isk6L4EVDL+fE/tdJ0vhbSkc
         IVsDXzSTw+4w6mpbhB8A8V1twjyDmxXS5N8tpz7WhdrvMjee7ArAN9XMbd/neKGywmAO
         bx3JgYmajuJjANgG+V6OM1B+qK2B0cULxI+o3AMXZG/o3XqrXEXUTW3NDm3vWzhdbivJ
         E2QbFk0VOP/qIXSpSNMPKyBGHs/gYPNJgztmptJds2QVaqf8H7Gadq4xnImME9rluACA
         +0rgZO3zyvHwu8GdyUdYvsi1Mf2ld/+ub/KxVCXCKGQFku9KiVtO6fyjRvCs8RDg0x/N
         Kqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138657; x=1761743457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QXbhE5WpAHG+UuY9oJTJMeHQhbXeGIA/P16dT2l+d0=;
        b=XlR07w+MfLLb1TM0OZTHoV9ffBl6CjNi1JL228jqoSn+8MCsI0CeyJuzaeQWXGV+2k
         qwpMl99N71GP8dQO4Nh7izOKcGIernkDpzXLDx+TnjBEH1tutGY/oRDh4W9QTTDvw8Vf
         AZTkLDpGfpDjWhs+kqo6k4W/1/FYYB8aVgSDsarjqHciiaWCG4P8Mt8ZIx3SI3YbBnu6
         FEMYjtp1HuL4qeCwVTdWzOCh7CflkaySwkzYtbekipGO6QrNZkCJwkzaxiNViJSNwczK
         iVgiNXZ6L9npHcZpkdZOxgsayZFSLB0YyDzuNjyBeiKONPMuv1twovfYmPk285H5ldow
         0Cmw==
X-Forwarded-Encrypted: i=1; AJvYcCUXS7ZkHm1saZfNnuWJrNYObKOCWP6z0HqrbOsj2q61Yy9Bt79z4mILb/Gac13DupFoTfXrLTz0pxYXXHeOUDdG@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr0ozcdvyS/JvLHfOPo2HI/av5+fag6Z9n3EnSFr84Mg9DpnN3
	mAYdn1tY1MuKGosPUF2wxq4FYGfhhF6j949wjvA02zinSbpYCQah+EykW+6i1X4Y3CY=
X-Gm-Gg: ASbGncsI7jYYCledKFmpOdDzcUexEw62sHoxZbQXp+LfmFw7YJ4kUF4/gO1hzplTqbe
	+Fn/Z0gH/i4RiIOooJ+v/fiWG0Kcef1SI5kVITGI+lq48hWytgNTmAIvN5W60qNhgHfxGbrN8kM
	ebuwcETY9oHIqeuQIus8zA+z+BEW0ck0oLbXH+WTs0o3iFJckoWVUp2wePjFmuH/W6VlnKpBDeN
	aV4tQ6thkdApbMU4novvxuZAJANpTDLm9cE7ccxAjkUR7gWDgN7TmJy69nspT/3FXQF99kzsXAq
	TFe9Fs+dmy1V5Vs6AYTNHCkZr8JvtA4Yv6M+wEFq7WkeY9wCdxf18hb9KW2Hoql4l59KBWukG0P
	xNlpEwyfFet3w5drqF9AzlTl8v/VeubIYiS/bnKnJSPzm0z5SL0d+KEFFRQNViEssuduAmUiS0c
	nM2SHNcQ==
X-Google-Smtp-Source: AGHT+IFdFKFen7tV5F5VONCvLyYsh80AvPduy1QT8kUGqdlbVQ4K9dlnnT93BxJMM7KKevL6B+Uz8g==
X-Received: by 2002:a05:600c:3e8f:b0:46f:a95d:e9e7 with SMTP id 5b1f17b1804b1-471177ab11dmr157009085e9.0.1761138656539;
        Wed, 22 Oct 2025 06:10:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:10:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 00/10] gpio: improve support for shared GPIOs
Date: Wed, 22 Oct 2025 15:10:39 +0200
Message-Id: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/X+GgC/1XMywrCMBCF4VcpszaSppdEV76HdJG202RAmjKRo
 JS8u7G4cfkfON8OEZkwwrXagTFRpLCWUKcKJm9Xh4Lm0qCk6uRFGuE2CiJ6yziLXuPUdMqYduy
 hPDbGhV6Hdh9Ke4rPwO8DT/V3/Tmq/XNSLaTQukONC461bW4PWi2Hc2AHQ875A3Ok0EWnAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ahWl67TQ9XpBLPshdCkjxixfaIbnhlzVC6EeMq2/mus=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfYNqmF4drtJq0Z6oJq+JwZ4haDxyCaNcoG9
 hkxD7YiG8yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX2AAKCRARpy6gFHHX
 cpjtD/4/vho3ipov3Dx5Y/4GxVEafxt6SamY2SVevdOPyKVbKtxd61VbE+zPenLYIVbaV1oj+eL
 ynoWZ+1NQBqGrvwkHD7glUlhTbHSgEpgwGGhw7nyG83I1fRy5dPF6nvsx5MpJfkKlxFslMi59nU
 b/GmBNPzvOXSiNMXZpUgWHQY/ZuPYiRIEGbHh2iTaN4aY8oCiA8iKmM44xm724yXXZOeaej3uJB
 rjH92H+R5jtpHfhWIfzUoRtfNTa9GFdNzjNyrAXstJZchwwPpdAGZ6tIeyGh6imd7jBVBHXvley
 RcyU0+zJ+pbXAGmZEYdZVetTIOA0w1ieMwyp6XSlmVcr6u+B0fwf+rZVDNFPfcr7iIcF0b/0GJY
 CnYRooG9rhhd5kq4/nXV1XFXT6SL5to2XrEpRMwvIQyoEIvFuCUEnj5js8aknvhlj6MQ48vrhdp
 ctTQ55YFo4DV1UuWTJWvWwRWGW7KqewirICWUaJElWOYyCkD7ciyoAZnmULnrK1xBQ/4uLT+kQt
 RW1l3pssUgaQ9HCLaIxbXV7SpPYeQrczIHh2g1VIDCl4yZ6gLwlMP5O6NQkBAcd+cAwfw0IOaxB
 BFHd9m/paQktx4JHi5buXXAmR9fAarg0cDzF++xhOakTscMp1cR3toj0sGqdcNXVf1HYG8yF5/N
 60fFoddfTjDxa+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_061058_919690_C5B54A78 
X-CRM114-Status: GOOD (  22.10  )
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

Merging strategy: patches 1-6 should go through the GPIO tree and then
ARM-SoC, ASoC and regulator trees can pull these changes from an
immutable branch and apply the remaining patches.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Fix a memory leak in error path in gpiolib-shared
- Drop the gpio-wcd934x fix that already went upstream
- Free resources used during scanning by GPIOs that turned out to be
  unique
- Rework the OF property scanning
- Add patches making the regulator subsystem aware of shared GPIOs
  managed by GPIOLIB
- Link to v1: https://lore.kernel.org/r/20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org

---
Bartosz Golaszewski (10):
      string: provide strends()
      gpiolib: define GPIOD_FLAG_SHARED
      gpiolib: implement low-level, shared GPIO support
      gpio: shared-proxy: implement the shared GPIO proxy driver
      gpiolib: support shared GPIOs in core subsystem code
      gpio: provide gpiod_is_shared()
      arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
      ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
      ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
      regulator: make the subsystem aware of shared GPIOs

 arch/arm64/Kconfig.platforms     |   1 +
 drivers/gpio/Kconfig             |  17 ++
 drivers/gpio/Makefile            |   2 +
 drivers/gpio/gpio-shared-proxy.c | 329 ++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.c    | 530 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h    |  71 ++++++
 drivers/gpio/gpiolib.c           |  70 +++++-
 drivers/gpio/gpiolib.h           |   2 +
 drivers/regulator/core.c         |   8 +
 include/linux/gpio/consumer.h    |   9 +
 include/linux/string.h           |   2 +
 lib/string.c                     |  19 ++
 lib/tests/string_kunit.c         |  13 +
 sound/soc/codecs/wsa881x.c       |   3 +-
 sound/soc/codecs/wsa883x.c       |   7 +-
 15 files changed, 1067 insertions(+), 16 deletions(-)
---
base-commit: 304d18863e6e62a8f2d0350ce0a59596e2e42768
change-id: 20250908-gpio-shared-67ec352884b6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


