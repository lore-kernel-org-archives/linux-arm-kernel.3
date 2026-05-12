Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99028CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzzb2jJ1jA7GZ4TPN3DcMZIn6KxUjt0dYZxw4XPowVU=; b=cwnE9DHsJ8miNW2E+gfK33NQN6
	QGVZUZwVSzgiK9cSFOrzdjHmxXG1ipqeeK5/omIAOlsB/xGHsoorud3LYM8tJ06aKr+ouZHD+7lnI
	mN2XJpLygbyetSak6A2djHrAwBiHjW+h81YkKOn/d8LZUJeH1S8lyfgWin8sQhbdVbiTImP1hJFLj
	Rtb8EyP9bP762vXhbceHaBUCk9+BKOvcAGp/lg1LjxCTqnMbtErth+1kEasPzJGPKNHaaLmxCHlNb
	t+t+swfFaSHMBquUc6MJnSwJxPNGQBEh2vIiIvQK9b0+U4I5eoqmEwADsikTLcypWZZWY9lc+7SHA
	N2q4/M7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpQ6-0000000HH8w-16eQ;
	Tue, 12 May 2026 15:53:18 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpQ3-0000000HH89-0v6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:53:16 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2ba6fe41283so65942935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778601193; x=1779205993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dzzb2jJ1jA7GZ4TPN3DcMZIn6KxUjt0dYZxw4XPowVU=;
        b=Bno9vnCtYMsRb4oDa0uWiYfZZkQKu3FLTDAdhukmyCs5D1htsipOh47bW1N/bsBwCT
         XZ8cEg3FK6EEa464FENIHYJRpT7SKSozLJ5cxSKsAyqO3HD5pqNJxyongkqrEh/6A/lC
         ZxXiYzcB9wAn0XKLkiWixlKesuovdN7hr7kEZfJEhPWWegms0M5+83reOa9DSwD14E1k
         AQrjmEpcoZVVGlHhN4/kCN0zPt2Gf1dg4LULG0lvpp+04/rOxfyiZkqUXeK4nrAA7Fm8
         88OIRtpmoF23Dayg9QOmDA7WMnrgeWaQrWs53iNV37xtU0NOCQOZc6KaoaFWVKFawyUT
         ad4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601193; x=1779205993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzzb2jJ1jA7GZ4TPN3DcMZIn6KxUjt0dYZxw4XPowVU=;
        b=b2ay9HYmqu4YkJ7w6w/Dw3Uerz2UCSMVhvzNCJ1tViomJVTFNWFKv737UQnLnEKZWc
         D5r9uKspkLzTyCOaS7wlK3ODNmq+zzBpPYl2bdfDSgwzRwcgpX0K9zKiSyB9+8ah/hru
         SUqUQFLZNfwaIkKGdBZXMHc38lexcBfCI7v93or/N6cRRCtu0IjlTBFmcJZVp6k/5ygl
         HtnstieWbW6WZEC7C3vdDP0XpeMYAi4oXBFcYp5UeG4QIpGAidQaxCDxf8ciMIhe1slC
         Eallw9JU0eqAqcUGFoRTurX+BjlZhRPlicj/ENiBUSjMyxFpGb7yBwwjbOBqfQrRY8e5
         Dc5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/eA7bV+A7Bj0HDQOJtlaDCXd4Krapg7xvDzcglkkKvFO4re7FRAdhUUSlhxgweWm+m4PWsWT3cuELXlA/wNO40@lists.infradead.org
X-Gm-Message-State: AOJu0YyFcwfCO8eqRrucRLXbYJcQxvnBraQIVcG332cl2CHrvULF0kjm
	dgBOwb4u8W/DXGDVt0zfBR+ec8VS1spMSFqq5anngozSjvu2Wy9QEZ7CRVBMcbphMLihImifv0n
	MSyHY0g==
X-Received: from plhq5.prod.google.com ([2002:a17:903:11c5:b0:2bc:a589:91c0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b03:b0:2b0:b290:f2f4
 with SMTP id d9443c01a7336-2ba79be43f8mr289028985ad.32.1778601193243; Tue, 12
 May 2026 08:53:13 -0700 (PDT)
Date: Tue, 12 May 2026 08:53:12 -0700
In-Reply-To: <c17d864a-42fc-afbe-345e-c728e2735d0c@huawei.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-25-seanjc@google.com>
 <0064952b-048c-455d-ad89-e27e5cb82591@linux.dev> <aeJkCGwsrRmuBikT@google.com>
 <c17d864a-42fc-afbe-345e-c728e2735d0c@huawei.com>
Message-ID: <agNM6KSlsFjOaSUv@google.com>
Subject: Re: [PATCH v17 24/24] KVM: selftests: Add guest_memfd testcase to
 fault-in on !mmap()'d memory
From: Sean Christopherson <seanjc@google.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Zenghui Yu <zenghui.yu@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_085315_260860_CFDED213 
X-CRM114-Status: GOOD (  20.40  )
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

On Tue, May 12, 2026, Zenghui Yu wrote:
> Hi Sean,
> 
> On 2026/4/18 0:47, Sean Christopherson wrote:
> > 
> > Does this fix things for you?  If so, I'll send a proper patch.
> > 
> > diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> > index ec7644aae999..c682bda722f9 100644
> > --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> > +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> > @@ -510,9 +510,15 @@ static void test_guest_memfd_guest(void)
> >                     "Default VM type should support INIT_SHARED, supported flags = 0x%x",
> >                     vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_FLAGS));
> >  
> > +       /*
> > +        * Use the guest's page size for all accesses, e.g. to avoid having to
> > +        * map multiple pages, but create the guest_memfd instance with the max
> > +        * of the host or guest page size, as KVM requires gmem files to be
> > +        * aligned to the host page size.
> > +        */
> >         size = vm->page_size;
> > -       fd = vm_create_guest_memfd(vm, size, GUEST_MEMFD_FLAG_MMAP |
> > -                                            GUEST_MEMFD_FLAG_INIT_SHARED);
> > +       fd = vm_create_guest_memfd(vm, max(size, page_size), GUEST_MEMFD_FLAG_MMAP |
> > +                                                            GUEST_MEMFD_FLAG_INIT_SHARED);
> >         vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, size, NULL, fd, 0);
> >  
> >         mem = kvm_mmap(size, PROT_READ | PROT_WRITE, MAP_SHARED, fd);
> 
> This results in another failure at
> 
> |	vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, size,
> NULL, fd, 0);

Gah, the memslot size also needs to be a multiple of the host page size.  I
actually tested on a CONFIG_ARM64_64K_PAGES=y kernel this time, patch incoming...

Thanks!

