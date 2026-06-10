Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDFFCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzERIkXWcv/bAvr+EYchplC+hxfeJ1SdAKHIVbrqjos=; b=Miyin7S5voGBNbvcXHwE2ysYhi
	NBBTMemwlxQraCTveEPIjA9E4C7x2ESWomNx+s+2C0gufyZC8k9SjBbJk957+gJGLpKHpaiF/jQQX
	e7QwFBRwSXZQm5XghHuQv09hC4FQAgJmJQs1bTyKeCXkduiz9NqI1Xsv1ZuDZiDOfiPv/+hDNHYt3
	y/kD3mmxBbHqGGvrlyo5f6Fm+cyvryUGSh2MEot5psxX+n/yhnpkWQDxn3/AoV10f3tUs2C49rDXY
	EhTm0ajjAxSqjuotfh5mTKo6bEmbYg/RSnnmfZP/3eMN/WCvgosMUAoTNvv8Zm0FZSjojH79pH8vn
	GUyS0tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIHY-00000007esG-0vXq;
	Wed, 10 Jun 2026 12:43:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIHV-00000007eri-2n6N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:43:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D29725E3;
	Wed, 10 Jun 2026 05:43:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 274743FDE2;
	Wed, 10 Jun 2026 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781095418; bh=kpajauAMier9YxqkV0PniCvx8btFDRzDQ7xNUMW78tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEmFMtRlvmXravXCOwPnwIcd4Uqy8sqeBkogah9vEUWATOZBlkG2G+ZaF2a1Xsma/
	 eD4i+S1ghdIlEbri9qoFKCFpZiu3u41Z+EWBuptIkDfunELUV+UJyI+Rm12L1qsukp
	 tf7oSn9QkU3/pV4BRC1QzTqiQqEFmfCMhc2ZCdMg=
Date: Wed, 10 Jun 2026 13:43:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, mrigendra.chaubey@gmail.com,
	suzuki.poulose@arm.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, arnd@arndb.de, gshan@redhat.com,
	jic23@kernel.org, dietmar.eggemann@arm.com, sudeep.holla@kernel.org,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <ailb9N9PqXZUg9vA@arm.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
 <20260610075202.3597031-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610075202.3597031-3-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_054341_779689_89F588E0 
X-CRM114-Status: GOOD (  21.35  )
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

On Wed, Jun 10, 2026 at 03:52:02PM +0800, Jinjie Ruan wrote:
> diff --git a/Documentation/arch/arm64/cpu-hotplug.rst b/Documentation/arch/arm64/cpu-hotplug.rst
> index 8fb438bf7781..7c3379b704aa 100644
> --- a/Documentation/arch/arm64/cpu-hotplug.rst
> +++ b/Documentation/arch/arm64/cpu-hotplug.rst
> @@ -47,11 +47,12 @@ ever have can be described at boot. There are no power-domain considerations
>  as such devices are emulated.
>  
>  CPU Hotplug on virtual systems is supported. It is distinct from physical
> -CPU Hotplug as all resources are described as ``present``, but CPUs may be
> -marked as disabled by firmware. Only the CPU's online/offline behaviour is
> -influenced by firmware. An example is where a virtual machine boots with a
> -single CPU, and additional CPUs are added once a cloud orchestrator deploys
> -the workload.
> +CPU Hotplug as all vCPU resources are statically described in the firmware
> +configuration tables (e.g. MADT), meaning their maximum possible count is
> +known at boot. However, vCPUs that are not enabled at boot are not marked
> +as ``present`` by the kernel until they are hotplugged. An example is where
> +a virtual machine boots with a single CPU, and additional CPUs are added
> +once a cloud orchestrator deploys the workload.
>  
>  For a virtual machine, the VMM (e.g. Qemu) plays the part of firmware.
>  
> @@ -60,16 +61,19 @@ brought online. Firmware can enforce its policy via PSCI's return codes. e.g.
>  ``DENIED``.
>  
>  The ACPI tables must describe all the resources of the virtual machine. CPUs
> -that firmware wishes to disable either from boot (or later) should not be
> -``enabled`` in the MADT GICC structures, but should have the ``online capable``
> -bit set, to indicate they can be enabled later. The boot CPU must be marked as
> -``enabled``.  The 'always on' GICR structure must be used to describe the
> -redistributors.
> +that are hot-pluggable must have the ``online capable`` bit set and the
> +``enabled`` bit cleared in the MADT GICC structures to indicate they can be
> +enabled later. The boot CPU must be marked as ``enabled`` with its
> +``online capable`` bit cleared. The 'always on' GICR structure must be used
> +to describe the redistributors.
>  
>  CPUs described as ``online capable`` but not ``enabled`` can be set to enabled
>  by the DSDT's Processor object's _STA method. On virtual systems the _STA method
> -must always report the CPU as ``present``. Changes to the firmware policy can
> -be notified to the OS via device-check or eject-request.
> +must always set the ``ACPI_STA_DEVICE_PRESENT`` bit, while toggling the
> +``ACPI_STA_DEVICE_ENABLED`` bit to reflect its plug status. The kernel will
> +then dynamically mark the vCPU as ``present`` within the OS when the
> +``ACPI_STA_DEVICE_ENABLED`` bit becomes set during hot-add. Changes to the
> +firmware policy can be notified to the OS via device-check or eject-request.

The doc update looks fine as well, thanks for clarifying. My reviewed-by
stands.

-- 
Catalin

