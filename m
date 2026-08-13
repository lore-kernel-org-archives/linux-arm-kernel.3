Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DF2C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 04:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=; b=puzZsRKV7Ci6kUa8NN6RGcIci3
	+SvlWoONf/GAWIwFun87qYhxjMla4BNOgWBa0B4GbnS/XyYe7822WmEWerfJpTRSqNa9OlDuMTymr
	/SWVa437mg7YkGMPQKCuMLf8VtxoDOvqO7uQRCiybedMzfsNBQP2dG4bIIHd5Yid5I+FXLpt6ovae
	rCD/qeZuAMTVXBvIfDpmw2cyu0Fd0rkPiN6XdY/bsaZl3OyjZJ7tRl0vTLGTrZ+CdrZgzP80R18N9
	T7tvWY17QEf8/zkgjcP407qMNIoZVJUG9u6MIegVKPm30KUuNBOZtSSjwfr7TwKRulH2pLCaPNcJm
	dnP73+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuN8r-0000000HMMQ-2gG8;
	Thu, 13 Aug 2026 04:34:09 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuN8o-0000000HMLI-3OFo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 04:34:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-69edc72e513so274657a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 21:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786595645; cv=none;
        d=google.com; s=arc-20260327;
        b=hFBq2ncy8jFpkHouBwqGF4LqLc9wRnCVVxWPjRMuwjV5TxEmrgXrbnfGWnm69cpGDq
         DySj5/KDlVXXwAcvav+XawGza6Sky+PsHkOAy1V/vXAJYGJ/4YKjt+OzGVW5AL6C38ji
         idJEpLy/NlaC5Eq3oD1ExE/2HQ1duTva5hq3OCfyu7oa0SP8/pO+DStLROJPTr1q4h6N
         Zvgh7x5JgSpwzbFX65o8KoKsvZAx7LWATVMnUMb3xKj7aolOXcMOnrQkDzlwzxrRY/KW
         wQ7WpX1wkAXjqrjT8DSH0sfJI0yfG6FrG/PCFWCke3WTajklk2SCJxFVQRx2B/eGkqyD
         S8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=;
        fh=kW3RGcKm6zysDjc9HacC5We6g60iIjMaiT7HuhEI7hI=;
        b=IAsor14nKismXjGnwZGemK5c2mOEqGiv0POzFPuRpxdGZngk1nE5q3DWJ3nLr49SNc
         9lDeir3ncNWa8Ewg2wQKr7KotK9GPV1TbISs8YsUZOGGKKGTvZkTgjRn8fyx6SicvdkN
         Lc5suL1aRupUp02zvYZJxr48efsiOiFSeRog9mLU4zpl12Dxbe3TqHXis6f5xy/zlTsb
         SX5vMSF9xPz2bk8Qu4uqSrBgatytsbUMYlU7jTgefSDKE5Jaz7b8kM1WGlIUZa/B50aC
         oD1IUDxh9vOxo4uEUmsuIT6C+sy/zBq/3KPuPAjR/740VUMKZn0HzeexOzxvNT9q69BP
         TMuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786595645; x=1787200445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=;
        b=C9RMc39EWrhwxkvo5uzMAoVVlcQZEkDnUe50f2wOae6sPWFbxP+zU+U7Ffrq3cP7q+
         JkLyr381luM5v0YPTKhMvU1Pn+NPtqsjzY6kYSsgR10dqw0PG43HqfU3ix0G4r5m2T4T
         Zy9Nn4/ixWWggpW8RjxabuDH/zj1N6je2Imqx+U7m7ItuCoNLl5k7lLBRz3QWiX3oGKE
         WBiaEzC+KIUMPsNHIPriCGFgp52UW7zgkyYfd+jsgLUlDqhC9ybahrwzX7doPNagQ+4q
         opB41ZPOuy6TAjNyo18I1tQj8DVGPHCsTW9TaLh6jGWlEpNDPGMzoVGAihL6W4ZmcCCr
         uoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786595645; x=1787200445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWt9GMlkQ5SKTKoLjtBj5Z7tRqHhXQnrfKMH2pIVYjs=;
        b=DXKmoVIrwrmloalAKW3v3O1LRMUuPkbuk0V2ai3yUN4dLCnCRyVSja48sIr6yJaOYO
         sicEomgqnlC7qyyx3wDgD5rJVHtR3hFLZxL2H+mTlnoCDH+dfKTQix381+OP95IqcMP3
         30JIttiEg7QNW5+64vfNaRVwjb/FshfB3SEzAR3F9eMzvPOZY20XHsgLApwNbI9bqDjp
         qVxEDDEMyGGESo3E4xbY4wszDa+jY928rZ/il81U76OxKC8E5tMUSseASNhUeVVpw3Z8
         DlFAgVz7Zje8e1TBrQKSXqDQONxovspq8io5bGysSFhUIZHHj2kpgUt8wgxk7NfmWucM
         39Jw==
