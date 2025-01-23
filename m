Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF6EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLUfkUuRz3nRthcoDnA3/VSyQ9KzaT4t1CIzkWnxXYw=; b=z26ZscsY8qiA+oiVn+HYG7OS/R
	1uI+ET4YtIj2CnomQcbe8a4Q46dN5uTv5Whp6TkFwGpAAIkuRwAKvoYIdJ6iBRVGRxMfA+L2egxh0
	AHdiFWQgPeOeSAhPElSNtVNXxNa6rNxGnaRjsiPAhdzbL2+dcAktTzg126FsTyP2VGAWstu67fwzk
	zah0FudT5gRWKIPGs95wGJIA1xDEJzmEgc0yzYx96RaCRKxJIxIpa9mkfnAQLjbuuNs6tKHUGEYaK
	oOK1tpSwR0JL/SDRcLoH3/4f2Bf3y+nRozfiJf5I1q4oNqNQYnRhyw/5579oUtM+uwJQVfBXHnw1e
	JFGhiyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauhL-0000000CFEj-2eV8;
	Thu, 23 Jan 2025 10:44:31 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taug3-0000000CF2O-33OR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:43:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66FDF1C000E;
	Thu, 23 Jan 2025 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737628989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLUfkUuRz3nRthcoDnA3/VSyQ9KzaT4t1CIzkWnxXYw=;
	b=OKTZ0eXBaLQy6Rq432EqyJslmMw2hRhB07qvB1bN8W0Wt0CRMzqS8GwtweDXvvZKWvgy31
	RTizLkQ9+JGW+tIGMkPWbTR0wU7ipdRR8npWIto6KFI/jJMLqEbUvqWJQMNLs+sFs0cc5d
	f90N+nLimTcYUf587XRFHQ74p7RDhNQGnc5WxLIHxnOC0BjxgWNxn90abQEhgzx3I2T7Pt
	XmYs7N5XEmhrXhLgfergYerdeNv0fzPZnbUmFw4qkVV2Cgg5KmeWDT3asDSsOqGPXux1Gg
	MEvgJbD5Rf64zTj+4MHWbAim+8U1jSLCoFjoaLCOLZ+U/NqeC6y3aDxCrEwO5g==
Date: Thu, 23 Jan 2025 11:43:06 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH net-next RFC v2 0/6] net: phy: Introduce a port
 representation
Message-ID: <20250123114306.5c2f767e@kmaincent-XPS-13-7390>
In-Reply-To: <20250123113121.1d151582@kmaincent-XPS-13-7390>
References: <20250122174252.82730-1-maxime.chevallier@bootlin.com>
	<20250123113121.1d151582@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_024311_899279_9BF64CA3 
X-CRM114-Status: GOOD (  21.82  )
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

On Thu, 23 Jan 2025 11:31:21 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Wed, 22 Jan 2025 18:42:45 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
>=20
> > Hello everyone,
> >=20
> > This is a second RFC for the introduction of a front-facing interfaces
> > for ethernet devices.
> >=20
> > The firts RFC[1] already got some reviews, focusing on the DT part of
> > that work. To better lay the ground for further discussions, this second
> > round includes a binding :)
> >=20
> > Oleksij suggested some further possibilities for improving this binding,
> > as we could consider describing connectors in great details for
> > crossover detection, PoE ping mappings, etc. However, as this is
> > preliminary work, the included binding is still quite simple but can
> > certainly be extended.
> >=20
> > This RFC V2 doesn't bring much compared to V1 :
> >  - A binding was introduced
> >  - A warning has been fixed in the dp83822 patch
> >  - The "lanes" property has been made optional =20
>=20
> Small question, I know you want to begin with something simple but would =
it be
> possible to consider how to support the port representation in NIT and
> switch drivers? Maybe it is out of your scope but it would be nice if you
> consider how NIT and switches can support it in your development.

s/NIT/NIC/

Sorry.
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

