Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AD2FA3730
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zd62XC9/EfX5WngL7XBUzvY5KFcBBz0+v2tQe/X4mv4=; b=rBD3bCT0QJYCdm7ZUo9hTRyDx0
	F8OfMEzorp01g6LQKkcjU9rmtS4WUfdj9M8R9NUxKRgCZevO4UmHmQNC0UZW5WIBg34YPNNB5XIKG
	+dm7pTKOJF4/ptEPbDzNGBW7YtuM0ksCD6AIkEq4Qny4IS/2WG9v+hriawjyLhesanGfo1Pr/AwhQ
	wVFdtNWdMdkCWjaVWWDalLc1vXbqeeaEinWR76BCX8Msz+Ig5XRH9FzWu24/Qg4LR/RMueXZ4fxSM
	HMSlSA8ZxTeGB1ZlhGeqnLswrHiwY1dhUMO24ir16yIY8chJ9xVnOLZm4g2wfKBztzrNP6pYu7xa0
	/eOB2Gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbddq-00000008A3F-3PQs;
	Fri, 02 Jan 2026 11:48:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbddn-00000008A2t-1lPe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:48:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3FAF497;
	Fri,  2 Jan 2026 03:48:14 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A2C63F63F;
	Fri,  2 Jan 2026 03:48:16 -0800 (PST)
Message-ID: <c3132e11-a4e5-4a74-96b5-4a253ff9e3e3@arm.com>
Date: Fri, 2 Jan 2026 11:48:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/45] KVM: arm64: Force guest EL1 to use user-space's
 partid configuration
To: Oliver Upton <oupton@kernel.org>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-14-ben.horgan@arm.com> <aUWxLp2GUk2_p58e@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aUWxLp2GUk2_p58e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_034823_522765_5ABF5721 
X-CRM114-Status: GOOD (  16.57  )
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

Hi Oliver,

On 12/19/25 20:10, Oliver Upton wrote:
> On Fri, Dec 19, 2025 at 06:11:15PM +0000, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> While we trap the guest's attempts to read/write the MPAM control
>> registers, the hardware continues to use them. Guest-EL0 uses KVM's
>> user-space's configuration, as the value is left in the register, and
>> guest-EL1 uses either the host kernel's configuration, or in the case of
>> VHE, the UNKNOWN reset value of MPAM1_EL1.
>>
>> We want to force the guest-EL1 to use KVM's user-space's MPAM
>> configuration. On nVHE rely on MPAM0_EL1 and MPAM1_EL1 always being
>> programmed the same and on VHE copy MPAM0_EL1 into the guest's
>> MPAM1_EL1. There is no need to restore as this is out of context once TGE
>> is set.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc:
>> Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
>> Defer EL2 handling until next patch
>> ---
>>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
>> index f28c6cf4fe1b..a2e8f6187675 100644
>> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
>> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
>> @@ -183,6 +183,16 @@ void sysreg_restore_guest_state_vhe(struct kvm_cpu_context *ctxt)
>>  }
>>  NOKPROBE_SYMBOL(sysreg_restore_guest_state_vhe);
>>  
>> +/*
>> + * The _EL0 value was written by the host's context switch and belongs to the
>> + * VMM. Copy this into the guest's _EL1 register.
>> + */
>> +static inline void __mpam_guest_load(void)
>> +{
>> +	if (system_supports_mpam())
>> +		write_sysreg_el1(read_sysreg_s(SYS_MPAM0_EL1), SYS_MPAM1);
> 
> nit: I'd prefer using a mask to extract the fields of interest, guarding
> against future architecture doing something silly with the RES0 fields
> of these registers.

Sure, I'll make this change.

> 
> Thanks,
> Oliver

Thanks,

Ben


