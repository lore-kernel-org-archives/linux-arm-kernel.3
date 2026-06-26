Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABDDCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 06:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjgNTxh5IYbPYM4mWHY0E5Hm6TL004NYqZSRIb8UqI8=; b=fKNFD5VoAfzVLoMhzNskXaOEEX
	ugD36YZkunQnNSapoMqK+WQeEoyMu91BVZGZo1e13VuTMCKahlXdq2wAHKjgHGWyL0i3DM6FTXhqr
	5MvJ6TASO7IiihiZvbjyha29tajVtD+sIgOlXKad0kCOOBWJRtd4o3u91CdWaXmqm/OIIWOHki4IX
	q5ToeQmPGAdXMaBKYz6ryjabWj0faoOsnksIy/OPOrPIqhkavJtymtA3Wwk1OY+28ui0FWMbeyknF
	xq8ZY6oqyZQDcgJoFMri/SUg1rWZ0gRdeP/oUlFtem+gW+Lp1t160XJW+wju9z6pHcbxRRJSvZztD
	ns5djF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0M4-0000000AcbH-2S6L;
	Fri, 26 Jun 2026 06:48:00 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0M1-0000000Acay-0HLC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 06:47:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3663920017B;
	Fri, 26 Jun 2026 08:47:53 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wd0Lx-004iBP-0D;
	Fri, 26 Jun 2026 08:47:53 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wd0Lw-000000003K1-45ok;
	Fri, 26 Jun 2026 08:47:52 +0200
Message-ID: <d80cecc3f317e4493207ea3c347dd144390d299f.camel@pengutronix.de>
Subject: Re: [PATCH RFC 1/4] media: imx8mq-mipi-csi2: Make reset release
 SoC-specific
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vincent Cloutier <vincent.cloutier@icloud.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@puri.sm, Vincent
 Cloutier <vincent@cloutier.co>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Frank Li	 <Frank.Li@nxp.com>, Martin
 Kepplinger-Novakovic <martink@posteo.de>, Rui Miguel Silva
 <rmfrfs@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sascha
 Hauer	 <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 imx@lists.linux.dev
Date: Fri, 26 Jun 2026 08:47:52 +0200
In-Reply-To: <20260626000715.1111803-2-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
	 <20260626000715.1111803-2-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_234757_284804_B7620032 
X-CRM114-Status: UNSURE (   8.88  )
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

On Do, 2026-06-25 at 20:06 -0400, Vincent Cloutier wrote:
> From: Vincent Cloutier <vincent@cloutier.co>
>=20
> The CSI-2 software reset helper currently asserts the reset control and
> then releases it again unconditionally.
>=20
> That release step is required by the i.MX8QXP path, but it changes the
> reset sequence used by i.MX8MQ. On Librem 5r4, which is i.MX8MQ-based,
> the unconditional release step prevents the camera pipeline from producin=
g
> frames after reset; captures time out waiting for EOF from the CSI bridge=
.
>=20
> This series enables the Librem 5 rear camera on the second i.MX8MQ CSI-2
> receiver. Keep the i.MX8MQ path on the known-working assert-only software
> reset sequence while preserving the explicit release step for i.MX8QXP.
>=20
> Make reset release opt-in through platform data.
>=20
> Tested on Librem 5r4 with the existing HI846 front camera and the S5K3L6
> rear camera added by this series.

I think you are missing [1] ("reset: imx7: Correct polarity of MIPI CSI
resets on i.MX8MQ") instead.

[1] https://lore.kernel.org/all/20260619073115.3778313-1-robby.cai@oss.nxp.=
com/


regards
Philipp

