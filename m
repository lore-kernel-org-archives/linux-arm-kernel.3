Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972AECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qgPMRJSF9sIfpOYtKRyUUBt+NJHpNn43neFwkUQbv0=; b=MmcXaB/PB4rKO91GmH+NPJP0G5
	9PF8ZN7nmNHKslC4S0c3ZGMawXGGinRJNZTRfGe8UZmmp1k9t3dOEIEAmmaUBToI0C3maNj0o6Lvk
	ebYNanShiy883mthkbcLEv45SAyQAxx8rEa1pp0S31DS/lPmtBJUPAw0nR3IeRPCQX/vUdbCTI3F/
	551hlA7iPs+K9l+bGAMmysu7CRFfj3ronY2nN5ZMMO7dX7V8qW3bLkCo2ze9gdvT9UEuWbZDlfHbm
	p5GcitF9PsnTVrUluzgF+mdb9Fpk/tE06MSsLZNLQ90c9x18wehvTejdKV/uUMUtZIpGESToTV2qp
	bEBxkEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHWg-00000000PQI-2OEI;
	Tue, 21 Oct 2025 18:56:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBHWd-00000000POy-3js9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 18:56:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso5478473f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761072962; x=1761677762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qgPMRJSF9sIfpOYtKRyUUBt+NJHpNn43neFwkUQbv0=;
        b=AM0C5/bvxwZ6KaQOeKINytFIXzuncTUM/fk7mtdD4rmc4KgtLAFPGSg4vO8cVLB3XO
         ljScY/hcLoXEAFN/SR2ktQ098vqVlDLEErVLbiy8INAnJ+RoaABYNzQW+9964VXqfbn5
         PpJrEDBKVmYyvljBbooBJdZ5UrOqq1zYFFd7oLG0WaCVwUQpL+vh24is0pHHH/iBPWS3
         k8JwEV2jOPiBiXBMwI3JVNCmP3ZSnPwy/4WR1vYqq9ynzDQ15Nr12t68X4CoZ0U31xOH
         PejuWVkMdlM7xBCuivLsnWkX9W79WW4CpO3a/0j30GzIY3DqYKkLq6OwQ9o395My0i5z
         p7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761072962; x=1761677762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qgPMRJSF9sIfpOYtKRyUUBt+NJHpNn43neFwkUQbv0=;
        b=WU4yXwOjY3EQR0RAtQE3AefcnCpuFasp5gFPul886s1eZGSDC3O8/BswIBvAy2GD01
         +PqkuNK2KSOm1Qx2nPTjZuDpW9lG7gLYHTPjQQX2eQNOzzGgi7YLChtQbdj3ZAjEfDh5
         cb4vmDSYciJ69USYDeRce0zp1oTDODlmKfxgW1oQcztTibHDMqwyOJN+NTme8V1v3m2O
         2VlPAh4cB4+01hZth0V84oxPI+kfF+yxWjg44K7NyXS2sWBTpS+7uWTS3j7BOMh/gyns
         hU9YjLhgCEQxdCRlmvk+pQ4iTI7MImqIcSKl4t3Dlx4tFNwu8wV1WKz4G/N9Y5pZ8Q12
         Fm7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfms4EryKwIertCgOpoLsmpawvojdQ216+7hNItxkCy+iGZP/Evk+gE54l4HLH1KQN601g5OYwdx0b7mkF+Qu7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyun8RiTHGwSY5ez+FArK9NI7W7/QAnIlqZToH/uwyAm4+g3akI
	bZG/8EehUAFpKRFJ4x6Wrnu10Zv0Rgc6Jm7i3rKhR1mVzWZmcdKI779Q
X-Gm-Gg: ASbGncsanCuD2AzajMUqhUta2avuZhCTPJA+lOQ5oU/rhqQcl2esGG6OlGCik3CVnGa
	hI/iKCYCdK2AcQnEYNyZbLBbFPMicbDdG7obdlw2yN1k1SOSnPzeQdyn1oDRl9+DuQ5blo1l6ZZ
	z25dZiBSWJJ4Lxgg+s9gU8EjYvxD77agHFsoxVwSl/vR1nrg4/7yG6iz+T1jzsbCJln0XHCgYyz
	pIcQBLILDLib3FX0aUZHlv7SwaPtgh/LuDOdcASTnU+658wWDVucDUYP64ICyP2YZWbmZWfnZZi
	Ij+tnzUm8lz4UIkSydxlPyzExZ2qQKdvS20PGTGN4vFz4W/VVhRjqjSxDCWb77JYL0cGFbZEJdy
	L9eyk1mYidczWHsyxdGZsefBKExShZxLX5Mz7qU528azYXgKGLDZJb4TdlFV1KWbqfbcIgiafN2
	THaO2zkMeVSDOE6PWY9jfFGnbKXFSdkZoXj0X83O9TUQ==
X-Google-Smtp-Source: AGHT+IFjOxufFJONTpxys1bngEKe+lRcQqq+LVDgs/0okuT/Rc8W/l4ZwbhF8BXNqZX3cWqKXviWlw==
X-Received: by 2002:a05:6000:491d:b0:427:55b:cf6 with SMTP id ffacd0b85a97d-427055b0cf8mr13206929f8f.7.1761072961864;
        Tue, 21 Oct 2025 11:56:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm19566507f8f.10.2025.10.21.11.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:56:01 -0700 (PDT)
