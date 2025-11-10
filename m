Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17305CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALoc2laiN9Lk6R0K4xYu3wzinSET35u6DU0A5m1a1FU=; b=jzl4U3vnf6P8brSGhgdl0XhjPf
	AYXhb4II1AfdNZK30xsc2K32+HU3CtUbGxqLFshwXbyeq+IdE+OdRrAV77ZX9S/Ll58pveKK3v27D
	I2Rl+sDbbZuw0MJ0NM8jFusnA9o1E75c5vdSl/3gUi0VR+Ink66ThzmZ43K55aU8OS/BDRbm20q64
	cPvfv7U8nc7+zqSfkZlsgrNqhAQlPDNWUp7R+Kjib5eyfatAVKddbogJhjYEh0qYdZmErt1iRcCZV
	O5kgbuaADEw9KgkufJZvc/Ny9E8rm0WByYqehIlEJUnkIdROGDOV/J+O5HvNzzaRsz6x9dOBKnTqe
	V+cVhPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMoH-00000004vp0-0bsj;
	Mon, 10 Nov 2025 07:59:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMoE-00000004voT-3AqF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 07:59:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIMo5-0002z5-K6; Mon, 10 Nov 2025 08:59:21 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIMo5-007z6v-0Z;
	Mon, 10 Nov 2025 08:59:21 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIMo5-000000002t2-0Q1m;
	Mon, 10 Nov 2025 08:59:21 +0100
Message-ID: <6689aeb46b3aad11dca9e82d912d8f3d315fb8c1.camel@pengutronix.de>
Subject: Re: [PATCH 6/6] media: staging: media: imx6-mipi-csi2: use
 devm_platform_ioremap_resource() simplify code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Date: Mon, 10 Nov 2025 08:59:21 +0100
In-Reply-To: <20251107-stage-csi2-cleanup-v1-6-5d42535243ac@nxp.com>
References: <20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com>
	 <20251107-stage-csi2-cleanup-v1-6-5d42535243ac@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_235930_797569_2AB66CC7 
X-CRM114-Status: UNSURE (   6.19  )
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

On Fr, 2025-11-07 at 15:44 -0500, Frank Li wrote:
> Use devm_platform_ioremap_resource() simplify code. No functional change.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

