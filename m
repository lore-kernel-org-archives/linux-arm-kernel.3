Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9273C98324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RSbzXLvSVEOnRR2F+nkCevP1o0t0p9ITeJnENpJDZs=; b=Jj57z0kV+tJris97hfgEOuQ2yf
	zp3lEU+YtSRo3RVbUv5KcKFkzmu27sm7jI/5qEGh9+bvWzNAR1CZ0zHV+KrYjJWmREGCgGOofzpso
	QwOx4PRdnCQnIBH8/WURJi6BkDBmz4Txq73MjoM+3cC0m+tgFXwHYvF7PGAgUbj+r1mRdnW+shPWm
	z91tN58mskVjXtivPPNQ4abCdRjp5oVX9K/H6hPKxIUgLvGTof8u1xOvrZbZOYHDUSA0RBXlf8UpK
	+EwqZgPnCs8/NoWhRZDlcV0j9vwQABdACye+Jl3d/qGUBPGCafUEoezfnXg7rcWvZUAWZFgDQ7kjh
	mslkTOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6PZ-0000000DVH5-2dxJ;
	Fri, 25 Sep 2026 13:56:25 +0000
Received: from mail-lr2-x0f.google.com ([2a00:1450:4864:38::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6PV-0000000DVFt-3Qe2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:56:23 +0000
Received: by mail-lr2-x0f.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso7227621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 06:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790344578; cv=none;
        d=google.com; s=arc-20260327;
        b=Pn0FM81qM80751Aprp3+slr6ZvaWaMYvO3ZVbz4xHTchN33IZWk6ZnTny2uXfgyDEi
         P/EDVWWHKCR5MD46NQXNSWRES2XGaKCpI4iXwSOyTjFLWtc+kbIgeaj7/jQLTUf/tWF/
         /hIk4/UMvtrHnmelqpkFCfNKRpgyl4rpJbZnLL6BodIefrP7g1b/QBUdk1UesSstQOhL
         2q22nClEiP/4j+t8PPFqsvHs+mt/R+eBht31PeOsFo1vDrhIFrY5OnYYPvms8zNoVBF7
         3kWqxa/Kj3EB7Kl57EbnKNTiZAnsEqOFH38vjDjpXp+t50FndsHxfnaHgTJZv7xE3izR
         eozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5RSbzXLvSVEOnRR2F+nkCevP1o0t0p9ITeJnENpJDZs=;
        fh=cyeequsn9wXtSta5jD6tjlGrE2bsfJY2d4XFJsfD68o=;
        b=GZw+qEx12F4I80irSN1F/sm3URtO0aVDPLpqQR4QJMXPk4xbx7rbxA10fUgBEEJ9sp
         /dWFJO8OddZi8kJq9m2uni2WnDY6p3VcZjSi4Vtq8arsydV7UXQvgVXjFhGIU1klse7j
         QGcP+m1v2lGSrjU5Kyxgzshx1bPqrM613kO85o7S77WdpRpk/Gd1yNEoxpKdYM+1o3Uh
         46zkwFN6HuByGIkEI/zrKy0H2txRypOIUBrDJaCSBjTGBcxzn5u9BAKEezLqGDbRQ7TM
         TuLuYEG3p9cHvYCQxB4gY/3eavNSChg+6HRjvSxMZ6uL57TiMuLBBU1SzI+G9qTm3b8J
         ZpPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790344578; x=1790949378; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RSbzXLvSVEOnRR2F+nkCevP1o0t0p9ITeJnENpJDZs=;
        b=Ah3nxQznwpXpiue5j386eNtBq6lCG2LklmXtDe2NgyQde4b1xGKaIruHTxBhD/XuSg
         pqaVrCGcARMS+CHqkmTJdS1z8x9kr9k4qzbJYOwBSMj7SC6T2o0EDrCS2kSuroSWEzbA
         y0NMH8EZkds9xvPvEFAddAFCCPoTtp9XQ+HKEW0bi5Jx+pqN6QNr8cJpVHkXayPTpXWa
         RI2r8xCVM42gQUhBObQRaK0D0IdCoRoeSHjbv5QTubORFIlvlmpmEROroKdYcY0U1P0Y
         jdS67vOoapEVNA9yjg4rNHUlBARfEgB3h6JuGPpepkLS/8amLUhpJMO/Z7pr2W7IjEGg
         wg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344578; x=1790949378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RSbzXLvSVEOnRR2F+nkCevP1o0t0p9ITeJnENpJDZs=;
        b=TsYRck2xJe6P2KCA4tvDJGGfIHOjGV51TFxyW5ybAw476L5puVsCIMa5Y1hniVKNhl
         ELKoR5amREQFo5cYUSUbvOg0VXK3QiOI4Sl//tqK79GrOdV9HRwrWBzAaKlzZIl4c15+
         xuoRnw5t9VS5XrKZ3Yh0GbhSj98gc7wJGMhZrAtDFefs9s9GOJ+IaD57dgjG+CArr2g5
         iSMitl7EWdauFK5Kc2C7AhRNhYHh/5YXOOE1UCdYfcN37AkDl0FggnzvZBg+UIANDR2r
         kMyGGuylEME52sslSPJEWQjXgJBH0KW+E8TCEkn4pJWJIvJ8njPvgUYxckVQnCagQjgl
         xBeA==
X-Forwarded-Encrypted: i=1; AKwUvBxcGRaZCmohyViYKgSVkAgc9zZdrA1NBoszNd/WOrwBXPOFVFzHd3qkqyN/PeZgcF6+DKbLz4TWFoYR9PJRtnuD@lists.infradead.org
X-Gm-Message-State: AFuF++lpxVcri4QFKymx4GxA6QqglMQMhc3BS7aYoqEeimAL46YKVfA2
	9EM0hDfDzecSVufzg1eKD5n4m3R3X2bhu3qP4rUvWU00gz5H1N+l8QhILks5Y1Og23vwJTkiE6w
	TESEorGfDgbw5XqEfovft4kuVkMZocvJgn+2K+RzTDg==
X-Gm-Gg: AYBFou1gA2CNUfomBpcBjEurtv0BnRl05aZwCuspt/j1kjDoAdP3ZKWdXYHgyB5HU5Y
	9GSznHrj0jFHlKq/pyGrPg75ktkKcPENLS/Rbfd4osPlMvP7nca9mnLBpm6FgYJrD1ilAnLb4hK
	tBBoz68XQTIQ3R6HXFJLWlAA/kfJky8kG2IWUc+borH0boMAPouhGnuvjYzRVU7Z+FODguuVlgM
	Kp/wetPwindv6LM8qpReSNS8NtZoim/KJuFv9aVmQx+pLrlLscYNwhUdkt/L78lBjO2pY+V454g
	UqETMsm8kQPIX1A8OjYJTd6veUdinCa1Co+nJV6H/C46vBOUcdUZDy20
X-Received: by 2002:a2e:be1d:0:b0:3a5:dfe2:7f5c with SMTP id
 38308e7fff4ca-3a63c0df7bemr13420501fa.16.1790344578255; Fri, 25 Sep 2026
 06:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se> <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
 <arZ0nqBvHDzSbZOE@venus>
In-Reply-To: <arZ0nqBvHDzSbZOE@venus>
From: Adam Wermuth <adam@wermuth.pl>
Date: Fri, 25 Sep 2026 15:56:07 +0200
X-Gm-Features: AclHuK-tBvtfu3ULfg1Xof4vNjCZDJ-C6A-b4CKwc6HFF2K6CA8VYr9U3QBsxtw
Message-ID: <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_065622_427941_E0AAC572 
X-CRM114-Status: GOOD (  36.51  )
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

Hi,

On Thu, 25 Sep 2026 3:26 PM, Sebastian Reichel wrote:
> Why would this be better suited as an Overlay? Nothing describes the
> specific card plugged in as it is auto-discovered via USB. The
> overlays are mostly required for things that cannot easily be
> auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.

The overlay was Jonas' suggestion, so I'll let him explain his
reasoning. My own understanding was that it would avoid powering the
slot (always-on supply plus RESET#/W_DISABLE1# hogs) on boards where
nothing is plugged in.

That said, I agree that the module itself is auto-discovered via USB,
and the Key M slot on this board is described in the base DT as well,
so I'm fine with keeping the B-key slot there, as in v1.

> Something to consider is, that for Key E and Key M there is a proper
> DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.yam=
l
>
> We probably want the same for Key B.

Thanks for the pointer. As far as I can see, a Key B binding would
also need driver support to handle the supply, RESET# and W_DISABLE1#,
so it is a larger piece of work. Would it be acceptable to describe
the slot in the base DT for now and move to a connector binding once
one exists for Key B?

Jonas, Heiko, what do you think?

The fan patch is independent of this, so I could resend it on its
own in the meantime.

Adam

pt., 25 wrz 2026 o 15:26 Sebastian Reichel
<sebastian.reichel@collabora.com> napisa=C5=82(a):
>
> Hi,
>
> On Thu, Sep 24, 2026 at 09:03:00PM +0200, Adam Wermuth wrote:
> > On Thu, 24 Sep 2026 6:12 PM, Jonas Karlman wrote:
> > > This and next patch is likely best suited as an dt-overlay.
> >
> > Thanks for the review. That makes sense, as the B-key slot is not
> > always populated.
> >
> > For v2 I will move the host1 enablement and the WWAN power, RESET#
> > and W_DISABLE1# handling into a new rk3568-rock-3b-wwan.dtso overlay,
> > and keep only the fan patch in the base DT.
>
> Why would this be better suited as an Overlay? Nothing describes the
> specific card plugged in as it is auto-discovered via USB. The
> overlays are mostly required for things that cannot easily be
> auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.
>
> Something to consider is, that for Key E and Key M there is a proper
> DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.yam=
l
>
> We probably want the same for Key B.
>
> Greetings,
>
> -- Sebastian
>
>
> >
> >
> > czw., 24 wrz 2026 o 18:12 Jonas Karlman <jonas@kwiboo.se> napisa=C5=82(=
a):
> > >
> > > Hi Adam,
> > >
> > > On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> > > > The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOS=
T3,
> > > > which is served by usb_host1_ehci/ohci through the host port of
> > > > usb2phy1. Enable the controllers and the PHY port so that modules i=
n
> > > > the B-key slot, such as LTE modems, can enumerate.
> > >
> > > This and next patch is likely best suited as an dt-overlay.
> > >
> > > Regards,
> > > Jonas
> > >
> > > >
> > > > Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch=
/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > > index 149a5306bb03..ad9a91c0d0d0 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > > @@ -758,6 +758,14 @@ &usb_host0_xhci {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&usb_host1_ehci {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&usb_host1_ohci {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > >  &usb_host1_xhci {
> > > >       status =3D "okay";
> > > >  };
> > > > @@ -780,6 +788,11 @@ &usb2phy1 {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&usb2phy1_host {
> > > > +     phy-supply =3D <&vcc5v0_usb_host>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > >  &usb2phy1_otg {
> > > >       phy-supply =3D <&vcc5v0_usb_host>;
> > > >       status =3D "okay";
> > >
> >

