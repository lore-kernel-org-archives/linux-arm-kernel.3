Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEF5106ACD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mvUG/Z2/uZ5c2fN5XPa/W3Zus8cUWVYIvf3QqsJFUI=; b=uSZrn9QmJ0EAt5t+fa/n7Qzm9D
	Gyq9PEfdCb9bSyvsJxrJ0IU67wvWsxuCGK5A8RBzXHSkNq/2y3x3kmC85lMCtsxG1Bus7jW5nbFM/
	LKO04rE6zeL6OMkcS6DdORrE2ZFY6aheftoDAO7di4WW1qyAFjebnZjZxfMhmxe69i67AqO7UvnIb
	YH4ZWFPlkggkbdK3ytnK+SWDIKw6nRhuBJOsucp5SKoZByTFNJPgv2774AcuiU7xbHqfQq34uV596
	Cw9zO7wTf7jAAKjHLYJQw9BWe1H7CPbscnVerXze180wxNVfw2bS7770OL61aMsmk8SQTXmHxcRHu
	0QrvYPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kHR-0000000EoCU-0oZF;
	Thu, 12 Mar 2026 17:57:05 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kHO-0000000EoBK-315i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:57:04 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-509069a7a7fso61421cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 10:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773338221; cv=none;
        d=google.com; s=arc-20240605;
        b=Lnod4wKcZ0CfzoGqDBIM9JNTulpBpQb7ovq2Oihe5QC3FZvLE+JvSKyGL7rTwxOHX6
         y5E3KCEqqBos02LVJsTLMOM9AezHlBR+88zXp1HXLiGIISV66iQ3iV1K0nSKmOdlHnMs
         U6V8B/WwiG9Nb8lrsBrAJB6w5l6B2hBMzMcq8+gdIfANIXEJHIPr/hw/FWsm/i+ODkV4
         sfRWOi4lb7ztXQPKlO3mbPmyo/N7axcDiuuiPjXz7c9EkTS0MO9+4KebfOzUrKKdCoBA
         PWwGqXafdo3fa1g3U7pC5/2WvtIkmUmWVzNn3/kXUnsd8NvI0ZuCOnYyQAHy2iaxRgrz
         Kbyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0mvUG/Z2/uZ5c2fN5XPa/W3Zus8cUWVYIvf3QqsJFUI=;
        fh=4TA2DA2Tv9LApA++DOrh43Fg89ErwmknBnoQNN9gZMo=;
        b=dJBEqaFmQluG98F2BsJvOytPnphXp16a46+3ahdJeWvGNcpNbefElsfiQSfl/qHu5r
         YN/MCO+lu6WXNF/HeS11NbSBbGqaXjGS+qh0UNnugrAPYolRoc4LQtU/qtAU2ADZpyGT
         KV/lRdAZ33f2h87WJtGTm7AiT1E13eyTHYsrvxIbaxbZlPC5iXwFpCTZuOMQjT+3YFLw
         b6M1HVFE4jnHGgSoQHLpWVM2etNNFi29stnXPduTOC+Tre1kK8eK8EkzVz8SHeHRBeqN
         1F8/I3rzJErn1AAlSqyVrtM8WwQ/0OCdAuZ0RVvbBulx24EL+O5AI4DKNk/C/FfYviKX
         cZSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773338221; x=1773943021; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0mvUG/Z2/uZ5c2fN5XPa/W3Zus8cUWVYIvf3QqsJFUI=;
        b=pCv7J7B1YCUu4Rqj4scW/O9SMpqMM6KfADptu5nxMF/ObavGJRzGrzJi228gLKCr1h
         AbYUBIzb8buY9fdA1chNCC4lCnz8Pq2YRu/lAk8VKhb8Nx+g/Swwa+iev1z+r89ZWImN
         +RK6qqKafxQ0XW5319a/DKDZrGx1seOZpHhbZehJGeTUEhcq7FGkvJEYYn5DRA7+Q3PW
         dBi+m7RorOFTtkuIWXU29vmeY086WW0qnUX8TviEVXh2RlU4QyOdY4WTVHbU0wjgTB2o
         0vUl2e14iT6Y6CIaUw4S6eW4+1gYhs7TIDbLP+2gt4Wv3vjvANO+1gKuXLHTRUi8knbc
         y98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338221; x=1773943021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mvUG/Z2/uZ5c2fN5XPa/W3Zus8cUWVYIvf3QqsJFUI=;
        b=D948p8CzLniNGUceynQ+owXEeJhKtWDoR6RJa7EhUZTknWExMzh7e+B8/svKIlRyGQ
         kXkO8gzlYKBrXkqVziwQ+oaq65PeAChrX8g58KKGADTNdDHeWb+j8/OCihBWgNiSse6F
         suPkoAKgZ6qRaBlvPvC5PxoMx/w6g9W9T7OfK7z2XV8H6gNwZpZi0qS4rUqaWeqC8ZuT
         cFgacmY3myt89SHbKJsg9REbkawueQ+TVkIJb2z2MTWXn15GLASkSVj7bvmtEwuUtnQc
         AztPkmTgs5sgISLyvhkAeFa4YKyNV7V/vEvTQUZWfnY4vP4Jdd0PdgvElSgfXU7qeO+K
         2QYw==
