Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA070CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pxei7jjMKgKYiJq7FPMIUgor4y30+Z660JBwkmAeSIU=; b=uAMS8m7Eauty2qKcsZ5K9p7DeQ
	i1C8wRy4CltFzgLM5l9EDfgNVUuVlHS2cMkgSWpXpQA/d4KDX3tz4KbiH3R3ciZvuA/Y/+syZyAXi
	B0/Sl9V1kf1eah9HHPrBfkLxm9Ua+iEwqh1PU54TrRRPfACJwPHZEL542kEUpynLchrj70NAGk1fD
	tf3i265WXzm0w7XCExEAITykmEtmL9LsN3PzxF/Lyh27DFeso+Zys1pQnWFl5x4EnBRQZgTgapQZE
	XGw0fg9BHu51d2SOwn15+A3KIhjDpPtPhZwa6ZFAe1IXpetMQvyrrnqYtvmDW/GpGJBzoGUWrzV9P
	DLC4lbjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCayr-0000000BOzk-1XFC;
	Fri, 02 Oct 2026 10:59:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCayp-0000000BOzQ-2sJP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:59:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73560413E1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1C31F0089A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 10:59:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GFcq79Kf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790938741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pxei7jjMKgKYiJq7FPMIUgor4y30+Z660JBwkmAeSIU=;
	b=GFcq79KfRexVqilVjQe3T/gap32hK9qtzApE0XFvXwM/oaDLzOd7whYw4Kh6lglo15H2aR
	RtzjZBAdP97mxck7aFDAqWM8j3nNia5mfzweaufHZr5e1ofSYjFOWnoVXzgIvlsUtgQbv5
	8kteJa0XF5H880jzodM0MYuQAKRXNY8=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id ce1bde7e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-arm-kernel@lists.infradead.org>;
	Fri, 2 Oct 2026 10:59:01 +0000 (UTC)
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3507d4a9so282028166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHFB//khYb6uk6SpIXtISA+Novz7PzU8akpKvhTsYeblUt8SJotJoeSAckxjc6+83XIG7BbY2oFVxF74VnG/Hf@lists.infradead.org
X-Gm-Message-State: AFuF++nM6FnvJjcnIvTTb0Q5gAdy6Bz67qAAWa3HreFpIJQoQ636Etbg
	91Cm/1StXGy9noHyH1o/CPEBiL2ZYpCJDvIMbRJeaNhWY98eHRt2qdh6+1QR8IAiYB9Glmq0wUR
	khuEW3bjfMGwBsw9Bt3ot6DaR6nWhxVo=
X-Received: by 2002:a17:906:ba87:b0:c2e:3acb:34df with SMTP id
 a640c23a62f3a-c2e4b3ffd07mr185815666b.39.1790938736158; Fri, 02 Oct 2026
 03:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <179093852073.149722.832232613857480812.b4-ty@kernel.org>
In-Reply-To: <179093852073.149722.832232613857480812.b4-ty@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Oct 2026 12:58:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
X-Gm-Features: AclHuK806shnKBNqNgOvgQVyH7F2xaT6wyW4EoVyeu-ArFe_UTxaLC7DpGRwXbE
Message-ID: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 2, 2026 at 12:57=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
> On Fri, 25 Sep 2026 22:46:32 +0100, Nathan Chancellor wrote:
> > After a recent change in LLVM [1], builds with the random vDSO
> > implementation, such as PowerPC and RISC-V, fail when checking the vDSO=
:
> >
> >   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not s=
upported
> >   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not suppo=
rted
> >
> > memset() is now generated when zeroing params->reserved for some builds
> > because LLVM has an optimization (now run in more instances) that can
> > recognize at compile time when it is assigning a static value to a
> > contiguous area of memory and turn that into a call to memset(). Both
> > clang and GCC assume memset() is always available [2].
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] random: vDSO: Avoid call to memset() when zeroing reserved in __cvd=
so_getrandom_data()
>       (no commit info)

That's not for you to apply. I'm sending this through my random tree,
along with a handful of other things I need to fix. But I wanted to
let this cook a bit more. I can add your reviewed-by line, though.

Jason

