Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C9FCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA2EXYJYCNN2s2fDBflhY/TwvwPeAThnGXq65LNlvwY=; b=aZJAjTryS0oyW3qSQ+ur/qJqqM
	/K1zcI4E7F+f/3JlCyqeg5SdDoW5MsZC3RotmJo6XzOcie13Q+wCNR9Itqi/kf6+pzjzDJ0xDjvbq
	DxSidFo0anFOPhjHOqe84iVdOmsNpgUKUvYrBrK+pVNbbCd2KEpKLWWBa+QB7zTlRez7XsNwuDr76
	lf9XWBCJCwRVI4s+QlPUODBS4BAUsqxv4OLFuKnGe0i0cz5gH829GF6hEmFku/hjiUOXMttlIknFe
	lp2sf9TywkJh07+yDdBLxMTls9vtnDJomnLznKz72DZtBcnZc2k8jxFw7NXDpBKnRWkkLIbfxxTJw
	q1KBjbQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNOx-0000000CGiz-3zxl;
	Sat, 13 Jun 2026 12:23:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNOv-0000000CGib-2ODC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 12:23:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so24121945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 05:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781353427; x=1781958227; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UA2EXYJYCNN2s2fDBflhY/TwvwPeAThnGXq65LNlvwY=;
        b=D5aLYKIEjTU9lYTeBFA0bZFLTBPHhbS9S4yR2dVfjrwrOzNweIRWmE2+npelKefNDe
         sPrSiYIEvU3ggxQ99neYTxs8vM6AevAM5LUXQLGH+bqRu1trI6xOrXIdqbQRZTZV+Wt7
         DthqLFHQoETP96giF+dOPC/BqToOumAeVd8XY49Cvqiq7qOXukuS7YFcYntC4+X9JeFf
         9ZsQqncrVB3PpGILwWQzkH80Rbb/5RH/gkK07rx/TAh2uRmow2X5AnbiC9Izib/OW3sr
         Fx2VBCD86m3q16OpAzRZqqCXwZDKAv0bDgvaJb/zdLvGeFcEuDeLik8A071hQohV93UG
         XN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781353427; x=1781958227;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UA2EXYJYCNN2s2fDBflhY/TwvwPeAThnGXq65LNlvwY=;
        b=Lj7EgO/QT6ouRaU6gTqoPtocLHqjxwYjuzJSX4aJCo54cLmgmTb17p/XGyG7925N9w
         GTNmKEqPt2lOeJRQ+vvvv39UZQueQmo+iW4ucvjdPK/al0hGaiSzsKFCczlRMqdKGt9T
         4FyNH3A8Y042y16BgTRTalz+q8YQpb/kpVgc5Zg3Nrp4itqEpOybjJ4hHebQpWILEm5h
         lXyi8Gena4x99Iz5iBw9w9345DjK+lK6K7F1WNa1y60/+fN0iL9A5KDcG+D/ZE7+VA30
         vAQ8lBvqHFTqrKJhJ2vBB5kAAun2X+81IUiniKM3hQ0xMtRw9FWbclDtik2zpNz1Q9AA
         hhMw==
X-Forwarded-Encrypted: i=1; AFNElJ83L7rA0ub1jeqph0+9GM37LLNmmxjGrLiLOCPj2wEyGFzoLO1j91Hvs/R+QyZX2lh+xRYWBUlQWnO8olrOf691@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2khGbcxbXphj551C4uDGE3gFl/4KXYvkcYnfFnBSGjnSkQQj0
	kQPTOixBTGKZt4Z9hlcMBQK0REQKnPoxwUcJsTY3Obw0IB0EVXh8EPts
X-Gm-Gg: Acq92OGUgMZkLBhvXGed78ZHLqfn8y1MLGOZsWy6KAnz5c04sGbSHfMUhdc/q7FpWNl
	fQiouHY7htq6REWqepSEgCZG0OrZcct360PTVOziaLL0ppMEzktGyqLXEgh2GWCQgUMznY9i6w/
	D1uJhLehEhkIWHlYqMCiOUqVhuviBBJdd42vN9XtIUKfASPMfeGmrzFZr7p4tBbeE3bvNMJfz1W
	UuTY9sFjhXid2PSZW1Pr2gKm9WwFAXBp9XY3mhaE9lgnsSrPRAImyr5MTz5ZFKzXLhDkUXpzYt4
	X6cogpPkn4NApBiJnAWta7SwkqzT333N6QmcuZi9Z7LMF6doWlhYpq0/quBvVNlaGodACEnJ2Lt
	Hh+P0gzLtFyQa0QeHYwkJ+wnhUI8aamn+6gotOiihUdBuXewkF12/OYKnLpH/i9NPBQT1Tv22hK
	5NQL5rPNyJtHC9d7tm3ntEDHHlgsmrU8ERML4mRoGpTcfV9hSm+tdIDgkInTjvjRgqopURnOkG3
	iRZDB4=
X-Received: by 2002:a05:600d:8446:20b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-490ec4d77afmr50099355e9.12.1781353427306;
        Sat, 13 Jun 2026 05:23:47 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b2e8esm101605395e9.0.2026.06.13.05.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:23:46 -0700 (PDT)
Message-ID: <039295d3542deda8c56151252fe5e50c88c13deb.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel
 Holland <samuel@sholland.org>,  Hans de Goede <hansg@kernel.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Andre Przywara	
 <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid	
 <lukas.schmid@netcube.li>, "J." =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.ne@posteo.net>,  Eric Biggers <ebiggers@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Luca Weiss <luca@lucaweiss.eu>,  Sven Peter
 <sven@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Date: Sat, 13 Jun 2026 14:23:46 +0200
In-Reply-To: <FE7Vh4yfTmGMM24i18Wwwg@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
	 <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
	 <b428d57ba5464f1226daf099877f4c25fa4fc191.camel@gmail.com>
	 <FE7Vh4yfTmGMM24i18Wwwg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_052349_648367_716893E0 
X-CRM114-Status: GOOD (  17.06  )
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

Hi Jernej,

On Sat, 2026-06-13 at 11:38 +0200, Jernej =C5=A0krabec wrote:
> > > > Add reserved-memory node carving out Trusted Firmware-A region span=
ning
> > > > fixed 256K from physical address 0x40000000. Even though Allwinner =
ATF
> > > > itself passes the address range in the fdt to U-Boot, U-Boot curren=
tly
> > > > only reserves this memory internally, but doesn't carve out the reg=
ion
> > > > in the fdt passed to Linux.
> > > >=20
> > > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > >=20
> > > NAK. It is job of boot procedure to properly inject TF-A reserved nod=
e.
> > > Any issue should be fixed there.
> >=20
> >=20
> > like in commit 0d17c865118881609ea7e381c7cadbb7979cc596
> > ("arm64: dts: allwinner: Add Allwinner H616 .dtsi file")
> > =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Jernej Skrabec <jernej.skrabec@=
gmail.com>
> >=20
> > ? ;-)
>=20
> I was against that too.
>=20
> It's time to be fixed in bootloader.

I agree, I was wondering about this shortcut as well... I'll implement
some sort of generic reserved memory handling in U-Boot.

--=20
Alexander Sverdlin.