X-Forwarded-Encrypted: i=1; AJvYcCU06I8tKepjJXHmwymOdDZ9OumJBvq3SAJ6R/6PuSLUYYPCmNjA2Fg/eFOTS1v4b6AoZusvAY1n4T2fDFappsEu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/u5nIwfClSbvxJao0HowNXlyn3/7HtMSYmXWqbhx8hJPFlYzR
	Nj1t1nqzsEx3iGJGuaNrAfbhjlUctbhDiMPC7kkPDPlUP4dWJH3qKFCUzzYqVN+pkseNGdR5J6w
	zH45l/mdChGxLnr6ue1mrQEJmPxkYoJe/l5RCeRT5
X-Gm-Gg: ATEYQzwvIEB6JyF9Dt/42gQfShwmx8EWFB9clJ4zuH5WIiHg71D4MEDxS38x0V+Io0N
	N2cMV3Sjb2IJq+l1zw5egzNqPvs+TcL0zOifkAnmLq55uSYWqVkhpXr0BoTOyYppVvekRG7fkKa
	smrzT+ubPD2eTO0+8mq1IK9r+us6+pi6+3tURmAyc2UEo6o8HRjx7q2rGc4DMnux0xh5nHo8+8b
	0l8zmyifrrgqlWE6o5w0GmyXS9X/Z4Olzk3xppqD5c69mbvcL27rtAT5Lcn/nnU1crI/L8i7RS2
	JOUmFwAuD37shJqECgY=
X-Received: by 2002:a05:622a:1988:b0:509:25d8:9991 with SMTP id
 d75a77b69052e-509584f4fdcmr880951cf.16.1773338219853; Thu, 12 Mar 2026
 10:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 12 Mar 2026 17:56:22 +0000
X-Gm-Features: AaiRm53G1nU7Kj2nfUNM3RM8KCK0SKWeGFwz4CDwwTgLZgN0Ex1zKGhkAGVfKhA
Message-ID: <CA+EHjTw3iQnTjKhMn6NP=R9JszitP9KAt0qU=Gdg0kwdcDvYsA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] KVM: ITS hardening for pKVM
To: Sebastian Ene <sebastianene@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, catalin.marinas@arm.com, dbrazdil@google.com, 
	joey.gouly@arm.com, kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, 
	oupton@kernel.org, perlarsen@google.com, qperret@google.com, 
	rananta@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_105702_804519_92CB22AF 
X-CRM114-Status: GOOD (  65.22  )
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

Hi Sebastian,

