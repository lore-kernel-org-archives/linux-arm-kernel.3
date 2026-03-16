Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E24F4643A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoiyVkHIKrNjrZtPlLtkfhVeaegDVh4Olnri2+lijqk=; b=1J2zoUQBf4rVJB0mrg1yoPcMy+
	9JyIfaqpeiBhwdpM+MI2A1mDw4SkaoBy4gEeMyJH15OjR3y7A/QVvd+i1NHaOVgQojN2r87waXCgi
	KOQKyXXVZUGGR1E8n1XtgbW4lcAbI4QUDF6RU+GzOOg0h+12mS62YuQMhcMjOApKaRAA9euVWzn5Z
	tYC3LnfOxG3FyrdaiNknlOaPdSo7m/thk373ABYKqkS5wlY9s/atT1KyggJYQzE+T36lOQfl5qB/J
	2ZmvJHPg60AFwLMtPysBbWmKcbrSlZPhVJ2VyaQKpDRT0mKvvWNCbEW8aFkS9j/+aihyffqSeU30n
	AdEUY64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Q3-00000003eo6-3ZK4;
	Mon, 16 Mar 2026 09:39:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Q1-00000003ena-1jNa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:39:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B0FA441DF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5B6C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653964;
	bh=RbqZslNxIIkzTluBmL/ed2uqFPa1E/cM4+gpAQj+klU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M89CEiZOnHW6l0rVxIAVYujeaAXXC4wcFEgK6RvQrRatF+GJGYQPCQzJqxY8+1VIA
	 E7ZCdMygmp4NiT/9U0vyf51n5I+cO6swsADrHEdCOP1BbB+Kl6PKS3hjlfS8XRAbDI
	 FqbHS3YpHzueVeZy1lUiGD6oOZPmUBwFBnVZR0YJK7ri5JSsOvqdQ8JXeBV1zvQ9Aj
	 iZuHlJW52n1Dcc+QGXJDlCK+tgfX07jqK9IIBqCmihvHKJESa7f89hJqPcLevHPKze
	 xRFRnqqAGAXyPwMBME8EPg2+xjOSKUqRn9bRAGb6Bph92medmVxRyhjXkG7MELJtr7
	 uH4XTBPdAIpOg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79860421382so37937067b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbLfEHzkwqXj7oUbTu4dhvUGmiUptKmmwOs/4LEyndxSdn400jOBQ8lLwlhFGOLVVWB0R4/8GF3m7xMkuNhbNi@lists.infradead.org
X-Gm-Message-State: AOJu0YxO9kaZjTYY6KlGBKhZf/nOcwSRcuqstWXHpIZJ/VK9ZbKsG+0V
	6a1J0X8vhhTo+Wx+zDap6M5ffZUARUYj7BlWguuNl7dr4M3VMLXgd4QXCTeFeUjyajPVQA8LsN+
	FStHtaB6bVl8FTbHTu8K80uiD+1FUWuA=
X-Received: by 2002:a05:690c:6e87:b0:79a:3b28:a710 with SMTP id
 00721157ae682-79a3b2912f5mr61530517b3.27.1773653964110; Mon, 16 Mar 2026
 02:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com> <20260311-pinctrl-mux-v3-4-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-4-236b1c17bf9b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:39:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=8tqT=jEy+_W-WnPq=Az7GbsW7pdXHZNmu8m+tKoDMDQ@mail.gmail.com>
X-Gm-Features: AaiRm53Q_0hsf1jplyh4XsHDGxCWDXM_lyumSvDs8oSWpLJERT4ci6Zqc30deP8
Message-ID: <CAD++jL=8tqT=jEy+_W-WnPq=Az7GbsW7pdXHZNmu8m+tKoDMDQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] pinctrl: add optional .release_mux() callback
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_023925_494881_D7B2B128 
X-CRM114-Status: GOOD (  13.15  )
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

On Wed, Mar 11, 2026 at 8:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Add an optional .release_mux() callback to struct pinmux_ops.
>
> Some drivers acquire additional resources in .set_mux(), such as software
> locks. These resources may need to be released when the mux function is n=
o
> longer active. Introducing a dedicated .release_mux() callback allows
> drivers to clean up such resources.
>
> The callback is optional and does not affect existing drivers.
>
> Commit 2243a87d90b42 ("pinctrl: avoid duplicated calling
> enable_pinmux_setting for a pin") removed the .disable() callback
> to resolve two issues:
>
>   1. desc->mux_usecount increasing monotonically
>   2. Hardware glitches caused by repeated .disable()/.enable() calls
>
> Adding .release_mux() does not reintroduce those problems. The callback i=
s
> intended only for releasing driver-side resources (e.g. locks) and must n=
ot
> modify hardware registers.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

OK fair enough, I think I'm convinced about this now, also it has
a nice pairing with set_mux(). Let's see if someone else has comments,
I might apply v4 after fixing the generic function issue in patch 2.

Yours,
Linus Walleij

