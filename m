Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0375FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VfD/406RwiCMgcEBlvmZiOjcE4YxqTzVMxVhrToZ+M=; b=LfGNvqdqC8yDkD1K4Z9klHDSH9
	PMwuqsbFSdsGNIF5kmJZEGMCkdfSTeJTdbkZj0bDey2CK3RqsLxHvLfvs81Uvd+b8DCbF1sTO5r5u
	i7X4+fSk7URg22iVnZn+I9aIri0lv8uB0Mn7lbD8ENS6DGSTIViiPtXEzSeHnN1uFaBdNWAabXW0k
	1qhcsCc3gaj0U901HpLAXy0zIT4neHW8IUiqjl86o069gAtkCBfDpV4qzbNs8iaMIu1X/uwmuFloE
	K7wAMD1Xe51mgSR82Bb1zvGk11nqLh9Ahj2wENqlv/Ve6eC0OlFhNB4SxP3acV/9iO2rPbpmD/XeZ
	wrNf7f6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nIF-00000008RYZ-3ZV6;
	Fri, 17 Oct 2025 16:27:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nID-00000008RXz-1YTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B75C04B653
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1CDC19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760718420;
	bh=8VfD/406RwiCMgcEBlvmZiOjcE4YxqTzVMxVhrToZ+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iWOhR5wZY5f4efgdHeBk9A0dCweP+3u1cQnDOe2XVZwcc1wRwNCTgP/muD5ig6YcP
	 PeF6kjDvfnWbEfT5Aej7wdpfEekT7xq1bn9oLTWuTYWoAz2SKh1hLKa5tlSRsQUVNk
	 NF1mw4a0MyQTVXmD2FCkRGr2+OBu8mD123o8LfVZNKkPTGSlEmACDAKqPDgrC+8vXG
	 ENluhb/p+wEIWaz8MidGKvNhHnC20oz8qC8FloBAzkon9MlZTFBZcRXzEtmoiot9Y7
	 fDnd71OoDxAcnUFT/gUy2tUPCRPbA+ra60G0elSXDyAKhgqi0ET42t6dYLePSCgzzS
	 MdZA9zt3hW+vw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59070c9111eso2383997e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 09:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9yOYKHYvr14Mx3SY30pxSdSL5bZcy4Sc4OeElZWCz+HVTevguJg1YPAcBXGWwaRL7DnRdtIDhcg/kTUncwBEz@lists.infradead.org
X-Gm-Message-State: AOJu0YwGVw5817wOFwpeOBgl9c3dTB+bFgjP9esqlJh+ujneNNkgBMw0
	PpK844f3B0xzzC7i4lN9AAvDigcBwkGt1at+ikxz4O+y0+D5u78F/qKpER9/ulK2qk0o18BzVek
	1nYd+7rPnnzD/XbMhVue+myZ9Cl7rPbI=
X-Google-Smtp-Source: AGHT+IFprw8czhfbQksqvWLP33iOCV9x+wGKMsbvBVEwL3PGVUpyMkEAQwIKJCflJAogYYqB0NgG9EMzSKWajs6p15M=
X-Received: by 2002:a05:6512:2c03:b0:591:c202:45db with SMTP id
 2adb3069b0e04-591d8546902mr1595944e87.39.1760718418870; Fri, 17 Oct 2025
 09:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com> <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
In-Reply-To: <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 17 Oct 2025 18:26:47 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
X-Gm-Features: AS18NWDwz4zbZmQW5XvAmIIWD850b5AgZUuR52rVREJ1ppW8ezbZ6L0AdbIPLIo
Message-ID: <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_092701_447918_AC3C16D8 
X-CRM114-Status: GOOD (  41.02  )
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

On Fri, 17 Oct 2025 at 18:22, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Fri, Oct 17, 2025 at 01:00:17PM +0200, Ard Biesheuvel wrote:
> > On Thu, 16 Oct 2025 at 17:49, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > >
> > > On Thu, Oct 16, 2025 at 04:52:20PM +0200, Ard Biesheuvel wrote:
> > > > On Tue, 14 Oct 2025 at 18:47, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > > > The idea is that libstub code doesn't belong in vmlinux.o because it's
> > > > > not a part of the kernel proper, and doesn't need to be validated or
> > > > > modified by objtool for any reason.
> > > > >
> > > >
> > > > I don't see a reason to change this on architectures that a) do not
> > > > use objtool and b) link the EFI stub into vmlinux. If LoongArch wants
> > > > to change this, that is fine, but that still does not mean it needs to
> > > > change on other architectures too.
> > > >
> > > > EFI related boot errors are a nightmare to debug, and I will be the
> > > > one getting the reports when this regresses arm64 on hardware that 2
> > > > people on the planet have access to.
> > >
> > > The idea was to have more consistency, so vmlinux.o never has libstub,
> > > regardless of arch, but that's your call.
> > >
> >
> > The code in libstub ends up in .init.text, which will be mapped
> > executable during boot on architectures that incorporate it into
> > vmlinux.
> >
> > If objtool validation is never needed for such code, on the basis that
> > it is not actually called even though it is present, then I think that
> > is fine.
> >
> > For the other architectures, I don't have any objections in principle,
> > I'm just being cautious due to the regression risk.
> >
> > > I'd still propose we keep the KBUILD_VMLINUX_LIBS_PRELINK mechanism to
> > > allow other arches to opt in as needed.
> > >
> >
> > Again, no objection in principle. To me, it just seems a lot of churn
> > just to avoid having to teach objtool about indirect calls to noreturn
> > functions.
>
> Well, one of these days we will need to do that with some kind of
> compiler -fannotate-noreturn feature or plugin or whatever, but this was
> more about "why are we validating libstub code anyway, it doesn't seem
> necessary and x86 doesn't do it, so lets make them consistent".
>

Sure. So objtool validation is not needed even if the code is
incorporated into vmlinux, and therefore mapped executable at boot?
I.e., objtool does not check for gadgets or other things that may be
problematic even if they are never called directly from reachable
code?

> > > And that variable might even be useful for other cases (x86 startup
> > > code?)
> > >
> >
> > Not all x86 startup code is in .init.text; some of it sticks around
> > and is still used at runtime. I reckon that implies that objtool
> > validation will remain needed for that, no?
>
> I wasn't aware of that, in that case I guess the x86 startup code
> belongs in vmlinux.o, or at least the runtime portions of it.
>

OK thanks for confirming.

