Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040FDD4116C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybLyEgE8LedCLmHHaGzE9hULxrpgbxeYDu9PCiZ1E+g=; b=qRyrcidd6Wmqtmtq3ZvLm6t0xi
	SFTdb3Cd1pgxY6do76DcsaRIu5P+3CBNvZTkps6/bTJPeuC7h0/smKS/rq8w3dpUWpNhm3/eyoPXx
	Hd9chLiDBZsK9EpKedGazQEizZthKzGqCP7s5G5N5Bt174jBmbAT9R8Ls9y3dTi2Ee/9fGhFZRkJI
	dVTMywQE1WFnKeoTgu9F7i1lLFeRzd8t7aE7KertBicnOTXmNU6Ni163oQDrUqE9ZPj3OfxGhz6bo
	K60Z/sMrUIstlvziiNdAGnl76UMI92r+z5S6RzJRhL5eHeMFFDugbXVyug61mDQRZTqKJ1IzIu5Sl
	myNf8cNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLJW-0000000CCe6-1APp;
	Thu, 15 Jan 2026 11:14:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLJQ-0000000CCcf-238x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:14:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45626FEC;
	Thu, 15 Jan 2026 03:14:36 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 217083F694;
	Thu, 15 Jan 2026 03:14:37 -0800 (PST)
Message-ID: <585ef596-47bf-462f-92da-4a322178115c@arm.com>
Date: Thu, 15 Jan 2026 11:14:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/47] KVM: arm64: Force guest EL1 to use user-space's
 partid configuration
To: Marc Zyngier <maz@kernel.org>
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
 will@kernel.org, corbet@lwn.net, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-13-ben.horgan@arm.com> <86pl7cl7p7.wl-maz@kernel.org>
 <92041294-b332-4b8b-aeed-d8bbad1a7289@arm.com> <86ldhzkzzb.wl-maz@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <86ldhzkzzb.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_031448_613252_5A0CE18E 
X-CRM114-Status: GOOD (  30.00  )
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

Hi Marc,

On 1/15/26 09:05, Marc Zyngier wrote:
> On Wed, 14 Jan 2026 14:50:22 +0000,
> Ben Horgan <ben.horgan@arm.com> wrote:
>>
>> Hi Marc,
>>
>> On 1/14/26 12:06, Marc Zyngier wrote:
>>> On Mon, 12 Jan 2026 16:58:39 +0000,
>>> Ben Horgan <ben.horgan@arm.com> wrote:
>>>>
>>>> From: James Morse <james.morse@arm.com>
>>>>
>>>> While we trap the guest's attempts to read/write the MPAM control
>>>> registers, the hardware continues to use them. Guest-EL0 uses KVM's
>>>> user-space's configuration, as the value is left in the register, and
>>>> guest-EL1 uses either the host kernel's configuration, or in the case of
>>>> VHE, the UNKNOWN reset value of MPAM1_EL1.
>>>>
>>>> We want to force the guest-EL1 to use KVM's user-space's MPAM
>>>> configuration. On nVHE rely on MPAM0_EL1 and MPAM1_EL1 always being
>>>> programmed the same and on VHE copy MPAM0_EL1 into the guest's
>>>> MPAM1_EL1. There is no need to restore as this is out of context once TGE
>>>> is set.
>>>>
>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>>> ---
>>>> Changes since rfc:
>>>> Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
>>>> Defer EL2 handling until next patch
>>>>
>>>> Changes since v2:
>>>> Use mask (Oliver)
>>>> ---
>>>>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
>>>> index f28c6cf4fe1b..9fb8e6628611 100644
>>>> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
>>>> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
>>>> @@ -183,6 +183,18 @@ void sysreg_restore_guest_state_vhe(struct kvm_cpu_context *ctxt)
>>>>  }
>>>>  NOKPROBE_SYMBOL(sysreg_restore_guest_state_vhe);
>>>>  
>>>> +/*
>>>> + * The _EL0 value was written by the host's context switch and belongs to the
>>>> + * VMM. Copy this into the guest's _EL1 register.
>>>> + */
>>>> +static inline void __mpam_guest_load(void)
>>>> +{
>>>> +	u64 mask = MPAM0_EL1_PARTID_D | MPAM0_EL1_PARTID_I | MPAM0_EL1_PMG_D | MPAM0_EL1_PMG_I;
>>>> +
>>>> +	if (system_supports_mpam())
>>>> +		write_sysreg_el1(read_sysreg_s(SYS_MPAM0_EL1) & mask, SYS_MPAM1);
>>>> +}
>>>> +
>>>>  /**
>>>>   * __vcpu_load_switch_sysregs - Load guest system registers to the physical CPU
>>>>   *
>>>> @@ -222,6 +234,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
>>>>  	 */
>>>>  	__sysreg32_restore_state(vcpu);
>>>>  	__sysreg_restore_user_state(guest_ctxt);
>>>> +	__mpam_guest_load();
>>>
>>> What's the rationale for doing this independently of rest of the MPAM
>>> stuff in __activate_traps_mpam()?
>>
>> The __activate_traps_mpam() is relevant even for nvhe but
>> __mpam_guest_load() is only need in vhe as otherwise we can rely on
>> MPAM1_EL1 and MPAM0_EL0 having the same partid/pmg configuration
> 
> It is completely unclear to me what enforces this. Please point me to
> the code that does that.

