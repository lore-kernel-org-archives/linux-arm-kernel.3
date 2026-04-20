Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8488F5A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=; b=vFWRkOkXGDahfwcB7CaC9w0BWc
	9LD6jAUOF9YrTFjh8Hj/uKbT6W/tkBUyYlbFFG7ArO0+Em2jc+CJbthsoVQBJCYTBelULoR8G3sS1
	HRyTtDmOhRCG5dnLxW5oRX7KhWVjbtsD+scLaJNXZTNq9qtq7J9v995Xk+tAjT5CW/cWyQTR32B96
	Z+e9LMIT0TsOy35KrIjvhZeGM1lIUrxkQR5OkRE/VkkGZeq70hPG0nRD6EutOPxBRjc2o0F7uIssc
	vAroDzo0uy7vJnZ6eOoZcMH0npsDbymRgTf4P9bd3kObUG+a7ukAgz+nQV03KbsobLMS0DC0+q0QM
	kt+qhVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEv2o-00000007cOx-0WEL;
	Mon, 20 Apr 2026 20:16:34 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEv2m-00000007cNz-15HQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 20:16:33 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38be5e86918so41484031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 13:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776716189; cv=none;
        d=google.com; s=arc-20240605;
        b=lVA5tRLLy5UcRc4yAQ1gX4BFIhauKyHfWOOOKNr7tEtM4g39rMAeTSMhQ5lgYgxOaV
         EeX6688tuXoV+JH9b88eE5rVCVkqI+M0PT87MthwlzfyPEuBz1ga5nVAslsc4CoEUM1w
         wI4u5bBs/OSvLJnaU0F0aFx1dDkYREsHP77yqueMzfTh7790iYEobxTuOFLGszVYWfL/
         S1cfMEOMYRoOndZ99WEbEYo3tMm4JLNGvr+gi1vIQ5VKSmpX/74F79tpHW4nWx6auJ69
         fnWNbeBEsQ7pRyc5NQIK1HVoTvqf5MgDh0alXYtuvsetxrUuslI6oFiT1io05XmzpJk9
         rryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        fh=e44q3Ht6i2gKQNSNcDCYEPguWmez0QVKk5WeCtp82qA=;
        b=KbkcmGzHGm60TN8fPkGzTZNh84JodluOK9ajiElkUGQ7o+/iXLe9puqBgAq8cHwiid
         +ytBINC/gisIyi3DT50H3+X5gTYRLmaZBJqcUKfgN9E9ZLhtBUT7aGsY1hdH4qpqVj6Z
         qD97EeqvzLlWQJC++4rwmN8eE3pxscWFQCmoNdI800cz17zJ5ycMK7DqLy/fyVdt9aZb
         8RqHDwTi/n7rdGiIIvnuLDfWD+8dTUkt9X3E8iL6NTbqGed/Ibb8xnX22l1meNaSS9d5
         8qKGaatUkHcugcutPq6rk3rBuNfE7RBUTiUr2+xayWr0tA3eT9yyk2mKf1Df3gBEFLg8
         dvrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776716189; x=1777320989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        b=dSPIYs9Pl0xoW5aPKoV+vgjZO6pmcldvcj2FX60RjCfI2IpZn8kRfTXQoMmKxGP+BB
         6plqmrAAIBGz0fRBWenyDRaGOpiJOsQZ67d1lkVAeTKpOQwsSoDQhxHufcIWXfT4pNec
         Vp0X52TmI2uz3pgN99wqKcTM+Q07GEEntt8evvRWwiML0mYkCh/mXTy/D4TPTTuzFFbb
         lWuWvUxZMwbUVsenhkI/qWzl3ndN3W8eFq4hH1PhhuMeJRFfaWjOFx2H7NBiMS0rMoQW
         rbXweAE+ynvWAApV/zNQdIyFpAcMnNKIO+wvlJoTvQ77BzLWAC1/meHUCtT0T6hEbGWy
         e9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776716189; x=1777320989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        b=i67DszJyeHBY57KIQDMgNFfZ1mwKKfm/nDuPWG9rndbe7aNoXAfHqyunAxa8r+obNB
         ebA9YXco033e+i+k20RHjp3/XZ68UTufFqwpVF3epABJRVp66VFDmqPOqPM0/EtsU0mB
         oaDKfzEUEn/O5PSniOXeqYNQS2uYgiap8J6tkuHAZoV9swCntfY7tDGnesfgWsrpDUKN
         EK9Srp20WcVlwp3JJhB/LKGyCLKbqfanrghJZ8WTucgUnOzoHxOh4M3Pqd++OtkReWRZ
         2HS2VN1jFWGpj/G3mQ6ca4+wsSrlmPZBDEtNJjLkVRFmAyd76jcsIBeqL820MifLsKhY
         0MPA==
