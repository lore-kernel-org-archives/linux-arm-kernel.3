Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E43EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryJR8ktdBq0MI734DFERd+HN6dM/rEDhivzGq8U1KcE=; b=jVXjfWOgGjA5ZRLWYpn/ivdrZr
	9aUboIWYycHUPQv58YVax2gqsMKQ/EG9x0c4BicDsGAIIeYoCzUO4VwXHR86COXTdWJ0o7OsrsGu4
	sCTvAonx9MPLk79sSqPNg27mPd0BlcE5S4bBFFLcbE4xVJ/A+/I4vYYhQiHvzABVB2vT89ce76iHg
	ti4+xBxTEYmMo/CtpTw1efndO0SPwz+gAhF8Ambwpn+7cf1Cttaq0s8Fhg9XeedwEASsUMJU+6y1c
	ysS3fuwsfqkVOqKNxDxyTGCCHQoYK1+raGeDBNbC7Gb9o5sdz/qDvu+ThWSNMt1u7+TETKmU+IBWC
	GgUV3bgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tseBp-0000000AaiX-2LZE;
	Thu, 13 Mar 2025 08:45:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tse8z-0000000AaIe-2lTx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:42:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse8t-00007I-JV; Thu, 13 Mar 2025 09:42:15 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse8t-005VQP-19;
	Thu, 13 Mar 2025 09:42:15 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tse8t-0003Y4-10;
	Thu, 13 Mar 2025 09:42:15 +0100
Message-ID: <dbdbc1f6c30cba1e0e1445de09564864dfdb8b58.camel@pengutronix.de>
Subject: Re: [PATCH v4] reset: mchp: sparx5: Fix for lan966x
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, herve.codina@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 13 Mar 2025 09:42:15 +0100
In-Reply-To: <20250227105502.25125-1-horatiu.vultur@microchip.com>
References: <20250227105502.25125-1-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_014221_697233_9D2FBACF 
X-CRM114-Status: GOOD (  10.26  )
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

On Do, 2025-02-27 at 11:55 +0100, Horatiu Vultur wrote:
> With the blamed commit it seems that lan966x doesn't seem to boot
> anymore when the internal CPU is used.
> The reason seems to be the usage of the devm_of_iomap, if we replace
> this with devm_ioremap, this seems to fix the issue as we use the same
> region also for other devices.
>=20
> Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in ca=
se of LAN966x")
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Applied to reset/fixes, thanks!

[1/1] reset: mchp: sparx5: Fix for lan966x
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D0e2268f88bb2

regards
Philipp