X-Forwarded-Encrypted: i=1; AHgh+Rr90ZWov9+qr55ACogTwK7IcNsa9fELwJ7F7EVkZZvd2DoY+zuR8JZNyQdrFIn9IhUyXuYgojPQ47/wBvEYzjSw@lists.infradead.org
X-Gm-Message-State: AOJu0YyCmY878EWqEB1NMMDcqiHAedDwdlOuNdyIgRLfgTx/mUqNB+VP
	sgPAMLW82TkBxIC4gH+8OWsMQXtHxomGlGs2joA/b+KNfXp4kby8xOVo7vHXPlLCbQhw/t984yn
	4iUk5m26Mbnkj7ZD7565Nx4/KJFc57ME=
X-Gm-Gg: AR+sD116KFGz/6GUakxDJgwaeOWoIN1PLpLdYdIa6JBUHO0AVtjlDUCitsqAlS3QME6
	yPktLZC9CkfIrfNA/KYXCM/ruQdK4LUng/ToneVVUGzNM3wn8s3ZJ1EkhTGiOMP8RkQfS5Yy3su
	Qa7NUOY20m0neVKG7mQXqssl2P09tuMp/nW7o4EnAXVyJwZnnCSsP+ILIEvsY9M0rWAAEMZX4hZ
	RYKy2Posv/J12g90c+UJTpJafhrTF4rs4RUKVhPbdIVo0OG9nUzW+lYRhcw++Uui0TZCRPfrzCB
	J/2kAalRHqh8y0QGofYDoxiQUJ4iuovGOD3lgCYaIJQ=
X-Received: by 2002:a05:6402:4285:b0:6a1:f95b:8cfa with SMTP id
 4fb4d7f45d1cf-6a38057b8e7mr588108a12.1.1786595643974; Wed, 12 Aug 2026
 21:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com> <20260812-refreshing-rampant-gecko-b38ef9@quoll>
 <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com> <an0FMnDSWbud8hPc@venus>
In-Reply-To: <an0FMnDSWbud8hPc@venus>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Thu, 13 Aug 2026 12:33:52 +0800
X-Gm-Features: AUfX_mwIpoDBN6_Xma1YlUJtYi1wlkbDTU_6WkCYu-2CI0nPqWhdFEDAcDuwlbU
Message-ID: <CAPwA33+7k7HMC7ezwH+MGn64iRHT6tVNK55t6gaC0nkkqWoE4w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_213406_900343_4437C0B2 
X-CRM114-Status: GOOD (  45.60  )
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

Hi Sebastian,

Thanks for the review.

> Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_CSI>
> you defined the direction of the PHY, but will it operate in C-PHY or in
> D-PHY mode?

You are right, and I am sorry - this is a regression I introduced in v3.

v2 already described these as two separate cells: the first selected the
electrical layer, and the second selected the direction. Michael Riesch
suggested using the generic PHY_TYPE_DSI/PHY_TYPE_CSI constants for the
second cell instead of the Rockchip-private RK_DCPHY_DIR_* constants [1],
and Vinod Koul agreed [2].

In v3, while making that change, I also mistakenly collapsed the two cells
into one. That is what lost the electrical-layer information you pointed
out.

For v4, I will go back to the v2 layout and only rename the second cell.
This keeps the two dimensions separate, with each cell describing one
thing:

/* MIPI DSI host - the transmitter */
phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;

/* MIPI CSI-2 host - the receiver */
phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;

The same applies to C-PHY, so the binding can express all four combinations
without any further changes:

phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_DSI>;
phys =3D <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_CSI>;

The driver accepts all four combinations at phy_get() time and returns
-EOPNOTSUPP from power_on() for the C-PHY combinations, as it did before
this series. Boards that only wire up the transmitter keep
'#phy-cells =3D <1>', so the existing in-tree device trees remain unaffecte=
d.

Before sending v4, I will go through the code and commit messages again,
so that the reasoning above is captured in the commits themselves rather
than only in this thread. I will also re-test the series on the board.

Best regards,
Jason

[1] https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabor=
a.com
[2] https://lore.kernel.org/r/anSuxfeitSqmSHNr@vaman

