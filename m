Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6914AD29C50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBf2lasmqqjrfsbF6WKQjkm17EIQ2p9rHE9R1xVmfv4=; b=o85NIWwOzB+ESH63K+fFfyTP6V
	MJQEOKQVhAjxeOdBfvr/jvFBQ61B8lY9u508MHXlGCKa967kF9z3e5xWiscKMnuNqE2rx7UgCiAJm
	+fvs0+MFpaZM+qEZD30miFNbSFgcN1ACe+027Xnr0pWOYtpUre6LlI1nzw4E5UU76AAq3a8bNsj3o
	WtS6cg2fiKhtb9In3dVuQBxRh9hzUzX97ClhFV8n5+mmz7d7F47LgrzOTPlHQqBEaUMABbOIHa6tI
	NfYApmu4fr28qui9TfpBNMkFVq1xdAumY/i9cUiIvuUSBLTYNavlEh+XraCHSKHTyaFr0roFJqOt3
	/eJp9veA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtYH-00000002gBb-1Ayg;
	Mon, 19 Jan 2026 18:00:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtYE-00000002gB4-0FHc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:00:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E7CCFC214D8;
	Mon, 19 Jan 2026 17:59:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6905960731;
	Mon, 19 Jan 2026 18:00:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA3D810B682D3;
	Mon, 19 Jan 2026 19:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768845624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WBf2lasmqqjrfsbF6WKQjkm17EIQ2p9rHE9R1xVmfv4=;
	b=GJLz99FuROhVPQbODGQoBmS8mQkJhHWgqwlB4dozNcQWeCn/sgZRLtTpvY1LDTWNwJs2Rk
	Q+XON3cIQ+yRX282TPZuXCbz7bIyLua5y6Scd4xEcjwJ06TYhC/GWP+A0al5xyhsygUfSc
	Suius3yeo98RjQHO1C7bVOYI6pwgJ2eKp4h8ub91LXxE/6q1XlcwDIVrg3i6FZcCTa1kSS
	pIeYCVaCaD/GP2lcbshIEzNpQWfS0SQLQkYGNNCuoSQIuhaiIYB2vObKV70l9D4esLxKaX
	OjKFHkZze15koeCsKB2EGcFkERJaoWpYrgDeEnLDV+3gtXrHXlDCr+FG7Vhr5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 19:00:18 +0100
Message-Id: <DFSRFUYPL99P.WTKNJRWA36F7@bootlin.com>
Subject: Re: [PATCH v4 19/25] drm/tilcdc: Convert to drm_device-based
 logging helpers
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-19-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-19-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_100030_594823_5E2C34E2 
X-CRM114-Status: UNSURE (   8.69  )
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

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Replace dev_* logging calls with their DRM equivalents.
> This aligns with the DRM subsystem's logging infrastructure and provides
> better integration with DRM debugging mechanisms. The drm_* helpers
> automatically include device information and integrate with DRM's
> debug category filtering.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Change in v4:
> - New patch.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

But please avoid adding more patches to a v2+ series unless there is a
specific need. It does not help getting it applied.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

