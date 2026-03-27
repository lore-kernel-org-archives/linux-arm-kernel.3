Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B858E10F284B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DW6kU5Q1Kd8Tnemq+hPJGFs03PNoawWT1ne9strSvoc=; b=jty7F6NiEkUM4LAjEnT0dibAi7
	Z+vtMpFoPEWdpYP5XP24p6K6bqqZly9OKC1gQrS+f8qs+71szx0S4fVVdcZasAkpC5llxtXKowGa8
	Sh8iOIDmCOaYHI+DoOQWa5ayOViwTwhiUV9Fl00AusAs7NXMMKdzvrNZjGePuYRtYeakJ/wFvnmf7
	l8lTBM57N6rFHnCIpgK2C8XE1J0iHSum9sH4smihOAdViPcRVUUN5t3iCcHLSqig4CL8bi1VmdcWM
	B4+GEoPTGKxXoVgv4ZHYVipkfmWXK4PGGMQDMpfE/W4QAyVZaJ+XiBdwPOm8a28ljpDMl5d8yC0mE
	1+5K8klA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69ui-00000007l6s-3rie;
	Fri, 27 Mar 2026 16:20:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69ug-00000007l5x-0ijS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 16:19:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A595535DA;
	Fri, 27 Mar 2026 09:19:49 -0700 (PDT)
