Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F8FCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YhJg/Vg0kUrlQnIKq6WPQNTQH9OtFetyfT9AbDxDuA=; b=FlWG6S9sdpw9c/eOwZGtKrEfde
	88dTFEXHuBBSoDjIW9k2nz+BIJEy84x6JUhpzzEFYGKkUPaMfSbld64hFYitLaQmFl2VWHUDhRjxe
	9w7L+RaYAcixBxkXwPA8qgxb6FDBg3kvNDNVSAsVje/5YYMwuE2kpDbAZiBSzUAYHAIRC+1VMVklv
	k/RgZ8cFfHsPfj6pSSGVXUJvvJ0EpFQ6XPvzlSY0GfQ72cAN8xbrmU5n4pwaNX0mRumvMxCjADB7h
	f64PWhAHkSZxU9SCDnQkoo0jIUHYoRJdCe3syn1AnrBCq3PB76ZoCEeQcC4BMG+0i0vYbqMntjGjR
	d4SFKpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBw3E-00000006Sv0-1j8G;
	Wed, 30 Sep 2026 15:16:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBw3D-00000006SuZ-27X8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E14E60252
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 15:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169C71F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 15:16:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lif9OX7R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790781409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YhJg/Vg0kUrlQnIKq6WPQNTQH9OtFetyfT9AbDxDuA=;
	b=lif9OX7RWafdyPA2vmfDWOKBdoGlxav5sM0R59juNsSHRGOJ3cLGwIQADccYOr0Es7uHaM
	U2JHgEuRoM4HW2gbTSyzrG61iftYLSVR+tHEfiptGXjcTCXFxk1AM8v9PuFV6tI2DiwHi2
	rpAspPBUZghSjKDFVGIGFAwuxgjbmY0=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 01204687 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-arm-kernel@lists.infradead.org>;
	Wed, 30 Sep 2026 15:16:49 +0000 (UTC)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e27d11f43so35406566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzM73yX4/FYIAPDIh1XdxATzpTyBJ9aQK0sJ2g3ZftBC79NJz3DPq1mft9LYLkx5KLFNrX7EZtrsT2+G3/5Iget@lists.infradead.org
X-Gm-Message-State: AFuF++nC2TDf9lqcSXIawierHEj2wpZNLQaNQFKLt4PWLMizwPpKeyHo
	ckYPjIoWl72+PITr66Uk+zVrdhSnuEwHYPfVbJm7VIaiPLdGG9WLDFMxWzF+BKXmYx1dCR1ld30
	vXhFWP80EFP4vRxlEsTv3p8FFzdagI5I=
X-Received: by 2002:a17:907:6095:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2e240ee3f5mr135965366b.8.1790781405942; Wed, 30 Sep 2026
 08:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com> <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162> <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com> <20260930151337.GD3142230@ax162>
In-Reply-To: <20260930151337.GD3142230@ax162>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 Sep 2026 17:16:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
X-Gm-Features: AclHuK-3j-Oh9f_5JCjhD5NbddIhsNHXCyGk_sGVp-iO-7Ny0UWZ0eR4ti5Aiu0
Message-ID: <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
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

On Wed, Sep 30, 2026 at 5:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Sep 30, 2026 at 04:44:29PM +0200, Jason A. Donenfeld wrote:
> > Nathan, would this be okay with you?
> > https://git.zx2c4.com/linux-rng/commit/?id=3Dd216701724b7d8209ff4215065=
8ad5c712bdb503
>
> Can you stick
>
>   Cc: stable@vger.kernel.org # v6.12+
>   Closes: https://github.com/ClangBuiltLinux/linux/issues/2183
>
> on that? Otherwise, looks good to me, that's basically what I had for my
> v3 locally.

Sure, done. Also removed the now-unused array_size.h include.

Jason

