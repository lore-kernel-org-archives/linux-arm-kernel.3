Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F381BCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yQakO2W4jxxWZ2irP7gAZmr+hAQ7O/Ov4z2X+DwzoWo=; b=b6en48pANUo3YPSfRuSyeqJsmf
	nAEeB43Co7q7mWbdXRZAbFjSZPVUmxLVL+3vMPcftn3GBGkanBIx72f5HJwjNw/9DMfclw/WRmFMt
	kGCa1FQwMMdOG3unz2P0ecHBdtzODN93Caprypna/mYyKDohFHn/+S39aE9Oq18CbnamCBWHDKjUc
	B5tVnrvXSo8RveFTWEzs/umAI0VPCjXXOFHJGVqlhfqS1ve232lAljHnB6beuhG/nRPLaoc4ZPa0B
	kOhu+xC5DAQfS8M+yZhDiS9KeSUEC228mXJxkRbjMCgHyezB+/9Db9Qhklbnt7O06mS8LNyXZ9HAU
	y7rfYhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvwn-0000000FpH7-0bIa;
	Mon, 17 Nov 2025 09:54:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvwk-0000000FpGV-3ws9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:54:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4775ae77516so45788955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 01:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763373293; x=1763978093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQakO2W4jxxWZ2irP7gAZmr+hAQ7O/Ov4z2X+DwzoWo=;
        b=d23x5DGF1KU18zsydIbakIeb0eINGjA+9FhXhjNcRYzdbpxzH1S7zFSR3EDsf00ZkE
         TMt4n/AqyKvWRUPzJLCkl9D/1Tajyrdzku7z1mLtXqBwAWdSSrVc734RWbVGs24H8cXW
         C98h9yeBiNYthx4E3a3ORiORO+c9ACe+u+Tpx7+h2WccJ0Gwywk4nmfN8oqCwuxTynJe
         rDD9v3uKXeBDLRj8VYjdUj2TfUhlhDVrMODKhpcBNIoO/m7JEyII4RNzUPFJYAEPFrbN
         c/lNO5CiRjw85vt3MJjoEN6TJXMzVfl8MGxG22haQaC3/VjF5Rx1RdHY6et9RfUI0Ejf
         w3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373293; x=1763978093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQakO2W4jxxWZ2irP7gAZmr+hAQ7O/Ov4z2X+DwzoWo=;
        b=qiXHdKXA8kzRlXH1hdtRo554/Cat0tgCBSM3gaeiYtfPMMgSFBRCtlCtYxlmnl9R1N
         WLtkBfF3DnDIVlVDXuYUmrdYfOfU0crrWXDCqAt8g56TuqQ1jJrQQdzL+IJ9bLTS0lSZ
         mJotQMkVgmKErjOnH/psdhLFyjg1ocOrUf6SxyjwHwOVphn838urZzWMo0v4mecj92dj
         nuuoHAGlHSEdyAgE2sm6niGQvj0xXUyw7VfOWmIeMJCpRVDImJ4quUrggqOXt+ytR96S
         BBWlkaDyjpaxsd8jX5P1Mj61w4zkAT821b/1Sh1kTWTLdXDB1dVgxawka9jxjloyP1j7
         YCmA==
X-Forwarded-Encrypted: i=1; AJvYcCWle/hUm6RmrAvHXpEh795w0fnXaqtPUeReAAxe99dQrwd20UKrKeKTSe6X0gTjB2hw8e0oalk8iiq/ObGe7HaH@lists.infradead.org
X-Gm-Message-State: AOJu0YyLaOZ+sI0ZrM1Fy0xrab9ChRg7npRDSJH/fuNlSbdgyF4BuOYx
	jr12+oUte5RLxs4LfCiZLV6eKGtw0NVErQ1JAMr7FkmLNr0K50P2w0gqYtA+sigWZDk=
