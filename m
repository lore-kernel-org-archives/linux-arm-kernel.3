Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11649D2CDFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epPHunbVN6ELvj6p+MEX1OyxA6JWq2kv5WE7lZYQqjY=; b=Ac+Wwae7BYFu3rMxtFOuAAxNTl
	ntwPw8LhAB+Y1ceQ/4lzWj0reb3FsO6RrgtNB7tdHnS5RSN9gGIpRLCytrGDqpAJQ9exmMLCIuF8C
	DGnN5hhcrQrwMv42wWVQ9/vkXv8zWLtnjEQcDguqiNqcYW31bxYgL7JdbfVTuDQfvzv1jDsH+xuua
	BAJjQ1KMkXDVxhHVNib0CEfX26PJbNgkEoIqxbj+U5JZFacR+RA0lcbJMLF8ynnfPqIoSZ6eZepdX
	F18ctUyy1KBKIM0/uUcC8VoP1Ltf31mffOKI6rTG/3W2Ja3HqUQb89C2/QdQEC9lypl26ZOvMYXn8
	zZuzzrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLG-00000008qSO-246N;
	Fri, 05 Dec 2025 01:10:38 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLC-00000008qQn-43pL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:10:36 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-297dfae179bso31630495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897034; x=1765501834; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=epPHunbVN6ELvj6p+MEX1OyxA6JWq2kv5WE7lZYQqjY=;
        b=tpihnKUHbycWy9L4rrGdJqeDfooYFJ3tJoP57IE3RL3iwKIeu2YbWIrEkM8fXOU3vN
         RAy6FZtul7h3C3SIEmxc30VQmzVgrfJZsdd+1rzusrXrDHJCnhMjraVXKk1VUTTV2aMj
         /hCZoQAx/CziUcnxF/2tKQxtzVxsQV1QMOfcZn1EhojBFeeKVQq81Nob3kGKIIP+q2ed
         cS26oaP4oL3xPBf48UbKrua7+QF2l6KBolgCidt6G1MogZcaTFkmFM8fz6HAaX0K3xeU
         TWt/JmgL1eEcx8j273ehtjt4Ybn9JkwPokr6ZWFnnUhho52GkW92lJBwVNoerfhlYclV
         H5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897034; x=1765501834;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=epPHunbVN6ELvj6p+MEX1OyxA6JWq2kv5WE7lZYQqjY=;
        b=h94e4n3/p/tEhswwHpog6/kEqoE7j/HgMK8+Rh7yyhJbApw8rtlfbVUw3poD0IMXvo
         czwZ+tOB84200PiZZGXDx/hF0h8527mhCgv30kNFqDhMnkKXNxwFqjBX/xOqDiWeCxmp
         oZwyTvfAg1KNRZV1chsruH3fyZu0gNh7j63rodMsMcLvuZ8uAYsM3MAf1l0HmybsShu7
         /RBX2JpfASrLAdyQ4ZJD+sPd6JhlXixyzCdJQyJoG0DGeXiSrpRJXwc9cJfdGIsag22H
         V5BIepvWkmGSEaQzJp96vu04P9rW6cShIXtvWnIikMm4yNi45BOTeeHJWVS33eGQjP0m
         kZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWr/mirucRq9ttl0HpZFCnSYoIuPslH4Q6bO1FFOPvDHSwUYgrtjAcfCOXMTBVDDSKuYT3YRFkC6fdnz5ILLHh@lists.infradead.org
X-Gm-Message-State: AOJu0YygvUMxCHaDoA04Vr+s6LYP7qryREENnk7xsJxJQp4pF10TGYwp
	QKMhyTDqy5g77xULR0Y6p32l51c/UfZcDwbySe3eGku3fvx+EmzpFb4zhPcPQmpsd8Pn4a8zTv4
	+7dboZfuVqbzj2tihjNhBziSYUAE97A==
X-Google-Smtp-Source: AGHT+IEsCk2LyqVOkWJhdegH8mdf1hOi4A1iW6PlmwDrObjR3XVrHjRiwFEIsDfkYG5erGemrrr/fcN25Cehz6zSF6g=
X-Received: from plpn23.prod.google.com ([2002:a17:902:9697:b0:295:1ab8:c43c])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e544:b0:28e:a70f:e879 with SMTP id d9443c01a7336-29d68339410mr94473405ad.1.1764897033869;
 Thu, 04 Dec 2025 17:10:33 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:14 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-2-willmcvicker@google.com>
Subject: [PATCH v7 1/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>, 
	Youngmin Nam <youngmin.nam@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171035_008885_D92D14A6 
X-CRM114-Status: GOOD (  15.23  )
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
2.52.0.223.gf5cc29aaa4-goog


