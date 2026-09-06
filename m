Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62202C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ivyLPO2HZhtqk7cqP+57Dc0UEnfX7FjCnb9LTUCpQ7M=; b=vQDBYj4LdRXM8OpXDnkTaQlzM+
	qQHwhuwihykfUa4NdVjuMh+g0zsbKKZ3zZ04gytq7sPVBbgFcw0CuGLykWm5N5MvX3KnzAPGI1ctV
	nnGivTQb310CLXzNTzpKqnqmIqUlbPhHJmxWwcgJJwvcO8/IlH5wv4+LCAOINyG7KbIwYorfGS9wc
	WHajcX4+8TS4deSrHTsHwk5r0xAKqXXYf2UFBwQeLW6iXvviiRxvzPBYFIHti2myw3UCdzhjAHLR+
	eShB+aPdtVtt8pXRNNz2UL4rJ2g3ET5QyCjg5aIxlzD/LX3dsuRnym8MF3KIE3h+uka05+a/srO0p
	96x79nVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FsN-00000005BuQ-1Lb2;
	Sun, 06 Sep 2026 16:37:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FsJ-00000005BtI-3tci
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:37:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso40539815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712665; x=1789317465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivyLPO2HZhtqk7cqP+57Dc0UEnfX7FjCnb9LTUCpQ7M=;
        b=evmST7NDdu9Irbom+cLS085LQXXEoGfidsxeLyEI4dYGhXWEXXqKHyLO5ROhkGnoU7
         lBg0HGVOG6lSMXZpOqkGUXr/1DElhovGUZtu4fFw2xMZDOPv6yzr4mkVX9EED9M9XBEl
         IHY0gnCaZmpX2OB+jqrnk3ozWYf861KJUOobmxG7IO9iSnf43TPCXImSSV1ZlHKkjgZA
         i6Be/duV2jf38Bm+L3gn6D7UgneMJEWLiZmay48t5YsazIZUe2kR1QMLh1CbBFg3rKw+
         v+yGGcccbna7HIsgoUF4z0NiZnrNelD5bnFAVYDQj2IPUncjNZmzGhBM05q6UITpYUWh
         PD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712665; x=1789317465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivyLPO2HZhtqk7cqP+57Dc0UEnfX7FjCnb9LTUCpQ7M=;
        b=M80cnPngouWAkF5T9jv0zuHBabm1YCOVgO8p21UqvgMXJkB1GaphjY+orH08YhgP4x
         Do23ekVQXyPfjIFdYXKPNSs7ogV+mBGJhVNRPCcgMNeu6LTNccr34d8eabdWVcQ5e32d
         ZTwRPjRHI3kDyC7FkU4mxmr2TepTDJvOBll0L//YZcIV3pc3m88mXoBBOfNmmAb6Q54M
         zQDcZy2oEqQM6n7S1n2op5pueIaYcm7A7T4PAAEoiW1dLOfgdVkUlRfVs/6DvMI2BY7x
         DGyDBlXDWUFp+K3k9ZiftHpRdh9UqCDnP3fVFsPjDhQGld83MgEyULiCKFc3BKdqzJb5
         lk5g==
X-Gm-Message-State: AFuF++mZusMCTYfC18Sd1EmGm3feipsiIseYDTXPsJbzNnDSci8JC+Dl
	fMkhLsHIC/vfu/NNda6qWU6BiNjcyA91V9cIjJ+Y+EcXv+cYX8fYxlEM5ozHVx07Ow7mVg==
X-Gm-Gg: AYBFou1tcEeblrOogjOrX5KNdw/ZswbBgdUvqw7wTDXQHXMRCpvHs8YmUCLq/E3lwjN
	PBzFdolrlHc+/eT2QzgdRBeqfgej1J6RaclKFJxnNIZfg++TxXeYOWUWUFtOSTE+8fYG56a5ww3
	2fk4d5gyFFHS2w1C1Yv1uX+GPChJSWKgjfZduM8eNAKAffF6yE5pFdKE7fj4EnbHjQxHSuUcP9j
	XIqyG32zmo632QvCzc0IXJLXymyxq/uj8aAhqCVER9M1fV5Jlcrbu7gA0KvaJpuux4KaMeMdwB9
	xMx4ItnLbhVRL7U+0uUlg3c1KlpYFUrFTFDSzivXOpfe3oJnNRhmC3GTVZOluqH6abmNNBrLLd+
	JKpF/eKIA+nMRKbALOhZVS/OLSbOzvcPUh1yM+GG+l5IOV3keURXj86l6GJQT5Ityfv71MH8v5Q
	0IcyzgoWq8SDVo2J9fQg4bT8PICDk8+EFtDb+lhJKsEWqci0zSzsIIE9lkGzD/3AyU9tPYXfApT
	V0o/S3Wy0msYrL+qmtEyfMPxLc=
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr96329235e9.10.1788712664882;
        Sun, 06 Sep 2026 09:37:44 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:37:44 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v1 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Sun,  6 Sep 2026 18:37:13 +0200
Message-ID: <cover.1788712186.git.okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_093747_983392_F67FD6C3 
X-CRM114-Status: GOOD (  14.77  )
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

Patch 2 makes capacity_freq_ref follow the boost state.  It is latched
once on CPUFREQ_CREATE_POLICY, and boost frequencies are excluded from
policy->cpuinfo.max_freq while boost is off, so on a machine that boots
with boost disabled it keeps the sustained maximum forever.  On arm64
that saturates the AMU frequency scale at SCHED_CAPACITY_SCALE, so the
scheduler cannot distinguish a boosted CPU from one at the sustained
maximum, and arch_freq_get_on_cpu() cannot report above it.

The order matters: patch 2 is what raises capacity_freq_ref past
4194304 kHz on this machine, so patch 1 has to land with or before it.

Measured on a Lenovo Yoga Slim 7x Gen 11 (Glymur, 4032000 kHz
sustained, 4723200 kHz boost), pinning a policy to a single OPP and
timing a fixed workload on one of its CPUs:

  requested OPP    time     cpuinfo_avg_freq
  ---------------------------------------------------------
  4032000 kHz      2.011s   4031325   (0.02% low)
  4723200 kHz      1.726s    524283   before
  4723200 kHz      1.726s   4032000   with patch 1 only
  4723200 kHz      1.726s   4718587   with both  (0.10% low)

The timings never change: 2.011 / 1.726 = 1.165 against a frequency
ratio of 4723200 / 4032000 = 1.171, so the hardware was running at the
requested frequency throughout.  Only the kernel's view of it was wrong.

Note that cpuinfo_cur_freq still reports 4032000 kHz at the boost OPP
on this machine.  That is a separate path -- scmi_dvfs_freq_get()
asking firmware for the current performance level -- with no clamp in
the kernel, and it is not addressed here.

Oleg Keri (2):
  arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
  cpufreq: update capacity_freq_ref when the boost state changes

 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/topology.c      |  5 +++--
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 8 files changed, 29 insertions(+), 8 deletions(-)

base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
-- 
2.55.0


