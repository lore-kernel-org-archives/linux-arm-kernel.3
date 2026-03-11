Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7749103E2F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk+xtHFu2nT5u7Vb87eqwFAawOggk3dvSW+DL5j8Ge8=; b=KPvTuh7gQuVCEIE8DLxicxgM7v
	tYZ/NZLs1pUmLxLfiWNIOGO4X02PPhX9WzLFuQrppfZuTEe5xR3ZPDrXTdopjHDgMHvWBBIdyHJB4
	fkXR1SrZEm/pyTn44/NAkGjb7DuC9g9ewkPg8TIKnEQqaEx7deZyqyBszwXFusCMvZ4EfR6CwYBEC
	iqhO9Pd/hWH0+vAFB5tLPVYkv6sE427n9GWyltzbi9+4lR4rzOyd0rQzlhyfLk5LgHeLAKRcS/WJf
	ufY2Qn4dYoC6aOHG1WTeeCgCLN6Z0zTwcXDCGSW3sMBoybcaHxE6Ro0BrByb+LvReIu/2DJxpfPp8
	oJBXdKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SjU-0000000ClfY-1QCS;
	Wed, 11 Mar 2026 23:12:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SjR-0000000Clf7-2bid
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:12:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0218261340
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7B0C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270768;
	bh=JRIPifTOp48WDrufwYh8jWnkuAzeptDMhAVCjNqxPTE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HjLRizsOtiFYfLX5lXV2JeMX5W0/3Ujk/sirhOhshMJPDnnimqINqfsMDj3Yxoi9M
	 W7gZnYmKxkILgLbn2kFgg5TJmCGqR9LOsc3y23GRlvh0iBtRegS4YGKXN0t9r+oBgj
	 +DqJSJjRV3OcgBvlAjXPQatKzpk2sqdQWA3Aeswf3JGXS6bgckSXdBPqS8ZFiJF4qg
	 f/QXlTXpGBSM23BTwR9EAXNQNOKqqtEGO5IRufkP2wOnMN1FWdPrAbVuvsiOFGG3rN
	 QaxybdqIqYzh2hFqs3+/NZ3MjSidpZWVHDhORUTSgjHIAKnlN1YFcloHGC1+JsLkHS
	 tllH2eiQmYO1A==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899ee491af3so4802846d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:12:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWlq9u8zYSqMDVqbh43usU09FCy43WmBfhL0euBjRmZ69rdWuHj//WS3FkGq0m0XpFaBVLeek5ckekvkMQLsDF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ZbxIGruTyKuuKP5bCwhFHosIyH2FA5URX5NWdBW89IbBCQ1c
	UX5UPR4QZZMmKqryEQXGI86wWgrGD/TI0ctj10gtkghXYg8FUwxJpKrOoRhMBAfyj+yXX0ikxaN
	9btjxDs1otVJ3upEN3iM9S/woA1chk6A=
X-Received: by 2002:a05:6214:19cb:b0:89a:6353:ac1e with SMTP id
 6a1803df08f44-89a66a24d02mr63591736d6.11.1773270767400; Wed, 11 Mar 2026
 16:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <ec379ccc31c1bf49d918228eaa1ca016e99f267c.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <ec379ccc31c1bf49d918228eaa1ca016e99f267c.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:12:36 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4RrMdW=wfaEboDLrqRrObCmtd9RVTPN2-t01eOonEzpw@mail.gmail.com>
X-Gm-Features: AaiRm50xGeBZSWsH7yQEsvoXAOzI86kL7g2mU0OdtRzDad4qKy-8PbTjs8zPtKU
Message-ID: <CAPhsuW4RrMdW=wfaEboDLrqRrObCmtd9RVTPN2-t01eOonEzpw@mail.gmail.com>
Subject: Re: [PATCH 04/14] arm64: head: Move boot header to .head.data
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
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

On Wed, Mar 4, 2026 at 7:31=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> The arm64 boot header is mostly data.  Move it to a data section to
> prevent objtool and other tools from trying to disassemble it.  The
> final linked result is the same.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