On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote:
>
> This series introduces the necessary machinery to perform trap & emulate
> on device access in pKVM. Furthermore, it hardens the GIC/ITS controller to
> prevent an attacker from tampering with the hypervisor protected memory
> through this device.
>
> In pKVM, the host kernel is initially trusted to manage the boot process but
> its permissions are revoked once KVM initializes. The GIC/ITS device is
> configured before the kernel deprivileges itself. Once the hypervisor
> becomes available, sanitize the accesses to the ITS controller by
> trapping and emulating certain registers and by shadowing some memory
> structures used by the ITS.
>
> This is required because the ITS can issue transactions on the memory
> bus *directly*, without having an SMMU in front of it, which makes it
> an interesting target for crossing the hypervisor-established privilege
> boundary.
>
>
> Patch overview
> ==============
>
> The first patch is re-used from Mostafa's series[1] which brings SMMU-v3
> support to pKVM.
>
> [1] https://lore.kernel.org/linux-iommu/20251117184815.1027271-1-smostafa@google.com/#r
>
> Some of the infrastructure built in that series might intersect and we
> agreed to converge on some changes. The patches [1 - 3] allow unmapping
> devices from the host address space and installing a handler to trap
> accesses from the host. While executing in the handler, enough context
> has to be given from mem-abort to perform the emulation of the device
> such as: the offset, the access size, direction of the write and private
> related data specific to the device.
> The unmapping of the device from the host address space is performed
> after the host deprivilege (during _kvm_host_prot_finalize call).
>
> The 4th patch looks up the ITS node from the device tree and adds it to
> an array of unmapped devices. It install a handler that forwards all the
> MMIO request to mediate the host access inside the emulation layer and
> to prevent breaking ITS functionality.
>
> The 5th patch changes the GIC/ITS driver to exposes two new methods
> which will be called from the KVM layer to setup the shadow state and
> to take the appropriate locks. This one is the most intrusive as it
> changes the current GIC/ITS driver. I tried to avoid creating a
> dependency with KVM to keep the GIC driver agnostic of the virtualization
> layer but I am happy to explore other options as well.
> To avoid re-programming the ITS device with new shadow structures after
> pKVM is ready, I exposed two functions to change the
> pointers inside the driver for the following structures:
> - the command queue points to a newly allocated queue
> - the GITS_BASER<n> tables configured with an indirect layout have the
>   first layer shadowed and they point to a new memory region

We used the term shadow for the hyp version of structs in an early
pKVM patch series, but after a bit of discussion, we refer to it as
the hypervisor state [1]. So please use this terminology instead of
shadow.

[1] https://lore.kernel.org/all/YthwzIS18mutjGhN@google.com/

