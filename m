Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F349CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=drLJ70XtGpDzIlyNv3z+1we52syz/zd9JPxUjCCEh6E=; b=Za5JgjW38gsrx/
	6DuIDkEAO8JdJnAxmyBsDgW740UmR6W0TfUT5xYRBs1xtt2RjRPxHoH7F6TzA7h0W/ID4r0kF0Qjx
	ls50IiyxnBndYsDg6oBTwEgcboGZcEL8FIieRzLY/LTwsMoKNEC/HwmsHHc8lJoKPQPq3J+kWDZV0
	DUukeASBaHT65EixImBsvKDlIRJVRePp8OadE7+Lm6Qd6uMwcx7/NBaVN9dikAtuNOy7bAc1eLBhW
	/OSz4YIvGdlQucjj2QezBTjgxniGrNG+p5MNjS3C4N3KypFGaaGu8J8+FhgN9cZy2JBf6UWBTt18x
	WVxOwrtlcVB2Y+DJMvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Eh-00000000vnN-0AiO;
	Wed, 29 Oct 2025 11:21:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ed-00000000vlJ-4Bfe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so3666104f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736857; x=1762341657; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=drLJ70XtGpDzIlyNv3z+1we52syz/zd9JPxUjCCEh6E=;
        b=Uvv+YhUmgESsvTvw6zgVipyTUH6IkFeJXrw33xgh+JOX4L86hL27SVHmVuCOHdHg2s
         Iw8dPrf1imiOowOKwosWpu+ABG/cD5BXG3nFfjbaAbkbDttUaADvkZkOkPCWwj2cEWw0
         3Sh1Ad/RnX23oMTsed3YitcjOML82RhzyJfunmeNp/Zr4V78xoXKxxK7W2bUhEOhb5sJ
         WxQzOfyHll283m0ngbch98T43KHzve+lINOP68vZKzVhln6YVsqwY9qEctF661EiITny
         KfaxiU0jqskVmF6VuUbn46vMv4Q/2A0qxlMzk4m1W/riz1ftJpLdTmpQqnblLW5i6DgR
         Hrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736857; x=1762341657;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drLJ70XtGpDzIlyNv3z+1we52syz/zd9JPxUjCCEh6E=;
        b=afckdwoOWeqGFOoVTdZC3Lg0fes6+L4Z7zYHNIjlIS8Y+qxtfdCDN0pCS50e/9hunV
         oB91VU2vi4v30BowfJ0BCCZOXzjxZoBIMrlTkXgYAYGJ3coxrjOzOHpwbhooimOFxI4b
         0KNliDdmqeLyGzvDB6LgJh+ACJ5o/EDOlySFb1N8iZxu7fQXfDnZd2UidbKwAccuOEPu
         Z46NuVHN5YJ2sg1SJCnqvHYaxzZ+E24ZRWiLa89ZNu8QyiJbmjl/sbt6Mny+YPtQQ2ee
         SuKaPOuI6iGYrA5yZaYsaq9q56BUkknvKYzo6tRm9yGZntrLhiPgQ1qSirI2Y7MUYvES
         Qr0g==
X-Forwarded-Encrypted: i=1; AJvYcCVzVFR+77Xy7RSnS049w6uPGAEh/qh4Zs4cw1Rk3Ri6iknDKhGHa9hzPLWs1CJrInAxv8TBlkHe7stUx//l4Zrq@lists.infradead.org
X-Gm-Message-State: AOJu0YyaLowZAf9YNUf3txZnFxw/spAc2AmhTvVpos0w/GA62xmSBMtS
	L5yN0ASh+/ZcqGgTKoslUTYJkkuuDlTe/pYIjlsYXwkoPma3m8rQgKSPwMa1gzxTSeQ=
