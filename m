Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D4DCFA47C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q/1ei75nEHg/aHDZJAqK/yhvQRCfhO2n3laUBetVWU=; b=GYaZdzaTjfng+iNwE6d1B5IRrO
	wcDq8MPhBIDjEK0V6SuGtClyeUCFpCrybW9qi6Oi4vXG8X92DQEWnWdK8B9dnqIFt1Gv5n7rZkCG8
	MqF0L1mQi8IyJMIgoYGz649Uq4AM9ZoQhHOnDg5qXanb4485urNtIHwcSAMqyT5F04XbwuAhUa+HV
	W1ITTZ0yK3lf9Y9oosPATmlFMIFgn80RW5g51oDmDM+bRU3/I6sEYCI0cdSNRjxz4hmre38FgRlMQ
	/8vIQLCpZsO+KiRIev6MUNJJFQlsf87Bphd+D19s8Eeb+R7+Cct7mpqOkXVL5Ugo7WQkr1INTDVCp
	cwrPsXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSFq-00000008X4Z-0EY8;
	Fri, 21 Nov 2025 14:36:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSFo-00000008X4L-16yr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 14:36:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59DD8605D2
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 14:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E94CC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763735811;
	bh=SmBuQ9/3jkzBF6e+X6HfAqHhQQeAfwauHNiCwCHezeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hWSFHcysSdwZQUrKk+WqnHZKql8r4fws5zm+ngQOYlYGCd+lEP9qJWgKe+itDkptd
	 dQykKBD0J6RuNCeyAZBQ9DIuPET5rjB2B31vmzxOf1Fh5/8fkyBGbdNb45kjn6UBZL
	 9CHkPCiTNfG3GPecygJfoQ1JIS++/JIerWIyKnHuhw6c9oUDxG5dc/zqOBbJNm6t17
	 T1S+QVYU81Ydq9o2/b38VgYADoJ43W2LSaQQnKcHbcCfLgE2kQzAJ/iwrT1OMXyTX6
	 GdCeuvzJiqRKWvv3aNDBXImbCSRXGbZf33YBIAckFfEsfBBn/SeSIA2UNJjlB/ClH4
	 q5oTM34g4RCvg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7277324204so361941666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 06:36:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIq/Jxl4an/EITyFu+yU6W+YBHAQPArb/Bw5ue8u4i7GHyJinDjvw/jZB2MRO0DaGD6hmS+U0j1CWFtVroQFoI@lists.infradead.org
X-Gm-Message-State: AOJu0YwmW9okCGV23nhnOyv4bDdK8YyZVBF7WHyhXJRarr6C8pJZmrpc
	x9YyxLUYsBIIumtsvzEF+DE4KLFZ0Zt27/sOh8MAr3QaZH6H4D4oRQM+esHziuqtmqSXeh8TEQ+
	VHD8RzUxMDadxS7fdgvdYBW6g9eVkHKw=
X-Google-Smtp-Source: AGHT+IF99ZcOKZxwHhj61TbMLuNJeoS2wkCa3w0U0FmKNTTd0uxPqztc32MWgNrKH3nOf/+gpJAsTUn3W2sc9TU7vnU=
X-Received: by 2002:a17:907:7286:b0:b71:ea7c:e509 with SMTP id
 a640c23a62f3a-b767173189bmr313742466b.41.1763735809607; Fri, 21 Nov 2025
 06:36:49 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
 <32s3lvzfu6jkyho7qenrqbsm5wkgjnzn2imdp6tfwycmyxpzgu@kg5367uxmxii>
 <CAAhV-H47fzaKcMhgLWWOTxB+srBsg85-eK0LW1vQXQnvq32-+w@mail.gmail.com> <aRsH7RTpAah4g5Xr@willie-the-truck>
In-Reply-To: <aRsH7RTpAah4g5Xr@willie-the-truck>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 21 Nov 2025 22:36:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
X-Gm-Features: AWmQ_bmzF-PBbbGb1pyM-7ojfFGXsdzHVd24-gNLEumxbI6shCwp2NX04xLwnRw
Message-ID: <CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Will Deacon <will@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Ard Biesheuvel <ardb@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Mon, Nov 17, 2025 at 7:33=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Sat, Nov 15, 2025 at 11:16:42AM +0800, Huacai Chen wrote:
> > On Wed, Nov 12, 2025 at 2:00=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> > >
> > > On Mon, Nov 10, 2025 at 03:00:00PM +0800, Huacai Chen wrote:
> > > > On Mon, Nov 10, 2025 at 9:19=E2=80=AFAM Tiezhu Yang <yangtiezhu@loo=
ngson.cn> wrote:
> > > > > If I understand correctly, I should modify this patch to remove t=
he
> > > > > changes of arm and riscv for now, do the changes only when there =
is
> > > > > a real problem or requirement some day, right? If no more comment=
s,
> > > > > I will send v3 later.
> > > >
> > > > Now everyone involved agrees that the efistub code is correct, so t=
he
> > > > proper solution is to fix the compiler.
> > >
> > > Hm?  I don't see how it's a compiler bug.  It's really just an objtoo=
l
> > > limitation.
> > >
> > > > Changing efistub code and changing objtool (ignore __efistub prefix=
)
> > > > are both workarounds, but I think changing objtool is a little more
> > > > reasonable. Maybe Josh has different ideas?
> > >
> > > I thought the conversation had converged on what Tiezhu mentioned abo=
ve,
> > > which is to skip objtool on libstub for loongarch, but leave the othe=
r
> > > arches alone.  That way objtool behavior is consistent between loonga=
rch
> > > and x86, and objtool doesn't need to ignore any prefixes.
> > >
> > > So basically, the v2 patch minus the arm64/riscv changes.
> >
> > Hi, ARM64 and RISC-V maintainers,
> >
> > Would you mind that this patch modifies the three architectures
> > together (they are exactly the same style now)?
> >
> > Madhavan is the author of ARM64's objtool, I think your opinion is
> > also very important.
>
> arm64 doesn't (yet) use objtool.
>
> I defer to Ard on anything relating to the arm64 efistub. Reading the
> start of this thread, it doesn't look like he's convinced and I'm not
> surprised if it's purely an issue with objtool.
OK, I know, but I have a concern.

Ard said that he is reluctant to make changes to accommodate a flawed
build time tool and there may be regression risk.

So, I'm also reluctant and don't want LoongArch to meet regression
risk. If one day LoongArch has a regression, we probably need another
workaround to "fix" this workaround. But if these three architectures
change in the same way, we may have a chance to solve some fundamental
problems...

Huacai

>
> Will