> Patch 6 adds the entry point into the emulation setup and sets up the
> shadow command queue. It adds some helper macros to define the offset
> register and the associate action that we want to execute in the
> emulation. It also unmaps the state passed from the host kernel
> to prevent it from playing nasty games later on. The patch
> traps accesses to CWRITER register and copies the commands from the
> host command queue to the shadow command queue.
>
> Patch 7 prevents the host from directly accessing the first layer of the
> indirect tables held in GITS_BASER<n>. It also prevents the host from
> directly accesssing the last layer of the Device Table (since the entries
> in this table hold the address of the ITT table) and of the vPE Table
> (since the vPE table entries hold the address of the virtual LPI pending
> table.
>
> Patches [8-10] sanitize the commands sent to the ITS and their
> arguments.
>
> Patches [11-13] restrict the access of the host to certain registers
> and prevent undefined behaviour. Prevent the host from re-programming
> the tables held in the GITS_BASER register.
>
> The last patch introduces an hvc to setup the ITS emulation and calls
> into the ITS driver to setup the shadow state.
>
>
> Design
> ======
>
>
> 1. Command queue shadowing
>
> The ITS hardware supports a command queue which is programmed by the driver
> in the GITS_CBASER register. To inform the hardware that a new command
> has been added, the driver updates an index into the GITS_CWRITER

It updates a base address offset, but that's probably what you meant.

> register. The driver then reads the GITS_CREADR register to see if the
> command was processed or if the queue is stalled.
>
> To create a new command, the emulation layer mirrors the behavior
> as following:
>  (i) The host ITS driver creates a command in the shadow queue:
>         its_allocate_entry() -> builder()
>  (ii) Notifies the hardware that a new command is available:
>         its_post_commands()
>  (iii) Hypervisor traps the write to GITS_CWRITER:
>         handle_host_mem_abort() -> handle_host_mmio_trap() ->
>             pkvm_handle_gic_emulation()
>  (iv) Hypervisor copies the command from the host command queue
>       to the original queue which is not accessible to the host.
>       It parses the command and updates the hardware write.
>
> The driver allocates space for the original command queue and programs
> the hardware (GITS_CWRITER). When pKVM becomes available, the driver

You mean GITS_CBASER, right?

> allocates a new (shadow) queue and replaces its original pointer to
> the queue with this new one. This is to prevent a malicious host from
> tampering with the commands sent to the ITS hardware.
>
> The entry point of our emulation shares the memory of the newly
> allocated queue with the hypervisor and donates the memory of the
> original queue to make it inaccesible to the host.
>
>
> 2. Indirect tables first level shadowing
>
> The ITS hardware supports indirection to minimize the space required to
> accommodate large tables (eg. deviceId space used to index the Device Table
> is quite sparse). This is a 2-level indirection, with entries from the
> first table pointing to a second table.
>
> An attacker in control of the host can insert an address that points to
> the hypervisor protected memory in the first level table and then use
> subsequent ITS commands to write to this memory (MAPD).
>
> To shadow this tables, we rely on the driver to allocate space for it
> and we copy the original content from the table into the copy. When
> pKVM becomes available we switch the pointers that hold the orginal
> tables to point to the copy.
> To keep the tables from the hypervisor in sync with what the host
> has, we update the tables when commands are sent to the ITS.
>
>
> 3. Hiding the last layer of the Device Table and vPE Table from the host
>
> An attacker in control of the host kernel can alter the content of these
> tables directly (the Arm IHI 0069H.b spec says that is undefined behavior
> if entries are created by software). Normally these entries are created in
> response of commands sent to the ITS.

nit: unpredictable behavior. Undefined usually refers to instructions.

>
> A Device Table entry that has the following structure:
>
> type DeviceTableEntry is (
>         boolean Valid,
>         Address ITT_base,
>         bits(5) ITT_size
> )

Be careful, this might be true for a specific GIC implementation,
e.g., Arm CoreLink GIC-600, but according to the spec (5.2) the
formats of the tables in system memory are IMPLEMENTATION DEFINED. If
the format is relevant to us, then we verify specific GIC
implementation via GITS_IIDR. If the series depends on this, then we
must decide what to do in case the specific implementation does not
match what we expect.

> This can be maliciously created by an attacker and the ITT_base can be
> pointed to hypervisor protected memory. The MAPTI command can then be
> used to write over the ITT_base with an ITE entry.

You mean it writes to the memory addressed by ITT_base, rather than
writes over the ITT_base itself.

> Similarly a vCPU Table entry has the following structure:
>
> type VCPUTableEntry is (
>         boolean Valid,
>         bits(32) RDbase,
>         Address VPT_base,
>         bits(5) VPT_size
> )
>
> VPT_base can be pointed to hypervisor protected memory and then a
> command can be used to raise interrupts and set the corresponding
> bit. This would give a 1-bit write primitive so is not "as generous"
> as the others.
>
>
> Notes
> =====
>
>
> Performance impact is expected with this as the emulation dance is not
> cost free.
> I haven't implemented any ITS quirks in the emulation and I don't know
> whether we will need it ? (some hardware needs explicit dcache flushing
> ITS_FLAGS_CMDQ_NEEDS_FLUSHING).

It's not a quirk. We should handle this in the next respin, because
cache maintenance of the command queue is an explicit architectural
requirement depending on how the hardware is integrated and
configured.

According to the spec, the cacheability attributes of the ITS command
queue are strictly governed by the InnerCache and OuterCache fields of
the GITS_CBASER register. These fields can be configured for various
memory types, including Device-nGnRnE or Normal Non-cacheable.

Because pKVM now takes responsibility for physically writing the
command packets into the true hardware queue, the hypervisor must obey
the cacheability attributes programmed into the physical GITS_CBASER.

If the software provisions GITS_CBASER as Non-cacheable, the
hypervisor must perform explicit data cache maintenance (such as DC
CVAU or DC CVAC) after copying the commands to the shadow queue. If
you don't implement this, the physical ITS hardware (acting as a
non-coherent bus master) will read stale memory, which will inevitably
lead to queue stalls or the ITS executing garbage commands.

