Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9968ECA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gVTdtiWy9fgGK15KimSckpDSSxGqJuOzH/U6G/oihcg=; b=gvRbLyqpj19i2DGAo8jGQ8855a
	kL0Bv9HXcGpFNqobcGWvIz+N6xZH1xT4h9BybcyZYOcXVKNTIsrAokfQFu8gEP+eyLn080/nXkhSM
	tOzY+WJLo9PWi1Hh0WO8h5QEE3oMYczK5j81l8lPgA8GZ2KwEWT2elsdnFbc+dzv422qet08F1k6B
	yohIYx1FR/YzgwOZBA1JWXIYWih7XfTZX7hgzJ4zJCTJHZHHgWOV6ZFOYBOU2D7EdFnvgrs8pbFvR
	gNGN41OpKn/CLBabkw1ZA26WcWA+c6UrgMw6Zh/EYG/ivaqJzS7zR/F2XoBt5z+MR5pjv/DqQ1BXO
	CUKyDhqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdiD-00000004PA8-0L8S;
	Tue, 29 Sep 2026 19:42:01 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdiA-00000004P8f-1yKy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:41:59 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so26139995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790710916; x=1791315716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVTdtiWy9fgGK15KimSckpDSSxGqJuOzH/U6G/oihcg=;
        b=AbNZTfE9r5NtG+4RfLXts1v3czVtgxqCqV1cimOgRN++Zvtkdx7m+lPy0qbGAc6a94
         ShH98pLI1vuhObIOseLcIWdfsx+i3cFNOUsLGXCOLOlhPCqnHTqnUDLDaQRXGnZ4+w6K
         oS1CXFtVhkRzOy/gZc/ZHh4QOGXW784X2K0af3yBrEijU2rUB9eUS7Lk8Gftrwptzxyg
         vZ4khQZfv8XQCDep2oW4u5dTMVpSKA6Lb4PQqJM9bTC3TeWFdWU9YBJcqwumySZz7y++
         baa4I18gdi125rnV5ORMR1jIv4D2UMpHIiDhHOsOFvNFJw0GKmDcWj2FzYQo1LtNfW4U
         H/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710916; x=1791315716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVTdtiWy9fgGK15KimSckpDSSxGqJuOzH/U6G/oihcg=;
        b=WWBkj93byvYhewRwO5EBeRX9g1Mw5HBCYwRo501JxeWlX1Aybkt8CRHQGmpNUKmlVZ
         DgXEQy9qRHnKeMQkf0Sm0Y/da2tQUxx+IjYeVHn/Zj6gAB421384mY5iE3m2g2Gug/GQ
         1tQXCYA5T9A5YR9C5Wr3GtcHjACVchl2XdueO4JFDa4Uq0FfxuKpJR3f66vbAW14IxsL
         5nEvl5aCzZkQsMb4YWVivUakQjM4FhbF5WuWgiYCTAgHgTtpKAf0vQVGiN0QsqVKf9rW
         ttedZHGlTl3NDvVVcdDj6eyafkNof12h1ssJDzWqfB3otQFQaZOGgt3SKGy0G9DanxVd
         fi3A==
X-Forwarded-Encrypted: i=1; AKwUvBzAfVxHYmOEHrHoqvnybwfeZbKp6wxNF8Qbv3j0blZrsM5vflcgRuSoN3ZjWb3cH8mKHxi00Q3RQ9Yxo9/PbsHK@lists.infradead.org
X-Gm-Message-State: AFuF++l9+N6hIUQpIUjihGLocG2vyBalzHEwLZptn0ZNQ5BuKo2uWVUh
	rGS83ke6g5n8wTc7k6UNA0//l0NQciWP7Fv5RlKnglTinPK+5NRIbYGECftd40E+/OY=
