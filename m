Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06E3C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGJERRSxIHYm/D7qRYs3pk5CzuzrfI4TxpqJDm/o52E=; b=N+oCmwQfHZiZDZdA3Iyhfqkpn5
	q4N+Xx+DsXEUkdyBasE5pwaQSwKasho0zJz1Kb1tQQ1gnK+5BmzzFCoPLzqL594i0o7RxY2NCn0jt
	KsfAznxQJJamnojei1MiAhFsAF0e0+pWRNcctSCb3S7FihqzEWBHBhWyLR3eIrCxYHBbOPhpw1pmA
	5iIqMNZGscq7mLJXZbGm8s1AdcIA34GCE9RgheNCsKj4b+duNnh5BuY1mrbCk8td9F/iG9TMyqYOC
	UtLM2OC6tMcuu7CBOltQnX4DwUddXI4w97nSCg9wC3PKk52+6xkeTRg8X4VjkJh3rLYtX7eIxQon/
	1SvGSy3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6Qd-00000001Xnw-0xLn;
	Wed, 30 Jul 2025 13:01:07 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6Mn-00000001XCW-39oS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 12:57:10 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31f2dd30823so3187675a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753880228; x=1754485028; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGJERRSxIHYm/D7qRYs3pk5CzuzrfI4TxpqJDm/o52E=;
        b=jGhSlZoPCyQ1pKv53+sySRH0SBdG5D9qygdyzYEAR21guPe9IWyaVrqbGU/4Vi4ett
         LAXLO16B+lKXm3mFyUUAy/817JOtmGCKHq5gPWrZtVse9UhasBin5AbmO5bG3XCnrwLq
         LTCnhKdNCgEA4AVpsnej8bqtRk6yD7d+dKzLJ5yPkYfyofYK4dyzkvRjeKNPK+FS/NSN
         xYkvRvJNYo4AWXnhq88mCwz8NudFXEpGuCH4Ig4FZUX5AXtQ2a1BOz4yJL0nqy0ccfSv
         0ksCCS0BOM5quxAL3lDVeiirpqpsScUXpYejNdWo88QlyHSAE/Huq2m73ZWX1/HYzvdT
         3CcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880228; x=1754485028;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGJERRSxIHYm/D7qRYs3pk5CzuzrfI4TxpqJDm/o52E=;
        b=g61OU86XiRn62ZdqURAgQOVR+hdpXspaXRGszV1pZu2FnQmiT8ekAlvknLMX49boVe
         t/z0QtppdcYkjsHIzP3Df641OS+qyp1RZlpuzqfXTcCDoDRQB6QmUI0SR9fUDDmXFY7+
         MyNdUl6cJbRDrF/2nugJVC0gJElzisqfBdwuynGi0ojk2n7Rf3ZGvI9zXemxLjPTbHGq
         Rg0qwzlMnGS9wD4ctF7L4vDX3no/9ei+HR+gtytmGo35DO7Vj4grAqt/wWHDROBtlyJz
         LMw2TIddhE9BJqEJXVACk9Gz6B4aL4X5cINloB8jmQz+tod1Ls+xRuutscVxd9Saefwn
         HWug==
X-Forwarded-Encrypted: i=1; AJvYcCWeQGcDnmc9Zp5bBbJP3v22HLNoMPo0QCG/xS3CooJfEeaUQTJDsAbM4IQS4zNpVpnsOWYQnmkre9q+RE0XpECs@lists.infradead.org
X-Gm-Message-State: AOJu0YyI7Mdw9TdYoQ6m5jX02KMY5TbjCHW1lJ7d+9TjeCjPkH0erhWN
	weMeclC4zUFnuJxb6qH+zA3Jx3Z1W7w3CtyJM1sCJuImAJVSgI1RSySaVl17mwCqKQiKArsycww
	09VdfGg==
X-Google-Smtp-Source: AGHT+IGTVzSY5NC9djL4t4SYCqSM0WRzbgQXc+av5XxWfwIb706Wi6fuHTkYD9Th8LKmbEzDjnpm2KiAEQI=
X-Received: from pjsa5.prod.google.com ([2002:a17:90a:be05:b0:313:274d:3007])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3948:b0:311:fde5:e224
 with SMTP id 98e67ed59e1d1-31f5dd8ce1amr4347975a91.6.1753880228258; Wed, 30
 Jul 2025 05:57:08 -0700 (PDT)
Date: Wed, 30 Jul 2025 05:57:06 -0700
In-Reply-To: <856487d0-8e1a-4e64-a8e6-13977fd31fed@intel.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-24-seanjc@google.com>
 <856487d0-8e1a-4e64-a8e6-13977fd31fed@intel.com>
Message-ID: <aIoWosN3UiPe2qQK@google.com>
Subject: Re: [PATCH v17 23/24] KVM: selftests: guest_memfd mmap() test when
 mmap is supported
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_055709_813143_DC7B50AF 
X-CRM114-Status: GOOD (  15.39  )
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

On Wed, Jul 30, 2025, Xiaoyao Li wrote:
> On 7/30/2025 6:54 AM, Sean Christopherson wrote:
> 
> ...
> 
> > +int main(int argc, char *argv[])
> > +{
> > +	unsigned long vm_types, vm_type;
> > +
> > +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> > +
> > +	/*
> > +	 * Not all architectures support KVM_CAP_VM_TYPES. However, those that
> > +	 * support guest_memfd have that support for the default VM type.
> > +	 */
> > +	vm_types = kvm_check_cap(KVM_CAP_VM_TYPES);
> > +	if (!vm_types)
> > +		vm_types = VM_TYPE_DEFAULT;
> > +
> > +	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
> > +		test_guest_memfd(vm_type);
> 
> For ARCHes that don't support KVM_CAP_VM_TYPES, e.g., ARM, vm_types is 0
> (VM_TYPE_DEFAULT). the for_each_set_bit() loop will not execute any
> iteration at all.

Doh, indeed.

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index b86bf89a71e0..b3ca6737f304 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -372,7 +372,7 @@ int main(int argc, char *argv[])
         */
        vm_types = kvm_check_cap(KVM_CAP_VM_TYPES);
        if (!vm_types)
-               vm_types = VM_TYPE_DEFAULT;
+               vm_types = BIT(VM_TYPE_DEFAULT);
 
        for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
                test_guest_memfd(vm_type);

