Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2B2CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32nDqmBKVToC5XZjIn+9lDUzqkxmv73uD6jiIMAifEE=; b=x86g5bdzC5gFMZVni3d8K+qL82
	45DC0YLBkFO7PhxOEV+AbV2j4tv1MOj9w3BOfBCxik+vsMlE66f/2AeCA6oOj977l4L5oeAjoT7g3
	0IA5X+HfOsWpqCjSgfycM1W0UwAWf0cSiFNSVXYEPv2dz72Um7vXpx++pf96XtR2TCYPbUnTOB4Sp
	MrOVzAj61QAd7x0XMgZf+BuuDhbB9xdfHGvntvYd7/2E9f5pwgvAFzqf7YmN8XiOhOn3thLLi9wYt
	cDXbTvTryrgiYFuqmGrahY2H91iD8xUTh0H7xKtuk94peHvQTaW9LAlcTnk/1ipIudFn3fZKcbWBq
	dwg+KrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEse8-00000006SJI-0Eq9;
	Fri, 31 Oct 2025 17:10:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEse4-00000006SIs-1keQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:10:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9FF194E41442;
	Fri, 31 Oct 2025 17:10:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7654F60704;
	Fri, 31 Oct 2025 17:10:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05DB11181808E;
	Fri, 31 Oct 2025 18:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761930633; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=32nDqmBKVToC5XZjIn+9lDUzqkxmv73uD6jiIMAifEE=;
	b=q7UtPrSCEVe6YTolk8YtAHps+syWlcEE0fjbjfAyImsanNTBjJxJD/Ms2oq8lWLMVZrw7g
	7yt4hRbZmehfTnKvbu1Rta39jM60Re2ZQ32GJsLP3am7E7c1Vnee0VwRbxarZBXt0DAjow
	++gVUsNRZQRdvR/aeTV6mtkR3WYxFOVb3VpE3pRAEM3LOloWWKq40/34tyboDHshRh7xwE
	x1UNZjFZwszaUw+TlYXLvldTPJlyQoSteV+CrZIGEBwm5NPBO95cTcx3EMZ1D4AEuDr5vf
	T3uTIrtStrR63KhTj3kV8kS4iKEgYix8kDKJGAoR0Doq+7ZopMHgKMAVmdPsJQ==
Date: Fri, 31 Oct 2025 18:10:27 +0100
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
Message-ID: <20251031181027.1313b51d@kmaincent-XPS-13-7390>
In-Reply-To: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101036_590284_9B1A7A23 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, 31 Oct 2025 00:46:00 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

> This patchset converts the rest of ethernet drivers to use ndo callbacks
> instead ioctl to configure and report time stamping. The drivers in part
> 3 originally implemented only SIOCSHWTSTAMP command, but converted to
> also provide configuration back to users.

For these 3 patches, maybe it is better to split them in two to separate the
NDO conversion from the hwtstamp_get support. I will let Jakub with the fin=
al
word on this.

> Vadim Fedorenko (7):
>   bnx2x: convert to use ndo_hwtstamp callbacks
>   net: liquidio: convert to use ndo_hwtstamp callbacks
>   net: liquidio_vf: convert to use ndo_hwtstamp callbacks
>   net: octeon: mgmt: convert to use ndo_hwtstamp callbacks
>   net: thunderx: convert to use ndo_hwtstamp callbacks
>   net: pch_gbe: convert to use ndo_hwtstamp callbacks
>   qede: convert to use ndo_hwtstamp callbacks
>=20
>  .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  | 53 +++++++++-------
>  .../net/ethernet/cavium/liquidio/lio_main.c   | 50 ++++++---------
>  .../ethernet/cavium/liquidio/lio_vf_main.c    | 48 ++++++--------
>  .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 62 ++++++++++---------
>  .../net/ethernet/cavium/thunder/nicvf_main.c  | 45 ++++++++------
>  .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  | 40 +++++++-----
>  drivers/net/ethernet/qlogic/qede/qede_main.c  | 22 +------
>  drivers/net/ethernet/qlogic/qede/qede_ptp.c   | 47 +++++++++-----
>  drivers/net/ethernet/qlogic/qede/qede_ptp.h   |  6 +-
>  9 files changed, 191 insertions(+), 182 deletions(-)
>=20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