X-Forwarded-Encrypted: i=1; AFNElJ96FRomQNIOWSaxL89j+X4QiPYo5waOlElu5sagQk1qlmIoU0PeSQ8zT5iyUNb8Y9Xi/VyO/Cn4ZBFbu4xxZbRo@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ8bwBGiJWKcwXtQeQ5ZtaJosnP9jXulH1hdW1iFrDzq+boVe8
	WkCvsmypXbyMMo/vm+A0cj/Hf7cgFuZ8SRj+OjyS4mssFpo/OsuAW8FSkVhExNzy+FWUg0JCDvN
	lmmNMHIqKCBBO++H0HGoH4hbiuTXXkuNvkcADhwyC
X-Gm-Gg: AeBDiesSMO4S66kB3Q+qA4SnHkZLfGO9JeFaIZJjZFqItiXGyesybLuF3J7h1lhTZ0T
	EngG3cgseY6ubmoYe61F5WtSpIc0YyFqoF2BtVKMdwtjh31VIT3kx6PpBmmW357lLOS6WcVbYvi
	WVOrqPbhAmhJr9UEiEi2DxIZQCHsX5GvbAUyHub/0eChMdW/KaWnsH0iFLGVMLf99f0mh1lddZ9
	YfsYOBbbEhfKvym6JPErUD5hSt4ffQ3XkUldfOkFZX654aPnlX7H4DWnLPh/v96Rs9tuqztnjVw
	oq+NI01tjxWwdS3I5TtZD0NLhIgLMkQp26bJeMU9
X-Received: by 2002:a05:651c:400e:b0:38e:76c2:dc8f with SMTP id
 38308e7fff4ca-38ec7ae0487mr32714001fa.25.1776716188389; Mon, 20 Apr 2026
 13:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-2-dmatlack@google.com>
 <aeaHPYwzs0dhwX9-@google.com>
In-Reply-To: <aeaHPYwzs0dhwX9-@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Apr 2026 13:15:59 -0700
X-Gm-Features: AQROBzA7QaU-uTclKNPqPjm7N83BGZYqy9MhPcyoyTd2bRZSTk_SV3WPxct_hj8
Message-ID: <CALzav=dvNr2s3UzDKPyxS3JUcaWykKNvYPJUW+8g21DA9SzJLw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] KVM: selftests: Use gva_t instead of vm_vaddr_t
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_131632_337571_0AA5CD44 
X-CRM114-Status: GOOD (  20.79  )
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

On Mon, Apr 20, 2026 at 1:06=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > Replace all occurrences of vm_vaddr_t with gva_t to align with KVM code
> > and with the conversion helpers (e.g. addr_gva2hva()). Also replace
> > vm_vaddr in function names with gva to align with the new type name.
>
> ...
>
> > @@ -716,22 +716,22 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32=
_t slot, uint64_t new_gpa);
> >  void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
> >  struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id);
> >  void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
> > -vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_=
t vaddr_min);
> > -vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vad=
dr_min);
> > -vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t v=
addr_min,
> > -                         enum kvm_mem_region_type type);
> > -vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
> > -                              vm_vaddr_t vaddr_min,
> > -                              enum kvm_mem_region_type type);
> > -vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
> > -vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
> > -                              enum kvm_mem_region_type type);
> > -vm_vaddr_t vm_vaddr_alloc_page(struct kvm_vm *vm);
> > +gva_t gva_unused_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> > +gva_t gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> > +gva_t __gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
> > +               enum kvm_mem_region_type type);
> > +gva_t gva_alloc_shared(struct kvm_vm *vm, size_t sz,
> > +                    gva_t vaddr_min,
> > +                    enum kvm_mem_region_type type);
> > +gva_t gva_alloc_pages(struct kvm_vm *vm, int nr_pages);
> > +gva_t __gva_alloc_page(struct kvm_vm *vm,
> > +                    enum kvm_mem_region_type type);
> > +gva_t gva_alloc_page(struct kvm_vm *vm);
>
> The existing vm_vaddr_alloc() and friends are pretty bad names.  gva_allo=
c() is
> far, far worse.  The APIs aren't just allocation a guest virtual address,=
 they're
> allocating guest physical memory, finding a usable virtual address, and c=
reating
> mappings.
>
> I don't see any reason to have vaddr or gva in the name.  E.g. malloc() i=
sn't
> virt_malloc().  But I do think they need to be explicitly scoped to KVM, =
and to
> a VM.  I'll drop API renames from this patch, and rename them to vm_alloc=
() and
> friends in a separate patch.  Amusingly, that naming scheme will still wo=
rk if
> "vm" is misconstrued as "virtual memory" instead of "virtual machine".

Sounds good to me.

> P.S. This is a great example of why I insist on one logical change per pa=
tch, with
> judicious exemptions for opportunistic cleanups/changes.  If this has bee=
n a
> separate patch, it would have taken me all of two seconds to unwind.  As =
it was,
> I spent a good 10-15 minutes dealing with this.  In large part because I =
kept
> making goofs, but that's the whole point: there was no reason to put me i=
n a
> position to make goofs.
>
> The other argument against these sorts of "Also do xyz" add-ons is that o=
f a
> slippery slope.  Why rename these APIs in this patch, but not the myriad =
vaddr
> variables?  Then after a few "I'll just clean this up too" changes, there=
's an
> entire series in what is purportedly just a typedef rename.

You're right, the API rename should have been split off into its own patch.
Thanks for the guidance!

