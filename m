Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85821CF9C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJIhZfmMqbO9mcnaTw+JwlxVWIorab3X8zBbkjMr7nk=; b=15qrzUg1Drh/Rc0vwIjNrOrlDG
	fVNF0v1sCCaucRu23P5cXO3qc7geHhXMVGQ4K2tC0Za5Q15T56ChxNG/TMHm6YNdFLdbbVudQOhy8
	FJSE4ywes/S8a7ZAtmKTcxn/HQOQKfxLTNaHHoxgKD70oPitAQxNj42KqpJ3Mi3gokCpYSWG3tFRD
	tkxCE0IywoRuCcUkLBRaBPYtxVdq1afHv2Yo2+Nr2wFqJXUtectpvbgi4v1D1zbqYpeS9DC2KMv8I
	NWnhjDRLsioU5sBqbWgpvc2UhrttXtTZ/+fB8lEKv5BA+qF+K+qHNHPI17+0C7IVyACvl+ecdHANm
	XLRiDshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cY-00000007Ek9-0Mq2;
	Thu, 20 Nov 2025 18:43:06 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cP-00000007EfV-0rmk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:42:58 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-345b4f2a8e8so2369322a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664176; x=1764268976; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJIhZfmMqbO9mcnaTw+JwlxVWIorab3X8zBbkjMr7nk=;
        b=sxELO1ikzgxEozR9KrtkT2sr/7Q7ZHPGBkUuJIrfHUZfr/iLnG0qfTGiJw52Ric/ys
         zeA1ouwWmtEtgxQYijMUCPGZKbUruoHebQeqvVqhKEA0GRCXNYivFAhGVvMwLnjKrCN2
         8ZopfkeTlkO9HMNTkg6+q50KOfPy+Sa0BW6YbkOtWVAun3sGvHYn/o+jX8ZBSOEA7bHK
         wXQitF5E/QQe4xt9g8SfZU/6Fu16AXeZB1nla8iXp+zKDT2MQt6sO51f1R3by3DMihl9
         X0NsbIAIYR24TE9o8p3DjE9UCGhEqnr/Gxy+BTCynM/izKTvxSNdn/2hznA1c0Qc3iL8
         qzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664176; x=1764268976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJIhZfmMqbO9mcnaTw+JwlxVWIorab3X8zBbkjMr7nk=;
        b=H79v+shiDkPQNySHXYfbIo+XfSwtzoEks9KcRv9LblsHypAW7vJVOluKJYv4RhOAB6
         F6I4Llqyh/YKHrNR2GqzYpyVjWExocPVuGElVx/0GHl+nAXUlfcY4QdzRXVUhkRt6/CX
         vUGArtiOhGmWidfApe+VCzcTAbtwXFhQWXwGi3rHNtwbfNGC+vLOzYqqJjsS4wk/LRFL
         A1DszmXUJxgkJdnSfxnB8pqBR3zI7BN6fLgklhoGotijZ2v2R3w9T+DFc0pui40+c3gh
         Yjih8hhhpRhzG5qwE9vyMoVCK2fjxmEFBWYm09V1OXzA98LARri6uxJqcP/I+U7liXYK
         QDvA==
X-Forwarded-Encrypted: i=1; AJvYcCWH38FkStVZQTRJ5RINCooxVinFFdoo3wDvfNZChKs+HtpMjlqVhCjeQuwGlxiE0LsGV6oxnbqHITGUwZpXiy3R@lists.infradead.org
X-Gm-Message-State: AOJu0YwjPrFaG5cRw4tPATID9CjtaNGDJF8Z0pDovDDzfoB/6VRiizqP
	y9h3ppKF0F2SaVRAUC+Be8zQVoZcQttP341QRI5/LK37iXua5OHK5bhfEd2t52dQYBgHXFm955Q
	fCPKd3HLO9NLvWYu8xhAjoNpSWUArGQ==
X-Google-Smtp-Source: AGHT+IFl9fEZIqkiFghfs+vHISTz0rvAH1muHgcGsd/RNvOZgDkuVVLTz0XzwarjQHuZpL8REviNMoTiDtwcLfUWL4w=
X-Received: from pjon18.prod.google.com ([2002:a17:90a:9292:b0:340:5073:f80f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a44:b0:32c:2cd:4d67 with SMTP id 98e67ed59e1d1-3472a8fb8bamr3465095a91.13.1763664175778;
 Thu, 20 Nov 2025 10:42:55 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:31 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-4-willmcvicker@google.com>
Subject: [PATCH v6 3/6] clocksource/drivers/exynos_mct: Set percpu local timer
 interrupts for ARM64
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
X-CRM114-CacheID: sfid-20251120_104257_250387_FA8180E3 
X-CRM114-Status: GOOD (  13.20  )
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

From: Hosung Kim <hosung0.kim@samsung.com>

To allow the CPU to handle it's own clock events, we need to set the
IRQF_PERCPU flag. This prevents the local timer interrupts from
migrating to other CPUs. This is only supported on ARM64.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20250827102645.1964659-1-m.szyprowski@samsung.com/
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..1429b9d03a58 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,9 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.52.0.rc2.455.g230fcf2819-goog


