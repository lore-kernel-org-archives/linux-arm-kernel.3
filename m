Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040C0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5caVZp2RKj5e9PtRJRR2Igrrw0XHy8+/KikIA1QUbw=; b=1jevL5mMkQxPplwfgErS+2+ffA
	1lw3aJdIUskicHbqri8ux+Foz55C1sjLZw5UOmsnamSK78WnJ7BDYPwHNzwhpIqL7si0RWgQog9se
	dbI+bQn/QkjYXQr/zqfhw4lVtTlfVhoOKFKN5lmotUBGdGFCQV0DV3RzQF0F9Wm3e5QhoEI9zlYAL
	hqAGDKX4YyfzyXq+pM8RDUR8vdshiLgvVqxjkhG6h81Hm4buYlucm73HZshvHZV/ArJs106iXBlZB
	Pf9jqkkZwv/DEsb1dwJZrv8xwBnjz3rmgG3RpggBQauAjYVIk/A97A0iphaI8I6fplBZ5ZFpL8+tE
	hXQ5M7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7dO-0000000EhIL-0rL1;
	Fri, 14 Mar 2025 16:11:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7XE-0000000EfZq-2koT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:05:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt7X3-0003ae-7S; Fri, 14 Mar 2025 17:05:09 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt7X2-005jEa-2G;
	Fri, 14 Mar 2025 17:05:08 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt7X2-0009KL-21;
	Fri, 14 Mar 2025 17:05:08 +0100
Message-ID: <9bd42362c798cc3339ab9b34b32a9eb7eb4d1ba7.camel@pengutronix.de>
Subject: Re: [PATCH] reset: imx: fix incorrect module device table
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
	Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 14 Mar 2025 17:05:08 +0100
In-Reply-To: <20250314153541.3555813-1-arnd@kernel.org>
References: <20250314153541.3555813-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_090520_694517_93A6BFC4 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

On Fr, 2025-03-14 at 16:35 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The ID table is for of_device_id, not platform_device_id:
>=20
> ERROR: modpost: drivers/reset/reset-imx-scu: type mismatch between imx_sc=
u_reset_ids[] and MODULE_DEVICE_TABLE(platform, ...)
>=20
> Fixes: 6b64fde5c183 ("reset: imx: Add SCU reset driver for i.MX8QXP and i=
.MX8QM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to reset/next, thanks!

[1/1] reset: imx: fix incorrect module device table
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dc361baf67200

regards
Philipp

