Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FDECA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=is/ngq975mUjUBzTdIqiNV/aCl6skLZgP+5C7ZZcfo4=; b=idcKXCTxSLVJA/
	eok4+zvQIdjINo688bOHyxk/rejqXR5J0ZOlw4ARHKdaZ/GgtM9NWOt+gztmjP/0Nevs5t2n5Q2d7
	3PqBYdvC/4aslXY/8viY31zdrTSJSejmRzEg5gvWgyXif3daG9Zj3gl6Bcn6SMFf1w/0g46uFVOe6
	kubvnmMXxkeq8TY95xRv0Kw8U2xINLzFSO/Cxa7gu+DHv7aoWyWEGfNGJj099zAoWMQP1usWBuRtD
	VWCDlda/fLWhNPeEwJVrqLt9Guara1F3dL/89lf19OUjlsQBEc9SBjtivx6wgbEquId8+MrBPs3UR
	+XXQcKdDhdufsBExQUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCJM-00000008CCI-1Co9;
	Thu, 01 Oct 2026 08:38:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCJL-00000008CC6-15Kk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:38:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D31004353C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 08:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D561F0089D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843918;
	bh=is/ngq975mUjUBzTdIqiNV/aCl6skLZgP+5C7ZZcfo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DXx/PLNR9NqnLC//mCAWY7SvbPVzN9mfq49qG89mVN0TfrXV0kuS9EyELgzXqMYAh
	 Uk8cbxTo5s1FgIPUFJa+JoN7BZ3NvCv308v7z+01wFzBOAB/uNWnJ3SbjxwaCc1Ld1
	 A1fgmFU6fm3tFtrCbgp8RkvPoAK1F8Ce/VL8JbL16bAi8ANRemcKTL2IDSKp/a6qN+
	 l1I88K2Q0eUhehJYOnWqMwDtESK6CC0B/U2TCf5E6PPxS9gIAXID1RfG3QIyLEe8mU
	 5FVpXaIALhbXY9prgI7QkNwFJ2SJXsJeV9bAP6n96OXi/S4HWrj254KUxw4LdKbxH5
	 stKAyn+TJm9YA==
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d83e2833feso1619189eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:38:38 -0700 (PDT)
X-Gm-Message-State: AFuF++lE+INz55Vv17AW1jtkS6xQeKqKVFuYfDIfxMQCuVlPPcAUXGTK
	2fSfvNwCjnCKEtJzknMTmrYpisJIgIDCDIWofwLqxP+xqlFKHLLU5luRR+RnrRLL+LvodovlSeq
	ybLMgiyqYEANPSZvu8PGoL3fEJ0xtyMk=
X-Received: by 2002:a05:6820:1806:b0:6d9:bad0:8374 with SMTP id
 006d021491bc7-6dcf1fa428amr3428672eaf.10.1790843918052; Thu, 01 Oct 2026
 01:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-20-will@kernel.org>
 <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com> <ar4LWGJ_qfV71_Ia@willie-the-truck>
In-Reply-To: <ar4LWGJ_qfV71_Ia@willie-the-truck>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:38:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
X-Gm-Features: AclHuK9bZYHoY_AXjKZDaH1MPRes_W7KUtKQxFuh8xG-8gqtKY6GBTng2OBvj8Q
Message-ID: <CAD++jLkipuU0PcEvr=Bqy86Av_y9YBuVFsw6dtgy9zbkAWNU=g@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] arm64: entry: The great stack switcheroo
To: Will Deacon <will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Oct 1, 2026 at 9:27=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
> On Wed, Sep 30, 2026 at 11:36:35PM +0200, Linus Walleij wrote:
> > On Fri, Sep 18, 2026 at 6:15=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> >
> > > With the kernel stack pointer in SP_EL1 and the overflow stack pointe=
r
> > > in SP_EL0, it is now straightforward to switch between the two on
> > > exception entry from EL1 by writing to SPSel. However, since exceptio=
n
> > > entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> > > repurposing the overflow stack as a more general kernel exception sta=
ck
> > > would require writing to SPSel on every exception entry from the kern=
el.
> > >
> > > Switch things around so that the overflow stack resides in SP_EL1, wi=
th
> > > the kernel stack residing in SP_EL0.
> > >
> > > Signed-off-by: Will Deacon <will@kernel.org>
> >
> > This patch gives me panic, and as can be seen from the review
> > comments need some love...
>
> Please can you share the panic message? I'll definitely be reworking
> this based on the review comments, but if there's a bug it would be
> great to see the details now!

Haha. I was not referring to the kernel function but the emotion ;D

Yours,
Linus Walleij

