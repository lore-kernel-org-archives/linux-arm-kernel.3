Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE44108B91B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqvJd/tLOchy3iTRcrdUAE7UOOBzOUBXPqr7730FrsU=; b=Z8+knRzCjb8Wv5Sd32Gsq6eyOZ
	tltpwXPRWv9SlpsreyYlKoNYOq3PBj1WjhYPgGQIRJR6earZ1C26TxRVpTzGATWru7QoJuz1h/fQe
	vgSQcHXiVVzDq0bM3u6hfDVjAwiAfCoW2OVvb5dXgNEnwd7KrTprqT83UJZ2BpKNJ5D/bf5YMWtTj
	BIMX3NUTVgpVM88QzcvKHg4sZfCscGGw0bycLGeijscvDtzg54YVlIwPKbO+QXHWT44NksuI1P7mq
	ffb72g2Sal5RjRDIaXXPFrwT8rzKUBy2H2J6wIsC7n2CcyJeP7i7ZYw/CFJCo0OSkWEZSoFVRgQwx
	rdsXKOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Z76-0000000CnU3-1hpB;
	Fri, 20 Mar 2026 12:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Z75-0000000CnTm-0Kaz;
	Fri, 20 Mar 2026 12:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eqvJd/tLOchy3iTRcrdUAE7UOOBzOUBXPqr7730FrsU=; b=puhKdIlsS+hxV1GD5cRckAohUt
	zrKLYUBSX0sUQtV7V3RvcqSKkutvhOwAK1T1FLC+iwo4kD3paVov1KenAY/7fBMcGFgNAK3kqIIYq
	PvEvf5C8xaYsKhIIdw9Kg6R2zG7cnByjXQS3nDXJYo0Njer8piGmeFxA+iWdCkrJGNm8wa2oF1DnH
	ORzbLL2UNrTH2vp25mdblhbCwJ484S8J5VP4HqNMmXkGhzbjdoiOeOcTboHC1TGiH3G+3BGJKFL9S
	brl1DoJ34CF4IILzlqrM8JUCZRwjCwsBxS3/hFLRhK2i4KbCDrISCjUg4DJL6QNN/jWnQOK7YVYZD
	9ZOCnMzQ==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Z70-0000000FXX3-2kAW;
	Fri, 20 Mar 2026 12:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774010260; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IT1X9lb4WgUGJ3f4XpNl+vAjgAOPfWmZtyaaQKBpOo2bNLHnO9li7xmwGPEbed71lTevrox//bZlixs9FBN984eFZczlLYEM4WIULVmra1p5kiJbeAzfeyaR3+9EpM0+dc1mexIHEIAzsE50Y8+8xHLrb5luj3cIqEG8eGjs9mI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774010260; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eqvJd/tLOchy3iTRcrdUAE7UOOBzOUBXPqr7730FrsU=; 
	b=Tsh96p4MSAWs8lU7Vew0vYe69xpMVDUqTfLNPkQxKXS7edfUihiwAkVxJsh6V2PjjTIFmHWRckkaLg3KPfr2zN/wj6TGiLnVmVVE3OEwGJpeGVr0bM3yUl2z+AMzLlmilxMkVicIdJ8D63CkdTyYkufWFK4xto01O3+6AAcgmkY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774010260;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=eqvJd/tLOchy3iTRcrdUAE7UOOBzOUBXPqr7730FrsU=;
	b=RMZiiDIujKB48XWmRkT8/L3xbYeJXdVQivCo4d7Qs0QuywxwSHnMQR7y/b0N3xrR
	b9y6YbIP2cjgyLxJurJpjJI/qT5PPCyiSKM9WMUe5/C1Pp8JlZ7laavjWFqnWiFkAab
	CZPFmG7wrmgmXQjUjPqdC844jhQy+mmiq2f4tV/s=
Received: by mx.zohomail.com with SMTPS id 1774010258810384.6051275065198;
	Fri, 20 Mar 2026 05:37:38 -0700 (PDT)
Message-ID: <7d1e52c0b9c3a6d30e9db617b9bcfa23ed9046b5.camel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio
 720-EVK board
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: David Lechner <dlechner@baylibre.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean
 Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 20 Mar 2026 13:37:33 +0100
In-Reply-To: <c2618423-2466-47bb-a8cf-7c849e7e231e@baylibre.com>
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
	 <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
	 <c2618423-2466-47bb-a8cf-7c849e7e231e@baylibre.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_123759_157154_00BEE683 
X-CRM114-Status: GOOD (  22.52  )
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

Hi David,

