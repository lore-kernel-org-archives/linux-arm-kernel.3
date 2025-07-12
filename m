Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA1DC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/KO7cxY55TZXEuxm/aJMlnOT2I2d5MUZFj4P6QELUY=; b=AOukpM2xOnc3k6z6BQ9GAH+b1s
	iHQUl4CRP5Rzu2JhAbxG0RwB4mEcPOHO4RAOln8SLBtqIu2x/n2wNrcbSohN6H7QcUkV/IUQlDRLL
	0luussddz6NbM6uCGUpx1ahDGRv8iY2yUKgH4SeprnphIN75M8GIWsRswSWU1ft3lmiPY1zq1IbFd
	7ETe20WIG/L8x+y0/0uCEPue5R14Nzu9DQTjYc5RFwOvEkz6YZZDLIP+lGXSQ10bidRSIrpNgIcok
	my1qeL2zJbHvTSTAqhN841Ibzh8NhQg+F4mkMhTFvTbYW+cTkw9ikdkIOzpPNvsWA0mTppdt2Y2cb
	T9ANHC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagEV-0000000GxKy-1JID;
	Sat, 12 Jul 2025 19:50:03 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagC6-0000000GxCn-1G5i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 19:47:36 +0000
Date: Sat, 12 Jul 2025 12:47:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752349649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/KO7cxY55TZXEuxm/aJMlnOT2I2d5MUZFj4P6QELUY=;
	b=Ri65r+c54bI2Dx0vVIuVeDzldrENr3nFiK2CbHP8HII66ewc/paI3WssyPiPfNrGcdB//4
	Z14A96Kb4SwBP+zq6/FtDPWBPhETyDJXYfATv3PnpWMTj34Qn4ihFcM7hWAG6/gm0+ONYp
	AgolM6pN6cUvnHKnZ+EXg6jN/91qaTg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Subject: Re: [PATCH v2 3/6] KVM: arm64: Allow userspace to inject external
 instruction aborts
Message-ID: <aHK7w4TTEm7a1mco@linux.dev>
References: <20250604050902.3944054-1-jiaqiyan@google.com>
 <20250604050902.3944054-4-jiaqiyan@google.com>
 <aHFpIpIfqVCQZVgG@linux.dev>
 <CACw3F51xRWr5LXz4-JhK+mjizY7D7Oa+GrJ-OZHktfPzFGKeiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACw3F51xRWr5LXz4-JhK+mjizY7D7Oa+GrJ-OZHktfPzFGKeiw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_124734_780770_7561414E 
X-CRM114-Status: GOOD (  25.33  )
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

On Fri, Jul 11, 2025 at 04:58:57PM -0700, Jiaqi Yan wrote:
> On Fri, Jul 11, 2025 at 12:42 PM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > On Wed, Jun 04, 2025 at 05:08:58AM +0000, Jiaqi Yan wrote:
> > > From: Raghavendra Rao Ananta <rananta@google.com>
> > >
> > > When KVM returns to userspace for KVM_EXIT_ARM_SEA, the userspace is
> > > encouraged to inject the abort into the guest via KVM_SET_VCPU_EVENTS.
> > >
> > > KVM_SET_VCPU_EVENTS currently only allows injecting external data aborts.
> > > However, the synchronous external abort that caused KVM_EXIT_ARM_SEA
> > > is possible to be an instruction abort. Userspace is already able to
> > > tell if an abort is due to data or instruction via kvm_run.arm_sea.esr,
> > > by checking its Exception Class value.
> > >
> > > Extend the KVM_SET_VCPU_EVENTS ioctl to allow injecting instruction
> > > abort into the guest.
> > >
> > > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> >
> > Hmm. Since we expose an ESR value to userspace I get the feeling that we
> > should allow the user to supply an ISS for the external abort, similar
> > to what we already do for SErrors.
> 
> Oh, I will create something in v3, by extending kvm_vcpu_events to
> something like:
> 
> struct {
>   __u8 serror_pending;
>   __u8 serror_has_esr;
>   __u8 ext_dabt_pending;
>   __u8 ext_iabt_pending;
>   __u8 ext_abt_has_esr;  // <= new
>   /* Align it to 8 bytes */
>   __u8 pad[3];
>   union {
>     __u64 serror_esr;
>     __u64 ext_abt_esr;  // <= new

This doesn't work. The ABI allows userspace to pend both an SError and
SEA, so we can't use the same storage for the ESR.

>   };
> } exception;
> 
> One question about the naming since we cannot change it once
> committed. Taking the existing SError injection as example, although
> the name in kvm_vcpu_events is serror_has_esr, it is essentially just
> the ISS fields of the ESR (which is also written in virt/kvm/api.rst).
> Why named after "esr" instead of "iss"? The only reason I can think of
> is, KVM wants to leave the room to accept more fields than ISS from
> userspace. Does this reason apply to external aborts? Asking in case
> if "iss" is a better name in kvm_vcpu_events, maybe for external
> aborts, we should use ext_abt_has_iss?

We will probably need to include more ESR fields in the future, like
ESR_ELx.ISS2. So let's just keep the existing naming if that's OK with
you.

Thanks,
Oliver

