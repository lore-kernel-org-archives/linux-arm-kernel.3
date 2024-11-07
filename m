Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8F7D5D695
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 22:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dXEOtZcKhs1OyrLOGbwwuM7yb0GGsFy0HJU2nlATJVM=; b=AORSOx7jQxJkQndoreaQAC2Ype
	lAHVhJ09cYpI6UENSxHzaGVcAc/fqHLd6XbAEkJPNc0Dz83HOCM5k5NA2DyPUhX6uODDpxcYDMG1H
	9VaWWr4y7kLJC6M1Fk6RCJjTZmxa3gfC4X5t94DPa/CcOHUiczOHKxLykdyU44OF2WFgJlaBzyWsT
	lLVFFey5avvWD6B+zQNlR1qkqiiVl6EH4hcY/Ys94efV0aAwdE7vckiIGyou6B3gNsdKp8A7g55ln
	W6TKHwkGIDesaAM96V4N2c27SZFNXQxbTlcs7/MPiKR0/Du+a+Z3pQK4T1dur2vpSKY9O3hJ9QNAN
	t0DCC9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B8j-00000008Yyp-3Lpo;
	Thu, 07 Nov 2024 22:38:09 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9B3J-00000008Xfy-09jp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 22:32:35 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id A7369212C4BF;
	Thu,  7 Nov 2024 14:32:30 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A7369212C4BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731018750;
	bh=dXEOtZcKhs1OyrLOGbwwuM7yb0GGsFy0HJU2nlATJVM=;
	h=From:To:Cc:Subject:Date:From;
	b=E85Vpx1XKF/7gIXBsoZOI6XnWD4pHDLIv62Hmm0sqgJpnOf8/Cgg8V/QCKee3Vppr
	 ry4FPI40feJ1miQYl+Dx+/AvjsAcrxqUrJygt4jVjT3OJnYKE30CU4CoZ3KZny5GG9
	 XD4lpSNQQEk/X8UUGLdqFqJ/fa8hg8d9V2jWrOLw=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	luto@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	seanjc@google.com,
	pbonzini@redhat.com,
	peterz@infradead.org,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	arnd@arndb.de,
	sgarzare@redhat.com,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com,
	vkuznets@redhat.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: [PATCH v2 0/4] Add new headers for Hyper-V Dom0
Date: Thu,  7 Nov 2024 14:32:22 -0800
Message-Id: <1731018746-25914-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_143233_708923_F2E68E8D 
X-CRM114-Status: GOOD (  14.09  )
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

To support Hyper-V Dom0 (aka Linux as root partition), many new
definitions are required.

The plan going forward is to directly import definitions from
Hyper-V code without waiting for them to land in the TLFS document.
This is a quicker and more maintainable way to import definitions,
and is a step toward the eventual goal of exporting headers directly
from Hyper-V for use in Linux.

This patch series introduces new headers (hvhdk.h, hvgdk.h, etc,
see patch #3) derived directly from Hyper-V code. hyperv-tlfs.h is
replaced with hvhdk.h (which includes the other new headers)
everywhere.

No functional change is expected.

Summary:
Patch 1-2: Minor cleanup patches
Patch 3: Add the new headers (hvhdk.h, etc..) in include/hyperv/
Patch 4: Switch to the new headers

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
Changelog:
v2:
- Rework the series to simply use the new headers everywhere
  instead of fiddling around to keep hyperv-tlfs.h used in some
  places, suggested by Michael Kelley and Easwar Hariharan
- Fix compilation errors with some configs by adding missing
  definitions and changing some names, thanks to Simon Horman for
  catching those
- Add additional definitions to the new headers to support them now
  replacing hyperv-tlfs.h everywhere
- Add additional context in the commit messages for patches #3 and #4
- In patch #2, don't remove indirect includes. Only remove includes
  which truly aren't used, suggested by Michael Kelley

---
Nuno Das Neves (4):
  hyperv: Move hv_connection_id to hyperv-tlfs.h
  hyperv: Clean up unnecessary #includes
  hyperv: Add new Hyper-V headers in include/hyperv
  hyperv: Switch from hyperv-tlfs.h to hyperv/hvhdk.h

 arch/arm64/hyperv/hv_core.c        |    3 +-
 arch/arm64/hyperv/mshyperv.c       |    4 +-
 arch/arm64/include/asm/mshyperv.h  |    2 +-
 arch/x86/hyperv/hv_apic.c          |    1 -
 arch/x86/hyperv/hv_init.c          |   21 +-
 arch/x86/hyperv/hv_proc.c          |    3 +-
 arch/x86/hyperv/ivm.c              |    1 -
 arch/x86/hyperv/mmu.c              |    1 -
 arch/x86/hyperv/nested.c           |    2 +-
 arch/x86/include/asm/kvm_host.h    |    3 +-
 arch/x86/include/asm/mshyperv.h    |    3 +-
 arch/x86/include/asm/svm.h         |    2 +-
 arch/x86/kernel/cpu/mshyperv.c     |    2 +-
 arch/x86/kvm/vmx/hyperv_evmcs.h    |    2 +-
 arch/x86/kvm/vmx/vmx_onhyperv.h    |    2 +-
 arch/x86/mm/pat/set_memory.c       |    2 -
 drivers/clocksource/hyperv_timer.c |    2 +-
 drivers/hv/hv_balloon.c            |    4 +-
 drivers/hv/hv_common.c             |    2 +-
 drivers/hv/hv_kvp.c                |    2 +-
 drivers/hv/hv_snapshot.c           |    2 +-
 drivers/hv/hyperv_vmbus.h          |    2 +-
 include/asm-generic/hyperv-tlfs.h  |    9 +
 include/asm-generic/mshyperv.h     |    2 +-
 include/clocksource/hyperv_timer.h |    2 +-
 include/hyperv/hvgdk.h             |  303 +++++++
 include/hyperv/hvgdk_ext.h         |   46 +
 include/hyperv/hvgdk_mini.h        | 1295 ++++++++++++++++++++++++++++
 include/hyperv/hvhdk.h             |  733 ++++++++++++++++
 include/hyperv/hvhdk_mini.h        |  310 +++++++
 include/linux/hyperv.h             |   11 +-
 net/vmw_vsock/hyperv_transport.c   |    2 +-
 32 files changed, 2729 insertions(+), 52 deletions(-)
 create mode 100644 include/hyperv/hvgdk.h
 create mode 100644 include/hyperv/hvgdk_ext.h
 create mode 100644 include/hyperv/hvgdk_mini.h
 create mode 100644 include/hyperv/hvhdk.h
 create mode 100644 include/hyperv/hvhdk_mini.h

-- 
2.34.1


