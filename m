Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5692C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaU6PgQH9SUVRtzx3SN8O7eufPpN9+OcuRfvjznD5/4=; b=cR2Btg8yrh5PD2H8t1ezb+oj7A
	biQZUyBAxPPzIJuv1IkCTs3tHAzmVGtNNaVXutGkLM/OMoVcYFBwM7GDbXP6kf5mvqpPOTshv1KEn
	q+tx8VEy/vYCQEVseuBpejlLm1p4/Ncb+k34jvi8v85XnCcN0ZCJzYea6JNEYQgVUzFIxEClEeklK
	9cG0aopbhbvqWXLZrXEGxeHv/X8608w0fArialFFsHDM5MhVIYrkwGkGS87baNDMgpqKRzvCKquHz
	n/omrX5o/Vj7+OzcmHHDVypn849KQU4H0G5049B/B6hyf8c1XlPH0xYqKt+ph2BdbK14OFkoJQJPK
	X02mG6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwihz-0000000A8al-2UVy;
	Wed, 19 Aug 2026 16:00:07 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwihw-0000000A8Zi-19JD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:00:05 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so1292583a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787155202; x=1787760002; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaU6PgQH9SUVRtzx3SN8O7eufPpN9+OcuRfvjznD5/4=;
        b=Uh+mjCBSXAjN31OmcAAHTeD4j9UKkezxki2vF0Bbcghq6D82F6uRt8qHpjH8Wn5CfD
         gu1nG2wTWDbfPe09yhvr9gY6isiBCYbioFYocDz+ZDGUczoAO/4Xk/Jt7t96G2U0ETdb
         ODjzLJ3gt9q3irGrqLKX5Zg8EzsjXTLtqBHsx1vRqJin1kmepNvfFwQEBqj/37QrC7gj
         b0ej3qMglupJHptAVlAJTQwfh02P7ABgJISOex7gPQMfVxy/3n0q2I9yXZUcibEbPKTu
         5p4Rje6qcZMYZeaW98P6r3vr/1VSap0mXXI7BhRtCJLeq/tH0riXMcprOrlJ5DOHAqu/
         YuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155202; x=1787760002;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaU6PgQH9SUVRtzx3SN8O7eufPpN9+OcuRfvjznD5/4=;
        b=OWfQLRvSIirVrU5n0oz8p6fR+4MC5lJytLMKUDR+xEGCcyKvpWiBVcfdezCnEf7o28
         iMbgcwLcUbVI85C8+LKzpXIQca1fBpk/AroivSFzWaqliK8x9PuRPjTClhg0i+l/15lb
         J3knB4jYjYyJOGiuIr/XyaO1tqb0ZKe11jefGSQaODagFHg17oVl3ONCwm57kpefFbV2
         A0DhBFRaIb+G/lZRQLoORxOrP4N3sqe6jFYv0NyyHM90BZ52ZRyf268S2Xdw5f8sG7/+
         rVSto4K7xkA0aIrYVc/oGYkv6BMlsQ4KfX/rS7rOzrjN1OUjowFn/yuwXHABY64je413
         32KA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7EIgdLqpf1YKtg9BEbzu12169O7HGo54QX8FMrL4fKtigxhfHKgvvP1ZS4CU66TVWREzP1R+JfacEbZomFKTq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3hX30rOmCgk0Ux5jMHkGaOZkoiWuAh2vNLR5yKG7j1Qc8xWu3
	DB/hhejsMfL64D+Dxm9jzjOmWPsNXrkssdzLXy+cg1O5X15rUH39MCkxzyvczJIkYn8VVdZm5pd
	Q7nEM+w==
