Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F3BCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0iTojnRLPumAawJoInXYGshTudeegPaLeQs4sXNs0A=; b=MkAPqxkdhYhgfG52l1kjs9cFK2
	hWG+84+h18oPuAAsioLfOyzAtKoQ3Yp5tk+YkEM2DbBAFMvqRWgNF8t+70vLMY++duxWIsOjLY8bm
	/fMkOSZPl0xDAv+YjuHF+Yxaef6CJZIjwwDYWyqmj91RH+Dw/Cx/3IR7TBlZHaaiSU1CJlfJCIE7v
	v1pQHsedCLPmdspctyOCDrTAwd+titKydXJlrVeMC2k1vedy5y2vOtAbZjXSSwWzmS/3r9v9RKudR
	SqPmTI4lxsnDrErt6gqm85b9EuuoaLCfP57v7BajbqAWzzjrmzZgZylWlsSDaoW7w72FCH9FbBAFg
	sOeutzUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlZT-0000000EDDb-2eLE;
	Tue, 13 Oct 2026 23:06:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlZS-0000000EDDV-2fRK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 23:06:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5F14600CB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A99C1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791932769;
	bh=P0iTojnRLPumAawJoInXYGshTudeegPaLeQs4sXNs0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DpfF/OW4mKOx30gioxVGakYZvb1rnYKq60hNsIPEL0ThNR5o/pSMaAb3DYO4yBRIO
	 VkBYYa+Evu8HW/Ox2K+VQUlNzuBo0yV0j8g8eTFmG79PZxQEORjR3iyB+AEvJfGYWd
	 6Irow+pk8Hum50eltvGcVVOJLi/YiiKtD4Sg1GaVAfL72WC0ryOo6bALfeGbe7vfQA
	 c+Flt5sMqhiBooh2FiuHP6wa+qm9X6WFpZGjIZn6uBdaXCHeyGlUXqOWJ5t4p9XGkt
	 RBCcUmg/XNQIRHl+iA1pOs6DaZNSrlt4/075APcVz/R261IPRrKuYzCgm90+8L1ivN
	 grzoFspvolw1A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a98fc80925so25774961fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:06:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxFRCJriUr/2IysN/gWLBmY1snlxEDtlrUpqZwoqTDSsjE2H6f4pmpZTYI48f5FIyNaOrSpVY+5iX7acwVhe3aY@lists.infradead.org
X-Gm-Message-State: AFq9FYImMOcfr2aMzH4evouYCM8qZsMXCRL5zrKg9fEmEkmssb6v975V
	wPoaMBwutkDnck/hCE2eTHKYJ6RMgnRXWtzHqdKSQVhrxyAdXCkxR5W3CHcgf1NXwE4X/mlKcxl
	gCWGJO7JsGtxYQPIQccfcukAxsOI7eFc=
X-Received: by 2002:a05:651c:b27:b0:3a9:9b67:25f7 with SMTP id
 38308e7fff4ca-3a9c53b0b19mr34618061fa.4.1791932768205; Tue, 13 Oct 2026
 16:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20261010175721.76213-1-adilov@disroot.org> <CAD++jLnTOc+n2PGpK1NDnNJXwgzTQ8shO_6NqNuADzxY8SyYsA@mail.gmail.com>
 <03f84f8678f0a6a09e10e57c77ce82f9@disroot.org>
In-Reply-To: <03f84f8678f0a6a09e10e57c77ce82f9@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:05:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLmGBFJBACn5NuzjbDpNVySjjxVDbP76mHKjKetSnouESQ@mail.gmail.com>
X-Gm-Features: AclHuK-kqMedjz2wi0_AS5MYo3t5JfIsaXDJBJEGuyzQd9O3yegy0ZIw5takxV0
Message-ID: <CAD++jLmGBFJBACn5NuzjbDpNVySjjxVDbP76mHKjKetSnouESQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: single: add big endian support
To: Rustam Adilov <adilov@disroot.org>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Oct 12, 2026 at 4:21=E2=80=AFPM Rustam Adilov <adilov@disroot.org> =
wrote:

> >> This is needed on big endian MIPS platforms like RTL930X, RTL931X
> >> and RTL9607C who use pinctrl-single, because when SWAP_IO_SPACE is
> >> enabled, the mmio accessors in pinctrl-single perform a byte swap.
(...)
> > So I'd like to hear some of the reasoning about why you want to
> > do this thing, we have other drivers doing this but without using
> > pinctrl-single.
>
> Um, what? I don't understand how that is related to anything with my
> commit message.

I understood is as the usage on RTL9[3|6]* SoCs was something
new and this patch was needed for this new thing to work.

I see pinctrl-single is already in their device trees...

If I can get an ACK from the maintainers we can just apply
this, the cleanup I'd like can be made at a different time.

Yours,
Linus Walleij

