Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8DECA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcLz5VIqrPLxxts4VNciRIChNErXev7IuXl2T9sRc74=; b=gp/zJiTU/EWybg//NNlZDcr1yi
	CCebxiJk490HeWevMvosALkIO7r8ANcnd+Q1TAsGqAczBjf31bukfiq3KulfJ+cx1U3mfvwFz+Wuh
	GkgnW7pyNhZlO+mEQFLKTblQ8TqM/+q+I5hYxaykOnVYTwj4QayY/h274p5jLSmpGph1HX9H2f6tb
	yT0UoLNhRClt4vGXBXXKTihMsgmsV+2Vgil5m4CxukGBR3M3vmUhyldItgi72VZlCktJzQ5deq3QY
	Cvulip5S6koKzhVgaNbwSL+Q+Rjl7rVzOW4+pPDY1N1d7S4+Cu7xQ+731pt+OlC9OAxBjVvOILuOR
	dg0nUpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNSB-0000000AAXk-2ton;
	Thu, 01 Oct 2026 20:32:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNS8-0000000AAX9-1OP2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 20:32:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61F7360218
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 20:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F761F00899
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790886747;
	bh=qcLz5VIqrPLxxts4VNciRIChNErXev7IuXl2T9sRc74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JtAcjmb49+9CVJKKEKK72AUjiANdqcGzX2MyKefsSjb3idsWueBWake18fQhfv+Ai
	 7/HGaw6z/l17lppNHZUzLHNDaVA0Le7pliiWzs6eID4bzAUrk693H3muNWG2nSuwxE
	 8gUDAvtEC8QiyQ8rKVrT8T0st+ZtH5ccJ5hXwJi1XLqTpjaXaB4LD17BFIIoy/JM25
	 9n9unR3EOj8sIhaqx1ql7NLYBRl/K+Vy2gUDti0x5zcdPdbit/gOezlSf44Qn0hlWF
	 58UspUPrIgJqol0cvVs8KoLKL7Fiswt9akIMA1ydEays924kiPFib7sLx/qEhcSvmT
	 3kF8NnRtWu4zg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb79ea1170so760339e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:32:27 -0700 (PDT)
X-Gm-Message-State: AFq9FYKFEsj6nOQDaoKaf3NU/JtH2CXlLC+vS4/Jz+dp1SChWGzH7FgJ
	+Imk3WN1QHsvPxMVT6av7p4OkmUD9Mb9QrI7u2QeuTugJD+hyNJqcLgDSzhhp2p2lotwQAtT/K7
	p8IqIftAhh+lIo8ZpNsQxiKQZx+NgCMY=
X-Received: by 2002:a05:6512:3052:b0:5b8:edbd:60a4 with SMTP id
 2adb3069b0e04-5bb9bb145c3mr112291e87.43.1790886745879; Thu, 01 Oct 2026
 13:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260929194035.496244-1-marex@nabladev.com> <20260929194035.496244-3-marex@nabladev.com>
In-Reply-To: <20260929194035.496244-3-marex@nabladev.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 22:32:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCT=hHQnrxqX8K1_d-ige-LTR2SeCa1ETqE=2gr602zw@mail.gmail.com>
X-Gm-Features: AclHuK_BwtELP-F-5UZURmutq3weQqdSW_tv9x3rIhlaIFQbzeU0e-SvQ-dDFrs
Message-ID: <CAD++jLkCT=hHQnrxqX8K1_d-ige-LTR2SeCa1ETqE=2gr602zw@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: st: Reuse sdmmc1_*_pins_a pinmux
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, kernel@dh-electronics.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
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

On Tue, Sep 29, 2026 at 9:41=E2=80=AFPM Marek Vasut <marex@nabladev.com> wr=
ote:

> It is perfectly possible to use sdmmc1_*_pins_a on the DH electronics
> STM32MP23xx/STM32MP25xx DHCOS SoM, the only difference is the slew rate.
> Reuse sdmmc1_*_pins_a with updated slew rate on board level.
>
> Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM3=
2MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

That's neat.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

