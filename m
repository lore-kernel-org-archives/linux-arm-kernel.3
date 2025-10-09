Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351ACCD188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqryIbTLNAZxq/ph6WgoBQrNOq1iObiGVUU/POs0HMg=; b=EhCX5w1yU53ZaWte2OfZoVDDa+
	ZJ3BYWYWrh+hrnilQoB7r3jpQLpSTqIYQJSim+pnAjTPUl6E6vR70jRylKXHG+YlG8FSIoNronU58
	I6enuQyyIZmIYB/yXGUnkkEYvH+NMdn3z9OKF+4AcW2fqHXi+rY3tCfJq2XzdsdhzEpHK32xQqUf3
	oKkvXezXpK9SB53bdR2RovrG53pJeiDhxY+mEEpoloz+X7LcZa992vLrf7+lwF1pN4hIs/8SwGUNh
	Li8uoJ3W89OJshYUyi29lVghQE6tx3evXP0HDzaxB0Rxk/PCEb3Nbj4L9Psy+kR3cCz1rLm0SSM0W
	UuB9QPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mgJ-00000005cEY-2st7;
	Thu, 09 Oct 2025 09:11:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mgH-00000005cDP-2nMa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:11:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 000CA176A;
	Thu,  9 Oct 2025 02:11:14 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976E63F59E;
	Thu,  9 Oct 2025 02:11:21 -0700 (PDT)
Message-ID: <0b610239-6e90-464a-bf01-5332de62719f@arm.com>
Date: Thu, 9 Oct 2025 10:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing
 PMSCR_EL1 in VHE
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, joey.gouly@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
 <aOVckTSJET5ORY1n@linux.dev> <861pndzn4w.wl-maz@kernel.org>
 <aOasxgCMG0yS4t43@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aOasxgCMG0yS4t43@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_021125_744609_0A7D2FB8 
X-CRM114-Status: GOOD (  16.56  )
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

On 08/10/2025 19:26, Oliver Upton wrote:
> On Wed, Oct 08, 2025 at 11:46:55AM +0100, Marc Zyngier wrote:
>> On Tue, 07 Oct 2025 19:31:45 +0100,
>> Oliver Upton <oliver.upton@linux.dev> wrote:
>>>
>>> Hi Mukesh,
>>>
>>> I find it a bit odd to refer to cpu_has_spe() in the shortlog, which
>>> doesn't exist prior to this patch.
>>>
>>> On Tue, Oct 07, 2025 at 11:53:56PM +0530, Mukesh Ojha wrote:
>>>> commit efad60e46057 ("KVM: arm64: Initialize PMSCR_EL1 when in VHE")
>>>> initializes PMSCR_EL1 to 0 which is making the boot up stuck when KVM
>>>> runs in VHE mode and reverting the change is fixing the issue.
>>>>
>>>> [    2.967447] RPC: Registered tcp NFSv4.1 backchannel transport module.
>>>> [    2.974061] PCI: CLS 0 bytes, default 64
>>>> [    2.978171] Unpacking initramfs...
>>>> [    2.982889] kvm [1]: nv: 568 coarse grained trap handlers
>>>> [    2.988573] kvm [1]: IPA Size Limit: 40 bits
>>>>
>>>> Lets guard the change with cpu_has_spe() check so that it only affects
>>>> the cpu which has SPE feature supported.
>>>
>>> This could benefit from being spelled out a bit more. In both cases we
>>> check for the presence of FEAT_SPE, however I believe the issue you
>>> observe is EL3 hasn't delegated ownership of the Profiling Buffer to
>>> Non-secure nor does it reinject an UNDEF in response to the sysreg trap.
>>>
>>> I agree that the change is correct but the rationale needs to be clear.
>>
>> To me, this smells a lot more like some sort of papering over a
>> firmware bug. Why isn't SPE available the first place?
> 
> While I agree this points the finger at a half-assed EL3, the
> architecture explicitly allows this sort of crap and we cope with the
> accessibility of SPE in almost every other case.

One of the reasons behind this control is to work around errata, where
the higher EL could prevent the OS from using a broken implementation.
Also, for KVM could use the EL2 controls to disable SPE for Guest.

Suzuki

> 
> We should at least be consistent in how we handle an inaccessible SPE.
> 
> Thanks,
> Oliver


