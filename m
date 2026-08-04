Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE18AC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0K5uL+ffxmjOwUEwo70igju+6SeZRlmphKolSxYy0o=; b=YApR4NZJYF6yDFp3696x2kt20o
	hb6cpVD+oGc0WnSajcxjHODX8U6o/CRbzVOvDPTukK10xY8x19KM2d/lh8zjx7nj85V2AB8qaJ45f
	ZDWnfEgj0N2EyCPAzzON57Tw0STgXolBfGAD3u7cLE3hFGKMapQI02TIPmqpFbpgal6RhKcmiKx/D
	Ih5bcD/W+kdVbsmlJkAhAH+UITEKnkXkSzN/SBOypII1O91+pASEIqreh5MSApJ+xI2shCcDBe1oY
	C8skJEgNezyMpZubvprlESKOuZ2XQbEvF9gv0cyB/8MWbT2bHXjxzzS5gRVtQhX1ZOeL0rDia1OPh
	NZ2ZJ3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7Jq-0000000114a-24O6;
	Tue, 04 Aug 2026 05:04:02 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7Jo-0000000113u-0tb7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:04:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso867128a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 22:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785819838; x=1786424638; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0K5uL+ffxmjOwUEwo70igju+6SeZRlmphKolSxYy0o=;
        b=q3f9DbpdM16gxf1hAI0GT1agCJrv+y4gtHd4hGo7d2rOXfngPe4SuDPvk4k+EF25Bf
         ps4omyNDzJ3W7EvedXyLtoBM2j1C8cpZcqZrhYbef4eygsoH4nvnzhL6zQUBvT1IlzyV
         qcTsqtrxxZrAFkZmhUEiotTtHVJWdy3KO1s9JqQp73LfKxltirOHubTFIys9+zzNbgQF
         UyoYqhMOp2i5BPDPnGERFx3Yz92i79FAwLtRX0XEp+oiOm3K1zOAxLp/susNXphqtGmY
         Xh4CK4/DqE/MpIag68HASw0P1QHieYfZJ7wPIzvC3v3tFX4Eufjukjixo//USqClje1Z
         lW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785819838; x=1786424638;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0K5uL+ffxmjOwUEwo70igju+6SeZRlmphKolSxYy0o=;
        b=NVR+9sjBeVQvqEbjvyOwT12qir7YnecIMTNSfvQgYd3IVY7gLPjOkjtuU8uJV6Z8Jp
         xDgew31qxph5kp6zOErWigPMDfakofkBzec5cwgBlEJciUkdbjqP499FhCXJsB9O+Wls
         ODYK3UWEkyWHTBbyy3N4X1e04DNkvSt/ywU7s7YzmcJ7/FiUjQ31cIGyglMmsyOaMVkT
         aFZCb92TDSdsnKGTTpv1mVEUKZ9VjUyqQKwiiI7/cnwvF33WHIQj1TpZJaTh45MujwHh
         lKBIJV/WeWsE29oBKNHaCkjrIGXWQPoq90xXXFPaLGnHvJ5yvSLO8nufmc7wwANjzJOs
         IVCw==
X-Forwarded-Encrypted: i=1; AHgh+RrdJfX7iOxI9yC74xOgHrJmRfZSRcBhs4CRE4djoH9vrtOUo/Thu7skfk9UcNcBI9ZfBqdIDoPmW8H21Lcv3K6b@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq6EM7v3E/RdHXlKnk929hNmrDkdA4DuYVoUe+4domXNERJL4V
	XPQr3QMRY1cmCmkjEii4GmYqd2M09sR9eOJIl7SNwGq7sMVYorHJCUdZ
X-Gm-Gg: AR+sD11IAy/k+RKcHzBo0GPXdsJalCIDVV3KQeDHbYzXyyf/nN4DqFBG4gpAk7ino/6
	xEn7JGCEhLfmwsC47jJFtGeoE0cnhjErT55mG0MeVZwV53rSMICMFJ3TnMFK7f+XYb34YNlF196
	nKhtVM8jkCnu02Cjmopu2dBXFCcJh6iSTk81y41OW6spdBjq6g5GUnLojlew6a/bUndcpi2Oz2o
	INjdmF+3vaO+MV3HJH+MvB7F9eSIWPEp1jIGbhFFeO7fwmN82xg6d2ow/6HynJgxQ/EMhE/4zXI
	+FZktDNTp2VasTHH+hIvhD6OLMGujHLsYKCl2qjBCHoEDz0KJlKNVM0RafCyR2jzb5A0F58tvr4
	VmGFbFsIGOsmVTFcolwZX3ngX5FGcu9M1KdTWYA2QH3cOURvQDTXEij/M43sBCiV32VgtSRvd2h
	WRxzCeVoG4ifK39aJa9M8im0BacnSuJiU0jNOSn4cU4k6fhCY4vmfReEFibgAZf2PXN6SfONPAn
	MnkJlWAa8wLWBDBAuLddDHBe6lw+o6yGJPRezIr0dibkDHfMxRGscZcIPET4/crIo190emhv7U4
	MCd2H587WM7uvl+KpUe+q11nyaYm30REYqWGqq12po0h2DQMbSPLyiIFcr0seYADeHR9ELdy+su
	a+grXDfbcm+2uz5GZPAbx7ezqKRiuenk4tAIT7TvDac0jodtLHNoB3c5t1mbrDguT95d6T51c6G
	L4bsa9fFWHWleQ8qv91R8=
