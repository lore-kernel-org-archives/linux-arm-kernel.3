Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FC6C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZcYmV5Cug1VJQ3U1/VOA01nGHc5KRf249qTuRVD+sM=; b=juqgdyGrUVegTyrEWYKl6XMUXl
	sfjomt0oQ61r3bbczNVF2MtlSTXQPLarCFzXvxuVNdPiQl30q1HCzx9vjVJwumiOFu/ZIgz7j5ttH
	8k0N1+aA4VEWGyWwtR6Kk1HlQGGSQl7UuOkkB7AaR8lrXXt36JVvDXQOMdPuVb6chcdoBK46xCAlD
	sD+Ce1xCH3ckrTeqrVy2NoDaTcX88sjU9LGj5nVfzKI7vuJEIM4Cvxha3zI2qbMwKhuu2sEjKd3JJ
	EZdK8B7CuZKg0xc0xBNhgjv9/NQpRu4PKIfDprwFBWnILcUVJXB+A6UmprK7M8QDY0nVQ7x/q/qF+
	o+rcTvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurZn-00000002gnQ-2zjl;
	Fri, 14 Aug 2026 13:03:59 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurZl-00000002gn5-3YP4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:03:58 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2cfa55c9430so11056255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786712636; x=1787317436; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZcYmV5Cug1VJQ3U1/VOA01nGHc5KRf249qTuRVD+sM=;
        b=h3IswcI5/ZZbi1cwFm4qSzCclDc63meb3CU8zkM/WP322MD4HONeKMHjqPPDxQsfiG
         OMF46HtGa9yXc62pCt+Bik/HJTHL6YX7ZghUg8M1ho4iTDweA4+QSjl/kKIazF8YHpE+
         TN4G674OQ9pVzKnVKp7q7nyLKsab9+HOfITDZxQaZWtONg5rk6lG7Km1j+jkcDeDroVs
         X8wqu/5wLqzK3Pxd3nVTNLlg+Kc6BFeKe087HRHiLvqV7YpIZkBs/bnKAd2Ec9U8U09S
         9kbeCGhcYZJookvtnQq2NUScdd0MVHNaGRSePwK53thr6B2NVT78KRQJIKcWOauNKmiD
         2tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786712636; x=1787317436;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZcYmV5Cug1VJQ3U1/VOA01nGHc5KRf249qTuRVD+sM=;
        b=V8C+vh29c1GwQLBMWV9lxyoCEMAokgb3qQkhNHRkpRfsRmzf7twHO45ilNGHXwe8Na
         igwZxGTeef3A5L9/EeZdRb7CO0FPpM4UGCMgrgXehKp6w+lIzvSpAaAOL3npvwZsvY3q
         /El3rLrYvG8ly3awZwSH0+DTp+YK2dG1mh81pJc0DT5De/bMz0Myc3B/WNyUGCrkoVc5
         hf9qY7GUpFmaDOIPwHI0lZCXIuS4hRqBUnEvxpKGGbMJ9+c3MvscVIAoPYz6gPHbAvnh
         XjhInk5vi4GW0XFAY54vSE9GU1CqE+DUCxCVkqoVPwX7FQDQjVBGkymQ9LZYO/mU8LFF
         YJ1w==
X-Forwarded-Encrypted: i=1; AHgh+RqzMNrL50423jLl1XHm7NhH42ehQDF/1JsYQNte768my6RprGnP+2xSKqgqWm/gtNLCQymHgZc6zbNaLvtVAxV/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Vk8x+JeeBthn3KVaaQL7F4EkIlTzfY/6zhz786cnXDgaWhhv
	2T4g/wbnwflSldUmlYvnKxS/PsL4uhDDyYBLZ3cBuyE3BFmVT4fcVJssRtsE+z9hGiA4ZPWdZ7z
	iQNC/kg==
X-Received: from pldv11.prod.google.com ([2002:a17:902:ca8b:b0:2c7:e06e:86f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3204:b0:2c0:e2ea:6b0c
 with SMTP id d9443c01a7336-2d3b0d88bd1mr71228795ad.21.1786712636303; Fri, 14
 Aug 2026 06:03:56 -0700 (PDT)
Date: Fri, 14 Aug 2026 06:03:54 -0700
In-Reply-To: <487aa57c-72ad-453b-971d-ca24a8380429@arm.com>
Mime-Version: 1.0
References: <ak0wSQ1133O7B96D@raptor> <ak0ziUcCXUlDdcla@google.com>
 <ak-EKSslAz1uqEtv@J2N7QTR9R3> <ak_wC4Q-mQe14DI8@google.com>
 <alDI1b8fC99SG4_a@J2N7QTR9R3> <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
 <an3sEiQlIuGEjUur@raptor> <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com>
 <an5UJ4S_P1LUFmzD@google.com> <487aa57c-72ad-453b-971d-ca24a8380429@arm.com>
Message-ID: <an8SOvLybeilzCEU@google.com>
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david.hildenbrand@arm.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Mark Rutland <mark.rutland@arm.com>, pbonzini@redhat.com, 
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_060357_892065_4D5BE939 
X-CRM114-Status: GOOD (  22.96  )
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

On Fri, Aug 14, 2026, David Hildenbrand wrote:
> We have a hardware feature that requires pages to always be mapped into S2. Some
> things I had in mind:
> 
> 1) Page migration would not be a problem as long as hardware could be paused
>    while migrating (e.g., kick all vCPUs). I doubt someone would implement that
>    right now,  but you could consider it an implementation detail that page
>    migration cannot be supported right now.
> 
> 2) Newer hardware could mitigate this problem, allowing the feature to support
>    pages temporarily being unmapped from S2.
> 
> 3) Disallowing page migration is really just one implication of "pages must
>    always be mapped into S2".
> 
> So what we really want is "if feature X is enabled and hardware requires it,
> always keep pages mapped into S2, which currently implies that page migration
> cannot be supported."
> 
> Which isn't all that different to "if a confidential VM is run on current TDX
> hardware, always keep pages mapped into S2, which currently implies that page
> migration cannot be supported."
> 
> So I was wondering whether the flow could be:
> 
> User space enabled CPU feature for VM -> KVM knows that current hardware
> requires for that CPU feature to have S2 always mapped -> KVM tells guest_memfd
> that S2 must be always mapped / disables page migration.

I'm a-ok with adding a flag to guest_memfd to communicate whether or not page
migration is allowed, because guest_memfd needs to actively support page migration.

I'm not ok adding a flag telling guest_memfd that memory must always be mapped
in S2, because guest_memfd doesn't care.  E.g. KVM doesn't yet support page
migration for SNP, but SNP tracks page ownership in an out-of-band table and so
KVM can map/unmap all guest memory from S2 at will.

> That would be in contrast to user space having to guess that page migration on
> the current hardware with the current guest_memfd implementation does not
> support page migration, to then disable exactly that.
> 
> Does that explanation makes sense? I don't know the exact mechanism to do that,
> but that's just my high-level thinking.

Yes, I'm supportive of KVM expressing to guest_memfd that page migration isn't
supported by the VM.  I'm only objecting to expressing that memory must stay
mapped in S2, because guest_memfd doesn't care *why* page migration is or isn't
supported/allowed by a particular VM.

