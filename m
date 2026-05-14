Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA609CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 22:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vjWJsDk46G5Xa6RBKkWud45eAeGwjVG/8oNCifeuP0=; b=K9PguvGfIdLhHyjhuISAS0qL8s
	ECDgO0L50A36x1yXC99Ra1kWvxP1Eh7YpTapu2+/xUkttEVBkfvc9iVRzcYFw2HX/k3xCn/aiHgyH
	BM7bkQYB+cuj8TMbfNnOg7kYPngUNNCn3ijqQzHdAPglRd0Kg2wbFVlbd/Z/oG7aoXfeFZyY5k3dE
	ntFGztIf2XT+J78L3m38514RI07ok8OWMUwIjOgccLocwuy2vhLVkkDunVBEMsqOmwM4df3thlU/3
	pcpUuiqUJNcF1Mj+lRO4IHNT+xkmujV+6wg955O22fBB45d8dnP3aonxMkW1QsADLZUJaVISPCKpN
	X/SGUz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNeUa-00000006hyA-0dhp;
	Thu, 14 May 2026 22:25:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNeUZ-00000006hxo-1Lyz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 22:25:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDCAD60008;
	Thu, 14 May 2026 22:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2437C2BCB3;
	Thu, 14 May 2026 22:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778797517;
	bh=l4n1GCkss3HdumT9TYk9D1dQsWaT9kxRVhMfzwbcBDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AA1BYrodfUHXEl65jh+fNAg+8mo1kGu/2Jn7U16Af+p0xZjpjjeVcVypmIjHWFAeN
	 NnX0xWg4UulKnyi0CdfCwAs9eWf9S5L0X6UIFX2sMn423HC3Rfgah3UHGleTMxMMgu
	 wHo46egB7gv6NCD3PGDz6yNNbhODIuqC5joMUFqdE04QYrwL/80N7Qtxgju7vL+Tih
	 romzAo6uuFLMuDRDQm4hvE3Afz1z+lCcFMdnYrDxQd+ipgmKqZqVIu/3TVhelVNBl+
	 cUVEivtUcxAOpJLOzi/OKwFLkM5o3YzYnd9OnELchlN4+yrLgyXDq/GP4eyAyvTLsk
	 6tEx23VluLYGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/21] kbuild: Only run objtool if there is at least
 one command
To: x86@kernel.org
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Song Liu" <song@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Joe
 Lawrence" <joe.lawrence@redhat.com>, "Will Deacon" <will@kernel.org>, "Miroslav
 Benes" <mbenes@suse.cz>, "Petr Mladek" <pmladek@suse.com>, "Nicolas Schier" <nsc@kernel.org>, live-patching@vger.kernel.org, "Nathan
 Chancellor" <nathan@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>
In-Reply-To: <8699672b82fef17e73a5f2e5528478778dbdab31.1778642120.git.jpoimboe@kernel.org>
References: <8699672b82fef17e73a5f2e5528478778dbdab31.1778642120.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 22:25:15 +0000
Message-Id: <20260514222516.D2437C2BCB3@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Leaking objtool options into vmlinux.o validation causes a fatal bu=
ild failure (`--cfi requires --prefix`) and silently alters validation beha=
vior.
--

commit 68e454f3a8ccd3d638c67c092eee264996286695
Author: Josh Poimboeuf <jpoimboe@kernel.org>

kbuild: Only run objtool if there is at least one command

This commit splits the objtool arguments into commands and options to
prevent objtool from running when no commands are enabled.

> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 527352c222ff6..09af33203bd8d 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
[ ... ]
> @@ -36,18 +36,13 @@ endif
>  # For !delay-objtool + CONFIG_NOINSTR_VALIDATION, it runs on both transl=
ation
>  # units and vmlinux.o, with the latter only used for noinstr/unret valid=
ation.
> =20
> -objtool-enabled :=3D $(or $(delay-objtool),$(CONFIG_NOINSTR_VALIDATION))
> -
> -ifeq ($(delay-objtool),y)
> -vmlinux-objtool-args-y					+=3D $(objtool-args-y)
> -else
> -vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+=3D --werror
> +ifneq ($(delay-objtool),y)
> +objtool-cmds-y					 =3D
> +objtool-opts-y					+=3D --link

Does this code unintentionally retain the options from scripts/Makefile.lib?

Since objtool-cmds-y is cleared here, commands like --prefix are dropped.
However, because objtool-opts-y is only appended to, options like --cfi
remain active.

This causes objtool to fail with a fatal error: "--cfi requires --prefix"
during vmlinux.o validation on configurations with KCFI.=20

Should objtool-opts-y be assigned directly using =3D or :=3D instead of
appended?

>  endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1778642120.gi=
t.jpoimboe@kernel.org?part=3D9

