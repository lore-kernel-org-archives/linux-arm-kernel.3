Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42090C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SudqM4dinshG/ga4dKzazwfwaSNRtgAeUisYk5patHw=; b=dmQsYE4zV26zcC6yBW35Z5BPEA
	QJgH5HaVDIYTjE2oDaKue0d6+Fa/0KXX8UtUZsILBsz5fAKupQhSeNYHzGpRgpStvH+MDoUgcEwcd
	lHbO/dyMBk9wcRMbXzpGFADuqv8TrJfUnxFL6XOTJlL0FYcBJoiwBKCL3RGtpvtub7Egq//N4bLn9
	UbRwiJhkIqT/o6onmhHU12AU/TZpiZKoyCYLV6cTjcsIlsiXznzSjWjFpJsm45NKBGtBXF+MW6Fvm
	q7HxIkJQjBfMQTN2Fh9XuDCkDVa72K/Jkt+rza/fXW+zajbSTM5EyxdHpshCh1rPf626l4NIi12kT
	Eu5LpR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpY-000000017vS-00He;
	Sat, 12 Sep 2026 19:56:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpV-000000017tL-2SEu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:56:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso25223755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242964; x=1789847764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SudqM4dinshG/ga4dKzazwfwaSNRtgAeUisYk5patHw=;
        b=dEZ3btoNsLWxx0i/qX9BKqkIaPI/y4EyexIkbDzi565fEjjgjI8qGVnT6GsdZV4ZDm
         pwxjl2yjdCoRLja3B4NXVM5nItBu/iaVx0wMaqFjbX4IakoTG3LG9RRGcURmMJW8C7A0
         l6col3rMp3YuSFcRk52DaZnV50tBndhsRhrqAIyFVzlmSYe7pwFp66vP+rWFyCr8hlAX
         AEw1r+uG3OxiymfF77HbjA4e4WQQMm9kP6tyfwARsBa9RdxKIYaDHKDBnX/+SNUOlZgV
         sRwKaecd88bictPcZpXqCGFFueAW+Xg3eJ7JgzHp1wpnGFz5ncZgl5t7uAM2YhopEEn1
         CzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242964; x=1789847764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SudqM4dinshG/ga4dKzazwfwaSNRtgAeUisYk5patHw=;
        b=j6KzqYy2NKqOdwWOl8ZB6Q163qkerh0ng3rpFZ4+qGmErLXkmBBwNRs4MVgNqSFi2n
         kCzLtAuTwJGmvefyLOavV/iNIKDvxGouviYaI9m+ty73M0+Is9kY9rJAT1ZHulpXmvoE
         kuQRF4D9O4gbutt+AuxuHyAnK2UPtW5ceP9SJkGmp0JWFyM0Aie3VfaeMeDMPLbQ7ox7
         ZPsJVonxLPRY43bJ6O/+okD0zlmw5BNFPBjfe/MnTLgS/Ou9UtJjTQnUI5/Tps6GHkmi
         MhAtgzM6LvOmnG2XP/8JBAO9COLsA3adryhVI+S3nndCkZSW+ycnOGoup9JggFe2OYfU
         o/Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwpID/ChxgcvuJdZZFuNIHLM+3uqDC7bie8CrnjYskd7EDmHbg6TU4XxDXXWxWqcwdBN2z3Jj3b00T035VIP7+G@lists.infradead.org
X-Gm-Message-State: AFuF++muwWs9qaHLHqueaSbvGH5VMb8sDNJmLe3BZL7tT9OUC642XmsA
	Q8zZ0j8jwZV0LXlQkiBdbwULRSGgxOgNViSVACSyVWgBQXGqfamucarP
X-Gm-Gg: AYBFou0hV6mfyRBSv77B5wOmbA9g/OT+DrXwinjFd6ycXlXXWrP02+XklzJE0QOtX7j
	mRt5y+GkEVFEum9Coiy9yxHWvwpjVGJjyOLOygTkRIaoljppFAydrQGjpartnytSRAItsz8K33A
	gWmOtdDC9XT41s+YHZpTyyhHIWEw3kLfqVuu/dP03xryR4APd6BVLpAhfEtXTuoLWFTfKDGqWsQ
	ATtbtM80ip68jjE2QldWcYvS3HELzAXt6J8DQHqF13u8J5oHjVvYQw8vhImwwg/Wwel4mID1AhR
	Cckws9L6nRvHnjZAbfLwb/tFUcvbFOOU7nXc/cWxNQpVVmdzoKgWou+QPWPg42mtp0dMNcEUjfk
	IZP339n9rK/tKl1NwtxWBKsP09MKBnLjMrAFcGgRCpeEfmLsqOz88xDRfOZfAgudBZihfj5UPzw
	AI5nZS6/0SHwH0sLGADT8q/iv9lnL7YIPxEJEia+0dQ1RT0ADzf/or0o1vEr1zFjAs1MkYmXg+0
	Fh5JM9XCA+kxdDWiE/mIcYDlzhaj7ndAIpljEf/F+vjWX0gBJHyLOJ4Rk0njIBk8WcHcnkr7MZE
	nC2+R9tGX9mI/NBHLC9Vtse4VZFdAxPwezgoOgNHVzSH4KBtvGy/vZQBvkmgbSvCZ5wbwDWK4jU
	1BRcsCPWd
