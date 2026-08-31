Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748E2C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=; b=2EW28KFPpOc9Cn
	W/SXBBIVI2fnsJqwd8Li0BY/Hwiw1I+48vZLaRvYemOWLeSvYmzgviBw7dqBv45CqPYU+kWJMfZMX
	PL/PTQO0fZ6afKqrF0+m4QGBqM/6wi6Sv0cL7zyWNc9dgIbEEfgcK4tCC08r2mloL0GrO8EvJFEt/
	RArzCfh4qcP/KlBdLMmlsb4XBN6TnNoJec4yUfI+KkDb9IiZ8A8mv+j8kNPInBglD42NDxSb0ZG1/
	39+M9Oqw1P4bxD6HIy+tA9s11o76TNjqqYi2u7qqaxpJuy2YQrlXuA1K3XXu4Q/PTuB5YvJ5D5+mz
	B6ezzxOCfBzjzTPS9qCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10GL-00000009BBF-0Gkc;
	Mon, 31 Aug 2026 11:33:17 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10GI-00000009B9g-0WzJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:33:15 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so2478559a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175993; x=1788780793; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=peG2uZs/57mEAayStY/Taj7zLJyQjRuZXNIkNTBc6UfDvlf5hDPt0bd6hV95rs5tAS
         hFmvgwXXCqCzfXfL7wdd588rGYKzefLxgYIGABQ4ZhRsPfH0Pbz7l1u3Xf5SwEqF/Gnq
         2m/A/AeqDISFcQfyidrcEYhEt6amGfZInaQ1EaOuTGbtQxd/GYog77RMA8jLo7oJ62UQ
         8Mlo3hKqQFGWjofkp9aTi1GUz9TCgrCf+nq2H8Y19f1LuHznVHeqF6AXPjRyQ1ZhJTAM
         eo4SK17KysvlK6772t+XHmJ/n80z+Ku+6O2eckliMYt96l1DI/5rEGTykYvkA6+NA1G4
         KBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175993; x=1788780793;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YwoI9pJbspw0thPYgo5uRAdd6p/MMBJUTUU3yjoPKkw=;
        b=RaWeYZFqbo7PFtKjvK1XqZBvuB0Y7bk1c8twhbI0l30Y9jDB7QDMcNN2DACNSFHuak
         exrZsrfaeLM9QtlUeyk1wJ7ArxSEvalPoNxgCBdsmfYFjHVdF6HYHxGj4Wy94X+ZrFI5
         yaefS1pcDyuO8bJnih9+WHurZo+5YplKGIsdTVwCXbOL4Gcj2K0qEmqendVOl/shVe0Z
         GmJE8qd3AM7WSZfvxjR8eJK/a02o94flXmN/93XL7cZTaS4w57r+76exiQ2KjKw2VDKv
         6JmvnRwK0pTzaLpsRoXIcmMuP4HEXCuh3UcGCjOyUYLRowswps0FCvQnwF44u/gEvrg5
         Rtyw==
X-Gm-Message-State: AFuF++mKtjwtqS/bEA3g1zv26URRMvJ1WoOPAsJyo37EzCq5G/9a88js
	hq7iVupOlIQEOr5m6JwwRMsbkE/iBwE+fOZavn8/OwZYcWvBIGnEn2cyEwTYGg==
X-Gm-Gg: AYBFou2912lvZHfPJyRtnA3pGAc4Od9pGHZrMymCBnPqTXNurH3sUvVhDSqpV66Ezqo
	zj4kCjOQuotXW3LWYbQWnfsuwIDX2aZ2AW3aKtOEjfRazqG+hYerEvZHAKmI7Rib/7jnySloHFw
	+Wnvaxxd89lvnc/onDRbxdXVigRBT1f5GRakJs7axSvEGrWYdl/4KbxV1JMDq1iRNL7chvt8pvP
	Gvu52zp7OZHUXfLUfisUwlbDGyr4o2I28eLVfHqkGIb7TzvKk+idbMCoIEsAhOZH2qGlsT/24v4
	tnfZuBaNy2yi525hW0ZHE+gKmihUDS7uqSDLdlYzafmIEU6kF21g8cX9W3HeU4sKgAhjm+O4cZG
	y80i8JVL+rxGt35gHte7XDK15u2jhcTT4S1gN48S5qRh17a87b6W1VJAl4doN2iG3Ine4t/rZVT
	IiXWOdt1M1/jXNlkdRMF5mPe5U76HaclEa16c4wcQvx5hHU0FMHXkssS2x1GAPHQ+SZM4Q0UD1a
	HZ+Pxp0X6yrw28h8sUBRrKlwwtwVKkpqNG9bkDzWmej/V3qv+Z2dO8xUuKonmaRF1v7URaF+ngs
	r7kq0+1iZzGdY6ZtZMc8bwzJEG7qwiSQWPc1DNMt1aJUyo0=
