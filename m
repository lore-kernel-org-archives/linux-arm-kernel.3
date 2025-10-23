Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F372DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=; b=I0ul3AX5W0TCMUMPJj0mM75vRp
	I7hogXB6rS1z2I9mkRRS376vzEXwVt8S9bnhNecvTie0dyvpLBI2xP/NBS/l6Y1vyj+CEKV2RDK99
	rqP8qd03sSePHTfJvRLAE5SEfOSx8Gb/b81Ngjw0pkBxqRD7UhMHfA5qOqKxh9fDQcuAvvpwxZFYV
	NfwkRWJx0rQ53AtKrZeXX8hWR0sNa0xrvFT9COq08gHZZ3an/MSbqYTs4IHqq/xl57z8bhw+FBXVD
	IqTJgVSq4rMDCwW/8MMVqx9C7JISOaofTsFv1rADmByaV/QTbXxOOenAs98ex0LB7oILY2oFHnplF
	PJXKehlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2Gx-00000007ZK1-0R8d;
	Thu, 23 Oct 2025 20:50:59 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2Gt-00000007ZIP-3Ofg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:50:57 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6ce7f76617so1963925a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252654; x=1761857454; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=nxLdbBQ6JndeE2tcsmq3GJkMvX3S80Ny/G4ED6Ve7UgIrr2JGrFvj4DXcJtKX+Q7Ol
         rZZVhO93URzTliEECnkhyPhzohwnxDrXsDHfoBzBInqoOxzRobzRze1rP9/iOmQeMcQg
         BxFs+xMmJcu2zUZ2+eAbbdI3pTBI0AVVuEXb2AV/1QJipNtnv3WjGtVc/qwxT95sdrSG
         dpQRAWX+3MLktV2zSlrHP8EAVwAvIaLh18PHjO0+n3wOEcuSsWMzQiZSHUBxJDeEP2Zl
         jCtQFZecbpVk0fro0IpTEBHxthJ/Iw8QKzMn5PBEJ3RKFOtl6EB/PMiVKmHAMEbTSAVc
         KgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252654; x=1761857454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=MK8LWabnpRUphg1QntPx/YA3v3Iqh+9iZXDVq+xGcTBzrRuVSDnpLBwjJQYW2kZCN+
         jxuvVty9jhCRV4fq7qkfKNF4RIY7PRrNJFGl3BRwf7yA8vfgITiogcC+7+kANaUYKxAi
         6T6hsklDdFHhG/Rm0wg0AW1adQzhYPdHheYwT8X/xHA5ZoWuyUurJtsoMLg3vBFRV5ZD
         c0qG3dj5ve7vd+IoJRLItpY99BGHCYVdiD6JdQaq4n6ktVjpKVic/7DhTX6hWccE8DEe
         Z/r/YCOtPewSBhZriek7qN/WMcJqIH74KszU9EPicgfjtyJS5BWHS+Rw+4ryODTDn1XU
         hJWg==
X-Forwarded-Encrypted: i=1; AJvYcCVUmlx3IEuF7ZxU98UBuygDBoam+KyfVFZZZj8Ei5CoG+tY8yJUoIoCRIJRlLqkDH6k13n46hSW+TpOAEZXKVcr@lists.infradead.org
X-Gm-Message-State: AOJu0YwkGnr8my479jA4BYi1PruuUe/Gfe+O9WWVLi0t5lf8MLN9GYJN
	rM0csfK9ATW6LJ0tW1cz1qBaK0WHmOmr4g5UcCEtKD4GyfHYmrQzGRhoLAFA7sE4ytmJ5JOyiih
	P5bBXa3DPyEJ2UzGcc6S69iuPNz6/Gw==
X-Google-Smtp-Source: AGHT+IGL+5kVHhQd1OfDjE63ymS8X2c8akCZDgOtgOFkQSZNDy1zc7o/AWAgmT8EIgOAV2XCAQ/VH6rMwtmcpBUAUkk=
X-Received: from pjqt14.prod.google.com ([2002:a17:90a:ae0e:b0:33b:c59f:b015])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:998a:b0:331:e662:c97e with SMTP id adf61e73a8af0-334a86172d0mr31428687637.37.1761252654301;
 Thu, 23 Oct 2025 13:50:54 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:29 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-4-willmcvicker@google.com>
Subject: [PATCH 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
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
X-CRM114-CacheID: sfid-20251023_135055_880873_9FD1010C 
X-CRM114-Status: GOOD (  12.65  )
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.51.1.821.gb6fe4d2222-goog


