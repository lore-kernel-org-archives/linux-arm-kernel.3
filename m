Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DA8C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0eO5p/+72zQTpxbfV2SGsUBVNXRFtxhqKdi0S5oNCk=; b=fEItzXtZkyiB7xv0iOhy+9SYHW
	Y1ArcllVqTiKbyuQHFuooEvqDMjsTCu1Zi+/cI243HykOyYqj2dHJgRQEh8ix2pTRbRHbfpjP+fSj
	aUPj4ash0Wrzp6bOFg+94vd+JWTDnSrU7BrLMjXX9mHVPjxgQijzjL63v1/QmabTj5jMfUjDbkLh7
	BQuel6cCWsPB/TkeCB9gZN2ARRLiadMFggAfcerSz0I7+HLe4/uFMQIMkQwsA9pKxrxUnWEHH7Lvx
	fPzmfxFPfmMDsf0LN2Dik3G60jDSDOQF54g8K/Xlk1nxHn7B0gZ4PELohZHSOWJ8/VCd34ZEtktIP
	cbYH/lrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz98-0000000Es0n-3e6Q;
	Wed, 15 Jul 2026 12:55:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz97-0000000Es04-1FQN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:55:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso32486055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784120127; x=1784724927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0eO5p/+72zQTpxbfV2SGsUBVNXRFtxhqKdi0S5oNCk=;
        b=amAGMp+AhVHZueTOxwR+0feyBWDVlDg6xHecwE2I7b+tkq0BKFcJPeOpPgESRvJW0P
         WAkL4a8bOHLugCw0pwGvWRSoYJDYhwvfJL0EoZxbB8uH8m5O3KKZkJVFEmvCvoeh3ywG
         Se2pcWiID1Q6owlx/WyVU8mkTl+cUvLygJjRS0V1nq47G+UuEBy5W5RN2J0IHcQBZJNM
         wHaC4+79m4bXFNDo81oMSLWlbx0cROt6QkzCDW3tSV1B6F1E3nQl8+oKFWoQL7+Wf9zR
         uUQ2JdBCE6JDJRGKfu1WE0hOpJNUwJxXclDpLEO9CZ8i6Ta16eAH0NZZryrHlZoOkgXK
         BD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120127; x=1784724927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0eO5p/+72zQTpxbfV2SGsUBVNXRFtxhqKdi0S5oNCk=;
        b=SovdTN5TvGBH32p+xrAlOAcmyelp2Sg3HrdSHPBbX2z9sao2AmZMD8G9NNQw0HAfvj
         X7vcUWO/MPfiRzKveIhpmdS+JNyesx90kclZQZufr59QyGe2iT6gyzcP6hBfRQ0rYB/0
         uxNAaED5hbZWXKFZxrr6H+eD4v0PWWMsB74eY+k78rlZ3gCabTWS7qNzeGXT3Zvjq2kH
         WwtRYrUZJbKpoRUzs2+lTeD629iCGU4dFkgKl55khwpSCLEKtnNvaK4+KaFthU2no34G
         3krON9Uw8G0ohG3eNZDoRC9EgnYB9LcAezSVT0Sg1nJiUlmGeWaE+JkkVfKFGW28zF/P
         DTpg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt5KNUsZpp53AvBFbutclKqSR9+MhDSR34NBJiJfVZq/P5FK+GnkBizCJYyeL1279akxi2KaIFVL9pdwxC2aqc@lists.infradead.org
X-Gm-Message-State: AOJu0YxDte268ddrZlrVKcc4Ye4HDNRPdniaBgfZxZ1aYTm47QHxncX3
	5cyAWK9MEFv9rbqsPgO0LgMJcs2Q+bkLRlDh/uiTm+O6KSd8i4+tjM9fIN7LzDQctQ==
