Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20997C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MCQD6tyFxYce9hOfxH8H9C0m5zZ1nppCbnkzefDArRM=; b=N0PLAxxIo0a5pqG9SpHWkFln6E
	fY3rtfiMYUaR9IQsYpUxHkVmhDa4zarAbjxRbg/FoMjr1gTZY2mbU4K+qYq3giHzZJp4INYSwqivg
	qvGu45eVcqqYlNp+zFYcAhXu0y5+b2pJZsOOe/ViIIEO3gnq6McxYsm1cOJiXRBjvgoQxTdB61Cax
	5eSO0kYxeeEOuMzhTOUndrjxCcfmCbTxJPjuYH2URzmjMxd5ocs/mFIkGZMkuHgYNfSOCNoToA+xK
	NOf6tJSdf6YGYVIGi3DOoQoVIOhXsGK4pQWv4s6qlxp8RyOy80li7431WdpTtY0BVV8YAmG/b1oEL
	MOOEQYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8edH-00000002KSm-3vVF;
	Mon, 21 Sep 2026 14:04:35 +0000
Received: from out-109.mta1.migadu.com ([2001:41d0:203:375::6d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8edD-00000002KRx-1nLa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:04:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kGLTqSDqNKduog1GOtZuGMpqVSeUXQY7T0QuU7Ou3ok=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789999469; v=1; x=1790604269;
 b=m84gf6949J/twwPJ0E+UKYO/7oeugphoJlkbeXcQdW4hXy86TmR0OJ3+NxeSqf0vBD5ZOMOx
 74SSHIDqz1ybKEWbIIGVt2bs29z2MM7q/hz/utnPaiwgY6EBEy1MfiE++8hTJJON5i22pCRfuuf
 VU/0gbErvR2ah/6DQ6PdO9Sk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 295205c3151231b2;
	Mon, 21 Sep 2026 14:04:29 +0000
X-Mizu-Trace-ID: 295205c3151231b2
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
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
Subject: [PATCH 0/3] KVM: arm64: timers: Program CVAL from the current count when the hardware won't apply the offset
Date: Mon, 21 Sep 2026 15:04:24 +0100
Message-Id: <20260921140427.2211373-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_070432_753124_E60F6D00 
X-CRM114-Status: GOOD (  14.12  )
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
Kunpeng920 [1]. On a CNTPOFF_EL2 host (QEMU, here) the same cases
livelock instead. Both go away with patch 1. The arithmetic is wrong
for any offset once one sum wraps and the other doesn't, and the fix
for the selftest's case should be the fix for all of them.

Tested with arch_timer_edge_cases on QEMU with [2] applied, under VHE,
nVHE and pKVM, and under VHE with CNTPOFF_EL2 removed by
id_aa64mmfr0.ecv=1, the host class Zenghui hit. Under VHE with patch 1
reverted the new case fails. QEMU's TCG has a separate bug with the
same offsets, which [2] fixes. Without it the test stalls under nVHE
and pKVM as well, where KVM emulates the physical timer and patch 1
changes nothing. Not exercised here: patch 1's x1e paths in
timer_save_state() and timer_restore_state() and all of patch 2, since
nothing here runs on an x1e, and patch 1's CNTP_CVAL_EL0 read in
kvm_hyp_handle_timer(), which only a guest hypervisor with a physical
offset on a host without CNTPOFF_EL2 reaches.

Patch 1 carries Cc: stable for the hang and the livelock.

Based on Linux 7.3-rc3 (fd73f4a665989).

Cheers,
/fuad

[1] https://lore.kernel.org/r/460258be-0102-e922-c342-4e87cd94b9e5@huawei.com
[2] https://lore.kernel.org/qemu-devel/20260921074451.3158645-1-fuad.tabba@linux.dev/

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

-- 
2.39.5


