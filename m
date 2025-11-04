Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568C4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmPc4Gs4TkGWZ+ozrMfPezgUqCk9uHTE/K4Xkvo4w1Y=; b=dg4NU81M7rngYXnMhQ4JxeH13m
	PiWRMhBA8jJugYkTR+a1DvDCCXhQau4y4mMuflp3fbwo+9QbBVa32BEveS9Qu+6wb9M431dOwvdhY
	rec/+mSlcUhL7eip57WhkFJI1H1teYrs0s48f0tzNQpWM5Tl8iPveLTmAWbrwWcX2OG1VCfY56gdt
	yq1dHhYaRujO/4+6Leu765qXwffEgXxhgOBvvfmVpM3Pnetd/4Gf0UP5ELj5NzCekRAc9AEq4Us9E
	1/2FiylV5Ua5w9GVA6xB0Bb6ErRVRlwqSLyrXVXJKnsZnpFDmGrl9p431Of/anZt7kmXSyZCMZN4V
	efm36sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArn-0000000BGQa-0Abk;
	Tue, 04 Nov 2025 06:50:07 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArl-0000000BGPt-1VwP;
	Tue, 04 Nov 2025 06:50:06 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0z970xwrz9sSY;
	Tue,  4 Nov 2025 07:30:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8o3eFqSyCr4H; Tue,  4 Nov 2025 07:30:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0z966mmTz9sSV;
	Tue,  4 Nov 2025 07:30:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CA6B28B76C;
	Tue,  4 Nov 2025 07:30:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GLvucgCkTsyh; Tue,  4 Nov 2025 07:30:34 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C05318B763;
	Tue,  4 Nov 2025 07:30:32 +0100 (CET)
Message-ID: <fc087f38-2e14-41d1-8044-c054eb41ad19@csgroup.eu>
Date: Tue, 4 Nov 2025 07:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 08/12] uaccess: Provide put/get_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.609031602@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.609031602@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225005_565139_9B2E0E32 
X-CRM114-Status: GOOD (  15.81  )
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



Le 27/10/2025 à 09:43, Thomas Gleixner a écrit :
> Provide conveniance wrappers around scoped user access similiar to
> put/get_user(), which reduce the usage sites to:
> 
>         if (!get_user_inline(val, ptr))
>         		return -EFAULT;
> 
> Should only be used if there is a demonstrable performance benefit.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> V5: Rename to inline
> V4: Rename to scoped
> ---
>   include/linux/uaccess.h |   50 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -825,6 +825,56 @@ for (bool done = false; !done; done = tr
>   #define scoped_user_rw_access(uptr, elbl)				\
>   	scoped_user_rw_access_size(uptr, sizeof(*(uptr)), elbl)
>   
> +/**
> + * get_user_inline - Read user data inlined
> + * @val:	The variable to store the value read from user memory
> + * @usrc:	Pointer to the user space memory to read from
> + *
> + * Return: 0 if successful, -EFAULT when faulted
> + *
> + * Inlined variant of get_user(). Only use when there is a demonstrable
> + * performance reason.
> + */
> +#define get_user_inline(val, usrc)				\
> +({								\
> +	__label__ efault;					\
> +	typeof(usrc) _tmpsrc = usrc;				\
> +	int _ret = 0;						\
> +								\
> +	scoped_user_read_access(_tmpsrc, efault)		\
> +		unsafe_get_user(val, _tmpsrc, efault);		\
> +	if (0) {						\
> +	efault:							\
> +		_ret = -EFAULT;					\
> +	}							\
> +	_ret;							\
> +})
> +
> +/**
> + * put_user_inline - Write to user memory inlined
> + * @val:	The value to write
> + * @udst:	Pointer to the user space memory to write to
> + *
> + * Return: 0 if successful, -EFAULT when faulted
> + *
> + * Inlined variant of put_user(). Only use when there is a demonstrable
> + * performance reason.
> + */
> +#define put_user_inline(val, udst)				\
> +({								\
> +	__label__ efault;					\
> +	typeof(udst) _tmpdst = udst;				\
> +	int _ret = 0;						\
> +								\
> +	scoped_user_write_access(_tmpdst, efault)		\
> +		unsafe_put_user(val, _tmpdst, efault);		\
> +	if (0) {						\
> +	efault:							\
> +		_ret = -EFAULT;					\
> +	}							\
> +	_ret;							\
> +})
> +
>   #ifdef CONFIG_HARDENED_USERCOPY
>   void __noreturn usercopy_abort(const char *name, const char *detail,
>   			       bool to_user, unsigned long offset,
> 


