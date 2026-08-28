Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB2C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 18:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD64MUyngIsCQv9tUBdkcgzvyMQxFZ53ZEBy5BtZu7g=; b=eNr1kN052XzzZSog+58K5AvPZj
	eswjNTCngOGCT8dQ9aoJINGkMH61214cxfNpDGzSeNGEYi0jObGtr20Tx7SoHIxkor5X32HVo8FnO
	gO1GmZCCRql3BYEZIg4oc35cDTrT8y8qRqopnPuSE90yGU/QWJQhev1uiuR1VbROsYk8rULFQ5jId
	qCCLnb623KrB+9EqK3W7IFCpiDui+efrtfkBIbtmc/mEvRRKsl7W0CoLx7JnXgk+B4vsaEXbJRg8s
	wzLUrvualvMGEohHn7kYDkD6DcFkdkVAuJ+KiudXvHVedNFTlZdND0FHDcxLeYBzxscF/nQNAbgya
	WBFVgm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00zN-00000006I8Z-1Spm;
	Fri, 28 Aug 2026 18:07:41 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00zJ-00000006I7H-2xt2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 18:07:39 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cbb92868263so1273058a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 11:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787940456; x=1788545256; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD64MUyngIsCQv9tUBdkcgzvyMQxFZ53ZEBy5BtZu7g=;
        b=CI+Bwg10kzQthQa8PgfS7UlqGE0nHQutKDb6isKQRPQI04w59y3NZljcxPtirvf56l
         XFo6BS2JUnt+ZJarMu9HwNu+r6b26WnMA/u6hkes2VnBI05C6IT/NfisNSYzPyWyDbGw
         3B91V5PQb1A+ivwP4N8mH7yt2G80GyLgw7o5UbXLfyR4MSnWiBOieO7QerERFvD0ZLt3
         LasNCBBPIK7XQ2aJgbGUqqYa4YT+F972NlRfD8loeY2WEzDV7QtHnlQLuMdxe1XPGKvN
         lJXS8zlUd/igCpPhgoJDmuMZX2lL9XXuVXRzH6pgDaMAKAF7Ll9moi3vP7WWiGpV0Uf8
         YUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940456; x=1788545256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD64MUyngIsCQv9tUBdkcgzvyMQxFZ53ZEBy5BtZu7g=;
        b=ocEyY6DOjEGUx1INK/+1l4Gf3BHiA23exm74hetmc7z11Q4TrR6GTcA4wlDM4DVtCP
         SMPogQUSVlAjPNWst4b0sYe/DeDr66I0WQjrji0cp3o5K+/om+oga455Sj4hDNA4oJRc
         a4t223yq0gTq+9yu7kHNLvn0zsioHuTbXAbg+EK7Wt2b2epSTK9pFkt/xJwDwqjyVcfv
         CxiKep5z1x0xMRzGuUDV7ZnNooZThYJey0Sh7Esg2z9y3CGj4J+g/avnOGzr0PLkhgEj
         vyiXqf8RxyXIq1HKreC2fBXlMqYz2bDPvTDwK0eGV55kIPPh08EXVE1C3MQunThacWkj
         A4oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8uUk2+c9X7AYR26XSDRxanGV1vgiiKvrpcX0Yxx3pu/oyOX/Md2OD80U9O+n9IyP9R7W0x668rCZSVHQJLFTP@lists.infradead.org
X-Gm-Message-State: AFuF++mH+33Af5z7Sfur062d95bZ17BWMXQEagebNkcONthKD5CGm2xi
	5GUqXpqPdMRQ+7X6mgRZXZArq7R8i4lmvcDDnCjjT/MsH347RIoLORHbEzPiC9IWDY/xzdW1F0W
	3MAM3sw==
X-Received: from pgtk26.prod.google.com ([2002:a65:68da:0:b0:cc1:4794:1471])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:160e:b0:3d0:e034:a26f
 with SMTP id adf61e73a8af0-3d2688bd551mr19120799637.17.1787940455451; Fri, 28
 Aug 2026 11:07:35 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:07:34 -0700
In-Reply-To: <20260828195848.2d14e9aa@p-imbrenda>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com> <20260826230511.972824-3-seanjc@google.com>
 <20260828195848.2d14e9aa@p-imbrenda>
Message-ID: <apHOZouaLKs5CgpI@google.com>
Subject: Re: [PATCH 02/20] KVM: selftests: Bump the minimum GPA for page
 tables to 0x200000
From: Sean Christopherson <seanjc@google.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_110737_751837_0563B027 
X-CRM114-Status: GOOD (  21.49  )
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

On Fri, Aug 28, 2026, Claudio Imbrenda wrote:
> On Wed, 26 Aug 2026 16:04:53 -0700
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > Bump selftests completely arbitrary minimum GPA for page tables from
> > 0x180000 to 0x200000 (LoongArch's minimum), so that LoongArch can use
> > vm_alloc_page_table() instead of open coding a rough equivalent.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  tools/testing/selftests/kvm/include/kvm_util.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> > index 5a7a455b5387..70906a0d1003 100644
> > --- a/tools/testing/selftests/kvm/include/kvm_util.h
> > +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> > @@ -175,7 +175,7 @@ static inline struct userspace_mem_region *vm_get_mem_region(struct kvm_vm *vm,
> >  
> >  /* Minimum allocated guest virtual and physical addresses */
> >  #define KVM_UTIL_MIN_VADDR		0x2000
> > -#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x180000
> > +#define KVM_GUEST_PAGE_TABLE_MIN_PADDR	0x200000
> >  
> >  #define DEFAULT_GUEST_STACK_VADDR_MIN	0xab6000
> >  #define DEFAULT_STACK_PGS		5
> 
> this breaks s390/cmma_test
> 
> I tried a quick fix, but nope... I will need to actually invest some
> time (i.e. next week) to understand why the quick fix is not enough,
> and come up with a proper fix
> 
> the good news is: it seems like cmma_test is the only test that is
> negatively affected by this series.

Is it this change specifically that's problematic?  Because if so, you can probably
just do nothing, because Sashiko (argh, just remembered that Sashiko doesn't Cc
everyone) pointed out that this will likely break some arm64 tests as well[*].

The LoongArch folks confirmed that using KVM_GUEST_PAGE_TABLE_MIN_PADDR as-is
should be a-ok, so my plan is to drop this patch and instead have LoongArch use
KVM_GUEST_PAGE_TABLE_MIN_PADDR.  I.e. make LoongArch match everyone else, instead
of making everyone else match LoongArch.

[*] https://lore.kernel.org/all/20260826232224.782021F000E9@smtp.kernel.org


