Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874CBCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZCiJUNbDBKZU7NscC9t+cPIbwSt1d1aTLOIOEONDRo=; b=lP6EdAdUm9vLQS1dvru6OnNtCo
	kBh3BM+sasGyA97ECJ0RHLY4J5NRx0XNUrjYtMY3LjFZDQFP20fBSQ0hOLapMdl2MMsK3+vOGtVc5
	ao7CGuyQB7z5Q3sFesY47j2CZFS+0xqo2Wl3lJjZrol/KtGESdvFs4nd6GVhVIsn7xZJ/0/wFpFij
	GYoBq8PtL07OGR94gzd6bHbivb6Vyji3OysHFM3ebB3sUOh1E/Yg8hBvJSD1r3TlS7OAGjReboBBL
	K0W3OW3cdaqTIxv9QysemCwaHgtgmYZnH7oya7kqmumWOXHSnEuB3A/heV/DAaPw47ZBF6bCmAJn5
	cFdrK5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjjQ-0000000C5Zk-3znw;
	Mon, 20 Oct 2025 06:51:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjjO-0000000C5Yv-2fRH;
	Mon, 20 Oct 2025 06:50:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760943055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZCiJUNbDBKZU7NscC9t+cPIbwSt1d1aTLOIOEONDRo=;
	b=aBpWibfQy7NDvaZaGXNCdeOTgstNqJSd72h/HvfsU+bxtPLg46jN298a5AmbZZ0I8qsmk+
	d+9FiLZZFEkKF34+6aD/geC//vXqFAxlhvsIuTZ0otTv1PFTa68B8uXOwFcWk4+8WYI5an
	IUvxnjVByp5cBtfO9vsxxCUqKZIHzZsfrdbZZf3kacNHifOfvhESr5BlU2Lf/PbfyV38By
	KVznd395E5j77XdHOnXPD6Z0vpewpRYK/FK7/w8iwdhVqFvHHEA4Stu+hyylX4JdUwRORb
	fu7YAxMMiLqA2Vrpd+zZrafVfIA99TO2e4VyA7/HhfSxLwAND/A9kWLVflkZvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760943055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZCiJUNbDBKZU7NscC9t+cPIbwSt1d1aTLOIOEONDRo=;
	b=JHg1coFAEo4pN71GSm+4Y8XD2IbiEBac1CDhS7fUoq52oNxVyS/BaH8IlhDFLi/qxEKwbs
	tEjcxtPV9FDv1sAg==
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Linus Torvalds
 <torvalds@linux-foundation.org>, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 08/12] uaccess: Provide put/get_user_masked()
In-Reply-To: <d58b798a-3994-438c-9c02-678f3178b21e@efficios.com>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.315578108@linutronix.de>
 <eb6c111c-4854-4166-94d0-f45d4f6e7018@efficios.com>
 <d58b798a-3994-438c-9c02-678f3178b21e@efficios.com>
Date: Mon, 20 Oct 2025 08:50:54 +0200
Message-ID: <87ecqyyskx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235058_816761_B8F43BD4 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Oct 17 2025 at 09:45, Mathieu Desnoyers wrote:
> On 2025-10-17 09:41, Mathieu Desnoyers wrote:
> [...]
>>> +/**
>>> + * get_user_masked - Read user data with masked access
> [...]
>>> + * Return: true if successful, false when faulted
>
> I notice that __get_user() and get_user() return -EFAULT
> on error, 0 on success. I suspect the reversed logic
> will be rather confusing.

In most cases the return value of those is treated as a boolean
success/fail indicator. It's pretty confusing when a boolean return
value indicates success with 'false'. It's way more intuitive to read:

       if (!do_something())
       		goto fail;

Just because we have this historic return '0' on success and error code
on fail concept does not mean we have to proliferate it forever.

In fact a lot of that 'hand an error code through the callchain' is just
pointless as in many cases that error code is completely ignored and
just used for a boolean decision at the end. So there is no point to
pretend that those error codes are meaningful except for places where
they need to be returned to user space.

Thanks,

        tglx


