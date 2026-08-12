Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C1AC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCqe/cWdK02FXGYSKzeyf0hCLxGe4BK/FM5s+h5uvo4=; b=PCSAVZRyUQKwFzC7vRXsHqvusj
	+6iQEP9aM0jX+s/KyRklBp4i3QohegqCUboq90RX24TSUomtMZGTyDh4OkKTyoV26wdiv7NPU+rbl
	KYb9HSG7Y2snBCibVTWBXftfpSN1bhVY6UrJSUtpgDpmxreLVSuCvqNhVPWLiqzVGgaGo8m8LawRL
	YPc5EbsL64bIK0faChaqvp65xnhgfOAEBSNIksvgaOPX/N0UwE4F7y66lCuJv1qiLu5s6KS2VbIMP
	pwjz0MPOD15NLau0z25JpqgX6s7cTl0nBQ5Duidv5oeDBrmTSuqz17HQ66DHS8aTQkDqnEkTqGziK
	+hbm4nbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0iM-0000000FP5I-36nM;
	Wed, 12 Aug 2026 04:37:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0iK-0000000FP5C-3ol1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 04:37:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E2A043F92
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380AC1F01559
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786509436;
	bh=NCqe/cWdK02FXGYSKzeyf0hCLxGe4BK/FM5s+h5uvo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U78vCJUPw56xZVuQli7wgT/yJXtN299A+KwaRMmtgLv5B0H5zAdX6HnEl8ftYByDC
	 ox6H1PXda35qd2TE81PUcShh0rEPJsuuW7wuk0PN7gQi4XBYfG2sF1xX//nrAmBjP8
	 GAMJ4bl0gHzkw7lV3GlCsddECFRM+2omzzY7fZ4NF7OsDBiS7P/R6lSGPs6SS/EP2p
	 DCV2yykEkDzQKKAXNKnZ/YOXKu1VKklSdHTm+8xczF+9mATWxSoUeejKfIREWOMuoW
	 CV7TxJwH+E3eukgw1YYm1mE8pdUnz4Ac9AsUluKpJ+3VmVP/V9JhNEixaWkHDZLs8B
	 8uutqlAxX0j0A==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e50979c71so62669685a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 21:37:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoeDUy3nfBfbRACXF/qRH842/Qjo9Pqrk3vocagED5saoMRw4XBaZTsje+bVVmANXx62/In8k8SUzCIFPZ+fbwX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6pwT/zrK8BB/4Gper0q4/yl1JCBZ933R+1ArJZ17vJV938pch
	KrEh5FV3iQKc/ERiW65a/jau4Kd4ZinkSI/1CjJ6yPZ55VDUIbimEA5ppDtYzdPIq0VDV7tN1jN
	/cxTeMBIJ9pJEKNRslotR+91SgLXIf+w=
X-Received: by 2002:a05:620a:640c:b0:92e:f3ca:2eaf with SMTP id
 af79cd13be357-936b3ab4f51mr216275785a.11.1786509435420; Tue, 11 Aug 2026
 21:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786230311.git.jpoimboe@kernel.org> <11e49187e13d36d4257bc60cd2606e0ff5481dfc.1786230311.git.jpoimboe@kernel.org>
 <CAPhsuW5tzBOHnw42d31r_5k9eS28VrDLGXoUzS=hYkZmAyRbhw@mail.gmail.com> <anu-Xbm02J7BgCIb@jpoimboe>
In-Reply-To: <anu-Xbm02J7BgCIb@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Tue, 11 Aug 2026 21:37:04 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Vdni1Bj7b9R_yR6TKvOYSbKDjz0qdWkfN6jO1JAYNSw@mail.gmail.com>
X-Gm-Features: AUfX_mzumLt3KMIKcIkcajkuhs4AijZt-NTw4ovfnyo-dTYEWOlhHsOVoBjk0Sk
Message-ID: <CAPhsuW7Vdni1Bj7b9R_yR6TKvOYSbKDjz0qdWkfN6jO1JAYNSw@mail.gmail.com>
Subject: Re: [PATCH v4 15/22] objtool: Prevent kCFI hashes from being decoded
 as instructions
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

On Tue, Aug 11, 2026 at 5:30=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Aug 11, 2026 at 04:58:05PM -0700, Song Liu wrote:
> > On Sat, Aug 8, 2026 at 4:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.=
org> wrote:
> > [...]
> > >
> > > +/*
> > > + * ARM64 mapping symbols ($d, $x, $a, __pi_$d, etc) which mark trans=
itions
> > > + * between code and data.
> > > + */
> > > +static inline bool is_mapping_sym(struct symbol *sym)
> > > +{
> > > +       return is_notype_sym(sym) && strchr(sym->name, '$');
> > > +}
> > > +
> > > +static inline bool is_data_mapping_sym(struct symbol *sym)
> > > +{
> > > +       const char *dollar;
> > > +
> > > +       if (!is_mapping_sym(sym))
> > > +               return false;
> > > +
> > > +       dollar =3D strchr(sym->name, '$');
> > > +       return dollar && dollar[1] =3D=3D 'd';
> >
> > nit: is_data_mapping_sym() calls strchr() twice. Maybe we can
> > optimize it by eliminating a strchr()?
>
> I suppose it's a bit funky, but the compiler CSEs it, so it's harmless.

I see. Then this should be fine.

Thanks!

Acked-by: Song Liu <song@kernel.org>

