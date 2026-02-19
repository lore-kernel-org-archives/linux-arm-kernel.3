Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF451E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 09:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7r0dI/NDhO5KOimLguNOEmUEH07RDuzdphKOPAKb7+w=; b=1ZP2zX5GKZw2FCGmz1H80D4dHr
	68+fOu8OK9RaW5FD87fn76i62GdOkHWko6c91qogdcMhgcrgRztR8zSJgFj4fiv3RyTy4iwep2+oY
	4f4EPa+u/ZMs7r/TaGZ9JXUUHiatIMsWK7RgUu4hcht9bHeHDdoH0OrYTXUVweEPW5H3K76kwXwQT
	CnGtNJrDTUckx6VTYEutZxAtL9j63QF650mszbff23OViHrHsydC/z6y7APdXK24EYXj31jxGhycH
	XUg520WAsHAAaBWhI3Ln71AOF9qL+prdVBK2JeD0vpzfIQeS4TFeU9QLy85d/Da1usdLalCZTTJMO
	zQ622ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0Po-0000000BB3u-11Ul;
	Thu, 19 Feb 2026 09:33:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0Pk-0000000BB2l-1nwV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 09:33:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt0PX-0005vL-Tk; Thu, 19 Feb 2026 10:33:27 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt0PT-001YRg-2L;
	Thu, 19 Feb 2026 10:33:25 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vt0PU-0000000050U-47c1;
	Thu, 19 Feb 2026 10:33:24 +0100
Message-ID: <d8bbb0a2c3619fcc3734d3840834b59e442f8d80.camel@pengutronix.de>
Subject: Re: [PATCH v6 4/6] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Michael Turquette	
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz
 Julienne <nsaenz@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Stefan Wahren	 <wahrenst@gmx.net>, Maxime
 Ripard <mripard@kernel.org>, Melissa Wen	 <mwen@igalia.com>, Iago Toral
 Quiroga <itoral@igalia.com>, Chema Casanova	 <jmcasanova@igalia.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list
	 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Date: Thu, 19 Feb 2026 10:33:24 +0100
In-Reply-To: <20260218-v3d-power-management-v6-4-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
	 <20260218-v3d-power-management-v6-4-40683fd39865@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_013340_459121_2B7A768F 
X-CRM114-Status: UNSURE (   6.10  )
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

On Mi, 2026-02-18 at 17:45 -0300, Ma=C3=ADra Canal wrote:
> Simplify optional reset handling by using the function
> devm_reset_control_get_optional_exclusive().
>=20
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

