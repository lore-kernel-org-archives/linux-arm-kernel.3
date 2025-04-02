Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DD3C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igB5EzbZ4UddujnhN5pTR462QEE2CggaY13KiAdG+kI=; b=qvxHiYTkd3Ysur4Cagtnk94gXl
	pvYOR/ViXdY1suiR26Yrqw0wllFzuWCeH9MoLk+cYLDMGJyY3/c6PR79eyao4ZJNFG0+LZ8wIldR3
	tCimVLU9UDDospKUEfUqprWHcoc2421udpgM50YFUJwF5ezbqJJXmYMl/3P9MJA3yx4FTh1RNv27W
	6RwC1UNptPUIx4tFvw6IgbBUwAL2/cUlAcbYD9sSDqII6VjpH75o1NRbtzrPJYx4DnNgZhUskCzK6
	ZlijHzGG9kWqX+ZiR42qOZ8H7nzxUtYfAWBBb3MSeguUDKwvMGb2ovxl5RqiBJjwjRfzGJfwAlh7P
	KfnYIz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u081H-00000007SlI-0BZ5;
	Thu, 03 Apr 2025 00:01:19 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07be-00000007QBp-0fyK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-736cd27d51fso229983b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636889; x=1744241689; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=igB5EzbZ4UddujnhN5pTR462QEE2CggaY13KiAdG+kI=;
        b=ubcpHOjl1BUZpp5lle1wsXJqp4otPx+8DVCRmFJAKxPGDURo+ZSS1fvgAIs7m2pArj
         LXROUkMOdXiTtp0n4JXhkeaSCMyxlDJIkZnmTyJJ1bGp+2qqBDnidMsUWIDaqz1LZs5N
         GyQ9YctOhEu5MWAIGcTh/8Zs9Mai27H3JjjcIR/1jaGipoXYMS1prERB0d4enajT4Rrn
         bSaJyTkOYIUV9wvUZLDmn0ueBUiW9CNqLDLONmPFqm8SlVVlfs7vWP51K+xzelyHT1W5
         2nPHsUalQojC1whfrzyZAiJ7m+PZV+UujUkXiu+VgUFdURBdkz9YvUlGIvGWKe5iZp+C
         2Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636889; x=1744241689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igB5EzbZ4UddujnhN5pTR462QEE2CggaY13KiAdG+kI=;
        b=HJQf+4tUJpwaL2INbI3MK/FJQqJPeUpTfC1RZQaAnH6jMltRnVZNGpQrBU0Lse4z+e
         6OEHv3FxCiMjZiJaFIjvkufdxV8SQ9YdMgVm03FCCS1TU30iofo6NKMGj2r1VQ7ZfVYT
         1XWiPQZ3pNK7wJfzONYEBTocZEKLOi8LfSt8/5y4sVjJ1a+y/7UER7lSlGknHGRzPjlJ
         Ex8epdWW/IvqZ7bvJ8DUdt16rRUpeqZYV2u5+7s4vZfbIo/7UUxPjEfpSVRsyoTLPcEx
         4o+ttO5D/4FhztJSPLwP3eIkPEOYZyObQmI7hOpfY2SwhxiCGr4JjTreLMpIPnyPCVRa
         MxRA==
X-Forwarded-Encrypted: i=1; AJvYcCX6PtO4hruNl6QUBsX2SiKDu+kzm3IJ8MVQLQC2OJdwP/ldog3oCb6DKdRfHE+o8MG5pu9tKnmr+HKkqldJGMhS@lists.infradead.org
X-Gm-Message-State: AOJu0YzhvWoLCRdOG5jIYEQw3JZrEs+ohOm8t5ATwtFxDdHmaRPk787f
	DiHaU1QttDsXcPJ/9pgu7A9SZjpoqKgRp35WgwDk0aobQ9IUrkb2pwAQRNfEon0TbpuVi1Qg+GN
	hs4Xz2IY5mu+mE7+6ez0RbzaRpA==
X-Google-Smtp-Source: AGHT+IHliF72RhoVlooK9L+c1Y4iuJGgr9wHIupvklzWWd4gEqQfjkuZNyDHtoJev6b5CUsHoC8Btppiv9aU79bLH+M=
X-Received: from pggj2.prod.google.com ([2002:a63:cf02:0:b0:af2:3436:98b5])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2d28:b0:1f5:93b1:6a58 with SMTP id adf61e73a8af0-2009f5b912cmr30610075637.8.1743636888966;
 Wed, 02 Apr 2025 16:34:48 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:54 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-4-willmcvicker@google.com>
Subject: [PATCH v2 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
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
X-CRM114-CacheID: sfid-20250402_163450_199852_D2DAF30A 
X-CRM114-Status: GOOD (  12.79  )
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
migrating to other CPUs.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 96361d5dc57d..a5ef7d64b1c2 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -596,7 +596,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					IRQF_PERCPU,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.49.0.472.ge94155a9ec-goog