X-Gm-Gg: AYBFou3TsM8gkuzTWoGIIFvAQVDUS+ZSKku2+KNnIlhVSyU4vxqXfBjqLs5GK/sXc3C
	EDqwBKfWXwPo0JJtR0IkOzL+xOiODzGbdf31+UZz5TeWjWEE52Y6NC9K6q1XR22M4a0ekDORAjV
	79URYyBBjc4Ou9FZt3lbGGg5RNNqGgWHn6kj4Wrwgh0/DVTFXNoQ0yrsJjuYDLlDehjuZYihet6
	AW3boVfQJ/kAykS5U2icXYaMnWvDd+bD1WcyP+mdQ0yMqkYPBN2VFvcw2gh962msCOkZrQ2/TcE
	eaockdyQuUnJVWUDXaKUe9DhBQPiaPLb5Ave+oHhrQwtbK+h7PELbUXzRWCpN/dKlERKrXI2I3g
	E3xCq3R63rxOn/EHcRfrdqeDVKjXSmDi7UywhSlyCbqSpIr+aaWJXZLS5lAZGzGKQ2azBmtGRrD
	mdmVVc9sGJGviYPr49PDK62c38sz6CSzgMNoVjOPT9y4m81UnCexR3mQbpGFAgZEw/mdLray0Wv
	nPxlKtDQvOgNkKrVfqXcuj9XiH/9QP81WLX9+h7+Ylq9NvtTd1jVX3b5hilt85LwQWTNq8=
X-Received: by 2002:a05:600c:1393:b0:49f:fbf8:87e9 with SMTP id 5b1f17b1804b1-4a014febbbbmr2911245e9.3.1790710915912;
        Tue, 29 Sep 2026 12:41:55 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b62sm5238355e9.6.2026.09.29.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:41:54 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	James Morse <james.morse@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gavin Shan <gshan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Salil Mehta <salil.mehta@opnsrc.net>
Subject: [RFC PATCH 0/2] cpu/hotplug: use cpu_enabled_mask for SMT bringup
Date: Tue, 29 Sep 2026 19:41:28 +0000
Message-Id: <cover.1790692295.git.salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124158_638600_BC4E57A1 
X-CRM114-Status: GOOD (  23.73  )
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

From: Salil Mehta <salil.mehta@opnsrc.net>

Hi,

For context, I had been away from the QEMU/kernel mailing-list work for an
extended period due to exceptional personal circumstances. I have only
recently started catching up with the Arm vCPU hotplug work and the related
changes that have landed upstream. While doing so, I came across the change
discussed below.

============
I. The Story
============

This is an RFC and, in particular, an open question about the interaction
between cpu_present_mask, cpu_enabled_mask and cpuhp_smt_enable(). I may have
missed a later constraint or discussion while catching up, so I would very
much appreciate a sanity check on the direction proposed here.

