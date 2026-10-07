Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E25CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lf1HukSMAjE1dMsnIEQmLErcMzYBlSGfITSXIYoNLso=; b=CR99cSQ7ZZ7GuHWLVrWd4lK+3u
	29yczzqm++LhB7S/8hPe9T0ryseul/7OKIRgdXaiUUz5UzJ1uVoAaRLVO9mqQUDooQtR75SRRMlYY
	WbrDsW9xvwLHSy2LL7mQoBp9iMAgi1JTkpWDGjoR6haxuW3BLH7EJozQyxz5KPjB721o6Ij2ad86N
	Cwjg5sXC6g1u5Atkd8yO9+emSPaUYXVis6/7afyGeJ1R1PneqeyYuWEmsTI6igJT2AMgpeIZdIjJH
	knYROSzXsKxF5lpXgZ7GZfy0rQ+T6v5I9mrwqRnHdPB1zO+PzH5/8x12nTHwQhCZtrrkd2LPjTseM
	oQZcTb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJi-00000001sln-2CLy;
	Wed, 07 Oct 2026 07:43:58 +0000
Received: from out-248.mta1.migadu.com ([2001:41d0:203:375::f8] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJZ-00000001sil-3aP2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:43:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=o5+OZlVLtUCueg4cXgDkgvR3WZIRFrS7EESmuvL0q6I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791359027; v=1; x=1791963827;
 b=jFoRxIDLTBHOp3gb9k4AfT6yEHQOHSMPWbGZgr8nPg6agkQDu5LMdHqTv51cUQii7xIvIs4B
 v/NBvUBll+jKYn1MkrrKq39QIgAEso9afRmjf8xbHUhkjnTKGxAvmrpbRG3Wt4VpWfnhmpd4lLX
 uAbffj2QLLlEKW0fHMUMXc/4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 781d49e7d095f2d5;
	Wed, 07 Oct 2026 07:43:47 +0000
X-Mizu-Trace-ID: 781d49e7d095f2d5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 0/3] KVM: arm64: timers: Program CVAL from the current count when the hardware won't apply the offset
Date: Wed,  7 Oct 2026 08:43:40 +0100
Message-Id: <20261007074343.324269-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_004350_036234_2AB3E998 
X-CRM114-Status: GOOD (  15.47  )
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

Hi folks,

Changes since v1 [1]:
  - Patch 3 programs the new case's CVAL as an absolute value near the
    wrap instead of a negative TVAL, so a host stall between the
    counter and timer writes can't make it fire. (Sashiko)

A guest timer can fail to fire, or fire early, once the guest's counter
is far enough from the host's. Where the hardware won't apply the
offset itself (the physical timer without CNTPOFF_EL2, a CNTPOFF_EL2
host while TGE is set, the virtual timer on x1e), KVM adds it to CVAL
and lets the hardware compare the sum against the raw counter. The
timer condition is an unsigned compare, and adding the offset to both
sides of it preserves it only while both sums wrap or neither does: a
guest whose counter is ahead of the host's by more than CVAL has an
expired timer that never fires, and one behind it can have a far-future
timer fire at once.

Patch 1 computes the programmed value from the current count instead,
and returns a guest hypervisor's own physical CVAL from memory where it
used to subtract the offset from the hardware value. Patch 2 does the
same for the virtual CVAL read on x1e, which has returned CVAL + offset
since the workaround landed. Patch 3 adds the second case, a guest
behind the host with a far-future timer, to arch_timer_edge_cases.

So far it has only shown up in the selftest, which moves the guest
counter half its range away from the host's. On a VHE host without
CNTPOFF_EL2 arch_timer_edge_cases hangs in its physical cval = 0 cases
until the vCPU is next loaded, which is what Zenghui saw on a
Kunpeng920 [2]. On a CNTPOFF_EL2 host (QEMU, here) the same cases
livelock instead. Both go away with patch 1. The arithmetic is wrong
for any offset once one sum wraps and the other doesn't, and the fix
for the selftest's case should be the fix for all of them.

Tested with arch_timer_edge_cases on QEMU with [3], which has since been
merged, under VHE, nVHE and pKVM, and under VHE with CNTPOFF_EL2 removed
by id_aa64mmfr0.ecv=1, the host class Zenghui hit. Under VHE with patch
1 reverted the new case fails. QEMU's TCG had a separate bug with the
same offsets, which [3] fixes. Without it the test stalls under nVHE and
pKVM as well, where KVM emulates the physical timer and patch 1 changes
nothing. Not exercised here: patch 1's x1e paths in timer_save_state()
and timer_restore_state() and all of patch 2, since nothing here runs on
an x1e, and patch 1's CNTP_CVAL_EL0 read in kvm_hyp_handle_timer(),
which only a guest hypervisor with a physical offset on a host without
CNTPOFF_EL2 reaches.

Patch 1 carries Cc: stable for the hang and the livelock.

Based on Linux 7.3-rc3 (fd73f4a665989; also applies to kvmarm/next
f91b534e81f23).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260921140427.2211373-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/r/460258be-0102-e922-c342-4e87cd94b9e5@huawei.com
[3] https://lore.kernel.org/r/20260921074451.3158645-1-fuad.tabba@linux.dev

Fuad Tabba (3):
  KVM: arm64: timers: Compute an offset-applied CVAL from the current
    count
  KVM: arm64: nv: Read a guest hypervisor's CNTV_CVAL_EL0 from memory on
    x1e
  KVM: arm64: selftests: Test a timer set past the counter's wrap

 arch/arm64/kvm/arch_timer.c                   | 27 +++++++++----------
 arch/arm64/kvm/hyp/vhe/switch.c               | 21 +++++++++------
 include/kvm/arm_arch_timer.h                  | 15 +++++++++++
 .../kvm/arm64/arch_timer_edge_cases.c         | 25 +++++++++++++++++
 4 files changed, 65 insertions(+), 23 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


