Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01E6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftgzyujbx9F68uHjOCU1/tri9c4N8S6xaXNJtzq3Flg=; b=IQ2GqJam9sUgbyzqzZE3pB+N87
	81DznQH+VUGF+8t9MuLtKFhaDWeR8mujc0STQX7kkb+O79mo0VvEH8hKzJFAhEnRdHpZKEKk+5zdx
	gPgOczJOID1LDbwCmBbIwy8pGCzxGgQhAMwwJ3pCAtzK/Ix/XJ9qmfhzIG1UimNpLT/iQ/vsSPc3Q
	psJORjUPh+i6NbhrSM7IIMccfEnYga+w7zg9n9fPXy1a50KnmN/J/KNCb1AMdiVjSIecmnHsLAh4i
	YvVYHTiZpbFDnw4dnDQ8TIlifDLmb4FQZZmzQaXWOOq0oLCsfhghdj5yKiO5BWeROe8TKyomcC6sK
	BOuUoACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Csf-00000000RoC-3WQL;
	Thu, 03 Sep 2026 19:13:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Csc-00000000Rnq-3NNg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788462825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftgzyujbx9F68uHjOCU1/tri9c4N8S6xaXNJtzq3Flg=;
	b=cwdSFHGUB5A4gw2DrXzNUj8QNSk5NRzKQXNlNBKl5gcyW8AbIIsQ3VXAg8cy9jZEkGboev
	VknJLN50cEM5kARqRg1jo4r1mWl/2NBSuDGwQxOClWnRO3NdwiFK8kvJm5GYS7U6Pqm3C6
	7FyygcPNYD+HUEUocketHZue9RCBi+g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-GvwbRNxbPsCWHxTL0gWPKw-1; Thu, 03 Sep 2026 15:13:43 -0400
X-MC-Unique: GvwbRNxbPsCWHxTL0gWPKw-1
X-Mimecast-MFC-AGG-ID: GvwbRNxbPsCWHxTL0gWPKw_1788462822
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso127618f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462822; x=1789067622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftgzyujbx9F68uHjOCU1/tri9c4N8S6xaXNJtzq3Flg=;
        b=jd9Kt+bQIwDB236oVe1OBWxKcJh8twrzYcrDzW0wqY/dDjIV4j+Ascad2TGdFUBqGl
         INdOT2EhcuVzN3qRfl46VsyUsPuiKEmbnDEr7ch4xOl1PJ29kQp49UwLC5/YskVYzISX
         4r7MeCJ8p0bogvJVqfuKu1DlhyXIAxDcuYcB+83Sv9m9WsgtOCSatPGD14f6vIicWCN3
         /b2uURsf73pNANF2bdMl2RTH3S9cDpVk7RmKzRirBOgGdMnVzuHN+4Nv/6l4Z7jwk32E
         edhIE7o9m18GdmAXs2BVnXxM8gGhb9a6wD+i8PiEmVTka5tX3GiC10Yfb1zzcMtyAK8P
         PJRw==
X-Forwarded-Encrypted: i=1; AKwUvBwCvUeGFaJeEt3RuRtU9OhwrFhEF8k7J5XlWtIebgTP+qjUKWG9JbhI0PoSl1GT6VKnx+n95gsJttLBeuG9JKQC@lists.infradead.org
X-Gm-Message-State: AFuF++lyZpr9xyL+nYY8dYjlCoQfEGJqmtKmMezJG2HVuJqWr3XaiEcz
	G5hqD0Vt7vZgECCnBwEB5GPCB7HZFJXlpPjWgL4inBCqAzpS9sqdjUAZ4LULXpZY3ZMa0hzdsH9
	LCSUrSxsD0/JxCbYYuQ1lqy0jItmovEs8faQSPKV1a5ahL2y5LoDCfCcL7UVmQbm8aN7bGhODLP
	uVnV2QYU8KC4gsdXSnbZb1QSVLjj43/mPkJt3An5CF6nGD04X0lac=
