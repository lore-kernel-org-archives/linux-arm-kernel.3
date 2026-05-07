Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CF9CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 13:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAslfbD1ot428d19C5gk7U0ODS9evh/h4+t//ujFJsg=; b=44OJGJ4ehV4JUbfBWC1RfWOWjF
	IaTBNYUmclqSBFiNrYJ0w2icL3K5PZfvH9gvBcd2O7/Ux1BpmpgupU/ThNlQdG0KU7RXb3kZwX0LU
	wFQa4peTlV+305EWCbl07p4LVWM/d2M9mPYf46F7mde+vAJ/3U0PCmS+N2q5JXcC5P2QC9XTGp/sb
	ExdqCznkcAQwLUUcu3C9s6KaVAoiK33wmxou/vy26X17AjZaFiZ50EYdRnWcOiu6StFW8YB4OQdlI
	ZrKoxKaqkRFKrZv6ZuUrJWyJTL4nFS0mRbgeod4+4TGxcRbvYaBVmLRi34aBMeKEaj4MYjIWzCZtB
	ZeTG/WxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyql-00000003umA-0L3F;
	Thu, 07 May 2026 13:33:11 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyqj-00000003uke-03Yx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 13:33:10 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2babbeff9e4so9532205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 06:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778160787; x=1778765587; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAslfbD1ot428d19C5gk7U0ODS9evh/h4+t//ujFJsg=;
        b=Ck4D0mM9kgzthNrxxRfer3e231jpejKnV3HFnMSF57ryQIOsrvX3QYlHu0KNyyvoMu
         JZa5I5PEyVkZTXcWEgKotEVyW1AnQ5Jm3N1MHnb10ssNCIxoN5lNSHv9wID8rxGItS07
         Jmd7RyGBjyzs8nytH3sA1PmCkdDE3AXwScC9+nftZHVgwGcd1drlcF1wJ2r0LSMo0fTw
         R/Mvh7CDB+1guexOYNR0xJvyIZ3QpLj8QNkik/CzggzT3FuBY6+6E7UZjuTLTmuZ/Z1i
         z2wUKTSujXTnYayZQfDGSjPn68Xn9hFZ2eTzSzMJiA4WzCXZj9vKJN7gQ1/3cv8SCPJf
         CpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160787; x=1778765587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAslfbD1ot428d19C5gk7U0ODS9evh/h4+t//ujFJsg=;
        b=W1KCifaGmXLDFHeFwPQonY0+H7FkXSpCH7vqFBj2TkidYdPeIP5zHLxBVCCrMLAWuT
         iib+Kbg0HmnBFn3y7UN7VW3PwTmg99al/GJ7S8p2zKXdGjWOfu2qa0Dq6ZjZbzVYb6O+
         7xyoVkCyqzGZY7DyAaNbk9MRvXar8eY2RFSyZfAMrYXQ+1IjWqVz8eZqXbr1OnVxShH8
         3BhaAMRhwU10a549Rv7KpjHnP6Ddrf/82Qto9t2XshNfvumhVVMUdVZTxMTVBXG4J8d9
         opZipvSCP/WMddLGKYVhY9bSdul0BHwYaBkHgNeaIILfsn7Gn+DrEQamFscF1ujztefc
         4tYA==
X-Forwarded-Encrypted: i=1; AFNElJ+aDOtNndqyDB8Ice0Hc+P2ZI9SBVJEpHMqeiaJ1hGuJsOg5hkqeJlQAMPBIoRb4wS0Ev57b9OKl8iYYh/JDiLi@lists.infradead.org
X-Gm-Message-State: AOJu0YwaqI83XbRWMZpWA70XcWn0s8iV1ltm0rg2MqHi0CrgqMKm68ZK
	JFPs0l5z4URJuelIW/C2NAvGiat7x9cQAXRsMKTyhqmAqfeHvVIstJblmICzqyhQyK9l9rCv1fr
	IMya+pw==
