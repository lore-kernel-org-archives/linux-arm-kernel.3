Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51257D715D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjMnGoeDh+YdrtLg+xDqC4Hnv8XghUga4m38t6BAP9M=; b=Kxue4aa73LZ6IUtbe6dqJo+W+Z
	NnIw/m3XvpG1zAt3EDSu0HQpWJ2/g15KR9aCA6YqdgkI7FMMmWqVcAb2LIhBjl9yP+By/XiPdtDSS
	Jil8cE7nYn64LvnbTLr4JoZigDGG4AvvvUJNQo0KhoFGlxZvFwxWfeUj3h+nQYk6CVn2djKfqwAYb
	ApIdIPuX61Mx3wKc6Lv8fmAeP16cdKOMLj6hUxp7JMxnZrzJanVNvC/wlze540annugAwhaoU3eI4
	5+JDBDqsJw7m1OA9dndSMBRXHLGcstB6lff6KiuaQY50/BjENHkFaYCk1i0qh8j9JKJH08GQfuP+H
	p6TIScgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYPB-0000000A4gf-318y;
	Sat, 24 Jan 2026 07:50:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYP8-0000000A4fT-2jFu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 07:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769240996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjMnGoeDh+YdrtLg+xDqC4Hnv8XghUga4m38t6BAP9M=;
	b=cpq8/ttedYyjYBsP9cx0bnf+PRJ0SQj1MUvN5WVwzLrtJr7FuCeHLx5tJrd1F9XVkq8TAR
	6mP4dLWdkdR/GTrtjq0x18StkHESZWJrBT0ldTtcfqcrZ6jcUmAc2FHeoDvVjQNVHB2NUl
	pXb2kDkPQxJ/Jc0zJrwPRx5EwmcdkYo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-vqJ2BR3eOXCgEdT6s6BGAQ-1; Sat, 24 Jan 2026 02:49:54 -0500
X-MC-Unique: vqJ2BR3eOXCgEdT6s6BGAQ-1
X-Mimecast-MFC-AGG-ID: vqJ2BR3eOXCgEdT6s6BGAQ_1769240993
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430f5dcd4cdso697313f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 23:49:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769240993; x=1769845793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjMnGoeDh+YdrtLg+xDqC4Hnv8XghUga4m38t6BAP9M=;
        b=EbNvhfOKt/khCB07JLA84Y3xD+Yxp04OZfbY6ii6ARSMHSVZBgEkLEhlT34n8AUP5Q
         KYfRmBNcopr0eLfIO/4thm/FUOQwP0ALgh05UY3d93mrnwfOFCjZ07D6PZUxbpNJtWRT
         OZtVyj+VkrlXijkxJxB02Hl1PvXf/jinCiGbximK0jh0+DViBzoigFcunNutalfKOZAR
         jzLYaktE8JyQ91VrZyJmZH31dYARtY5YIljNvvCPb5fYqVmDRfKH54HZlN2U/FQGfq/V
         lGxoOQMoC4zwth5SNj77jyqq8YCAdEhDsPxnBVS34ThpJ9O9J757TiYGvrzxgSVAjYkZ
         QPiw==
X-Forwarded-Encrypted: i=1; AJvYcCWJeGsLVKfs5WD94VDRc9okJHH80zyVi34IjNU/FI7SKMF8ceiZvNGlsl3AMYYtLm5koj7pl5pTdx41vT59oQkT@lists.infradead.org
X-Gm-Message-State: AOJu0YwOFykeH3425qHLjp8vfaPcFAhsgCPMtHr/hX8nAY8fhkgqf2QF
	C9UA9McrapKy1CgrdPFOBmegs1IOfcWM+0xVLO23lBaF5mvvBiHwJhXg9dmvsUgXXPeOAkwExnw
	IOyrt4O7/OZbReBZ/fpJgHZi1yUmfANIPFH0BRP8xb69+Bo8M1WIkQxXIpRmVsthzCwW63XxROh
	ZeSx/9Oi7J+DWA85ja6/urSewBKP+4l6sPNO83lboaTe/DmSW1U68=
