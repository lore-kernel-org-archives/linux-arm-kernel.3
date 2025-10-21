Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CEDCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwrcsQ4E69ewTeWtqAZ5emGZEvWIYhFcDibNTG0FA/U=; b=OqrKiNwXfdvmf8zMysi/3uhyPq
	gf2cc3+9E+gWlNWqiDmDs11EqjANzkKHHNCqeqxkOkBJ2t739C3N3nIU8p/anqEf3LQt7DixaZnYn
	1uR0oUIvCXTVO80ETS8ksOVQbn1eWNg9VDxA2AGEhAsACMxmDgeosuoZ9xUT3upqqpdrIWY9sQBj7
	lj2Cub23G9eh5Cn5LxCYZc10LaDmlI91NFFwxovWPKGx3oAKh/tLhQlL0qWTJWsj27If4fgy+JSu5
	BmRpP9IF+mmp3DutkQ3oA8rM0Gz2WaFXBVGLnFyuM3Yv+bfne3XnQYK1sH0VGGPJGb782O4zsKHbn
	2TwLTu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEYl-0000000HZz4-36nJ;
	Tue, 21 Oct 2025 15:46:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEYi-0000000HZx7-3nPp;
	Tue, 21 Oct 2025 15:46:02 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761061557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bwrcsQ4E69ewTeWtqAZ5emGZEvWIYhFcDibNTG0FA/U=;
	b=AimhTbm/MmiU0oRMAd3uF686t3hr81Y5owQjwPt+t/EQgCKBa69nmulwgBV69DAgmeOiLs
	0dBlFvHe0CuIkLHWUhiL1t/BqksXKeOpRZ/JKO0XZ3uhW83aU/uvkv0aGEtMB3NqQYbo8T
	c1a/8lfSam1pX5DGvhcfkGXmV4x32lsZ332bnVFLI1XCKFZjiwp6KgAVuCMJQhQZ/BG1+3
	zi05GK9tLktBwlzF4YW3WSZoTogjkHwXyP3B8Tirr/2VvmwbsYu+mDsX55tIF2MT64MPBm
	xLwiGchu4C52oZGHU6/XiSveriXXJanvaLMtB2ia9NFfIw4m6RTH0hIsSxsIxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761061557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bwrcsQ4E69ewTeWtqAZ5emGZEvWIYhFcDibNTG0FA/U=;
	b=cvRNsdPSRZnlZAgeJWkp3R95tMpoJ7F1qDZZCErTmzw+alSEUX9RVLzo8yFL18BIEiQxRa
	dsntvmwnLjX8G6Dg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>, LKML
 <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
In-Reply-To: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de> <20251020192859.640d7f0a@pumpkin>
 <877bwoz5sp.ffs@tglx>
 <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
Date: Tue, 21 Oct 2025 17:45:56 +0200
Message-ID: <871pmwz2a3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_084601_081773_55F702A3 
X-CRM114-Status: GOOD (  17.69  )
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

On Tue, Oct 21 2025 at 05:06, Linus Torvalds wrote:
> On Tue, 21 Oct 2025 at 04:30, Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
>> >
>> > (I don't like the word 'masked' at all, not sure where it came from.
>>
>> It's what Linus named it and I did not think about the name much so far.
>
> The original implementation was a mask application, so it made sense
> at the time.
>
> We could still change it since there aren't that many users, but I'm
> not sure what would be a better name...

I couldn't come up with something sensible for the architecture side.

But for the scope guards I think the simple scoped_user_$MODE_access()
is fine as for the usage site it's just a user access, no?

the scope magic resolves either to the "masked" variant or to the
regular user_access_begin() + speculation barrier depending on
architecture support. But that's under the hood an implementation detail
of the scope...() macros.

Thanks,

        tglx

