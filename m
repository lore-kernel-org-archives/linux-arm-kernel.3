Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A84F589B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nTetde5U51KiR0eBV+LXcTB7GkxgrKWa+3floMLhHNY=; b=DRII4OTUCz8H61+Yx+5xF2KdRK
	zvnjn+fJXaQahmaY/qhCZN30jlrzSzlyJI89QLS/Ky9ZU+Zaa6Wh1EskWeI3tqJu2kBp7iJNSO/FY
	m6TDo7JMj7S4ONWP1uo1dnyXPwTBeu7m0sNRYAfCYAvQRnmBOvJxJDJoVYSkgGv0Jvn++QuPD49wj
	ciBvrY8oakiDVqh9guaGimLBiKLUbKvBVCb5ouLrtDrdab4FaL5DkxSceVP/IXGWlzyGNeLgBIkQN
	0tZfmm0NzbRAUznVRRQkk1PnZZZrV/ZDhmTBIjwOSZET0uxxJyKRSgLWpLG72AP1rDexdBTqe4g4t
	rj7KDnQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtNz-0000000BdSF-0YWj;
	Thu, 23 Apr 2026 12:42:27 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtNr-0000000BdQH-3Jk3;
	Thu, 23 Apr 2026 12:42:26 +0000
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.18])
	by linux.microsoft.com (Postfix) with ESMTPSA id B04AF20B7165;
	Thu, 23 Apr 2026 05:42:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B04AF20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776948138;
	bh=nTetde5U51KiR0eBV+LXcTB7GkxgrKWa+3floMLhHNY=;
	h=From:To:Cc:Subject:Date:From;
	b=AGSGwzpn5SgYbJuozOHPeZnNYZQ9uldpmU9A4lC05mLwq5usd/PIzxpuo5lFM9Sfq
	 Xipd4Nv8Nh8GqNV4AwN6AnGqg9CPyCH0gsyxjRn+rL9ykb0o2w2fyRDuy3g6JYa3hP
	 95HqlLPXYHJi9PzX/wV6jI4WAvQWWXbN/Eu9+Ec8=
From: Naman Jain <namjain@linux.microsoft.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Naman Jain <namjain@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vdso@mailbox.org,
	ssengar@linux.microsoft.com
Subject: [PATCH v2 00/15] Add arm64 support in MSHV_VTL
Date: Thu, 23 Apr 2026 12:41:50 +0000
Message-ID: <20260423124206.2410879-1-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054219_858787_E3BFA0A3 
X-CRM114-Status: GOOD (  21.39  )
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

The series adds support for ARM64 to mshv_vtl driver.
For this, common Hyper-V code is refactored, necessary support is added,
mshv_vtl_main.c is refactored and then finally support is added in
Kconfig.

Changes since v1:
https://lore.kernel.org/all/20260316121241.910764-1-namjain@linux.microsoft.com/

Patch 1: arm64: smp: Export arch_smp_send_reschedule for mshv_vtl module
* Changed prefix in subject (Michael)
* Sashiko - no issues

Patch 2:
* Add #include <linux/io.h> in hv_common.c (Michael)
* Remove ms_hyperv.hints change from non TDX case,
  as it won't matter in failure case (Michael)
* Add ms_hyperv.hints &=
  ~HV_X64_ENLIGHTENED_VMCS_RECOMMENDED for TDX
  case, to maintain parity with existing code.
  (Sashiko)
* Handle synic_eventring_tail -ENOMEM issue by
  returning early (Michael|Sashiko)
* Only 4k page is used here, so add dependency on
  PAGE_SIZE_4KB for MSHV_VTL as well in a later
  Kconfig patch (Sashiko|Michael)
* Use HV_HYP_PAGE_SIZE instead of PAGE_SIZE to avoid
  page size mismatch issues (Sashiko)
* s/"vmalloc_to_pfn(*hvp)"/
  "page_to_hvpfn(vmalloc_to_page(*hvp))" in
  hv_common.c (Sashiko|Michael)
* s/GFP_KERNEL/flags in __vmalloc. (Sashiko|Michael)
* Limit code to 80 lines in hv_common_cpu_init (Mukesh R.)
* Move arch based definition of
  HV_VP_ASSIST_PAGE_ADDRESS_SHIFT to
  hvgdk_mini.h (Michael)
* Added a comment about x64 vmalloc_to_pfn(*hvp)) (Michael)
* Move remaining hv_vp_assist_page code from
  arch/x86/include/asm/mshyperv.h to
  include/asm-generic/mshyperv.h (Michael)
* s/HV_SYN_REG_VP_ASSIST_PAGE/HV_MSR_VP_ASSIST_PAGE (Michael)

