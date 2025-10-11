Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A235ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 02:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BsgeZrUj1KXKp6RgSEwCit69Zxybcd5U5cra+JDpqs=; b=jaeUz9GxfETdyXlBHWE0Hmlg5+
	Op9VoPqLc/eoxtJM4hClwtNRnszuQATlMYSyPaKXbK/dxNGfmw35IBaXbqHh4zsX0o75yv504Vwzh
	xsy/vGjDAfxicjJnJZiJW70Z2G+6S0/2wmZAU/6n6vJVoQF5CSSDPO47Z7lCCA0qujxec15oFEqbO
	N3Qzku2f9R3BYT4DUxgFl47WmpHg4GqsE9VLQUGOf4MQTsOgk1c7ApejRRNH7EJ9FqFgSfwdeSTjk
	NnkrQmPhoM7D6dEiyl9YAGH7uHxal31awxQDV6VouPD4p+9K1whsJbpzlh7WpIA0asny24W6oiM5A
	G02kXC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Pko-00000009iEQ-1inI;
	Sat, 11 Oct 2025 02:54:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Pkn-00000009iEH-2CPM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 02:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D0706025B
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 02:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B5FC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 02:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760151280;
	bh=0BsgeZrUj1KXKp6RgSEwCit69Zxybcd5U5cra+JDpqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AopT685ZVyiq/B13YoWAdE/uU7ZByQOi8O//wNShEHRW/aN7M8he3IudB6pmzAhLk
	 rsxTX5qL0jtNz/l3oj+f0O5j2/bPe9ffDzsjX66OgRuL2Ef2BCCOPyXULb404xZmDn
	 Use3yrTlDNkLxKts4HbYNtXaA526ofA0016/swVhUnIeUhOcJO6mbBXnQQeEMNDn5h
	 0yOE5FNaknEXbNoOUgIJA0IFog+fl1XOO3BpHi0Ei43RiQPLtNTYovB67pjNJnb+u2
	 lwD76XIrCBkRfaDb0581OJe0haU56lUwPm8Iw0GPLpOK0EuuP3BSEIjapKAIXp9XUN
	 1kVyCSEUYol3g==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so5292967a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 19:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWD4ekiDj+TL6M93CYw5GmJ0Kcfjl2KB08+ZQ3N58y77RF/2kQ4KkmnBOieGNrsjH/YEbq7Yk+UQXKjXUdm0U9x@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg97xoJL5OqcGkPIgXoemgPQ1yEf/kmhPFvBJpLQMyQLAdtXZm
	n+jodhs3qc1hd4EUbtmYqHv1pYrrHLqYge3s78VIW0IQ2jMv9ALuTM5IPcz7SE8xiOMj61IlvQ7
	qcR0if4zAv+MduafH1ZpGSLra4Aeb8CM=
X-Google-Smtp-Source: AGHT+IF9JxI+9VeTgFvdqyJbZPk/80hHvb+lokzIbLfoZR2oxQr/1YSDD9mWyNinLrGKRqjQU4ppDgkuAk1ji6g4P9g=
X-Received: by 2002:a05:6402:194:b0:62f:2f9f:88bf with SMTP id
 4fb4d7f45d1cf-639d5c76af0mr9286969a12.38.1760151278841; Fri, 10 Oct 2025
 19:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
In-Reply-To: <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Oct 2025 10:54:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
X-Gm-Features: AS18NWBWal44DW5X5_JBBkD_g1Z13iGjEk6ARiGEjcxdbyEFQrUdwFzObW-aflA
Message-ID: <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
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

On Sat, Oct 11, 2025 at 9:13=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/10/11 =E4=B8=8A=E5=8D=8812:25, Ard Biesheuvel wrote:
> ...
> > Why do we need both (1) and (2)?
>
> Not both, either (1) or (2).
> Which one do you prefer? Or any other suggestions?
>
> Taking all of the considerations in balance, we should decide
> what is the proper way.
As a summary, there are three methods:
(1) Only link libstub with vmlinux.o during the final vmlinux link.
(2) Remove the attribute __noreturn for real_kernel_entry() and add while (=
1).
(3) Ignore "__efistub_" prefix in objtool.

Josh prefers method (1), I prefer method (3) but also accept method
(1) if it is not only specific to loongarch.

Huacai

>
> Thanks,
> Tiezhu
>
>

