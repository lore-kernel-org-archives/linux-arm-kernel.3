Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC438CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tT4v4FkMCSqc8eIjKGkwR/LzsSL+UJ+pvOmTnRK1rzo=; b=enMVAK8VCBOe70H5ACROFfXdee
	Umc1D+F8Hmgzw51cc4/wrJKRGJGTddJpzvEaH9shL0VYfbIhxEVHmELm/KBlnkqPuz2dzqr1PgaTg
	2DrV6C4YGqeDxqltsvBYgV997IKLYrf79UVeEPiJkQOotUytkaXjso99gFshAcDywdEkM+RMNy8FY
	C0Wg5fLTPULPwo0Pvh6X1j0c+DzjXGwO3b6Jx5O8ch1FQuD9chc+pKmINE/8BrS2skukmnPw79NMp
	f0G4MeaMCEtug1QiihoYi7hyeSZaQTpYDmNWUUSULPQVZoBMcavjnS9oO0DRBLylVt1MQuh483cP9
	1vVrSnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt8f-00000006YxN-03v9;
	Fri, 31 Oct 2025 17:42:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt8Q-00000006Yvz-3rXF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:42:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 843F01A17C2;
	Fri, 31 Oct 2025 17:41:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 450B260704;
	Fri, 31 Oct 2025 17:41:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0F1811818007;
	Fri, 31 Oct 2025 18:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761932515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tT4v4FkMCSqc8eIjKGkwR/LzsSL+UJ+pvOmTnRK1rzo=;
	b=iGAYTjASZ6Bzyqi89mDzhDwqlw52gD0eSh7eI1MPz0n+KP8IOzsuftv1EPHRorb4yUQo8/
	NdXDk9TJ0KBKvau0AEbTz7gTd4swB6JXJtm4r3qHcA2UAMJYj37msJuOiFkCmDvitKPIck
	vrID7tm0SLwMo/+Z71rRdVWNugYamW/D4EYlC93JwBw23+84M96R0PMGzohN4tZsQrNJso
	EkC4quSXFd3Ns9BhgGAMjg0Y1zm/3G31kQDQEAOIxR9/r42vzdfo9WGJifjqO6bhQ338mn
	iAv/kMlFPrnvczaO3VFeEuGrqFp2MoZrgdRh1NQ59jMCR+T1LDwUh3ZZQXlzNQ==
Date: Fri, 31 Oct 2025 18:41:48 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Marco Crivellari <marco.crivellari@suse.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] convert drivers to use ndo_hwtstamp
 callbacks part 3
Message-ID: <20251031184148.1417ac8a@kmaincent-XPS-13-7390>
In-Reply-To: <20251031181027.1313b51d@kmaincent-XPS-13-7390>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031181027.1313b51d@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_104200_098369_E5ADA57B 
X-CRM114-Status: GOOD (  11.21  )
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

On Fri, 31 Oct 2025 18:10:27 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Fri, 31 Oct 2025 00:46:00 +0000
> Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:
>=20
> > This patchset converts the rest of ethernet drivers to use ndo callbacks
> > instead ioctl to configure and report time stamping. The drivers in part
> > 3 originally implemented only SIOCSHWTSTAMP command, but converted to
> > also provide configuration back to users. =20
>=20
> For these 3 patches, maybe it is better to split them in two to separate =
the
> NDO conversion from the hwtstamp_get support. I will let Jakub with the f=
inal
> word on this.

After a review, I found out that the patches are quite straightforward, so =
it
is ok to not split them.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

