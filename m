Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C5AC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ks/+cexj6+RLY5eRG4PKENu5maSP4eS1YiUdcvp3QUk=; b=cbQmZJxsPkGO2kStfte8edeKGG
	Nujjr4jeaFUDfl43DkUgVFwDfXJvJUNuwf/uDTgZ9ACoF6Na2Rw3V1OxNfYf41n+4sDX/9VN5WgPb
	WtT+oRrjJJCE91cJ8F5OTn+R4ID5Nl/Q6jANM9YwJwHvZl/ktiRJGcqQHSiWgZq5Diy1ubJruKaSU
	JVtP6P7p2SR82qMlgx/KUFyZsIQTdPBesmkTYuT2YWw5w7PljJnL/5qJd5aDnF5d2h9nWxRSF0Wsz
	uVucMJEv8JWsEBpO33uvK158MUp4ygp73wuYxPrQ1cQN6TPfz2Se1wSSMt36178MeIBOOvPDNEhva
	p1WM4lZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO9K-00000001Yu3-3bGI;
	Mon, 31 Mar 2025 23:02:34 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO7Y-00000001YWu-1qcs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:00:45 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3052d29759bso8574796a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462042; x=1744066842; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ks/+cexj6+RLY5eRG4PKENu5maSP4eS1YiUdcvp3QUk=;
        b=sUh/Z/McB/ra3w14LKpzRVAYLBlRqbhUNg0SuyFm165lgxW2cGyugEf8ZvVbvpDbEA
         CKfPNkNQy+o6N84BOQqt//yu0lUbShBc3k/uQV8r0peEB/7j2gJQ2G6hijU4E25y+L68
         kovqMtdQp3wgTppo24RMgxt2/53b6vAA7C0vGLsdbnjVauqUykqx/BPR2/qn7+6s4Cs9
         zHmILfMptzIfzY5MqYEOOGB1Ung5tHGqYETjFJD6rKmF3+hDw6nxqg6blosmSXD+Hx9A
         5U5QElcsuh7Ikn0/dJ0DhYTLZwbKacAe9HttNgvYIRIu5KapS3HT5kI6Amb1ZCsvHf27
         7IWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462042; x=1744066842;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ks/+cexj6+RLY5eRG4PKENu5maSP4eS1YiUdcvp3QUk=;
        b=bhgK1M+lGQ1etyNTQcGshNEJHPwI9Y9uC62932aoO33PLOAw/pZcEsM53MHfMXFzyK
         7qU77jhlM+ytbnEnJedZH3repSl8DB2DMRBQiWZOwgJNJFd5nS0HP8CuMW+hx/J5DdPw
         cZ7v/2ebule2hflkImwZ84w94987UQ033zQXJ/H3N0bbXHYqLMAufP8rJSEUvG9pRWru
         sXJG2+eLexZjLN4nzFvoe0HwhsNsboW/X+qybyWimvM2/lGp9enoZrUwBPIWvBNXrJk/
         Mt71IP6pZYU9xis8T4KLsymLhHlXdnHrQMyHA0pGHWzc5VbyyXcFCUaNajq4EKyvAkOv
         HD/A==
X-Forwarded-Encrypted: i=1; AJvYcCXvrPO0YZi2VWXtQQzj0tDAU6OTOEmOrz+Xof14IwtNLBrq14UcPgupEktRj9dKAt6sFSQi9ZseFHRglHNgtt1z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7leSS8Vz+zmUr6wdpkbEvddzObKNiNe+JeAlcvCwKXvtwCIts
	HjJFgefwcNCtDeRIOiaJLC8MvK5/NXRKUvD5STPvconsEGo4geT9337O16i2wz+c6z3NLMprLoW
	LbddJsqE6M4FaiTp13yI7kHGxPw==
X-Google-Smtp-Source: AGHT+IEltaWMh5mxqWCSOc5LwIIwISS15CHmoIhdVB3ul9l1TDM+bcKrNYeQAGpdOsN2DGV2kSzXTrnq7LHwPcjzh+w=
X-Received: from pgcv23.prod.google.com ([2002:a05:6a02:5317:b0:af9:318c:41a1])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2d0c:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-2009f8042d4mr21446912637.40.1743462042575;
 Mon, 31 Mar 2025 16:00:42 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:22 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-1-willmcvicker@google.com>
Subject: [PATCH v1 0/6] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_160044_500941_1ABC0798 
X-CRM114-Status: GOOD (  15.79  )
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

This series adds support to build the Arm64 Exynos MCT driver as a module. This
is only possible on Arm64 SoCs since they can use the Arm architected timer as
the clocksource. Once the Exynos MCT module is loaded and the device probes,
the MCT driver is used as the wakeup source for the arch_timer.

These patches are originally from the downstream Pixel 6 (gs101) kernel found
at [1] and have been adapted for upstream. Not only has the Exynos MCT driver
been shipping as a module in the field with Android, but I've also tested this
seris with the upstream kernel on my Pixel 6 Pro.

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream kernel
can be found at [2].

Note2, this series is based off of linux-next/master commit 405e2241def8 ("Add
linux-next specific files for 20250331").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main/README.md?ref_type=heads

Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Will Deacon (1):
  arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

Will McVicker (3):
  of/irq: Export of_irq_count for modules
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms                 |  1 -
 arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 ++
 drivers/clocksource/Kconfig                  |  3 +-
 drivers/clocksource/exynos_mct.c             | 55 ++++++++++++++++----
 drivers/of/irq.c                             |  1 +
 5 files changed, 51 insertions(+), 12 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog


