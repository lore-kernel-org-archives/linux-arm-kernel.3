Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F35C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=; b=a/bLS+BujGHyaHyu/tdPrNNFg0
	OdUwOypcOxXGyKpOBTu/m8copvUXOF2blIS5LCMV2S1Co8qU9z3A1YErFKzNl0dj48lClUIAsI2tJ
	Y6YQ6t+R5sFPqO1eRNw7jE2f3wTVBTb4S+bPp3PdpVRAVTNR19pj8cbWtu2UWc2s4pwdKv5aDXuYc
	7y5I2BDvXGwb6Pfj2xAETCMxlVxTII51VuFgrukyoN0Wce3oTr6g1RncN+Hejd8HgTsDMzWNZFYjB
	sgZaoqkYawPlJJxraP9C3DYXTkf6FHnJEJ+lJOX7PHsM+B+4ghIJeXT5fksR+N4vQyswqx2jLpUYC
	Lzn5Ge0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UeA-00000006G8i-2216;
	Mon, 07 Sep 2026 08:24:10 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ue7-00000006G6j-0t3X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:24:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-485888b3c3dso3401709f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 01:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788769445; cv=none;
        d=google.com; s=arc-20260327;
        b=grG2CWq/H+SZyFETMZ+sFV01ouyBfAhCxAMS62RgdxGCbBg3HlfxgP0ThVvjZvir98
         jyVv7/j1PzyxwIwcnWR2Idyz/2SurQgfdeaNfmA2mGkMz2Ro0v7AQNimEZzkQ+HVpCI0
         Fgxk7+GrvSD/rk38rV5K1MRD1Br8f0eyfZ8inzA3Dya4KPVZBehIEE8TyyaAilwLzP2P
         UWaQQFLK7s/1SbV+pgv7wdnRZpUmz2fRqFtfS9BraHK5OKGLaAnLhaDvo++GfRBa6l5J
         rTmwlfLje4WwNBXS50USd7EWtPHHg6/9MysrmSg82/fGXBajar01jSoegB+dQZdSTuMm
         e22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        fh=luzjbNbKobfIJAsiAmHTSfw86W6dpiRtXNWg/KddQeE=;
        b=P/scils+8BeVDgb09iAlnsoyjJjbVt4KIttGwjDUdUmzMfYEpjH9mQ13ieQr9hbbLe
         A2jEp/xOMV7bGvkbc7rjn4yGYDS5b9v2UrO7LD6jU0snyETw0I2TSAz373K4dZPQAOcn
         D1EmWIuhWVU+VCxFbJw/1Iv86jtGT3dJkmHqK3uAiSWU1u6Qnpd+KrAkjnlK64OMzw/B
         My+RQ1xBw+DZMosoEiwBKE3xYgRPAEm4yTwCFFh+SAs1errlYZdZKi2PNFrS6JYyICFJ
         OzmdjDaEEbOEXKX9nQBvt4pmP7pLfeJLjeYKbhibYBT6fQGeX9WdIKXaqOWKn+Ko6dcv
         ulvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788769445; x=1789374245; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=M0teZe9Dzlc0cLLpRLVcVC5P8FhsCY6tBRrF+n59FoPmufx3AcA8tZCsV2CQ4l4ewc
         N+I9srguHiQtST7ShDEjrE49qxYv0hl9moaSRm5vGol81Xtg6dZYgg+00DSTyipP4/aT
         X8BGw6cYM0AWb6U8kvoAxl8LGAOo8d9fPlUdVtwOGjyIcFk9z+uwJozoJH7fCuMqMXrb
         xr6RSlYlXWt5xY81JKpFYgA5ro5sWWk4loNqMTMircj8J342WlneUYxlctjuC67bED48
         w9wa5gahzimnDDe1dFe8ADX68YadItVgoGg8F1CWqHsZP3zlquMbE+u3XhhCh+SYDtsE
         2bsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769445; x=1789374245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6qiSySchwLDdn88HORNI+edfDP5k4+RIZ3ev8MYNCc=;
        b=Wnu2vEF46+19Cr8eFtrvx16s8KgP6w5Pe9ZMNiFw+rFRy1MKPEl1lXLa81V5cTIYDN
         JakmsiYdTVZ7kUREdCP1hk+8th5nfuQUdIrIIFxZLw6hs50MQ990VR1Xhn0UhzSN7b+/
         2LLEPWgxhxcufmJuRP89K477d4AJ7NL+HaiSJOzUU8l69zd1pbQfOQTJbPA/i7v0BAml
         nBz+M4CFkwALCkOn1dlk1wHGA1Zn3Qxhnf36w5Q2wGp8hCyESYkfnkSLy1aJsQVoYZCd
         oIzw6vaJBVBaj3DCLfoHjaFNr9fXtOQT6/W/cOBteyKOv7G1orD8C4CwktUfywr4qex1
         WCSA==
X-Forwarded-Encrypted: i=1; AKwUvBz+xyarUHuthmF2MV/pbkRAk/3OJI4m35/KLOWZG+iaWI84t5ZCuLfU9cNNRXHp2wKTIc1BDxDJk+STIBkug2Qt@lists.infradead.org
X-Gm-Message-State: AFuF++mqlrMMEpgt684FdRYTXaHsyZm1xw5n0mOKs4Iz+YCGa5zjGctH
	eHh0ceesJAQR/TmdsuYDhyUoe/g+Ru7CFcHbU3apkOsCCElDnqZv6IGkuhClojk1rNUKKjuRC9Z
	WUgY6uGikWn5gz3KBzOhxvCVgZTuZ09duCFWPEu3WGg==
X-Gm-Gg: AYBFou1KnG/aOyqH1io1M5s8k/d/iQJA7VMh/WzUn1iGxP7qbbRo3xOtjFQL6WDMt4/
	89xw4r33qWSS2xF75NiUqljUB9otp3MRrrgJ3w4pb+a9MMlby7/yC+tles2QUo7pX33lRNU/5Md
	LaEFvyyK9TH/BC5aTLkYS/jxegmTrznp0xtCQ6XLucG9ChNA4eNV4AZs9IbBSGZwGF5DQXUmh6G
	suocpVRRizLXiFjYvnbMNzcAC7+bkzGUprb0QsI11HzZ/zUBp+tVs6LJiGBIzUpQd72v/I9dbGm
	rA0R73dL68NpUWxCo7jk7iC6xKislzWnEYx26HuwlQJrG9e/Vy1IEKns+eDB1UnSBg18TbJGruP
	IlautQK/eFWdVM1SNacfSBaN/zF/pSEalP1Xh7LJNaQSY23cKfdomwqpKgxTrCJs=
X-Received: by 2002:a05:6000:2f82:b0:485:8c16:5ef7 with SMTP id
 ffacd0b85a97d-4858c166148mr18091871f8f.49.1788769445126; Mon, 07 Sep 2026
 01:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Sep 2026 13:53:53 +0530
X-Gm-Features: AcwNN1UOItNX8Zqa8yZNak7eVCaaP3xVxuE0lRNcn1acCna6Fm_hGPjVZ5FCvUw
Message-ID: <CAAhSdy1zxu0cGnvpZEq_mPYRj07m7a+TA_8f0-sa=Mu7xtXvjA@mail.gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate
 multiple page table pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_012407_291953_68357EB4 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, Sep 2, 2026 at 10:11=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add vm_alloc_page_table_pages() and use it throughout arch code to replac=
e
> open coded equivalents.
>
> No functional change intended.
>
> Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM.

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  tools/testing/selftests/kvm/include/kvm_util.h    | 9 +++++++--
>  tools/testing/selftests/kvm/lib/arm64/processor.c | 4 +---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 4 +---
>  tools/testing/selftests/kvm/lib/s390/processor.c  | 8 ++------
>  4 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testi=
ng/selftests/kvm/include/kvm_util.h
> index d9d39a8894e2..c56f342b16fd 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -1013,10 +1013,15 @@ static inline gpa_t vm_phy_page_alloc(struct kvm_=
vm *vm, gpa_t min_gpa,
>         return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
>  }
>
> +static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t =
nr_pages)
> +{
> +       return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_=
PADDR,
> +                                 vm->memslots[MEM_REGION_PT]);
> +}
> +
>  static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
>  {
> -       return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                vm->memslots[MEM_REGION_PT]);
> +       return vm_alloc_page_table_pages(vm, 1);
>  }
>
>  /*
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/te=
sting/selftests/kvm/lib/arm64/processor.c
> index 01325bf4d36f..2dcaa2c4a038 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -115,9 +115,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>         if (vm->mmu.pgd_created)
>                 return;
>
> -       vm->mmu.pgd =3D vm_phy_pages_alloc(vm, nr_pages,
> -                                        KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                        vm->memslots[MEM_REGION_PT]);
> +       vm->mmu.pgd =3D vm_alloc_page_table_pages(vm, nr_pages);
>         vm->mmu.pgd_created =3D true;
>  }
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..c175dcd14114 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -69,9 +69,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>         if (vm->mmu.pgd_created)
>                 return;
>
> -       vm->mmu.pgd =3D vm_phy_pages_alloc(vm, nr_pages,
> -                                        KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                        vm->memslots[MEM_REGION_PT]);
> +       vm->mmu.pgd =3D vm_alloc_page_table_pages(vm, nr_pages);
>         vm->mmu.pgd_created =3D true;
>  }
>
> diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/tes=
ting/selftests/kvm/lib/s390/processor.c
> index fb9dab92d4d1..33f49d743b5f 100644
> --- a/tools/testing/selftests/kvm/lib/s390/processor.c
> +++ b/tools/testing/selftests/kvm/lib/s390/processor.c
> @@ -20,9 +20,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>         if (vm->mmu.pgd_created)
>                 return;
>
> -       gpa =3D vm_phy_pages_alloc(vm, PAGES_PER_REGION,
> -                                  KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                  vm->memslots[MEM_REGION_PT]);
> +       gpa =3D vm_alloc_page_table_pages(vm, PAGES_PER_REGION);
>         memset(addr_gpa2hva(vm, gpa), 0xff, PAGES_PER_REGION * vm->page_s=
ize);
>
>         vm->mmu.pgd =3D gpa;
> @@ -38,9 +36,7 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
>  {
>         u64 taddr;
>
> -       taddr =3D vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
> -                                  KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -                                  vm->memslots[MEM_REGION_PT]);
> +       taddr =3D vm_alloc_page_table_pages(vm, ri < 4 ? PAGES_PER_REGION=
 : 1);
>         memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page=
_size);
>
>         return (taddr & REGION_ENTRY_ORIGIN)
> --
> 2.55.0.966.g6673acef38-goog
>

