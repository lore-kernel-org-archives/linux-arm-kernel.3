Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F42C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id9QAWrDEq+9VW+VdvM9zWg5oty7LLc+t+WiZcjlSuE=; b=PFzwIcIMYvjmtyvXtqKI1qA42j
	isXFh8N6Jy7qakq/nZrs4DSLJfEGZ+JCCGCwiyfot0gOzq3Q7MhlMYhp2cGimQXbHR7/QBCThmrHj
	QwF1qBk57SAaT5p+Ts9W3NaeOWa5lNi4o+wQSdsWmg8zUoYBrEDysSbk/EyoVrF/YBNMVPqCZA/Mq
	ntNR3pCcEFT4NIw8i33+xUWaJ4GY0me2mk2XzcNiqKnGk8c1GU4jwHWpFawLgp+Toc96QaLi024m8
	hpDtcfjlQrWDmi4+dj9Sr68o+gCJstKOSoKyL31plY1QqUINo7DAIQwIsHKiZrDX4eSBaXZh3O3eS
	tdkfeOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Azw-00000004eQE-1dBQ;
	Tue, 08 Apr 2025 15:36:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ax5-00000004dk9-22FD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB91E614FE;
	Tue,  8 Apr 2025 15:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF28EC4CEE9;
	Tue,  8 Apr 2025 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126406;
	bh=jTDbRpm/2plpGWyuZcgnOrksZvCKonLIj49TrwkLGMg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gIUnuqwmDKh1UdrcyGo5h8XkMiMGPrHjGP2Cmlp/98SG+JZqvfK3OyBJ+YaEE/Dw5
	 H6pY6EMPjEV6BhiE9oYP/y9FYAJYJMr9WztK+fOVQIp5YV7we+jfWPW1khCxcwglQg
	 xakHA48v1mIq6Fp8b1O39NyWxaTPUGkG6DN+U4mttyqTh1f/kLJSXedWGRbJ4/sVpX
	 NVgkHtZMImN2NAh4mD3IfY/HwQwNeu73yMxcVR5K77AWicjVlISZoq3O2gwIAwPC9L
	 KyUa3uiK/aqdj6hw7DeoXSa6j6ktcUkt8aXr4kggFWZjUtLWWN0oUJLCSktQwPDDgn
	 qX2hYtprje98g==
Date: Tue, 8 Apr 2025 08:33:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, upstream@airoha.com, Christian Marangi
 <ansuelsmth@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Clark Wang <xiaoning.wang@nxp.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Joyce Ooi
 <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Madalin
 Bucur <madalin.bucur@nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, Rob Herring <robh+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next PATCH v2 00/14] Add PCS core support
Message-ID: <20250408083324.3996c141@kernel.org>
In-Reply-To: <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
	<20250408075047.69d031a9@kernel.org>
	<08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 8 Apr 2025 11:30:43 -0400 Sean Anderson wrote:
> > These appear to break the build:
> >=20
> > drivers/acpi/property.c:1669:39: error: initialization of =E2=80=98int =
(*)(const struct fwnode_handle *, const char *, const char *, int,  unsigne=
d int,  struct fwnode_reference_args *)=E2=80=99 from incompatible pointer =
type =E2=80=98int (*)(const struct fwnode_handle *, const char *, const cha=
r *, unsigned int,  unsigned int,  struct fwnode_reference_args *)=E2=80=99=
 [-Wincompatible-pointer-types]
> >  1669 |                 .get_reference_args =3D acpi_fwnode_get_referen=
ce_args,   \
> >=20
> > Could you post as RFC until we can actually merge this? I'm worried=20
> > some sleep deprived maintainer may miss the note in the cover letter
> > and just apply it all to net-next.. =20
>=20
> I would really like to keep RFC off the titles since some reviewers don't
> pay attention to RFC series.
>=20
> Would [DO NOT MERGE] in the subject be OK?

That works too.

