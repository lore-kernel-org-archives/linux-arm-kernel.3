Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AE4CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7tbJmNH1DXNfTU+Xp3xL+FoPO8IvUCQ4iTCgB6ek3o=; b=m6rDVmzGMdMwKtSZVnRRMlxn1o
	8OJurH0H+kmVmFg1PoqLRnPGQCOPrHCnsvET+BK4amvVd1yR1XLWSpRTQAWijOY0xxsfh2DWoeR6/
	Dg9OFtve3Mc86GEolccgQMqVaR4PKJRMWrygilElOBZY4f1BEbp3lK/MD8IpBanwE1sHIXO+Qj/qO
	3TQy3uudznbnlFqDfaji+Gtr0p5f6iNqoPOezG9iqOLblQx7ul2/jvPEXBSD6NJqGLacdEnG4XcHp
	woMnlo9Wt1Nq5k0glAHQIUfFUUP0ASQbPm/MbReSOvIbjuY1ekQ96fEABTUG6/pApnljDvOoJpYwB
	Yu6kJrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqGl-00000005SNI-3lSg;
	Thu, 23 Oct 2025 08:02:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqGk-00000005SLx-0Uge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A4C24AA6B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD7BC19421
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761206515;
	bh=m7tbJmNH1DXNfTU+Xp3xL+FoPO8IvUCQ4iTCgB6ek3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RA7j75QVc5ILMBKj/72NMEFdIwS9ZPlfJ+fJQRtKqD0/4aaYhy4lPNds6GfmVwrWu
	 UtqfHK9gl7XEDWTigFsMA54w2QInEqrGnLNBO8Aoy4v0NL7WQgdFnFs6NjZ/b1UaFn
	 sj6UOzmRYkylU87ieA6GjjFup20n57aQmQlUE95CA4nZlsGZcyaBLpdcrrRelcysdk
	 Em77VyHtM7uo7W3ghXZdiwRzsLEmGVrZdCt2U+zEx39jChNcRsO27jUp4vDgH2uXkR
	 YOFNQtkGMCvaNrU7GcXZnQkojb4cm+kctXgFic+peHScM083oEo4zScim4Er6s6jvg
	 nfpXjd6z7zk7Q==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so763203a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 01:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4DUuYI6lT4fEqj/GGDmBu1/dPmvjUHCds7cXrQyYKlYdVXK1HBFew2JScvDGkZmT/2Xsi34SQvlhBhSeoS2xr@lists.infradead.org
X-Gm-Message-State: AOJu0YyXyrCOsgEKrntZZRDed2+M4iUP23caJYJbIucMEWJXI9jbImDy
	ffVWnw18hxtgsQ7oXsSED8GZMiyAYS7mtGA3XfinJDQtaJB09fV0YNnBLa3BAaovvsvAQW0xhJP
	W6BpVyD17XJsNryKPxON4IW/apYB30j8=
X-Google-Smtp-Source: AGHT+IHfBLH/GBfgXrqchxfxu9l1VaoEMJ8tUkoEMadPUjtpN04Dne7DQiXnlqVZI5khk1s5nO6HkYPeLlaWwbhf/8k=
X-Received: by 2002:a05:6402:1e8f:b0:636:9129:882f with SMTP id
 4fb4d7f45d1cf-63c1f6e1e4dmr22674073a12.30.1761206513683; Thu, 23 Oct 2025
 01:01:53 -0700 (PDT)
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
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
In-Reply-To: <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 23 Oct 2025 16:01:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
X-Gm-Features: AS18NWATDqwQc-mvgyc-6ppP82QmD732g4zxHKYB9A2rEPJ5_4tzPE-f0_vNffE
Message-ID: <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_010158_226469_32FCD88C 
X-CRM114-Status: GOOD (  18.76  )
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

On Thu, Oct 23, 2025 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Hi Josh and Ard,
>
> On 2025/10/20 =E4=B8=8B=E5=8D=882:55, Huacai Chen wrote:
> > On Mon, Oct 20, 2025 at 9:24=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> Hi Josh, Ard and Huacai,
> >>
> >> On 2025/10/18 =E4=B8=8A=E5=8D=881:05, Josh Poimboeuf wrote:
> >>
> >> ...
> >>
> >>> But IIUC, the libstub code runs *very* early, and wouldn't show up in=
 a
> >>> stack trace anyway, because there are no traces of it on the stack on=
ce
> >>> it branches to head.S code (which doesn't save the link register).
> >>
> >> Thanks for your discussions.
> >>
> >> Are you OK with this current patch?
> > For me the current patch is just OK.
>
> We have discussed this a few times but there is almost no consensus
> of what should happen next and nothing changes.
>
> Could you please give me a clear reply? Then I can make progress for
> the following series:
>
> https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiezhu@loong=
son.cn/
For me, this patch is OK, ignore __efistub_ prefix in objtool is also
OK [1]. But I cannot accept the way that modifying the efistub part
only for LoongArch.

Clear enough?

[1] https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiezhu@loo=
ngson.cn/T/#meef7411abd14f4c28c85e686614aa9211fccdca0

Huacai

>
> Thanks,
> Tiezhu
>

