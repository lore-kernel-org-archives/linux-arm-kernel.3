Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491E9EA4E36
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKcwJQ+aQkiImKNptCJqjwgkBdF0BmXTAZbJZzaoNO4=; b=t7bVlOE7hBwD72R5RVyxI8YWv6
	1DLijNFoa/pGIB9YBMUMdpUoUffHkoRDMZlr+n9qtTwQ0C6NjGlfgm0P/yEZkV+0p+/oHps91MJv5
	mxtp1fy0+XfGOW6y7+eLiOcUIhtZYQMmU9mGYjW+c1VQx5IPPdA2v/pHHfFOsSzgrcfdSws+HNPR3
	D0dEJbXHpaPihobkHR3/00cpmL9aBtf0yePiAxoJHOXN6vue6k5q5ZKED9dw+0ZIUmZ7S/ZTn8/B/
	3/mNs+aFI7WCvrPnqVjgFQGJInQtTa+NkMgdGU/baXA2unJa9X8yCRr0XDzlQwDLe+ojonb0sxSNb
	kY31pL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ns-0000000DSB9-2sM6;
	Mon, 02 Mar 2026 16:07:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5nr-0000000DSAo-2k25;
	Mon, 02 Mar 2026 16:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4321B60008;
	Mon,  2 Mar 2026 16:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AD7C19423;
	Mon,  2 Mar 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772467645;
	bh=Q4f5IphZs1HK0nenixYFPe8rEaCz8xjgoIeWN6zDZUo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=IMLp9T97Z1WGqMa4vKl8aLMG1SCE+RTETM4LF9HiMKYx4UrsyfNc9AmTDAGMeQxpx
	 atWX3a+51jxWTnQfRmsvdiTbUN5rkz4n69cFBN9Vaugs7LwCYmh6fDHvK5BH95218S
	 WjTE7/IyxVl5IgiZ9xplzxjGM5hkgVvNAXL1Z1enx+z/+fXCcGFwXMTuwRFFzTqiGk
	 S9kzt7FFHlwJc14uSgPaUHzirBOUCLO109ioqQTYkZsBASo9Vte2pZwBVGSWpTn/BA
	 OyyNKXo2fT5eBtBhIb63i0iitx6BOkgqZj36M2Gp4ZCV608BRToV1uBjtWBe/i8M7c
	 IezwEcB5TWUBA==
Message-ID: <5cef9283-c718-4832-9ef6-71f1722cb8e1@kernel.org>
Date: Mon, 2 Mar 2026 17:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 next 5/5] signal: Use scoped_user_access() instead of
 __put/get_user()
To: david.laight.linux@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andre Almeida <andrealmeid@igalia.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
 <20260302132755.1475451-6-david.laight.linux@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260302132755.1475451-6-david.laight.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 02/03/2026 à 14:27, david.laight.linux@gmail.com a écrit :
> From: David Laight <david.laight.linux@gmail.com>
> 
> Mechanically change the access_ok() and __get/put_user() to use
> scoped_user_read/write_access() and unsafe_get/put_user().
> 
> This generates better code with fewer STAC/CLAC pairs.
> 
> It also ensures that access_ok() is called near the user accesses.
> I failed to find the one for __save_altstack().

On arm64 it's done in get_sigframe() it seems.

> 
> Looking at the change, perhaps there should be aliases:
> #define scoped_put_user unsafe_put_user
> #define scoped_get_user unsafe_get_user

Might be confusing to have two macros doing exactly the same thing.

And the churn might be unnecessary on some code that already widely use 
unsafe_xxx macros and that we want to convert to scoped user access, 
like for instance arch/powerpc/kernel/signal_32.c

Christophe


