Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DFBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cde7EGjkh7kZ2OJwc7zRN79PZ5XA/VInzcgH4bhaDrg=; b=TYC9E07CbkzQvYfIh/jRyVy7sT
	VSlRD7ghiERiQQshhEWoHJ3CRhX6fuGNaGi6yx1S/ZwWi3+1lYRaQJc6pvK4wVQ9UgNV3wIDkk7BW
	3DlwBZb0HgQ53cyO5TQfjG5tWDUwLzdpxIWrLzRT78hcBK5yDBQ/DGXwEfLJO03/eGhak1z+XJ9FL
	gRQq53DdWjigcuxoMUBBStk21hwWEBYJaYr+8X3ZcE9s9E+07slw7GarLT37bR9S49BGfa7dpC5wB
	x/nOHOfioj+1++SkXr6oFvj4FpPvGoSwT1CfX0LuDFk36yPTW4ALCdPZDDhQFWpI+1o8HQHL9ZIJQ
	2a/w6+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4NZ-0000000EtQA-0K86;
	Tue, 07 Jul 2026 11:54:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4NY-0000000EtPs-2Nqh;
	Tue, 07 Jul 2026 11:54:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5AB86001D;
	Tue,  7 Jul 2026 11:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9521F000E9;
	Tue,  7 Jul 2026 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783425259;
	bh=cde7EGjkh7kZ2OJwc7zRN79PZ5XA/VInzcgH4bhaDrg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=ezf84LltunYnZKSTsB2qmEJ2qWujDFbhkA42F2bLhEmhhnh9Y6HSYoOzp2qiv7vre
	 tDXXy0o1XQTf6kEAEwnIF5sIxcGNihM56PnAsn8PdyHUJJtcb86/G7pdQIvPOmA/tP
	 SQrwiOZKJizTMhUgccccFv0+vo/ltwzJZe+BdZHYWp1752AlTgI3dXt8qEQ7q+FsdL
	 xE9MfmijT8Epfv+tULWPTK4CRp2vSgMJkDHTKrwIBRUfBZWROOF2+LRIIs9pej76X2
	 wHU/fnLFcvZGkP+4nstYRB+Cnv/gXXGKElo0SFTheFtFAaF+ey1Ws/w9F844T19oIB
	 8RAFlX9YKZuTA==
Message-ID: <4db33012cf6f1251614bfefb67017e3c@kernel.org>
Date: Tue, 07 Jul 2026 11:54:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v8 01/39] video/hdmi: Introduce HDMI version enum
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-1-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-1-d79890d00b6a@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Thu, 2 Jul 2026 17:46:14 +0300, Cristian Ciocaltea wrote:
> Add an enum to represent HDMI specification versions.  This will be used
> by upcoming changes to associate HDMI connectors and bridges with a
> maximum supported version and to simplify handling of version-dependent
> features.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

