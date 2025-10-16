Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A80CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1rZiVWM7zYa7/iOhEFyo6sQl/kIYT8q4flK3hRKByc=; b=y1PEzVvVEToonBrwNJ6zY+O82m
	AMUZxHhj9M/+gafdhowosK0UPLuOg+ZUZ0wZSczDT5L5pdUEyiQ05+4QKx6Pwcy5fV7g+WNbtQc5p
	hWrf+S5R3OIbtYqSg7uyp5X3TMEzsfXnwmt95nftWmBGbZ140mgiJDYpr4DEaX2sKzGZ8S/gcGjGD
	nEtGkOPzAzFgmjCovbBUTf1MvA0nmg2ZB1mGY3XKpYk4QtK+pPt+IY5hphmNb77dRWgppSd1KRwTV
	lhkqujqe0fQowCyKza9YW7gEL90Vr6QRw5smAnhu8hzIl6mA/oWCCPlSfXKg4FF1jxurJ8hq8YLQp
	5QUmS+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JbL-000000041TJ-2ecO;
	Thu, 16 Oct 2025 08:44:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JbI-000000041QI-1ory
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:44:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51EEE1A140D;
	Thu, 16 Oct 2025 08:44:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24AAB6062C;
	Thu, 16 Oct 2025 08:44:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56753102F22F1;
	Thu, 16 Oct 2025 10:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N1rZiVWM7zYa7/iOhEFyo6sQl/kIYT8q4flK3hRKByc=;
	b=HQmM4yprZlilGcaiSB4/XWd0S51BJtvXC4417lCtZL2fcCLWXoIicfoDQFC7COdyPP0d8U
	sGUm6edEWmgUf3OBpeISB1P1kDAcotG5N0Jnq++reD2L0FyKrqycTTjt7b6aq6DJZRCcC4
	MYkWwgL8NAqOE61PQINi3sOG5Jx56yvzF2AXr0go6QOjuzk3OANIeriItOuNTML1TK13Za
	48NEqBqW1wlUbAloKzagYwDULgmqA4Urj/6Uv7VdtM+yoH7C0DSsGkKrZJsfOhog3uYzRV
	Kolrc5ZfmqkyT8TOXZll5Fe9p88LnOa+7QdJNsG69DX1P3mVF/jiMY1id8+JJw==
Date: Thu, 16 Oct 2025 10:44:34 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: ethtool: tsconfig: Re-configure
 hwtstamp upon provider change
Message-ID: <20251016104338.6677e807@kmaincent-XPS-13-7390>
In-Reply-To: <731e8fa7-465b-4470-9036-c59fea602c07@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
	<20251015102725.1297985-4-maxime.chevallier@bootlin.com>
	<20251015144526.23e55ee0@kmaincent-XPS-13-7390>
	<731e8fa7-465b-4470-9036-c59fea602c07@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_014444_603971_68914465 
X-CRM114-Status: GOOD (  25.78  )
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

On Thu, 16 Oct 2025 10:01:53 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi K=C3=B6ry,
>=20
> On 15/10/2025 14:45, Kory Maincent wrote:
> > On Wed, 15 Oct 2025 12:27:23 +0200
> > Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> >  =20
> >> When a hwprov timestamping source is changed, but without updating the
> >> timestamping parameters, we may want to reconfigure the timestamping
> >> source to enable the new provider.
> >>
> >> This is especially important if the same HW unit implements 2 provider=
s,
> >> a precise and an approx one. In this case, we need to make sure we call
> >> the hwtstamp_set operation for the newly selected provider. =20
> >=20
> > This is a design choice.
> > Do we want to preserve the hwtstamp config if only the hwtstamp source =
is
> > changed from ethtool?
> > If we want to configure the new source to the old source config we will=
 also
> > need to remove this condition:
> > https://elixir.bootlin.com/linux/v6.17.1/source/net/ethtool/tsconfig.c#=
L339
> > =20
>=20
> What I get from the ethtool output is that the ts config is per-source.
> Re-applying the old config to the new source may not work if the new one
> doesn't have the same capabilities.
>=20
> >=20
> > I do not really have a strong opinion on this, let's discuss which beha=
vior
> > we prefer. =20
>=20
> Well if we want to support different timestamp providers provided by the =
same
> HW block (same MAC or even same PHY), then we need a way to notify the
> provider when the timestamp provider gets selected and unselected.
>=20
> Otherwise there's no way for the provider to know it has been re-enabled,
> unless we perform a config change at the same time.

Oh right, indeed, we need a call to ndo_hwtstamp_set to tell the provider to
change the qualifier configured. I missed that.
This could even be a fix but as it is used nowhere it won't fix anything.

Acked-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

