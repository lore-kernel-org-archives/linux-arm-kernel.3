Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07961CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKaAk9bGFJxWpNLpvR30z32s14oFUCOtOqIP8NWqOhM=; b=b0JyO/ZGQHoatpCjfc3nI8xwmg
	BsF35HFlNRf9GnTGiCsm9Aaxpv3LP6CH9Lu4fMhUeWZ58EQvXsNgJLAFp9JwpmzuLg6MbAZcC3aOB
	0+A/Jrzjxzr72I4ab0KAiysGuQEaBDjQq95g4snaJZO/uqzBf7pXbiIul+1e6MrcJ1CB8RetofVIo
	9CgqpzpuVc1PEfgzEbBEIqnw+p6jPNhfTdOQpEhVHTzoFOknKje2B7uGfWL6lz34sxXLKdQNurdYL
	3rCRA8TLMYBsh9azP0r9Q3xalVKgV+GaEJ/QEsZFhwSkROi2eVLX4g8OBQTR2fVqfIOupmLT60ITS
	mc8fXDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJhj-0000000H4go-05zT;
	Fri, 07 Nov 2025 10:28:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJhh-0000000H4ff-1VfS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:28:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJha-0005dT-NH; Fri, 07 Nov 2025 11:28:18 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJha-007Vqa-1e;
	Fri, 07 Nov 2025 11:28:18 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJha-000000003hw-1ogW;
	Fri, 07 Nov 2025 11:28:18 +0100
Message-ID: <bc9d736366cd3cf567e89db95710bc8a0052e707.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] media: imx-csi: use media_pad_is_streaming helper
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Steve Longerbeam	
 <slongerbeam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Fri, 07 Nov 2025 11:28:18 +0100
In-Reply-To: <20251107-media-imx-cleanup-v1-3-f82a693c28f4@pengutronix.de>
References: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
	 <20251107-media-imx-cleanup-v1-3-f82a693c28f4@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_022825_404344_D723BA9F 
X-CRM114-Status: UNSURE (   7.74  )
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

On Fr, 2025-11-07 at 11:16 +0100, Michael Tretter wrote:
> The media_pad_is_streaming helper is explicitly for checking, if a pad
> has been started with media_pipeline_start. Use it instead of relying on
> the implicit knowledge, that a pad that has a pipeline is streaming.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