On Thu, 2026-03-12 at 19:26 -0500, David Lechner wrote:
> On 12/3/25 7:59 AM, Louis-Alexis Eyraud wrote:
> > Add support for MediaTek MT8189 SoC and its variants, and a device-
> > tree
> > for the basic hardware enablement of the Genio 720-EVK board, based
> > on
> > MT8391 SoC.
> >=20
>=20
> ...
>=20
> > +	mmc0_default_pins: mmc0-default-pins {
> > +		pins-clk {
> > +			pinmux =3D <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
> > +			drive-strength =3D <6>;
> > +			bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		pins-cmd-dat {
> > +			pinmux =3D
> > <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
> > +			=09
> > <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
> > +			=09
> > <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
> > +			=09
> > <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
> > +			=09
> > <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
> > +			=09
> > <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
> > +			=09
> > <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
> > +			=09
> > <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
> > +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
> > +			input-enable;
> > +			drive-strength =3D <6>;
> > +			bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
> > +		};
>=20
> Should we also have pins-ds here to match mmc0-uhs-pins?
>=20
The data strobe pin is only used for the HS modes, that is why it is
only declared for uhs state.
No other mediatek board devicetrees have it for default state too, so I
don't think it is needed here.

> > +
> > +		pins-rst {
> > +			pinmux =3D
> > <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
> > +			drive-strength =3D <6>;
> > +			bias-pull-up =3D <MTK_PUPD_SET_R1R0_00>;
> > +		};
> > +	};
> > +
> > +	mmc0_uhs_pins: mmc0-uhs-pins {
> > +		pins-clk {
> > +			pinmux =3D <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
> > +			drive-strength =3D <8>;
> > +			bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		pins-cmd-dat {
> > +			pinmux =3D
> > <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
> > +			=09
> > <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
> > +			=09
> > <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
> > +			=09
> > <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
> > +			=09
> > <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
> > +			=09
> > <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
> > +			=09
> > <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
> > +			=09
> > <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
> > +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
> > +			input-enable;
> > +			drive-strength =3D <8>;
> > +			bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +
> > +		pins-ds {
> > +			pinmux =3D <PINMUX_GPIO167__FUNC_MSDC0_DSL>;
> > +			drive-strength =3D <8>;
> > +			bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		pins-rst {
> > +			pinmux =3D
> > <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
> > +			bias-pull-up =3D <MTK_PUPD_SET_R1R0_00>;
> > +		};
> > +	};
> > +
> > +	mmc1_default_pins: mmc1-default-pins {
> > +		pins-clk {
> > +			pinmux =3D <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
> > +			drive-strength =3D <6>;
> > +			bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		pins-cmd-dat {
> > +			pinmux =3D
> > <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
> > +			=09
> > <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
> > +			=09
> > <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
> > +			=09
> > <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
> > +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
> > +			input-enable;
> > +			drive-strength =3D <6>;
> > +			bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
> > +		};
> > +
> > +		pins-insert {
> > +			pinmux =3D <PINMUX_GPIO2__FUNC_GPIO2>;
> > +			bias-pull-up;
> > +		};
> > +	};
> > +
> > +	mmc1_uhs_pins: mmc1-uhs-pins {
> > +		pins-clk {
> > +			pinmux =3D <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
> > +			drive-strength =3D <8>;
> > +			bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > +		};
> > +
> > +		pins-cmd-dat {
> > +			pinmux =3D
> > <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
> > +			=09
> > <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
> > +			=09
> > <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
> > +			=09
> > <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
> > +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
> > +			input-enable;
> > +			drive-strength =3D <8>;
> > +			bias-pull-up =3D <MTK_PUPD_SET_R1R0_01>;
> > +		};
>=20
> Don't we also need pins-insert here? (to match mmc1-default-pins)
>=20
From what I've found, it was done this way for other board devicetrees
to avoid possible reconfiguration happen for the card detection pin
while switching to UHS and causing a switch failure.
Also, what you declare in pinmux nodes is how the pin configuration
should change in a specific mode and you declare only what changes, and
not what stay the same.

> I was having trouble with the CD input pin not working in U-Boot
> until I added it.
I checked and debugged this on my board and did not get that kind of
issue, whether this pin config is not present for uhs state or if I add
it.=20
When inserting my sd card or when I boot with it already inserted, the
mtk-sd driver first sets the pinctrl state to default before switching
to ufs. The GPIO02 pin config is also OK in both states.
The mt8189 pinctrl driver seems to apply a default config for this pin
that is the same as the one that is set here.

There might be u-boot particularities that could explain it fixes your
issue.

Regards,
Louis-Alexis
>=20
> > +	};
> > +

