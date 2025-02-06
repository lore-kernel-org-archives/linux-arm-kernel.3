Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA00C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSwd0Ic/zADHNPGibPzB3vfQZwdDu0cIcYcU2UTlBE0=; b=AlKLeDzaaEBojieHIDK2Zx9IlW
	GtlP/L46L0CYjtcDlecMi2icJgDrYu8qIjhEnm3t0e55gPtwsuxHgQ0eAFTY8qoeOoAzkpLThbubO
	tuMpLY5bzuQm6lnD9XkthRK1UH3pRrtd9wMIDNQSv+hO7U3by8EG3TNzG9h5el+WDRnuAJvar1Ehs
	g4SfyJErk2H2EINAbKLDdDV7VDxtAbeMx2EcpsRnlgyTl7UoVlpjmOmWtQkzTS0URE+jmwWTWJ6BS
	anzvnuB8dvHznTIJ5ylKxFguQsg13yK8m5V95gDf1OEdlXBRy9TmeHRYHGzTskllQA4ygnBXM+r1L
	DceF8+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzwN-000000067Bh-3bvs;
	Thu, 06 Feb 2025 11:21:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXD-000000061eY-2GEZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:04 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-38dc32a1318so131419f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839302; x=1739444102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSwd0Ic/zADHNPGibPzB3vfQZwdDu0cIcYcU2UTlBE0=;
        b=JZsjT0tTYVqyf4y1zRGMAn66NBX/eBv4qjn0j9cRTw22RHYI1sK4RXBL40DMFZd+wX
         1EoLfsm55VB0l33Y7rCciZHtiilHDNE9prseWxqX0EzqiBV/a5JPTH7sAYx03g1XAdJF
         tRosRi1mRUO0eIVb+ZtcsJ7QcU7Fsa2qOjUaaqJkSnbNM/gQ41V6v58zf80ZUHfSH6AW
         ZbdXz03wtnkWL2o9T/VLOVyP2Svwr820zqYo0JRnVN3WPdVi2lsDf8YFoRyr7EZrJToa
         EelucJIhpWllYWaKuCL/SD79zUtZA3b8sifzIRC5ppPVyqq/3x59zBKSOiZ9GkDMJKx9
         vXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839302; x=1739444102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSwd0Ic/zADHNPGibPzB3vfQZwdDu0cIcYcU2UTlBE0=;
        b=h8JksoWHyZCyFke2CdlyT901WZMWXGH4XH7cUCYA7WGfFr+mWa4jQw1af31pHmyJ9X
         rpEPCbfJBse8+UhBeed/00ft63vWvOuZoypNlGaoWmb39n8f2pmkOnb2y/OSLJUQQnUF
         sSZhFHlV5c6lkB7PX56SUgVqZofvyKTaSCo0bJmPdLkjYC2DFc6JXJelvtU2OkdRtkoE
         gCX9IrEfU7ekJajqXhNnwQ0hmMtMLiJr6adx5UaWt8PZf+2hBuT9pys1aROxhGh8wzNw
         xuznkJf+HC/PmDelgugA9vHbJHNuZ/r2xTp6waiQYwNqlcukdjJV4SbzOwrsYIRx8xA7
         BElQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSe545GZIic6kjI8Uq4GjSl21m4KFCAGVgb+Yl6Ys8Mp+Rfj9l2RkoDlpvuHU4vW+ZGh+vVgBR87DP63mQVHPq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhhhgce1d2SzH5r5MhoR56vPLNwGaLvwwYPK85av1eey+AajGC
	VRorHjr01TceO84ZF6Pa2RSE44MOHRlPT5inlvSjKnxYQUrSAJ80
X-Gm-Gg: ASbGncsUGJl9eKb9LNH4+J47UebPeQlqpIKgHnkIFlgHfgq+sQ4lUA8zfRTGGuWAy9M
	StN2oXpPi05r+w3HzhvytS/VQz2ojmUzMAjgPCx3HcqKf14OG1nsDjjbVtLfd53In5sA4CpS0uG
	300Wwdxd3x09+DBsjMhZ42Z27XdybgeHxwbfi0/f5eklZSyBi0S1+TnMeg6c2Rpc7D/b7fN9Xe+
	7kc88e8F2zrULncmyMqvUi9fagRLzUjfamiA26Pj0LEJK6VTCkpVcr+2mOzBBVfVruBP1ngxFeB
	mWXN
