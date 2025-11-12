Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F526CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XBFAMrOJQxMwscqUKdzjpajXl7OxXxRyAGXjE2x3Poc=; b=aL39JRHn9eaubX
	JnqawbR/TQbkZ0IqmySgoyq9E0UvGUdkf8FpvIx+R2CTURafm7iRE7OEyuGioFw+OEwGtfrHFyf96
	Yub+CG1PWiaAjM3eNW2CxW9J23i0jBGOAqFPeQo0oeZeuhnnPH+RRN70/dsEQucmWT4bk6mBFpUdQ
	+6S7OzWer0A3oPAg829HWts01i8PdMQzuyG30cVnrt0AqKc9tDeZ5L2dUb8F8mMMW/7xtKnht7wDc
	c2rcpLprufmWZs4pLM2WNqXekKVvh/T1QC/7yUbe+Mn5z4NUUduy13N0Q7/eIg4+HrP/C5VvGRjRy
	yyJSuzyAgOvvuZCE3c7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK2-00000008sPA-3cQs;
	Wed, 12 Nov 2025 13:55:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK0-00000008sOS-1wOE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4777707a7c2so6704575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955738; x=1763560538; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBFAMrOJQxMwscqUKdzjpajXl7OxXxRyAGXjE2x3Poc=;
        b=GAjLBMU4OflAOVnojciwwMZC4O3qWkD9SKDG1BuzqrlKP55o0Y+S72YZrGRzO6LHU0
         GwT9BfIBPJDkrVm9uCHuRrvxs7uB/Of1yQk4UOkPsvjy7k6qIwMZyg3Cb4AxPDJOonZa
         qmAVdcS31+WS213P6zOz3oqu2fGwZJuyy8wZAFpKtuo/Wb8IxTSwkvhX2uLGBWfe9b3p
         Dzm8BVeCCKv5lsGHN/6N9dQn9dZY9Z3QU+WTpE2RGk5v/iOvn0vplJ6eT+zEI86FJfRt
         W7OddSnRPqI2YcO7hUFnGB/13xMLVvCjzxb64RY6CYnmO5aKskc5ZFKDqW8dVztXPss/
         HE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955738; x=1763560538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBFAMrOJQxMwscqUKdzjpajXl7OxXxRyAGXjE2x3Poc=;
        b=hAa9EtQzBi8oSbMF49/NFXoW7oef8TcCZkdpuCLYfALNSiIY6VkH61NBZFgqqkbve1
         EHxJ/YYNG15R4rrlwfg7gEj/TtSz5SMt1gCvF4IG/KA14YNvjgRYSdl2d9cewswOSj+K
         LYK4wIulOhcJOj6CfL/7mwCdjjvPmhQPVxJ+xdV7gruthFKA/iIuutKAKv/vFB6FaWaE
         IM+CByVbEThjY6j5iu4Ur2Snd5yyZpP9kGBW+RTfGX+hYV1iX8OdGEcv9hrOqkTFRPIE
         0/kq0J0yFKRUrztA5LgzxCgP3Y50QlBnqNR3+dOwNRYtOvMy/Jvuu3HkDVUYYrYk2bI9
         20Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVh3DsOviou0HRf7YfF5fgVPh2e9qgm3AT783iDaGpTzTHiEZDAaqDBTuMVrGubw/mWT1GK8M8WRDPiwf6BMPyJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyca4OOQ0qzvafZ5FlgmDwKuKxvzOoG8p4UnR7GlYG+0iD3V89r
	QY9NkCpWniX3s2SpQs12Epclg+GcZ+6RruxhKJ0/9tf2+6BTihdOEVY14RywVc5Fjas=
X-Gm-Gg: ASbGncsfOSr7xyDxF/P4MJTjYroKuHtkchU3Nd1g6disgTsfPBrWn2feaE1O6Pm88RK
	te0pDUgVPD354BwQ2olx1khPZ5AfPG9rfHESp/9sw/FO8mD52pn7udyjnEVUWbEGTOq+ueaa0Tq
	8qyg4sHkpkG6Gwj9FybfqaRV9x5amL4BTxb8Cb5EB8HAzSoVH23DDFGJt7qvlEWmvTrBroeBaId
	UNk0Ebn0lQdG6S4ic195msETR8AdACb7zHKsvkWD9MkFs1uMrUUW+AcqZvMAql1d3ar60W2KVqk
	duRaQ9n7ANUkVyUhoGLvxjON4VajIh2BNujGWh8apkqUQNzQCxRSAO2Sj03chDh6nsoqz4FH+yZ
	sOzjDbhK5ozchKgfB+FdNiHCmqGiNjPz0N/6JmBe1mZUvEZwn2wgHgH3D87g4by0A4IA5xN0U4q
	vrwQ==