X-Gm-Gg: ASbGncuo2z1oKHWQa4DHWZFHaiCw5hyxy22AnKdbqlyzkT7Uq+mybUL9CFa5YRZaAWK
	Aup0JHgzG/TOaIn1Vt4f+m3Mgsj+HBG98YCqTkRnbI40v+/V6pW0OJaVHJ+3xYG1tX1dy7kAJDW
	FtBVqbKUGORxk2rIowYwyZSVAVPhSmMe27JRKMOAz6Wr2zvt4i+AATPoWMdXznTTz2B1R9QkAhQ
	7gOyBRcNnYuWX24Ft7yIjIkL/LPtWW3ZK8EHn+ydOc4pHE32CyrjNe54ZlgMvaTgTPRkctzKep2
	+fyIgwl/Qje4Rs/f56hVkrX3ViakqSR4kHIjWXqIiupYIpkRFh9qCBaMwSoKwtv4ZpdhbtLrVm+
	CJYXkfvttsfvY5SYf4RX89h56ZHSk9gv0IXbmoNXk5j0TVEuGe0GILFYg7GwRJY//6JG/IA==
X-Google-Smtp-Source: AGHT+IHJ6rI2i+ynX6AlOMcC1L9DubGba4dH9C14YMhZnd+DNhMtpSBjmYNVey1S91mBt/C7vXaflQ==
X-Received: by 2002:a05:6000:1ace:b0:427:9d7:86f9 with SMTP id ffacd0b85a97d-429aefca833mr1978121f8f.47.1761736857377;
        Wed, 29 Oct 2025 04:20:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:20:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 00/10] gpio: improve support for shared GPIOs
Date: Wed, 29 Oct 2025 12:20:36 +0100
Message-Id: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT4AWkC/1XM0QqDIBTG8VcJr+fQY2Xb1d5j7ELzWAdGhg7Zi
 N59FmPQ5ffB/7ewhJEwsWu1sIiZEoWpDHWqWD+aaUBOrmwGAhpxER0fZgo8jSai463GXjXQdbV
 tWSnmiJ7eu3Z/lD1SeoX42fEst/fnQH1wsuSCa92gRo9WGnV70mRiOIc4sA3K8I+lADjGUGKna
 mOkt86L9hCv6/oFjFofyOQAAAA=
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4883;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bgbw2Ft4/u1XwJQBHfFlQ3MV2AqD0Imvh5HsmytZj4c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiO0lKX2uiEhxK9yUquvK25+YyEc4xHnn5Di
 6uUrJIyD/uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4jgAKCRARpy6gFHHX
 cllaD/9iCWfjjy9wCBEUEy147bi9+0/W1kuNnYZ+UDEaCjVYFMrc3rnAyXaayf35gvRx0wqUxb9
 aF2MptBGcVL2dTzCve7ldmBTQxHRYosBuTHZNDe/XakCnVLKYFDNujY4wFvDmm8dSOmPOtpa5vc
 mdATGn9cS9Ua4WlnEXGhPiUL1V1O52C76xYn1eWlYwNVCnaeB0yeqW3NZjh9Waw9hNU2LKXkA0S
 OqSBFUrtF1AgLzoFKeBS1F+gdItxUUqhMgNCeNsRyhc851bmLDSxr7bp7WuteA7X39az6KIFfFD
 lpLW6X1Ey9Rg0DdG5mOdk16BiW4tWHYX/vbWoHNY4jd74uY9THR82FG5ZUIsLB7WKUK965A6MDe
 taNJDPnzdrjFOgwxbAc6egfn0yY8fYpnkKsdo2po44r8P1N63fJHNobX0XXuasoudCGQ4Zny5Oz
 LgWo6bQh4ukHof7dBFhLOImgSXZvqZSkl6A3yEf4eqmHFZ9rL6Kjn9x2a4GGQvqW9JjF5FtpKzU
 biXyJi8q9yFoiL7Bv9xEhJ0fmpNjy/W2mfMtWi3BREAIAwXUXZJI77sUacAaJ4YuuiSDvd8VUIg
 bkZRRywzwADq/pwIL3M1CgOYGhYWYMtJexXyJYaD2aBKBVKStP5HExBXO5tXSbgi20Hb7Qih8G9
 d6Q/OI1u4kZr6/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042100_081784_E18E3E0E 
X-CRM114-Status: GOOD (  23.40  )
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
base-commit: 2a3cf7aa49244fafeedf9f334d3e88fe8ee05b50
change-id: 20250908-gpio-shared-67ec352884b6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


