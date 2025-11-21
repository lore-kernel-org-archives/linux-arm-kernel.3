Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C543CFC509
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE4RF91CHSmj29Ey+g7+Zy0u6YAO+z0tUMTsG27ePhY=; b=JeHjgdTAA+PDucCxnTbeh2Vm2/
	mSv2p2cswrbx2UmqFgDn3HiXkWhKBytVnQtJtYxHYcgDkOJ3DdFCHy4O4DCJf+hHlrXtgT8jVwvwX
	aVnaS2/CRXcMLXT/ZIjDk8bf/yW2MwUXgfkxVgYt8N5XuHKY1fqajd7IlH5wvyTTP0Iu2ZXj1XV3y
	P/SDDzD9Bnnf5yUdLEXtzzjloVGpyQ+ES/bKP5srSe1GBfN83DGHq8wxxw7xoB7EupCgZS6CSgfF/
	fI4Eb3SJ+YHLMn7A783YouwWqxcR1hJxDDdHAec3r/ifr4uYhc6F4+i9I7Czr5LZ9gjjexoppO09e
	c16xfNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYxQ-000000090Xn-3S7l;
	Fri, 21 Nov 2025 21:46:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMYxN-000000090Wz-3ybg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 21:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16CBD43D2E;
	Fri, 21 Nov 2025 21:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3019AC4CEF1;
	Fri, 21 Nov 2025 21:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763761577;
	bh=oJMYZKjDueq0/yuoBxUsmwsCWXC5pUAaufSkDCJ80Z4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bBT1kKxd7JiLv7cgJ+U4vwA49RGj4W3W+ZqTHzuZwXDhKWXSNhpJ9GBaO/GR5GhmF
	 qucLsBA4sqTV4YfRBDNlAGZzPHu/IkV80OrcHDeGcXSy4CEzH6OwwBBuiIczblnejd
	 PP7DWGmTXX8/WKMNUgA2Oiitdo9OUGggxlPVp5Sf6p03OV2yenh1iu23jCnLR8JB/+
	 m6JCBjnuZZsjQg1n0e2Gy/wefcce1AoaDoi+450PMXSUEu8TrmYpdsv9d7PVXHzE9p
	 DQp4nlPLq+k1zY6zw9PAzqXLLtWJ0kqAdjX5gU+1LtbzsZYhMPnWfF9qLylbbgHJNv
	 z0ehZMQj+Djlw==
Date: Fri, 21 Nov 2025 22:46:11 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
 gshan@redhat.com, aneesh.kumar@kernel.org, sami.mujawar@arm.com,
 sudeep.holla@arm.com, steven.price@arm.com, regressions@lists.linux.dev
Subject: [REGRESSION] GHES firmware can't be readonly - Was: Re: [PATCH v3
 3/3] arm64: acpi: Enable ACPI CCEL support
Message-ID: <20251121224611.07efa95a@foz.lan>
In-Reply-To: <20250918125618.2125733-4-suzuki.poulose@arm.com>
References: <20250918125618.2125733-1-suzuki.poulose@arm.com>
	<20250918125618.2125733-4-suzuki.poulose@arm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_134618_033304_A71F4589 
X-CRM114-Status: GOOD (  21.55  )
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

Hi,

Em Thu, 18 Sep 2025 13:56:18 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> escreveu:

> Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> As per UEFI specifications NVS memory is reserved for Firmware use even
> after exiting boot services. Thus map the region as read-only.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Sami Mujawar <sami.mujawar@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  arch/arm64/kernel/acpi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 4d529ff7ba51..b3195b3b895f 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -357,6 +357,16 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  			 * as long as we take care not to create a writable
>  			 * mapping for executable code.
>  			 */
> +			fallthrough;
> +
> +		case EFI_ACPI_MEMORY_NVS:
> +			/*
> +			 * ACPI NVS marks an area reserved for use by the
> +			 * firmware, even after exiting the boot service.
> +			 * This may be used by the firmware for sharing dynamic
> +			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
> +			 * as read-only.
> +			 */
>  			prot = PAGE_KERNEL_RO;

Please revert this change.

Making area reserved to be used by firmware breaks some APEI 
notification mechanisms:

