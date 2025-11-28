Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E61CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ8ZfTi/4LWf2O1wFnzbEPsR0nhqCbQgWTzzMZ/88tc=; b=UOtrqLWK08cSSJDDaQchtpVfpr
	r0PvyZM/ltnAeV502EobTDwUwkIxFk2RA7CEoXHBkseDmZ1E54VXvDfLHVxKNyGvYsTTJFitaj9OU
	dPKZ0Tyh2gveFWl81+JRlDNAO3UF0wGn6gPDj7goVJ8wvrRVxzxqyxoRBTPWqGxaauOrCFnA+2Bse
	Ktwol8kWeQf7qO196A9IFi5QjCKSdnWSoKt5NOompe5T9KhUeDKkAThxui7UMdWJjj0pK576Uv3yH
	3//WirOiwOD55YlxuR5MmtrizReJhB0L2eazutJdZynCHymg04/OHv3q4JoZMCUh9JTGPMNqI742I
	uskF/wUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvRn-00000000Gu1-1zWv;
	Fri, 28 Nov 2025 10:11:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvRl-00000000Gt5-21BA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F391E6021D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 10:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C40C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764324683;
	bh=PWsRhLp6z6n29IRXVTS5+3foE+B/FlguofEGjtrPnAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJqpK8dBqFSb4b0m9DQYK2iaCS3+Gd3oWB596cjJhVJJk/Zg2OiNnqagNQSREoTKc
	 BFwKZDjHcBOAiK604Fkf8TtdXStOcWZ1rY5nJJGfFTmIJHGnYtOTKtpvkLHpg4XAPa
	 J4vFis/tO92GN+97xn7YNGDC/iLi+aRxZVjGqp2bYJTlE4643EWXts7vMqt3Q1AelD
	 W3o2FD6IbaBn2cpuX96MEOmH02WBhpbJFHoUpuJEim6cupU3bg3FVLhl0vksZ3ZWwq
	 0PpEuF61HEL+G5WbZ3LdqHhMKuelrI0kzOEaloaKlgldOsoG6gznCCFq9QTKkwb2Uq
	 RjRS/eD0HIXrg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b737502f77bso243234166b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 02:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPmgSXv+Hd7TsW0Azhce1NbAp+fnA/bYHBPlyOlhM3MNHraaNKqDY1lHOAViQ+zbBpRANxDlQ7ubkVjhUCHWQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YyXlkEju9Py0FVLj8BlrzjtN+4GXDb/bKJiGvfO9a1knU4XJcco
	A7qf0pwqZNFOcRtNWiX6kvZh2JVp/Qs12BYU9s2Fj0qZRzctIzyV/1Wcsw7OSQ2x0YOs6bQ38dX
	yeXb6if7VgZCd9xaesnp3GbhNBLXy9bQ=
X-Google-Smtp-Source: AGHT+IER+7jriN3w9Pv8lhWqhpVubB2j1VJ3WiM2RJPPedEcwCvbKIiBl12aNjVZ1s4Ed6Fb1u3VbAod9cGN/G90Wrw=
X-Received: by 2002:a17:907:747:b0:b76:4c16:6afe with SMTP id
 a640c23a62f3a-b76c5515075mr1672433466b.28.1764324682207; Fri, 28 Nov 2025
 02:11:22 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com>
 <aRsH7RTpAah4g5Xr@willie-the-truck> <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
 <39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn> <CAAhV-H4fHBuRpDEDQrExApgnREJaT8JWUJ2700bEPFxDqToi2w@mail.gmail.com>
 <fc4fa66f-15a0-ebe3-0a27-f3f38b03bbdb@loongson.cn> <pgzg3tdudow4ww3tnqdvmppufbpbf6ws5adjjcwc7g3ou7yoih@mzk7iwh7trbe>
In-Reply-To: <pgzg3tdudow4ww3tnqdvmppufbpbf6ws5adjjcwc7g3ou7yoih@mzk7iwh7trbe>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Nov 2025 18:11:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4t+zYKmVNdjP53XPbvLFtvik1WRGT0NLtQYBU0m=3GVQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkX3iCrwW5eCVl7oUJENC1CV_iFBcerr6LqbeRJus8VyU5MC421CDs2fZk
Message-ID: <CAAhV-H4t+zYKmVNdjP53XPbvLFtvik1WRGT0NLtQYBU0m=3GVQ@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
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

On Tue, Nov 25, 2025 at 9:49=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Sun, Nov 23, 2025 at 11:37:14AM +0800, Tiezhu Yang wrote:
> > On 11/23/25 10:29, Huacai Chen wrote:
> > > Is it possible to improve objtool that can handle indirect __noreturn=
 functions?
>
> Someday that will be possible via a new compiler feature or plugin.  But
> today it can't be done.
>
> > > Is it possible to improve objtool that can handle
> > > OBJECT_FILES_NON_STANDARD event LTO is enabled?
>
> No, that is purely a makefile construct which should in general be
> avoided anyway for a variety of reasons.
>
> > > Is it possible to improve objtool that only ignore __efistub prefix
> > > for LoongArch?
> > [...]
> > static int validate_branch()
> > {
> > ...
> >                       if (arch_is_efistub(func))
> >                               return 0;
> >
> >                       if (file->ignore_unreachables)
> >                               return 0;
> >
> >                       WARN("%s() falls through to next function %s()",
> >                            func->name, insn_func(insn)->name);
> >                       func->warned =3D 1;
> >
> >                       return 1;
> > ...
> > }
>
> That only silences the warning, it doesn't prevent objtool from doing
> the actual stack validation or ORC generation.  Neither of which makes
> sense for libstub.
>
> And objtool has many other features beyond just stack validation and
> ORC.  None of those make sense for libstub either.
>
> To fully exclude all libstub code from objtool, these arch_is_efistub()
> checks would need to be sprinkled all over the place.
If the call sites are less than 5, I think it is acceptable.

Huacai

>
> That would be a lot more fragile than just excluding libstub from
> vmlinux.o in the first place.
>
> --
> Josh

