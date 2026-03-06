Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237B1F01825
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjkU15zKUhozjGz3J/xdbMrcUdCPVMhIUSb5AP+FDwI=; b=MudSne1FGHBrImfisn3itN4Tq9
	VjEwop9VoggzvCCKJJcHOd06tA+8NIqg6/4+xk4V/TgH5qLBBirpdiodw4Etznm92RDvWeoepTd0V
	cColnCCqA/iiOqnhXDqECtvcH89n2UV6DjWf3+1z2lr/z4OfW0tpIJiLUFm8Ut02XByiA9oq0NSRE
	rBu0rCZ50Q3UPhMsnqTg5Y0hAo1GUdfIW9hCFrDkpDVfH42Qr4PQcfZ7RSkFjQCq27sgaUl8GSS+R
	DDKaKZM1MItZgEEo36fo3JfcA4jYGe6fGZc+OUeqZ/qm2Cp083eTfmU8WssAH+OScreaWjqgt4Eju
	j1XzbJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySME-00000003RL0-01YW;
	Fri, 06 Mar 2026 10:24:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySMC-00000003RKf-0mTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:24:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vySLx-0005nT-6L; Fri, 06 Mar 2026 11:24:17 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vySLs-0042AW-1X;
	Fri, 06 Mar 2026 11:24:13 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vySLt-000000005Z5-36J5;
	Fri, 06 Mar 2026 11:24:13 +0100
Message-ID: <b0d5378b701254a9e5950f74577257c3a69d0868.camel@pengutronix.de>
Subject: Re: [PATCH 0/6] Remove register_restart_handler() from drivers/reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Davis <afd@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky
 Huang	 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian	 <qinjian@cqplus1.com>
Cc: openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Mar 2026 11:24:13 +0100
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_022432_224961_123C1270 
X-CRM114-Status: UNSURE (   7.80  )
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

On Mi, 2025-08-13 at 16:41 -0500, Andrew Davis wrote:
> Hello all,
>=20
> Continuing to remove users of register_restart_handler(), this series
> removes the remaining uses in the driver/reset subsystem.
>=20
> Build tested, but I don't have any of these platforms, so some
> sanity testing always welcome :)

Applied to reset/next, thanks!

[1/6] reset: ath79: Use devm_register_restart_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D59ad2fb0be75
[2/6] reset: intel: Use devm_register_restart_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D8bfef0c24389
[3/6] reset: lpc18xx: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D09f166128aea
[4/6] reset: ma35d1: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D42d03696a05d
[5/6] reset: npcm: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D71c021cd8875
[6/6] reset: sunplus: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9d93e13bf5c4

regards
Philipp

