Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927E5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i41XESFruXJQr6oMrsL8os9q+bHEPtCL58+AbxR2ZG0=; b=EpxpdlLxfHztb8T6sR73LJQgdg
	Sulj7YUZCQYFzv8Jy6ZHso8sdquyvZqQoB3/AGwwG9z14lUFsPBWVqo9O4ijb2QGQ3A3c5n0xUmg+
	vEuUlb/Bpcu1VlMZIzTUimTJHsXYwTdDNmFw352KcMurOTAD1kDWEpYyHe2p+jWfoqYVvYJfE4tys
	KPOsnuFo1tNcHSvD0+nsOzmE/cWwhLjk8ZrAHmK5DlfJf6/qxQ8uIaWP5KYRs5pbm55IGOC4Lar8W
	2gUFH6YDANk4k42yr8i7GmEThY0ub2LwKG2Nuwh0RqzfvL1BaZqMC0W+7eMkbugdS2O6jrVN+JeNW
	jlj3akMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BfL-0000000BLVG-0CYt;
	Thu, 17 Sep 2026 12:56:39 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BfI-0000000BLU9-1H2S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:56:37 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so680813e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789649794; x=1790254594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i41XESFruXJQr6oMrsL8os9q+bHEPtCL58+AbxR2ZG0=;
        b=fqK08VnHlF/GeDDBWXcm1Fqd9MaTzCe9zXxlbUoGiLhtgHvSK7Tp3liZVlx6Mpx7rC
         kU0CO8vCI10+TFcSOxGGZHX9FkManQivPxBS991vyeUhacdDD9r42GHtsSGArvCt/OZH
         b+W1rNDagePMRoNbkrYDRbdQiXZlh9vA0nGBFTovmAfdtj2Z+JwjRZnutX4uv4lyyHR9
         xaSbov2UQwJHFPS3FbgF2ukQMSL4UX5OBiarrkZq6eVOba3PPoDqyGI010pEfDLI2MwG
         voAARcmnybohHb7CAC4Nr3M6bWneAALtMh0IbU3nkSO1RpXZRY8IkI/icNHQQ6LZdII/
         cZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649794; x=1790254594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i41XESFruXJQr6oMrsL8os9q+bHEPtCL58+AbxR2ZG0=;
        b=NI2L09JSbkCEZksGmoHsvLCtH98YQ4O5oMGBCAf9Ju7GD4hQurcNipN9yuqewdQvwU
         F1NOll9sRbHaV2oKeLbnkr2qlggHyYCww94grTPY9uHlch1AEM/Lv97H+hsDsZOR6DFF
         hSWQqeZcZBlrJfLgWOht8Qv3OvDIS04/F0wecwaPhpj+UYmp0Xmd9ZO7yPCGbJBep/T1
         dSt/cToVQXN4ZidhGGa2KkN5qLTkGKij1DVublXh6yJKIrpIklVEU2SQVbAiruomezaM
         efvUDsjx33OqQM+fZuZ5pjt9QA5aNJASMkfR5Rsy7VGYa9SNfrxBFUG+i+Us619KpYcs
         OHMQ==
X-Gm-Message-State: AFuF++n01UcD2FbRQfppGRr+O9rZWtu1m6YDCTZbq/WgMMXR7nYdbujw
	BWe00kN6u+QYKniqZlkd8GFn18/X9BcneLv6/NhpkSjCauZ1+cZrZES/GPrG/zXvSGA=
X-Gm-Gg: AYBFou0SWdiXxAsCP8A0PeZbdNlVvuSbjst/jDFNG2W6jpcXW+dW/5SlK/7gId2CSGU
	dI4edCQS5KCIQ7MNnR4NsZnEceOWGLHLyqDthGmRiz+xkRHS1svyF3r0qvfRA1Hz4c5cxPC6cC+
	xzSFdVtwwDkVPc7xT4KnSMMWO+Go8l9Tqgz1gkWrOpzqZBPqoK/mZGhipTa2LYxg0BsrcXNyV+Q
	5iMskBH7CT0dOqh2qRpPrqYpXtv6VhxVhENJzmvZIuiYEC3Oew76/yecmP2uNlYc+o8QbPIxMXf
	VhM1Vhfyrb+bLCViRDW+6Ns0gh2wA0RV+fFOxBseJhEij8Z154ua6bJnutoG1EtkQ6IEUuHsc/T
	yewkkcYRimMihRD+DZXEpyQ2cLC1F0c2XrjbGaAIKysbtn7gLjo7w6X2XkZaU4ejYQIOYJZLKOH
	yOaWug6LVawULSe4i532VG31y5DiqSH2r+qOeA+7RekMbxhLQCLEbiv9Psj259AgBKwhulWIesq
	S3P/yz56+ebh1buItE=
