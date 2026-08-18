Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D6FC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeFyeN+d7Fl6w7s7F00mypvhcoz1q5bXaJcc27nMLck=; b=Ck1qOgBS8NFp+GokuoAp9CBKZp
	SlaZePuh+bDEwkeEg6XzbSGkidFp/ltNKHeWEb2EG+xoIMuMuhKb+m2uCfVWCAvkgD2gN/dH4Xnoz
	hpCCIE+GwF8XXNb5NIykmsZpMVWo80w6MMfuzEpKTUJO7rFTRusjfc5o38YyrcLzfShxpO0gs5A5B
	5obaZP2NXF7lG/sUDfG80ay/4T0uu2z33vOFT7nYfj1fMwbb5vtim411kfz/D15nPaRn6wKIfPOvO
	LV/Ydwq4QihKmstQlAKiIVipEjKO2iiVTNoFNDlGNzUUvt0h7a8wyAh61SzCv0j//87KYeKUjufZ7
	cZ+r/jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGNQ-00000007ep8-09hR;
	Tue, 18 Aug 2026 09:45:00 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGN2-00000007eXj-2UDy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:44:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-848643382fcso4640107b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787046275; cv=none;
        d=google.com; s=arc-20260327;
        b=mcYZLETEJd+2dAbSbFuNVLh+uVrZo4S9BEhI8v+S1KcWJ+wPZA0W6nEr43STjKI29z
         uY/PxTq6b7slgPVTXC2hu6NQD0ugwQq3qz+iYLdgqTHqOVQOZY4Xa1O2LmQPYLXcjnIH
         1Xu8n/hUH64nmKqMvCqjHp/qaqwSWxYgtTuwW/0Lt3ScISkX+z3C+X7TKVq2MXYaQ4NG
         aoGE/ddGvzcXEDwlzGtBnfQ2nC0/TY1h7YOXYUczLi93xU776H0n3H3/QA/oHIMRiHJ7
         l3CdPZHHaqD/vBw46oa4SKoRqHqDaWNH3QHt7yshNiH/oARXAWOjFkEDnQDW1XDPBy63
         cp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BeFyeN+d7Fl6w7s7F00mypvhcoz1q5bXaJcc27nMLck=;
        fh=JMa54GftFD+rDg6SNxjU0cTkbeaP3U36ZF7qehJSmt0=;
        b=nNaYzm+8LlIVksLoYmERHE/E7CTqqu+9ljYZ0aJIvra8k6+VGK4BEHWx60EesgBAdz
         Vf7HIK4L2ZN25wbHZyGHmpmc1IjW0n13p2wjx07QcrZhRaLViXpOBCzrQnO1zfsNtZVj
         gewEk6anDtl3KBEgB5svI+01ZFxPkAtef8C5mTKIJC1R3WpsoK08MLV5B7ENsCfOJOVE
         j+lkNQy0qFzzntiRqimDUS4WXFddfmte9bDs2MOquVLNUxCwaz7Zd2e+A0CbsaDwXSwn
         6nMvv3eIDBsnLuHz8z0vSvUnls0M8VMdu7rbYicVj5JzOQJtzooEN8/MusP7dZUKZ7Ea
         mlBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787046275; x=1787651075; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeFyeN+d7Fl6w7s7F00mypvhcoz1q5bXaJcc27nMLck=;
        b=o8kYhktzLWSlYX8YX+0bZHxzRpvtXuPwCbMP/ZJw72vtZVivXSwEM2y9I02xTp2oxy
         qDpWEvmp0ym8SV1mNw+TVrrVrYEmufzZVOEs9hKtENdM5Gg9L+6TLReGWFtGw9/x5CNP
         d41Tr+Z+8a68hxEvQCOq/vSqj8tueH+EOFZD/mDZ8UyozwZkFMNN1hCohOMRDdPxaifm
         hPe+cVClnpLINhmtYepzhNHry1lqx8d3SUJnb1u3asCY+xaiDTR2On6kjyzRT4DVdqkh
         zxeGUQjunl0vtnOsmFonyODqs4XPaBPHrOmePFlsiRwzBAGQwi8Gq7A2NG04L6NE9cjp
         hhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046275; x=1787651075;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeFyeN+d7Fl6w7s7F00mypvhcoz1q5bXaJcc27nMLck=;
        b=Ud1KpNUIHULnFzBl2nXwPr5lk43Mi2pOSTuME9fqeoeLCnBeYYFbo14taGxOICG2cT
         PXdeM7Pn1j7v6rqN2o+UmzfWfTUa38YBemUxHsikG8pxe1oN3HbZOmlvlpRZiR3XQtcf
         /E83SKT8Q+dIprX9qZdaNCzWuQVtyFZDRvH3HHTuEhhMSnRfOg3XKGXzBplf1DtllzdB
         95fsppuVR+/GBq/7M3weQ56pe/+7IwvpPrYIQeKOqzImntrQ3NmnGZPX8mqsvUUlxNXp
         gzYyJhvPB76gCQHvFyHqv0Y0rMR0CY6eteYLNWTzxX6hWKe859/CBdSil1yWY3QSHfH4
         0j+g==
