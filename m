Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFC4CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=; b=rd8nYcVDYOvrRNV1afAaGzv4WW
	5ewcJx1nCsiwEbJCs7PWJgAAgmwSiej2Wwp228zHoV352CiGFXvThY9DAxjFhgUUt30OxnEKR7eYT
	ccqy/H/DifRzgTk5q+JSgHNPp9FCUoJKz+hu0IOiLXIgDerBqHaI+5wBCwo2KI9HkhO2i8eSUBc4K
	MaIeDU4TffynA+KE3Q1GMXXbDeEazdZ0Gy5uKs81K/vHWup8q6UK/W+FY3f3t6RQFWA8AsP5blZGD
	CCcgY9bgzVebLAvThgT2O+0J/n8fHz1rCawP1Ah6CTALPtlVYZ+4eT3ZkHUHg5wcn40+QiqHUwz9M
	JmbdMUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm1G-0000000GFAo-2vIG;
	Tue, 28 Oct 2025 15:53:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm1E-0000000GFAB-2Col;
	Tue, 28 Oct 2025 15:53:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761666833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=;
	b=OPEqap7k08VJelhy9WBQ/aL5T/8oowjEW/Fj5ejEzvuFUOJdHdYO+nY9g3zwtVd8QWDf1F
	3OycYZl/mXIIkjDEJbYqJn/3lZONlfMLSSkvOIeF5euOmDzhBeb9eL4MDJ07aVD52j+vc3
	2Ki2E0N97eFYWZ8+a5iDKRlRRUgRRS/Cia0Rk/IX+jL/+Yov9CCKMTIDCIZkBPTMJtSuC6
	TlGUy15ZD9OqxHiszUngKkX1GB7hr2PiWfv/E9vY6vQ531cTPrIrUUZLo9u4YJwZ5ShkEp
	MXYPHAOozI3S6XnQsFcoK8zfWpgofXu0Rlf3rxgsiAc0s0ZysVI8vQGLdVgzig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761666833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=;
	b=SARXk4Ruf1xEZbt1pBhbOZgPe7j89e4OCU0if/0OgDMjDi4dxReWkPtapI3fZt2x6xbwVl
	0zokLNUUHORNRdCg==
To: Yann Ylavic <ylavic.dev@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, Darren
 Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?=
 Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 02/12] uaccess: Provide ASM GOTO safe wrappers for
 unsafe_*_user()
In-Reply-To: <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.231716098@linutronix.de>
 <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
Date: Tue, 28 Oct 2025 16:53:52 +0100
Message-ID: <87jz0fuinj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_085356_781505_467FC2D0 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 28 2025 at 15:04, Yann Ylavic wrote:
> On Tue, Oct 28, 2025 at 10:32=E2=80=AFAM Thomas Gleixner <tglx@linutronix=
.de> wrote:
>> +
>> +#define __put_kernel_nofault(dst, src, type, label)            \
>> +do {                                                           \
>> +       __label__ local_label;                                  \
>> +       arch_get_kernel_nofault(dst, src, type, local_label);   \
>
> Probably arch_put_kernel_nofault() instead?

Duh. Indeed

