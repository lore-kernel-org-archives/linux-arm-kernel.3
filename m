Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8A0C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSUm2BvGMfGtlmppCZN9JChh915ltc85tdW86S+ilyw=; b=Edv0IXV5YSXk3pAvxx95MQ48xH
	s21qWE96L1f+Bn6vi/J52ONItJa4sPdKLh0DIRJvJUtvts2bbBesmoQohWnRJbhuT2f0fybWWh4mh
	UK/lVATFXr/bCHZyMnUFu6ac45n1faPetnPC3rr83l7Zh5hbhT9JruVUYHJu85yLKWb4VGzkwQAqL
	9HLTWjS+95vwf5zYsjvvUXQ3QQ9n3ljouwMSUKJej9XjLjCC/azXHRMlBMovL5mgnWlEUuUObr79V
	CDRypIflxP20rnd3thJEAxY3mEPxvFV6nJBgcqziGJ70NwOedmj5xwSEkeLQVFjKqUhQ+X7wjU0F6
	rLyv8V4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X5D-00000000zBQ-3Y6b;
	Mon, 21 Sep 2026 06:00:55 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X4r-00000000z5i-1RRm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:00:35 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso13881335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970429; x=1790575229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSUm2BvGMfGtlmppCZN9JChh915ltc85tdW86S+ilyw=;
        b=dnMzTpz69HP8oqlT5J0iZ2zU76OYRGBzJnPcWSCcQkV2JLsAcJwdEXPmy4QoNT4qBG
         cdf7hjzKDRN+iw4YoV3Bmk25kdaJFd1frelITk9jhTuh6QNHbkYJn+s5/76mQuzuDRGk
         IOCAbe1svs46wRnwIFf1nnNjo1d1GPkKYi37ZEzLrNM7/lX6JKhSSMwydWb0f7oJU70d
         TXyUTHt7BYw6FGZ0EFR/c3DN+Hxxns1KZVN1X+hAlVO/gO+tzQjRrJYEikfFMigIVJb7
         +IR+by7PMpxAQ/hMsg3V5xfwgz3ZI37unmNxiFfry/4OSN33PJUer9GNL3I0AuuygrXy
         3hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970429; x=1790575229;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSUm2BvGMfGtlmppCZN9JChh915ltc85tdW86S+ilyw=;
        b=zl2AYtS02r+YEcAU18jdW3s8EK2HkeMvXltqxAUz+44dMzE7w4HbOZlVZQ+eTtclAC
         i+MIHLjYjWacZq5scIY/U2siIb8xa/5o/mFjOgp11zMjZ65ND90IbpGPl6NJPVEK+Q7i
         WzkFRTr9Ia8qEpnLJf9o5BYpJIKPOPpSmMYOcHXRFqmXAa7BHa7MJb35T6m5nheN88V7
         drdgBkweT4iD1UxHQWWStH5BbH02tfB8ZH8hhOGRbQTjEyUvnwGwc655s5kQcnK1TQpb
         G4DBuym5Sp58HSOfp7c80pjgz26a1Y3hCItK32KLJ0/YKKCl0FmmLloXCS9R9SLiuDDM
         s9jw==
X-Forwarded-Encrypted: i=1; AKwUvBzOWv7NRgE6a+d7sUtp3waYDOh0pKRAx7w520BgKM21PfpPKy7Yum+3WQoEwQ4iAplAUSSRxWfWUAEf+TKfHl2W@lists.infradead.org
X-Gm-Message-State: AFuF++npKko29azQds6cNVCGh4/36ne9D1HPIa8mqCUMrKGJbkLpgUKo
	Dl/ZMmG15Z7QK9bA+J0BIb285Hy/FQ7DxqprUeQVU13BHjKdx5fcMAPl
X-Gm-Gg: AYBFou3+h6WNOv0oVvT5HcD0cLBXDHem7ZUK4mXSFPpOG42L6de0mLKR1oEJNPowzRk
	OXsF94kEVvH+aIIpdwaTpie5vXBG/m6GBuEkZGLqoIt9lPEecE4KjP0WVxBffxrqrS+VYhsRepA
	ICC9Ix+ovHrvbgEVF5y9C2wJ7c12cwnxWX2/REhi1q48nySC4L/zOmi7SVj1WVHTGyr1C3qXC2K
	DQ6o6ttNtIKueOYKX6faZBOB76XOSjfv1JNybsLX45L8+D9ysvks+Pfrr6Y9myRkGNRGJ6WC8iO
	wFQKjHUq+bBm+KB/G5vqhlip9jJs3elOLKXtyETFvm2R+3+r3dME6N0eesd/8D84xU1kqDj8cWG
	YaeACae9uqMCwLFllzzpLJJ+m1y7sJDcGaTvej9hv1uMrw8teSYggeM4Jfhj0+zVWm4u/bSgOZO
	JtHBsU85HsmDjuczITMbFPhh6rlLspHVfvzisHQp5S54XISeipQmel8zX72gyeZbPAfrM6cny3d
	8o8yoU96quMWHfse02SWT1/YH9eLyjw1J6X/y3GASuD4ccW+whQ3M3zEa4bLchMIthrfBDAhZM5
	0lW78Uo0upnX3sbZX8SDcJMb/V0URP96s6SRo+zz8naqCBk/lPIq3qUOwxQJdN8w4WKwFTpwsgG
	wYQ==
X-Received: by 2002:a05:600c:19cb:b0:49e:8184:f619 with SMTP id 5b1f17b1804b1-49fc57410f2mr132387185e9.22.1789970428604;
        Sun, 20 Sep 2026 23:00:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:28 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ARM: topology: allocate the cacheinfo early on the boot CPU
Date: Mon, 21 Sep 2026 08:00:13 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-4@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com> <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_230033_934337_A69C7DED 
X-CRM114-Status: GOOD (  17.36  )
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
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260912195552.76673-5-kmehltretter@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Fresh full-series rc1 retest: three builds and seven QEMU boot/CPU
hotplug checks passed; see the v2 cover for the matrix.

The detailed testing below was performed for v1, before this rebase.

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

