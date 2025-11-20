Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43A9CF9C7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwVcqjt/+P6tfyy9WazYLCo3sTdT6XbgNKzwRFFAj5A=; b=dpugqL6R5D0L67HeDBkAv9O1NM
	uxOM8/QIJJdL1cW5n5pkktG2f4Rk0WOxDaP9bGcWizpZ2kagre2LFHub26nntKgaZFhyPVCjnihQb
	NnSfIQ51O2bxPQynbelxKG1jG3oRsuQB7mRc5jQH1me23iXgLcIN1PeEaCuIZd73i6t3PSGq73wbI
	YidQ18OVu6bb/oTBFB/1TLdJ3TpxBXMiVIteCfnn895vKdHXYL+MIfKWQDX+PoDSwn54DKGA8InRR
	+6PIzWFdERLY7SxqavKJaL4m/EcJjNT1m/Bwh+XqiGc25GJZG994PfESSaqmlyH35ue+Tb5xLwrhN
	Cg9/PMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cQ-00000007Egf-3LDp;
	Thu, 20 Nov 2025 18:42:58 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cN-00000007Eeu-13Ed
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:42:56 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-295952a4dd6so26896055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664174; x=1764268974; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dwVcqjt/+P6tfyy9WazYLCo3sTdT6XbgNKzwRFFAj5A=;
        b=XnEAEikI2m61NQ3x6v6wIbLz7EJfPv1prtRQpmFnzHQA86YnsNeH1pf/Lo1c9itjTk
         gilnMifDepPi1NwlOrT2+53YGjJtAFuXs/eiUk2eQGiIa6sNtdyGEAKjIjvHYA5n80+c
         HVAaMfJnMewiPPxXM42b4lqGWLEr1RmG7hy7VM+4P9YYOg2reFHCwz3I+kq/JKBwmqsl
         CLV1DgDE9FmR+8gsoaGNJ/sZ4MtheqGkwFMCwzwo9plba5U+tInip6kP0vzTwuFiwdoi
         rSmGr6yRnR7hznHnoTc8z29ti1Lu0ghoy5km913FovYZMZFyT/e+IZjq73TRE2cc0Vcw
         5lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664174; x=1764268974;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwVcqjt/+P6tfyy9WazYLCo3sTdT6XbgNKzwRFFAj5A=;
        b=ssatdtY1sKfujkscfJ689RfDuDJuSdwL6ykknyo6V9DaKPEHy4vSZ0BAkzAiz1P8BF
         OtE7d2PdmSXk7LrlVGQL9rN32yJ5WFdoS/8XiDqA2A1CoVtgCyLKyOEA/16LVH2CK2lk
         d7DgE5ojVO3fMmDxR7b05b26PdcKH8E/w8OUrz6jrmWSoIKXAVn1Nso7ULwGUHgxBsjf
         pbmTHwpOd8Ymg+BGBXPhsgTiKKQkxC72fOfYipQSkLka0FIeukHJjLevz76J9OKCQKH4
         cyS+kjCvDY1Ld3i/2dFHLQK409PeW7IH3BpcOFu6OwWtXkwSp/ipGl/NGrLGLquW+51L
         +HDA==
X-Forwarded-Encrypted: i=1; AJvYcCXh/dVS1mosEWLx8tzrkc/Ut7L6d8ZK+AFHGKXrCH2w8zPJXy5UqKtRa4/dM8X0OiLE7/O6Pb8S6Xr353hbCbiy@lists.infradead.org
X-Gm-Message-State: AOJu0YwwSW/06Hasp+kMqvoxyR01Z8BsO0b720VZ3TC5Vu5lciXoWCfm
	JpXeeeWw0Mr7EHP0/0MW447Qv+aX/xGGSz/pEtjUZqy7toVMqwpiveAroZBX490nJv7mw+6qo6s
	wUmoD5SW/2IJTg63saB95OFSgcpU5xQ==
X-Google-Smtp-Source: AGHT+IFTNfvZtT0WzL5Nc+FAu6fv6lCFS2ToKvk1FK8qn2vpItsaemU3AQtQmy9D0GKcQaDz7XzVGZor3xk+RWh+byo=
X-Received: from pgav4.prod.google.com ([2002:a05:6a02:2dc4:b0:bac:a20:5efc])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f54c:b0:297:df99:6bd4 with SMTP id d9443c01a7336-29b5e38c0f2mr46481795ad.18.1763664173790;
 Thu, 20 Nov 2025 10:42:53 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:30 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-3-willmcvicker@google.com>
Subject: [PATCH v6 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_104255_294300_0B2A5D3B 
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
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com> # AOSP -> Linux port
Signed-off-by: Will McVicker <willmcvicker@google.com>
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
2.52.0.rc2.455.g230fcf2819-goog


