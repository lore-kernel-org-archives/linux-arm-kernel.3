Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C136CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p3nTq7oGJJLZEtBHFjP4g2fj9ud/Z4fq7Xd0f8dF48=; b=s8AFzcKrEhaR8mJSJMefeEHOoi
	UicpWXLMG+g111B4K4Pm1zZn9D2MHlChPOC0LYSXAmLIiTpVGdZhmqwruLHhaK8Wj4VsdtAq7aVA7
	kuZBKSMS5Umm/mJ3Z4WZfI86ua+k0lGGBRt/mH2B4P7bJOLqEk3FaZ2tGdznFvfQwJ/FcGx8vR4cy
	w/W/i/KmGaAnCSiBcEwOUUy0YOJ/J/y+U7vOkh1TneBanTkAFKYiq3IXwCeLxRN15ph9Yz7uQAaDG
	O96QtiTTMwPnXnGzv2KWPvQu0pahLOZnjZplnxytLDlCpVslkvu/Uws7560W7YB5RS85uwvdq0sKO
	CYLE1iYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWV0x-000000033MZ-3JzC;
	Mon, 08 Jun 2026 08:07:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWV0w-000000033Lk-2wul
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B545760200
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 08:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1471F0089A
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906037;
	bh=7p3nTq7oGJJLZEtBHFjP4g2fj9ud/Z4fq7Xd0f8dF48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W224uC4/IesJ34nuGEK+bZHPRAWeHalBbhvVaG3G77FpiSk+P8FmAM4KSth5/Zw6w
	 L13BquVoXpaByhyynZxt7GPU3AtAhGunIkXPNSFx3YiuS0/1CNLiwwuQj8q0mLPJoH
	 mc5nMCfL/id94JmzJB+LonJwSB2TNbYbx+zME9Z9TRPqfykSaTXwio7ErKUz/VvjvU
	 9wrPsC0Di2YZZQoONx0IKIcxFfo7+ck0eL9OFSazszKoJpmUP7QFdp911LcKlJe99I
	 g4TYxqSMC1Jl0PopCrS7zm8ggyKQ4c4sqCmK3JCgJACt9c1z/xa8OdOFMb9uT0YD1z
	 wV4SQYMmT3UVg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so33213711fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 01:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/oAcwpcyZw1owASG7dOdluXEoVnnEGy7c87xgGZTH1wXBjok4wA1hpKBhSRHrxQq/Wk8WGVNdQuIEXVIPqeuOD@lists.infradead.org
X-Gm-Message-State: AOJu0YzA3jpoFM/12+gl58U2eA65GxPPachl//MtALa6/S7dBp7AOOAJ
	Vj/MbkZj5AnGklSCGiE9cE8Sz5NDech0rjdlb2sg2rgSifTHvdt3o8/Fb4smw5Zd+bLccM9dkTX
	+nxenK8pqKnSj1BX+FVS7xniPeCSMImw=
X-Received: by 2002:a2e:9a16:0:b0:396:a6d3:f04d with SMTP id
 38308e7fff4ca-396d0895474mr40010161fa.14.1780906035688; Mon, 08 Jun 2026
 01:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260605010022.968612-1-elder@riscstar.com> <20260605010022.968612-3-elder@riscstar.com>
In-Reply-To: <20260605010022.968612-3-elder@riscstar.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:07:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnzaq+SghqjQhmS-wzJn8BqtpO9eFBet-Nvq1s6ftSPBA@mail.gmail.com>
X-Gm-Features: AVVi8CdcVQZ5J_i_Iaqeix6_8YO_cjEHpzPIFDPmZBuvgJ3k-aHEuVOqwusuDcs
Message-ID: <CAD++jLnzaq+SghqjQhmS-wzJn8BqtpO9eFBet-Nvq1s6ftSPBA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 02/14] net: phy: qcom: qca808x: Add regulator management
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, 
	arnd@arndb.de, gregkh@linuxfoundation.org, 
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, 
	chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com, 
	john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com, 
	mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, 
	rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn, 
	weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi Alex/Daniel,

thanks for your patch!

On Fri, Jun 5, 2026 at 3:00=E2=80=AFAM Alex Elder <elder@riscstar.com> wrot=
e:

> From: Daniel Thompson <daniel@riscstar.com>
>
> QCA8081 appears in embedded board designs paired with GPIO controlled
> regulators for its power rails. Add logic to allow these regulators to
> be turned on during a probe.
>
> In order to avoid the complexity of tracking state for suspend with and
> without WoL we take a tremendously simple "always-on" approach to
> regulator management, essentially relying on BMCR_PDOWN to conserve
> power when the phy device exists.
>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>

(...)

> +#ifdef CONFIG_OF

Is this an extremely footprint-sensitive system?

Regulators provide small stubs if unused, I don't know if they
compile to zero bytes but this ifdeffery should normally not be
necessary, just unconditionally get_enable the regulators.

Yours,
Linus Walleij

