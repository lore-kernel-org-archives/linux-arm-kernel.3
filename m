Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C2C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uzu1/EqrenMvPymkgwGDWP8FLVCKuEu8+xxxlpKXEc=; b=s7O0yGzzzutpfxNY7G8EhYw7VB
	eqw4Fuutk/Jiwumji8lUUM5THcEZrhc2fQtsbmrKLkk6pLWoZJVsXADp0SS5P43TxfuI12EZbPpS4
	XiL7cB6/Eu9RCrotWJCnaiUOvFEu+UGIXXh22uimafxpLT0JqgN+zvzT3SXumKvmU6aaoDfeHEG2T
	pXjA4rO3r+1fMKwY7Ie3cqe2w1gyZMdM0dykA5g2znRZ92OHK16W70eU2yaOIrK0+5QAyBiP/QPja
	WegJ+ubBdHyGjezga/1ruEmlyYRwuRd4r7ERJMMEdj0aa2Y0qV1BwdtJqhZQG2XZsZZlrZ1GEbLD3
	JreEebug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBj5-0000000Fnzu-1qYz;
	Thu, 05 Jun 2025 14:37:51 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBgp-0000000Fnk2-3XSk;
	Thu, 05 Jun 2025 14:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749134114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NKn+SpOWGZY0QJiLOqY4x5Ai/Yv0TIZeaJezXC5g0ZWILWNQmwGJFWpEwycIA2HzIN1mCmRJ3lrQ+hHCgl6pjkXRIxothuFj2Ag8wxZl4+Ty/ThCLtpKCUsR4cTkTfcd7NP1DlPYr95uR7DP313/2QpjpFOHEQwx04AgqXCylHc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749134114; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0uzu1/EqrenMvPymkgwGDWP8FLVCKuEu8+xxxlpKXEc=; 
	b=LmLYwrivhz2E1yJeeGrUCihMh7inHsS0qrHwn1M+edFm2h8MYO4b8dGKP2O91A2LYT6yhG/u4seV30tnNEs+I/hgrhTBC7fMw/qyFiP6jdjelXdpn8fHFHGjX+ys+2vHF6bm3aA2cHibTTvwRpciXC+p8Iw4QuSvPDEAif/ZDUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749134114;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=0uzu1/EqrenMvPymkgwGDWP8FLVCKuEu8+xxxlpKXEc=;
	b=OSILMwkw/0Mp9nvmWRFPhHe7GWjcRXLUfogUADlprLqTFnfGNGmypMwGhjY1dvCe
	0EmTHbfvP8VDn5JKm/e502sL90mToWYUGwiectxirFIjH5j1AD2h6HDBGLPRN0WzvdN
	Jbh/ZHimXwKzwzBG6KNOXPJrui4kvu7M+EB3/NPA=
Received: by mx.zohomail.com with SMTPS id 1749134112355222.8330067732718;
	Thu, 5 Jun 2025 07:35:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: rockchip: increase max amount of
 device functions
Date: Thu, 05 Jun 2025 16:35:05 +0200
Message-ID: <5876990.GXAFRqVoOG@workhorse>
In-Reply-To: <CACRpkdZRjLFa3Bni=wMG1LBoWnW+Zenj2FVP=_2s+U_1eykt7Q@mail.gmail.com>
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
 <20250602-rk3576-pwm-v2-1-a6434b0ce60c@collabora.com>
 <CACRpkdZRjLFa3Bni=wMG1LBoWnW+Zenj2FVP=_2s+U_1eykt7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_073531_944642_E398FADC 
X-CRM114-Status: GOOD (  14.53  )
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

On Thursday, 5 June 2025 15:29:03 Central European Summer Time Linus Wallei=
j wrote:
> On Mon, Jun 2, 2025 at 6:20=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
>=20
> > With the introduction of the RK3576, the maximum device function ID used
> > increased to 14, as anyone can easily verify for themselves with:
> >
> >   rg -g '*-pinctrl.dtsi' '<\d+\s+RK_P..\s+(?<func>\d+)\s.*>;$' --trim \
> >   -NI -r '$func' arch/arm64/boot/dts/rockchip/ | sort -g | uniq
> >
> > Unfortunately, this wasn't caught by dt-validate as those pins are
> > omit-if-no-ref and we had no reference to them in any tree so far.
> >
> > Once again kick the can down the road by increasing the limit to 14.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Is this something I can just apply?
>=20
> Yours,
> Linus Walleij
>=20

Absolutely, there's no harm in it landing early, and is only tangentially
related to the rest of the series because it came up while I was pinmuxing
my PWM pins.

Kind regards,
Nicolas Frattaroli



