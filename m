Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB05DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 13:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCNTPJfskIhANg0RiKYHsBz7kOPSHztZlUotAgnVEF0=; b=prpq8wbIqe4bjZRe0dY1RGtJR7
	aPD1+YLlMtqvWMKm9fATDC0jr3QhhMz235qVBq8DBRhN62jMxzvp9YsdxYx7GfGZQdFajcew33ADe
	D8RJYzyETx99mEITFtBmLN6y8Gah+nlYhgufY7ySR6Ib0W111bnZ7YrO2FArtEZmK3An5ZFCdBfKK
	kbNgj6WTfxW9u6loxyZEL+MEJC7FZL6jdmmBuUWR/QajMBm00piTQhJ+jFrgJHunwQ48EanwlThRm
	Es5XYxmYGxMRZZIzhrW/1O05v9zp6hX78Aw/o7fhvZLX5Mc2phHVK0jTM4L5UoiF9QkMklDv1Bp4G
	1/oVWmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMo8j-0000000DRcY-2mJi;
	Wed, 04 Jun 2025 13:26:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMo6c-0000000DRIh-1kXM;
	Wed, 04 Jun 2025 13:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749043468; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kh2iUeK+/ZYvPaLk72mpcP5zsfS7Ua6a0zQkfuPR0A8pLHFxw5SebyZVlhNSojGKB6mARcZGBI4FSAjlXaUquHJtOK4j+mWE0XCvntWTcQZ+9Ou393Zy51U70n4BKZVPRaj7xeUyJlidIhlLYyZeuXIk61Xep5NLtYfJCGQQ+74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749043468; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wCNTPJfskIhANg0RiKYHsBz7kOPSHztZlUotAgnVEF0=; 
	b=mNAlllKP7hd6uFXPYjbLfO0KOaSUQoKMkvprCj3dlSDo+EvdRXd7Q4e+n4FxAQWZglZZQgJ9zO2N1prnuR7tnTA9J1YupRZmfVE3AQE9xNrb1F7Gd7fWTm9MFH/ZT/57jN1BJ7/jClg2bZFWjgDPoLeB+Y/At9gCIdGGN4sHO4U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749043468;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wCNTPJfskIhANg0RiKYHsBz7kOPSHztZlUotAgnVEF0=;
	b=UFuUk7U0iVkVcYwV/BWOTKu/Mn7HG3BvcbST3LvUU6rPkqSe1mJ96LESVOJ85ore
	G69LWWzPm1Ne4TX1P1PQ/qN3qn0y0Sv/VngAVb7tQmkKnn1EES8ldDwEDh9Kbrckav+
	O05rTCJcYTQhscMv1DcWSeDHAPfCiwC+WyD9Nhz4=
Received: by mx.zohomail.com with SMTPS id 1749043466448171.76502669274078;
	Wed, 4 Jun 2025 06:24:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
Date: Wed, 04 Jun 2025 15:24:22 +0200
Message-ID: <4317526.1IzOArtZ34@workhorse>
In-Reply-To: <CABjd4YwtbMTT1W1rEdZzZ=KC3_EXXYKQBsTMiH5mPXPhgvQ=Lw@mail.gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <5590100.Sb9uPGUboI@workhorse>
 <CABjd4YwtbMTT1W1rEdZzZ=KC3_EXXYKQBsTMiH5mPXPhgvQ=Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_062434_516374_FC771B5A 
X-CRM114-Status: GOOD (  24.61  )
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

On Wednesday, 4 June 2025 08:52:51 Central European Summer Time Alexey Char=
kov wrote:
> On Tue, Jun 3, 2025 at 9:51=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > On Tuesday, 3 June 2025 19:01:14 Central European Summer Time Alexey Ch=
arkov wrote:
> > > Enable the two USB type A ports (USB2 and USB3) present on the ArmSoM
> > > Sige5 board.
> > >
> > > Both ports use just one xHCI controller, with the USB 2.0 signals fed
> > > off the same USB OTG PHY through an onboard hub. VBUS of both ports is
> > > controlled by the same GPIO regulator (VCC_USBHOST in the schematics,
> > > toggled by GPIO4 RK_PA6).
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 38 ++++++++++++=
++++++++++
> > >  1 file changed, 38 insertions(+)
> > >
> >
> > This is already done here:
> >
> > https://lore.kernel.org/linux-rockchip/20250507-rk3576-sige5-usb-v3-4-8=
9bf5a614ccf@collabora.com/
>=20
> Oh cool! Sorry I missed that one. Your series is much more
> comprehensive, so this patch of mine can be dropped. Thanks for your
> work!
>=20
> Would you mind chiming in on the other patches here, given your
> knowledge of the hardware?

I gave the others a brief look yesterday, I'll give a more in-depth look
and test today and send you my Tested-by and Reviewed-by.

>=20
> By the way, you guys don't seem to carry those patches of yours in the
> Collabora tree [1]? Nor the TSADC updates as far as I can tell.
>=20
> [1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/=
=2D/blob/rockchip-release/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.=
dts?ref_type=3Dheads
>=20

Yeah, I just sent them upstream directly, since at this stage it wasn't a
SoC and board in wide enough circulation yet where a ready-to-use public
tree with all the in-flight patches made sense for the added chore of
rebasing things when new version of patch series get submitted imho.
Though since some of them have been languishing with no upstream response
for quite a while (*cough* TSADC *cough*) and some more RK3576 hardware,
notably the RADXA ROCK 4D, released in the meantime, it may make sense to
have them included in either our rockchip-release or rockchip-devel tree.

If you want to keep up to date on what's in flight, our RK3576 mainline
status matrix at https://col.la/rk3576status is usually kept fairly up to
date.

Hopefully once v6.16-rc1 drops, upstream maintainers/reviewers are in a
better position to take a look at some of those patch series again, I'll
resubmit them when the time comes. Nothing lights a fire like a RESEND
prefix in a series.

> Best regards,
> Alexey
>=20

Kind regards,
Nicolas Frattaroli



