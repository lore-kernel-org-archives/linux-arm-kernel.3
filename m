Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28D51061B2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7hbRBTpUIN+ln6L5dv1hc+tqClxwvFAb+PRq7Z+5XE=; b=0TuzNLxHqQfm6sdxXzCQITeTUo
	lBJjIueU1s85IXOccVrd+WVePSAVZpuByIZIIql6NxYxQH5tiHn1np5mlr2pCgKflwhkLk8jOuF1U
	T+mcx3Z9sHdgqk5DTvMUzF6CMQiyVU4dH/3fs2YYjSCWjJkVUVCEIqtZc7Ftq5fVJKUuFcCIJKr1T
	UXb4/ZzCAnrdPgJ8LqKiWEt8kUGa+iQUgbm9uIBdYhw/8CX6FJtE53GzAabuEAjXfEI1qHQ8ocfYG
	edIHiUPX/1Y6hKUMS5bdaGIhTACfmlg1ZLf1evFLVjCrUHS+cSbd4KzToq5pdpA++6+HEQ5juF2UN
	GETVzJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WyO-0000000CpdJ-1nNk;
	Tue, 31 Mar 2026 11:09:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WyM-0000000Cpcv-2Vni
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 11:09:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so50734125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774955364; x=1775560164; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7hbRBTpUIN+ln6L5dv1hc+tqClxwvFAb+PRq7Z+5XE=;
        b=PJZQ9VG4FnywmqUMU02lQLOuBirtAGCEHGzxksCmI2uGIHkjntT34f2g2CqE+Zu2vb
         o7hiprz6FVwysy9OKtm20GEwp/HECCpQeGr6pu3vq1Jg1eM7xX2JLnGmxO8zsokHPjyn
         5RCAoO6jaddqlnGpfJMz9UqG7ONUjDrBYMpLyad3ToGeCmvMFh+avDqV+9Omf+tH/ADv
         QAEGTIi3tnVji8m7RdilhNs4+QbCPXdWHsx8JQv48prF7xCl3uZC2MlZfiI3PN66xe+8
         Fe2WDBRkBmvR2ws7jlILBSFIHedokciqwWsTV15EWt9uvFAUSR28FLPJGJrQQt8MgPa5
         UaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955364; x=1775560164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7hbRBTpUIN+ln6L5dv1hc+tqClxwvFAb+PRq7Z+5XE=;
        b=ic5yxUka+oJXa1ZIWN3zEwnZKi3/H7O2UWW/GhjlHeiJlSN8f6d6XyGbz4yFaUmIub
         KjXO1Qz1u5UtNwJ5NrDeWkkCSn3sHd3Cla+hgvBoqeECizShDVrOF2xSU50ECURejs0m
         +AGpcVP/la6+6wY23dtQrnffM1gFpMkc/ZbwCS6690uSqyKPqpwcs6fYMIaYfUSa3gO1
         hfKGtHpwGHor4s15Uha+PQMynXpfNzl2goL9E6Y2+d37X4BY+scTI0F6h9HgQYiTXU2E
         uLZO1W92/7hN+Fg7vRwwXfW3FcfBQ7WTvt7yIDIrbq8RRu2HdnppSQaHHXW+v+AS6LEE
         nUVg==
X-Forwarded-Encrypted: i=1; AJvYcCUuA4nbsqPZNLBnXcJGGyzmQoLnu5yNzBFLqo0a4j1EI77lXikBVwc4Mf7m5A/JouLrcncycGvjPIMnrSf9JgvR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf/Fi9tNLbalZhlxwhN6ZJ2bWM6TthrHEyp2EHzwZ2hwLf3zZJ
	2j2pP0tM3gTgyvyZwQ6QO7g6jx9gQ8AJJiveCEW3E1BiZfEEl/sypbax