X-Gm-Gg: AYBFou27t5usYU1HSQK24UYyA9BbZyrHdaduGQikaEMJGYQxCBtQD+Cd+juZKZvl6Zv
	ovlOIFlAHZpUeO1z6NiyIp3gsCmlucKsSC6JSsB3GIA77/tZw8GktJSGL3LSmy+Ze690EKkrzQV
	2JVhU/ZV0KMVc7hhyYCwSI6VSIUiMhlouDFDdql50dXixoZKEk0yx+LA+9QOVubtKB0H11gaziR
	qq66XKcly18I8d4RzeLGQAYrArfF00+PxYnllgc0n9SkKyZHMtWGJAIGadu
X-Received: by 2002:a05:6000:2084:b0:482:f0ee:1390 with SMTP id ffacd0b85a97d-48587289c5bmr2438692f8f.22.1788462822432;
        Thu, 03 Sep 2026 12:13:42 -0700 (PDT)
X-Received: by 2002:a05:6000:2084:b0:482:f0ee:1390 with SMTP id
 ffacd0b85a97d-48587289c5bmr2438609f8f.22.1788462821985; Thu, 03 Sep 2026
 12:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
 <apmEi1NmOUvmUBFP@google.com> <apmFClPZ2WcDINmT@google.com>
 <apmIGgMEN8w-kQAm@google.com> <19d4feb1-d703-4c62-8622-a6d5e9d6394c@redhat.com>
 <apmYPMMPCNzK9ZEA@google.com>
In-Reply-To: <apmYPMMPCNzK9ZEA@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Sep 2026 21:13:28 +0200
X-Gm-Features: AcwNN1VM-0Sta_usKYpoIMa4PlVb-9vByCd46nQw98qW4Zt-Pg_0xPWbP_VjwBM
Message-ID: <CABgObfZL-qNSaNkNZDj0Kk41zw6UZ30vkSxc6T8wb-pOKab9Wg@mail.gmail.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
To: Sean Christopherson <seanjc@google.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NYSmlaGIIKwZfJnceG4TBiT9qU6qtmEP5OTBY5u3ygA_1788462822
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121346_937944_ABDF372F 
X-CRM114-Status: GOOD (  19.37  )
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

On Thu, Sep 3, 2026 at 5:54=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Sep 03, 2026, Paolo Bonzini wrote:
> > On 9/3/26 16:45, Sean Christopherson wrote:
> > > > > Actually, thinking about this more, what I've proposed here, plus=
 the pattern of
> > > > > #define-ing macros in arch-specific kvm_host.h files, should suff=
ice.  For things
> > > > > like __KVM_HAVE_ARCH_VM_FREE, it absolutely makes sense to #defin=
e the macro in
> > > > > kvm_host.h since it's very directly tied to an arch callback.  Wh=
ereas with KVM_MIO
> > > > > and KVM_ASYNC_PF, because they enable compilation of C files, it =
makes sense to
> > > > > define them in Makefiles.
> > Ugh, defining CONFIG symbols in Makefiles sucks.
>
> Sure, but IMO wrapping entire files in an #ifdef that comes from an arch =
header
> sucks more.  And technically, these aren't CONFIG symbols.

True it wouldn't be -DCONFIG_ (fortunately). But even if technically
correct is the best kind of correct...

> > I don't want KVM to be the. one that does things differently *once more=
*.
>
> Too late :-D
>
> arch/arm64/kvm/hyp/nvhe/Makefile:ccflags-y :=3D -D__KVM_NVHE_HYPERVISOR__=
 -D__DISABLE_EXPORTS -D__DISABLE_TRACE_MMIO__
> arch/arm64/kvm/hyp/vhe/Makefile:ccflags-y :=3D -D__KVM_VHE_HYPERVISOR__

Sure, VHE/nVHE is fair game because the nVHE case is in the same boat
as vDSO, arch/*/boot, and so on.

Looking at a grep for (cflags|CFLAGS).*\-D most are -DDEBUG,
-DDISABLE_BRANCH_PROFILING, -DDEFAULT_SYMBOL_NAMESPACE, etc. and in
most cases they seem like a bad idea. Don't do it for KVM please;
requiring -D for all architectures and for random pieces of config,
when you can put it in asm/kvm_host.h, is just as bad if not worse.

Paolo

> And I think there's value in deliberately being different, because CONFIG=
s are
> kernel-wide things, whereas the thingies in question are KVM-local macros=
.  I.e.
> IMO, having the behavior stand out is a good thing.
>
> > I'd prefer to stub out the contents of the .c files instead.
>