Date: Tue, 21 Oct 2025 19:55:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251021195559.4809c75a@pumpkin>
In-Reply-To: <877bwoz5sp.ffs@tglx>
References: <20251017085938.150569636@linutronix.de>
	<20251017093030.253004391@linutronix.de>
	<20251020192859.640d7f0a@pumpkin>
	<877bwoz5sp.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_115603_997916_50393A06 
X-CRM114-Status: GOOD (  56.20  )
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

On Tue, 21 Oct 2025 16:29:58 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
> > On Fri, 17 Oct 2025 12:09:08 +0200 (CEST)
> > Thomas Gleixner <tglx@linutronix.de> wrote:
> > That definitely looks better than the earlier versions.
> > Even if the implementation looks like an entry in the obfuscated C
> > competition.  
> 
> It has too many characters for that. The contest variant would be:
> 
> for(u8 s=0;!s;s=1)for(typeof(u) t= S(m,u,s,e);!s;s=1)for(C(u##m##a,c)(t);!s;s=1)for(const typeof(u) u=t;!s;s=1)
> 
> > I don't think you need the 'masked' in that name.
> > Since it works in all cases.
> >
> > (I don't like the word 'masked' at all, not sure where it came from.  
> 
> It's what Linus named it and I did not think about the name much so far.
> 
> > Probably because the first version used logical operators.
> > 'Masking' a user address ought to be the operation of removing high-order
> > address bits that the hardware is treating as 'don't care'.
> > The canonical operation here is uaddr = min(uaddr, guard_page) - likely to be
> > a conditional move.  
> 
> That's how it's implemented for x86:

I know - I suggested using cmov.

> 
> >>  b84:	48 b8 ef cd ab 89 67 45 23 01  movabs $0x123456789abcdef,%rax
> >>  b8e:	48 39 c7    	               cmp    %rax,%rdi
> >>  b91:	48 0f 47 f8          	       cmova  %rax,%rdi  
> 
> 0x123456789abcdef is a compile time placeholder for $USR_PTR_MAX which is
> replaced during early boot by the real user space topmost address. See below.
> 
> > I think that s/masked/sanitised/ would make more sense (the patch to do
> > that isn't very big at the moment). I might post it.)  
> 
> The real point is that it is optimized. It does not have to use the
> speculation fence if the architecture supports "masking" because the CPU
> can't speculate on the input address as the actual read/write address
> depends on the cmova. That's similar to the array_nospec() magic which
> masks the input index unconditionally so it's in the valid range before
> it can be used for speculatively accessing the array.
> 
> So yes, the naming is a bit awkward.
> 
> In principle most places which use user_$MODE_access_begin() could
> benefit from that. Also under the hood the scope magic actually falls
> back to that when the architecture does not support the "masked"
> variant.
> 
> So simply naming it scoped_user_$MODE_access() is probably the least
> confusing of all.
> 
> >> If masked user access is enabled on an architecture, then the pointer
> >> handed in to scoped_masked_user_$MODE_access() can be modified to point to
> >> a guaranteed faulting user address. This modification is only scope local
> >> as the pointer is aliased inside the scope. When the scope is left the
> >> alias is not longer in effect. IOW the original pointer value is preserved
> >> so it can be used e.g. for fixup or diagnostic purposes in the fault path.  
> >
> > I think you need to add (in the kerndoc somewhere):
> >
> > There is no requirement to do the accesses in strict memory order
> > (or to access the lowest address first).
> > The only constraint is that gaps must be significantly less than 4k.  
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

But consider the original x86-64 version.
While it relied on the guard page for accesses that started with a user
address, kernel addresses were converted to ~0.
While a byte access at ~0 fails because it isn't mapped, an access
at 'addr + 4' wraps to the bottom of userspace which can be mapped.
So the first access had to be at the requested address, although
subsequent ones only have to be 'reasonably sequential'.

Not all code that is an obvious candidate for this code accesses
the base address first.
So it is best to require that the implementations allow for this,
and then explicitly document that it is allowed behaviour.

The ppc patches do convert kernel addresses to the base on an
invalid page - so they are fine.
I've not seen patches for other architectures.

32bit x86 has a suitable guard page, but the code really needs 'cmov'
and the recent removal of old cpu (including the 486) didn't quite
go that far.


> 
> >> +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\

Thinking about it there is no need for leading _ on #define parameter names.
It is only variables defined inside #define that have 'issues' if the caller
passes in the same name.

> >> +for (bool ____stop = false; !____stop; ____stop = true)						\
> >> +	for (typeof((_uptr)) _tmpptr = __scoped_user_access_begin(_mode, _uptr, _size, _elbl);	\  
> >
> > Can you use 'auto' instead of typeof() ?  
> 
> Compilers are mightily unhappy about that unless I do typecasting on the
> assignment, which is not really buying anything.

ok - I did a very quick check and thought it might work.

If you can't use auto for the third definition, then I think tmpptr can be 'void _user *'.

	David

> 
> >> +	     !____stop; ____stop = true)							\
> >> +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;		\
> >> +		     ____stop = true)					\
> >> +			/* Force modified pointer usage within the scope */			\
> >> +			for (const typeof((_uptr)) _uptr = _tmpptr; !____stop; ____stop = true)	\  
> >
> > gcc 15.1 also seems to support 'const auto _uptr = _tmpptr;'  
> 
> Older compilers not so much.
> 
> Thanks,
> 
>         tglx