X-Received: by 2002:a05:600c:3115:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49e61989e79mr109783245e9.10.1789242963500;
        Sat, 12 Sep 2026 12:56:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.56.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:56:02 -0700 (PDT)
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
Subject: [PATCH 4/4] ARM: topology: allocate the cacheinfo early on the boot CPU
Date: Sat, 12 Sep 2026 21:55:52 +0200
Message-Id: <20260912195552.76673-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_125605_669504_4AFE4894 
X-CRM114-Status: GOOD (  16.95  )
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

ARM secondary CPUs allocate cacheinfo in detect_cache_attributes(),
called from secondary_start_kernel() with interrupts disabled. With
PREEMPT_RT, the allocation takes a sleeping lock and triggers
"BUG: sleeping function called from invalid context".

Call fetch_cache_info() for each possible CPU from init_cpu_topology()
on the boot CPU, following commit 5944ce092b97 ("arch_topology: Build
cacheinfo from primary CPU"). This supplies the arrays before secondary
CPUs populate them. Suppress -ENOENT and -EOPNOTSUPP, which leave cache
detection to the existing late path.

The CLIDR fallback uses the boot CPU's cache geometry. A secondary CPU
with more cache leaves can still require late reallocation and trigger
the warning.

Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Full warning on QEMU virt, cortex-a15, 7.3-rc2, PREEMPT_RT:

  BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/1
  Call trace:
   rt_spin_lock from ___slab_alloc+0x68/0x728
   ...
   __kmalloc_noprof from detect_cache_attributes+0xe4/0x734
   detect_cache_attributes from update_siblings_masks+0x10/0x174
   update_siblings_masks from secondary_start_kernel+0xec/0x120

PREEMPT_RT became selectable on ARM in 7.1 with commit c6e61c06d606
("ARM: 9463/1: Allow to enable RT"). The PREEMPT_RT patch queues carry
that change for 6.18 and later, so 6.18.y is affected as well.

QEMU virt, cortex-a15, PREEMPT_RT, 2 and 4 CPUs: the warning is gone,
the cacheinfo sysfs tree is identical before and after, CPU 1 survives
an offline/online cycle. Same on a non-RT build.

QEMU realview-eb-mpcore, ARM11 MPCore, 4 CPUs, ARMv6 plus ARMv7 SMP
kernel with PREEMPT_RT: fetch_cache_info() returns -EOPNOTSUPP through
the CTR format check, no message, no cacheinfo before or after, CPU
hotplug works, kernel messages otherwise identical.

Raspberry Pi 400, four Cortex-A72 CPUs, 32-bit PREEMPT_RT 7.2.6-rc1,
full series: the boot warning is absent and all 12 cache sysfs entries
match the unpatched baseline and earlier topology-only run. The live
DT describes the shared L2, exercising DT-based early allocation.
CPU hotplug is unavailable on this platform.

 arch/arm/kernel/topology.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 2336ee2aa44a..e6b50cd43ce5 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/arch_topology.h>
+#include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
@@ -238,8 +239,20 @@ void store_cpu_topology(unsigned int cpuid)
  */
 void __init init_cpu_topology(void)
 {
+	int cpu, ret;
+
 	reset_cpu_topology();
 	smp_wmb();
 
 	parse_dt_topology();
+
+	for_each_possible_cpu(cpu) {
+		ret = fetch_cache_info(cpu);
+		if (!ret)
+			continue;
+		/* CPUs without a usable CLIDR return -EOPNOTSUPP. */
+		if (ret != -ENOENT && ret != -EOPNOTSUPP)
+			pr_err("Early cacheinfo failed, ret = %d\n", ret);
+		return;
+	}
 }
-- 
2.53.0


