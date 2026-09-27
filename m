Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460A3C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 07:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJKp/brBpZ8U6kwJIcmM4FiZnVhsdc/GYabd2hj9ep0=; b=eFF+jyjAVx8aP2Y/+QTq2bmBD0
	28jQ3Bo1fwC56J44/+aozYYXWPA9lE2+qnJNaVr3A8+ywXrw4JUpJO1dp7Gg4L8XIIF+eXpuvdE9K
	KFXufB9G+GoYKepiyPQGblwUoSJ63vi7AuH2W8q/jgsb1H9gp9neb1Pt2Xjn53rHwKOfX1tTF3VCi
	qcBRlKUE4v1zPjJ0m/Vd6G47gykWhkCbbkvXIWrZ7gHC+RtsJ61rLq6pwjs7ubjMdsjrs8x9wZZl3
	su8OPdFNn2n6OhsoC1SdYbuautuQjkAcGIGpCLFxhMVY3sjPlXdG8QPoZ0JU4GSM3Od10EUH7vfux
	r43Xckcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAiu9-0000000G5O3-1HLG;
	Sun, 27 Sep 2026 07:02:33 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAiu6-0000000G5NG-2Hxx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 07:02:31 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48882c1f261so624632f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790492548; x=1791097348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJKp/brBpZ8U6kwJIcmM4FiZnVhsdc/GYabd2hj9ep0=;
        b=sh9xIpS95lfenlEobk6PO5gnn/WyjELws59JQ8FC9HXW8WOVLUmEgFvGRNIrnjy4nc
         dAL4XkDM5I4OBzO7w6z86qIB+56op+9zT2coUZxXZ4LLcw/GL5Y7uq8jtS3L08/VsNI+
         mOySkoJByPRxh7ljPjpJihZ6zeKsONFeWE/ejBCA662s/Hn5/z3edm9TA55JmscyE1de
         jm4EGcwfAaGkUDu8zr1iU8/vslNnr6RPCVPNPZ6xpm6QZPPCE8/hIfNhPEbeDwSBS4an
         Qcu6KpUQNCJd8Vsl7kvJ0zjaN1oJ8XC9iMgksXJwqSJiDk4VzeW5R/krFu13dzRsU8m6
         zFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492548; x=1791097348;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJKp/brBpZ8U6kwJIcmM4FiZnVhsdc/GYabd2hj9ep0=;
        b=2my7BJtW3LhWOf284ftLnFSdJQYdm3BUiqhXmL0BubW6vEifSZk38C0pehthXbTaBi
         F/oJdcgoFG+wj3MYvft7JrkFAABYCmoKsunsjiYE72XMkR7g6w+AOqn4a99kaf2wdNIn
         kVjyT9TdtLIJuS+FsEeCP1P6B+udMLYD47bTljrMXNihpWodzXz3ktdmU7Tz2JU9eKFa
         4PFahzXdTycXZYs5yW8SXlVIoln7Sb/q/nOjiLuE0M9OS7fQEk9NngNiLsVBokP2YIVJ
         rHtbdToqCUedPqHyV9SwjYB6pGV0/7an8HmRTp0VpJiUoDw+8i6F57vS/p8vyxRknkUj
         NPXw==
X-Forwarded-Encrypted: i=1; AKwUvByXGBJYP67p7ZCtPywLF3PhVrWu9y/yD/D8SAolLib8PW7uGwlu9zCpLIaCYzagZMO7eq8/v0U1cW5/H7Juynl9@lists.infradead.org
X-Gm-Message-State: AFuF++lAC6K62gLaGkOQkvrpWnTQ4pLUfkYM/7YTVvq8dPcwxiASFXEq
	V4HcghdWd0MQVa4QBGzBA/M4EMyd1o1kplrWV5ppnj5XKEM5Xd8a1c5n
X-Gm-Gg: AYBFou1iRdqoRnVehZQ0/GRxywVFpeWi+mFb6yPVlw7O11dQv2kx1gufpQtYQz3Beyh
	v6e8uinPRzdaMLk0784/JQQtCQAmz6xRrDVvvnv6WWlAXCeDQ6rtS4gMiPwJ1Ey4aTMTV9VUPdr
	OjAXZYmwD4XXzRd09SAhuUNYH8Sl87X8yZ7F2zOxvurl0VMX3JVf50SyO2OIM6J8D2BREBpgGSp
	MXTPkx63O4tsZIbX6wwu08x339Phm2z8iWkmm2K4SPnyXsvtF2kB2T7/AY6Ah5eSt7tnXEAv+W9
	QhLenNpgzFlFSYw5qUf9mp9mKIZElkHlIOtLtZKj6vcclW9Vf4OKp5jyKsM2U7MHHPAMcojO9K8
	Kgx9gAkatFmtDEj7xEJVyCmEwDoiDqxWOPrs3GTh9X9GncL3NATaRoUVrDtQwMwHUFpD/yepeAV
	ua+Kc6dQchpx4mztsG/Z5dWVa3C/Iyq373VSlUG7sNJ28R0FbIiUSi8zDo4HJmwYGU4OkFRiBbU
	CZh1rXlRD3NUw+4SU4RgmSzDv78rrqVBR7o
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr175447355e9.3.1790492548064;
        Sun, 27 Sep 2026 00:02:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f0e79sm57015315e9.7.2026.09.27.00.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:02:27 -0700 (PDT)
Date: Sun, 27 Sep 2026 08:02:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260927080225.37534e7c@pumpkin>
In-Reply-To: <are7cfMIHZZn6jLz@zx2c4.com>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_000230_643055_CA6894EE 
X-CRM114-Status: GOOD (  22.14  )
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

On Sat, 26 Sep 2026 14:32:49 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Sat, Sep 26, 2026 at 01:19:27PM +0100, Nathan Chancellor wrote:
> > On Sat, Sep 26, 2026 at 11:39:43AM +0200, Andreas Schwab wrote:  
> > > On Sep 25 2026, Nathan Chancellor wrote:
> > >   
> > > > +#if __has_builtin(__builtin_memset_inline)
> > > > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
> > > > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > > > +#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
> > > > +#else
> > > > +static inline void *memset_inline(void *dst, int value, size_t size)
> > > > +{
> > > > +	char *d = dst;
> > > > +
> > > > +	while (size--)
> > > > +		*d++ = value;
> > > > +
> > > > +	return d;
> > > > +}
> > > > +#endif
> > > > +  
> > > 
> > > memset actually returns the original pointer, not the incremented one.
> > > Nothing uses the return value of memset_inline here, but it is
> > > confusing.  
> > 
> > Whoops, good catch, I guess my fingers gave up on those last two
> > characters :) I will fix this for v3 once there has been some time for
> > further review.  
> 
> Do we even need to return a value at all? Might as well just make the
> function two lines:
> 
> +       for (char *d = dst; size--;)
> +               *d++ = value;

Wouldn't it be better to add a barrier() or similar in there to
stop the compiler playing unwanted games>

David

> 
> (Technically that could even be one, but maybe that sort of golf loses
> clarity. Your choice.)
> 


