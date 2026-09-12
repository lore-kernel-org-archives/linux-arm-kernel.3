Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DC3C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GysJsE8mePqJNLXM00GRKUzojaP5JqBAXeEHJ7TcA4=; b=UqNrnW4QUiXnfiL6LpPMkQA3wa
	l7OGB0xNWcwGRE9HUG/07SPzd8Cz7i2+IawKnQqLa963QXvFaTvU4yHvfCVyzDzbU+saub1/vBqXj
	/RzZK/knCwG1LCzYs7/cbVHVqjv0AiwK/Q9vZo7OicWWLMKJwS7li4YNkuOxN4i1KQ7r7yZW65F1q
	M0985TBGkXgzMLqU5/jpWnGkmgqXnyuXyruUm3VmN13nKB13JnsgeTrwXGCI7VDkxJublzt3mNjz8
	1nhQbISaOySHrI4EyKAX7XQNuCifPtnTVMVGjhEgikfrlPO7w0YPRn3lbCo/y0Pzcon+YxSBcqcn1
	/Q7WPj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpX-000000017um-3AeQ;
	Sat, 12 Sep 2026 19:56:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpT-000000017sc-0MhK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:56:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso15143375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242961; x=1789847761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GysJsE8mePqJNLXM00GRKUzojaP5JqBAXeEHJ7TcA4=;
        b=cuWvEKj4/HzCKYKj/HAy91EyL0Sx0UgHTucD6MNf7e+30irkthBd4ryHSWxKzbl9um
         aQ8F81ObYYM0/D8bWDZfQTNvlFGruSaVWG1MYX3PbgGXc2uxHcDyXdYpykD54H84pFt5
         c+P7RaQTvBS0PccOoRwLZU6rQVQ/1Yk+AFKmwJQDh8tcNKB4U5UpmVG3ze2HoeRGvn7c
         yGjmlXGnNVHYwRGt4InMY2yb0cNb1xFKOX7D88A8alQSo7VVt5jl7JrwGgWG2G95OToe
         dHmhoNgicY6sSTvNUHeQziEIiCQK9DIhkwnsF32PZzyvxLsoUohzhyi8LfCjgmkBN19i
         YBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242961; x=1789847761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GysJsE8mePqJNLXM00GRKUzojaP5JqBAXeEHJ7TcA4=;
        b=cIhShFkn05nBNrgrBucT8OjIrDQDXYjs7kGoL2AqgcDEwauxD38mIYvxStsTdC9zol
         gISlGIODLN2yvXQ1ZKBNcu8WCb6JBiPlT63zHl+OFzRIqJ1rdo/mrTioh4bUHYSMruu6
         kO7tYPZtbVEYJu5DFsyZ7WRGTb5nVdbyjzJ+KiVkVkCJmznpQEI2oCR3ExCUsvPrXfRn
         WyE9clOfjXWG2Bjkm1dFQWdSZ9MgaLDUpmIESgaQAP7moxR4cM+Z6rYiM6M+QWCV1NqP
         clTfawOmF2CWHWA2sR4tnl6XBucB+pfUmoRzZLxPF6hbjWI19/RMJcXheEQIPUFgzFi/
         Cvqw==
X-Forwarded-Encrypted: i=1; AKwUvBwg1C/SG8PRS1Gx8ndBBt/2336LLsgGFeh7FrXNW4pYeOhaBLfTcqxL1sMdp0wIkgZHfePNp56K3CApH1MriC1m@lists.infradead.org
X-Gm-Message-State: AFuF++laQ6Ai5EoBYCP/4ccM6U5yB4IKndsoJw97WTowbrA8sPcKMY5a
	S46HZs1R/JhU7anllOc4knuHDOGnw2XFHqJ4+Wo/lC3yLfuztUdk/4Q6
X-Gm-Gg: AYBFou0++TFszUZWf6wZZGkEhOudMdU0wR2w1a8AGs9YVw9oew9ssoOcKDQtE7KIkSN
	pI17bZr8w8LU3k7ZjfoKIY7j8/wP6WyM9VL36M0h/UQzho2+BTc5vx/G/FAbNADOc5VXy3lxkOG
	w6QhxdLcDsz5E2DxiNXGCBa6eNZZevVegK39b/PnP4hQTwagpW4KlPMjq7CIzYbehsDxcxfW7CD
	8dkiUhP/Olx7Tz0mzulVVriEqxu46Y4SFaRBn6wJr4VdVtDXHiI4QZZH/Bomx8JINqLs522s2Mg
	aZ40XfFsJSh59nf730Ep6nUhyN0828y8KD9QgFqPCacflhN908uMp+xKLWfwi6LIL6kvpq8vlS9
	ufVh7inCAwApQh0lsF3rcho3uMw5WeMu7GOQZ0q5VjZWS4omlvRSUhijGNY/HHoWn4cSZ8Hvyzu
	tf/0LeN49VQ0GWFqiWQ3cq2+++H5dTtTwD+heG7uMkjWH4gpxQ6C3EZURR7XUTSoQcwy0HAccz5
	3G1B4/ebJHsBZjjhYFrIgb1z1UZUhO/gosTz64FS4lpt2l5t6sJZrHWUzGXsAP/itUT28uAvNJL
	2A9vNQWbSe9B/1GS8N96KXbz7t8p2reuOTRkXnBN31+Ou6uZnDew2oNOZYy6wRJEI8L9Z980iyz
	1WsaYFrA=
X-Received: by 2002:a05:600c:3b18:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49e61646becmr99559535e9.0.1789242960978;
        Sat, 12 Sep 2026 12:56:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.55.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:56:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/4] ARM: cacheinfo: count external caches in early_cache_level()
Date: Sat, 12 Sep 2026 21:55:50 +0200
Message-Id: <20260912195552.76673-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_125603_164313_A057FB7C 
X-CRM114-Status: GOOD (  14.66  )
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

early_cache_level() counts only caches described by CLIDR. An external
PL310 is absent from CLIDR, and its arm,pl310-cache compatible is not
accepted by init_of_cache_level(), so early allocation falls back to
an incomplete count. init_cache_level() later adds the DT-described
L2, forcing reallocation on the secondary CPU with interrupts disabled.
This defeats early allocation on PREEMPT_RT.

Use init_cache_level() for early sizing too, so the initial allocation
includes external caches described by the device tree.

Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Without this patch, patch 4 keeps the warning on QEMU vexpress-a9
(4 Cortex-A9, PL310): the early size is 2 leaves, init_cache_level()
wants 3, and init_level_allocate_ci() reallocates on the secondary
CPU. With it the warning is gone and the cache sysfs tree is unchanged
(L1 data, L1 instruction, L2 unified shared by all CPUs).

 arch/arm/kernel/cacheinfo.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index 860eeb03cfe5..31591c947254 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -111,13 +111,6 @@ static int detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
 	return 0;
 }
 
-int early_cache_level(unsigned int cpu)
-{
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-
-	return detect_cache_level(&this_cpu_ci->num_levels, &this_cpu_ci->num_leaves);
-}
-
 int init_cache_level(unsigned int cpu)
 {
 	unsigned int level, leaves;
@@ -146,6 +139,11 @@ int init_cache_level(unsigned int cpu)
 	return 0;
 }
 
+int early_cache_level(unsigned int cpu)
+{
+	return init_cache_level(cpu);
+}
+
 int populate_cache_leaves(unsigned int cpu)
 {
 	unsigned int level, idx;
-- 
2.53.0


