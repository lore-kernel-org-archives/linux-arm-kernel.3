Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FC1C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lv/4qA49zZhVU6Mtn/HDxpZJGQJyADrP9l8XahpZC0=; b=c224f9pzbqHdcmz1g5ooILoQvf
	gWldT8mP1MADgkh9G2O/IwDFAObu2k16DNsGF106530eeBLZPC5GMHBmINUSxEp9PxAeQLZdO9niK
	MocIyETYVFcsC8BqC+keVIdq1pcB88vweJpoDzgyGb5+ty7F6tQwWXkxWR8TO7avvBrcDRM9OjiMw
	V2agotAQhgidEia1YOTO0+DLg0DkYNeueXjPDP2jr16TPF33JMoODQJkOizPW2h7xXuhG2lWYJz8T
	FJBwkumWI7TDXeSadavv08BVQgqecqTNxoqWxi64YoPgBYQ0wbz2JIUPufCcg1STRMozvQw8dzckY
	WtN7Zcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8arn-00000001cNa-0uW9;
	Mon, 21 Sep 2026 10:03:19 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8arf-00000001cJt-0Oc8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:03:13 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1A4FC1F947;
	Mon, 21 Sep 2026 12:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789984984;
	bh=4lv/4qA49zZhVU6Mtn/HDxpZJGQJyADrP9l8XahpZC0=; h=From:To:Subject;
	b=cuLLnOrIpN8MYL71+U54afnRLtYNj/apQyXqHsXD9V/kHSFYbwoBTBFnCQcYdNKDH
	 fMg36K1GT5vECr5fNb2Db3WPSzoY1SLhnGhqu8eYP4g1TnaBRQxUZ92knI4Ka3haIW
	 +P2RCIwINK245R2oFTShmrgCQJcLEfMR79X9ovppMS2DxPcGQdDacjfU8LwDyRu4nE
	 JAy9bK13RJq9ryRnODkiNkcdIr/RtUDSo0YvvkB7DBaYELvv5NFoSGOdaRujsitttc
	 wGenHDupm2H7gCaGJ98fMkAx1rkJUNRn72umjS/GD/kz5KbhwC/qzbmeDNK+HGsL3t
	 mMY8HON3Y+o9Q==
Date: Mon, 21 Sep 2026 12:02:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/3] drm/bridge: Add Thine THC63LVD827 LVDS encoder
 and 10inch LVDS panel on Colibri iMX7
Message-ID: <20260921100259.GA61633@francesco-nb>
References: <20260908100230.83796-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908100230.83796-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_030312_200368_8836A673 
X-CRM114-Status: GOOD (  10.50  )
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

Hello,
just a gentle ping on this.

On Tue, Sep 08, 2026 at 12:02:24PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Thine THC63LVD827 DPI to LVDS encoder and
> afterward uses it to add a DT overlay to enable the Toradex 10inch LVDS panel
> on Colibri iMX7 / Iris

I did not get any feedback on the binding (apart a small comment from
Frank -> thanks!) and zero feedback on the driver. Maybe some DT and DRM
bridge people can have a look?

Thanks a lot, appreciated.

Francesco



