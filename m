Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC5CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LGikjDL90B601+oxWQxAwcIjr4mTtMim1u9PxK6sLPk=; b=4kXAW02CexnjvhNnPUOu2J+rej
	WIl80V4xr++IzA83KJcP4oNiU0hRPrEsjxpfUCO3qfBZiHvUPZB67UVDLQ3VUY3TesKqUYOSATscS
	8VbgAFfaCgEr92zdUAVFgtzQK4OG23vRzyJ2JnJk7HPV4xSHlX3KM8OufgzsxiYslCGbKPhj4uxhP
	acwK4l1Uipui9prSwBVOGMygwcEFrBpN1s4x8vMjKTR7SNFN+OU5sIeO/gSuIRWy71IKGBIguerQa
	ynD94tzCJLbfIVUs51JV3u/rZp4fKfQNZ4SV0LNHj6Xfei9UXwbnZET+UMP8NZGcbD0pEimrDMleq
	IT64UZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoGq-00000002OCh-1KOt;
	Fri, 14 Aug 2026 09:32:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoGn-00000002OC6-3kb3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 09:32:11 +0000
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id AC4A620B7168; Fri, 14 Aug 2026 02:31:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AC4A620B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786699902;
	bh=LGikjDL90B601+oxWQxAwcIjr4mTtMim1u9PxK6sLPk=;
	h=From:To:Cc:Subject:Date:From;
	b=V52fu+Q7YwHWX9W2/wZbpu6Cw7VpwyngkD+kMRAP7yZF3d2G77nY3ySEgO8vexhQn
	 FdaNUrJya/ip3BiPvpLwgCoanNrBRsqTAh8Fac8n48JqWoR9aVjtre3AiQMgsfajX0
	 ZSbYN/s1WJ3wuQGawPlLLPVZiux6QHIF8fRi5n1M=
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>,
	Shradha Gupta <shradhagupta@microsoft.com>
Subject: [RFC PATCH 0/2] arm64/hyperv: Enable kexec reboot support
Date: Fri, 14 Aug 2026 02:31:28 -0700
Message-ID: <20260814093133.3191250-1-shradhagupta@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_023209_963496_13235EE6 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Kexec reboot consistently fails on ARM64 Hyper-V guests (Azure VMs).
During the kexec shutdown path, VMBus channels are never cleaned up,
so in the fresh kexec kernel startup hv_acpi_init() blocks because
the hypervisor still holds the old kernel's VMBus session open.

This is because ARM64 lacks the VMBus teardown that x86 performs during
kexec via hv_machine_shutdown(). On x86, machine_ops.shutdown is
overridden to send CHANNELMSG_UNLOAD and disable SynIC before CPUs
go offline. ARM64 has no equivalent mechanism.

Why existing notification mechanisms don't work:

- Reboot notifiers: Fire too early - they run inside
  kernel_restart_prepare(), BEFORE device_shutdown(). VMBus UNLOAD
  must happen AFTER device_shutdown() so that PCI drivers can clean
  up interrupt mappings (PCI_DELETE_INTERRUPT_MESSAGE) before UNLOAD
  force-closes channels. Sending UNLOAD first causes interrupt
  mapping leaks because the mappings aren't released on channel
  close.

- Device .shutdown callbacks: Too narrow - these handle per-device
  cleanup (e.g., individual VMBus channel teardown), but cannot
  perform bus-level operations like sending the global VMBus UNLOAD
  message or removing the SynIC CPU hotplug state via
  cpuhp_remove_state().

- VMBus parent device .shutdown callback: Also insufficient -
  cpuhp_remove_state() for SynIC teardown must run after all device
  shutdown completes, not during it. A parent .shutdown callback
  still executes within device_shutdown().

- The required window is: after device_shutdown() completes, after
  cpu_hotplug_enable(), but before smp_shutdown_nonboot_cpus(). That
  window exists inside machine_shutdown(), which currently has no hook.

The need for an ARM64 shutdown hook was previously discussed in [1]
but lacked a concrete failure case at the time. We now have one.

[1] https://lore.kernel.org/linux-arm-kernel/427a8277-49f0-4317-d6c3-4a15d7070e55@igalia.com/

This RFC proposes fixing kexec on ARM64 Hyper-V guests with:

Patch 1: A platform hook (arm64_pre_smp_shutdown_hook) in ARM64's
  machine_shutdown(), analogous to x86's machine_ops.shutdown. This
  runs after device_shutdown() and cpu_hotplug_enable(), allowing
  platform code to inject pre-shutdown logic at the right point in
  the kexec path.

  Design choices I'd like feedback on:
  - Single function pointer vs full machine_ops struct: ARM64 uses
    kernel-wide APIs (register_restart_handler, register_platform_power_off)
    for restart/poweroff rather than x86's monolithic machine_ops, so
    a targeted hook seemed more consistent with the ARM64 pattern.
  - On ARM64, machine_shutdown() is only called from kernel_kexec(),
    unlike x86/powerpc where it's also called from restart/halt/poweroff.

Patch 2: Uses this hook to call hv_kexec_handler() which performs:
  - vmbus_initiate_unload(): sends CHANNELMSG_UNLOAD to host
  - cpuhp_remove_state(): disables SynIC (SIMP, SIEFP, SINT) on
    all CPUs, ensuring the kexec'd kernel starts with clean state

Tested on ARM64 Azure VMs (Ubuntu 22.04, multiple vCPU configs):
- kexec reboot succeeds, VM comes back online with SSH
- Normal reboot/poweroff unaffected
- Multiple consecutive kexec cycles pass

Looking for feedback on:
1. Is the single function pointer hook acceptable for ARM64, or would
   the ARM64 maintainers prefer a registration API or __weak function?
2. Should this be arm64-specific or generic kexec infrastructure?

Shradha Gupta (2):
  arm64: Add pre-shutdown hook to machine_shutdown()
  arm64/hyperv: Add kexec handler using machine_shutdown hook

 arch/arm64/hyperv/mshyperv.c         | 37 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/system_misc.h |  2 ++
 arch/arm64/kernel/process.c          | 13 ++++++++++
 3 files changed, 52 insertions(+)

-- 
2.43.0


