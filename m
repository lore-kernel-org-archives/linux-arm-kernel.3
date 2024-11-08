Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D3D5C0EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s9qA7S7vLl3oGs7cQRK5kM6O5jDbVDsIt1b0HJKwIs=; b=vzu5eOGtYVJen1SUmEDYsUXfGR
	7KeMYSyIkxDL3rtVeNCcxulBkhVql2nR/tlUFmSrYN/1mrG10+oVVkoTGFLTC7Amajwb3OYUNvayE
	rYJ9+MT4WyNCFa7iLUEQEcFUaketIuDJ/8xWfPWGI0lSG5az7kLI1HFA/tmU7C456EMJx/1IsRFqO
	DUkX7esU56wMdGFMzQoVdQyVt8Z7XUsn8y/VwOWiW07UOkjxLnaCUnXlsZvp44v0DOIPI0/vtuDmL
	9SZEWwZ/DZMv9Kh3zF1UhlN0LmjxuokdBiipteK5p+1ZJCR7S7S3pBXg29+qVv9rPWNVYyy8ptOyh
	S0L62MRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qmk-0000000B0RP-1fBx;
	Fri, 08 Nov 2024 15:20:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pw1-0000000AqON-2aF4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:26:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06072A43C22;
	Fri,  8 Nov 2024 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA91C4CECD;
	Fri,  8 Nov 2024 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731075960;
	bh=RzTmieNK3A8R7874rWrc7RYSXN2l8cHqDRlpprZm/uk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=byVIt3pInLT7VLq9NCijhVkw/If6WBIR4RC0r5qiD9xyM4XkbQz538omIfMcgG71B
	 7PyWL4a/QIyF3RlBnE1NckQ7lDbGChZyr3p464SrkUrkCB58bzpqS9tHlnR3usMk9Y
	 L0brsGNY5JLOqxzm4fHbMTuPcFAet4aL7r3xMFCD0f3iIWD+HqOU401ZNHSTCs7AmX
	 VuT09lObE1HSYdC5B2hca7BBE4u/B3c5I+/eUwgc+WFSnJyJDJ5/CtJCLUWJaZwZ/w
	 /sTPkS8uK1PDbeNO5GiUfq7JyEZFsDtY62taFyK8I3K1fMaMvhTZVjRgOHgOfem1QP
	 7559zvymTNYTQ==
Message-ID: <785b15e68207eed61e5b7252788362a4@kernel.org>
Date: Fri, 08 Nov 2024 14:25:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 5/6] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
In-Reply-To: <20241101-hdmi-mode-valid-v2-5-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-5-a6478fd20fa6@linaro.org>
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
X-CRM114-CacheID: sfid-20241108_062601_754403_AA4DA4BA 
X-CRM114-Status: UNSURE (   7.17  )
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

On Fri, 1 Nov 2024 02:25:08 +0200, Dmitry Baryshkov wrote:
> Drop manual check of the TMDS char rate in the mode_valid callback. This
> check is now being performed by the core.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

