Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ECAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 23:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nfsw3dCbG2eROZ65PkHFv78AeM3AjkoQEz/YIwe6msI=; b=PntVeVG5G5+Pu1Q3YEADwqUx5X
	MDzNsC50lb0CJq5nobBinrljiGHvkadjIKsiTcznEbkuuwYLLjilNQRZi4iX/fXY0g4cux7/Sj7q7
	QEpIdulBNOQ3JEb8n/an3Aeddda3bFd/hFkSSU+BvgHq9itXg43jrdt/ApYIgZ2FMN/ZQt9Fc+GYN
	1OEmLeBjgxCufnO7UeOqqAwW9M8TVyDBFwIUco4BGFELRzz11oJ/sHuP/71hrtR95PBtFC/GEmebJ
	Q7b74QKuZrMoa5nh4Q3URCERN9eDPDcAsf8FDShc6qs43vYX50rm+IBJYo3uUAmbmwQahvJA0sTws
	h3HZtNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wueuz-00000001kEq-3HNR;
	Thu, 13 Aug 2026 23:33:01 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wueuw-00000001kEP-40s7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 23:33:00 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-84e01a62d99so386777b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786663977; x=1787268777; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfsw3dCbG2eROZ65PkHFv78AeM3AjkoQEz/YIwe6msI=;
        b=PteLnNzlTxVEYBT3O6UmW7ISzxd+FxAygxyx3SGSDYd2S9tYxhtYpGl+jQYN4c7WPf
         L70noQ2y6+xCHti53lKKlPRAYAwK4+g3v+7XSQOuiVJOerEI9ACDJxyZe9PHnklK9j39
         XiCabLMrinLx2idUVUCxddW75KNyAaNeL5Pu8Zey62QZHuhkZACz+kbmHPNF0VcNl7PJ
         PY72iv6GXcVc8f2QQDXHJJrzgxE6mUWXfpoOR7k6etECm/FNq1DMGMERilHxIpbzzh9K
         JU2ljLNzhfn5KziXZloPmJlklTvq2bO9wBqHwUQhqH4NgzFeNaibnmuhXLN6JQKzj2c1
         Ygcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786663977; x=1787268777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nfsw3dCbG2eROZ65PkHFv78AeM3AjkoQEz/YIwe6msI=;
        b=J8t2l6Yb+qDJeo/B4Cm2DeuIW4fyGO1uBQbEkQGfEXjgJn4m9PSGCtjmK69Lk5C1Ez
         btOJ1WKttugU2BElpKPHRxMSwmqtU5f4RNXB93fwawzYeMaVuz5hk7JVTgThKIIGwoEy
         oswV12ihqFwoJLrJIYqCTwSfR1JYjwnS3PkGslRLUe2alXbgiVIrmR1TK2eAwOKurjQO
         eGVvB32VJge5Gpla0/VLgKy9vUEFF/BjCYdD5WMrizFIWXF8KIlyzcX8KfwO1ntDiTkw
         VjGnqwiJgx4CAScd5FqFMixxLWd8dusr3+u37Oz+6pTm/1mtPe5Mh18Op8uZxpAKr89w
         5ORA==
X-Forwarded-Encrypted: i=1; AHgh+RrwrymJGC3PhX22BloVN8SAhfniCEBoIUVOt84UV+PFd+SCv8+xnki7VdnRLNkpFput+tIWKIn5nvE1O1B0QHeP@lists.infradead.org
X-Gm-Message-State: AOJu0YyedwsssT3vnmUdckK2/wTi48PpzXqMoU4WObsiTmV7PM42EqBa
	aKsnqtLmL9H8sIEqrbG0eQ3vN8wYtgvLC3xi7kVdsxZDiMn8/3hyvvn2COFrUZ6444rfVegWmyd
	mPDILxg==