X-Received: by 2002:a17:907:3e07:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c20244fb9a5mr217102666b.1.1785819838130;
        Mon, 03 Aug 2026 22:03:58 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-65-17-gprs.simobil.net. [46.122.65.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c90739sm627034766b.14.2026.08.03.22.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 22:03:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mfd@lists.linux.dev,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
Date: Tue, 04 Aug 2026 07:03:49 +0200
Message-ID: <AGtA6uUwR9yJMX3xYVDz6g@gmail.com>
In-Reply-To: <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
 <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_220400_280511_5026D05D 
X-CRM114-Status: GOOD (  44.85  )
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

Dne ponedeljek, 3. avgust 2026 ob 17:57:15 Srednjeevropski poletni =C4=8Das=
 je James Hilliard napisal(a):
> On Mon, Aug 3, 2026 at 7:26=E2=80=AFAM Andre Przywara <andre.przywara@arm=
=2Ecom> wrote:
> >
> > Hi James,
> >
> > thanks for sending this to the list, but as Andrew already mentioned:
> > this is quite a beast, and would need to be broken down.
> > Jernej and I created some patches just for the AC200 PHY on the H6,
> > which Jernej recently revived, and IIUC, wanted to send to the list.
> > This would probably be a more workable route: start easy, then add
> > support for more SoCs (H616 depends on the WIP PWM driver) and more
> > variants (AC300) later.
>=20
> Well, I wanted to validate that the overall driver design is suitable for
> the H616 which has to support both PHY variants at runtime effectively
> since that is the most complex use case, I also don't have a H6 board
> to test with myself at the moment. I think being able to see a more
> complete implementation like this is helpful as it can better inform how
> we can tie the different control interfaces to the link PHY in a way that
> works for the more complex H616 case.

No. AC200 and AC300 are separate chips.

Just making some artificial connection in DT, because H616 wafer is once
copackaged with AC200 die and at other time with AC300 is not correct.
Let just have bootloader properly identify copackaged chip, enable it
and be done with it.

I'm working on proper AC200 series as Andre mentioned. I researched all
functionality because I don't want to miss anything in DT and to have
good arguments why I did thing the way I did. This series doesn't care
of anything else than AC200 EPHY, which isn't correct. Some things are
even not properly modeled and it was already discussed in previous
reviews. For example, MDIO PHY node should reference both, clock and
resets.

I plan to post AC200 patches with at least audio codec included,
alongside EPHY. TVE is also working but it has more open questions, so
it won't be part of next submission.

>=20
> > Which also brings me to some attribution questions: If I understand
> > correctly, this has been written mostly by some LLM? I think you would
> > need at least to disclose that, if not even add an official tag?
>=20
> Some patches were, sure, my understanding is that it's not required to
> explicitly call that out but I can add more info if that helps, this was
> tested/validated using a heavily automated hardware in the loop
> testbench setup on an AC200 and AC300 variant H616 board.

Yes, you have to reveal AI involvement.

>=20
> > Also I wonder how this relates to the patches floating around for a
> > while already: https://github.com/jernejsk/linux-1/commits/ac200-v4.
> > This branch is relatively new, but the ac200-v3 branch for instance is
> > much older.
>=20
> Yeah, parts of this are loosely based off of some existing patches that
> were floating around like those, although it has diverged quite a bit as
> well since this series is designed to handle both phy variants.
>=20
> I guess I should link to some of the earlier work in the cover letter?

However, what bother me more, is that obviously a lot of AC200 things
were copied (even if only by LLM) from my WIP AC200 branch without any
atribution to either Andre or me.

As Andre mentioned in other response, let do it separately for AC200,
AC300 and detection between them (best in bootloader).

Best regards,
Jernej

>=20
> > On 8/3/26 07:14, James Hilliard wrote:
> > > The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
> > > Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The two
> > > packages expose the same link PHY ID and largely compatible link-side
> > > registers, but require different control paths before those registers=
 can
> > > be accessed: AC200 is initialized through its I2C MFD, while AC300 us=
es a
> > > non-PHY Clause 22 control endpoint.
> > >
> > > Some H616-family products were shipped with either package under the =
same
> > > board identity.  For those systems, this series uses a SID NVMEM fiel=
d to
> > > select the control provider at run time.  With CONFIG_OF_DYNAMIC, the=
 link
> > > PHY enables only the selected fail-needs-probe provider, so an AC300 =
board
> >
> > Just to bring that shallow discussion we had on IRC to the list: I
> > wonder if this is the right solution? Alternatively I was wondering if
> > just patching the DT in U-Boot would simplify things, and also help
> > other DT users like *BSD or U-Boot (proper) itself, to not boil the
> > ocean, but just allowing them to follow a standard DT description.
>=20
> This can be used either way, CONFIG_OF_DYNAMIC isn't a hard
> dependency with this design, aside from adding CONFIG_OF_DYNAMIC
> support for mdio the dynamic enablement of the correct phy control
> drivers is relatively simple with this architecture.
>=20





