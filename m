Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5DAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S4X3SxK+Viy1VfLMyQ17LfbnAuxcmyA2FJ6Hooxjog=; b=qF+iiyVEm3X+IeljKjCtMbT4Bi
	36M8PmGesoVl/1u6dhuPXXBJYuBgxbBpGujZ/xWmut/AZg24pn/Csa4GHsVUBwmdNWGmQC+wOkpXc
	yEc9+gf//39uVkxYLtVJCvY6NAkTH+k9r39VVguqpn4Y5No20oaz/QF9qG065lCZMYMRdJGDaBlal
	3SDmWRuOaISRvfSYKByGer3Bww58udBk4ZBRY2CQ8pVZeofdH7MAtsEEb6GC7bCDBA2WZANVyZeMX
	AlDluzcUm1rSMr/E2OoIwdGpT0ZumdVD0klpBinl7+x99HSe91KmNzCJU6owhy+o/++Z+dshMa/sa
	19fhj7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBsG-0000000Ai22-2rBg;
	Tue, 06 May 2025 06:33:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBes-0000000Ae27-0LKi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 06:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B2E95C515F;
	Tue,  6 May 2025 06:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE70C4CEEB;
	Tue,  6 May 2025 06:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746512399;
	bh=IaknPFqcP0N7YD+hkdGoIITlQSTa3FqWiaGwJ4M7xOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIRkTWuYiswfaOZhaA9mMbfIsTR/ZTklZu2Oe44c9xSTzghAJERx/3W0TESSm787U
	 CLR3YOKZjtiYprxUIhVt6kY7tF0oYRoYxYxEpdimHmXA+u4dadKipt6WARl1mkRAU9
	 DYMKW2mOUDdVzhaqf4Wxjsbw0BSWwQ66y/4ruC2EQ9FcSOQ6GdVOrAsYjqHoIEiGnQ
	 rtslXz2wkE5IQdgaxJYYNss6cFHmKoW2P6+1getUhQIgG1bZT6T7bDzYUHGdGuJQJW
	 R2M8i144n5z2YDH+umSx8sNUXhYwLbUKuUn2WZam2i7g8mOIGx5KAiU/OrXh/rGPk4
	 3T3KMLHJBsjfQ==
Date: Tue, 6 May 2025 06:19:57 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	catalin.marinas@arm.com, conor+dt@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
	linux-hyperv@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com,
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v9 00/11] arm64: hyperv: Support Virtual
 Trust Level Boot
Message-ID: <aBmqDU_UjxIAx2lP@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <20250428210742.435282-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428210742.435282-1-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_232002_207779_64718E69 
X-CRM114-Status: GOOD (  21.50  )
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

On Mon, Apr 28, 2025 at 02:07:31PM -0700, Roman Kisel wrote:
> This patch set allows the Hyper-V code to boot on ARM64 inside a Virtual Trust
> Level. These levels are a part of the Virtual Secure Mode documented in the
> Top-Level Functional Specification available at
> https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/vsm.
> 
> The OpenHCL paravisor https://github.com/microsoft/openvmm/tree/main/openhcl
> can serve as a practical application of these patches on ARM64.
> 
> For validation, I built kernels for the {x86_64, ARM64} x {VTL0, VTL2} set with
> a small initrd embedded into the kernel and booted VMs managed by Hyper-V and
> OpenVMM off of that.
> 
> Starting from V5, the patch series includes a non-functional change to KVM on
> arm64 which I tested as well.
> 
> I've kept the Acked-by tags given by Arnd and Bjorn. These patches (1 and 11)
> have changed very slightly since then (V5 and V6), no functional changes:
> in patch 1, removed macro's in favour of functions as Marc suggested to get rid
> of "sparse" warnings, and in patch 11, fixed building as a module. Please let me
> know if I should have not kept the tags.
> 
[...]
> Roman Kisel (11):
>   arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID

I notice there were review comments from multiple people on this patch.
To the best of my knowledge, those comments have been addressed in this
version, but I only had a cursory look and am by no means an expert on
ARM64.

My assumption is Arnd's review is good enough for this patch to get
merged.

With that assumption, I have applied this whole series to hyperv-next.

ARM64 maintainers, please let me know if you have an objection -- I can
drop the series and let Roman address further comments.

Thanks,
Wei.

>   arm64: hyperv: Use SMCCC to detect hypervisor presence
>   Drivers: hv: Enable VTL mode for arm64
>   Drivers: hv: Provide arch-neutral implementation of get_vtl()
>   arm64: hyperv: Initialize the Virtual Trust Level field
>   arm64, x86: hyperv: Report the VTL the system boots in
>   dt-bindings: microsoft,vmbus: Add interrupt and DMA coherence
>     properties
>   Drivers: hv: vmbus: Get the IRQ number from DeviceTree
>   Drivers: hv: vmbus: Introduce hv_get_vmbus_root_device()
>   ACPI: irq: Introduce acpi_get_gsi_dispatcher()
>   PCI: hv: Get vPCI MSI IRQ domain from DeviceTree


