Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9C7CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vI5ygdM2fUq0WhLkjqvyWdwalTGXtImKgD/K2E+hX2M=; b=Gg9LRClMF2N0e28EO6ga26RQxj
	jPYiLZdMUhHneN/uMtwU0Yow67r6vuXgm+A8bz3l1n9Ing57LmlhjcArK3Uoh0XV86GRGwhYbv2Do
	SGXVedq6bbSum5ICNLjdo0mQHwYzzZchkr3nyNQ92nrMnJQrJ2CmVsX1kKxjMpLIdCIDgqNSdie/+
	/bxcp+B5wkQHc61Huerr+edw/1oZv0rS1sDkIpRfQQga/kd4v4acwvsT3mrNNuHBDg2gPzejX7NRz
	Q0tgEs8rQ3KWEBASKAcqLSl+sbrbBHB1aDFEnrouzGX0uvqCcZ0PtWOLV5mye2INPNWBwvZ6/3lWx
	D7sZ61Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYtk-00000003031-1jjO;
	Wed, 22 Oct 2025 13:29:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYtj-0000000302g-0y0g;
	Wed, 22 Oct 2025 13:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vI5ygdM2fUq0WhLkjqvyWdwalTGXtImKgD/K2E+hX2M=; b=ZYwOhBusiUOSHhKLetWTNJNMjy
	bOFMKbx4lkmtmrO7n86UGdT9Kf1mBZ2CQzanXcplCmrt35Ffy7u8kJ4PXpYYAoyQ7w9LT6BL8cQsu
	PW0GEbL2LjAVq6xWvTlmWE/UmTIr5UKBTZDdwQTFoL+yMxe+9raqn9/DMtx0KaH9xWUFiN5fT1cMA
	9Uyt/h1JzFxUl6Gz+WZVYYAqcbxOJexz/7zuC7PQu03jBwQtGNfpf7iTJUvMlJo4svTajaxMxLcPG
	hZ9H7QIEIEqI2UQ3wSDJ6YzYR2PArEaH+qCVC3MCNssf15mS9nUiFou3pKuZjw17TFGNTrV218T/Z
	aj9uPCFQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYtb-00000006NrR-0yQr;
	Wed, 22 Oct 2025 13:28:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BF53130039F; Wed, 22 Oct 2025 15:28:55 +0200 (CEST)
Date: Wed, 22 Oct 2025 15:28:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	David Laight <david.laight.linux@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 00/12] uaccess: Provide and use scopes for user access
Message-ID: <20251022132855.GP4067720@noisy.programming.kicks-ass.net>
References: <20251022102427.400699796@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102427.400699796@linutronix.de>
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

On Wed, Oct 22, 2025 at 02:49:02PM +0200, Thomas Gleixner wrote:

> Thomas Gleixner (12):
>       ARM: uaccess: Implement missing __get_user_asm_dword()
>       uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
>       x86/uaccess: Use unsafe wrappers for ASM GOTO
>       powerpc/uaccess: Use unsafe wrappers for ASM GOTO
>       riscv/uaccess: Use unsafe wrappers for ASM GOTO
>       s390/uaccess: Use unsafe wrappers for ASM GOTO
>       uaccess: Provide scoped user access regions
>       uaccess: Provide put/get_user_scoped()
>       futex: Convert to scoped user access
>       x86/futex: Convert to scoped user access
>       select: Convert to scoped user access

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

