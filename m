Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C0ECCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dctXkstECTenaZhiUiTAEPs/+u3lBJ+4oLit/DWtNCs=; b=UP0cxLgAS6m8qWNIgI2QbytrQV
	yxryXhBVi7NdjM5OkDU7yg/owlKVaOnJRPguFzeERoLteXo7oDTTsmoHVIoBO4tGNtR5u68CtbG1/
	Jm4AydSk35YzQ6aXGCVXzni0+LiP7xh4bd9lEP5fUuOSq2P+s/38d3mjbs5uRmrISyAdYG+z3WRAY
	N1wh4y5lMxCLenUd78FJqMefgfNM/e+TSO/315qcPL4Nfwl5Je08K9204uuxoJK7Wnn3t/77TkM93
	b8k+yr9374VgJG0QK0zT3nZhkIusdfYXP/pggLIz8zLDfsu07WmQc7eEoQxMI9UyY/qb12yT2AixF
	SaBRgAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZl1-00000003ChE-2zSv;
	Wed, 22 Oct 2025 14:24:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZkz-00000003Cgf-3IBj;
	Wed, 22 Oct 2025 14:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dctXkstECTenaZhiUiTAEPs/+u3lBJ+4oLit/DWtNCs=; b=W+uMC0i8lkaiKuhkl8eUM+csMP
	zH9Alfil/ggkWS+mff98nPo9bDIMkuW8K5C5+KY2e8934/ExnLSA4XSDvs16qF9TmynNu52oe7tVO
	alhtY8gr8526Ul/GMwiNjT57GxRn6C1/yPzHIibpvNmoPRJeplLP1368i919MkX3vMD0TfWO58XqB
	EaUXdGG6nfjfQNZR1hVFszBgQD2CFgdZfn+DgZnjBkiVlcKh5kkIe9C65p09XP2z5JubaB3DW+xwx
	QnSnO4coWaBJMspnjlZNpjlij/u6mnQPePfu4Nb2uYSAp9cc5ZSqjPHhLdI24izWy1wkOQRbI8Bdl
	/7A8lvtg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZkt-00000007mfm-1HRN;
	Wed, 22 Oct 2025 14:24:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 542B830039F; Wed, 22 Oct 2025 16:23:59 +0200 (CEST)
Date: Wed, 22 Oct 2025 16:23:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 07/12] uaccess: Provide scoped user access regions
Message-ID: <20251022142359.GQ4067720@noisy.programming.kicks-ass.net>
References: <20251022102427.400699796@linutronix.de>
 <20251022103112.294959046@linutronix.de>
 <20251022152006.4d461c8b@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022152006.4d461c8b@pumpkin>
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

On Wed, Oct 22, 2025 at 03:20:06PM +0100, David Laight wrote:

> I think that 'feature' should be marked as a 'bug', consider code like:
> 	for (; len >= sizeof (*uaddr); uaddr++; len -= sizeof (*uaddr)) {
> 		scoped_user_read_access(uaddr, Efault) {
> 			int frag_len;
> 			unsafe_get_user(frag_len, &uaddr->len, Efault);
> 			if (!frag_len)
> 				break;
> 			...
> 		}
> 		...
> 	}
> 

All the scoped_* () things are for loops. break is a valid way to
terminate them. 

