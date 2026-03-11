Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BE7103E2F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 23:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDPg8qf8xdrRI894T1OsukqeV6KcF1pYEK8cy3HwHVs=; b=x44Zw+gxyl2yI2L27QovSwtLxp
	SzErC5mD5+WlIcUVSKHI1dQ6O5ae7H/vE9XnDMQ92Ef3Es58bK+hV0+MGTK55OHwV0d0BzoPLHIyQ
	hTWcmMrI89pLjA0mMA5vkRHf7ja5bH8glymX2u3Q7xBLnmq4fVnaDPSDTlf2vMhOgq0CQJqmZ9JUY
	x7PDCymEKnIZdIuOJuScF0BL/ujcWQVoVqNC36ZP9AST0J2tYBeCaSjmVnyOxLBolFNcfwfoUQkiZ
	WmsOohXsKGYU9fLCX19hZEzZxtEdfC9MCPQ+m77GKtGE+0wlLCwe0Jjya08wDZKkdFj4tHot5yAS4
	8rfsbB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SmI-0000000CmhH-3XCD;
	Wed, 11 Mar 2026 23:15:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SmE-0000000Cmg0-0J93
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 23:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 812F960141
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F015C4AF0E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 23:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270941;
	bh=tAX27w1ClGrm27ttzVo75rXyxC8Tz6Oha3WktnTKOE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ooyPSvBCFajql2Ep/5K5qokahjigO0axg2RMrdykjnm+XGhXr/OnrUpNUNQuh91Oe
	 DDHtl+6OVGW2lNNZRZL7msM1I2HNIjLEBN1Xsy9Gxi0eLdl4CVdjegPaww5ifaGArT
	 HtqRq8UWP5PS0PQdDDhoJhy9HjA54LaP+vL4TMoEteM+qZSM1Ujfd7btbMvvcX3mU0
	 qQdTi/C7VXotc7liFbfr0GnJH2Y4GbruiV3rzR4itcemMrr92zDgODQzKNB0vYdaMC
	 HxwfdNxQVl6fzax/n6O43FWg2Qfa0iArCp6PYpLk+LJ6riZGi9iongyi8/hMw0UXUS
	 k8UaYXmaaju4A==
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50905b779dfso4394201cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 16:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOZgv0S20VoRLmMMDKGcNtLUQyl19bUaSSY35lx849XE9Ae5FtNEcAsluzSfg/yeqUAfEYvLOJtft7SnlujksQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzHCyMiDt5nX2rXL6Y930ik9VBIyuQt7Ms5Rzluf+LOkwv6bsme
	fpkdE1muwHHKowB2KdyTecH1ZReGtsq0aU8uHIdXx+C4lYOjlB0lFGNPT6F08kk8WtiHiWF6vti
	tiNVGmgbSZzPyZcilNfYaCuiPq7wES/w=
X-Received: by 2002:ac8:5893:0:b0:4ff:c17b:5ab0 with SMTP id
 d75a77b69052e-50939f6cc8bmr61579481cf.9.1773270940398; Wed, 11 Mar 2026
 16:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1772681234.git.jpoimboe@kernel.org> <1cdd2737d2db5a300eea971382c5e8edda7fb474.1772681234.git.jpoimboe@kernel.org>
In-Reply-To: <1cdd2737d2db5a300eea971382c5e8edda7fb474.1772681234.git.jpoimboe@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 11 Mar 2026 16:15:28 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7DXkCpuA-K8KJz=ViG4fJTVhpXbiYoEs5LjwrQRYoeqw@mail.gmail.com>
X-Gm-Features: AaiRm52pQjRmKTr96uU394J28OHiIKkdK4Vv2r4jR0PViDmqztJOGlWlW8qDkxo
Message-ID: <CAPhsuW7DXkCpuA-K8KJz=ViG4fJTVhpXbiYoEs5LjwrQRYoeqw@mail.gmail.com>
Subject: Re: [PATCH 12/14] objtool: Reuse consecutive string references
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
> For duplicate strings, elf_add_string() just blindly adds duplicates.
>
> That can be a problem for arm64 which often uses two consecutive
> instructions (and corresponding relocations) to put an address into a
> register, like:
>
>   d8:   90000001        adrp    x1, 0 <meminfo_proc_show>       d8: R_AAR=
CH64_ADR_PREL_PG_HI21  .rodata.meminfo_proc_show.str1.8
>   dc:   91000021        add     x1, x1, #0x0    dc: R_AARCH64_ADD_ABS_LO1=
2_NC   .rodata.meminfo_proc_show.str1.8
>
> Referencing two different string addresses in the adrp+add pair can
> result in a corrupt string addresses.  Detect such consecutive reuses
> and force them to use the same string.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Acked-by: Song Liu <song@kernel.org>