X-Gm-Gg: AZuq6aK6WThTZYb1BD0KwcXQLo7ncr8DcbpjvblEoyv2f/h6Rq4Jjm67NLhtnR2X37y
	ysIjqgkSSax/faibipxAzQGj97Rffijjt3GOZO2IXWcREHWOlVRtxsTqiLi9Dqpc2IGOut8iO2H
	qaGauvy1GQBk0dbKwuIq/tFXNxfjbcZqvQzeHHIpps0sxR3t5caMJVbM2ZgmwoB2Eaj+4fqsm2Q
	/ABqse9F6xVIA0HWhdKHhux90r+0RinudHjy4hfrMet8KLMU+TO1EoSxCDsQj1V/cY00w==
X-Received: by 2002:a05:6000:601:b0:430:fdc8:8bbd with SMTP id ffacd0b85a97d-435b16039damr9146815f8f.41.1769240992702;
        Fri, 23 Jan 2026 23:49:52 -0800 (PST)
X-Received: by 2002:a05:6000:601:b0:430:fdc8:8bbd with SMTP id
 ffacd0b85a97d-435b16039damr9146785f8f.41.1769240992303; Fri, 23 Jan 2026
 23:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-40-seanjc@google.com>
 <njhjud3e6wbdftzr3ziyuh5bhyvc5ndt5qvmg7rlvh5isoop2l@f2uxctws2c7d>
 <42513cb3-3c2e-4aa8-b748-23b6656a5096@redhat.com> <874iovu742.ffs@tglx>
 <87pl7jsrdg.ffs@tglx> <5bea843b-dec8-4f15-bb7c-1d0550542034@redhat.com> <87sebxtrgp.ffs@tglx>
In-Reply-To: <87sebxtrgp.ffs@tglx>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 24 Jan 2026 08:49:40 +0100
X-Gm-Features: AZwV_Qj6aLwVSas8vwNUo-Ndu2FBevRcUQp0THPxC18GLGDTRk3JARciXPkQtdQ
Message-ID: <CABgObfbijO2k6fe6z03M3u--4ZKXxwPSf2RrasU1=J5rtj9CUg@mail.gmail.com>
Subject: Re: possible deadlock due to irq_set_thread_affinity() calling into
 the scheduler (was Re: [PATCH v3 38/62] KVM: SVM: Take and hold ir_list_lock
 across IRTE updates in IOMMU)
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ankit Soni <Ankit.Soni@amd.com>, Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>, 
	Naveen Rao <Naveen.Rao@amd.com>, Crystal Wood <crwood@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7ru7QbTJjFw8kabGXasXuGhubbYcuJoq8j_eB1LYGxQ_1769240993
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_234958_767790_17FF5E13 
X-CRM114-Status: GOOD (  16.35  )
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

On Thu, Jan 22, 2026 at 7:47=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Wed, Jan 21 2026 at 19:13, Paolo Bonzini wrote:
> > On 1/8/26 22:53, Thomas Gleixner wrote:
> >> Are you still claiming that this is a kernel/irq bug?
> >
> > Not really, I did say I'd like to treat it as a kernel/irq bug...
> > but certainly didn't have hopes high enough to "claim" that.
> > I do think that it's ugly to have locks that are internal,
> > non-leaf and held around callbacks; but people smarter than
> > me have thought about it and you can't call it a bug anyway.
>
> Deep core code has a tendency to be ugly. But if it makes your life
> easier, then these wakeups can be delayed via an irq_work to be outside
> of the lock. That needs some life-time issues to be addressed, but
> should be doable.

Thanks for the suggestion---hopefully it's not needed at all and we
can delay taking the lock in KVM.

Paolo


