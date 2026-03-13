Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC704103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mvmyb6/GtRxUPVmCJnAQ8PMs1AP5bNk9phBJy03fxu0=; b=ZB+XkfV6PGlxJBLGkLhcHFSEM7
	I+UUzoEOR4ELk9j/QOe42sMczM2d1N2Ta0GXZ5l6E1AqUBzOxvzaq8EJ+n5RP3jA0U0Z/WGAmTAb9
	0kV1U7efNOXbY2f638XAqyySPCwjxM7PDWxb2pcQn6twA5EguVaCxMgpUdsG+tYXn1CzG+ZVW5C13
	ym3C5TzyyVHjO2iINBdfFN3EebucxBoojuIIaCliywtYX3BPRqiDk3LyLCBjOLeRkVCYyYVqpGewg
	7yMUu6TQwaVfy8Qt/Z4LWeEZfF/Oz2z+eyfL7ppgiG7hou6VCnRAC5+1RlR5XlNZcqPQphss/gbG7
	46Icvwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14XD-00000000Z7N-1VSO;
	Fri, 13 Mar 2026 15:34:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14XA-00000000Z6v-1nR7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:34:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14X0-00029Y-A2; Fri, 13 Mar 2026 16:34:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Wz-0006RK-15;
	Fri, 13 Mar 2026 16:34:29 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w14Wz-00000000En3-12Wn;
	Fri, 13 Mar 2026 16:34:29 +0100
Message-ID: <62df7303bfb508e00d02b14ddbe4f4d70349ad95.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: parallel-display: add DRM_DISPLAY_HELPER for
 DRM_IMX_PARALLEL_DISPLAY
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Martin Kepplinger-Novakovic <martin.kepplinger-novakovic@ginzinger.com>,
 	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Date: Fri, 13 Mar 2026 16:34:29 +0100
In-Reply-To: <20260121102607.4087362-1-martin.kepplinger-novakovic@ginzinger.com>
References: <20260121102607.4087362-1-martin.kepplinger-novakovic@ginzinger.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_083440_462752_8FC1BAE2 
X-CRM114-Status: UNSURE (   8.38  )
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

On Mi, 2026-01-21 at 11:26 +0100, Martin Kepplinger-Novakovic wrote:
> When I build for an old imx53 platform I see the same as the test robot
> saw before:
>=20
> arm-buildroot-linux-gnueabihf-ld: drivers/gpu/drm/imx/ipuv3/parallel-disp=
lay.o: in function `imx_pd_bind':
> parallel-display.c:(.text+0xb8): undefined reference to `drm_bridge_conne=
ctor_init'
>=20
> Selecting DRM_DISPLAY_HELPER for DRM_IMX_PARALLEL_DISPLAY fixes the build=
.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512241721.jZgcwRfr-lkp@i=
ntel.com/
>=20
> Signed-off-by: Martin Kepplinger-Novakovic <martin.kepplinger-novakovic@g=
inzinger.com>

Applied to drm-misc-next, thanks!

[1/1] drm/imx: parallel-display: add DRM_DISPLAY_HELPER for DRM_IMX_PARALLE=
L_DISPLAY
      commit: 02df94d98ff837074788ce921edf67707dbad404

regards
Philipp

