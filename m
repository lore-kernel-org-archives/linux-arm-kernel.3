Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E95BC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xd7fVESQIYURer+XcfloCFqoNH9nVlZcYjsVdYV2DsQ=; b=rx+REVuyQysU4zpWaRPMfsG2u+
	hXc+TBHd/PCx5FYeozepm8HndOhMpdUOKEQpMlYt6T9xfUH0FUvyeoqgwKa7d4LPV8t9OFXJIxI5y
	BYZ2Zb4AFM3KpvPvz9P3iMc9WAyokgZSCBBsUKDvdryyUVfJljo86+KI9FaXkEQPyUigu13rQEO3X
	Fjt+jRMB6CXnOXSmL7vV6lSQ6ETback9SRXGs27iV35UzUKHGlUEDfyMWI9xYzmxm53wEjpKA7oTY
	eeuW94khzRQ5plneOFckGW3Ov1ou9sDQDTQ3IKj8gIVfYz+YfsbcQST7zUghrxBgjF1gErDn6NZdq
	mxd6uz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzb7-0000000BLbw-3LkK;
	Wed, 18 Jun 2025 20:41:29 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzYu-0000000BLFt-2QhG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 20:39:13 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-70e4043c5b7so1079387b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750279151; x=1750883951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xd7fVESQIYURer+XcfloCFqoNH9nVlZcYjsVdYV2DsQ=;
        b=iryqzNOzJuM62LuQoD2kFpNHrDKUq7Vd3xj3rq1DZ7BCa7r3mR4Npe7/F1qswiqvE5
         Y6FXWN5fqd52OYdb2hwlvq4L+HdnW45OuESckijcwlRp20O1YzGZPEkB7ErjDzOIKeco
         nU+sil3YMLvF9+lCeaYJbGFsjkSom4991J4a3TVqPmnVUGqnCsIa19cRljSYgIYmMEqJ
         WH4Q3b8fV5zpnrSf+s3Qej3rvbMX2yDPoyNjTicKunxixmmNpt4QmlgMaaTkAssxsYkp
         cdpeBSf2h2xgAGO76WLQilZS9TKk2w/RFOgV9H9zui60Kp/jPkLvKbzefXl4iLksNfWn
         JAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279151; x=1750883951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xd7fVESQIYURer+XcfloCFqoNH9nVlZcYjsVdYV2DsQ=;
        b=xG9zgaFiqrhCuMbe68h6lOsrIJhBla6zIYRVOVFFGG1X0bQDa/MrlOWBDxJkoVcKni
         f31kGLu76iv6kDKtr/y8mQyjFP+MM1obmLPA7n7rDhnwbyNm8/MaWxUE51jJauf0PaoT
         NFcebGwEBN5Ila////ZPDGehkafSUdtM9oha32oaOHpaHbFN5BrtJB/BdGtiRZw/YUKa
         lOLtspOA2Hd505YUAHZZGKo/Q/zy1hidvrUU/aAKcMYVlkNFlQwwvSXUCUJZ3wOqmmvf
         ABDuJquafgJbjRMUhwFETH5twFvojTDpap+7trY3OjKJPC19TP5e6Sjx6HKzdECt/ZVr
         KyqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEEvzT6HQPNB72MqRGLt/wcHQj6KuzNo/5TmCbgiUgscDkBmkq8fI05OMATnYrnnXMmBB/5C7syOLA2jobHWSg@lists.infradead.org
X-Gm-Message-State: AOJu0YyogICWUfmqOHLRzDyhtkB0e1DMj4W1YiE+9fqymT0fHM369Mec
	Z89Jb0ZoDfytmCXjIo/VaaY6XcBX/NMrRxeFGbNupvVfHwRs85i1Y4uYFk/vIJhbE9MiG+uwUZi
	HbbGEIQu46sJAUmTXV2QvyLVfLMD7Zu3/0TDuLd6j
X-Gm-Gg: ASbGncttJGxwCdJVZyY9MYPPUlvK8eFC9ytiJaCOSrtmeapZpSMDwtfnzhXE0XLFTBH
	k7JtjRiFZlxYqH7A4pQYPfYxE1ktHMHwKvInC646+NrYFFuMj0IRXH8Jixjf8TpaAYVQdM3ajU8
	kwnt2qVIoUiWfJdgjINhnJhzMaFjN5MwDWuWkXcu4vo+nDl53eqNmU0wEuSDcmT/cJkpL4pfN1D
	IsIRUgVUxA=
