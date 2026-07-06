Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eGtWkkyAP+CX1fJ/+ZRWJr9u4Vfu7xwsEfOdR5rCGU=; b=y+vIiVUi5icCQT/dvQjks3VHk0
	UyMtzVaFGKyDHllCbvpGskb04ZfDjsmnf88Nd0+W9NdW2rioQZbc2ZbI4R84yuObJptLQvXig+TZN
	LPVCG7GTY7iVKFqrdCpnrY4KZF1gGexexwVHR1IBgB7JCpBz818wnR54Rk8BjHgUT1s8hG39esbNM
	Rji6IOoXdSGdrDH3RcfYERFvWTlS0mKc0HKwSeTXnlM5Bz9n8cpC7Uv/0M5kioepxDol1pqP89o/m
	kACYvab3XvElqWQL9q/+9QKeajx5LDqZcr3dx89QnBP8WJntPXSQ6Jc3RdrZV+JYfGthq5EU+BiGX
	l2ZyIwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqce-0000000DbxB-2YsT;
	Mon, 06 Jul 2026 21:13:00 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqcc-0000000Dbwh-2VBx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:12:59 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2556239a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783372376; x=1783977176; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eGtWkkyAP+CX1fJ/+ZRWJr9u4Vfu7xwsEfOdR5rCGU=;
        b=DyjkqLZ2T7iu0aaTkX2Z1MLurW/q2qqitKo79llA+1+qyQ4iG5ik9UWRQA/D6D9YfJ
         EMDDYlYRwEnNIk8FJMCa65mdSHxvCqktyVAjzEfCwVvqVfcZpi/U2KElXoV9yoaWZTs5
         99uBcbfRZsjsfzpT8cNQ7rqOxYL2oKjufJ04bkAJSJvzwkhdFa5AfWwupB2WjO7ddJSf
         MEk9seAZr1fQKEk2OdGumqIu9Ge+nCOzHaCW1/byBUm6iIOpbNUBfyKJ4/ep7xm/nPYA
         QbanissiLPukTPuKS+3cM17ey0QIa7luNWF6CDLeTyCGMpFYpidPNJQJJNCQPUV4wBiL
         Sa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783372376; x=1783977176;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eGtWkkyAP+CX1fJ/+ZRWJr9u4Vfu7xwsEfOdR5rCGU=;
        b=QVrGZhwij8KJfYPy8QlyKFcXtj+9PU43Iq4kAqz7jMVZg6X9Lt/3aOs+m0sM1JF1KY
         nl4guecxB3KpIH2winmJpc4dBK5/eiLknsRD8SYxOammNIIIvgmk9abZtaSRGFc5ogwK
         PsPGTmX0YbKGmFAr+ZZdIaIZLmgnhiG3M6h5KuXq1AW0jj1n4x53fTiwT5hqrINVGd0G
         nZ7697xIQvEYpI/9kSQvtc33yJRDSbRHOPLm5cfIAryF6nJlHWSrdj+D7D7JD9Vt2z0p
         /w22n8SbdI3C2HaR6fgbmLSYBZ7eCSgkLWnyqO39Hq/TnhQ4jM/+M7BrHuzDx940y6ev
         36OA==
X-Forwarded-Encrypted: i=1; AHgh+RpsP620+xV2yK6JNVceU5WpHs2NTJv07fCtXF2HaLzFHXLz50sUV4kHtKIUAdQR01AR2SmZSsKzpkgShkTfxWWK@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ33ERpMHnWUXLQZ3WKs283zezuWEE+emQsToyrA4O29JVidZ8
	wJZRP++zlsjRwILOLnM9X71A/2asM0b1G+AuQQwkGLyC9h8b75dDBIv3j3512RRWlC2DCiT5Uxc
	yA4zg9Q==
X-Received: from plth5.prod.google.com ([2002:a17:902:7045:b0:2c8:903:9ae7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19cf:b0:2ca:bf8e:35fe
 with SMTP id d9443c01a7336-2ccbe611af8mr26055545ad.16.1783372375629; Mon, 06
 Jul 2026 14:12:55 -0700 (PDT)
Date: Mon, 6 Jul 2026 14:12:55 -0700
In-Reply-To: <20260706195313.GE118978@ziepe.ca>
Mime-Version: 1.0
References: <20260706085229.979525-1-seiden@linux.ibm.com> <20260706085229.979525-2-seiden@linux.ibm.com>
 <20260706195313.GE118978@ziepe.ca>
Message-ID: <akwaVzghHzi8o8fK@google.com>
Subject: Re: [PATCH v4 01/27] VFIO: take reference to the KVM module
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Gautam Gala <ggala@linux.ibm.com>, 
	Hariharan Mari <hari55@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Hendrik Brueckner <brueckner@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_141258_635877_1DD6CADD 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon, Jul 06, 2026, Jason Gunthorpe wrote:
> On Mon, Jul 06, 2026 at 10:52:01AM +0200, Steffen Eiden wrote:
> > From: Paolo Bonzini <pbonzini@redhat.com>
> > 
> > VFIO is implicitly taking a reference to the KVM module between
> > vfio_device_get_kvm_safe and vfio_device_put_kvm, thanks to
> > symbol_get and symbol_put.
> 
> I thought we weren't doing this approach? Use the struct file as the
> kvm handle. I thought I saw patches doing that already?

+1, my joking-but-serious NAK stands.

https://lore.kernel.org/all/adf29Rn7q9Db0hxc@google.com

