Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB73C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=; b=BO4gglwDeApowsZHWMF9OBs90W
	c8soLwtmIl8FonWevOw6OVwo9rrGvDHhMuFGnt58ZnYgW09F1G/kG5ygNfvKCRfOAB+BOeQ3u4yTI
	ESfYs5hnX9P1fLUFxJc1KG+T7FWCBTUBEcMVBGCM55oDie1EgpAWlOVGw/uNh6HldLldCfTXO5FtR
	Kak1ZT98EmdKqct4MyfeiOfoaO396HsqgPzQwITkB2QDE0WD/Tf4Ueh+yhNxhOMxfjBWD55VU8ML6
	bRPtC0eNYtprsCM75ThaHZOAIGXUkwF4phLdWcUMSKEYOsOUtD/ryOcKU5t0mw5cDvohK+oRfpYzl
	kRQAbp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgPg-0000000GM1V-2dbv;
	Fri, 20 Jun 2025 18:24:32 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgJ6-0000000GLLH-1yfT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 18:17:45 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-747ddba7c90so1915930b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443463; x=1751048263; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=QRTvbjK99RYTbQ9mggiHO31W94pBIsp7pDB0Kc2dbGOPjFTs+omKFhzjXPo3RMyGrv
         kFugdcMvvkqt3aFIUew9+H9vOPSlcfSqGdIS4V9pqE1plmAbS8RvvyM7SxaiOalWXnk3
         APG3MujgICyFwHHxsWvG3HChcTqEylN+Q9VtmBLoUVJGbklwiA08HcBFVOiLIcHzVJey
         Q7WXqzXDwlLdwdM/rDBc9BQiMlRFNPZqsI1JH9jE+ug15yc0HSoG8sxflMEk3sUb78I5
         +/Fo5lDEImd+XXOEhX2E12/yWPtAXvJNlsTDvtU2LtFmN/6OqNIek37Sv6kfXCPH5TZd
         rwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443463; x=1751048263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMP7Kl6yow8Faa+m4ttvJDoB9/AivqWlJaRr2H7xdgs=;
        b=m38eIJAuqB6SpT6FQ8e7n7EQwqM78H7yip2RMKaxhmDG/yTUBzzcMWzAv/Oi+lYKIr
         9dw+A1g80AtrFF08TfvU+ECBJ50foUmrO3ARFzqz7JHyRaAg2fNGQWoMIfiH6zK5nV9F
         0QynY2aOXuGyKP3UPSjqUjsXtJVR3lwO8nPLIO4qygrH8RjqpV/FUiylhTB18YP2GprP
         b0Yq2SPQKl49CQsz+LnzQ0VFdG12pWWkTckP4U4NPqBtfyl4QsGSUa4Blm0mN8WIcwpi
         lPJvwMuK6zvlonsQ8QmAfVt01LGfDmOF/yul9sECP2i8mhKFQc3QN2VRDmP5lRTvRP99
         lgYw==
X-Forwarded-Encrypted: i=1; AJvYcCWldE4BxYpfOAHBS5SMnHP1vVtou3KybI3YQHk0KtXrtKI79NCFwgf6sit+0YzcgRqn39aJC5I5ZDuXavKFBg42@lists.infradead.org
X-Gm-Message-State: AOJu0YwehBaG78sXSmUkUUnNeHIUDo+nNVi6+T4SRjxfzUFAjqJO5ocf
	yjBtcTFlOrNMRkUz/dfWvAPEGVqYczhXOxqoAaDa1YCID15yow3RJKBfa6iFr70kVNz0dJMy1OF
	2U9eFo2itcwY9ixzmjZcuWuPL8Y4hvQ==
X-Google-Smtp-Source: AGHT+IGm/vFj5hrKzWy2Z3pEyDUaKOhhI+CR5MlaibQ4Zvsy25uFRQsZYTONpTVOibGjQMqu8859Np1afVaE2rSP3T8=
X-Received: from pfbef10.prod.google.com ([2002:a05:6a00:2c8a:b0:749:10a2:4f64])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2da0:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-7490d7b8df9mr5222155b3a.19.1750443463199;
 Fri, 20 Jun 2025 11:17:43 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:05 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-3-willmcvicker@google.com>
Subject: [PATCH v4 2/6] clocksource/drivers/exynos_mct: Don't register as a
 sched_clock on arm64
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_111744_503000_9083178B 
X-CRM114-Status: GOOD (  14.75  )
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
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Acked-by: John Stultz <jstultz@google.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.50.0.rc2.761.g2dc52ea45b-goog