X-Google-Smtp-Source: AGHT+IFKbQP8SOa1kCByQ4QNAMeH3OJkwfo0T2LCw/ncI1JxiJlrem/nOWVbpAKDdbocGkE7atAYEw==
X-Received: by 2002:a7b:c3ca:0:b0:475:dadd:c474 with SMTP id 5b1f17b1804b1-477814424a6mr41685355e9.10.1762955737889;
        Wed, 12 Nov 2025 05:55:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Date: Wed, 12 Nov 2025 14:55:29 +0100
Message-Id: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGRFGkC/2XNTQrCMBCG4atI1kby27SuvIe4SNNJOyBNSSQop
 Xc3LSIWl9/A885MEkSERM6HmUTImDCMZajjgbjBjj1Q7MomggnNGlbTfsJA02AjdLQy4KQWda3
 aihQxRfD43GrXW9kDpkeIry2e+Xr9dITadTKnjBqjwYCHllt5ueNoYziF2JM1lMUXcybEHouCO
 6ms5b7tPKv+sPzFzR7L9TN3uqqt88q4HV6W5Q1O6cYmIQEAAA==
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5266;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ml3z2pXKnumVWoVR4wBDLwJ0K3TTyVqmRXtK2nzVm5A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHUGKHmIdlssRyuI2zDM2oFpYK4thJPAm+An
 vHpyc0KzgaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1AAKCRAFnS7L/zaE
 w33fD/4wxGJ2NszFom9FCtcgZxRPtXC4TIw0cdgBDpHnMlLRoRgOAjdfUJihy0bw6eS2jS7ljuF
 xl+cvSgGjYZKuVQ9KhCVKpDSqiVJL04dSv+zJVRrShx7nRCM4wF3iMJ6CKgZcNw77haE9dlLp/m
 YG4swj9fw7Huu/DrvNJYEVevDnUOWOUHcq8BBT3F31cqHz7nROXVUOQG72XkSv6qWDmth5+heLG
 RQ4hzKrShyu9Uq6lEtmyGeW/WoCa1Cg2AM25q8a9TF+FxAjOc3lblwDpzJnUFwluqiYs57b60Cl
 a19ONlSGyD43DGZ1PE+RxelEz21/fY/3ZOsVyoKRKs8FbKaJVpSPIJ9HoKEgSnbm6m2k02MGeVn
 KtGdBzVa5LA9oIDJzoi4264FN2pzMc3lCcLDe3bht5K410FQxoMOEmWbPEOMvapBeMyNqC7YDi+
 89I2llq8RZt6kTdrtTsVbIJvUEq2MphlgBo7crobjaqWe4kjaodXe6FZK/UDZWi82s6g5f374Jf
 YQE7UzlHuW0iJeFZjwocqK5NwOQiOen7mVIonjAGkQUGpoLYR1CpLzkEIBsTUm+n/P3QuEy2Ycw
 ArR5jiJEL6GoiqMTZUtZ11BjOQg5A+/xtxylAdWow8iwqEymoQ1S2EreHkiy83bfB4vpkmE9g9G
 HS6Gr22pXsrOo7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055540_629151_EC0F92BB 
X-CRM114-Status: GOOD (  24.17  )
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

Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
this series however impacts Qualcomm platforms. It's a runtime dependency
of patches 8 and 9. Would you mind Acking it so that I can take it into
an immutable branch that I'll make available to Mark Brown for him to
take patches 8-10 through the ASoC and regulator trees for v6.19?

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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- Collect tags
- Extend Cc list
- Link to v3: https://lore.kernel.org/r/20251029-gpio-shared-v3-0-71c568acf47c@linaro.org

Changes in v3:
- Make strends() a static inline function
- Use an empty release() callback for auxiliary devices
- Refactor the code for finding the shared descriptors in the GPIOLIB
  shared module, split it into several smaller functions
- Use str_high_low() where applicable
- Use non-atomic bit ops where atomicity is not required
- Link to v2: https://lore.kernel.org/r/20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org

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
 drivers/gpio/gpio-shared-proxy.c | 333 +++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.c    | 558 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h    |  71 +++++
 drivers/gpio/gpiolib.c           |  70 ++++-
 drivers/gpio/gpiolib.h           |   2 +
 drivers/regulator/core.c         |   8 +
 include/linux/gpio/consumer.h    |   9 +
 include/linux/string.h           |  18 ++
 lib/tests/string_kunit.c         |  13 +
 sound/soc/codecs/wsa881x.c       |   3 +-
 sound/soc/codecs/wsa883x.c       |   7 +-
 14 files changed, 1096 insertions(+), 16 deletions(-)
---
base-commit: 96bf1bb63977b67d1a3e4a3645f857bc3fa03f48
change-id: 20250908-gpio-shared-67ec352884b6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


