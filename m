Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F84CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iq9Qs7TAm7VWsOF3Jc9Pi05pYb5NqTrkfRimiYCw2Ew=; b=TuO5wd8I9AXphsXktrFnQ4XbOt
	PGwHJxS7FM6C43lErbXwI/plKbZOiIfSOX5VKnvnSl1wrAOiTm53CyZTTLPwA/13/rv+Wax6z0a3+
	trJlgQtSfpBhb3jnFByjOwJBDyie7UKSI2l/Ay79+hHiFHEUmJZBPd0WbKl5W6+NDVDVvBmAtvPNO
	w2rNO7r79jwPHjmqgnKd2IgWt8x0juDnCESPHDWoeUZNDiLakmftbLfX6dvbUOXWmQLcIcICUL7sP
	yRyxhqmoxVtfuk/Fm3NEi84BecXdy+BdeSGAVe59ia/QUZUTz5/AkStjzKzIpI46oCt94PyeKg4nE
	AUp7jpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEslf-00000006T83-1Bu6;
	Fri, 31 Oct 2025 17:18:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEslb-00000006T7g-34Fs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:18:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8AC21A17C0;
	Fri, 31 Oct 2025 17:18:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCB9060704;
	Fri, 31 Oct 2025 17:18:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A87DF1181808E;
	Fri, 31 Oct 2025 18:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Iq9Qs7TAm7VWsOF3Jc9Pi05pYb5NqTrkfRimiYCw2Ew=;
	b=jXuFGPjnDWDwM2IKJ0l6cHSjokcmevow6/3uNexN76zTdrpwF4bajZ/zt2hXIeDhg2J4VE
	FwEwPwp4e2DIM0eo+TpbbUv3+ipY7pfHhwY1r47H5cSkqNn5ADDiqU99JF66oHyxROzHFM
	TH2fIzbDSAsm5ffk1AQZEOJCp2FzeMTdBpLTY3t+XpQ7xG/TS3RpoY0w5P0G6Tl44naMyj
	WzlzlfiC8f4jB4HKG171sHab049fzjSav3Bb2RBKXMJVkhxee8iwl17aUfxd8mx2uQsQYf
	KyBCrdvPybUE1Hz7N6Pn1MS0pkrdGDNBtwY+5uUwDLosplsWY70avI4/qsyvOA==
Date: Fri, 31 Oct 2025 18:18:17 +0100
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
Subject: Re: [PATCH net-next 4/7] net: octeon: mgmt: convert to use
 ndo_hwtstamp callbacks
Message-ID: <20251031181817.47cdcc3b@kmaincent-XPS-13-7390>
In-Reply-To: <20251031181653.2832b992@kmaincent-XPS-13-7390>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031004607.1983544-5-vadim.fedorenko@linux.dev>
	<20251031181653.2832b992@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_101824_173733_B5244DBD 
X-CRM114-Status: GOOD (  10.44  )
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

On Fri, 31 Oct 2025 18:16:53 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Fri, 31 Oct 2025 00:46:04 +0000
> Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:
>=20
> > The driver implemented SIOCSHWTSTAMP ioctl command only. But it stores
> > timestamping configuration, so it is possible to report it to users.
> > Implement both ndo_hwtstamp_set and ndo_hwtstamp_get callbacks. After
> > this the ndo_eth_ioctl effectively becomes phy_do_ioctl - adjust
> > callback accrodingly. =20

nitpick if there is a v2: "accordingly"

> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
>=20
> Thank you!



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