X-Received: from pgch28.prod.google.com ([2002:a05:6a02:509c:b0:c9a:ffcc:19c8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ab0b:b0:845:ebbf:e7be
 with SMTP id d2e1a72fcca58-84fde2c543amr1679491b3a.23.1786663976531; Thu, 13
 Aug 2026 16:32:56 -0700 (PDT)
Date: Thu, 13 Aug 2026 16:32:55 -0700
In-Reply-To: <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com>
Mime-Version: 1.0
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <akxOrMnlNga-vtQv@google.com> <ak0wSQ1133O7B96D@raptor> <ak0ziUcCXUlDdcla@google.com>
 <ak-EKSslAz1uqEtv@J2N7QTR9R3> <ak_wC4Q-mQe14DI8@google.com>
 <alDI1b8fC99SG4_a@J2N7QTR9R3> <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
 <an3sEiQlIuGEjUur@raptor> <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com>
Message-ID: <an5UJ4S_P1LUFmzD@google.com>
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
X-CRM114-CacheID: sfid-20260813_163259_000438_80361690 
X-CRM114-Status: GOOD (  33.91  )
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

On Thu, Aug 13, 2026, David Hildenbrand wrote:
> On 8/13/26 18:09, Alexandru Elisei wrote:
> > On Mon, Jul 13, 2026 at 04:11:57PM +0200, David Hildenbrand wrote:
> >>> Yeah. I agree (with the caveats you mention). Arm folk need to go figure
> >>> out if it's worthwhile to support with all those caveats.
> >>
> >> Right, disabling migration (once gmem supports it) was also what I discussed
> >> with Alexandru when that topic comes up.
> >>
> >> How to communicate to gmem that it wants these fixed mappings is a good question.
> > 
> > There's already a proposal for how to do this in the migratable guest_memfd
> > series [1] - it's a new guest_memfd creation flag that disables migration.
> 
> In the guest_memfd call I was arguing against the flag in the first version, and
> instead adding it when actually required.

Ya, right now a flag is meaningless.  Telling guest_memfd not to do something it
doesn't ever do...

> I was also raising whether KVM couldn't tell guest_memfd (e.g., at creation
> time?) that it supports a CPU feature that requires S2 to be always mapped to
> disable migration.
> 
> It would then be a contract between KVM and guest_memfd without user space
> having to be involved on that level.
> 
> > With Sean's comment that he expects swap/reclaim to be fully userspace
> > driven, I believe that would be enough to guarantee on the _kernel_ side
> > that SPE will work as intended for a guest.
> 
> That's my understanding.
> 
> > 
> > I'm a slightly concerned though that all of this will work by chance, and
> > not by design, and in the future the behaviour might change to allow
> > guest_memfd memory to be unmapped from stage 2 without the VMM or KVM
> > explicitly allowing it or initiating it.

Meh, TDX on x86 already has the same requirement.  Unmapping a page from the S-EPT
kills the VM unless the VM was expecting the page to be lost. 

> Thus my idea of the explicit contract between KVM and guest_memfd. Instead of
> being a "this doesn't support migration" it would be a "S2 always mapped"
> kind-of contract.

Who would that contract be between though?  KVM can tell a guest_memfd instance
that page migration is/isn't supported, but telling guest_memfd that the VM will
always keep the entirety of the guest_memfd mapped in stage-2 is nonsensical.
guest_memfd simply doesn't care if the page is mapped or not, it only cares if
migration is supported.

> > My understanding from the conversation so far is that the plan for the
> > future of guest_memfd is to support an option/mode where the memory is
> > effectively "pinned" at stage 2 (but which allows userspace to explicitly
> > free/unmap it, of course). Is that correct, or am I being overly optimistic
> > in my interpretation?
> 
> We could then even disallow fallocate() to punch holes if that contract is
> negotiated.

Why?  If userspace pulls a stupid and kills its guest, that's userspace's problem.

KVM would also have to block memslot changes, and probably other things in the
future that would unmap stage-2 in response to userspace syscalls/ioctls.

