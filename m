Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC176CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSD0JDbSe65kbMBHP4WI7zokG3zTVf+6YgzPX1qNXS0=; b=COafzZMTIP9zHr
	bv8kpKsLWQJAVaFrdcOtGjovxjWbjTHhH9cgYOg3DzpmcV2Lm7zzPcVMSYYXk4kyag6Ge36C/nyob
	6GJ/3/ahNxHV0SECubu85FkzNNidA6ByjCb/19eFaNLUd+jyKrXSiF/0A5pWM1MmjbtCMmLPYHwPK
	mCyjCTQZ9JC7eVp/NgLT7ID8IsjXbilwswpLIGstSTzL1PdX84EpYxIRD1bWXr5nkfT/CK+MOB45V
	s2LnUG8Mp87TA/jouHloSueKFw2SBl7s0CXjk6vts7ewZ3BRZlYQcOBBXPv4obuSlsC4DJo63qtpG
	ilfJecRAg3xW9u5GwAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1yt-00000007GXM-22c7;
	Wed, 30 Sep 2026 21:36:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1ys-00000007GX4-0mr8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:36:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D7B860229
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EFC1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804209;
	bh=PSD0JDbSe65kbMBHP4WI7zokG3zTVf+6YgzPX1qNXS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iBrjeaei2MWVVb7CKMMdB2JCZNq25FyXEAiT7Jb/BYoqSRaFx3LLe+8LiUJ2PPhIx
	 /Xw65DRGUcGLptw5RaF7pR3ViZJ6UB8Y+CcHxgQB/VeWXrGOsxkMkiLOwL97hF/Hil
	 ke3zdgc5zc6U9gYGXZRD3H4o+k09Jl61bgNChy6I9PbzK5orQxEXwMUhOOfIO9gp69
	 GUdwv7INlw9lAGN66K925EBds6B+r56kTrM/YLrLeZHJjTbHkaeH/0K/LMhBeY7Cn7
	 UPcyubQ1ccOxoO14U+bSgh0qKSFeefT1pgER3TuZ2IP4kltVJ/sXgl5+rHVwdt5K/g
	 O5XpzqLNUTJTQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8cbb7b9cfso4712334e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 14:36:48 -0700 (PDT)
X-Gm-Message-State: AFq9FYISozkbAZQXdd9vwiAGARBCH9nzOsO+SSxbRQgY7HBpCPQUknNT
	n/1jP83MI1OnDxNoZWNLO9UnmmYPhpDqrFNGnTeFbcEYbMa8jwzg0GaT6q56HIuXdQ/Zqj4Pi2T
	f6WaOVpIXRMrYIjOG7WfYhhCP8ap5W+s=
X-Received: by 2002:a05:6512:a95:b0:5b8:99b1:fa26 with SMTP id
 2adb3069b0e04-5ba405da0f1mr993519e87.30.1790804207753; Wed, 30 Sep 2026
 14:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260918161407.2300-1-will@kernel.org> <20260918161407.2300-20-will@kernel.org>
In-Reply-To: <20260918161407.2300-20-will@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 23:36:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
X-Gm-Features: AclHuK95Ga1PONm8R6FdZOOAiA_epDhcCasI5XpLPF99hoZQWlEpKbpbSmAWYJs
Message-ID: <CAD++jLm=9RyVXf+hqFCMir2dBFbwysR5g8Tp2_14H48xtLx8Uw@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 6:15=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:

> With the kernel stack pointer in SP_EL1 and the overflow stack pointer
> in SP_EL0, it is now straightforward to switch between the two on
> exception entry from EL1 by writing to SPSel. However, since exception
> entry sets PSTATE.SP to 1 (selecting SP_EL1 as the stack pointer),
> repurposing the overflow stack as a more general kernel exception stack
> would require writing to SPSel on every exception entry from the kernel.
>
> Switch things around so that the overflow stack resides in SP_EL1, with
> the kernel stack residing in SP_EL0.
>
> Signed-off-by: Will Deacon <will@kernel.org>

This patch gives me panic, and as can be seen from the review
comments need some love...

I think maybe we can merge the initial part of the patch series
first (up until the overflow stack gets worthy of its name at least)
for one kernel release and continue from there after we hashed
out that part?

That said I see no direct problem with this approach, other than
it may have side effects on some expected behaviours we cannot
foresee.

Yours,
Linus Walleij

