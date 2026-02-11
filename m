Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF87CE9E301
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; b=dcgqFZZ08KMoPpBjqaPLXKJBm1
	UsjjwvI6ouCUXGQTiVgHFLFNMXEY5b5SwhkDlGk86uDk+tbwi1zH0pP7gviM5ARyTUHYo9GT/014k
	uKs7zlEagf0DEjLxwa/m+msQeZSwDrOatZTc6BDMJMCIj8rHbd3OYe+tvNVmJvtFfRjIsEdPzlnkn
	y/pJUSBVawATz2ffhShr4+PnaGWiWL4bFnU2Ytx+ieRPqmEavVs7QN4gMCbGusxhbesvL64T3b+jd
	pT5u/5liq/OwcPWJVULRPRt6SlxhYKkY94sJf1YqdEgkU7XA7ML+S9I5mPhLQHKW8Wpyrx71LUFCz
	N4yHmOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9wO-00000000fTu-0NXO;
	Wed, 11 Feb 2026 13:07:36 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9wJ-00000000fTV-2t5P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 13:07:34 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770815223;
 b=H2g5185S77aAaI5m55O/As3zDJBFUGERR4g+mO4P1rbj04qJAQmUXMRs6A0idhFNP+WktD/I
 4nzo6GMEH+RYM4BEIqC8VmuEG8ZEoKW50nxTM0be2qhrV90N6NUU5OAjDJsOZW/QAtkOUvr5l4P
 QMudN2vh+lpW+zSsBLcm/bY+6DeAfFWY00cWZHDwM4RujrVda4lyvqTktC1FRtgMkFAuXOI6Tiu
 cJLY/XTKkGHxFeMKReICqRpLLrvIjR9EdWHyzMCqJ9rvaY+K7xR+EkfbLnPDVLh0ihyXEVLGddz
 lt8Cc7VqAu0TPkLSlSUM8AofUBxrLP9AE3ojcCxvlJiPQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770815223;
 b=L2zkGJgHUaU2cLDEpASzwWd+wR0hT2DKK6uNUUUeBA7JJbd9PsagwiIdrWxmolPvbMTLkEhh
 4Uq3vie8q7ysbaGgYKD/7MFcXnhukxxpFD8gyQfPwxTE9xkHaf7DoEluIL/ZxFjdLQvdJEUuS4/
 tR90887GNcos+pSF3gVp1spru+foLPxiV0sJ7ZulfDiKBGUQ4ncPbcoYqsbzlKnzVQGW1d+bfAV
 R2VjsLZ8aC8hpfmZiO179HVmsiUWwQsYLyKyUBtJINfvnAsyLkVFLeqdWzJHfRNXwn0Uvsu6W1v
 HpDOHqNik7KpHPGg2FOxwPuTj8c5qw5Kg1I22B5yOSpeg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 11 Feb 2026 14:07:03 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6C818CC0D37;
	Wed, 11 Feb 2026 14:06:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree for TQMa8x
Date: Wed, 11 Feb 2026 14:06:42 +0100
Message-ID: <3404121.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
 <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f9zGW4Rtgz3ycCd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 6e6ea929ed061832352f734018e4b891
X-cloud-security: scantime:1.997
DKIM-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770815222; v=1;
 b=MDbPsoK3WWcGDcbd2SS0q9i4uLhadBpstlKBScr+CbsUuAH6kQGQlaUKWnCOqg6TSfDTYNII
 lUAPwz71Yv5Qh8bwCdwFJkLIokuvo6kJmODpwiitGTNl/YV2kaNncfS9WHAxt8wZQY9NRJHae3U
 Bq/ofNjocnGFk23dPr6T8SMgMnCestAAvTl2KvJZEiie8lqNEkP0iltxl/EfiNxO715onSFidl+
 DstL10dCpp5XMZinrsZqQUmIZmeUcYpYMa+cjHzHe4Qd1xd8z9M0b9iv0k3GM6mLuYHyIAz5F9I
 xRPItJaDLlGCzaApSaoxs5qDSDk+kwaECijsQN6Hwz0dw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_050731_982833_BF0D9E96 
X-CRM114-Status: GOOD (  12.23  )
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

Am Mittwoch, 11. Februar 2026, 13:43:17 CET schrieb Marc Kleine-Budde:
> On 11.02.2026 13:34:31, Alexander Stein wrote:
> > +&flexcan1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
> > +
> > +&flexcan2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
>=20
> Can you use the PHY binding instead, see:
>=20
> | https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/fre=
escale/imx8mp-tx8p-ml81-moduline-display-106.dts#L180

Mh, this doesn't seem to be necessary at all. It's an allways-on fixed
regulator anyway. I guess this is carried over all the time to silence
a warning regarding dummy regulator.

Will drop in v3.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