X-Google-Smtp-Source: AGHT+IHKdNt/2i2niit9x9Q/R1mWsETc05ExweAVXJWi6Fe7g9aArrjNh6K5B0b8g58nbAsrLJyEOg==
X-Received: by 2002:a5d:59ac:0:b0:38d:bf6e:adca with SMTP id ffacd0b85a97d-38dbf6eae30mr869218f8f.48.1738839302123;
        Thu, 06 Feb 2025 02:55:02 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:2::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc31b9394sm473848f8f.11.2025.02.06.02.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:01 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 18/26] rqspinlock: Add entry to Makefile, MAINTAINERS
Date: Thu,  6 Feb 2025 02:54:26 -0800
Message-ID: <20250206105435.2159977-19-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; h=from:subject; bh=E+oadE0wJWqBDHpLclZmcj/fTawgs/RCGY18+MKVeJ0=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRmodQ4/VhA2GYFRoJhLQZknuv2U5hRh8VIgaN5 gjWRV/OJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZgAKCRBM4MiGSL8Ryq+SD/ 94tOt0FPzLcovxJ8PvSGMSImDYXVh0wToZsIW+lhBs3jfHW5GETrWPgvHrSUxGhML9no+RKLfirkp4 E1cPXorlRj2ki4xsWzLSlHk+EH2PWoH8jCjs6jMrtK+SMqCA7Oj4Ice6DQmaMIN6/hB/xu6chupbLc 1lXBQZPtFxk1eXA75g9LS8ZVQ3WXOnPj+t6OewmPFulHGjMCCRR9/1M8sw89gkNsM3aB5E5I7YGAoV DP5513oBCDAn8tJPZqTzddkWfZoi+q6onyMLx6WoRPWwd6fk/EKwhICv1Ikg+RI9MkK5qeIiUkhtsh FX/jfVeTi3znO3Ae+dZqpxdGdwDobONfyOditGEf38ImSjAUAeUfyJe4K8xYbvfWnk1WOMn8G3jHmE c9muj11DGHiIVfw/ynoQqr4v5vyuNYzu5FWY81NdA3Evh0nXgKo18riB8GKo1moM5Ga4Cc9rhmReue T30PWz9HdqaEAV4ligZ3OeXxNDjK8YNM2P3ccL8sziaBme2U8G5uVWyFh3wSuGZextoI1/7fUBWFY7 QuxUlV8b1+apMH6nrCBDVCO4LpBI+7ZQ9qDWn1MUzT7DTYAHwa19++ndXSIA4NCiycMOqEvocmJYpe V+70XrThPEC4JgdWBMXps/15vB9J+B+z1zka8ksy3fY9si4XlMK2GSNw1VjA==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025503_587501_89637598 
X-CRM114-Status: GOOD (  13.47  )
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

Ensure that rqspinlock is built when qspinlock support and BPF subsystem
is enabled. Also, add the file under the BPF MAINTAINERS entry so that
all patches changing code in the file end up Cc'ing bpf@vger and the
maintainers/reviewers.

Ensure that the rqspinlock code is only built when the BPF subsystem is
compiled in. Depending on queued spinlock support, we may or may not end
up building the queued spinlock slowpath, and instead fallback to the
test-and-set implementation.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 MAINTAINERS                | 3 +++
 include/asm-generic/Kbuild | 1 +
 kernel/locking/Makefile    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..4d81f3303c79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4305,6 +4305,9 @@ F:	include/uapi/linux/filter.h
 F:	kernel/bpf/
 F:	kernel/trace/bpf_trace.c
 F:	lib/buildid.c
+F:	arch/*/include/asm/rqspinlock.h
+F:	include/asm-generic/rqspinlock.h
+F:	kernel/locking/rqspinlock.c
 F:	lib/test_bpf.c
 F:	net/bpf/
 F:	net/core/filter.c
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 1b43c3a77012..8675b7b4ad23 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -45,6 +45,7 @@ mandatory-y += pci.h
 mandatory-y += percpu.h
 mandatory-y += pgalloc.h
 mandatory-y += preempt.h
+mandatory-y += rqspinlock.h
 mandatory-y += runtime-const.h
 mandatory-y += rwonce.h
 mandatory-y += sections.h
diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index 0db4093d17b8..5645e9029bc0 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SMP) += spinlock.o
 obj-$(CONFIG_LOCK_SPIN_ON_OWNER) += osq_lock.o
 obj-$(CONFIG_PROVE_LOCKING) += spinlock.o
 obj-$(CONFIG_QUEUED_SPINLOCKS) += qspinlock.o
+obj-$(CONFIG_BPF_SYSCALL) += rqspinlock.o
 obj-$(CONFIG_RT_MUTEXES) += rtmutex_api.o
 obj-$(CONFIG_PREEMPT_RT) += spinlock_rt.o ww_rt_mutex.o
 obj-$(CONFIG_DEBUG_SPINLOCK) += spinlock.o
-- 
2.43.5


