Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2190CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 05:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZA27BTaDBEKi8r/WSFiJ0hysZrsoBQk8soZX6m2DKXU=; b=mev61DAsT8wjrJAvhb3m66S+ZH
	CSrjOJONbIGeplnhZKtnBYeeQUwlJxdfdmCHwx11mgUwuBxkWqIaa/sGx37q6hNHqfbu+gOXtSaCD
	FpfAfgb0VUBlpu1ajCq/rOH5XCNBiHeBeVLXwS8Fz6XtBr81SrRQ+eztlJ1Xo1V2cg8G6nfdkCiFH
	XbuGoVEFnFivX+N4RPlJlisvAtI8Ax+0MuN9/QA/FyTAsS/m0gFOwUej9lXiwiKBVetaXo4znTGeQ
	UIz1+af6xUw8p3VzwADtULgxUBZ3jpMMBiAyjsHF+76cRNwKOxUevZ0cIryuptd6O0XXgfEMz7kl5
	de9Uk3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNDL-000000006vv-1jtY;
	Fri, 05 Jun 2026 05:35:27 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVNDJ-000000006vI-1l3n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 05:35:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8422c327755so838423b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 22:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780637724; x=1781242524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA27BTaDBEKi8r/WSFiJ0hysZrsoBQk8soZX6m2DKXU=;
        b=Fv97NNnHwOd97IQyldFPzg46urF8uN0iZmjzjL7N2qteM5sbpiAngKdspRls03HrJS
         5jPW/cBOeVuw6Y7AzxFX6B2nvAIgxlCoPQYpiaEUDYh12hj0E+FGo4vC4cUGJzTcuFef
         LRHvrR58euKeVL96pgVT82I0fGttFk8o7471ZZOaZy9fJbrOa/VR0fnWrEu4iv2uHuIm
         liSnJSR88Osqv8w9Ia132mCcO2bey0A/D8P4WFQzZt5YOhVVPbwb8Fst3oJS4uVtK7/4
         rAWzucn/fFNbd7HdLi05F0NT8gNaxNlMWbp2PIdRH2jFq0jXJHpa3AJvryRNozsGe9Vp
         TQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780637724; x=1781242524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZA27BTaDBEKi8r/WSFiJ0hysZrsoBQk8soZX6m2DKXU=;
        b=dnoflt+2Lzi8hxI0LEncCxaz1QBlCyPR1QUKY+I+GeO9ODy6n2j49vijldscRCzFbS
         5vxW8LxxbuGPgq7xVIwh6fMQI/zyZO3kbXO4f2dPR61KawNhcehNY9Nfjm37VTFC3N3W
         QTarNlg17mTrRhcLeBdYPnAbN/AqddcXJzhuSroUZsIn8bikGycz/lNfNCmSmahiPrFb
         Zl243KdpiHJTmnz/2JdW8oU+81jELYxQwoYN6W+Fz7WUhF1ThP2rzn0V495cphDveIR8
         LIQ5QuachGsJ/bgng42hMd6xVKqez1WdXDCajV+zoBXCOqR1HWfWSCOsXmgvE3p7s0lR
         ktcw==
X-Forwarded-Encrypted: i=1; AFNElJ8nw+pSUusHaAEGyTxxmPwf3nBIerbDwbLURuNN6TJh7+dnMLzyDrpflayhwnnrot6w8h9//JN6tXLe8yYIaqvA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3QESd5UXKvu9T9HIlY+yRB9nrx77APZ7fsHhs6A2sM47DIpWk
	82rlQ/vpEh3MffPJ99AwEficJsBYsgsHjNlX516byHZtZaYa7mucCDx1
X-Gm-Gg: Acq92OEFuTLGLdMJvNvpSx6DgbL2gyaAdgfHRDsMWBxb7KT4A+oouLwgNKK0CLRQbwE
	geEZRRq3/IQMYrJM9yCn/YgXi4CXBPmgbO01UJe7uyqt969mVhCdBI50LiHWp5g+/dutEnGO+XZ
	ZhxzK/vnswpxeIFgbN4vv4GC9G4pBH3GuIJc+2XVjTB2+h5GThAqLUkQajuZgzzvSxb8ThN6Zvz
	4eoL2EgRk800q7TQ7gZzM7ATuqPcC6kU+ubhhdQRbhid121CtqTM1muH/MYiEB7BgxvbPOnm1Oc
	yZGMbi98ImvY8SCqQKM8/EcBEYtqMQ27xY4Elbv/YH/yxHK/PMqvr0YER/DkyksF5MywXeDaUI7
	L1kRKulV+J5E/mjEe/7Kte2hl5hKxwgaQDbA+2PMlEnJC6p+/Q+xrwGM/3f+41ZTwHYCeHdlkA3
	/FMDBiR3XwQR5ExKex5dd9mzjsgpzXps2ic4H1DiCuRyKQqZeRrskZpg==
