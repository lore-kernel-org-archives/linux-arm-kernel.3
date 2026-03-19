Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9E91091901
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUs1LFiocDSLJFYRCglr5yRLcWXadIjMCj6syvM+x6Y=; b=UVhGHIqdk9Pkof
	/Co0lfljR9Nb8xGv4E/KaofIihP756DBQbUXYl1dbbbv6G0IaPkDT7tbJTNbjkoKYujPG6G5Mi8E4
	IaDg6bcQW9gzRF7jvoFaBkofCHEJ7Xz1kzOo3v52wDhKWKokGmnCEbOuxVrKfqUSqP6/AZwTtzaDV
	k5E7YqYqpphWuCLeufruMwz3G5Nw1HiY9J2KArrCJap6AN2LxdTNdRiG/ICURJq0iV6K5RTM/4DWl
	BGNYgP78izDF+GYE845S3GkSfM4IkZXMYy8VBVod2K52Gds6aWkXVL8n5QD0Lak4A2+1l7XgM+BoL
	scuswinobdoLEL9dUf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HPS-0000000BEbo-2rxX;
	Thu, 19 Mar 2026 17:43:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HPR-0000000BEbh-1qp4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:43:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8A3460097
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C10C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773942228;
	bh=lUs1LFiocDSLJFYRCglr5yRLcWXadIjMCj6syvM+x6Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=dVX6estHJo9qPEoIG21q8FfHANwYkL1J7akZ4LRkOXESQ18e3UD5wT6Wfbjy26kGT
	 2eXRjI3il2ZuPBAjJuFiV8/ImRqXO5TLF8hjfgP5k/It9hJdMJthKJfYtmZJsJ1CXa
	 feawkEs0x5DyrSizEecKYFMF36E/H0+QLDqywt15cmAggWXvIyasrE8yesptcCuOem
	 8quWgY97Jl7SCEeM9i8RZ65I1b0f8A+HT2733Ve/w/Zv7LARKyT107ytlN0qUAE34Q
	 rfiOP1dJZf1VDnnGFU8ZrmWLtDQ7n5hbuLvFeimMzX0l5bVo+csnECGqsWMSJJB8qI
	 U5+61m89iluSw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3870778358aso7017511fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpIR20hiW60v2VoEgLhOUGmUMMTPpZ/5fI2V/NG4koNCVCAD9S2avy2ya6Hx+ZDgKuuHJzmqAON690f8AZyHOO@lists.infradead.org
X-Gm-Message-State: AOJu0YzsMB3vY3O5HWp1uelHQof+MwhTTwtl27cg1wvy9a/ULKhwW0b7
	cfv631gn9VqGFJQZIjDFycaALCosXdyn3QULsyBmo8Uy0j2jSjKLmjNj9F7gcdwAu3zqqNgAZTs
	9/ooNFMjDfUKpAralB+9NILEia1PUkmc=
X-Received: by 2002:a2e:878d:0:b0:38a:a77a:b0b2 with SMTP id
 38308e7fff4ca-38bf9736bf0mr900671fa.30.1773942226753; Thu, 19 Mar 2026
 10:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl> <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 01:43:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v65E0ySMbRadvDLFk4rDT0=GVzZxSbxj9dxsu2m+TBwbdA@mail.gmail.com>
X-Gm-Features: AaiRm51XS9DJV3maNeIBiCDDt1obC7vcOgUI0Asztz0Dh1s9NssQ_vC8bOgjeY8
Message-ID: <CAGb2v65E0ySMbRadvDLFk4rDT0=GVzZxSbxj9dxsu2m+TBwbdA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2026 at 1:19=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in uninitialized state.
>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()=
")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