X-Received: by 2002:a17:90b:2f0f:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-396d0d92d15mr41287848a91.3.1788175992822;
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/3] Enable shared GPIO for Apple Silicon audio support
Date: Mon, 31 Aug 2026 21:32:38 +1000
Message-Id: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTNJqVKBqxAXFX5gCIGmo8aEc
 HcrLr/FezspokCpyXaKeIvKtiYUeUbd5NcRLH0yWWOdqWzNPoQFrJOP6HkMsrEzQ+Vwu+JSekp
 diBjkcz7b+9/6eszonr8RHccXNvdv2HUAAAA=
X-Change-ID: 20260829-apple-shared-gpio-60f86e74e35a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JA8jrHKuhk0CJFLWQ126/WU45hXRi8573vPGNkgvooI=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGqVZm6gk8hq/DZpJ7Sxzc6aABaz6Amen7+KLPp8mgNqyZt2h
 IiRBAAWCgA5FiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmqVZm4bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJENQ2MtFR93lgVXIA/jxuSb36HlgsJsBZYezGXmJU5VV9xJiVbYBpEWb7i9w
 ZAP94S1jJis0hOEMTV0nlB7uKc1AoDcePfnSn7FH6oi7sBw==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043314_187006_6CFB9CBD 
X-CRM114-Status: GOOD (  21.58  )
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

Hi folks,

On Apple Silicon Macs, every speaker codec's software shutdown pin
is connected to the same GPIO line. This line must be pulled high
whenever any codec asserts it so.

This makes power management impossible. When we goe through the list of
codecs and call each suspend/resume, the GPIO line is asserted low or high
by the first suspended/resumed codec. This causes issues for the subsequent
codecs; they are already shut off by the time we try to cache the register
state on suspend.

In the downstream Asahi Linux kernel[1], we were previously (ab)using the
regulator API to work around this safely. We replaced the shutdown-gpios
property in the codec Devicetree nodes with a virtual regulator which acts
as a proxy for the GPIO line. The regulator will not deassert the pin until
every consumer wants it off, and it will assert it as soon as any one
codec requires it.

Now that the kernel has shared GPIO support, this has become unnecessary.
The first commit in this series enables shared GPIO for ARCH_APPLE so
that we can take advantage of this new(ish) infrastructure.

The shared GPIO infrastructure considers the first state change of a
line to be the "default" state, which is the state that it will allow
to be asserted without all consumers agreeing. Currently the TAS2764 and
TAS2770 drivers initialise the shutdown GPIO high, which means the first
change is to low. This does not help us, as the line will not be reasserted
on resume until all codecs have tried to assert it. Since both drivers
explicitly pull the line high on codec probe, we can initialise it low,
causing the first state change to be from low to high. This makes the
shared GPIO proxy behave as we intend. The second and third commits in this
series implement this.

This has been enabled in the Asahi Linux kernel since 7.1.9, and addresses
the last obstacle to attempting to upstream the machine driver for this
platform.

We intend to take the Kconfig patch via our soc tree. The two codec driver
changes should be taken via asoc.

Regards,
James

[1] https://github.com/AsahiLinux/linux

---
James Calligeros (3):
      arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon
      ASoC: tas2764: Initialise SDZ GPIO low
      ASoC: tas2770: Initialise SDZ GPIO low

 arch/arm64/Kconfig.platforms | 1 +
 sound/soc/codecs/tas2764.c   | 2 +-
 sound/soc/codecs/tas2770.c   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
change-id: 20260829-apple-shared-gpio-60f86e74e35a

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>


