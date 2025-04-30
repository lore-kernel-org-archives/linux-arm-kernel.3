Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9056C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKzz4GpXNCgGIa0rzM71L1KvZojTAwW+w9ousOBD410=; b=vH2hUKR1jJDCwHCTKccyxpu7Y9
	vdHM9UXO5IW8M/0LpK07dWmeiLaGNCt3Ts4/jzlySkmXYvxWzacy+gLiR+lkYIm7PtUtMkNPJQbP4
	Pc3trMNQbUhAxTc73Jw1lD5y3yUOmWDxMYNz6EwiKGtiyRHG3t9QZR/7vHWK/SzkwPt/lZqeVBkvw
	3W+dBDh6TlIT8UqaJ42dsksXpSQlpba1vAfxROR6OaiaJO6lyrPOShv6vOSXaEPI9GPouZ6gzVT6J
	FFBlPYfh3IwSs95FTtyWB0Wt5QLIHQBxBqVt9aHz4QRYhkuZuFfpJuKeRKnApjG9+eCh3sq/aKrFa
	liP2v2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2G4-0000000C3Vm-46UO;
	Wed, 30 Apr 2025 07:53:33 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1xU-0000000C0ez-0clY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745998460; x=1777534460;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=PKzz4GpXNCgGIa0rzM71L1KvZojTAwW+w9ousOBD410=;
  b=X6XApsainSFSrfa7CNBa3D6WHHHa8OCsvRctDWDMk+ntKNajORp4TdbU
   L20R1ekNXYNnAyaTcnZUPC9FFY//AbjxeDaNtU04sOfJ8BZr3xn89+c2U
   nMYUu224/TbAGJtE35cCo0TFHXhSUoM3cLJhdowIBagNAFgXj2tdQfAVc
   mmOG0N/hJMrYVviZjSIJ4CP51t5N+us4lkKKcsxNKzScxyh4vbYoCg2FX
   emwqYfQMyG180YoRNWD95B1u4WLxdD8AvxQU8z7+QOqllOOhqpnM3MyYg
   ncuERxluCC8RqaE9vyOgW3zgJM4zmmhoFC4oBCowYxPITaQI/llZNhABY
   g==;
X-CSE-ConnectionGUID: qmb9bHPUQHiR/k58rQHINQ==
X-CSE-MsgGUID: 1V3sw6rvRYuTXG+k7tCkMg==
X-IronPort-AV: E=Sophos;i="6.15,251,1739833200"; 
   d="scan'208";a="43800249"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Apr 2025 09:34:15 +0200
X-CheckPoint: {6811D277-8-45F3AE15-E90F7DFA}
X-MAIL-CPID: D0705AEC16E75CCAA574D1B56E0DBAE6_5
X-Control-Analysis: str=0001.0A006375.6811D276.00A5,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C78C816423A;
	Wed, 30 Apr 2025 09:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745998450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKzz4GpXNCgGIa0rzM71L1KvZojTAwW+w9ousOBD410=;
	b=J9J6do0u8lEE2W16t5i5xBUE6OJvrffKuBw+MpImOunqIfiVKeYE0BF1sStqNNQvxjJODt
	UjucfkRCh+D43AMion7i5NCU+MQPz5wanjoNSfStQl3Ok8XSFJ/M1fEd7YPPhpmuI+o5VK
	O2otQKOGgN+QE0qjCOqSKM1W+XutJD/1GguHf/QohJpOMg3+eyZ2Gk199+r6r8uGkVGwn2
	c+ZFl7j8PZgRHcDKWYEtDfU6/9nMKpJeFzQ0ZV6KE0xynYuR9wF/Nkey4cftRH1LtdZG7m
	1hTvePO6pVG6DhfJomE8hfZcjS0wn/daruChpIVQVj17lP3qvyeGwmV+zoK3YA==
Message-ID: <24fab53831b359f3e3d809d22ace7572e196cdf0.camel@ew.tq-group.com>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe
 Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Tero Kristo
 <kristo@kernel.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Date: Wed, 30 Apr 2025 09:33:59 +0200
In-Reply-To: <d00838cc-5035-463b-9932-491c708dc7ac@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
	 <aAaafd8LZ3Ks-AoT@shell.armlinux.org.uk>
	 <a53b5f22-d603-4b7d-9765-a1fc8571614d@lunn.ch>
	 <aAe2NFFrcXDice2Z@shell.armlinux.org.uk>
	 <fdc02e46e4906ba92b562f8d2516901adc85659b.camel@ew.tq-group.com>
	 <9b9fc5d0-e973-4f4f-8dd5-d3896bf29093@lunn.ch>
	 <b75c6a2cf10e2acf878c38f8ca2ff46708a2c0a1.camel@ew.tq-group.com>
	 <d00838cc-5035-463b-9932-491c708dc7ac@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_003420_677116_8B39FA5B 
X-CRM114-Status: GOOD (  27.30  )
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

On Tue, 2025-04-29 at 14:08 +0200, Andrew Lunn wrote:
> On Tue, Apr 29, 2025 at 09:24:49AM +0200, Matthias Schiffer wrote:
> > On Mon, 2025-04-28 at 16:08 +0200, Andrew Lunn wrote:
> > >=20
> > > > > However, with the yaml stuff, if that is basically becoming "DT
> > > > > specification" then it needs to be clearly defined what each valu=
e
> > > > > actually means for the system, and not this vague airy-fairy thin=
g
> > > > > we have now.
> > >=20
> > > =20
> > > > I agree with Russell that it seems preferable to make it unambiguou=
s whether
> > > > delays are added on the MAC or PHY side, in particular for fine-tun=
ing. If
> > > > anything is left to the implementation, we should make the range of=
 acceptable
> > > > driver behavior very clear in the documentation.
> > >=20
> > > I think we should try the "Informative" route first, see what the DT
> > > Maintainers think when we describe in detail how Linux interprets
> > > these values.
> >=20
> > Oh, we should not be Linux-specific. We should describe in detail how *=
any OS*
> > must interpret values.
>=20
> There is two things here. One is related to delays on the PCB. Those
> are OS agnostic and clearly you are describing hardware. But once you
> get to implementing the delay in the MAC or the PHY, it is policy if
> the PHY does it, or the MAC does it. Different OSes can have different
> policy. We cannot force other OSes to do the same as Linux.

If we want to support fine-tuning properties and other driver-specific
attributes that rely on the specific delay mode used on the MAC or PHY side=
, we
must make this policy a part of the binding docs.

Also, we make decisions how DT bindings work in Linux all the time, and oth=
er OS
must implement them in the same way to be compatible with Device Trees usin=
g
these bindings. I don't see how in this case we suddenly can't make such a
decision.

> =20
> I drafted some text last night. I need to review it because i often
> make typos, and then i will post it.

Thanks, I'll give it a read later.

Best,
Matthias

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

