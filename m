Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403EACCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89cRzzqz8Js5vdhjjRaHNtwMWWmVjs+lqcJ+/UlSci0=; b=QEkxOtpd87Z/eUIKn+/E/BzOrs
	ysQ3a/XmIgbueZ0uTaBpeATSUM4/bTwF9LIkOk1lIqMSVVmiah29lu75a1B/9zZGyb+F1OV3mV39J
	vUuJK6K+MpiDj9XvCRMvz9/l7qTrTXeLMO6gtkppW31QZe9wU1nMdJyYrTt4ywS7hv+eoW2z+H+87
	D1douUi6idQOVM0akRU3qZFX/XBfAEo5M1iYsDNodN0LSOz2LwZ2AEQUer7GUWnmgyGdzFK4tu5f0
	2ohhDh+z450yvTrWoVhRKkGghCsWnIMnLUE4HL008XB6atiHiYW6SxNgpiZb53mwIreUDLd7Qtoma
	gwQV6W2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrZ2-00000007Uau-0Ebb;
	Tue, 11 Nov 2025 16:49:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrZ0-00000007UZm-0U4U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DE50601FF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 16:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F040DC19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762879789;
	bh=wq1eQ9leJJwsRbg+q/+CeM5Q/J0QheoRni5LdAnm06o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fiwtCZI/RQq4oBC46/xhxQq3J73AlgQ6n72JGFoufSVUBodKPipPpSXecDmCOtlcN
	 l9DmQpbKhP0jUakBR/mK/b175IhYWYq/lC0EpGarLBQLnFG8rVduIR0o4yDDNsffBr
	 rLyNcQrZDDVvXw9ofETH3N5GzZgEzDR4cGR/oLHarLh6SLU1zb7ik+0sPkL7TkrNHF
	 Bjc5JXOCiHW2/JlcBD2hG4TGtDQSELoUQRBpcPZ064efLGTrO6LkEdCSCmYvpMc/sO
	 KYQuxKwFVZcNnzpw1nic3w+p9E/bPzGz5rz25JWvo/qgJbCHjzStzXmVddonm6IxCn
	 2X89RgecCdRQQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5930f751531so4105978e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 08:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVuxR4gZHW03uKgJzP63OYxWMFwISK7QJtRPjvRt3qcw28cr52EHB8TAd2/m2Ee72R4pi1TyVliSWxy5v5fupG@lists.infradead.org
X-Gm-Message-State: AOJu0YzjZo3036nXlx1nKyRS8T7CG635sOa7kjZidm65nyNngbUtvWpz
	WYGUbR7wv5DHdVA9mgqc6zAz0hUAJqniQG96Fw2cRar2bEqrvM5GQRHNTIkq6o8S0OCGFhm9spD
	5HHsTawrMWXpwlpibEKHy9b2wgZ4I9F0=
X-Google-Smtp-Source: AGHT+IGZvHuVSe5iJqYbExFs6eVBWwDag21rIO8Pvby8ZgKm1I1ZyqlWZO+zj9tOa/l1dRnmZWL6TeMz7UocLRGfN6w=
X-Received: by 2002:a05:6512:39cb:b0:594:2f38:4604 with SMTP id
 2adb3069b0e04-5945f1b757emr3766330e87.41.1762879787245; Tue, 11 Nov 2025
 08:49:47 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
In-Reply-To: <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Nov 2025 17:49:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXELVc6AMXgUnjEuoetEYqBkBE3+nFH4--hFQaFGBTF3hA@mail.gmail.com>
X-Gm-Features: AWmQ_blkkBK4eB_glR3-UhpCiwa3bDzaFeiiqfcHKYfJl_7P3Ja2j5gP_FB4hrI
Message-ID: <CAMj1kXELVc6AMXgUnjEuoetEYqBkBE3+nFH4--hFQaFGBTF3hA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 10 Nov 2025 at 08:00, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Mon, Nov 10, 2025 at 9:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > On 2025/10/28 =E4=B8=8B=E5=8D=889:47, Ard Biesheuvel wrote:
> > > On Sun, 26 Oct 2025 at 12:20, Huacai Chen <chenhuacai@kernel.org> wro=
te:
> > >>
> > >> On Thu, Oct 23, 2025 at 4:07=E2=80=AFPM Ard Biesheuvel <ardb@kernel.=
org> wrote:
> > >>>
> > >>> On Thu, 23 Oct 2025 at 10:01, Huacai Chen <chenhuacai@kernel.org> w=
rote:
> > >>>>
> > >>>> On Thu, Oct 23, 2025 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@lo=
ongson.cn> wrote:
> > >>>>>
> > >>>>> Hi Josh and Ard,
> > >>>>>
> > >>>>> On 2025/10/20 =E4=B8=8B=E5=8D=882:55, Huacai Chen wrote:
> > >>>>>> On Mon, Oct 20, 2025 at 9:24=E2=80=AFAM Tiezhu Yang <yangtiezhu@=
loongson.cn> wrote:
> > >>>>>>>
> > >>>>>>> Hi Josh, Ard and Huacai,
> > >>>>>>>
> > >>>>>>> On 2025/10/18 =E4=B8=8A=E5=8D=881:05, Josh Poimboeuf wrote:
> > >>>>>>>
> > >>>>>>> ...
> > >>>>>>>
> > >>>>>>>> But IIUC, the libstub code runs *very* early, and wouldn't sho=
w up in a
> > >>>>>>>> stack trace anyway, because there are no traces of it on the s=
tack once
> > >>>>>>>> it branches to head.S code (which doesn't save the link regist=
er).
> > >>>>>>>
> > >>>>>>> Thanks for your discussions.
> > >>>>>>>
> > >>>>>>> Are you OK with this current patch?
> > >>>>>> For me the current patch is just OK.
> > >>>>>
> > >>>>> We have discussed this a few times but there is almost no consens=
us
> > >>>>> of what should happen next and nothing changes.
> > >>>>>
> > >>>>> Could you please give me a clear reply? Then I can make progress =
for
> > >>>>> the following series:
> > >>>>>
> > >>>>> https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiez=
hu@loongson.cn/
> > >>>> For me, this patch is OK, ignore __efistub_ prefix in objtool is a=
lso
> > >>>> OK [1]. But I cannot accept the way that modifying the efistub par=
t
> > >>>> only for LoongArch.
> > >>>>
> > >>>> Clear enough?
> > >>>>
> > >>>
> > >>> LoongArch is the only architecture which has the problem, so I don'=
t
> > >>> see a reason to modify other architectures.
> > >>  From your reply I think the efistub code is completely right, but
> > >> objtool cannot handle the "noreturn" function pointer. And this patc=
h
> > >> is a workaround rather than a proper fix (so you don't want to touch
> > >> other architectures), right?
> > >>
> > >
> > > That is my reasoning, yes. But Josh is right that it shouldn't make a
> > > difference in practice, I am just reluctant to make changes to the
> > > code running on the target to accommodate a flawed build time tool.
> >
> > If I understand correctly, I should modify this patch to remove the
> > changes of arm and riscv for now, do the changes only when there is
> > a real problem or requirement some day, right? If no more comments,
> > I will send v3 later.
> Now everyone involved agrees that the efistub code is correct, so the
> proper solution is to fix the compiler. Changing efistub code and
> changing objtool (ignore __efistub prefix) are both workarounds, but I
> think changing objtool is a little more reasonable. Maybe Josh has
> different ideas?
>

Well, given that objtool cannot even infer this for direct calls (and
needs to built with a list of known noreturn functions in the entire
kernel), I think it is safe to assume that doing this for indirect
calls such as this one is intractable.

