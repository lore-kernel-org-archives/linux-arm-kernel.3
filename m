Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD054CFD625
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0NeZC/pHEtlRh37aQj6dDTMwXa5LfzwEtbGEIHtFjY=; b=FQH1FSdHmLf5kN5GCKVCPJ3478
	LJwYXoGSgGTPhsRaxcDLuROnr61PnSb1qvlQFmHyPa21SvnWVe++/QIwU3poWQv6FPf5P9GBB9jhK
	wLUjjYofTOR6JtWgyC9CvvEou5KORJJL0X47wT2n/QegrDXV27c1a8I6S6kK4HYYZDCJfnR4hD6ke
	SNAcKCEX9ZS2H1tuhO0tn0LOzC21ZTLnIBmc1XqMRLWNiqXqcSLdehsqe58BzEqNH6mm0Wudc7mOY
	pMGK74iG+KQQU/6m95xsQIahlRN7iYFkqjiWuR2CE9LXu3Y/anUdtIxf6zdhb1s4s9kFSjhB/Towl
	XaPIBVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSxm-0000000EvTq-0Own;
	Wed, 07 Jan 2026 12:48:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSxl-0000000EvTg-0SeE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3C7560053;
	Wed,  7 Jan 2026 12:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDB2C4CEF7;
	Wed,  7 Jan 2026 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767790111;
	bh=c/HpMKil4LDUjoIp/ILJnH3Hu0rasSC2VibPeOS9My4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sk1YYJkxtmSEHqfW/Eujcd7Gp5imBFvnC7aVVhamxlpivL0Lp6kQI9MVVqDrrLZdd
	 EWGM+13g1z1D8V45W2TxLBJtENi6/WUTwC4f2TdAqUPlg8aVvQhO3uClTpk5jj9a4c
	 xi7vrRPbWBq2Sqluu5rk10y2OdAn51/ZhgeBRis18TEsfNi0aKoCyLu4ANrbf/UwFW
	 +XRHfs0FFUgMQO71X0Yrss/ewy7iclNxEcCcppjQv4kD/jDigaHfrbVsbEOUBZO+yN
	 4zb9A2uyPc+0+lvlyxn0EMz1JofE56TDF5B3yG4aM4ljwTyXmACAgiWWgQm3xzhIMS
	 xjYwyPtKjQTLg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com,
 lyude@redhat.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, frederic@kernel.org,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
In-Reply-To: <aV5IwaxcIF4XJvg3@tardis-2.local>
References: <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
 <20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
 <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
 <aV5IwaxcIF4XJvg3@tardis-2.local>
Date: Wed, 07 Jan 2026 13:48:19 +0100
Message-ID: <87v7hdh9m4.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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

Boqun Feng <boqun.feng@gmail.com> writes:

> On Wed, Jan 07, 2026 at 11:11:43AM +0100, Andreas Hindborg wrote:
>> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
>> 
> [...]
>> >>>
>> >> 
>> >> This is a potentially racy read. As far as I recall, we determined that
>> >> using read_once is the proper way to handle the situation.
>> >> 
>> >> I do not think it makes a difference that the read is done by C code.
>> >
>> > What does "racy read" mean here?
>> >
>> > The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
>> > would using READ_ONCE() on the Rust side make a difference?
>> 
>> Data races like this are UB in Rust. As far as I understand, using this
>> READ_ONCE implementation or a relaxed atomic read would make the read
>> well defined. I am not aware if this is only the case if all writes to
>> the location from C also use atomic operations or WRITE_ONCE. @Boqun?
>> 
>
> I took a look into this, the current C code is probably fine (i.e.
> without READ_ONCE() or WRITE_ONCE()) because the accesses are
>
> 1) protected by timer base locking or
> 2) in a timer callback which provides exclusive accesses to .expires as
>    well. Note that hrtimer_cancel() doesn't need to access .expires, so
>    a timer callback racing with a hrtimer_cancel() is fine.
>
> (I may miss one or two cases, but most of the cases are fine)
>
> The problem in Rust code is that HrTimer::expires() is a pub function,
> so in 2) a HrTimer::expires() can race with hrtimer_forward(), which
> causes data races.
>
> We either change hrtimer C code to support such a usage (against data
> races) or change the usage of this HrTimer::expires() function. Using
> READ_ONCE() here won't work. (Yes, we could say assuming all plain
> writes on .expires in C are atomic as some other code does, but hrtimer
> doesn't rely on this, so I don't think we should either)

I don't think we should change the C code, I think the Rust API is
simply wrong. The function should have same constraints as
`forward_now`, ie. call while having exclusive access to the timer
(during setup for instance), or in callback context.

We should change it to take `self: Pin<&mut Self>` and add it on
`HrTimerCallbackContext` as well.

@Tomo, do you know of any users of this function?


Best regards,
Andreas Hindborg



