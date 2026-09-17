Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9513FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ImlHRMARPekrs3pRn9u3OhUrbVsrkbmUakHz4lPkGV4=; b=bwqdSp3NQnfcw9gOfB7ZQKT4Bl
	/ZOHcViQUN3vrfDRQP3p2rmXYw3Ofl3mOrx6zhbglqy1tVUZ53aRrdjZasxzUgcrUsyutjtMKbdAz
	edLy4v/3XtW25iU3UpOMVsGcayv9OEEjfX7sIF8+HExen6O0uH+b68kbD04KjZQWM0McddHNsSCpe
	JnZnB73+kP2iOcbkAgOBAKHq7RUR0W1tDwqA/PY0ZrGSjncLkH1II7UxhcwOKUeCSYLps7DEkdNvI
	/UqhJAFj+ZyikXghHuoHXmy1wL75/n38YpKBevwZkdcb4W5B3Fk6XMPUD+/XzoziwWuwOQqXfAHUT
	ZksoYRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN4-0000000Bkos-2mne;
	Thu, 17 Sep 2026 15:49:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EN1-0000000BknD-3tEp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:49:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CC2C1476;
	Thu, 17 Sep 2026 08:49:48 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 328DA3F7B4;
	Thu, 17 Sep 2026 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789660191; bh=RJzKdDo+REX/VlAsX42GpLBJ8XTELLDjR7TtOlDY7IQ=;
	h=From:To:Subject:Date:From;
	b=F0IPwOCmHpw5v1mc5QunUDRw1xCBe9gpk8MYh7Ami6aYqjBvmdxNpaaP4i0GZhxY2
	 YsbHuVNWhFjQhqBlL0qk+Y0BcqrXDpdu32nEJilOnoZMpTPd0PHz2u791ky1LnuOgy
	 ijFqCb1FJHhJIOXaqI9kbT2TTBHOOotZE3Mo0WeA=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool 0/7] Fix --vcpu-affinity
Date: Thu, 17 Sep 2026 16:49:25 +0100
Message-ID: <20260917154932.193943-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084956_040326_AD4D491C 
X-CRM114-Status: GOOD (  15.78  )
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

This is my attempt at fixing --vcpu-affinity, which I introduced. Patches #1-#4
are straightforward fixes, and they don't modify the current (broken) behaviour
in any way. Patch #5 fixes is most of the fix: with it, the VCPU threads run on
the physical CPUs passed to --vcpu-affinity, and most of the kvmtool threads,
except the virtio threads, use the main thread affinity.

The virtio threads are special because they are spawned from the VCPU threads,
and they inherit the VCPU thread affinity. Note that there might be other cases
where this happens.

Patches #6-#7 attempt to fix the remaining issue: #6 switch the entire codebase
to kvm_create_thread() instead of pthread_create(). In #7, kvm_create_thread()
will use the main thread affinity when creating new threads. These two patches
are RFC because they cause a lot of churn and I would like some feedback if it's
worth it.

Why is it useful to run the VCPUs on different physical CPUs than the other
threads? I can think of two situations:

1. Testing heterogenous hardware configurations, where the VM creation and setup
happens on a set of physical CPUs, and the VCPUs are run on a different set. I
used these patches for the KVM SPE series.

2. I/O testing. Maybe?

Tested on an Orion board and a x86 machine. On the x86 machine, there's was this
one thread called 'kvm-nx-lpage-re' which had affinity of the VCPUs, but I
couldn't figure out where it was created. I grep'ed for each part of the name in
the source node, no luck. I used strace, and couldn't see a clone call that
returned the corresponding pid. Any clues would be appreciated.

Alexandru Elisei (7):
  arm64: Pass the number of elements as the first argument to calloc()
  arm64: Consistently treat vcpu_affinity_cpuset as dynamically
    allocated
  arm64: Free the temporary cpumask in vcpu_affinity_parser()
  arm64/pmu: Consider kvmtool's affinity when searching for a PMU
  Correctly apply --vcpu-affinity to the VCPU threads
  Introduce kvm_create_thread()
  Don't apply --vcpu-affinity to threads spawned from VCPUs

 arm64/include/kvm/kvm-arch.h        |  2 --
 arm64/include/kvm/kvm-config-arch.h |  5 ----
 arm64/kvm-cpu.c                     |  9 ------
 arm64/kvm.c                         | 31 --------------------
 arm64/pmu.c                         | 31 +++++++++++---------
 builtin-run.c                       | 41 +++++++++++++++++++++++++--
 disk/aio.c                          |  3 +-
 disk/blk.c                          | 12 ++++++--
 disk/core.c                         | 29 ++++++++++---------
 disk/qcow.c                         | 44 ++++++++++++++++++++---------
 disk/raw.c                          | 21 +++++++++++---
 epoll.c                             |  2 +-
 include/kvm/disk-image.h            | 28 ++++++++++++------
 include/kvm/kvm-config.h            |  1 +
 include/kvm/kvm.h                   |  2 ++
 include/kvm/qcow.h                  |  3 +-
 include/kvm/uip.h                   |  2 ++
 include/kvm/util.h                  |  6 ++++
 kvm.c                               | 18 ++++++++++++
 net/uip/tcp.c                       |  7 ++---
 net/uip/udp.c                       |  5 ++--
 term.c                              |  4 +--
 ui/gtk3.c                           |  2 +-
 ui/sdl.c                            |  2 +-
 ui/vnc.c                            |  2 +-
 util/threadpool.c                   |  9 +++---
 util/util.c                         | 42 +++++++++++++++++++++++++++
 virtio/blk.c                        |  2 +-
 virtio/net.c                        | 26 +++++++++++------
 29 files changed, 258 insertions(+), 133 deletions(-)


base-commit: f67bc0bdae9433a9cfd05e65ea2c1bb6102566d9
-- 
2.55.0


