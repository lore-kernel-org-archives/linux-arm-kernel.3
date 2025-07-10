Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25477C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wr3J+RHblG5GJaM0j5JuIylNt4iRFZX8BEhZw6kzZM4=; b=Qe4f7A7mH4PDnAXfYyN8XKsACi
	xWKd+QFWRs4IC3/3nl3HfUfYWzN/gT+1NKh+ZVmKfAhCc4rlF6Xsn2QxXahLBYzW0oPsek3C8QIAP
	POY7da+RG1cyPYCQqL0VPJWlt49Z6peiYAAnwp7rzCp9Wibkj4XZcqxGsj6EZKC357snaQAp8YDjC
	c6x3K9kO+YX51TrWZ0NB+uKIALyC9qr3MRN9Ax6Di26FsfF0iIcKZ/Y0gp5bMLoSihtexjS6kEm1W
	SiPkh8hmzywJnAFltxdyHg7blsbFq0ljsHQhxpWH3YK25wvJqowocyZZdQn5DUb3ZraGkswq61P7J
	3/OwujWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZseU-0000000CBWf-1DrF;
	Thu, 10 Jul 2025 14:53:34 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrPm-0000000BwZb-0xrc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 13:34:19 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-748b4d5c045so1043507b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752154457; x=1752759257; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wr3J+RHblG5GJaM0j5JuIylNt4iRFZX8BEhZw6kzZM4=;
        b=kscqY/HV27tIvxidolsk7i0iB0McYAUO3gpR7hjzjsbvI3+etT16tspUwZYJb9Qten
         Y80MmOLVuE23BWLDGLKdlh4sqNNYZFHDlhdI6QzAYzHncoj0cHTcCWjhwQD9w4H2yj6L
         2u8I7oxjFx0TnVsps47ejQcBosjpklgoDv6jRQDtAUyEIMUbUYuAiip2466Zbuesst+H
         EBcDJzqk1r6W1SHfe7KXQBptSeNsAKxWsvzaK8K/RoQ8YE/4R5ppqRG+cYGZd7nlWXS/
         MPa0Al07ALkaOnr3jYucmfOP/djtqkT7sHedKi+O9XCc/x2Wenhk+rT1DLDJEgG7VD6V
         Teaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154457; x=1752759257;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wr3J+RHblG5GJaM0j5JuIylNt4iRFZX8BEhZw6kzZM4=;
        b=DOCWj9rqby3zR12knns2F/GTo/YMVJXlSCQsi9tFT9em+uKyB43XSl/Jlusr/F9NrQ
         y2GxYgkiBYYlrYLSHC2zX5NIVPw+a0ReyFxvyxeSF+fNe3w3Ii1kzzY+/st9BVDI4BG7
         /ySCYNbLIY4AQW3sq5UZxMNKipDU1EYsijx5aOoWgfzIQ8ujV0rYlzR98h8XBPixeFnL
         Jj5qx1VuB3L0Yg7BWXlegW25pzfWePEDfLF/n+n3TafpkTgzVS8d68/IIQfg/qmaDlLl
         cYEvT08TJoLCEY9xxhKhfeQWiN2yEjOcvdmg2ZeVUSlS3hSIEbgcBOOD4dkZ4X1ojT79
         n0Hw==
X-Gm-Message-State: AOJu0YwTazy+U8YNJR3CREnh41RTFI+q4uH84fDl2KXs63UJtHTB/Rey
	BT7bKpUFJ/E9C6wJSdfb7yQ+BVnuZlYyFy9boW7O0vhP0qIlojHSpAZn9/eG6gp4BbUCDH+OhWT
	oPkfg+A==
X-Google-Smtp-Source: AGHT+IGSaHIBRoN/S9txevmPNNTrr4Q5vAkgijLk90fjXn6DImx6okraCPXWwkAGxJiWt5+DBd6m7A0lCUs=
X-Received: from pfbil5.prod.google.com ([2002:a05:6a00:8d45:b0:748:2476:b25f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1789:b0:742:a91d:b2f6
 with SMTP id d2e1a72fcca58-74eb8f7c144mr4500112b3a.13.1752154457032; Thu, 10
 Jul 2025 06:34:17 -0700 (PDT)
Date: Thu, 10 Jul 2025 06:34:15 -0700
In-Reply-To: <aG9i5BHDHRlFRFnb@google.com>
Mime-Version: 1.0
References: <20250624092256.1105524-1-keirf@google.com> <20250624092256.1105524-4-keirf@google.com>
 <aFrANSe6fJOfMpOC@google.com> <aGJf7v9EQoEZiQUk@google.com>
 <aGwWvp_JeWe9tIJx@google.com> <aG9i5BHDHRlFRFnb@google.com>
Message-ID: <aG_BV_tKzqktRlOA@google.com>
Subject: Re: [PATCH 3/3] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Li RongQing <lirongqing@baidu.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_063418_270577_4BBD5015 
X-CRM114-Status: GOOD (  22.51  )
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

On Thu, Jul 10, 2025, Keir Fraser wrote:
> On Mon, Jul 07, 2025 at 11:49:34AM -0700, Sean Christopherson wrote:
> Would it be satisfactory to put a patch along the lines of your
> suggestions below into a v2 of this patch series?

Ya, works for me.

> I have made some comments below.
> 
> > 
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 4953846cb30d..057fb4ce66b0 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -5861,6 +5861,9 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
> >                 if (kvm_test_request(KVM_REQ_EVENT, vcpu))
> >                         return 1;
> >  
> > +               /* Or maybe smp_mb()?  Not sure what this needs to be. */
> > +               barrier();
> > +
> 
> Looks weak but maybe strong enough for x86? Maybe smp_rmb() would be better
> statement of intention?

Hmm, yeah, smp_rmb() is better.  I was thinking it just needs to be a compiler
barrier, to ensure KVM reads kvm->buses as needed for each emulated instruction.
But ignoring that x86 is strongly ordered, KVM also needs to ensure a store to
kvm->buses that is supposed to be observed by the next guest instruction is fully
visibile before that instruction executes.

> 
> >                 if (!kvm_emulate_instruction(vcpu, 0))
> >                         return 0;
> >  

...

> I guess kvm_io_bus_read() is to be done as well? Perhaps the barrier
> and dereference should be pulled into a helper with the comment, just
> in one place?

Ya, +1 to a helper.