Patch 3:
* Rework the code and remove these new APIs. Move
  the vmbus_handler global variable and
  hv_setup_vmbus_handler()/hv_remove_vmbus_handler()
  from arch/x86 to drivers/hv/hv_common.c so that
  the same APIs can be used to setup per-cpu vmbus
  handlers as well for arm64. (Michael)

Patch 4:
* Sashiko's comments are generic and outside the
  scope of the refactoring this patch is doing.
  Will take it up separately.

Patch 6:
* Sashiko's comment regarding race condition is false positive.
* Regarding memory leak on cpu offline - online -
  beyond the scope of this series, I will fix it
  separately.

Patch 7:
* Subject s/"arch: arm64:"/"arm64: hyperv:" (Michael)
* Changed commit msg as per Michael's suggestion
* Add kernel_neon_begin(), kernel_neon_end() calls (Sashiko)
* Removed Note prefix from comments (Michael)
* Added compile time check for cpu context to be
  within 1024 bytes of mshv_vtl_run
* Moved the declarations of mshv_vtl_return_call to generic file

Patch 8:
* Split the patch into three patches - number 8-10 (Michael)
* Moved hv_vtl_configure_reg_page declaration to asm-generic header
* Sashiko's other reviews are for existing code,
  I will take them separately

Patch 9: (now patch 11)
No changes required for Sashiko's comments as most
of such controls are intentionally designated to
OpenVMM to keep kernel driver simpler.

Patch 10: (now patch 13)
* Remove hv_setup_percpu_vmbus_handler invocations,
  after redesign in previous patchsets (Michael)
* Simplified mshv_vtl_get_vsm_regs() by moving arch
  specific code (for x86) to hv_vtl -
  mshv_vtl_return_call_init(). This removes arch
  checks in mshv_vtl driver. Add a separate patch
  for this (now patch 12)
* Other Sachiko's reviews are related to existing
  code - can be taken up separately

Patch 11 (now patch 15):
* Only 4k page is supported, so add dependency on
  PAGE_SIZE_4KB for MSHV_VTL (Sashiko|Mihael)
* Remove "Kconfig: " from subject line. (Michael)

New patch 14:
Add a Kconfig dependency on 4K PAGE_SIZE for
MSHV_VTL to manage assumptions in MSHV_VTL driver

Change prefix in subjects as per below naming convention:
mshv_vtl_main changes - "mshv_vtl: "
arch/arm64 Hyper-V changes - "arm64: hyperv: "
arch/x86 Hyper-V changes - "x86/hyperv: "

Add Reviewed-by on already reviewed patches.

Naman Jain (15):
  arm64: smp: Export arch_smp_send_reschedule for mshv_vtl module
  Drivers: hv: Move hv_vp_assist_page to common files
  Drivers: hv: Move vmbus_handler to common code
  mshv_vtl: Refactor the driver for ARM64 support to be added
  Drivers: hv: Export vmbus_interrupt for mshv_vtl module
  mshv_vtl: Make sint vector architecture neutral
  arm64: hyperv: Add support for mshv_vtl_return_call
  Drivers: hv: Move hv_call_(get|set)_vp_registers() declarations
  Drivers: hv: mshv_vtl: Move hv_vtl_configure_reg_page() to x86
  arm64: hyperv: Add hv_vtl_configure_reg_page() stub
  mshv_vtl: Let userspace do VSM configuration
  mshv_vtl: Move VSM code page offset logic to x86 files
  mshv_vtl: Add remaining support for arm64
  Drivers: hv: Add 4K page dependency in MSHV_VTL
  Drivers: hv: Add ARM64 support for MSHV_VTL in Kconfig

 arch/arm64/hyperv/Makefile        |   1 +
 arch/arm64/hyperv/hv_vtl.c        | 165 ++++++++++++++++++++++++
 arch/arm64/include/asm/mshyperv.h |  25 ++++
 arch/arm64/kernel/smp.c           |   1 +
 arch/x86/hyperv/hv_init.c         |  88 +------------
 arch/x86/hyperv/hv_vtl.c          | 149 ++++++++++++++++++++-
 arch/x86/include/asm/mshyperv.h   |  21 +--
 arch/x86/kernel/cpu/mshyperv.c    |  12 --
 drivers/hv/Kconfig                |   7 +-
 drivers/hv/hv_common.c            | 103 ++++++++++++++-
 drivers/hv/mshv.h                 |   8 --
 drivers/hv/mshv_vtl.h             |   3 +
 drivers/hv/mshv_vtl_main.c        | 208 +++---------------------------
 drivers/hv/vmbus_drv.c            |  18 +--
 include/asm-generic/mshyperv.h    |  62 +++++++++
 include/hyperv/hvgdk_mini.h       |   6 +-
 16 files changed, 550 insertions(+), 327 deletions(-)
 create mode 100644 arch/arm64/hyperv/hv_vtl.c

-- 
2.43.0


