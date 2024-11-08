Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F9DD5C0ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImDVNNB/e4E8CQ3qxsIdhk2vnoMle6DLapUtCnL1v+w=; b=MDi7RIRTeAa2vmVck7jFnHtyVU
	0PDxgRWD6xmP6K8N8byaY3pfZiHzZghyeX7FtRPt30EU7+GrCrcg6x07JdMnjRasQqFK9/fLa8PaL
	AFRCcSFn+3e+qMBHnDBpfwzQetfTgwfnIslLEI0Sv4mHdwxjJ+mzG6A2HCkEx9pNgPVKR2/zGFe5Q
	ZK8c246j+TiUBVz3KBDUAHZtRJ9PRhZUzyY8SUXJ4MwkgOVmuvgdxIihAui7qRYrTL2gp7hH45Wu6
	UAzkUNpBPLw6hTp0ZC5teEvCOp8frt5t7ldUp3s6Vvpn2nGLhdOJ8p+QRkc64GzkldSPUjNQ6HmYL
	DelKe++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QoS-0000000B0dK-2dhl;
	Fri, 08 Nov 2024 15:22:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PxV-0000000Aqgf-1Bqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9C26A43D24;
	Fri,  8 Nov 2024 14:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B668EC4CECD;
	Fri,  8 Nov 2024 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731076052;
	bh=TaXxmL3Sbql1QbTmuvBM7Dof2vpIsU/GkgSL8ibpxg8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=R5KQxzZlAFfVQAq5dzIpTD/ohWpQth+/2cFBONVNNdTC16HlhikPnefvAhxuQXuqq
	 PoTz8ycYmBwDfUAt/gB9CImJwKceEmSByVoGp23CAKwY2vT6OTKMuBZpAJrBrvzVQ+
	 HSKM9o9ItSRwvd2LkHsBvzBO/EnXU3UUQ9e2qc7DsP+96UkDGqeZOMoV5WOVlJNglR
	 xULy4jp0GzoINpxVf3BjGYkyzPjMn4tjzl88bR3gjh+54Px9txMbSIik39g8NHTWjk
	 BThA67HdclpWhpzRIM+k2sjlWvLd+KUKOe77FYVfYh0o7bIuibMwG5SCQehtnXvABn
	 AmJibhtw2CsPw==
Message-ID: <6d729a59f8a6f6f0c7454d506c7dd3ef@kernel.org>
Date: Fri, 08 Nov 2024 14:27:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 6/6] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
In-Reply-To: <20241101-hdmi-mode-valid-v2-6-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-6-a6478fd20fa6@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_062733_417091_2E4D9420 
X-CRM114-Status: UNSURE (   7.11  )
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

On Fri, 1 Nov 2024 02:25:09 +0200, Dmitry Baryshkov wrote:
> Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
> more generic and is used in other mode validation paths. The rate
> validation for .mode_valid() will be performed by the
> drm_bridge_connector code.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

