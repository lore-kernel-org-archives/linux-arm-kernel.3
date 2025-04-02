Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9F4C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uhm3xVklIWTKuMJm0mSzjGk571zlKSg++5EFQ/Jj698=; b=U3aw2+AM3r9mkegDKLnl4lpfhx
	6Ji9LqAdodbuWSSfsfQUn9vKMfInyEZYdpttOQGyt1rUW9pSsE7ElkUejTGpp7aSTGlP6/iBJm4tP
	ruuEuuthhbenXavfQ1Cn2HhdCyB7PmSjI6AE/ovJJahulk40JfhT/H9N3wY97yKe2HLP7JNI4k99F
	bHNYF+pla/U8UG6MfBFTRscSdk6TunOyFSwT5Nlygjlysmzin9FfDnrbQRn+k3o48ZDbvhYtBCQP2
	RZA5Ae85iyTqyLZL/nkSsOCk2b7/MC7K/wTfcJRhYJYwQfqXKF+LzSOmQ4iWbo+TRlmRIBnhzW3Ff
	HyXSDMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07w6-00000007SGj-3uwF;
	Wed, 02 Apr 2025 23:55:58 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bC-00000007Q6b-41g6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:24 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso385753a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636862; x=1744241662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uhm3xVklIWTKuMJm0mSzjGk571zlKSg++5EFQ/Jj698=;
        b=a0IMDLN0PzpOK645EZjay11KuL0GP7VNsMk/fu0ji1kEIapV2SKurnlXzpDcRG/RLl
         I/QvQNkVBPQsY3//4phVoEKWwe4jykgC9k0seQFLkF8ojb9ZjW/oVYl6adqEp+iGFYkE
         vGn/15vlUVZiK+GABtcxdCqyPa2T0nXdaZf2NHt8nv35vR8ixjZj2UCQoX0nDNRmOngr
         728ZOZLATfWu1HgBLF7g+wUZj4Pr9zVIwi+1rgzPvnQnyiEgaJApXtBOqJUK/CED9PaT
         P7OyH3Djfdv8f7NRRscF6hgJdvRVZTkuJHPT75XhBETCtWjcZWQIcNJ9C7mozDmHnIQU
         WT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636862; x=1744241662;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uhm3xVklIWTKuMJm0mSzjGk571zlKSg++5EFQ/Jj698=;
        b=NgexC6UKSTYnJmVWfvWOkNOHBkTm7mUpKIoszuK75XNb1XWX2r48BlTyrt2nHcs3Vu
         JynxqPnK6bTcd7kgp9b9pjoElMsWUcFH8Sj1MLhDFEUGdh6iAKyoFDiWpjwgFuLcHJo2
         ngRItft1xrq+CeKi4OcqXiVc23g+44SLm7nhUjQkzNxuKDjIOO2CTVkPNYMOq/i5c3KH
         pD4V5kvMz5ne3fTKyF2J1NUaCFJeCZ2KLGJzYfngeaKh5s3fVPy+bTJCLHPbUFkHzWKS
         u4yEEN3ijwm5IUFF+TW4V3Q8KpIWMW0X6Gb1/WQ+Y+mS68rsgfsC3Q0n6FvPwIykS6iP
         anWw==
X-Forwarded-Encrypted: i=1; AJvYcCVAsk9z9nfvMy9+nghM+GspxOwAUBYThtgT8sAmTd++bwhoSvGtimgcb1Zo9RBtRcHeFuDtXBJQK5js3Se+oMfX@lists.infradead.org
X-Gm-Message-State: AOJu0YzXZTd/vIlr5ImfBXlpx/npC32Tn9MllYYZekKY15y2X7W4lFM6
	gkK1/lz8hYvDo/2lypquLj/C/9UE8KoTh6b/38vQ/MCeOG7IpSI+wXculBErPd2IVCCcfV0QXR3
	6hMhv0qHPxZmQbiBS7cCzSjuGvg==
X-Google-Smtp-Source: AGHT+IHt2tBE/ySgcrK/aC6qisiJrm0y2T2ylyFoUuqW/+VzNsS93Xv/9MgD55Nz7V6Ag3uAgbyOVnY+ensGH6+wQbU=
X-Received: from pjyf12.prod.google.com ([2002:a17:90a:ec8c:b0:2f9:dc36:b11])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4c0d:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-3053215e814mr25102035a91.25.1743636861828;
 Wed, 02 Apr 2025 16:34:21 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:51 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-1-willmcvicker@google.com>
Subject: [PATCH v2 0/7] Add module support for Arm64 Exynos MCT driver
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_163423_018942_E579CFDF 
X-CRM114-Status: GOOD (  20.37  )
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

This series adds support to build the Arm64 Exynos MCT driver as a module. =
This
is only possible on Arm64 SoCs since they can use the Arm architected timer=
 as
the clocksource. Once the Exynos MCT module is loaded and the device probes=
,
the MCT is used as the wakeup source for the arch_timer to ensure the devic=
e
can wakeup from the "c2" idle state.

These patches are originally from the downstream Pixel 6 (gs101) kernel fou=
nd
at [1] and have been adapted for upstream. Not only has the Exynos MCT driv=
er
been shipping as a module in the field with Android, but I've also tested t=
his
seris with the upstream kernel on my Pixel 6 Pro.

Thanks,
Will

Note1, instructions to build and flash a Pixel 6 device with the upstream k=
ernel
can be found at [2].

Note2, this series is based off of linux-next/master commit 405e2241def8 ("=
Add
linux-next specific files for 20250331").

[1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-r=
aviole-5.10-android12-d1
[2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main=
/README.md?ref_type=3Dheads

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>
Cc: Hosung Kim <hosung0.kim@samsung.com>
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Cc: Will Deacon <will@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org

---
Changes in v2:
- Re-worked patch v1 5 based on Rob Herring's review to use the compatible =
data
  for retrieving the mct_init function pointer.
- Updated the Kconfig logic to disallow building the Exynos MCT driver as
  a module for ARM32 configurations based on Krzysztof Kozlowski's findings=
.
- Added comments and clarified commit messages in patches 1 and 2 based on
  reviews from John Stultz and Youngmin Nam.
- Fixed an issue found during testing that resulted in the device getting
  stuck on boot. This is included in v2 as patch 5.
- Collected *-by tags
- Rebased to the latest linux-next/master.

---
Donghoon Yu (1):
  clocksource/drivers/exynos_mct: Add module support

Hosung Kim (1):
  clocksource/drivers/exynos_mct: Set local timer interrupts as percpu

Will Deacon (1):
  arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

Will McVicker (4):
  of/irq: Export of_irq_count for modules
  clocksource/drivers/exynos_mct: Don't register as a sched_clock on
    arm64
  clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
  arm64: exynos: Drop select CLKSRC_EXYNOS_MCT

 arch/arm64/Kconfig.platforms                 |  1 -
 arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 +
 drivers/clocksource/Kconfig                  |  3 +-
 drivers/clocksource/exynos_mct.c             | 73 ++++++++++++++++----
 drivers/of/irq.c                             |  1 +
 5 files changed, 67 insertions(+), 14 deletions(-)

--=20
2.49.0.472.ge94155a9ec-goog