Received: from [10.1.196.96] (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56A883F905;
	Fri, 27 Mar 2026 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774628395; bh=BT3A61wt+jo+f4hOBQHHbFUeQdz4NLa1VgiQZ5AES1w=;
	h=Date:To:Cc:From:Subject:From;
	b=GMB6pfjPIvxkbIFs2tPcZ2ibyJbPvuUvcK26Tc/VVChaK9nd+jIirCeqFUFAiCiDw
	 rzOn6qL0umL2eLvPs4faR+AS+hZc+M1cTqHt2T4Onz6nRKmfQZbziStfDliZaZ7BBy
	 74sL8g2Vf7g4DKIu2jGM3v/X7zlFewg/asjACNEg=
Message-ID: <01f76011-f3c2-4dcb-b3bc-37c7d4de342e@arm.com>
Date: Fri, 27 Mar 2026 16:19:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>
Cc: Ben Horgan <ben.horgan@arm.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Oliver Upton <oupton@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Dave P Martin <Dave.Martin@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng <zengheng4@huawei.com>
From: James Morse <james.morse@arm.com>
Subject: [GIT PULL] arm_mpam: Add KVM/arm64 and resctrl glue code
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_091958_319044_7A79E8CF 
X-CRM114-Status: GOOD (  12.94  )
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

Hi Catalin, Will,

Below is the MPAM series that plumbs all this stuff out to user-space via resctrl.

3 patches against KVM Acked by Marc Z, 9 patches against arm64 Acked or Reviewed by
Catalin. One patch "arm_mpam: resctrl: Add CDP emulation" adds an include to the
asm/mpam.h header. I'm assuming that doesn't need an ack.

Thanks to Ben for fixing all my bugs!

James

----------------------------------------------------------------
The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/glue/v7.0-rc3

for you to fetch changes up to 4ce0a2ccc0358f3f746fa50815a599f861fd5d68:

  arm64: mpam: Add initial MPAM documentation (2026-03-27 15:32:52 +0000)

----------------------------------------------------------------
Expose MPAM to user-space via resctrl based on v7.0-rc3

 - Add architecture context-switch and hiding of the feature from KVM.
 - Add interface to allow MPAM to be exposed to user-space using resctrl.
 - Add errata workaoround for some existing platforms.
 - Add documentation for using MPAM and what shape of platforms can use resctrl

----------------------------------------------------------------
Ben Horgan (11):
      arm_mpam: Reset when feature configuration bit unset
      arm64/sysreg: Add MPAMSM_EL1 register
      KVM: arm64: Preserve host MPAM configuration when changing traps
      KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
      arm64: mpam: Drop the CONFIG_EXPERT restriction
      arm64: mpam: Initialise and context switch the MPAMSM_EL1 register
      arm_mpam: resctrl: Hide CDP emulation behind CONFIG_EXPERT
      arm_mpam: resctrl: Add rmid index helpers
      arm_mpam: resctrl: Wait for cacheinfo to be ready
      arm_mpam: resctrl: Add monitor initialisation and domain boilerplate
      arm64: mpam: Add initial MPAM documentation

Dave Martin (2):
      arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
      arm_mpam: resctrl: Add kunit test for control format conversions

James Morse (22):
      arm64: mpam: Context switch the MPAM registers
      arm64: mpam: Re-initialise MPAM regs when CPU comes online
      arm64: mpam: Advertise the CPUs MPAM limits to the driver
      arm64: mpam: Add cpu_pm notifier to restore MPAM sysregs
      arm64: mpam: Add helpers to change a task or cpu's MPAM PARTID/PMG values
      KVM: arm64: Force guest EL1 to use user-space's partid configuration
      arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation
      arm_mpam: resctrl: Pick the caches we will use as resctrl resources
      arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
      arm_mpam: resctrl: Add resctrl_arch_get_config()
      arm_mpam: resctrl: Implement helpers to update configuration
      arm_mpam: resctrl: Add plumbing against arm64 task and cpu hooks
      arm_mpam: resctrl: Add CDP emulation
      arm_mpam: resctrl: Add support for 'MB' resource
      arm_mpam: resctrl: Add support for csu counters
      arm_mpam: resctrl: Allow resctrl to allocate monitors
      arm_mpam: resctrl: Add resctrl_arch_rmid_read()
      arm_mpam: resctrl: Update the rmid reallocation limit
      arm_mpam: resctrl: Add empty definitions for assorted resctrl functions
      arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
      arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl
      arm_mpam: Quirk CMN-650's CSU NRDY behaviour

Shanker Donthineni (4):
      arm_mpam: Add quirk framework
      arm_mpam: Add workaround for T241-MPAM-1
      arm_mpam: Add workaround for T241-MPAM-4
      arm_mpam: Add workaround for T241-MPAM-6

Zeng Heng (1):
      arm_mpam: Ensure in_reset_state is false after applying configuration

 Documentation/arch/arm64/index.rst          |    1 +
 Documentation/arch/arm64/mpam.rst           |   72 ++
 Documentation/arch/arm64/silicon-errata.rst |    9 +
 arch/arm64/Kconfig                          |    6 +-
 arch/arm64/include/asm/el2_setup.h          |    3 +-
 arch/arm64/include/asm/mpam.h               |   96 ++
 arch/arm64/include/asm/resctrl.h            |    2 +
 arch/arm64/include/asm/thread_info.h        |    3 +
 arch/arm64/kernel/Makefile                  |    1 +
 arch/arm64/kernel/cpufeature.c              |   21 +-
 arch/arm64/kernel/mpam.c                    |   62 +
 arch/arm64/kernel/process.c                 |    7 +
 arch/arm64/kvm/hyp/include/hyp/switch.h     |   12 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c          |   16 +
 arch/arm64/kvm/sys_regs.c                   |    2 +
 arch/arm64/tools/sysreg                     |    8 +
 drivers/resctrl/Kconfig                     |    9 +-
 drivers/resctrl/Makefile                    |    1 +
 drivers/resctrl/mpam_devices.c              |  305 ++++-
 drivers/resctrl/mpam_internal.h             |  108 +-
 drivers/resctrl/mpam_resctrl.c              | 1704 +++++++++++++++++++++++++++
 drivers/resctrl/test_mpam_resctrl.c         |  315 +++++
 include/linux/arm_mpam.h                    |   32 +
 23 files changed, 2735 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/arch/arm64/mpam.rst
 create mode 100644 arch/arm64/include/asm/mpam.h
 create mode 100644 arch/arm64/include/asm/resctrl.h
 create mode 100644 arch/arm64/kernel/mpam.c
 create mode 100644 drivers/resctrl/mpam_resctrl.c
 create mode 100644 drivers/resctrl/test_mpam_resctrl.c