The new MPAM arch code always configures kernel space MPAM configuration
in tandem, same value to MPAM0_EL1 and MPAM1_EL1 (will access MPAM2_EL2
in vhe).

For the cpu part see
PATCH v3 07 arm64: mpam: Re-initialise MPAM regs when CPU comes online
and for context switching part see
PATCH v3 06 arm64: mpam: Context switch the MPAM registers

> 
>> (although this MPAM policy will likely become configurable sometime down
>> the line).
> 
> Or not. the VM only exists as an extension of userspace, and I don't
> see on what grounds it should get its own MPAM configuration.

There are no plans to give the VM it's own MPAM configuration. The
intent of this patch is to give all the code running in the VM, whether
or not it is at EL0 or EL1, uses the MPAM partid/pmg configuration of
the userspace VMM that is running it. What I was alluding to here is
that if a future host MPAM policy allows the partid/pmg to differ for
the kernel and userspace then we won't be able rely on the EL1
configuration matching EL0 in the nvhe case and so would have to copy
the host EL0 configuration to EL1 (and add a restore).

> 
>> Besides that it just makes the naming less exact.
> 
> I don't care about the naming. I care about how the configuration flow
> is organised. And so far, this seems extremely messy.
> 
> Can you please document what gets configured when and in which mode?

The goal is that all times the VM runs with the same MPAM partid/pmg
configuration
as the userspace vmm running it.

In VHE:

Host kernel configuration is in MPAM2_EL2
Host userspace configuration is in MPAM0_EL1

Guest kernel configuration needs to be in MPAM1_EL1 and so we copy it
there from MPAM0_EL1 when
switching to the guest. On switching back to the host we can just leave
it there as the host doesn't use it.
Guest userspace configuration is in MPAM0_EL1, just keep that unchanged.

In nVHE:
Host kernel configuration is in MPAM1_EL1
Host userspace configuration is in MPAM0_EL1

Once again, guest userspace configuration is in MPAM0_EL1, just keep
that unchanged. As host policy ensures MPAM0_EL1 == MPAM1_EL1 for
pmg/partid we rely on this to skip changing MPAM1_EL1 on guest entry and
to skip the restore on guest exit.

I hope this makes the intent clearer.

Would you prefer to decouple the kvm handling of the MPAM configuration
from the host policy? If so, I expect the MPAM handling can be done
together in __activate_traps_mpam().

Thoughts?

Thanks,

Ben


