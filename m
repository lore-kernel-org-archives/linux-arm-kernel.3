Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6119BFA372F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2J3KCRTjh1RDhi0wNoJFugCnvneo3z/uttTCD4TA5E=; b=kgzAAW1NUntxWkdbTFC/VQ/SPc
	5SxL0j+3jWx8x+ktJ3LQZKrwIDZZ2NHETtODeQizJqtWYMm6NQu6H8CkoCEwd0KCInuGoMN1a7NDo
	KNzZn0Dx9edZBN+utaV7fJsT2dnFowDVOlnlvpm7nYWaftyLEnCrWlWSSUtOcun8fZAM1EWyLVNED
	iZPIdoLOvR186AIMQaXQEGL+I/ye9CfErfLQiQ2pIAg1Dk0lf8J6qxYiurN1/9l1NRHCgXO/zce4w
	eHfaw/TU+YWlhhLNeLfqV+810Abv4MBYwC2tZAbz4It559IkWPLBZ/MiiVJ+caTyRgWbQnDCg7bqq
	9W1J+3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdZQ-000000089mq-40Ei;
	Fri, 02 Jan 2026 11:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbdZO-000000089mB-12Ax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 11:43:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06138497;
	Fri,  2 Jan 2026 03:43:42 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B0813F63F;
	Fri,  2 Jan 2026 03:43:43 -0800 (PST)
Message-ID: <187ac0bf-cd7e-4fed-8236-9097c938ab8c@arm.com>
Date: Fri, 2 Jan 2026 11:43:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/45] KVM: arm64: Preserve host MPAM configuration
 when changing traps
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
 <20251219181147.3404071-6-ben.horgan@arm.com> <aUWvGjGyU7DUW8MI@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aUWvGjGyU7DUW8MI@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_034350_437111_71734FD9 
X-CRM114-Status: GOOD (  19.17  )
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

On 12/19/25 20:01, Oliver Upton wrote:
> Hi Ben,
> 
> On Fri, Dec 19, 2025 at 06:11:07PM +0000, Ben Horgan wrote:
>> When kvm enables or disables MPAM traps to EL2 it clears all other bits in
>> MPAM2_EL2.  Notably, it clears the partition ids (PARTIDs) and performance
>> monitoring groups (PMGs). Avoid changing these bits in anticipation of
>> adding support for MPAM in the kernel. Otherwise, on a VHE system with the
>> host running at EL2 where MPAM2_EL2 and MPAM1_EL1 access the same register,
>> any attempt to use MPAM to monitor or partition resources for kernel space
>> would be foiled by running a KVM guest. Additionally, MPAM2_EL2.EnMPAMSM is
>> always set to 0 which causes MPAMSM_EL1 to always trap. Keep EnMPAMSM set
>> to 1 when not in a guest so that the kernel can use MPAMSM_EL1.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  arch/arm64/kvm/hyp/include/hyp/switch.h | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> index c5d5e5b86eaf..63195275a8b8 100644
>> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
>> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> @@ -269,7 +269,8 @@ static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
>>  
>>  static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
>>  {
>> -	u64 r = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
>> +	u64 clr = MPAM2_EL2_EnMPAMSM;
>> +	u64 set = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
>>  
>>  	if (!system_supports_mpam())
>>  		return;
>> @@ -279,18 +280,21 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
>>  		write_sysreg_s(MPAMHCR_EL2_TRAP_MPAMIDR_EL1, SYS_MPAMHCR_EL2);
>>  	} else {
>>  		/* From v1.1 TIDR can trap MPAMIDR, set it unconditionally */
>> -		r |= MPAM2_EL2_TIDR;
>> +		set |= MPAM2_EL2_TIDR;
>>  	}
>>  
>> -	write_sysreg_s(r, SYS_MPAM2_EL2);
>> +	sysreg_clear_set_s(SYS_MPAM2_EL2, clr, set);
> 
> I'd recommend documenting that writes to MPAM1_EL1 are followed by an
> ISB. Otherwise it isn't obvious here where context synchronization is
> happening (if at all).

Ok, but why are you mentioning it here?

This is just updating the traps while ensuring the partid/pmg are
unchanged. The traps are only relevant once we change exception level
and for activation they are synchronized in __guest_enter() and the eret
when returning to userspace.

> 
> Thanks,
> Oliver

Thanks,

Ben