Sebastian Reichel <sebastian.reichel@collabora.com> =E6=96=BC 2026=E5=B9=B4=
8=E6=9C=8813=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:03=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Hi,
>
> On Wed, Aug 12, 2026 at 08:24:11PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 wro=
te:
> > Thanks for the review.
> >
> > > I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> > > Isn't DPHY implying it is DSI?
> >
> > I see your point, and I did not explain this clearly enough in the prev=
ious
> > version.
> >
> > D-PHY only describes the electrical layer, and both MIPI DSI and MIPI C=
SI-2
> > can run on top of it. A CSI-2 receiver's PHY is a D-PHY just as much as=
 a
> > DSI transmitter's is, so PHY_TYPE_DPHY alone does not tell us which one=
 the
> > consumer is asking for.
> >
> > That is the problem here. The RK3588 DC-PHY exposes both a transmitter =
and
> > a receiver from a single PHY block, which can be used by two independen=
t
> > consumers at the same time. This is not a theoretical concern: on this
> > board a DSI panel is scanning out while the same PHY receives CSI-2 fra=
mes
> > from a camera. With only the electrical layer to identify the PHY, both
> > consumers would end up with the same phandle cell:
> >
> > dsi@fde20000 {
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the TX */
> > };
> >
> > csi2@fdd10000 {
> > phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the RX */
> > };
> >
> > There is then nothing in .of_xlate() to distinguish the two requests.
> >
> > I will make this clearer in the v4 commit message and include the examp=
le
> > above so that the reasoning is easier to follow.
> >
> > For context, v2 described the direction with a Rockchip-private
> > RK_DCPHY_DIR_* enum. Michael Riesch suggested using generic constants
> > instead [1], and Vinod agreed [2].
> >
> > [1] https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@coll=
abora.com
> > [2] https://lore.kernel.org/r/anSuxfeitSqmSHNr@vaman
>
> Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_CSI>
> you defined the direction of the PHY, but will it operate in C-PHY or in
> D-PHY mode?
>
> Greetings,
>
> -- Sebastian
>
> > > Your tag goes the last.
> >
> > Sure, I will fix this in v4. The Signed-off-by tag will come last, and =
I
> > will check the whole series again.
> >
> > > Two simple defines needed Claude.
> >
> > Yes, I agree that these two defines themselves are simple and do not re=
ally
> > need AI assistance.
> >
> > I added the Assisted-by tag because I used AI during the development of=
 the
> > series as a whole, including cross-checking the code, writing additiona=
l
> > test cases, and looking up the relevant sections of the TRM. (I checked=
 the
> > corresponding sections in the TRM myself, reviewed the test cases, and
> > re-ran them on the hardware before sending the series.)
> >
> > I also checked the current mainline guidance in
> > Documentation/process/submitting-patches.rst and
> > Documentation/process/coding-assistants.rst. Since I was not sure how m=
uch
> > AI involvement should warrant tagging individual patches, I chose to ma=
rk
> > the whole series consistently.
> >
> > That said, I am happy to drop the tag from this patch in v4 if you pref=
er -
> > I wrote these two lines myself.
> >
> > Thanks,
> > Jason
> >
> >
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=88=
12=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:51=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Mon, Aug 10, 2026 at 08:10:09PM +0800, Jason Yang wrote:
> > > > MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: th=
e
> > > > same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI=
-2
> > > > camera, and combo blocks like the Samsung IP on RK3588 expose both
> > > > directions to independent consumers at the same time. A binding tha=
t
> > > > needs to tell the two consumers apart has nothing generic to reach
> > > > for: most constants in this header name a protocol (PHY_TYPE_USB3,
> > > > PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
> > > > layer.
> > > >
> > > > Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
> > > > protocol it speaks, which also implies the direction. They do not
> > > > replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
> > > > where the cell selects the electrical layer. First user is the
> > > > Rockchip RK3588 MIPI DC-PHY binding.
> > >
> > > I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> > > Isn't DPHY implying it is DSI?
> > >
> > > >
> > > > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > > > Signed-off-by: Jason Yang <jason98166@gmail.com>
> > >
> > > Your tag goes the last.
> > >
> > > > Assisted-by: Claude:claude-fable-5
> > >
> > > Two simple defines needed Claude. Great, that probably makes AI
> > > conglomerates very happy that we do not type even two lines anymore a=
nd
> > > need their resource-hungry data centers to do that for us.
> > >
> > > Best regards,
> > > Krzysztof
> > >
> >

