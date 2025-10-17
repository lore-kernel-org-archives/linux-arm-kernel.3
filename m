Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01EFCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qKoqeZEFFOD2RlWkl69ruJZbnMDtQNF0IQVriRGDxI=; b=sE/l/VrQgivZ7fAXg4GrF2vVVh
	6oYJRonIIYY87/1Y7CEeRsVhWF9GWyQLUu6r3QoRSIv+zyhLbJfTklGHesjayx/t/S2pEGHKLpCp1
	JdEVN1w0vS1Pj/SqrtjTXh4AmBiW0/WxBHFqHEeIDi3MnrEj2++ZQzhb8xSp5IBYfxyK4++rjTjg7
	nNOmoEM8AxbKa8Pog9Ijs5BdY4pLR/frQt5atNvHMlAxPgIM+z9o2nKXU9kQIakb6C2vbDCzqhEnL
	eIHubxTlAwOvf1RE7ZtddSDk0qVCcbGBGMTWcOD6R8+NRWaWCIpkrhQFbbBttAVuCIH0Y0LAJO0J3
	Qu2D0ZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iCI-00000007bdW-11Fb;
	Fri, 17 Oct 2025 11:00:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iCH-00000007bdF-0QPu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 082F56029E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 11:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB381C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760698831;
	bh=0qKoqeZEFFOD2RlWkl69ruJZbnMDtQNF0IQVriRGDxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EWvUWl5nqTu29sldpT18woB5mT2hLN7XcQmiPTwyYqdXHu+jnVksMP04uDJo2FWId
	 4waqpD0TRzeyYRxJyOG+KEvd5B4kPr3T4CVxPDayI/eVuAIa7DeXuZSrik+8eZN7v4
	 LOuqUX8hLZGgrZq0E+I+Ne/tD7zeWxatENHTNaQT6XhXdB9sD/ewxDfqRU3BdtbZdG
	 QPZMDM+rejO5ZkUON1ph6fVZPVRUKL2HLcUQ/mDGUCK/bLV5XfIqQh99SGJsRbcg3Y
	 4ahOPJqRncQedXOEULxkPrZ+OpZ+tWNuIZLVsrXnJIW3z5j28FogNDbN/BmUf7rz89
	 mpc1xYLK4W6Xg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso2544110e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:00:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAWBjGM8lRtJQZpbZmdxOOu0DVPQOdikERX7vGTfOavME/TEbp90YOxUCpRL2Qmw2csB3y866kAeOeQ4aoXYwh@lists.infradead.org
X-Gm-Message-State: AOJu0YyK9B0UE+er8lGwgalSR02fiaJOs+T3WIdyvXP9zMpfn408Uyij
	PjC+YUWohyt0jsoAu0WTtu8RlwZcM12DfvSKVm4pvsn5MSy1LDGzYArjJWtyr4+WKZWYebKUL9e
	BhmOfEBMKVQjXe9NV6x8IE64eR5qcQW8=
X-Google-Smtp-Source: AGHT+IHxN2kS3odkWkazx6Kii1GVS0Wt6GhSEw2kpURhNsBRjiYw7sCxVK13poY4URZHjBG3Xbuf2j46mmtwgrQHRjc=
X-Received: by 2002:a05:6512:3b24:b0:57b:8a82:1dcf with SMTP id
 2adb3069b0e04-591d84fd0c5mr1144213e87.18.1760698830068; Fri, 17 Oct 2025
 04:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com> <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
In-Reply-To: <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 17 Oct 2025 13:00:17 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
X-Gm-Features: AS18NWCIYrjb5KW9LhHY0tpEoyBeBcU1fB0oUJiskEYiezDhT-2dTfp0F9THCv4
Message-ID: <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 16 Oct 2025 at 17:49, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Thu, Oct 16, 2025 at 04:52:20PM +0200, Ard Biesheuvel wrote:
> > On Tue, 14 Oct 2025 at 18:47, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > The idea is that libstub code doesn't belong in vmlinux.o because it's
> > > not a part of the kernel proper, and doesn't need to be validated or
> > > modified by objtool for any reason.
> > >
> >
> > I don't see a reason to change this on architectures that a) do not
> > use objtool and b) link the EFI stub into vmlinux. If LoongArch wants
> > to change this, that is fine, but that still does not mean it needs to
> > change on other architectures too.
> >
> > EFI related boot errors are a nightmare to debug, and I will be the
> > one getting the reports when this regresses arm64 on hardware that 2
> > people on the planet have access to.
>
> The idea was to have more consistency, so vmlinux.o never has libstub,
> regardless of arch, but that's your call.
>

The code in libstub ends up in .init.text, which will be mapped
executable during boot on architectures that incorporate it into
vmlinux.

If objtool validation is never needed for such code, on the basis that
it is not actually called even though it is present, then I think that
is fine.

For the other architectures, I don't have any objections in principle,
I'm just being cautious due to the regression risk.

> I'd still propose we keep the KBUILD_VMLINUX_LIBS_PRELINK mechanism to
> allow other arches to opt in as needed.
>

Again, no objection in principle. To me, it just seems a lot of churn
just to avoid having to teach objtool about indirect calls to noreturn
functions.

> And that variable might even be useful for other cases (x86 startup
> code?)
>

Not all x86 startup code is in .init.text; some of it sticks around
and is still used at runtime. I reckon that implies that objtool
validation will remain needed for that, no?