Commit f9a82544c717 ("cpu/hotplug: Fix NULL kobject warning in
cpuhp_smt_enable()") fixed a real warning on arm64 by changing the arm64
present-mask semantics: an ACPI Online-Capable CPU which is not MADT
Enabled is no longer initially marked present, and acpi_map_cpu() /
acpi_unmap_cpu() now add and remove it from cpu_present_mask.

I wondered whether the generic enabled mask gives us a narrower way to fix
the original problem.

cpu_enabled_mask was introduced by 4e1a7df45480 ("cpumask: Add enabled
cpumask for present CPUs that can be brought online") specifically for the
case where a CPU can be present but is not currently allowed to be brought
online.  cpuhp_smt_enable() is itself trying to bring offline CPUs online,
so patch 1 simply skips a CPU when !cpu_enabled(cpu).

If that is the intended meaning of cpu_enabled_mask, should
cpuhp_smt_enable() consume it rather than require arm64 to collapse the
present/not-enabled distinction?  Or is there another reason why changing
the arm64 present-mask semantics is preferred here?  I may be missing a
constraint in another architecture or in the SMT hotplug path, hence this
RFC.

Patch 2 reverts f9a82544c717 so that the question can be evaluated with the
original arm64 virtual CPU hotplug model restored.  The ordering is
intentional: the generic enabled check lands first, so reverting the arm64
present-mask change does not reintroduce the NULL-kobject warning.

===========
II. Testing
===========

The series is based on current upstream master, after Linux v7.3-rc5.

An arm64 Image build with CONFIG_ACPI=y, CONFIG_HOTPLUG_CPU=y and
CONFIG_HOTPLUG_SMT=y passes.

The runtime tests were performed on an NVIDIA Jetson Orin Nano system.
The host does not provide hardware SMT; QEMU's virtual SMT topology was
used to exercise the guest HOTPLUG_SMT paths described below.

===============
III. Reproducer
===============

The warning can be reproduced with an arm64 ACPI guest using a virtual SMT
topology, for example:

  qemu-system-aarch64 \
    -machine virt,gic-version=3,acpi=on \
    -accel tcg,thread=multi -cpu cortex-a57 \
    -smp cpus=3,maxcpus=6,sockets=1,clusters=1,cores=3,threads=2 \
    -m 1024M \
    -bios QEMU_EFI.fd \
    -kernel Image \
    -initrd rootfs.cpio.gz \
    -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
    -nographic

After boot:

  cat /sys/devices/system/cpu/present
  cat /sys/devices/system/cpu/enabled
  cat /sys/devices/system/cpu/online

With the pre-f9a arm64 semantics these report:

  present=0-5
  enabled=0-2
  online=0-2

Then exercise SMT disable/enable:

  echo off > /sys/devices/system/cpu/smt/control
  cat /sys/devices/system/cpu/online

  echo on > /sys/devices/system/cpu/smt/control
  cat /sys/devices/system/cpu/online

With the original cpuhp_smt_enable() implementation, the second write
produces the following warning:

  WARNING: fs/sysfs/group.c:137 at internal_create_group+0x418/0x550,
  CPU#2: bash/1

with the relevant call trace:

  internal_create_group+0x418/0x550
  sysfs_create_group+0x20/0x38
  topology_add_dev+0x24/0x38
  cpuhp_invoke_callback+0x174/0x2c0
  __cpuhp_invoke_callback_range+0x98/0x128
  _cpu_up+0x150/0x280
  cpuhp_smt_enable+0xc4/0x128
  control_store+0xf8/0x1f0

With patch 1 followed by patch 2, the same sequence gives:

  SMT off: online=0,2
  SMT on:  online=0-2

and:

  dmesg | grep -E "WARNING:|internal_create_group|cpuhp_smt_enable"

produces no output.

=========================
IV. Additional Comparison
=========================

I also checked cpus=4,maxcpus=6: all four requested initial CPUs are brought
up with the restored present semantics.  By comparison, applying the
f9a82544c717 changes in isolation to the same firmware model resulted in
only the boot CPU being brought up during early SMP initialization, with
the remaining enabled CPUs appearing later through ACPI enumeration.

Both patches pass scripts/checkpatch.pl --strict with no warnings or
errors.

I also have an up-to-date QEMU branch containing the corresponding Arm vCPU
hotplug work used for the tests above. If that would be useful for reproducing
or testing this RFC, please shout and I can share the branch.

=================
V. 'The' Question
=================

The main question for review is therefore whether cpu_enabled_mask should be
the generic eligibility check in cpuhp_smt_enable(), preserving the
present/enabled distinction that motivated the mask, or whether there is a
reason that distinction should instead be removed from arm64.

Many thanks in anticipation!
Salil

Salil Mehta (2):
  cpu/hotplug: Skip disabled CPUs in cpuhp_smt_enable
  Revert "cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()"

 Documentation/arch/arm64/cpu-hotplug.rst | 28 ++++++++++--------------
 arch/arm64/kernel/acpi.c                 |  2 --
 arch/arm64/kernel/smp.c                  | 12 +---------
 kernel/cpu.c                             |  5 +++--
 4 files changed, 16 insertions(+), 31 deletions(-)

-- 
2.34.1

