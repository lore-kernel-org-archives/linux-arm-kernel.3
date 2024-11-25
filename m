Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8B8D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZckk/05PeeAkOGPp2/2k/EJ0iXCCCGsQoB5qVFhgSE=; b=OJUsMq8pjqRpwS+PolerW4IiOp
	smD7421QjpCTx+NxECt5PVGDIF/txvUFZDA3QA42o2XDBmbgaC6aYuqpXi7ENx3rkqegwbT6g8J8m
	ejnBp6T0B16UkzAC2d2uLvONk5cvmPM59kdiApb+vQ3w8EVaiQgG0NAXhj5+Epls4nCe8TQSvhmz8
	ryl+DoAxsSyhZMn/Dg7KGvWi80szXw4fBhjFiFjV38NMLTDRK5PLlcqE5fEZvI4XVb41DJBWHErY7
	vRzq6YbXLYfHa7n4X9F3q+syh0mU0GH7YtF/0R3pnGZIyt+dN9dTIg5MYr3ncns575VUDGjtuO8TZ
	a+WIvJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVEe-00000007XE5-27gk;
	Mon, 25 Nov 2024 09:18:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVC2-00000007Wcs-1yKO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67C06A413F6;
	Mon, 25 Nov 2024 09:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF05CC4CED3;
	Mon, 25 Nov 2024 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732526141;
	bh=IRcmX+kFalTpcSK8+zzcKFRuZILPS7wKDDgoGabM+io=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=QpPx+Qo202rIesU6hZWyg4cz5JxOXDshswbouHI57nf7BX4EHA3I0vZbXhmJvP7sW
	 iKdvFvojGpDjfq4E3akvfGt0iYJUtIJKHrtNcuBCVLBP+bRWeCJ0zRCdr3VApwC+Cv
	 KMHXl/5iNeU9Ptt1GRX1qy4ubTBEJMZ/zr10SnHNx3wfb2jd+xkCcYZBxeu0lB25UO
	 seArg2dYg5S1tyDQD8/bjOgGJcmBP4IkTsOlT/+eQ0pvXRXfZA+NQ7EtTMiht48wy6
	 9NwGpOsyd6as6csAH2QitozGdCZUJoTIipGrxZTpRE2nP+n5SHw5IQ3pBG7ViY9UFI
	 bhGDoCkkUoJvA==
Message-ID: <0f588822988dafd9a8acd3ca86731be6@kernel.org>
Date: Mon, 25 Nov 2024 09:15:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
In-Reply-To: <20241122-hdmi-mode-valid-v4-10-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-10-2fee4a83ab79@linaro.org>
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
X-CRM114-CacheID: sfid-20241125_011542_576079_9A4F30F8 
X-CRM114-Status: UNSURE (   6.21  )
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

On Fri, 22 Nov 2024 11:13:06 +0200, Dmitry Baryshkov wrote:
> Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
> char rate check, with drm_atomic_helper_connector_hdmi_check(), which
> performs additional checks basing on the HDMI Connector's state.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