X-Gm-Gg: ASbGncspcFnhoFNp6E86rfFfnCJHJiU2dYKsd7R+C5uyBNY962Xa7gJHvqJ6Y8ylU1j
	wbInye5Agqsd1qmaX4Yq2S39cZIZ0qWhezbJcfqnhCYLVYYnqx6OWlaHAq/Aa38nyZUcVjWPh8x
	00vi9PE+OqVDann7ZwuFeaIdXWFhupas1H6I39/sPPNFFfLFq8VPH/LgXvkMBcd5OwPH80IJC7Q
	DTeW4jXcLUk4mUj1iUGVONygTLggVbFWxoFVtpAiZJWgPtOCxK1Ecz9p8gZVSwEHTdawke3HPbS
	E/5x8gSDfaxC9yKC7FdXIZfoJw2uU/VUoLnyUu4JgLLuw3+k62g6hjA2Xp44amAsy/AHOAC5RpB
	0rtiHJcUHXquDBnnCwk0b9Gd6aPM0L0vQTYKJTDMMRa9LD0OrOKORCYzgbmlJ6c42swMcr+4/1f
	oxxMj0
X-Google-Smtp-Source: AGHT+IFhjSKYX/arBJL3/rXffXBpiEHsSupWSNw5jzv7CJLF3z4ydrD8nr7kTuUVeh7M/OglnfLL9Q==
X-Received: by 2002:a05:600c:4752:b0:477:7b30:a6fe with SMTP id 5b1f17b1804b1-4778fe6391amr100771505e9.18.1763373293056;
        Mon, 17 Nov 2025 01:54:53 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm310053395e9.9.2025.11.17.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:54:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between the GPIO, ASoC and regulator trees for v6.19-rc1
Date: Mon, 17 Nov 2025 10:54:41 +0100
Message-ID: <20251117095441.46680-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_015455_002403_61EE7AB0 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Mark!

Please pull the following changes into the ASoC and regulator trees as
a prerequisite to applying patches 8-10 for v6.19-rc1 from the series
improving support for shared GPIOs[1].

Please note that there's a small conflict between v6.18-rc1 and my
gpio/for-next branch where gpio_chip_hwgpio() has been renamed to
gpiod_hwgpio().

In linux-next it can be fixed like this:

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index fa1d16635ea78..c22eaf05eef23 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -462,7 +462,7 @@ static struct gpio_shared_entry *gpiod_shared_find(struct auxiliary_device *adev
 			entry->shared_desc = shared_desc;
 
 			pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
-				 dev_name(&adev->dev), gpio_chip_hwgpio(shared_desc->desc),
+				 dev_name(&adev->dev), gpiod_hwgpio(shared_desc->desc),
 				 gpio_device_get_label(shared_desc->desc->gdev));

Thanks!
Bartosz

[1] https://lore.kernel.org/all/20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org/

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio/shared-gpios-for-v6.19-rc1

for you to fetch changes up to e511d484cbe44fe48a1b9f621f6a947c72503f9e:

  arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM (2025-11-17 10:16:51 +0100)

----------------------------------------------------------------
Immutable branch between the GPIO, ASoC and regulator trees for v6.19-rc1

Add better support for GPIOs shared by multiple consumers.

----------------------------------------------------------------
Bartosz Golaszewski (7):
      string: provide strends()
      gpiolib: define GPIOD_FLAG_SHARED
      gpiolib: implement low-level, shared GPIO support
      gpio: shared-proxy: implement the shared GPIO proxy driver
      gpiolib: support shared GPIOs in core subsystem code
      gpio: provide gpiod_is_shared()
      arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM

 arch/arm64/Kconfig.platforms     |   1 +
 drivers/gpio/Kconfig             |  17 ++
 drivers/gpio/Makefile            |   2 +
 drivers/gpio/gpio-shared-proxy.c | 333 +++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.c    | 558 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h    |  71 +++++
 drivers/gpio/gpiolib.c           |  70 ++++-
 drivers/gpio/gpiolib.h           |   2 +
 include/linux/gpio/consumer.h    |   9 +
 include/linux/string.h           |  18 ++
 lib/tests/string_kunit.c         |  13 +
 11 files changed, 1085 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpio/gpio-shared-proxy.c
 create mode 100644 drivers/gpio/gpiolib-shared.c
 create mode 100644 drivers/gpio/gpiolib-shared.h

