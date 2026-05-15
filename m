Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D19CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5SQ+vRj770VUI1IW4I4HiJKOsdiTNXp0Dc6M8FCj2M=; b=0rvyLUyY8ErT5w1S2BAZE3xCM0
	Z8fzL6EwZEeDW9MgPlK7tkG7wg/yKmzXqtDzvFeJYsPiLQCDobRqryyIuJyzuP6mpdcjWceVqZKio
	ghOrQMKBBYAyKb8kTRYVattr88A+QBItxIAVEEs9KHREMJTOu+6lKWWY7B6Qe77G2ScOf8sXGxA1B
	YSGAZKDtJWWC5LOz2UbrrHsODan9pYfwZh/0Vjoj8vlaRZpIPwQPgELDg6eAn6TcVWrq3h3jgA0Tc
	D+RYlzwl+u8gN4k+76zeQXJiDIR8KwTebiUFnTsi1bNlz42HyNkAtBA14uI2uCtp8w6XHd4/6rja+
	ogvCz6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzw1-00000009V4F-0yBr;
	Fri, 15 May 2026 21:19:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzvz-00000009V3k-0BNx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 898D4444A6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 21:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBDAC4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 21:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778879942;
	bh=S6/5n/eY5SBAzU2YfEnW0M7mbgHygbpeduVPRCNsd8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=szPKIhRi+/8AqpqvN8IRpi1Moy1C7m9duw4rfSX22utImDW4Ga3q/gvy6EQNELj6B
	 CHsbYpb0xDfYiPy9XD8ak3rLsaQPD950edVpaBRJIeJoYiWfgAmndUBwEykVxE8EPX
	 op+iLUGUeeNb8th3OqomdM1ZkA7Llbm7JIwPdvzoEs+NzSgRhLdxHK+8yqtDWGMzVN
	 CgVcWkzQDzim9YEBvl5fJKsZzeC5lCd4B+S3JOc2sQuHRTwBjknni/7g0wqgDYQuVt
	 RjnysyksI07hTBa6ClvSJ4XKHEpitMitOq4WTJoJ6NGnFbJuorhFkhzuJqHwUZLaCX
	 BYEyzY9TzCqzg==
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8bc3ef10cc4so4021266d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 14:19:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+xZauAqMJU6I26thAPiPrrCEqPQUW+JP8tn8WpxZpRCgO7vjDETuiUyIJskry4dxImYKsMUPKglXu72CigsLun@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIoPo5S2vqlGjsNaZ10otG8329K4zqLwqseuIkt1WRGOHnYMv
	YTshgamF8l02h6I9PT6tU6zR5kR1jfd3NyNucvq74fCBn6PFWAEDMMF+FdKA9M5OBsrPVszs9Sz
	VPHuBViYQHNlRjsM3jUOnjzyX2r/FbR4=
X-Received: by 2002:ac8:7d53:0:b0:516:51da:ae52 with SMTP id
 d75a77b69052e-5165a1e8b62mr79944801cf.33.1778879941192; Fri, 15 May 2026
 14:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778642120.git.jpoimboe@kernel.org> <74623fad8c45d26a3da6c5420b00156d8f7c2150.1778642120.git.jpoimboe@kernel.org>
In-Reply-To: <74623fad8c45d26a3da6c5420b00156d8f7c2150.1778642120.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 15 May 2026 14:18:49 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4G5H979FCvk0tfebOxjBcMak5n3Cx8YB6yhtSLaJiGzw@mail.gmail.com>
X-Gm-Features: AVHnY4J8krqK1Xboui47oB88bHhzXLaHBxExeYAz32cX9_pfyW7wyKMKsDyD1kQ
Message-ID: <CAPhsuW4G5H979FCvk0tfebOxjBcMak5n3Cx8YB6yhtSLaJiGzw@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] arm64: Rename TRAMP_VALIAS -> TRAMP_VALIAS_ASM
 in asm-offsets
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_141903_109275_56DA3031 
X-CRM114-Status: GOOD (  12.33  )
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

On Tue, May 12, 2026 at 8:34=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> Rename the asm-offsets TRAMP_VALIAS macro to TRAMP_VALIAS_ASM, following
> the naming convention already used by PIE_E0_ASM and PIE_E1_ASM.  This
> disambiguates the asm-offsets-generated constant from the C macro of the
> same name defined in fixmap.h and vectors.h.
>
> This is needed by a later patch which adds new includes to asm-offsets.c
> that would otherwise conflict with the C version.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