Since we are shielding the physical queue from the host, we inherit
the host's responsibility to manage its cache coherency based on the
GITS_CBASER configuration.

> Please note that Redistributors trapping hasn't been addressed at all in
> this series and the solution is not sufficient but this can be extended
> afterwards.
> The current series has been tested with Qemu (-machine
> virt,virtualization=true,gic-version=4) and with Pixel 10.

It would be helpful to mention that this is based on Linux 7.0-rc3
(applied cleanly, and confirmed with you offline).

Also, it would be helpful if you could share how to tested this
series, and how we could reproduce your tests.

Thanks,
/fuad


>
>
> Thanks,
> Sebastian E.
>
> Mostafa Saleh (1):
>   KVM: arm64: Donate MMIO to the hypervisor
>
> Sebastian Ene (13):
>   KVM: arm64: Track host-unmapped MMIO regions in a static array
>   KVM: arm64: Support host MMIO trap handlers for unmapped devices
>   KVM: arm64: Mediate host access to GIC/ITS MMIO via unmapping
>   irqchip/gic-v3-its: Prepare shadow structures for KVM host deprivilege
>   KVM: arm64: Add infrastructure for ITS emulation setup
>   KVM: arm64: Restrict host access to the ITS tables
>   KVM: arm64: Trap & emulate the ITS MAPD command
>   KVM: arm64: Trap & emulate the ITS VMAPP command
>   KVM: arm64: Trap & emulate the ITS MAPC command
>   KVM: arm64: Restrict host updates to GITS_CTLR
>   KVM: arm64: Restrict host updates to GITS_CBASER
>   KVM: arm64 Restrict host updates to GITS_BASER
>   KVM: arm64: Implement HVC interface for ITS emulation setup
>
>  arch/arm64/include/asm/kvm_arm.h              |   3 +
>  arch/arm64/include/asm/kvm_asm.h              |   1 +
>  arch/arm64/include/asm/kvm_pkvm.h             |  20 +
>  arch/arm64/kvm/hyp/include/nvhe/its_emulate.h |  17 +
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   2 +
>  arch/arm64/kvm/hyp/nvhe/Makefile              |   3 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  14 +
>  arch/arm64/kvm/hyp/nvhe/its_emulate.c         | 653 ++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 134 ++++
>  arch/arm64/kvm/hyp/nvhe/setup.c               |  28 +
>  arch/arm64/kvm/hyp/pgtable.c                  |   9 +-
>  arch/arm64/kvm/pkvm.c                         |  60 ++
>  drivers/irqchip/irq-gic-v3-its.c              | 177 ++++-
>  include/linux/irqchip/arm-gic-v3.h            |  36 +
>  14 files changed, 1126 insertions(+), 31 deletions(-)
>  create mode 100644 arch/arm64/kvm/hyp/include/nvhe/its_emulate.h
>  create mode 100644 arch/arm64/kvm/hyp/nvhe/its_emulate.c
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

