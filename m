Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9797DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3nAVq26ABkLe7YbYTpBzgZzTSoZK7RuOBFNBuFqk7o=; b=buXKeEpyrTDe2llQehfztWuS7Q
	8rFyVGzFlvS7I+NMUI27hB5Xh8Ok1Vq9M5xqDM9l+77XnKlX4O4DFCgjEkNsO0XTJcBQ59VEs/AL1
	K9xd32qeqx/Sq6RBiOZGsghjn+m9IF/eyiDiuHpk5Sh5zO+CSnrb0VKZhKr9MzLDvVVAIFoZ4RS2a
	JD3If28EJ9sPpORUPXD7rLKtVx0x1wUVCjD0qrmofQbEfckeammLifljBcm5BV8FOlzWxoF5YPcgX
	lUit7hfv4wavl6j1aCldmoa2bz7Xpe7ORDXCGv6zO6b9H/NAjhG7qOHyihTDmNhgFHZXDSXl5xuDa
	6Q2/dDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJhS-0000000H4ap-3kMq;
	Fri, 07 Nov 2025 10:28:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJhN-0000000H4Yz-1ME9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:28:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJhF-0005T7-TE; Fri, 07 Nov 2025 11:27:57 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJhF-007VqL-0L;
	Fri, 07 Nov 2025 11:27:57 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJhF-000000003eq-02yK;
	Fri, 07 Nov 2025 11:27:57 +0100
Message-ID: <3f97f737c00ce9d82a6b54955241458d0f77c4ec.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] media: imx-csi: move media_pipeline to video device
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Steve Longerbeam	
 <slongerbeam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Fri, 07 Nov 2025 11:27:56 +0100
In-Reply-To: <20251107-media-imx-cleanup-v1-1-f82a693c28f4@pengutronix.de>
References: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
	 <20251107-media-imx-cleanup-v1-1-f82a693c28f4@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_022805_364574_887C18C7 
X-CRM114-Status: GOOD (  10.58  )
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

On Fr, 2025-11-07 at 11:16 +0100, Michael Tretter wrote:
> The imx-media driver has a single imx_media_device. Attaching the
> media_pipeline to the imx_media_device prevents the execution of
> multiple media pipelines on the device. This should be possible as long
> as the media_pipelines don't use the same pads or pads that be
> configured while the other media pipeline is streaming.
>=20
> Move the media_pipeline to the imx_media_video_dev to be able to
> construct media pipelines per imx capture device.
>=20
> If different media pipelines in the media device conflict, the
> validation will fail. Thus, the pipeline will fail to start and signal
> an error to user space.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

