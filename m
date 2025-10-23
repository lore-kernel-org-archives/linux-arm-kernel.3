Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D61CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=; b=Df4w96tKxf7+a6gJWSMLBS+xk0
	hK+ADbGs2PbdrdqJMg+H4kEeG61+c23BUpw54YpncJfHXpGdCjLqg2XUf6TFDHb/BXEhZwKZpYBgA
	ZWtlzJZiLPqnoZ48M3xrEi2nJ9bsRVp7TjI00K/BCmhNlLBPyCylGfhjNA52vUeDx0aPReqBZcDQN
	SG4HWLZwDnzS4c7jZlNsNtcS0Q1dj0QvHJfZzgba9eADQxJnXxICbHNwF3XJN26FpddEoaZTIiDw1
	OoriYw1hB801C8cS/8XkzRFC+mRWHpmg6+sWhEWCJQnhgSjNCevw0aFd/cFzEuo4o1AbLtsBjz4Y6
	LNkODOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2J8-00000007aIX-1ipF;
	Thu, 23 Oct 2025 20:53:14 +0000
Received: from mail-pj1-f74.google.com ([209.85.216.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2J2-00000007aFY-2890
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:53:09 +0000
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso1981799a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252787; x=1761857587; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=Dd2gelfRMu23775/094c+oOFBWJOeY0YzT9yHYwtavLim9CrZf5uN3ru61ZgqOPkkQ
         r0oH3y0tOm5eoYZ29H3AEDPr6rPui8Gh9CPhjdoI/OH0V8yj+W8bBJoBKWCuwFdgBvZ0
         /bD/YHMQGekoDkUFCu3bKAn6PX6pvVNQf3n4mt9DTAn1EB+5iV8/o7DwDawNLFWXg4wy
         nz+UTRdLBRyZqnG2CmnnTumxKZTYc+xck6J4Lb04adjTq5EexRK00UbHJ20YBANIft6a
         ANrxufH8kQuj5HHvInFkjxU+nz8JPHtuJiu6AZsR3GyIWT2TqMKHI8DHZqzicWJd7blY
         SzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252787; x=1761857587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yk+s1ISc6dEFltbJ5xY708N1Sz+4JaPN5G4h2ago+Qw=;
        b=Pp/MUKQ2J/32auJl/Rq37FignQl/ngjjTPxEzrb22hUT1pr8Y/CyO3jtSyUtVX5xb+
         Mue2FEvLTS87b1G/+KAD6anSvSdgxTTbIMTgCCBXLoijsflARnq6nj1OAkh5oa6VlBLR
         ngDwuev8SBMh/mPL86hdW4OIcwTJB4URdOTibBfQSVloi8Oluc///yBV9t1PWupRS5yA
         oddTT8l6hcGHW9ajohDv11Nh1eNrSygBYJifJ1JhEbMneUXgyfdWt9Kv2EtTYQgY3pki
         Lu7p0O61oQL4AWcWBKJVWlEQHlWJXhi9KNTdYzW3KXFFNGmqCAPkpXGYPUwOUJh2XC3y
         ja3A==
X-Forwarded-Encrypted: i=1; AJvYcCW4qDJSwwpmdTwHh9I3hJw6ZqUCnQdHPPToXxnpi8LU3Qmih3vI7Okp7cgFCiu5UhDNzhtM5esc683HSsen2zgU@lists.infradead.org
X-Gm-Message-State: AOJu0YxpdnWFlLz1osOFSRNnTiU2H43IGdFvOkvAZP5ocsLjlpPio7AA
	S8dm1RkauVm+Kk7bcxKkHIdmm7hYUX0jxQFW0X0tCrOzbfCi7k45T1PeKxlzdoVgaoasJmF23L4
	MmrpUzfOOWegasVn9jmHIaTNgA27u7w==
X-Google-Smtp-Source: AGHT+IGkZMpKJqJOm+EoIaC26wIwW3Vcq2H4akvTHbJ23iF2ppwmzR08YRck2L56OCpeCC/yq0C1twga9aOUBHTIEUQ=
X-Received: from pjzm22.prod.google.com ([2002:a17:90b:696:b0:339:ee20:f620])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28c4:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-33bcf86bf50mr35134169a91.7.1761252787527;
 Thu, 23 Oct 2025 13:53:07 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:45 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-4-willmcvicker@google.com>
Subject: [PATCH v5 3/7] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
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
X-CRM114-CacheID: sfid-20251023_135308_563556_23BF393E 
X-CRM114-Status: GOOD (  12.35  )
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