X-Google-Smtp-Source: AGHT+IH1NWNvanAK0XOjMJEe/GTsQrjRFVmMnXkKiISsTuc+7lPoCeqCpycNb+zFFUr9NjVAP8ZmiqXZcDijHwWFKtA=
X-Received: by 2002:a05:690c:7241:b0:70e:2d17:84b5 with SMTP id
 00721157ae682-71175203681mr284981287b3.0.1750279150493; Wed, 18 Jun 2025
 13:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com> <aFMWQ5_zMXGTCE98@linux.dev>
In-Reply-To: <aFMWQ5_zMXGTCE98@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 18 Jun 2025 13:38:34 -0700
X-Gm-Features: Ac12FXxtgm7oIFvlTJaEkpAlCqjTucv9lNobWhug7G4AqcUM4fEMOn24B5rvNUA
Message-ID: <CADrL8HXdBY-sxPJrKEKOzdyZ5C82dE3qUobQuh+LABgatCfgdw@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM Userfaults
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_133912_618180_667AE45D 
X-CRM114-Status: GOOD (  27.10  )
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

On Wed, Jun 18, 2025 at 12:41=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> On Wed, Jun 18, 2025 at 04:24:13AM +0000, James Houghton wrote:
> > KVM Userfault consists of a bitmap in userspace that describes which
> > pages the user wants exits on (when KVM_MEM_USERFAULT is enabled). To
> > get those exits, the memslot where KVM_MEM_USERFAULT is being enabled
> > must drop (at least) all of the translations that the bitmap says shoul=
d
> > generate faults. Today, simply drop all translations for the memslot. D=
o
> > so with a new arch interface, kvm_arch_userfault_enabled(), which can b=
e
> > specialized in the future by any architecture for which optimizations
> > make sense.
> >
> > Make some changes to kvm_set_memory_region() to support setting
> > KVM_MEM_USERFAULT on KVM_MEM_GUEST_MEMFD memslots, including relaxing
> > the retrictions on guest_memfd memslots from only deletion to no moving=
.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
>
> > +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> > +bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fa=
ult)
>
> The polarity of the return here feels weird. If we want a value of 0 to
> indicate success then int is a better return type.

The way it's written now feels fine to me. I'm happy to change it to
an int (where we return -EFAULT instead of 'true' and 0 instead of
'false').

> > +{
> > +     struct kvm_memory_slot *slot =3D fault->slot;
> > +     unsigned long __user *user_chunk;
> > +     unsigned long chunk;
> > +     gfn_t offset;
> > +
> > +     if (!kvm_is_userfault_memslot(slot))
> > +             return false;
> > +
> > +     offset =3D fault->gfn - slot->base_gfn;
> > +     user_chunk =3D slot->userfault_bitmap + (offset / BITS_PER_LONG);
> > +
> > +     if (__get_user(chunk, user_chunk))
> > +             return true;
> > +
>
> I see that the documentation suggests userspace perform a store-release
> to update the bitmap. That's the right idea but we need a load-acquire
> on the consumer side for that to do something meaningful.

Indeed, the below test_bit() should be test_bit_acquire(), thank you!

(N.B. I don't think the current code could result in an observable
bug, given that the later write of the PTE has a control dependency
here. But it is certainly written incorrectly.)

> > +     if (!test_bit(offset % BITS_PER_LONG, &chunk))
> > +             return false;
> > +
> > +     kvm_prepare_memory_fault_exit(vcpu, fault);
> > +     vcpu->run->memory_fault.flags |=3D KVM_MEMORY_EXIT_FLAG_USERFAULT=
;
> > +     return true;
> > +}
> > +#endif
> > +
> >  int __attribute__((weak)) kvm_vm_ioctl_enable_cap(struct kvm *kvm,
> >                                                 struct kvm_enable_cap *=
cap)
> >  {
> > --
> > 2.50.0.rc2.692.g299adb8693-goog
> >
>
> Thanks,
> Oliver