X-Received: by 2002:a05:6a00:4512:b0:842:3be7:4d51 with SMTP id d2e1a72fcca58-842b0efa1damr1778931b3a.15.1780637724503;
        Thu, 04 Jun 2026 22:35:24 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288217bsm9336558b3a.37.2026.06.04.22.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:35:23 -0700 (PDT)
Date: Fri, 5 Jun 2026 14:35:20 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, christoffer.dall@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: Reallocate the nested_mmus array under the
 mmu_lock
Message-ID: <aiJgGBv3OCPNJJPc@v4bel>
References: <aiHEKOeZMVwsRlvP@v4bel>
 <aiH7xKnprU9bUap5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiH7xKnprU9bUap5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_223525_466668_A2E867B1 
X-CRM114-Status: GOOD (  30.65  )
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

On Thu, Jun 04, 2026 at 03:27:16PM -0700, Oliver Upton wrote:
> Hi,
> 
> The shortlog is very confusing, since "allocate behind $LOCK" is usually
> something alarming. Maybe instead:
> 
>   KVM: arm64: Reassign nested_mmus array behind mmu_lock

heh, that's confusing indeed. I'll change it that way.

> 
> On Fri, Jun 05, 2026 at 03:30:00AM +0900, Hyunwoo Kim wrote:
> > Code that walks kvm->arch.nested_mmus[] holds kvm->mmu_lock. By contrast,
> > kvm_vcpu_init_nested() reallocates the array and frees the old buffer while
> > holding only kvm->arch.config_lock, so a walker can reference the freed
> > array.
> 
> It wouldn't hurt to share slightly more information here. Are you
> dealing with a concurrent MMU notifier?

Yes. The MMU notifier path also walks nested_mmus[] under mmu_lock.
kvm_vcpu_init_nested() holds only config_lock, so if a notifier fires
during vCPU init, it races with the array realloc and free.

Here's the reworked changelog. Should I send v2?

  kvm->arch.nested_mmus[] is walked under kvm->mmu_lock, including from the
  MMU notifier path (kvm_unmap_gfn_range() -> kvm_nested_s2_unmap()), which
  can run at any time. kvm_vcpu_init_nested() reallocates the array and frees
  the old buffer while holding only kvm->arch.config_lock, so such a walker
  can reference the freed array.

  Allocate the new array outside of mmu_lock, as the allocation can sleep.
  Under the lock, copy the existing entries, fix up the back pointers and
  reassign the array. Free the old buffer after dropping the lock, as
  kvfree() can sleep as well.

> 
> > Allocate the new array outside the lock, as the allocation can sleep, and
> > do only the copy and the pointer swap under the mmu_lock. After the swap no
> > walker can reach the old buffer, so free it once the lock has been
> > released.
> > 
> > Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> 
> The diff itself LGTM
> 
> Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks for the review.

> 
> Thanks,
> Oliver
> 
> > ---
> >  arch/arm64/kvm/nested.c | 33 ++++++++++++++++++++-------------
> >  1 file changed, 20 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 38f672e940878..6f7bc9a9992e0 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -89,21 +89,28 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
> >  	 * again, and there is no reason to affect the whole VM for this.
> >  	 */
> >  	num_mmus = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
> > -	tmp = kvrealloc(kvm->arch.nested_mmus,
> > -			size_mul(sizeof(*kvm->arch.nested_mmus), num_mmus),
> > -			GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> > -	if (!tmp)
> > -		return -ENOMEM;
> >  
> > -	swap(kvm->arch.nested_mmus, tmp);
> > +	if (num_mmus > kvm->arch.nested_mmus_size) {
> > +		tmp = kvcalloc(num_mmus, sizeof(*tmp), GFP_KERNEL_ACCOUNT);
> > +		if (!tmp)
> > +			return -ENOMEM;
> >  
> > -	/*
> > -	 * If we went through a realocation, adjust the MMU back-pointers in
> > -	 * the previously initialised kvm_pgtable structures.
> > -	 */
> > -	if (kvm->arch.nested_mmus != tmp)
> > -		for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
> > -			kvm->arch.nested_mmus[i].pgt->mmu = &kvm->arch.nested_mmus[i];
> > +		write_lock(&kvm->mmu_lock);
> > +
> > +		if (kvm->arch.nested_mmus_size) {
> > +			memcpy(tmp, kvm->arch.nested_mmus,
> > +			       size_mul(sizeof(*tmp), kvm->arch.nested_mmus_size));
> > +
> > +			for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
> > +				tmp[i].pgt->mmu = &tmp[i];
> > +		}
> > +
> > +		swap(kvm->arch.nested_mmus, tmp);
> > +
> > +		write_unlock(&kvm->mmu_lock);
> > +
> > +		kvfree(tmp);
> > +	}
> >  
> >  	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
> >  		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
> > -- 
> > 2.43.0
> > 


Best regards,
Hyunwoo Kim

