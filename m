Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D41BCA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3167PLa7qi5Lws1yxuv9LeqRuM6ayJCfXH3FRvZSxCg=; b=DwkLwSGvRWPz08RFX+IS6C6Ax3
	BgSkOnZgxwI7BM7vGXeHN82N4iZIRUxOWKc+ojTko0efGZyHX+4xNgnzNmDXotA5cEv/zMNZUIEcg
	buWIZki3csR8OGEmFQ1GgWhtGhevdxph3xX0P14RxbWKeVQdQtrF8PWxK8sEQdDSrpd84XFNkar7n
	HSZ1aooVp3h+oF9p0UABlPtjb+U9FcspTCBQarkWJxU/kLynxeXZuLauHH+TqNLlePa8gl0KjLwdJ
	XmLIJOLEAO7kA71wnWo0x93gn6ca2l03j+yQj6uosvSfTIVaRxcblvuGEdx+B9jL/64Yqf0Nv8oiY
	+OQqA0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluai-0000000BmvF-1WLO;
	Tue, 12 Aug 2025 19:23:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqWN-0000000B8jO-3RkX;
	Tue, 12 Aug 2025 15:02:40 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:7c24:e2bc:68da:c990])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6B4F64A4;
	Tue, 12 Aug 2025 17:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755010903;
	bh=wR0BxUp4dy33m59/4v222C9B6JZd9Ir0fQjUINH+5+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=v4s0yHvZaZ/6VupsHQsCY3EgCCkGo9R/3YHqllY2jygzLaf0K8PIkymJitkGk9jaj
	 Rl12W765kA/4eJ20Rz2rC7kdUYX3/Xa58+xjsfIBEPzMKd2l3hdzPQX321ewN3H26k
	 6FEmlVdW+jb8tvvbaTc3wdJMJhBaUpzu7khXaGkY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250812103243.GK30054@pendragon.ideasonboard.com>
References: <175308758352.3134829.9472501038683860006@localhost> <175326599663.2811177.16620980968274114885@localhost> <m3h5z2vw12.fsf@t19.piap.pl> <175344176070.2811177.10693943493658922992@localhost> <m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl> <m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl> <m3a545t789.fsf@t19.piap.pl> <20250812103243.GK30054@pendragon.ideasonboard.com>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Paul Elder <paul.elder@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 12 Aug 2025 17:02:33 +0200
Message-ID: <175501095338.74722.11604545949710100799@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_080239_995242_4759D69A 
X-CRM114-Status: GOOD (  25.25  )
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

Hi Krzysztof, hi Laurent,

Quoting Laurent Pinchart (2025-08-12 12:32:43)
> Hi Krzysztof,
>=20
> On Tue, Aug 12, 2025 at 07:54:46AM +0200, Krzysztof Ha=C5=82asa wrote:
> > Hi Stefan et al,
> >=20
> > BTW I've added Lucas Stach and Shawn Guo to "Cc" list.
> >=20
> > The problem is the CPU core power supply voltage :-)
>=20
> Ah, the dreadful overdrive mode.
>=20
> > - while the reference manual specifies the max ISP and MEDIA clocks at
> >   500 MHz, the datasheets show this requires the "overdrive" mode =3D
> >   increased CPU power supply voltage. In "normal" mode the ISPs are
> >   limited to 400 MHz (there are other limits, too).
> >=20
> > - I've tried lowering the clock rate after booting the systems (with
> >   a CCM register write), but it didn't fix the problem. I guess some
> >   reset logic is affected here, and the (lower) clock rate must be set
> >   right from the start, in the DT.
>=20
> That's interesting. I wouldn't have expected that.
>=20
> > - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
> >   the ISP2 MI corruption. I'm currently investigating PMIC settings
> >   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
> >   I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
> >   though.
> >=20
> > - the question is if we should lower the clocks in the main imx8mp.dtsi
> >   DT file, or the overdrive mode should stay there, and the changes
> >   should be made to the individual board files, or maybe the U-Boot
> >   configs (PMIC output voltages) should be changed etc.
>=20
> I think it would make sense to lower the default clock frequencies, and
> provide an overlay to enable overdrive mode.
>=20
> It's also interesting that the issue only affected the second ISP, as
> the first one should also be limited to 400 MHz in normal mode.

I support that. As a side note, there is already imx8mp-nominal.dtsi
which is only used by one board. That dtsi also uses the
fsl,operating-mode property which enables additional clock checks. So I
ask myself if the default imx8mp.dtsi should specify overdrive mode, or
if we should add a imx8mp-overdrive.dtsi (then we should possibly rename
them to imx8mp-mode-xxx.dtsi so that they sit side by side) to make it
easier to create overlays for both cases.=20

Best regards,
Stefan

>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

