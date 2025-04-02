Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9EBC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVr3hb8iK4op+4MgIQ86kZFXoHl/MtKw2J/QRgo4taw=; b=vgxCGM7J8AQAV7dQ3Imu9INg7u
	t9L5XnTSiqfI864UOKbx9IVmk9uHghgGKieuWbo0vxy4zPHH92NxORYPP1BjCefBqcFM4kZ/iymFa
	OFklph3hSZ64ncu84pr2e7ExLBt0mikNZ6QabP1HrikMdhXoGTRU3YJtSJNJ0wQkPv/kuC9zzLNtt
	MhwlgL6pTUt4JbkdAzWR54npmFt3H8B9ikFqtwNSfcJh7rUt5jbcSsz2F9S/y/gn/amme47OVLvIX
	MBz4h86etb9ZStJeaWGfHixD1qgy6yI9KC7OAcornwvG2vmldSeQp2NPahHb+ML+UuPeSaEP50WBs
	0UwdjQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07zY-00000007SbP-1TlS;
	Wed, 02 Apr 2025 23:59:32 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bc-00000007QBS-1KkU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so262058a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636887; x=1744241687; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVr3hb8iK4op+4MgIQ86kZFXoHl/MtKw2J/QRgo4taw=;
        b=h2XuG2gVAR0wZFnueY0jmVvjERFpv0zc4NMAkYtMBOkJIK6kVg+RqAgyjuQU3AlbSE
         16A9pok/5XigvGUugjCset+Gm2+nGEjdfsi3wCuAaZ79YFIBuU30d1qIyBoTJZJpjUXV
         SNoVrEW2Q205e41gM/8hXxK/Vvozz/aBvYzdApJDejoSYaGFBm4kDaFZq2PFT3lPZAUu
         XxpykxWvdsU1r7I2XKa13hPMAQuOZ86HgnaS0wREUJo0ORT2aY6bXz5oZSGqBuhLerZX
         W4CwY4AEC5+zbWMw/MLDDs1pbeIaD8q/xpg1zGCsUx8ThTncwpOP9l481nxklBJqkhXu
         00jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636887; x=1744241687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVr3hb8iK4op+4MgIQ86kZFXoHl/MtKw2J/QRgo4taw=;
        b=LycnV1UPXVpantZWnLtCemh0+YmdOSfvp/bYmSYUbMHd53cXoL4gWmO3MgebxUhbgg
         cTXTTQVtw+XsVxVz5m5s+IHyAWZSuaupYA/SkEqnqLLgc9NMaTwj5HU1zkoOyT0cLKH4
         oJFGz+94akOJkPFQcZsCkM+IQH6g9ERs6u48Igr6sAt/e1uI/VQVCY3nkYdJbVfnZW93
         u1pWDtve7x7Gye8gc757nPYhtVlvZbInNuDKbURGPAlHzn7PNE+cKXrArDFsnbu1QPwf
         ncljbn7mmkDwNdwCKPS2iq6cnOJfkIbhklvLYjqvI6aEFFj2Ip1wFpYlQl9tUfkooWK+
         Ue1w==
X-Forwarded-Encrypted: i=1; AJvYcCV+nSA37Qsp439RPUiCdcKMwdDX8CZQcOhCETMycLliImR9Fi50WG3MXS/SUNphvgKUOtedYX5gzVLWD8bojOjW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7oHDmKthWxu5XK9Y9KCJg1v0vMYsL98v5Id7sIKQfqToKq/fA
	roHSRTeJpewjOyuIHfc7uHNtvC/h1YBR520gbhnRKOWgOoOL/Z6jOq/EV7XGOxvNZwDS5VqtJk3
	NLYu66wCAQomb7ncrKrUelDvJyQ==
X-Google-Smtp-Source: AGHT+IGFOOhmWr3Z6viGq+ulkQ92nT2eBCuYGsXtiOmRX4Ho8ivQC5UMWY8LfRMuamRE7HQJon2Mz8MvCxGpPT2O6fQ=
X-Received: from pjbee12.prod.google.com ([2002:a17:90a:fc4c:b0:2ff:4be0:c675])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b50:b0:2fe:a0ac:5fcc with SMTP id 98e67ed59e1d1-3053215c05cmr20698254a91.34.1743636886898;
 Wed, 02 Apr 2025 16:34:46 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:53 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-3-willmcvicker@google.com>
Subject: [PATCH v2 2/7] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_163448_355244_4E5DB9E2 
X-CRM114-Status: GOOD (  16.67  )
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

To use the MCT as a sched_clock, the timer value has to be accessed vi
an MCT register which is extremely slow. To improve performance on Arm64
SoCs, use the Arm architected timer as the default clocksource. Note, we
can't completely disable the MCT on Arm64 since it needs to be used as
the wakeup source for the arch_timer to exit the "c2" idle state.

Since ARM SoCs don't have an architectured timer, the MCT will continue
to be the default clocksource. Detailed discussion on this topic can be
found at [1].

[1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.49.0.472.ge94155a9ec-goog


