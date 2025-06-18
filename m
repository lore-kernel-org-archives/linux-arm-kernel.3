Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BF6C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42sjWHF9K9fXhUOTdWTuqVb5UO4E3+WdeqqnFDGgg5g=; b=S6uM2xrc67PIKUm5oBRRqhyX1S
	tImHxXJ5K1tDn4DAQeopfoitVzpcx/MxYOgppsZluBt5RmWrir1BkwA+wVxjLUMIPcQjTpm/ide1+
	R5ad74miTvmB0CczCUH7mkmBs2xoz3sr6DR7wLIhEdyrnsK3KwSUhRzFiGPK7CjKWR2vmOAdmplie
	eUAsTItxeS0t1FVg6VzmTcjAtRzHMIBnNiNZ9sNh+e6VPFsY4MM+tsrzLKTsSZa84rMByl0Vadfw/
	B+X8KJGEKzkxNc2XO1nioHd2qre6rrbwZdLmqmxdoE8Rvd3LL56qmv9O0GSQghA1bFpnQbfR9xAiB
	R/MGXTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzVS-0000000BL0L-2uDI;
	Wed, 18 Jun 2025 20:35:38 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzTE-0000000BKpc-1GYk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 20:33:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748cf01de06so45449b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750278799; x=1750883599; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=42sjWHF9K9fXhUOTdWTuqVb5UO4E3+WdeqqnFDGgg5g=;
        b=QhUpfQSnhCQmbip8frTVqf1e23OMTPyws9ojbJHw4n30EJasAliV/K3UsiG0wvkeTk
         MZ6/zjkEbneE1lMV+6LFXQhCtisIeEQyx5WDqNAQrjYYGElqn4ARiyzyK2v8lixQux2J
         5S3K3GtHfWt/ZaGjOgZe9b7zk4/+flQ9klZ4HCA0i2vPrlvbTYi8gqBle7ZLJiiz7oXP
         qiGHDq+3GlwR0EURFjNrs7tXZqFjxhmmrBFH3Afeqh1+chjI6winc/HtXRhueaa08zv2
         yzgYKn1ltY/bHsqAfd9GUjYr/DU7VedCLpDP/8GUvmXLYj8hVanWM6scrbRTCM2OyPDQ
         Zi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278799; x=1750883599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42sjWHF9K9fXhUOTdWTuqVb5UO4E3+WdeqqnFDGgg5g=;
        b=KHbr8TRhevZcSWRSnATVKd6tiLae/pxfc6WioWWauy+Js93LUkx7OdYe535A8flpeo
         XU6FNZHOgcKxGXFXWFRoa4QKJVgYYkJwti4awDLptEplOKWdWf/Pz0YLCJ8Sg/DaqKVT
         WT6/kTf9wXULEL4LyjMmJfMnhnS1EZ1I+Em9rQPba6Mw0vwdUBiUvIZt8aUedluEV3g8
         vuWgxodUIbdY1xGIXXYfegdscEuNpouQC16cz97I655S7AWJmz+OZ8PzEkNEl4rmas1O
         wgO8j723SjM+069QKU81igDZt/y6n3xHy6v6kI5ByGOFbQAMK/zFc0HP5Fd+na0MdPPJ
         MlYg==
X-Forwarded-Encrypted: i=1; AJvYcCXXYLOQ+X18PA6XobA7D2eQGXNsWNd9GSGumBh8rWQ79OFdWEU84veY9kju+MnW+pKRHTfnjUxaMSxhJANl+FWz@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ6lKBF5rrLoPTXycN53az/+5OQtP5cAOswv49MURlgC3aZeDU
	E1WrmP5rtfJI1i/jTZ0ud33udPgIiMV3DWgNA7JsIlRskT3iuCB58EKuM/04J3GkH/xXT8w1vB+
	qyQ0nPg==
X-Google-Smtp-Source: AGHT+IEnBs/fyXDZxBhLtmzxgsodc8isEpYWLiF7lsMkgK4GDRL+j/j0sf7eKoTQsS9Mi2OcofOzygboUp4=
X-Received: from pgkk127.prod.google.com ([2002:a63:2485:0:b0:b2e:c3bd:cf90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:69b:b0:215:dfee:bb70
 with SMTP id adf61e73a8af0-21fbd57ac35mr30705672637.29.1750278799173; Wed, 18
 Jun 2025 13:33:19 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:33:17 -0700
In-Reply-To: <aFMWQ5_zMXGTCE98@linux.dev>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com> <aFMWQ5_zMXGTCE98@linux.dev>
Message-ID: <aFMh51vXbTNCf9mv@google.com>
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM Userfaults
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_133320_339176_6C390041 
X-CRM114-Status: GOOD (  13.82  )
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

On Wed, Jun 18, 2025, Oliver Upton wrote:
> > Signed-off-by: Sean Christopherson <seanjc@google.com>

No need for my SoB.

> > +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> > +bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> 
> The polarity of the return here feels weird. If we want a value of 0 to
> indicate success then int is a better return type.

The boolean is my fault/suggestion.  My thinking is that it would make the callers
more intuitive, e.g. so that this reads "if do userfault, then exit to userspace
with -EFAULT".

	if (kvm_do_userfault(vcpu, fault))
		return -EFAULT;


> > +{
> > +	struct kvm_memory_slot *slot = fault->slot;
> > +	unsigned long __user *user_chunk;
> > +	unsigned long chunk;
> > +	gfn_t offset;
> > +
> > +	if (!kvm_is_userfault_memslot(slot))
> > +		return false;
> > +
> > +	offset = fault->gfn - slot->base_gfn;
> > +	user_chunk = slot->userfault_bitmap + (offset / BITS_PER_LONG);
> > +
> > +	if (__get_user(chunk, user_chunk))
> > +		return true;

And this path is other motiviation for returning a boolean.  To me, return "success"
when a uaccess fails looks all kinds of wrong:

	if (__get_user(chunk, user_chunk))
		return 0;

That said, I don't have a super strong preference; normally I'm fanatical about
not returning booleans.  :-D