X-Gm-Gg: ATEYQzxlca2l+IK9Hs/GGLhHyOoN6/OuUi8eiN+6RQY78xJ9uuRzEV0m8l0jHF0u8HN
	2T/QkNq/zYoLxwH4jNODkXiTgx118pdFjRsp3HoD5RCl4+XOaS8x1TAzsrvQ+INMPqhvyCpNuGM
	6lcdIGsTTzE4L0Aa3jcCyDAGjulLQqeapZuh5hnLUdROH8/wctdwIuVj85+3r75WPr11fb1RquD
	vi64MRoWSS5Wzi2TRlYc2uOeiN2hA0PjGkv3xI+dYvR0AqNI6P3nQwR2WJSrfERh8X1H9xlOGBZ
	VVWvuR34wbnHbP/TfQinkp8xSnBq6NRuqA6edCUkwyaYuQ4duDYcRC86pQv7qCAnTtXwgHetciS
	L2cJk/XzVy0UFe0m9mJh5hSqOXrK2sKIc18wl/+LYpg2XD2oT2AaAGllZJUrBDgxWpGSYiVIdux
	fFoTb8bwWttmgUHUXGRSET7rMDQ8ZpCJ29N3lzRrKH7fhkO0YypSpJqZMd0TI9gRBtydshHHRuJ
	AiTma9pDIAcHQ==
X-Received: by 2002:a05:600c:8b46:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-48727f0ea89mr252274975e9.11.1774955364046;
        Tue, 31 Mar 2026 04:09:24 -0700 (PDT)
