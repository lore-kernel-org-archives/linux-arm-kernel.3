Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AE3C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNxanwBhZtQZDwmjxM/W4Nk49HxAQJthjw2/nXfZ67g=; b=v8rauvchUCNrr4gT00W/ZOhOll
	b4nY3fzi9pPQXKnX/6u0I3rV9YYrh0yk2pgzGxfPqUSBeo7E5d1K7JaxdetMG+FOBFHfu/4UeSTNc
	Xsy55LcfDtt1/g0E+QdfN5ONUYQF9CEyBm0wJ6zONqrPAhv5S0YRZJx7fwIwgRJYaktmNl/voYI9r
	vY3jy+ur70Yva430eCE5CXEliRDuKTLHKAnANoLC3FWLTEA/fwIwCDU/qIrUplaLMmbLanUuYZgki
	bMQqzxNJJ1f8U1S4KsRsM116SYgeJjg7FbQOceHpoJST8lxCfLZT6XVlvCSTFjx2/x6PqFIi5hCfV
	uf/kmfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOCp-00000001ZJR-1G3Y;
	Mon, 31 Mar 2025 23:06:11 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO7b-00000001YXg-43Fr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:00:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff68033070so8146908a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462047; x=1744066847; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNxanwBhZtQZDwmjxM/W4Nk49HxAQJthjw2/nXfZ67g=;
        b=vZITrzkpbrPzT8tdTEQHlaysNFZLh94cAXq14BqDIPPZYbfAyN+6ysah/g6tTZpPQw
         /iiiGQcfwsKTP1PheC7C0cZFWybUk8hMe+KVdTMdJMfBvOnpdnmO7Dm9aRLpeQmclyCe
         nE81BbO5BWSZDPnjQ1H/oluqp54oAskAYMn8+4qZDlkkmFHL6zHjdWHgpBQQradXz7Ns
         Tn7CGNjCXiZHKrri6fcCu9GMZVolY/k8LzT8dYIM3YitYxUeLw/uE3qXyLLMOaG+hKjP
         6Noh4u11UvLCUtGuq8izctRn77jGM5y1QL+DMcoYvMMd8XVLmTI4ZcqAJ5BOm5v+uTBC
         rkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462047; x=1744066847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNxanwBhZtQZDwmjxM/W4Nk49HxAQJthjw2/nXfZ67g=;
        b=JcG6ZHrwfsLKFUtuuyy/D/ad27U5yCahCFPzMsaIGwFBEG/CooDSy5PbX2ftcVXlpI
         pxpWpKuXoUH8G4KyD/xANvRXq8z6MduvNMLQJDIAYmhF/5QoJr/07WZW5cddpX4vugOB
         8e8VLhiYD5KUpe/cHbMKPVvKflhrY1xtVaNroA6yV0P2qWJDwPc+XP0KsGqxS83QN7eX
         f/kVI/BXj/IJQRcU0z0O3Tdm4jnme7vx0+XUlpnKhnPbI+/dkvhkftolbeM/ba6fndCU
         7QEzA3J+aVH4MHAW4+AFOafKRbpj96vuHACpRby5tM9gpMfDtXq3N7q/uCg6tDieNnEM
         W3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWhg1tF8MKhBel/RMxeSXQusyBEVP609wGqzmCucklr2IQuFYEkwxr9dNUNtXr66IdR3YFnWngQbQmyPbn43ALR@lists.infradead.org
X-Gm-Message-State: AOJu0YxK5NABJdu9wLJiGYj3sH2XHsSUqb+YlywqyJuGbMMmKd6ad4Xa
	A3OhjZfCgTcUZ+sZpPjAkWPcChS2O6Ag+IgG8OUJIZRT7sQ0DywV9A+LqDJKM2+T9sFLGudWe5J
	CiI6C3ilXjJVlc3iWW7bLq4MTow==
X-Google-Smtp-Source: AGHT+IGJF8B4sxZb6LHBqCORBrMjWxFGFtbVo3ixsesEJYQP3zIzMH571Rnw1V4KCZ3ejHSwrtmuRTWbQo8qDLDw2/U=
X-Received: from pjbqi8.prod.google.com ([2002:a17:90b:2748:b0:301:2a0f:b03d])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3bc8:b0:305:2d68:8d91 with SMTP id 98e67ed59e1d1-3056094bca9mr1574788a91.28.1743462046748;
 Mon, 31 Mar 2025 16:00:46 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:24 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-3-willmcvicker@google.com>
Subject: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Donghoon Yu <hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_160048_004431_B4DFCEAB 
X-CRM114-Status: GOOD (  13.96  )
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

When using the Exynos MCT as a sched_clock, accessing the timer value
via the MCT register is extremely slow. To improve performance on Arm64
SoCs, use the Arm architected timer instead for timekeeping.

Note, ARM32 SoCs don't have an architectured timer and therefore
will continue to use the MCT timer. Detailed discussion on this topic
can be found at [1].

[1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirantan@chromium.org/

Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index da09f467a6bb..05c50f2f7a7e 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -219,12 +219,12 @@ static struct clocksource mct_frc = {
 	.resume		= exynos4_frc_resume,
 };
 
+#if defined(CONFIG_ARM)
 static u64 notrace exynos4_read_sched_clock(void)
 {
 	return exynos4_read_count_32();
 }
 
-#if defined(CONFIG_ARM)
 static struct delay_timer exynos4_delay_timer;
 
 static cycles_t exynos4_read_current_timer(void)
@@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
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


