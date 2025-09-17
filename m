Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106DDCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqAQXggoclFDa2Uc+OS/GnqoBV+1bK3M22kzAETucqk=; b=CuEZthsvJ2ZrrIk/f+0Y69j+bn
	seB2uXPKH1o8QUfDGyyFkYi/KbCyh4pIkA8WvTnuS72hubutjXJOlTphl1w/5LnqWsgt3cAsc7CqT
	3NOoofFHspcexy0629vowt5mYWgVo7goJW0ZCMyRx75WckHUd7gvDYXjXGyOtxaMmm96E9p01QYLw
	HnVqV7Jk7Egf7ROc2vYCN+5116uV7KPWCGiW1iEK42L9WT8qN7GBzrr4saf7CIqrF3/MQNPHidbbS
	FpZmnrxEQ8s4nl0ASFQHIi1/KEQRASu4SS9yvjb3hMaw75bTawZ3yXP2hIebIKIDTvvOlPnRcyUFK
	vAvEd6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxmI-0000000EGAO-0HRu;
	Wed, 17 Sep 2025 19:25:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxmF-0000000EG63-2KNJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:25:16 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758137111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SqAQXggoclFDa2Uc+OS/GnqoBV+1bK3M22kzAETucqk=;
	b=qkcCRMHlqbHlQ+ihneOeLgC3lXlZ2JlMNJ2yZEfGlusdIjCo0oigXFnfCKhmxcrLIaGEHC
	TKIQ5ISc7+tUerqZm4t/8qO7gz97N2i842L5viLZniXWkaSReoccFIBsqTXmkb/3rV5Eau
	YGCkQLHir6RWC9Io/b6Fffe1jWvkRW/HSDVm9tiMH0lMPsSao/U/ve2o83mgBXP+Agq2u0
	1cum3TQ5wUc1kyv4Yx/3EemOQ7wKoghENrXWUaNhRrODD5ybGPZ1Q2SVUego7OLpmaIwWX
	6eUxEcAGTMU9aquxGISRwa5aPLUkgJBmihhAkDJ1h+Y5u5+iPic+zOX6La64Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758137111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SqAQXggoclFDa2Uc+OS/GnqoBV+1bK3M22kzAETucqk=;
	b=WE8/k5UVt+1BxyiG8k75FlR6g4D3mPotvXxc1ALxIcRhOa8husqwKlI6SkcAGLdqS/znDZ
	LRpE13Qp647ioiCg==
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Nathan Chancellor
 <nathan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?An?=
 =?utf-8?Q?dr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, x86@kernel.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2 1/6] ARM: uaccess: Implement missing
 __get_user_asm_dword()
In-Reply-To: <aMrxF3AnFox0LH8V@shell.armlinux.org.uk>
References: <aMnV-hAwRnLJflC7@shell.armlinux.org.uk> <875xdhaaun.ffs@tglx>
 <aMqCPVmOArg8dIqR@shell.armlinux.org.uk> <87y0qd89q9.ffs@tglx>
 <aMrREvFIXlZc1W5k@shell.armlinux.org.uk> <20250917171424.GB1457869@ax162>
 <aMrxF3AnFox0LH8V@shell.armlinux.org.uk>
Date: Wed, 17 Sep 2025 21:25:09 +0200
Message-ID: <87ms6s990q.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_122515_732628_112BE9B9 
X-CRM114-Status: GOOD (  16.97  )
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

On Wed, Sep 17 2025 at 18:34, Russell King wrote:

> On Wed, Sep 17, 2025 at 10:14:24AM -0700, Nathan Chancellor wrote:
>> On Wed, Sep 17, 2025 at 04:17:38PM +0100, Russell King (Oracle) wrote:
>> > For me, this produces:
>> > 
>> > get-user-test.c:41:16: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
>> >    41 |         (x) = *(__force __typeof__(*(ptr)) *) &__gu_val;                \
>> >       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > 
>> > with arm-linux-gnueabihf-gcc (Debian 14.2.0-19) 14.2.0
>> > 
>> > Maybe you're using a different compiler that doesn't issue that warning?
>> 
>> Maybe because the kernel uses -fno-strict-aliasing, which presumably
>> turns off -Wstrict-aliasing?
>
> Thanks, I'd forgotten to pick the -f flags for building the out of tree
> test. Yes, that does work, but I wonder whether the powerpc 32-bit
> approach with __long_type() that Christophe mentioned would be better.
> That also appears to avoid all issues, and doesn't need the use of
> the nasty __force, address-of and deref trick.

Hmm. I just noticed that include/asm-generic/uaccess.h does exactly the
same what I did with the per size case variables and that seems to be
not subject to endless bot complaints either.

But sure, the PPC trick is neat too. No strong preference, just that I'm
leaning towards the per case split up as it's less obfuscated IMO.

Thanks,

        tglx

