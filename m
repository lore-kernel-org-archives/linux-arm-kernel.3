Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78203D2F34B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjjJfC53twxmBm+Qk3XwMU7iflsa1zYBVB4xaX414jE=; b=3FACiNB3zeTp3GE3JlJRWSTXVq
	7uim1AHbz0/Mq1gn5MB4S7Q9skZP599e2gcWZHZaSzObLYiSYxkdxwujvi9mjhPLS0tt3P87PmM2S
	BCXX1NNQ6WdfyV3y/PyCeWwqTfBlA2Yu/eJfth7GlME58nXrsjJ4jx1yApsMMtKOZF6r1fnvsSiGD
	/Rv7u7T+T5AvDUWudppozT93lqcFGrxubt4cVFxGz7vYLJ0eTGGc6nFGaCEYFOmoQ7B3ESqx2ZsHE
	3M/y55rqtPwFjAYaPFGYggTE7JOERzgcifCzPJvx/+vdPauI8A2JsKIZ25MWqkiXoV0z6t44cKE8v
	Aan3me7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiDt-00000007WqU-46iN;
	Tue, 13 Jan 2026 17:30:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiDr-00000007Wpc-2BZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:30:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC8C9497;
	Tue, 13 Jan 2026 09:30:16 -0800 (PST)
Received: from [192.168.178.30] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E8553F632;
	Tue, 13 Jan 2026 09:30:20 -0800 (PST)
Message-ID: <c4ff0ea7-db2f-4a1a-a095-c3f8249d294a@arm.com>
Date: Tue, 13 Jan 2026 17:30:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] Arm LFA: Improvements and interrupt support
To: Vedashree Vidwans <vvidwans@nvidia.com>, salman.nabi@arm.com,
 sudeep.holla@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20251208221319.1524888-1-vvidwans@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093027_693359_B691D5B8 
X-CRM114-Status: GOOD (  27.44  )
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

Hi Vedashree,

thanks for your efforts on this, and sorry for the delay on our side. We 
were hold up by a combination of spec changes and non-overlapping holidays.

On 08/12/2025 22:13, Vedashree Vidwans wrote:
> Hello,
> 
> The patches update the proposed Arm Live Firmware Activation (LFA)
> kernel driver [1] to incorporate review feedback [2] and refine the
> activation flow while remaining aligned with the LFA specification
> DEN0147 [3] and the SMCCC 1.2 calling convention. The series keeps
> the existing functionality but restructures and extends it to improve
> robustness, reviewability, and future extensibility.​

I would propose we change that approach a bit. We have updated and 
improved the driver internally, but were waiting for the new version of 
the spec (BET1) to be released, which happened some weeks ago. Salman 
will send out a new version of the driver in the next few days. Anything 
that is a bug (like the omission of the SMCCC v1.2 interface) will be 
addressed there, as there is no point to merge with a known buggy base 
patch. Also we will incorporate the changes we made so far, including 
adjustments for the new spec version.

Anything that can be added as independent patches should be done so, I 
think for instance the interrupt support is such a candidate. Ideally 
you can rebase your series on the changed base patch once this has been 
posted.
For other things like the platform driver introduction we can use your 
series here as a discussion base, as it allows us to reason and discuss 
this easier than by looking at a from-scratch patch.

Does this make sense?

Also please note that the DT and ACPI part has changed in the latest 
version of the spec. I will send a DT binding patch ASAP, to get this 
part out of the way.

Cheers,
Andre


 > > The SMCCC usage in the driver is updated to consistently use the
> SMCCC 1.2 register-based calling convention, consolidating arguments
> and results into a single struct to reduce stack usage and simplify
> the SMC interface. The patches also split the original changes into
> focused pieces and document the device node bindings in the commit
> messages, making it easier to follow and validate the implementation
> against the specification.​
> 
> The kernel driver is registered as a platform driver in accordence to
> the LFA device defined by the specification [3]. The driver now extends
> interface for interrupt-based enablement of LFA. During LFA, the
> interrupt
> thread refreshes firmware component details after each activation step
> and iterates over all activable components until no further activation
> is pending, matching the spec’s allowance for component detail changes
> after activation. This ensures that sysfs exposure of LFA components
> remains consistent with the authoritative information provided by the
> secure firmware.​
> 
> The handling of CPU rendezvous is adjusted so that the kernel now
> honors the rendezvous policy chosen by the firmware, instead of
> unconditionally forcing a rendezvous. This reflects experience with
> existing firmware deployments where mandatory rendezvous is not
> required, while still allowing the firmware to request it when
> needed.​
> 
> Thank you,
> Veda
> 
> [1] https://lore.kernel.org/lkml/20250926123145.268728-1-salman.nabi@arm.com/
> [2] https://lkml.org/lkml/2025/10/8/980
> [3] https://developer.arm.com/documentation/den0147/latest/
> 
> Vedashree Vidwans (5):
>    firmware: smccc: LFA: use smcc 1.2
>    firmware: smccc: LFA: refactor
>    firmware: smccc: add timeout, touch wdt
>    firmware: smccc: register as platform driver
>    firmware: smccc: lfa: refresh fw details
> 
>   drivers/firmware/smccc/Kconfig  |   3 +-
>   drivers/firmware/smccc/lfa_fw.c | 478 +++++++++++++++++++++++++-------
>   2 files changed, 380 insertions(+), 101 deletions(-)
> 


