Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C95C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dotjx06SWmrVjPB7Z2CaqcDqgv/mNIYEKk1xOmc6KOo=; b=mWJPIE85vIuYswd+GxwhGeSyiP
	nqAQ3lHUqksPzkbOi6Vm4U+/wOJ3so+0OKMuymFPKTFLGN2ByUudP6ge5Evv1/VTYuIoQXU9ChHQy
	nOzLvPtr+j1UYPIA9R5INVPR5te/O5u8eAkfgbtXaAR65vnqLh17U8mbSosmE9eyB/3g6qTMHXh3J
	Ckh+o+RmVO84feUQkHScyUKclAftoewjbPXgL1pg2SMU58o+P8ud9kqxCLOY93WFgiqwYkhCwBPa1
	p5fLGvmz1+x/wQPW5x4ekLA0Nw4oR7bauQMKcR4OJmiOH6SRyZS34kiTBLxHJkMXNf07+n0QGKUbi
	B1hOPitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSEU-0000000BBXN-02f7;
	Wed, 11 Jun 2025 20:39:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPfl-0000000AlC2-0brQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:55:39 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6008C2115196;
	Wed, 11 Jun 2025 10:55:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6008C2115196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749664535;
	bh=dotjx06SWmrVjPB7Z2CaqcDqgv/mNIYEKk1xOmc6KOo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cjF2ILhlABGfqzXOL8i/Inel2VXBacL66m3r5jCIXFlyPhYhWrN4VVsqd2tFGUKXI
	 jF88qXNWtH88d9gPYf5vtHAfDc8PWhbKIkRSclxSRH4KTwZW3vugN2D2HTBAYneopq
	 ycI7z13UXKktCQ5PwqqxhVnX1vZskifni4JlDQaY=
Message-ID: <2c8d534b-02c5-4149-882b-40eb27671614@linux.microsoft.com>
Date: Wed, 11 Jun 2025 10:55:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Nested virtualization fixes for root partition
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, lpieralisi@kernel.org,
 kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 bhelgaas@google.com, jinankjain@linux.microsoft.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 x86@kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_105537_216842_80568A7B 
X-CRM114-Status: GOOD (  13.80  )
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



On 6/10/2025 4:52 PM, Nuno Das Neves wrote:
> Fixes for running as nested root partition on the Microsoft Hypervisor.
> 
> The first patch prevents the vmbus driver being registered on baremetal, since
> there's no vmbus in this scenario.
> 
> The second patch changes vmbus to make hypercalls to the L0 hypervisor instead
> of the L1. This is needed because L0 hypervisor, not the L1, is the one hosting
> the Windows root partition with the VMM that provides vmbus.
> 
> The 3rd and 4th patches fix interrupt unmasking on nested. In this scenario,
> the L1 (nested) hypervisor does the interrupt mapping to root partition cores.
> The vectors just need to be mapped with MAP_DEVICE_INTERRUPT instead of
> affinitized with RETARGET_INTERRUPT.
> 
> Mukesh Rathor (1):
>    PCI: hv: Do not do vmbus initialization on baremetal
> 
> Nuno Das Neves (1):
>    Drivers: hv: Use nested hypercall for post message and signal event
> 
> Stanislav Kinsburskii (2):
>    x86: hyperv: Expose hv_map_msi_interrupt function
>    PCI: hv: Use the correct hypercall for unmasking interrupts on nested
> 
>   arch/arm64/include/asm/mshyperv.h   | 10 ++++++
>   arch/x86/hyperv/irqdomain.c         | 47 +++++++++++++++++++++--------
>   arch/x86/include/asm/mshyperv.h     |  2 ++
>   drivers/hv/connection.c             |  3 ++
>   drivers/hv/hv.c                     |  3 ++
>   drivers/pci/controller/pci-hyperv.c | 21 +++++++++++--
>   6 files changed, 71 insertions(+), 15 deletions(-)
> 

Very cool stuff :) LGTM.

For the patch series:
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>

-- 
Thank you,
Roman


