Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A47D6407B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 19:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFRzNI5DfFiu+JYAcGStf7GLEGzYk/QY4lQcntQCySg=; b=pZWlLKIUGo7qZ86EBX0IBdSFoj
	yT8s0YwaD5t0bjOPdgzuU6yC03BbaSqxJf0AngSnQCh1+IGzAuAgQKLthdnFjIk4pXKuMDpSGI96R
	3kqNppJElaIhJqgACxldsS21pXhtKloe5WeRSsinPUhsdvrETXR4TKAXVt5CSRQumuBFPNDeuNIrq
	jYJ9TAmZNyVmSiQfuBXBAevAEeY7ZGJKIX4mU/nIwviHncfDPkgqQj80X7Y+0gx1+bAt64rjaNZUS
	3ky2aZxWNFx5DX18e1qJT2OTl0MGM9Nl+jroLyEDvu7GDJwrnRhb6RDkxu1o5cXwVc//BOI8Mgnkf
	sQTO0A7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Uk0-0000000BkKR-2CDE;
	Fri, 08 Nov 2024 19:33:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UiF-0000000Bk5X-3U27
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 Nov 2024 19:32:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qFRzNI5DfFiu+JYAcGStf7GLEGzYk/QY4lQcntQCySg=; b=lGL3ULaRWdu2Akw/Y19it6Q3jM
	KWv9cmjXIpe6/WiQu6YsBZMXv1uaS0zwkhcynAZrHTwSFJOVBPXXo4c1X29Xy6tueMv5xE/uyvVqz
	UUSk1AybdlMyGzga//U4/q11RBKsGYyVkcwtgTxpd2ugk+q6M/ObL7CiLXI9GFqWJcBf8KpUFVOor
	JJisCsf4ptpseER9AR99Dkmj1EgzlqpFgyC0qMHZ4omO+cZsK9k4iXYv0egBdueiNadO6BtpC9Aej
	W6Gz7heyDXFtfAz87U4uAKFlERlD81b6510jyZ8GCPYKZtiq96hg42aJgYQILimrMa8cGlF8yhANA
	J3K6+ybA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UiC-00000009EL1-1dYM;
	Fri, 08 Nov 2024 19:32:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9556130049D; Fri,  8 Nov 2024 20:32:04 +0100 (CET)
Date: Fri, 8 Nov 2024 20:32:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, oliver.upton@linux.dev, seanjc@google.com,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, will@kernel.org, linux@armlinux.org.uk,
	catalin.marinas@arm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v7 4/5] x86: perf: Refactor misc flag assignments
Message-ID: <20241108193204.GC38972@noisy.programming.kicks-ass.net>
References: <20241108153411.GF38786@noisy.programming.kicks-ass.net>
 <gsntbjypft37.fsf@coltonlewis-kvm.c.googlers.com>
 <20241108192043.GA22801@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108192043.GA22801@noisy.programming.kicks-ass.net>
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

On Fri, Nov 08, 2024 at 08:20:44PM +0100, Peter Zijlstra wrote:

> Isn't the below more or less what you want?
> 
> static unsigned long misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags = 0;
> 
> 	if (regs->flags & PERF_EFLAGS_EXACT)
> 		flags |= PERF_RECORD_MISC_EXACT_IP;
> 
> 	return flags;
> }
> 
> static unsigned long native_flags(struct pt_regs *regs)
> {
> 	unsigned long flags = 0;
> 
> 	if (user_mode(regs))
> 		flags |= PERF_RECORD_MISC_USER;
> 	else
> 		flags |= PERF_RECORD_MISC_KERNEL;
> 
> 	return flags;
> }
> 
> static unsigned long guest_flags(struct pt_regs *regs)
> {
> 	unsigned long guest_state = perf_guest_state();
> 	unsigned long flags = 0;
> 
> 	if (guest_state & PERF_GUEST_ACTIVE) {
> 		if (guest_state & PERF_GUEST_USER)
> 			flags |= PERF_RECORD_MISC_GUEST_USER;
> 		else
> 			flags |= PERF_RECORD_MISC_GUEST_KERNEL;
> 	}
> 
> 	return flags;
> }
> 
> unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags;
> 
> 	flags = misc_flags(regs);
> 	flags |= guest_flags(regs);
> 
> 	return flags;
> }
> 
> unsigned long perf_arch_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long flags;
> 	unsigned long guest;
> 
> 	flags = misc_flags(regs);
> 	guest = guest_flags(regs);
> 	if (guest)
> 		flags |= guest;
> 	else
> 		flags |= native_flags(regs);
> 
> 	return flags;
> }

This last can be written more concise:

unsigned long perf_arch_misc_flags(struct pt_regs *regs)
{
	unsigned long flags;

	flags = guest_flags(regs);
	if (!flags)
		flags |= native_flags(regs);

	flgs |= misc_flags(regs);

	return flags;
}


