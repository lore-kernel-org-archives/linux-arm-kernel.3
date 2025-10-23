Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BBECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=; b=YrCXL2xJRY1tjJldRL/f3as7sI
	oDpfOMVIGwocnlNnbdCei3pre2BuEBXHipZG1zw09Jna2zDrV0zx0Lw01iFu2xPbJH87KNvvI99lf
	8e7mi5G3W/1W6GrEUG/L4RbA5fpJx6Nvrxj9AngEU1UkL6hiV2rffCHDl7mdLAHWQcTUKiWQtN8Ka
	rbuXXkIpGyInq6C62Xdkz2YokiNXuhCiElCaO9nExWUeO5D4b664hh2AZ0xXOBhNCEDdTh9Hj6hNT
	jraje5GXEcmY5PcAVtAqh/PM3A6AuZMCdIHX0UqMfGriwdHMG+DIe9OOMJ4oXoNsyRm5W5DvWVD4g
	Jpf/eX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2J2-00000007aGD-3Xws;
	Thu, 23 Oct 2025 20:53:08 +0000
Received: from mail-pj1-f74.google.com ([209.85.216.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2J0-00000007aEr-3AxI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:53:08 +0000
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-336b646768eso1330034a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252785; x=1761857585; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=;
        b=ge5VymPtAo1bN/2LUBav+y/mnN8vOa91kHn/lQFmSEMweWnX6DFbLpBKZ3NNQdDWzi
         hXLnu1VA6ruOD6j1imSyn1qwBY9OGwvuLDrUy9CQlymd2HSzaUEYtap8A4PiIs1+K/JA
         DalGR++Mi7GEuMBADSusBMTnzbqxJpk/aK6ozJa0Z3GX16Eh6VNhlh3RIefpNwRoZJvI
         pWY4zVMW8vc15WRM94q6sw6If8+vRh4oaNh7HmGjdccgaOy8FamVuyhhn1bsyFmXD5pz
         ol3xjONXORXbLFLX2b6y61KpAfVlIA541v/88K3qM1ecU3ABfaMqlOKisef+gjRZkfKW
         na5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252785; x=1761857585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=;
        b=XGh6HZ/XxxWnYg6qwwGY/VE6kDHiRix5wVHTL3G1xlwU9+U7+1xMCuHMao4y4KkfFP
         yjXS5G31E0SkcxNobJVyOT7w0bnNkYaxn/Z6nl3u00j2AbxN++fy8b2rpsDKEVna+HxF
         /z8UsSCMvS6fx9bQELUm/a9dNUoB9qylEuCzG+XogTDIZQhvXZP9+yj70QeyRrWHW3wj
         aPfWRf3mZB+3JON7QrKvvf4A4q4wM5hNKMyrEzBWWDpbl4DoZSZvm5MjOb4Fj+1Zi4+X
         VxbczNARjrmtRFIzIXCShGeEPPOPkqUwJTTzJm26CZAwIIM9M1n94dT60kD/3TP1hPYQ
         Dvrw==
X-Forwarded-Encrypted: i=1; AJvYcCUrrbNAbDhAeem6hjAi10Jc6IWcm//EFzEX1YjM2t87ooXjseRiC3hYHSluwJcjYowD+J63x0e+k9Lc+8nJNru2@lists.infradead.org
X-Gm-Message-State: AOJu0YySs5YZe/SAlOM6px4xcz0i5j4qgS6ZzYBJyEHmbDbS744P1/8Z
	mmatsNKnDPCxDBEs6UF3op7B0bFi2dwk2ElxABOC5zKmwap74UpxbyHVSP7Z5Sp77cl2wsLYzzV
	exfhVv6g0KbALMNJInHi1kglQLXingQ==
X-Google-Smtp-Source: AGHT+IFP81I1iyalJE6aYdlbb3aYFaFBB5LVK9Iwi6HZICalmHAgswwkY0DX0NqFtFW5Im4RHwVUP8KP+TPcn7qo9cA=
X-Received: from pjxx4.prod.google.com ([2002:a17:90b:58c4:b0:33d:98cb:883b])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c2c3:b0:327:f216:4360 with SMTP id 98e67ed59e1d1-33bcf853706mr35210162a91.8.1761252785336;
 Thu, 23 Oct 2025 13:53:05 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:44 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-3-willmcvicker@google.com>
Subject: [PATCH v5 2/7] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_135306_790617_14B2B716 
X-CRM114-Status: GOOD (  15.31  )
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

From: Donghoon Yu <hoony.yu@samsung.com>

The MCT register is unfortunately very slow to access, but importantly
does not halt in the c2 idle state. So for ARM64, we can improve
performance by not registering the MCT for sched_clock, allowing the
system to use the faster ARM architected timer for sched_clock instead.

The MCT is still registered as a clocksource, and a clockevent in order
to be a wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM32 SoCs don't have an architected timer, the MCT must continue
to be used for sched_clock. Detailed discussion on this topic can be
found at [1].

[1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/

[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
---
 drivers/clocksource/exynos_mct.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..96361d5dc57d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -219,12 +219,18 @@ static struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+/*
+ * Since ARM devices do not have an architected timer, they need to continue
+ * using the MCT as the main clocksource for timekeeping, sched_clock, and the
+ * delay timer. For AARCH64 SoCs, the architected timer is the preferred
+ * clocksource due to it's superior performance.
+ */
+#if defined(CONFIG_ARM)
 static u64 notrace exynos4_read_sched_clock(void)
 {
 	return exynos4_read_count_32();
 }
 
-#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -250,12 +256,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
 	exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
 	exynos4_delay_timer.freq = clk_rate;
 	register_current_timer_delay(&exynos4_delay_timer);
+
+	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 #endif
 
 	if (clocksource_register_hz(&mct_frc, clk_rate))
 		panic("%s: can't register clocksource\n", mct_frc.name);
 
-	sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
 
 	return 0;
 }
-- 
2.51.1.821.gb6fe4d2222-goog