X-Gm-Gg: AfdE7cltJxyvdw8QOrQuMMk4VF9PmIfBwPGNa1ZE1amNxa6GtgWme9TITyLm4YmdKH/
	mC0qj+lVIrnkcsKAPnCCgckoNXMLpjP8yw86nCGg1B1f+EkSZijQtofU54PmKl30FUz8vXU6c1T
	A4wIGSfM/4Bmxs4RlPca4JRPdhFY9I/fDIbHcZwQgt2pHFXzvHwjoHWTAwbFRFXp4KD0asmQeyz
	PnDKh38wMiEJT0182HqgKoq9P5Lkv8ErVjGZRm63uuuMYHCMp+X6j5lRtLBX+MtX00LPkNRS7iP
	D4BHV7XQLGiQj48uGZbdC5ZCRTpa6Wufrl9b84T3cLVMFVvLrhm0HwncLHOXkDuIjNDTTrm4h0a
	3wmGGy4VafIAeBftY8ewrBxkUxbWDCURA73SRVYm2wLPRGAhoIXJXebkZ3HZRdKStXYqJpTZoGN
	O4RttEXEX6XUJZkVsX34Ps0dK46tQE8Dk3WeH0lefarVbXL/ZODkA=
X-Received: by 2002:a05:600c:524c:b0:494:df:8895 with SMTP id 5b1f17b1804b1-49538a0251emr73180985e9.24.1784120127010;
        Wed, 15 Jul 2026 05:55:27 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm17168794f8f.22.2026.07.15.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:55:26 -0700 (PDT)
Date: Wed, 15 Jul 2026 13:55:23 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com
Subject: Re: [PATCH v2 15/18] KVM: arm64: Alloc pkvm_hyp_vm using pKVM heap
 allocator
Message-ID: <aleDOyiP5E8TcoZg@google.com>
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-16-vdonnefort@google.com>
 <CA+EHjTzNMCMAt=VDnCuR2+Pfz9Qh5HmbEm6tdjpdcPBO+UchEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzNMCMAt=VDnCuR2+Pfz9Qh5HmbEm6tdjpdcPBO+UchEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055529_356302_9140772F 
X-CRM114-Status: GOOD (  21.65  )
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

On Wed, Jul 15, 2026 at 01:33:00PM +0100, Fuad Tabba wrote:
> On Mon, 6 Jul 2026 at 18:54, 'Vincent Donnefort' via kernel-team
> <kernel-team@android.com> wrote:
> 
> ...
> 
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -191,8 +191,8 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
> >   */
> >  static int __pkvm_create_hyp_vm(struct kvm *kvm)
> >  {
> > -       size_t pgd_sz, hyp_vm_sz;
> > -       void *pgd, *hyp_vm;
> > +       size_t pgd_sz;
> > +       void *pgd;
> >         int ret;
> >
> >         if (kvm->created_vcpus < 1)
> > @@ -209,28 +209,15 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
> >         if (!pgd)
> >                 return -ENOMEM;
> >
> > -       /* Allocate memory to donate to hyp for vm and vcpu pointers. */
> > -       hyp_vm_sz = PAGE_ALIGN(size_add(PKVM_HYP_VM_SIZE,
> > -                                       size_mul(sizeof(void *),
> > -                                                kvm->created_vcpus)));
> > -       hyp_vm = alloc_pages_exact(hyp_vm_sz, GFP_KERNEL_ACCOUNT);
> > -       if (!hyp_vm) {
> > -               ret = -ENOMEM;
> > -               goto free_pgd;
> > -       }
> > -
> > -       /* Donate the VM memory to hyp and let hyp initialize it. */
> > -       ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
> > +       ret = pkvm_call_hyp_req(__pkvm_init_vm, kvm, pgd);
> 
> Sashiko might be right on the memcg point: hyp_vm used to be
> GFP_KERNEL_ACCOUNT and now comes from the heap unaccounted, while pgd
> next to it is still accounted, so it's inconsistent.

Yep that is correct but there is no way around that:

 * Donated memory can now be shared be shared by several VM (or other parts of
   the hypervisor)

 * Donated memory is also not reclaimed until the shrinker fires.

So we don't really have a way to account for that meta-data anymore.

(I should at least mention this in the commit message)

> 
> If we do want to fix it, would it go in pkvm_hyp_topup() to cover all
> consumers rather than here?
> 
> Cheers,
> /fuad