Received: from orome (p200300e41f249a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f24:9a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm31447575e9.9.2026.03.31.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:09:22 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:09:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, arm@kernel.org, 
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
Message-ID: <acumPszu9kvDsebG@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <406ca5ed-4a3e-48ba-94ad-d88c53b09299@kernel.org>
 <act9hqxjL6wZ25dP@orome>
 <1bdf911d-383a-4ea3-9a33-f8ee6e8f26e4@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usfe2x3hrwjkocru"
Content-Disposition: inline
In-Reply-To: <1bdf911d-383a-4ea3-9a33-f8ee6e8f26e4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_040926_689522_B364EDCF 
X-CRM114-Status: GOOD (  36.36  )
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


--usfe2x3hrwjkocru
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 11:50:18AM +0200, Krzysztof Kozlowski wrote:
> On 31/03/2026 10:25, Thierry Reding wrote:
> >=20
> >>>       dt-bindings: phy: tegra-xusb: Document Type C support
> >>
> >> No acks, but that is waiting for one month so it is fine.
> >=20
> > It's got a Reviewed-by from Rob and there were no corresponding driver
> > changes associated with it. There's literally no reason for this to go
> > in through a subsystem tree.
>=20
> There are reasons - process and technical:
> 1. It's a subsystem maintainer's patch, not yours. You rather should
> have reason to take someone else's patches.
>=20
> 2. Conflict in that file.
>=20
>=20
> >=20
> >>>       dt-bindings: clock: tegra124-dfll: Convert to json-schema
> >>>       dt-bindings: interrupt-controller: tegra: Fix reg entries
> >>>       dt-bindings: arm: tegra: Add missing compatible strings
> >>>       dt-bindings: phy: tegra: Document Tegra210 USB PHY
> >>>       dt-bindings: memory: Add Tegra210 memory controller bindings
> >>>       dt-bindings: memory: tegra210: Mark EMC as cooling device
> >>
> >> That's even my subsystem and I did not ack it. You did not even sent it
> >> to me as requested by MAINTAINERS file (+dt is ignore alias), so
> >> obviously I did not even had a chance to ack it.
> >=20
> > Ugh... really? I was Cc'ed to you as a DT maintainer as well as the
> > devicetree mailing list, so I'm sure you've seen it. This had also been
>=20
> Really, you are supposed to use get_maintainers.pl. Not invent the CC
> list, not come with own filtered list.
>=20
> I understand that my non dt address disappears when running
> get_maintainers.pl on entire set.
>=20
> But if you sent that patch targetting subsystem instead of combining 6
> or 7 subsystems at once, it would pop up.
>=20
> And yes, you are not supposed to mix 7 different subsystems in single
> patchset. That's basic!

Pft... you're being unreasonable. These are all relatively trivial
changes that have at one point or another been already reviewed. Do you
seriously expect me to turn these into 7 different patch series so that
everyone gets to spend even more time dealing with these?

> But sure, let's skip memory controllers patch cc list and:
>=20
> > reviewed by Rob a long time ago, and honestly, it's also quite trivial.
> > It's been on the list for a month and there were no objections, so it
> > does pass all of the criteria you mentioned before.
>=20
> No objections because you did not cc people. How can you claim "no
> objections from person foo" if you do not cc person "foo", because you
> do not use get_maintainers.pl?
>=20
> Look, find me here phy mantainers:
>=20
> https://lore.kernel.org/all/20260223143305.3771383-7-thierry.reding@kerne=
l.org/

It's an extremely trivial, one-line change to an existing binding. There
is no interaction with the driver whatsoever, why would anyone outside
of the DT and Tegra maintainers even want to look at this?

> >> And we even had few days ago talk were I explained you how these
> >> bindings must go. Seeing pull request completely ignoring that
> >> discussion is just huge surprise.
> >>
> >> No, it cannot go in. Send patches to proper maintainers first.
> >=20
> > Stop making these baseless accusations, Krzysztof. You were on Cc and
>=20
> Not using get_maintainers.pl so not ccing right address is not baseless.
> This is the fact.

I use get_maintainers.pl but filter down based on common sense.

> Neither phy, nor interrupts, nor clocks were sent to right people.

Again, these are patches that were all on the list previously, sent to
the right people at the time. They hadn't been picked up by now, so I
resent them, to the DT maintainers only, to give you guys a chance to
object in case there were any new things you were looking for since the
original submissions.

> You mixed 6 or 7 different subsystems in on patchset, but you call my
> remarks as baseless. You use several adjectives "trivial", "baseless",
> but no actual facts.
>=20
> Final commentary:
> Stop taking patches from other subsystems, just because you want to
> streamline your DTS. You are bypassing other subsystems review, other
> people trees, and that's not acceptable.

You know, I'll do just that. In fact, I'll just stop working on these
cleanup patches. It's a shame because I really wanted to get off your
wall of shame by this year's LPC, but you're making this needlessly
complicated and I'm out of patience.

Thierry

--usfe2x3hrwjkocru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLq1wACgkQ3SOs138+
s6F40g/9Gm19ZLx1L7N8IJkoh+28EPi9w1WAljI6m1+RYsRafgAChhheNg+nR2Nu
NDxwA4yrxYxDH+yUkY2ACVJ68/qJYjLdVgQuQo9ZeHSNQZqtXhqEQFjXKGAupp3P
NB08YPOwUgNHj9vY21Hh1pleA1V6y+t2y+MVJa/BdVFMD80j0tm9dsY3ddxwIOiT
gXpLIBVJIETg01auOXA21zmqzHWJeAajBXP26Qs3NOwrgc1pm8+hxDN5zE1bUDdu
2HRTlOASRe3tyLtKE1lG9ooEgnMvVzQ9Jlxu36nUM9cxEu8ySONMXQofxylp2rNM
YZrP/e0f/QJtySGUg7deK7eH5wveXvcalMHLbgYEcrjxlqgGYNkc+3MV+1YdIfAR
uG2Dl0tqfSagbLM69I3p8UG4DppH9U+sIT/sss1IbaCeXSKLeGmDh+6x8pMgYhrL
40lGOnREYU8VcBcWZJiRDe1vYOpTBT5ujQkb9KhGxFl3UaVr9u7NPcEOkEJ1qJ6E
L15rjoJPy9XyWEPiw16rxhj/sOQyZVvVEKjanL5VlFfrbpb8SNIojiRnuou5wfzi
b5aVp2RaXnkOIOnLkvcUjTbmI5ggmCzJuV6cdQUtJVHrNGDR348WkLcsCD87ORM7
3LZqzbWSnoEKnSyFlk0bvRatyTGDmxJf1AmH3zy7mDB31ETHY+s=
=Wqy9
-----END PGP SIGNATURE-----

--usfe2x3hrwjkocru--