X-Received: from pluo3.prod.google.com ([2002:a17:903:4b03:b0:2b4:62bc:c2a9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ad0:b0:2ba:b6a:41bf
 with SMTP id d9443c01a7336-2babc858e7fmr28026925ad.3.1778160786506; Thu, 07
 May 2026 06:33:06 -0700 (PDT)
Date: Thu, 7 May 2026 06:33:05 -0700
In-Reply-To: <afxROjBUVzeQQNfg@raptor>
Mime-Version: 1.0
References: <20260506105053.107404-1-alexandru.elisei@arm.com>
 <afs3wp7xBUf2jYK4@google.com> <afxROjBUVzeQQNfg@raptor>
Message-ID: <afyUkaQ1wtivyH8W@google.com>
Subject: Re: [RFC PATCH] KVM: arm64: Align KVM_EXIT_MEMORY_FAULT error codes
 with documentation
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	tabba@google.com, David.Hildenbrand@arm.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_063309_058135_7FA5FB86 
X-CRM114-Status: GOOD (  30.72  )
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

On Thu, May 07, 2026, Alexandru Elisei wrote:
> Hi Sean,
> 
> (Resending this because I managed to mess up the headers, sorry for the
> duplicate).
> 
> Thanks for the explanations!
> 
> On Wed, May 06, 2026 at 05:44:50AM -0700, Sean Christopherson wrote:
> > On Wed, May 06, 2026, Alexandru Elisei wrote:
> > > The documentation for KVM_EXIT_MEMORY_FAULT states:
> > > 
> > > 'Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that
> > > it accompanies a return code of '-1', not '0'!  errno will always be set to
> > > EFAULT or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace
> > > should assume kvm_run.exit_reason is stale/undefined for all other error
> > > numbers'.
> > > 
> > > where a return code of '-1' is special because according to man 2 ioctl:
> > > 
> > > 'On error, -1 is returned, and errno is set to indicate the error'.
> > > 
> > > Putting the two together means that the ioctl KVM_RUN must 1) complete with
> > > an error and 2) that error must must be either EFAULT or EHWPOISON for
> > > userspace to detect a KVM_EXIT_MEMORY_FAULT VCPU exit.
> > 
> > Yes and no.  The key escape valve we (very deliberately) gave ourselves is this:
> > 
> >   userspace should assume kvm_run.exit_reason is stale/undefined for all other
> >   error numbers.
> > 
> > As arm64 already does, that clause allows KVM to "speculatively" set exit_reason
> > to KVM_EXIT_MEMORY_FAULT.  Which is by design.  The userspace flow is intended
> > to be "if KVM_RUN returns EFAULT or EHWPOISON, then check for KVM_EXIT_MEMORY_FAULT
> > to see if KVM provided more information about why the EFAULT/EHWPOISON error was
> > returned".
> 
> Hm... In general, "speculatively" populating exit_reason with
> KVM_EXIT_MEMORY_FAULT when userspace is not intended to use that information
> looks a bit dubious to me.

Oh, for sure, it's not exactly ideal.

> Why do the work if userspace is not supposed to use the information?

Because not filling kvm_run when KVM is supposed to (per KVM's contract with
userspace) would be a bug, whereas unnecessarily filling kvm_run is "just" wasted
cycles (and not very many of them).  x86 also has multiple flows where it fills
kvm_run "speculatively", e.g. in low(ish) level helpers where it's not known if
KVM will actually exit to userspace.

Overall, for code like this, IMO it's also yields less complex KVM code, though
I suppose it can also end up being more confusing for readers.

> Regarding gmem_abort(). As I see it, if today someone writes userspace that
> relies on any of the undocumented error codes propagated from kvm_gmem_get_pfn()
> to handle KVM_EXIT_MEMORY_FAULT, that means that KVM can never use those error
> codes for any other exit_reason in the future, because that userspace will
> break.

Hmm, if we wanted to defend against that, we could scribble kvm_run.exit_reason
on the way out of KVM_RUN, e.g.

diff --git virt/kvm/kvm_main.c virt/kvm/kvm_main.c
index 89489996fbc1..76801d103dd9 100644
--- virt/kvm/kvm_main.c
+++ virt/kvm/kvm_main.c
@@ -4475,6 +4475,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
                 */
                rseq_virt_userspace_exit();
 
+               if (vcpu->run->exit_reason == KVM_EXIT_MEMORY_FAULT &&
+                   r && r != -EFAULT && r != EHWPOISON)
+                       vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
+
                trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
                break;
        }

I don't know that I'm convinced that level of paranoia is worth it though.

> I'm sure this was all carefully considered when designing the interface, I was
> just curious how this particular problem has been solved.

Heh, I like to think we carefully considered the interface, but thinking of every
possible way userspace can be silly is hard :-)

