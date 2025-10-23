Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CC9CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyGq63ZvKspF1jw8uQGnqd963nP/bOUmb/fJ7CbY46Y=; b=Tr8TaF6SyzvhWgorf07tb2S6ak
	zZpQ5f1ze0crLeQMMGJ5xHngkAGRDdHSbWLSORGaUZVhaZGnTKRLUjpVzdpO6ZS+4jHLHMzESwZzM
	eV5ly4EBQn5ZkZPD0ALfWE7AViWgIF7Lu8j2Jhjeml24XhfkUW9kBXbVvuxYLrj9YDbDOtrWaaYag
	mj4p0svk+1NQqggzaPNjfrufPN25PvnBSPR3wS2g/2uvlUHfUU163L4q0Isnc91KLb/bj36m51O3m
	bqN6K2PwN2e92+ZTQjBzW6hG1632bQhfBJ9pk8Acwx7JddzVujkyk3KZ7ZGnsVDzO0izKjxB9npOD
	gBapjOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqnS-00000005ZQG-1LRu;
	Thu, 23 Oct 2025 08:35:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqnP-00000005ZPP-0Bif
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:35:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65E3BC0C407;
	Thu, 23 Oct 2025 08:35:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B4AF6062C;
	Thu, 23 Oct 2025 08:35:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82B43102F245F;
	Thu, 23 Oct 2025 10:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761208536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QyGq63ZvKspF1jw8uQGnqd963nP/bOUmb/fJ7CbY46Y=;
	b=hsZGITRrOYENYpvBAgl3pGETE+fYzC2CXnRYmMu5tzsNzIIdh1durFekdpZoOLwmfZV8a3
	F1ObWl6rZsxBZpe3WlDU/n6qsDAJGKsFSoaR1gGM9y85lcmCciEX5VpU0H0sUHPOieunKi
	eTO4BYHcjWuXhpc4A9u/Tx909YQk9wb3EKtLvS3EwMu0HxB74XxT/8fdj5RfVqe53JAe+h
	P3cnSol+/+vo0Xy5X/l1lp4oECkwYZ+pCAKNGFLj5FyC28ldLCueb/9DoEaY0VCm6q/tJ+
	9SLL/UDj0DChR20mjFxyJAzD6Zb3eJJ76wFDo3J9vEhKh2e+9sbbvu+mZ9QSJw==
Date: Thu, 23 Oct 2025 10:35:28 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
Message-ID: <20251023103528.0c969be8@kmaincent-XPS-13-7390>
In-Reply-To: <ac505a82-1a01-4c1d-8f9b-826133a07ecf@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
	<20251015102725.1297985-3-maxime.chevallier@bootlin.com>
	<20251017182358.42f76387@kernel.org>
	<d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
	<20251020180309.5e283d90@kernel.org>
	<911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
	<20251021160221.4021a302@kernel.org>
	<ac505a82-1a01-4c1d-8f9b-826133a07ecf@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_013543_292280_0928AA2D 
X-CRM114-Status: GOOD (  16.76  )
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

On Thu, 23 Oct 2025 10:29:26 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> On 22/10/2025 01:02, Jakub Kicinski wrote:
> > On Tue, 21 Oct 2025 10:02:01 +0200 Maxime Chevallier wrote: =20
> >> Let me know if you need more clarifications on this =20
> >=20
> > The explanation was excellent, thank you. I wonder why it's designed
> > in such an odd way, instead of just having current_time with some
> > extra/fractional bits not visible in the timestamp. Sigh.
> >=20
> > In any case, I don't feel strongly but it definitely seems to me like
> > the crucial distinction here is not the precision of the timestamp but
> > whether the user intends to dial the frequency. =20
>=20
> Yes indeed. I don't have a clear view on wether this is something unique
> to stmmac or if this is common enough to justify using the tsconfig API.
>=20
> As we discuss this, I would tend to think devlink is the way, as this
> all boils down to how this particular HW works. Moreover, if we use a
> dedicated hwprov qualifier, where do we make it sit in the current
> hierarchy (precise > approx) that's used for the TS source selection ?

That's ok to me. I was not strongly against devlink in either way, and I di=
dn't
have real arguments. Let's go for devlink, we still can move it to tsconfig=
 API
later if it's needed.=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

