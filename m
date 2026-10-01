Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25B8CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUgg6Q6C7bmDuxn2xo5vJ0z9fBM6ieoXi9Gwqqo6ztg=; b=F8LSOWs4lgP64PnULJaYSaXL3m
	bdQA9yomg85r7QIEPxKggg5h40qbTJJDL0br4GBx48hzCfxDLAb+GKOyxgHTPzLD61JpQrQhmZsBY
	ULqlee5vdc+bWCM4WnNpDPkDwc9LguoKA2dzZpILwT1Gp1eFIm81XpiowgB1biZaIxxtvCyOcFzZK
	V94MSToAbF0upnboVCwjGnb2wNinRnIBN1Y/1+QBcyFe8xsiuIhxCEo9wUfKoZ1DajTSHtBA2B1fu
	rXS0TdQjjl433UA0OAoDM4JHZXtlIPs6V959lv81e6hm/T8zpyuQ7xxsao9S6iYSvyv7K/WSK3TMb
	dKLqrMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMOo-0000000A4ht-3eps;
	Thu, 01 Oct 2026 19:24:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMOk-0000000A4hV-3Pw6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:24:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9015241A8D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BBB1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 19:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882694;
	bh=vUgg6Q6C7bmDuxn2xo5vJ0z9fBM6ieoXi9Gwqqo6ztg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hE40VTv5kwI5vC8qst+3Ul5mT0paNlCQ+tf7CAY4EHEkad3Nu5hQAnl9sDO34Uc0T
	 YrVoz5Yw1WccIZzYQFyvFfnow3Gd9+veVtMXJVaJ41gEnU2Blv71WjfVfE1YG3Tkrq
	 580XnIWKwqe+M1s7w27PmqMFE6UOviplL3z3V6CS/A87ABMKsT+Wh8Rhgf6u8pIQ00
	 5lHnBb9fw820KAJvWsLfoxtfNfiGLLPPlP/ZskPfW1EqwC41p1o63Ymg8kXMcd1pRI
	 eIHpCCp2qzYzvwoy3NDA1DQ+NgOttFGltKFKhDoBo+V4cyI4JmWYM4kq6zAaWRitzl
	 VP9b/mYLMmt1w==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so34380761fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3YuhISf1n0PyBE8KjgF9uEnkfCRK73XEQZVKFtebuig0Q+dOZ5gmqZFgJxmX6NGnol/qcWH0VxR5RYQHNFNCT@lists.infradead.org
X-Gm-Message-State: AFq9FYJAD0YKGzoT2ns7mnoMFIeIeQ708l1YQ2agNRPmrtwdLUfhf+Xd
	dUoqRzhdh2LdGwAyT3iN59yRCRR0RQnC34JF57/6SkZOAGLohs2GCNb5ASlrev2Cvi8/c8eK9vC
	P240GGzyUHSsBtIYQr7aH0QITgeb2AcM=
X-Received: by 2002:a05:651c:1987:b0:3a4:68f1:8bee with SMTP id
 38308e7fff4ca-3a7833da2afmr10860121fa.6.1790882693269; Thu, 01 Oct 2026
 12:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
 <20261001-striped-polar-tuatara-d66794@quoll>
In-Reply-To: <20261001-striped-polar-tuatara-d66794@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:24:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4Kyzi51qm1_N459xA6jxZR_97xGa+wuUQZLB_uU0A-g@mail.gmail.com>
X-Gm-Features: AclHuK-limh2gCePDThBkjOajbz9qF9G52sFUd6I5HvvxJLugmHTOb6rOCipE6c
Message-ID: <CAD++jLk4Kyzi51qm1_N459xA6jxZR_97xGa+wuUQZLB_uU0A-g@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 DTS changes for v7.4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Thu, Oct 1, 2026 at 2:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> > Linus Walleij (9):
> >       ARM: dts: ux500: Make panel regulators have unique names
> >       ARM: dts: ux500: Harmonize GPIO key names
> >       ARM: dts: ux500: Add the Imagis ISA to Janice DTS
> >       ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
> >       ARM: dts: ux500: Add new AB8500/AB8505 regulators
> >       ARM: dts: ux500: Fix up regulator assignments
> >       ARM: dts: ux500: Add sound DAI provider cells
> >       ARM: dts: ux500: Convert HREF audio to audio-graph-card2
> >       ARM: dts: ux500: Add Samsung phone audio graphs
>
> None of this was in next:
>
> Days in linux-next:
> ----------------------------------------
>  0 | +++++++++ (9)
>
> Commits with 0 days in linux-next (9 of 9: 100.0%):
>
> What happened?

I've never had any -next tree for this SoC, I always just collected
the patches and used the SoC tree itself as testing ground as
for most minor SoCs...

Yours,
Linus Walleij

