Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF5CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=; b=fShWq8ckqngqnL38K055+bCi55
	XEUmiqFWlQmDEQo1wOsatfoktqI1lhKGXSFuo96w3aippd8P9y6kehGt32dGvwmkIjYNBINucgc5w
	SMmuv+PRopn983rQVH2wqObOcwixt+8SSs8YVujZvzb+0ni9HY3HO1WeKVYk2BZhevgOciRSzlsoW
	EX3Whqd8L8nRuwbpzjR6Gcz8Vhj8WwKjc0CdZTMON6X/DRBwJWrtGV5WipQXJ+M9HaL0xF9014XvC
	ns6uCRKrqe6prBHZKDGnUFW1Jr1S1ES8fArW1ANIAnHMW2YQkxcbPCx5LH5UBPw3xqkv6DbCEqyzJ
	ON1hi1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2H6-00000007ZOn-0nP5;
	Thu, 23 Oct 2025 20:51:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2H4-00000007ZNd-3UQy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=; b=b+eHuNiWA+Fv3udKEVQsknCGMe
	USQWgte7gEv082yFm7R3wGUNYCRdMr3Ei5r9hpX6srhSG8i2xR4Nox27W6EcvsxhtW1yKm/c+UHdz
	xUf9pdb/vKdCIx+QqYw7xC8zfgNE0Vry+zKzzzYQS1HCKEC2qW8k7krrMpkN66mS2IyzENWYvf2zD
	PlkLjf4dLvlfLGVCEFcevQ7R/1u8YlrunYhOJOOgzvdfY2LySGwSh9qkyQvLk6tvNY07ZJX9Pp3K3
	rJU46WyGaVzZ7H5+XxkB4nNXboU4g66KK5kG5PxYMH66oGprxddvhHPYWRf5iyuiRHGdhMy4H7N4g
	2E2bFiFA==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1PF-00000001jsn-00lK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:55:37 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6a33319cb6so932259a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252652; x=1761857452; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=;
        b=X2xM658YhWwZlERXWDX4jc9T7WaH2THwbhdw1ntGiZEdGdRmBNY0RrWLkqoKiqfHZA
         ytx//YiJNDMjJ3JQFUAbq9stCu0wK01D+y72NAioWmHtTpBNjVFd4wQEdnc9WeskgUjk
         yum633y2rG0aKPqHtkYqAZrww+xpf2gUXzQ9p9rB7JrzmeB4K7xXlt0LPBjTY6o1OXjw
         IIEXlf8WoiXE+YkXKbXUFcTnOBYZPn7D9wEVXOCHgv+BLq2YO1t6NYDYWsoWcGpfpVOU
         DPnnT1X/6bk+uVfgcka3NUwx1DjDXqExuda67Dp2UfQZ+uKhEH9CL0diKBbw1Slr20Wt
         eOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252652; x=1761857452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOlNjzKGrmabtYpeYty40nfBQK9A/mPHc8f9qhi2ylg=;
        b=I6KKht5YuvaayGNxbrRUn9MIbSdIV96daOP5AeF2zQgbZsN8a/vYsIK78c+YyiY+lk
         uCV5gtqpIBC4oje1uoLuKIQ/tSdeOjSkOMrjbKzRZs4L6IamdF9edOMEZGeEwShGG4Cc
         /jpHjPB/hIoJ++fSOEMVul8VoF4x22uM27alPIpa/CnAWoXUaBjuQo39imBFtojtbwRz
         554K6zyXaDX4PqIbNeg2pMxd8hkmpnPUQf0vdQ6+xUtlcPqVdU1oCP/1CgBlo3kR1D7j
         DxQFhc3fd33jY7qCQ4QEY1a8+uSH77Dt7MNJMTAiexDgUVXMVHPiIAyJk4XYZYBleihJ
         59VA==
X-Forwarded-Encrypted: i=1; AJvYcCX4pnuJqULMBxS+B5MHilCd3ilNbiW5b6IjSYs3Brf/Ob6T90HK58c+Y+mNhiaymalcwMjswJg0/MP0jnV6xcKA@lists.infradead.org
X-Gm-Message-State: AOJu0YyL+t826/vz0fCm2LjZ2lBkMkLah1fTjMluWU3Sz5TljVgYksaj
	zm5EB0bRRN0WK6RPlAML9BezUEkuGgMGMHFTQphIIrQFDbVXss3Dkhyd9D57yCtOFxmA0LZJn6M
	1cyEAfUBxxBXrHWPnxts1iydYCaawUg==
X-Google-Smtp-Source: AGHT+IG8p3pkosaZ8VG4QyHxJWpBTvZC8r9Ms20gd0LJHErCKtPSqmFaP4ynOh3lhy9g1UGNqy/yUuBIw+1NXTJ6JfM=
X-Received: from pjgg16.prod.google.com ([2002:a17:90b:57d0:b0:33b:51fe:1a91])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4322:b0:33b:2c70:78d8 with SMTP id adf61e73a8af0-33c619d0bd1mr5081679637.37.1761252652128;
 Thu, 23 Oct 2025 13:50:52 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:28 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-3-willmcvicker@google.com>
Subject: [PATCH 2/7] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Hosung Kim <hosung0.kim@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_205533_642819_5A31B010 
X-CRM114-Status: GOOD (  15.47  )
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


