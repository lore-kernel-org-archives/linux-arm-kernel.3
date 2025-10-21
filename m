Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83373CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c27Kz3PCpHpOUA2hxoFAn/lgFIxKWu9eCciI5q0PFVA=; b=pqP+SCDB3SWRKl7tjYdkSMPM8i
	zjyG9QkGo+mXzi3xX7shuXuJHHyEcbaDEypYpf6xU17c2+69N7qgUo3sqTMNMhFJzFqmwoPCFreMl
	eV3QPp9v5NiiokiCa1HK/P706v1MkAT0SkLiGlPGSYLckG5Di2vvmVpTVd3wMZo/VwW4kt6+vaifr
	S099a3EWOzOxYz+Uw8LkCKRA6fE8DNNYX2yfb5pssqeg61JCKkwrXCmcXtEBOUEJoip5xRFnBe/VY
	FGzRsfkTKux9xK7IReQyPqgcHMYeZ4UYOPtXZBXS9+4k/MtCn7mqNeQbQcPo57vU8qrWlIFDlCRBp
	9qcwoOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDZD-0000000HMVz-4B3e;
	Tue, 21 Oct 2025 14:42:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDZB-0000000HMU4-21nt;
	Tue, 21 Oct 2025 14:42:26 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761057743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c27Kz3PCpHpOUA2hxoFAn/lgFIxKWu9eCciI5q0PFVA=;
	b=1/g8k/vY5UCh/boWPJmgNdB7ubbYE/A/fsOkfq3wSrNQGzQ5valPHvmdpxXGZqcnRroQ58
	Bejn39YCg/SlHMeJklk2aBag1ZZ/ZkJkTivx6X2k6zFCy9QlKITW6ujrMH0xoF2co7FakR
	/dutCEVT+SfKWOjjeaJTqJRMh89jW+zebxPrs6Ff9MEqAR4Jz/7LUbv+E7A5ITdaxbZChA
	LQsIRW35kAAcwrybohHORnbCHtCEJbOoM88Ok56KpnArXwbr5s8s3yRrxzfqZOWUQSPOoj
	HHlLFLvQYsl/+KPI+DNPkp5iCy3GtuWwAiSjCg7LL/RU6tt4yt9gYNWiE4WiKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761057743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c27Kz3PCpHpOUA2hxoFAn/lgFIxKWu9eCciI5q0PFVA=;
	b=v+qP/IJ72B74NWtVCOdsRXgUn8qUa/Jvf+CPgpV7YyvANjj4e/t31Aew02eNWfxowW2zLI
	+slcDYUqT+9nxODg==
To: David Laight <david.laight.linux@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell
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
In-Reply-To: <877bwoz5sp.ffs@tglx>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de> <20251020192859.640d7f0a@pumpkin>
 <877bwoz5sp.ffs@tglx>
Date: Tue, 21 Oct 2025 16:42:22 +0200
Message-ID: <874irsz581.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_074225_655886_3B1C1CF6 
X-CRM114-Status: GOOD (  15.93  )
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

On Tue, Oct 21 2025 at 16:29, Thomas Gleixner wrote:
> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
>> There is no requirement to do the accesses in strict memory order
>> (or to access the lowest address first).
>> The only constraint is that gaps must be significantly less than 4k.
>
> The requirement is that the access is not spilling over into the kernel
> address space, which means:
>
>        USR_PTR_MAX <= address < (1U << 63)
>
> USR_PTR_MAX on x86 is either
>             (1U << 47) - PAGE_SIZE (4-level page tables)
>          or (1U << 57) - PAGE_SIZE (5-level page tables)
>
> Which means at least ~8 EiB of unmapped space in both cases.
>
> The access order does not matter at all.

I just noticed that LAM reduces that gap to one page, but then the
kernel has a 8EiB gap right at the kernel/user boundary, which means
even in the LAM case an access with less than 8EiB offset from
USR_PTR_MAX is guaranteed to fault and not to be able to speculatively
access actual kernel memory.

Thanks,

        tglx