[    3.787189] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
[    3.787286] {1}[Hardware Error]: event severity: recoverable
[    3.787367] {1}[Hardware Error]:  Error 0, type: recoverable
[    3.787471] {1}[Hardware Error]:   section_type: ARM processor error
[    3.787520] {1}[Hardware Error]:   MIDR: 0x00000000000f0510
[    3.787555] {1}[Hardware Error]:   Multiprocessor Affinity Register (MPIDR): 0x0000000080000000
[    3.787577] {1}[Hardware Error]:   running state: 0x0
[    3.787591] {1}[Hardware Error]:   Power State Coordination Interface state: 0
[    3.787621] {1}[Hardware Error]:   Error info structure 0:
[    3.787635] {1}[Hardware Error]:   num errors: 2
[    3.787736] {1}[Hardware Error]:    error_type: 0x02: cache error
[    3.787760] {1}[Hardware Error]:    error_info: 0x000000000091000f
[    3.787795] {1}[Hardware Error]:     transaction type: Data Access
[    3.787823] {1}[Hardware Error]:     cache error, operation type: Data write
[    3.787851] {1}[Hardware Error]:     cache level: 2
[    3.787876] {1}[Hardware Error]:     processor context not corrupted
[    3.788666] [Firmware Warn]: GHES: Unhandled processor error type 0x02: cache error
[    3.789258] Unable to handle kernel write to read-only memory at virtual address ffff800080035018
[    3.789277] Mem abort info:
[    3.789289]   ESR = 0x000000009600004f
[    3.789324]   EC = 0x25: DABT (current EL), IL = 32 bits
[    3.789343]   SET = 0, FnV = 0
[    3.789358]   EA = 0, S1PTW = 0
[    3.789376]   FSC = 0x0f: level 3 permission fault
[    3.789396] Data abort info:
[    3.789411]   ISV = 0, ISS = 0x0000004f, ISS2 = 0x00000000
[    3.789427]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[    3.789444]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    3.789501] swapper pgtable: 4k pages, 52-bit VAs, pgdp=00000000505d7000
[    3.789524] [ffff800080035018] pgd=10000000510bc003, p4d=1000000100229403, pud=100000010022a403, pmd=100000010022b403, pte=0060000139b90483
[    3.789936] Internal error: Oops: 000000009600004f [#1]  SMP
[    3.798553] Modules linked in:
[    3.799147] CPU: 0 UID: 0 PID: 161 Comm: kworker/0:2 Not tainted 6.18.0-rc1-00016-g166324c9c7aa-dirty #46 PREEMPT 
[    3.799754] Hardware name: QEMU QEMU Virtual Machine, BIOS unknown 02/02/2022
[    3.800251] Workqueue: kacpi_notify acpi_os_execute_deferred
[    3.800928] pstate: 614020c5 (nZCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    3.801207] pc : acpi_os_write_memory+0x120/0x190
[    3.801415] lr : acpi_os_write_memory+0x2c/0x190
[    3.801577] sp : ffff800080a83b60
[    3.801748] x29: ffff800080a83b60 x28: ffff9f6c0f423a38 x27: ffff9f6c0d4e75b0
[    3.802080] x26: ffff9f6c0f7bd930 x25: ffff9f6c0f1dae70 x24: 0000000000000000
[    3.802369] x23: 0000000000000000 x22: ffff9f6c0e35acf8 x21: 0000000000000040
[    3.802641] x20: 0000000000000001 x19: 0000000139b90018 x18: 0000000000000010
[    3.802880] x17: 0000000000000000 x16: 0000000000000002 x15: 0000000000000020
[    3.803133] x14: 00000000ffffffff x13: 0000000000000030 x12: fff00000c09392a0
[    3.803422] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff9f6c0d491634
[    3.803681] x8 : 0000000000000010 x7 : 0000000139b90018 x6 : ffff9f6c0f41b518
[    3.803925] x5 : 0000000139b91000 x4 : 0000000000000018 x3 : fff00000c09391e0
[    3.804176] x2 : 0000000000000040 x1 : 0000000000000008 x0 : ffff800080035018
[    3.804512] Call trace:
[    3.804715]  acpi_os_write_memory+0x120/0x190 (P)
[    3.804956]  apei_write+0xd0/0xf0
[    3.805112]  ghes_clear_estatus.part.0+0xc8/0xe0
[    3.805290]  ghes_proc+0xa4/0x220
[    3.805417]  ghes_notify_hed+0x5c/0xb8
[    3.805546]  notifier_call_chain+0x78/0x148
[    3.805746]  blocking_notifier_call_chain+0x4c/0x80
[    3.805945]  acpi_hed_notify+0x28/0x40
[    3.806082]  acpi_ev_notify_dispatch+0x50/0x80
[    3.806255]  acpi_os_execute_deferred+0x24/0x48
[    3.806446]  process_one_work+0x15c/0x3b0
[    3.806574]  worker_thread+0x2d0/0x400
[    3.806721]  kthread+0x148/0x228
[    3.806849]  ret_from_fork+0x10/0x20
[    3.807114] Code: 17ffffeb 710102bf 54000341 d50332bf (f9000014) 
[    3.807504] ---[ end trace 0000000000000000 ]---
[    4.116196] note: kworker/0:2[161] exited with irqs disabled
[    4.116700] note: kworker/0:2[161] exited with preempt_count 1

The problem happens when APEI tries to notify the firmware that a GPIO
notification was accepted by writing a value at the read_ack_register:

	(gdb) list *ghes_clear_estatus+0xc8
	0xffff800080945b90 is in ghes_clear_estatus (../drivers/acpi/apei/ghes.c:264).
	259                     return;
	260
	261             val &= gv2->read_ack_preserve << gv2->read_ack_register.bit_offset;
	262             val |= gv2->read_ack_write    << gv2->read_ack_register.bit_offset;
	263
	264             apei_write(val, &gv2->read_ack_register);
	265     }
	266
	267     static struct ghes *ghes_new(struct acpi_hest_generic *generic)
	268     {

-

You can reproduce it with QEMU v10.2.0-rc1:

    qemu-system-aarch64 -bios ../emulator/QEMU_EFI-silent.fd \
    --nographic -monitor telnet:127.0.0.1:1234,server,nowait -m \
    4g,maxmem=8G,slots=8 -no-reboot -device pcie-root-port,id=root_port1 -device \
    virtio-blk-pci,drive=hd -device virtio-net-pci,netdev=mynet,id=bob -object \
    memory-backend-ram,size=4G,id=mem0 -netdev \
    type=user,id=mynet,hostfwd=tcp::5555-:22 -qmp \
    tcp:localhost:4445,server=on,wait=off -M virt,nvdimm=on,ras=on -cpu max -smp \
    4 -numa node,nodeid=0,cpus=0-3,memdev=mem0 -kernel \
    ../work/arm64_build/arch/arm64/boot/Image.gz -append \
    "earlycon nomodeset root=/dev/vda1 fsck.mode=skip tp_printk maxcpus=4" \
    -drive if=none,file=../emulator/debian.qcow2,format=qcow2,id=hd

using:

	scripts/ghes_inject.py arm

Kernel 6.17 is not affected. The problem happens after 6.18-rc1.

Thanks,
Mauro

