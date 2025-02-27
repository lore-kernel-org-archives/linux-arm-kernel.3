Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270DAC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZpBvNTiF72CoGtzoTsdS/QN/xhPzaQrjim5IiJgJWc=; b=BObK1GrvzzjtmC/D80BfvGASyu
	7KTeah2Ba9IJlsq8KQ6YWJpqMz+1xqs2oD/sZZwU60GlkhyKZ9hVLSl8WLxB5KhyLVew41XUwe3Mp
	SUI2LYoZA6pDKPKVQt4aSwNO1a7smxPaEVuQPaiMjcOgNJhLG5c5Y0paeXxMlOMUXEyfzwAxS/8+7
	XCrQxH4XHA4M6aJnrHQQfFc6RtNXBf+mMtlOcmvA1FTIcM97Y8eLYMaDKuoGGRv2Oaa0GOsOYyH76
	qM2UQoZiD8uynrhUdck29DU0oPVZ4l0ZV1mFDFvu7edSAtTYOeD8o7AqlFRLduLWTLMdWwAqM6Srw
	mXKjtlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbnK-00000007746-2Q92;
	Thu, 27 Feb 2025 11:11:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbcq-000000074f6-2Ifq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:00:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnbck-0000FI-RT; Thu, 27 Feb 2025 12:00:14 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnbck-0036wn-1o;
	Thu, 27 Feb 2025 12:00:14 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tnbck-0005pz-1b;
	Thu, 27 Feb 2025 12:00:14 +0100
Message-ID: <4dbc990ae607404ce4288d884652b9143032023b.camel@pengutronix.de>
Subject: Re: [PATCH v4] reset: mchp: sparx5: Fix for lan966x
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, herve.codina@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2025 12:00:14 +0100
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
X-CRM114-CacheID: sfid-20250227_030020_586135_E5335E7B 
X-CRM114-Status: GOOD (  10.77  )
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

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

