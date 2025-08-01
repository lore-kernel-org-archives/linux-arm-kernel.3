Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6124CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6wu97Qx4PzZUGN0HFq5lg4ouDZclHIXmcME0ndtly8=; b=MTpBCnBlCeCHKXwwUaVcX5ugl1
	r6SLZT4XNCGeAQsKuvAypUBnsc/iH72I+IHUQJW18qK7Qu4zMIxchrXVR72gfzN0BF5Qpxunuz9Ua
	+wsxjX0lWglu0OFjPX2dSxpU8JnibBGfAmQcZjN38ssEaJfD2XDHxi5pQwhvPHZd4SL2ZBCXtiR3C
	mOxQ4c3ZAoRWXPwS+o+e0vXT6BaeFtK4h3Qj1uSwNYqAd80TJjq/wkobZdbZnIWN24QNKzSbjQfDr
	E3fhQoIXWbKDv/14oFl6UPSMwn+zK504e1+fpuMqZZYXA/nYw9Na8trHIIyXHq3Ky9P7OyBxQU0PS
	zvOLwWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjgk-000000055PY-3WMX;
	Fri, 01 Aug 2025 06:56:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhjeB-000000055Iq-3K8j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 06:53:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uhjdw-0004CA-3q; Fri, 01 Aug 2025 08:53:28 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uhjdq-00BL9o-2k;
	Fri, 01 Aug 2025 08:53:22 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uhjdq-0002fD-2S;
	Fri, 01 Aug 2025 08:53:22 +0200
Message-ID: <ba9fe144a8cfdf62eb6cfb5044401b1083d1e66f.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] drm/v3d: Allocate all resources before enabling
 the clock
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
 Julienne <nsaenz@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Maxime
 Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>, Iago Toral
 Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list
	 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Date: Fri, 01 Aug 2025 08:53:22 +0200
In-Reply-To: <20250731-v3d-power-management-v2-4-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
	 <20250731-v3d-power-management-v2-4-032d56b01964@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_235343_826110_E7BF3D4C 
X-CRM114-Status: UNSURE (   7.61  )
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

On Do, 2025-07-31 at 18:06 -0300, Ma=C3=ADra Canal wrote:
> Move all resource allocation operations before actually enabling the
> clock, as those operation don't require the GPU to be powered on.
>=20
> While here, use devm_reset_control_get_optional_exclusive() instead of
> open-code it.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

