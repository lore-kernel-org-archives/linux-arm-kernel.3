Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021C6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 22:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fV5e/unfpOyTP78WuJI+lL4T0kp1x8P3iyxboyk8CI=; b=wjLIJbob3PCt4zSOYY3zOnlCIt
	SL3fjr0XNRStur6TxHtRbfJe5TapAKwCHVVg/3MnpzYzBh/E1H6XcoJsSWuXl8wn1NjrJibzNpmRh
	ToMAIzEluHcXlunJXF1mtkRU+QI9i/Ff69ija0qeyOCIolQFg7FIqszcJUAf6YZFdrWf1QrOZ73s7
	oscEe6Ry8xt59hU+HiheekPcubtJr/3vFdaOgNN24E4ad4BdSLeNMz9rgfZWCvuGAk80+Jg6JzngS
	svYiVpUnlMRymASbu6azitpCxLxiksWUJb0Wp3mwDmhfUNQKQyDcUHHsbTESRKxjTNRNrh3k7SYyr
	ygXTQ6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNK0Z-0000000BbNI-3Ugm;
	Mon, 16 Dec 2024 22:56:11 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJzU-0000000BbCC-06dk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 22:55:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06679C0003;
	Mon, 16 Dec 2024 22:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734389699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fV5e/unfpOyTP78WuJI+lL4T0kp1x8P3iyxboyk8CI=;
	b=M7K7dG9hNs144lbC4tFE4v5qP0Sk04SievkUEmEhp01weoUA2bmkioucoEY5RUlSvM5QFN
	+ASgHev+xFPZZlCCnUXzK7cKR5nO0ugim6AR3b2Yzj2qnZjrfsKUW6y2rWqhA1eIwthBQS
	oXJTxJr/I1QKeAo7lNP0KXBLoQX3n4ndPvL7MBzxrV7uLTztX62wMrkQAP3O+UdutINxP7
	XlLoDTgDB0m/o/Sv5dpMX61MxymAICC9XTD1Qj4OsmLKI/DpVLnWiYRXti8ovnb3ksQsn4
	rGGH62V4k5s4+PSQDfqiYWF50+cKZldlS6nAZKYmQ1ofvMlJLw//6p9VutNzUA==
Date: Mon, 16 Dec 2024 23:54:56 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, Ulf Hansson
 <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Marek
 Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, Jindong
 Yue <jindong.yue@nxp.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Paul Elder
 <paul.elder@ideasonboard.com>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>
Subject: Re: imx8m-blk-ctrl: WARNING, no release() function
Message-ID: <20241216235456.3a6b07a2@booty>
In-Reply-To: <20241212141003.GA44219@francesco-nb>
References: <20241212141003.GA44219@francesco-nb>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_145504_330700_30A80287 
X-CRM114-Status: GOOD (  10.51  )
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

Hi Francesco,

+Cc: Jindong, Benjamin, Paul (recent committers, in lack of an
imx8m-blk-ctrl.c maintainer)
+Cc: Herv=C3=A9 (stumbled on this issue too)

On Thu, 12 Dec 2024 15:10:03 +0100
Francesco Dolcini <francesco@dolcini.it> wrote:

> Hello,
> on v6.13-rc2 (PREEMPT_RT, if it matters), I have the following warning
>=20
> [    4.615793] ------------[ cut here ]------------
> [    4.615814] Device 'mediablk-mipi-csi2-1' does not have a release() fu=
nction, it is broken and must be fixed. See Documentation/core-api/kobject.=
rst.

Thanks for the report. It is happening also here after upgrading from
6.13-rc1 to 6.13-rc3.

This originates from drivers/pmdomain/imx/imx8m-blk-ctrl.c

I bisected and the initial commit exposing this warning is:

  commit b8f7bbd1f4ecff6d6277b8c454f62bb0a1c6dbe4
  Author: Ulf Hansson <ulf.hansson@linaro.org>
  Date:   Fri Nov 22 14:42:02 2024 +0100

    pmdomain: core: Add missing put_device()
   =20
    When removing a genpd we don't clean up the genpd->dev correctly. Let's=
 add
    the missing put_device() in genpd_free_data() to fix this.
   =20
    Fixes: 401ea1572de9 ("PM / Domain: Add struct device to genpd")
    Cc: stable@vger.kernel.org
    Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
    Message-ID: <20241122134207.157283-2-ulf.hansson@linaro.org>

Superficially, it looks to me like a legitimate commit which exposes a
pre-existing flaw in drivers/pmdomain/imx/imx8m-blk-ctrl.c.

I have no more info at the moment.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

