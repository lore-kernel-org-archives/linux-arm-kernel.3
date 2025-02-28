Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE97C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jeHPGx6jm3R1xDJMMDaYjvBALHQReLwn93izWT/Byo=; b=Q83o4krVfZXyS41kZ3Gu14d6Rh
	YTqFesDP2YBV92hApZVWHuDQIUKgNqIA4RYHP2ynPehnjBGZon80StUuYSBCQyL2yra2YIvlHjR1M
	jOdghlk5iclK/CHUW0ahHPCWEIJHFvPVKq45HFI2CP9bgi4slw8ddCwZbRVlAZ3uKC2wriwt0794m
	DfLQrHcLBOcbmllD02gIl6qIu2Ki20PAqfWvijfp+DdZfJKw+/SNpPjXSK17PAWncixEQ96Z2mNkS
	pkl6jNunBSSeu1aWWaeO/8Q66dOLYScudLt6z+GkCxPZ43GOJJcrQCn1zJlybeDQKl5AJjYlWZ7Xg
	8dh+auvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwdI-0000000AM6x-0YJS;
	Fri, 28 Feb 2025 09:26:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwbL-0000000ALdh-20fj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 28 Feb 2025 09:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/jeHPGx6jm3R1xDJMMDaYjvBALHQReLwn93izWT/Byo=; b=lGT3I5C6xKvNBqb7eUq6t1oyMA
	TKIoHFnWDeq6k809BZtIhypUMx/9yIkACdkXQsfqZYh7cwTuKb8ur/v3r/e5h0DhBJ7GTxELBBPEU
	PTDcCY+uNMxYO7Xe+1tKuuw7l8JEuOEXdotDmQ4ZVDppqjXNnkVBRnI2BabPZrL1epAJperOINnok
	HMNUOGxzSMonqZ/qtdGSBxtHwSbHx0UdOrL4iRIGbukCttTLYAOvEFxW0+Egs5aypmVtYUFOJ9K/u
	w8uSkvz+kQfsap8Fz6keuxovTlnUfUO3DPZs4jiUEUryiItJ/OScuvrcSrd/yiSegPuDFjnc0M7a/
	VThUpajQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwbG-00000003wMH-2wNy;
	Fri, 28 Feb 2025 09:24:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E673D300756; Fri, 28 Feb 2025 10:24:05 +0100 (CET)
Date: Fri, 28 Feb 2025 10:24:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Juergen Christ <jchrist@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>,
	"open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v9 2/9] preempt: Introduce __preempt_count_{sub,
 add}_return()
Message-ID: <20250228092405.GE5880@noisy.programming.kicks-ass.net>
References: <20250227221924.265259-1-lyude@redhat.com>
 <20250227221924.265259-3-lyude@redhat.com>
 <20250228091509.8985B18-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228091509.8985B18-hca@linux.ibm.com>
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

On Fri, Feb 28, 2025 at 10:15:09AM +0100, Heiko Carstens wrote:

> I couldn't find any cover letter for the whole patch series which describes
> what this is about, and why it is needed.
> It looks like some Rust enablement?

Yeah, more or less.

It's replacing local_irq_save() and all related functions
(spin_lock_irqsave etc..) that take a flags argument with this new thing
that frobs a recursion count in preempt_count(), obviating the need to
carry the local flags argument around.

This is nice, even for C code, less flags muck to carry around.

It would be even better if they then went and deleted all of the _irq /
_irqsave nonsense entirely.

Yes, that's going to be a big patch :-)

Also, IIRC there is some arch stuff that comes unstuck if you do this
blindly (I tried at some point, it didn't boot).

