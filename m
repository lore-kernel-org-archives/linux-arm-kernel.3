Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFBCC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 00:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX8AcDd8xiFvnAw086KkQaBdTXODmm6DYHpS2UGNDUI=; b=jJyuxZNJQihJkoiWPkldsjhENa
	spbggKQEMmZz0S7Mbqw1Zp4oimTB357sScHewE5fyAVRada3NKhismdoDLHVJqwLU3iYEVaaeJPR8
	h509xVlPAMsimoEhKOVEAUx5ZQFVmscZ/22OAl7Z3TLcCN62Xn3N9oY0isS1gB3XgSqv9WofbCrZ3
	Zsyy9BIIohNUMzyP7FSlEzoRaaf9fHKdM/nsZkfVPeJCUUnPBtr8BMkBaYg7aEXeOkvxv4qfQFRub
	IqpGaQ1mI2H/dQTIw5NawnpH7VrCUVSGbP0ar8pAfc1VXxM4WVp0VHKFrgug2Ctd6+gluX2Kw9Dcx
	mK2sITgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwQg-0000000F7ev-2Z3U;
	Wed, 12 Aug 2026 00:02:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtwQf-0000000F7ed-1YbW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 00:02:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A517360A7E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAD21F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 00:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492964;
	bh=DX8AcDd8xiFvnAw086KkQaBdTXODmm6DYHpS2UGNDUI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fLxVzLveCDQ38M556RCq1p1TVni/ud467RdrvXXAbN8c+bRq+DqlkaH9RW0nl6AP3
	 t4SKOK2+oUARzpzfMAFhVWziQ/gVzMtuwKJX5DvOkLdB/cdRfI6oUwiCHN+BVCI2VO
	 jLDQ5YJdxNcf/aOpUr09TS+zBmvVjHEyztvvb/XyZTJBLidbiYSi7L6sU+2Sb2WFx2
	 cLU1BNie+SuGsdzSfmBCoRvnpuVY6tImUNt0VCqNlMTGszR5mn1zOYorUeGBrL/u8d
	 pdsJzCjcqlbIU/Pcxl/yNNNs1f4P6S75chOUw1X5vtZJ2WNeBCvFK8WSBdT3uEgmhc
	 Edn/wUPkQaFuw==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e53581361so28081985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 17:02:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqUIbxfLgzkeLjGnK/493sTCre0HB6fNevzysjrjddH+L3tQptNrDMcYakpkMqo5+hxqKQtRvrJ/8d1pmwyzRfw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb5iUpGiofZTGakjdR/hnHEHl8S1dQ26n7OfvR6zfadmohzRFG
	jhSEknsdTeGET/ctjFLq9C4T0xPjfCnRSMNuU7qIwy+u1NyyDimfhgwgF/Z/+u5eaRtbwEckx7h
	rfjvL7uWELFVPncWAOyTbzUyXvW4EWhw=
X-Received: by 2002:a05:620a:2789:b0:915:cb40:f76a with SMTP id
 af79cd13be357-936b3d5c7b6mr123863585a.39.1786492963606; Tue, 11 Aug 2026
 17:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <afba3774f6a8a818f899e3d04a22ac55e9cca0e2.1786230311.git.jpoimboe@kernel.org>
In-Reply-To: <afba3774f6a8a818f899e3d04a22ac55e9cca0e2.1786230311.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 17:02:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5MefQs4Cv78wm1i5YJJnSG3p1neRqoXgo0Np1BcTpAJg@mail.gmail.com>
X-Gm-Features: AUfX_mzRyX-pZscT-qwuNT-GinBTphaTag_fBwZM1aCRGssM85AEKHR4m8vNWTw
Message-ID: <CAPhsuW5MefQs4Cv78wm1i5YJJnSG3p1neRqoXgo0Np1BcTpAJg@mail.gmail.com>
Subject: Re: [PATCH v4 21/22] klp-build: Support cross-compilation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
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

On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> Add support for cross-compilation.  The user must export ARCH, and
> either CROSS_COMPILE or LLVM as needed.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

