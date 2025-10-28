Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924BFCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVjUEKZRgeMgDKNXAgezVSn0xrs6j1yMXphGPwksYBw=; b=i9frRWdiLN8QlOQWqexhsV+dXS
	2PAkTikFCzCPJ5v/Sj5Ig/hz4LF27aLORzDAu5wZgJWNKa9L5vW1g+3RcN1PSDrS8gpEuEKUwCIDc
	HfhXE46iG/suO+m8Hcrg9g8VRyqziFMr550DIrU9WlpnwOYDHQ6sw0XETqAaHL79oCFrZlQGaE6IA
	hSGrFNfCXTKYg9HBOOaCVk2Qx4Fg73LyUrQd2fp2LwCxffBS3CYnqzszqrqHS8ZJDXKI8RWX0bakr
	lstxUdf2n7WGA6E+3oaC3Q4E31uzuFDwgPa1xq3988Q5a32iNih0frpyx/Aoyc8Zozo3AikqbP3la
	6cdPjbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk2x-0000000G1q2-47M7;
	Tue, 28 Oct 2025 13:47:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk2v-0000000G1oo-1W0G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 13:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8577A403E2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B976C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761659252;
	bh=GVjUEKZRgeMgDKNXAgezVSn0xrs6j1yMXphGPwksYBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BCBzeOpVuTtpNnsK/HEK0mvaOH767BgRFEyc3cHrIO1uiPno7n9YbPE0RrBArxZJU
	 W1oBY0fw/FAwbktfbNtUAgrshGxHddq0rN8tOoA4XbxSqmUtrpxUBsI12txQ7WoGpW
	 ZRQoArmgPB6yUM7WhWutdmuL7EdEOUXbQDGy+kXexwRk0gFMBYoD6FrGcjfft1EaO7
	 Yw35Jaet/uAic4eP1VgrZelWiQyauRn+hnaML2Agzj5bHh9X3g7vAs6DrnQSflHlrP
	 1j+pIlVoCla2DQOukwOJTvguGHl/86+1BWvl85Hjah+3g35Bo82ImtyFxIG1M8I0Bp
	 T0vmV1b6La1Zw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36bf096b092so57249061fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:47:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWiq16CTNACY2o8/b5lHqaYygCD4bGhE+ghvmG04zH+RjOS5z8G87roZiqu5XrYED5Xtw3AnJjGy+YdynYGj9P@lists.infradead.org
X-Gm-Message-State: AOJu0YzRb85HWcEFChq8+l4ItHdn+c8OjCNm4JW1kA620uU1BKwMJ5Z8
	oP4WKbymnT3jeUjy62cejPAyCWBHUgUkySfSs70kj7uPknJr2ymeRxJfxhZC90yx9mxIDZ/bCkr
	6mBkaFmD3KTsy+xgOIspUm6ekeyc0NWI=
X-Google-Smtp-Source: AGHT+IGMDRiylwmZD0SBl5ugRhR6rIlFVm0u852ZP1jG9URNwU34wlwBhJJFjd3gP3FgNoxZynY+eRUKXAVIwfZ/a6U=
X-Received: by 2002:a2e:9a13:0:b0:36f:284:56db with SMTP id
 38308e7fff4ca-379077114c5mr10647291fa.23.1761659250814; Tue, 28 Oct 2025
 06:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com> <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Oct 2025 14:47:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
X-Gm-Features: AWmQ_bkAt2Vtj9hvye18BBbdzR0dpGQ4Zhb1DJGs0utdf4kJbulyIP6uV_Jkez8
Message-ID: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_064733_438400_3C998349 
X-CRM114-Status: GOOD (  28.96  )
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

On Sun, 26 Oct 2025 at 12:20, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Thu, Oct 23, 2025 at 4:07=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > On Thu, 23 Oct 2025 at 10:01, Huacai Chen <chenhuacai@kernel.org> wrote=
:
> > >
> > > On Thu, Oct 23, 2025 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> > > >
> > > > Hi Josh and Ard,
> > > >
> > > > On 2025/10/20 =E4=B8=8B=E5=8D=882:55, Huacai Chen wrote:
> > > > > On Mon, Oct 20, 2025 at 9:24=E2=80=AFAM Tiezhu Yang <yangtiezhu@l=
oongson.cn> wrote:
> > > > >>
> > > > >> Hi Josh, Ard and Huacai,
> > > > >>
> > > > >> On 2025/10/18 =E4=B8=8A=E5=8D=881:05, Josh Poimboeuf wrote:
> > > > >>
> > > > >> ...
> > > > >>
> > > > >>> But IIUC, the libstub code runs *very* early, and wouldn't show=
 up in a
> > > > >>> stack trace anyway, because there are no traces of it on the st=
ack once
> > > > >>> it branches to head.S code (which doesn't save the link registe=
r).
> > > > >>
> > > > >> Thanks for your discussions.
> > > > >>
> > > > >> Are you OK with this current patch?
> > > > > For me the current patch is just OK.
> > > >
> > > > We have discussed this a few times but there is almost no consensus
> > > > of what should happen next and nothing changes.
> > > >
> > > > Could you please give me a clear reply? Then I can make progress fo=
r
> > > > the following series:
> > > >
> > > > https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiezhu=
@loongson.cn/
> > > For me, this patch is OK, ignore __efistub_ prefix in objtool is also
> > > OK [1]. But I cannot accept the way that modifying the efistub part
> > > only for LoongArch.
> > >
> > > Clear enough?
> > >
> >
> > LoongArch is the only architecture which has the problem, so I don't
> > see a reason to modify other architectures.
> From your reply I think the efistub code is completely right, but
> objtool cannot handle the "noreturn" function pointer. And this patch
> is a workaround rather than a proper fix (so you don't want to touch
> other architectures), right?
>

That is my reasoning, yes. But Josh is right that it shouldn't make a
difference in practice, I am just reluctant to make changes to the
code running on the target to accommodate a flawed build time tool.

