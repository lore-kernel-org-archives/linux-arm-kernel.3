Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49704C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaREvBP1gg2ufa+OsQJIcco6qjp0ITtDsYsM/CE0YBo=; b=lipw6KlpKFtksv2Zu7xsWVeI+7
	HifaGLOdmarzRHUYdJy2+NULXlna+TEscs07lT4xsRBZKgpYlNZpiWRLqVNwBG5XVy9i3Hvwhhz3s
	QqZ/1q3bJJY3HPEc1ahXwR/vhCLqvDgkTMrzSGlXvQqrhJauT5t+wcQJ5LJvEbo9v8wwn/Kit7d7Q
	Nb357GC9Cw2Ki0AgCJzgMhx+zPmFFpURnmMTutFwbrzKpIcHhWDJsK1Vn5wijzTTJ3IrYTTh9WTHE
	uuZw4VC6An6txPUGGMUG5zkbU7OaXkCNfP541Kh/2jDMWl4QKhII5HboZlxyHtxZkSMFgG4r1hZXi
	O0b+Swyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJHv-00000009v9f-3IMX;
	Mon, 13 Jul 2026 16:13:47 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJHs-00000009v99-3hk3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:13:46 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-8482fd61e83so6647026b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783959222; x=1784564022; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaREvBP1gg2ufa+OsQJIcco6qjp0ITtDsYsM/CE0YBo=;
        b=AaD1CbbmqgU5Isu/FX5CU8jT2X0vJfxj8RRUU+QQuiQNfrDHZu1M8LuEyu3pdccinE
         sqnJZJagNH213CelQzhvEyHsWcxuGRZip+Ex/TB2YPuOc4x+zw6TrHojVt0ZKb04woom
         WhQ43pd6c5bAFM5Z/Lc/NOfRyQc+zRR2YFm1XCNV6Xd3ogYyZNx0rkK15NcenR7hvm5m
         e9wGv6BBFbBa6uRQnXxSYpyrk4j5Tw6edi6o8nQxYqlL+wQb+5rYPkY5FErQ0w1frc/3
         2Uh36ClFRs/NeaJtDEHpL+OLgiiNhHpKtFv5QcMhLIrrWzy7DkhC86OrbYScsZD68R5n
         Q6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959222; x=1784564022;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaREvBP1gg2ufa+OsQJIcco6qjp0ITtDsYsM/CE0YBo=;
        b=L6zKo03cmbxgZ1DrCYDFGkKKOj+HmNHKS/oKYxmu3OjUal2WbKgPNBC2N5MwA23CAk
         AJTz7Y/JWTBkWA8uVKNnDGG83jop2k+B5vtPctahkwKtQz2EE+dcoGvC2hSEFLvq01Qn
         K/OvBuxbbb+xkdcpr8Qf7BkT8lrm28MhSH9zVFZ+2SLDk6hLrkL9hUJaBaeAwp+MoyKf
         QPYNpWQAv6XvLJ1AVqZP8vq4bTM3yg3h9m+nzcq0o9IcUOVleo6XKLBWLcUoeRU3fv0Z
         PM3rPVlEjlDV+jtFdmlKVjpE7bkA2U40eaWLUZ4pgyyNqb88SpO9KPxjCLnEAvOpvhz8
         vHbw==
X-Forwarded-Encrypted: i=1; AHgh+RrjzUL5nQ5hK9L5e0Mb5u8gM3/wfteFeq6A0xPFemRjxO7uUREm0ntxC5uo0oSs2sX7xfAiN5eNmqJSUxrc81Bk@lists.infradead.org
X-Gm-Message-State: AOJu0YwD6+8sUZP54bFDmZ+8j6+P9P0FgyWxfGehIHUmr2He/2OsN5fI
	Znz45oyWCnNvu6leqTBPhlXBweX+GSmeVUqgJAQhxfGHX/t/AjtoX/h4u/2+ac93KO8sZwMRohE
	gqeaeYg==
