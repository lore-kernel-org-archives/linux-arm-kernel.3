Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFA3CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8r7krmsVbg9LZSGZHAhgtzNazujSLkD3B3g7V5NcBwY=; b=OnI06xNbLaEXuZAZPpga6iqOks
	S49om7CXRiTciVwiMT1lGCcAvLD7l/bMnZ6F3ZeqZXr2v83ww0TcU3X0JuWj1iop67tzV5IJJOr6b
	yhm/6ODgBeqOehPj+owgFWsNGMTd5sjyOaVjLOwcP+oFSSMoqslYF72+WV1udh3P5IgIb1AImBbVC
	W/nWHhtDtdDZb+/Fhq5oHuXiirSri8ZcH/wKs5vTEJ5BcmzUlVYpdlIKQBRcEMClDC5o5EXoQNxaC
	gbGyiWzQtTBE1l6kzp0/tnmvMxz3XEhNbyV1VC8HIg8hoV+7GPhjrr5d17V5iMeIONK/kLUYHElts
	pSyOvg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iNw-00000007dW3-1iht;
	Fri, 17 Oct 2025 11:12:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iNt-00000007dV4-3kBq;
	Fri, 17 Oct 2025 11:12:35 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760699551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r7krmsVbg9LZSGZHAhgtzNazujSLkD3B3g7V5NcBwY=;
	b=dwf9SVgx1Zm1Pjequ3PR4+DL9xU+zQkUKo/qkUoLgcEfT5hWjmoO+A9ILNUIdfH3PCBjcm
	kjHuIgzpSkUwpYij4l2LrTCRzQ2kOF14XCm2thcKmeyb4xvWKLv4pS9XDX+TSJMhsmM3xZ
	uJd47j3quh7ZP3eF0SSZHcrgy0w23wDuwgQVoKuxn37DVakJ9pvBRscWEovVvfQBQMLfzo
	ZDoCCebSSI7JLCizkNXDwjf37GRsNaYiN4YTYgmYyBOmkYv+luhDR3r613BYkEG6UQ4xEp
	iYq38/MAPfL1wPgY02WJkbXSgs57Re0RYgWYpTOXPn8w5sJohJ8UT9mds3BzsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760699551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8r7krmsVbg9LZSGZHAhgtzNazujSLkD3B3g7V5NcBwY=;
	b=26gxJBd+HlY8L8NbIT72iVZHqcHJxgQgi0oCm2WnVTtFtLjxOCcaf7Awkdf4HoaO1nfGV0
	R6vqEwqGMtDc68AQ==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, kernel test robot
 <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Linus Torvalds
 <torvalds@linux-foundation.org>, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>
Subject: Re: [patch V3 12/12] select: Convert to scoped masked user access
In-Reply-To: <20251017103554.GY4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.570048808@linutronix.de>
 <20251017103554.GY4067720@noisy.programming.kicks-ass.net>
Date: Fri, 17 Oct 2025 13:12:29 +0200
Message-ID: <874irx234y.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_041234_066777_9D3E57CF 
X-CRM114-Status: UNSURE (   7.18  )
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

On Fri, Oct 17 2025 at 12:35, Peter Zijlstra wrote:
> On Fri, Oct 17, 2025 at 12:09:18PM +0200, Thomas Gleixner wrote:
>> -		unsafe_get_user(to->p, &from->p, Efault);
>> -		unsafe_get_user(to->size, &from->size, Efault);
>> -		user_read_access_end();
>> +		scoped_masked_user_rw_access(from, Efault) {
>
> Should this not be: scoped_masked_user_read_access() ?

Of course. The wonders of copy & pasta ....

