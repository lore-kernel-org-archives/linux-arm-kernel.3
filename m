Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECBDC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 17:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdaEm1VNGTVs7e8vROCN0lC4A4+/l+BdkvlB4cJdMRM=; b=YuufUzqgyiL73NeqeY7vEY8LE4
	jWqu3scN1Z7TpwhDsrV80mHL9Vg+jD3WzKUaOgUQ+HbbWscoQMh53HkK/dROS6mudpzXoxlAevChz
	1Dis9haQaBqIO8GKAECK5WAx3RVbUoVqZdBQ3dVVYWZiqf2InCZA+kwiNMVyOnptDGVCetu9xmOZ1
	O+fw+bVfdNYJhxnoP29PrYu8f0/lRrOZg1ZXUfHLjDvC9tU2JPMaI/c512/C0EjK21JIow2OFVeix
	j6+CIyJGNgCO14+DQSw4tuCVDmp71pm1KITJkUNoVoRRvRTQ7f4NuuxCXnen5GFj6jA4cgobd486b
	V0jCrq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPxu-000000099La-1UCk;
	Wed, 12 Mar 2025 17:33:58 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsPwE-000000099Dj-3NqJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 17:32:16 +0000
Date: Wed, 12 Mar 2025 10:32:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741800732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SdaEm1VNGTVs7e8vROCN0lC4A4+/l+BdkvlB4cJdMRM=;
	b=vXDF0426B5OZljtJCJNvlYdWu08s1ZbpovJJYcgUb07F0RA1TGjYRncGuVg7BWpEEyxA5e
	R2OpLHpeoM8w4dUA9uveEie1VFlSCfaIJcejGMODufGunQU9JLK5NI8iVIQxAlGhNvihC6
	iKdeT9RNrMqqWa6L1IL5nnubsLGDELM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sebastian Ott <sebott@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Writable TGRAN*_2
Message-ID: <Z9HE92ZlNlJbHJBB@linux.dev>
References: <20250306184013.30008-1-sebott@redhat.com>
 <Z9HCQ40LxShzL4nj@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9HCQ40LxShzL4nj@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_103215_058173_B78DBDEB 
X-CRM114-Status: GOOD (  24.31  )
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

On Wed, Mar 12, 2025 at 10:20:03AM -0700, Oliver Upton wrote:
> Hi Sebastian,
> 
> On Thu, Mar 06, 2025 at 07:40:13PM +0100, Sebastian Ott wrote:
> > Allow userspace to write the safe (NI) value for ID_AA64MMFR0_EL1.TGRAN*_2.
> > Disallow to change these fields for NV since kvm provides a sanitized view
> > for them based on the PAGE_SIZE.
> > Also add these bits to the set_id_regs selftest.
> > 
> > Signed-off-by: Sebastian Ott <sebott@redhat.com>
> 
> I can't tell what you've based this patch on, it certainly doesn't apply
> on a 6.14 rc. Consider telling git to include the base commit next time
> you generate a patch.

/me finishes a cup of coffee

The conflict is obviously with 9d6745572899 ("KVM: arm64: Hide
ID_AA64MMFR2_EL1.NV from guest and userspace"), which is in
kvmarm/next...

> > ---
> >  arch/arm64/kvm/sys_regs.c                     | 21 +++++++++++++++----
> >  .../testing/selftests/kvm/arm64/set_id_regs.c |  3 +++
> >  2 files changed, 20 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 14faf213d483..0730ed8314d0 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1948,6 +1948,21 @@ static int set_id_aa64pfr1_el1(struct kvm_vcpu *vcpu,
> >  	return set_id_reg(vcpu, rd, user_val);
> >  }
> >  
> > +static int set_id_aa64mmfr0_el1(struct kvm_vcpu *vcpu,
> > +				const struct sys_reg_desc *rd, u64 user_val)
> > +{
> > +	u64 sanitized_val = kvm_read_sanitised_id_reg(vcpu, rd);
> > +	u64 tgran2_mask = ID_AA64MMFR0_EL1_TGRAN4_2_MASK |
> > +			  ID_AA64MMFR0_EL1_TGRAN16_2_MASK |
> > +			  ID_AA64MMFR0_EL1_TGRAN64_2_MASK;
> > +
> > +	if (vcpu_has_nv(vcpu) &&
> > +	    ((sanitized_val & tgran2_mask) != (user_val & tgran2_mask)))
> > +		return -EINVAL;
> > +
> > +	return set_id_reg(vcpu, rd, user_val);
> > +}
> > +
> >  static int set_id_aa64mmfr2_el1(struct kvm_vcpu *vcpu,
> >  				const struct sys_reg_desc *rd, u64 user_val)
> >  {
> > @@ -2787,10 +2802,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
> >  	ID_UNALLOCATED(6,7),
> >  
> >  	/* CRm=7 */
> > -	ID_WRITABLE(ID_AA64MMFR0_EL1, ~(ID_AA64MMFR0_EL1_RES0 |
> > -					ID_AA64MMFR0_EL1_TGRAN4_2 |
> > -					ID_AA64MMFR0_EL1_TGRAN64_2 |
> > -					ID_AA64MMFR0_EL1_TGRAN16_2 |
> > +	ID_FILTERED(ID_AA64MMFR0_EL1, id_aa64mmfr0_el1,
> > +				      ~(ID_AA64MMFR0_EL1_RES0 |
> >  					ID_AA64MMFR0_EL1_ASIDBITS)),
> >  	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
> >  					ID_AA64MMFR1_EL1_HCX |
> > diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> > index 1d65f4a09e6f..322b9d3b0125 100644
> > --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> > +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> > @@ -146,6 +146,9 @@ static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
> >  static const struct reg_ftr_bits ftr_id_aa64mmfr0_el1[] = {
> >  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, ECV, 0),
> >  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, EXS, 0),
> > +	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN4_2, 1),
> > +	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN64_2, 1),
> > +	REG_FTR_BITS(FTR_EXACT, ID_AA64MMFR0_EL1, TGRAN16_2, 1),
> >  	S_REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN4, 0),
> >  	S_REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN64, 0),
> >  	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, TGRAN16, 0),
> 
> Please do selftests changes in a separate patch.
> 
> Don't worry about respinning, I'll fix this up and queue it in a moment.
> 
> Thanks,
> Oliver
> 