X-Received: by 2002:a05:600c:3e15:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49eac41066amr106969415e9.0.1789649481783;
        Thu, 17 Sep 2026 05:51:21 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm86555015e9.3.2026.09.17.05.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:51:21 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Thu, 17 Sep 2026 14:51:10 +0200
Message-ID: <20260917125112.2283-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055636_368454_E7DC020C 
X-CRM114-Status: GOOD (  18.22  )
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

The Snapdragon X2 Elite (Glymur) is the first arm64 laptop part I have
seen whose boost OPP, 4723200 kHz, sits above 4194304 kHz.  Two
independent problems become visible there, both of which make the
kernel believe a boosted CPU is running slower than it is.

Patch 1 fixes an overflow in arch_freq_get_on_cpu(): the u64 product of
the frequency scale and the reference frequency is truncated to
unsigned int before being shifted back down, which wraps for any
reference frequency above 2^32 / SCHED_CAPACITY_SCALE = 4194304 kHz.

Patch 2 makes capacity_freq_ref include the boost frequencies.  For
frequency table drivers it is latched from policy->cpuinfo.max_freq on
CPUFREQ_CREATE_POLICY, and that value excludes the boost entries while
boost is off, so a machine that boots with boost disabled keeps the
sustained maximum as its reference forever.  On arm64 that saturates the
AMU frequency scale at SCHED_CAPACITY_SCALE once boost is enabled, so
the scheduler cannot distinguish a boosted CPU from one at the sustained
maximum, and arch_freq_get_on_cpu() cannot report above the reference.
With the boost maximum as the reference, a disabled boost is expressed
as cpufreq pressure instead, which is what CPPC based systems already
get from highest_perf.

The order matters: patch 2 puts the reference above 4194304 kHz on this
machine from boot, so patch 1 has to land with or before it.

Measured on a Lenovo Yoga Slim 7x Gen 11 (Glymur, scmi-cpufreq,
4032000 kHz sustained, 4723200 kHz boost, boost off at boot) with both
patches, pinning a big-core policy to a single OPP and sampling
cpuinfo_avg_freq under a single-threaded load:

  requested OPP    boost    cpuinfo_avg_freq
  --------------------------------------------
  4032000 kHz      off      4031325   (0.02% low)
  4723200 kHz      on       4709362   (0.29% low)

The reference of the big cores moves from 4032000 to 4723200 kHz, so
the little cores' cpu_capacity goes from 647 to 553 (647 * 4032000 /
4723200) while the big cores stay at 1024.  Without patch 1 the second
row wraps; v1 of this series measured 524283 kHz in that state.

Note that cpuinfo_cur_freq still reports 4032000 kHz at the boost OPP
on this machine.  That is a separate path -- scmi_dvfs_freq_get()
asking firmware for the current performance level -- with no clamp in
the kernel, and it is not addressed here.

Changes in v4:
- Patch 1: use cap_scale() and move its definition from
  kernel/sched/sched.h to include/linux/topology.h, as Dietmar
  proposed on v3.  Same semantics, one open-coded shift less.  Beata's
  Ack on v3 is not carried over since the diff changed.  The scheduler
  maintainers are on Cc for the header move.
- Patch 2: reworked after Dietmar's review of v3.  Instead of updating
  capacity_freq_ref from cpufreq when the boost state changes, take the
  highest frequency table entry, boost included, as the reference when
  the policy is created, and let cpufreq pressure express a disabled
  boost.  The cpufreq core hook and the arch_update_freq_ref() plumbing
  in the arm, arm64 and riscv headers are gone; the patch now touches
  drivers/base/arch_topology.c only.
- Link to v3: https://lore.kernel.org/all/20260910063440.4677-1-okerixx@gmail.com/

Changes in v3:
- Patch 1: drop the Suggested-by trailer.  It was not warranted for a
  review comment on the shape of an existing patch; my mistake.
- No code changes.
- Link to v2: https://lore.kernel.org/all/20260909192351.33910-1-okerixx@gmail.com/

Changes in v2:
- Patch 1: fold the multiply and the shift into a single expression, as
  suggested on v1, instead of reusing the u64 scale variable as scratch.
- Patch 2: unchanged.
- Link to v1: https://lore.kernel.org/all/cover.1788712186.git.okerixx@gmail.com/

Oleg Keri (2):
  arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
  arch_topology: use the boost frequencies for capacity_freq_ref

 arch/arm64/kernel/topology.c |  5 +----
 drivers/base/arch_topology.c | 16 +++++++++++++++-
 include/linux/topology.h     |  2 ++
 kernel/sched/sched.h         |  2 --
 4 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.55.0

base-commit: a7728f5e1fc3d472a314acdabca6039f71ec3a9d