X-Received: from pfbkq19.prod.google.com ([2002:a05:6a00:4b13:b0:849:145f:7ff1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3021:b0:842:4b88:20ee
 with SMTP id d2e1a72fcca58-84889721d40mr9009472b3a.44.1783959221968; Mon, 13
 Jul 2026 09:13:41 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:13:41 -0700
In-Reply-To: <8c0c099d-47aa-4bf0-ab7a-c682b0dccdf5@arm.com>
Mime-Version: 1.0
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
 <20260702142912.6395-2-alexandru.elisei@arm.com> <akwhexqW66RK5Gru@google.com>
 <ak0x0QIWWw6lFUiy@raptor> <8c0c099d-47aa-4bf0-ab7a-c682b0dccdf5@arm.com>
Message-ID: <alUOtUEe3EW1NlqI@google.com>
Subject: Re: [RFC PATCH 1/3] KVM: guest_memfd: Use memslot id to keep track of
 associated memslots
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david.hildenbrand@arm.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev, mark.rutland@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091344_926558_B9970E37 
X-CRM114-Status: GOOD (  31.27  )
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

On Mon, Jul 13, 2026, David Hildenbrand wrote:
> On 7/7/26 19:05, Alexandru Elisei wrote:
> > Hi Sean,
> > 
> > On Mon, Jul 06, 2026 at 02:43:23PM -0700, Sean Christopherson wrote:
> >> On Thu, Jul 02, 2026, Alexandru Elisei wrote:
> >>> To enable memslot operations, KVM maintains two arrays of memslots, and an
> >>> RCU pointer to the active (in use) array. Changes are made first to the
> >>> inactive array, and the RCU pointer is updated to point to the inactive
> >>> array, which becomes active.
> >>>
> >>> The guest_memfd file maintains an xarray of pointers to memslots that use
> >>> it as the memory provider. After the RCU pointer to the active memslots is
> >>> updated and until SRCU is synchronized, readers can observe the old or the
> >>> new value for the active array, and therefore the old or the new pointer
> >>> for a given memslot.  For memslot creation or deletion that is not an issue
> >>> for guest_memfd, as readers will either read the same memslot pointer saved
> >>> by the guest_memfd file, or a non-existing memslot.
> >>>
> >>> But when changing the flags for a memslot, readers can read two different
> >>> and non-NULL memslot pointers. 
> >>
> >> And?  Why does that matter?  KVM memslot updates aren't atomic.  Practically
> >> speaking, they _can't_ be made atomic. Userspace is required to quiesce all
> >> activity that must not observe inconsistent state, i.e. userspace must pause
> >> (stop running) vCPUs when performing a memslot update.
> > 
> > Is that true when KVM_MEM_LOG_DIRTY_PAGES is toggled for a memslot?
> 
> Good point.

Oh, right, that's "fine" because there's never an intermediate state where there's
an INVALID_SLOT.

> > As far as I can tell, KVM today tolerates VCPUs running while the
> > KVM_MEM_LOG_DIRTY_PAGES flags is being changed for a memslot. And by
> > tolarate I mean that VCPUs that are running when the flag is changed don't
> > return an error from KVM_RUN. If changing a memslot while VCPUs are running
> > were fatal, I would think that KVM would want to take vcpu->mutex for all
> > VCPUs to keep them from running. Or is it a case of KVM allowing userspace
> > to shoot themselves in the foot if they really want it?
> > 
> > When the KVM_MEM_LOG_DIRTY_PAGES flags is being changed, VCPUs handling a
> > guest fault can observe either the old memslot, with the old flags, or the
> > new memslot, with the flag changed, but they still continue running without
> > returning an error.
> 
> Staring at QEMU, kvm_log_start()+kvm_log_stop() do not call
> accel_ioctl_inhibit_begin() etc.
> 
> So at least QEMU does not force VCPUs out of KVM when only updating flags.

Yeah, as above, that should work, and KVM needs to maintain that support.

> One option would be to require user space to do that also when starting+stopping
> dirty page logging. (I'd assume that should work, but it might be tricky
> depending on in which context it is called from QEMU migration code -- whether
> we hold the BQL)