X-Forwarded-Encrypted: i=1; AHgh+RotmKScK+mWNr1iofPiSpjKxHgvELHV+nS90htzW58eCjcazpr4zMwKJktbHIYkBDyCB1x8z8wVwfIDnAKLU4yv@lists.infradead.org
X-Gm-Message-State: AOJu0YwXTAhWwj7j212N/JV6nvhd667ghLwIblITFICgSd2l2S85ztfL
	MJC7hex7OqeSArYXsEuwOWQDk1IX+I1TElwLj/iQuieH9eQe3jTT+y75TZuefvAcjPeEVsKtSBt
	Lvg7/WI+Py5vBxXT/uPJrYCjEzEMNDXr6ClFfXpaW
X-Gm-Gg: AR+sD12T71mxYRW23M9Z3aycgAlVemk3z1ONmHYvJf3LerBgULouNssBZX83uPCPwBb
	twzUGXqL6BE/5Ewuaq2IWOVAt3Eow4k1xgMUU9q8YtGlu0RPf17iz6Z7GZfPZDRT80fVtIgolVB
	i60Afq5xJXZ333tNBTqPznWMHdg+GiQlgn5KTggFy+VNsBXop5+tMvuhksA3jnv1AhcNfbI56T6
	tZ9fv+7NFKcFtP3mdM+c9LuGW7ABzIgL2Rns7Nqm0xuz/XPIab+PpR7VX6fw4qwaHc8aBvMH9/7
	h6g6SVrMDRi9K5fyDxqg+mim9GS3+7jFgSMOAdroHj8ziXuADwVCnFWLE5kyWTjQWzuMNcSl4Du
	PSt6mvMBExMmsKQY=
X-Received: by 2002:a05:6a21:3103:b0:3c1:fbf:1e2e with SMTP id
 adf61e73a8af0-3ccda9ad8e4mr10134494637.10.1787046274831; Tue, 18 Aug 2026
 02:44:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 02:44:33 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Aug 2026 02:44:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aoQZFtSd671ti4sr@yzhao56-desk.sh.intel.com>
References: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
 <20260818-gmem-no-return-page-v1-4-4f8d939efdbc@google.com> <aoQZFtSd671ti4sr@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Date: Tue, 18 Aug 2026 02:44:33 -0700
X-Gm-Features: AcwNN1U5ehd_NTGTo4zZtHEtfJhdWWWuVuXA16suZpoLtMBQBlqamb-zw5aEarA
Message-ID: <CAEvNRgG8gxZSmOrsENemNqbaZuDyqNXj35M4VyChA6HQ_ofYVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] KVM: guest_memfd: Stop returning struct page from PFN lookup
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_024436_646728_FA61F4E3 
X-CRM114-Status: GOOD (  10.94  )
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

Yan Zhao <yan.y.zhao@intel.com> writes:

> Hi Ackerley,
>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 6c941aaa10c63..e5d637a5ec558 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -1613,7 +1613,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>>  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>>  	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
>>  	unsigned long mmu_seq;
>> -	struct page *page;
> Just drop the page should be ok, since
>> +	struct page *page = NULL;
>>  	struct kvm *kvm = s2fd->vcpu->kvm;
>>  	void *memcache = NULL;
>>  	kvm_pfn_t pfn;
>> @@ -1641,7 +1641,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>>  	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
>>  	smp_rmb();
>>
>> -	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
>> +	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, NULL);
>>  	if (ret) {
>>  		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
>>  					      write_fault, exec_fault, false);
> here missed a hunk:
>  out_unlock:
> -       kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
>         kvm_fault_unlock(kvm);
>
> I will fully test this series tomorrow.

Makes sense. gmem_abort() is purely gmem and there's non-gmem path to
fill the page pointer in, so the above is correct.

I'll not be respinning again today, sorry about the flurry of emails!