X-Received: from pgch14.prod.google.com ([2002:a05:6a02:508e:b0:c9a:53ea:434a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:2285:b0:3bf:49c8:f7b
 with SMTP id adf61e73a8af0-3cd017c44afmr12092360637.13.1787155201847; Wed, 19
 Aug 2026 09:00:01 -0700 (PDT)
Date: Wed, 19 Aug 2026 09:00:01 -0700
In-Reply-To: <7f52191f-c6b5-4d27-8e11-2c00bd9de968@arm.com>
Mime-Version: 1.0
References: <ak_wC4Q-mQe14DI8@google.com> <alDI1b8fC99SG4_a@J2N7QTR9R3>
 <a127176a-1722-460c-aa84-754e1d343f53@arm.com> <an3sEiQlIuGEjUur@raptor>
 <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com> <an5UJ4S_P1LUFmzD@google.com>
 <487aa57c-72ad-453b-971d-ca24a8380429@arm.com> <an8SOvLybeilzCEU@google.com>
 <an9JNUln8dKaidQc@raptor> <7f52191f-c6b5-4d27-8e11-2c00bd9de968@arm.com>
Message-ID: <aoXTAdnEcKJ8-Ft_@google.com>
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
X-CRM114-CacheID: sfid-20260819_090004_363901_B972C2CA 
X-CRM114-Status: GOOD (  38.68  )
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

On Wed, Aug 19, 2026, David Hildenbrand wrote:
> On 8/14/26 18:58, Alexandru Elisei wrote:
> > Hi,
> > 
> > On Fri, Aug 14, 2026 at 06:03:54AM -0700, Sean Christopherson wrote:
> >> On Fri, Aug 14, 2026, David Hildenbrand wrote:
> >>> We have a hardware feature that requires pages to always be mapped into S2. Some
> >>> things I had in mind:
> >>>
> >>> 1) Page migration would not be a problem as long as hardware could be paused
> >>>    while migrating (e.g., kick all vCPUs). I doubt someone would implement that
> >>>    right now,  but you could consider it an implementation detail that page
> >>>    migration cannot be supported right now.
> >>>
> >>> 2) Newer hardware could mitigate this problem, allowing the feature to support
> >>>    pages temporarily being unmapped from S2.
> >>>
> >>> 3) Disallowing page migration is really just one implication of "pages must
> >>>    always be mapped into S2".
> >>>
> >>> So what we really want is "if feature X is enabled and hardware requires it,
> >>> always keep pages mapped into S2, which currently implies that page migration
> >>> cannot be supported."
> >>>
> >>> Which isn't all that different to "if a confidential VM is run on current TDX
> >>> hardware, always keep pages mapped into S2, which currently implies that page
> >>> migration cannot be supported."
> >>>
> >>> So I was wondering whether the flow could be:
> >>>
> >>> User space enabled CPU feature for VM -> KVM knows that current hardware
> >>> requires for that CPU feature to have S2 always mapped -> KVM tells guest_memfd
> >>> that S2 must be always mapped / disables page migration.
> >>
> >> I'm a-ok with adding a flag to guest_memfd to communicate whether or not page
> >> migration is allowed, because guest_memfd needs to actively support page migration.
> >>
> >> I'm not ok adding a flag telling guest_memfd that memory must always be mapped
> >> in S2, because guest_memfd doesn't care.  E.g. KVM doesn't yet support page
> >> migration for SNP, but SNP tracks page ownership in an out-of-band table and so
> >> KVM can map/unmap all guest memory from S2 at will.
> >>
> >>> That would be in contrast to user space having to guess that page migration on
> >>> the current hardware with the current guest_memfd implementation does not
> >>> support page migration, to then disable exactly that.
> >>>
> >>> Does that explanation makes sense? I don't know the exact mechanism to do that,
> >>> but that's just my high-level thinking.
> >>
> >> Yes, I'm supportive of KVM expressing to guest_memfd that page migration isn't
> >> supported by the VM.  I'm only objecting to expressing that memory must stay
> >> mapped in S2, because guest_memfd doesn't care *why* page migration is or isn't
> >> supported/allowed by a particular VM.
> > 
> > My naive contribution is this idea I had:
> > 
> > 1. Userspace queries support in KVM for feature xyz by checking the
> > capability KVM_CAP_xyz.
> > 
> > 2. Userspace knows that for feature xyz to work correctly, it is required
> > that memory remains mapped at stage 2.
> > 
> > 3. Userspace creates a guest_memfd instance with the right combination of
> > flags set and _unset_ for feature xyz to work correctly - i.e, to keep
> > memory mapped at stage 2.
> > 
> > For this to work, new guest_memfd features that might lead to memory being
> > unmapped are enabled via a flag, and KVM keeps memory mapped at stage 2 by
> > default, to maintain compatibility with an userspace not updated for the
> > new features/flags.
> 
> I was wondering whether KVM could be driving that setting in guest_memfd, with
> less userspace intervention.
> 
> 1. Userspace enables support in KVM for feature xyz through
> capability KVM_CAP_xyz.
> 
> 2. KVM knows that the feature, on the current hardware requires permanent S2
> mapping, so it instructs guest_memfd to disable any features that could lead to
> a temporary unmapping (e.g.,migration support).

Yes, that's what I would like to aim for as well[*], with the understanding that
things may not play out exactly as we want if/when we actually implement all of
this.

 : We might make guest_memfd page migration opt-in, but if all of the incompatible
 : setups can enumerate their existence prior to creating guest_memfd files, we may
 : handle it all automatically, e.g. enable page migration by default, but disable
 : it if a TDX, SNP, pKVM, or SPE-capable VM is detected.

[*] https://lore.kernel.org/all/an9oR3dBVgFs7j7q@google.com

