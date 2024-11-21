Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D29D75BB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/h+Aqf+FUd6Y7eBOAWkUFVG4S9BbIuewS7MSwsHNJ0U=; b=DiCZXo24FlBQ+Xpw/JunY3aVjE
	ch2fUVweh6Oxu0gYMuZjm3YABRXa57TO+O8/G0bSfbpHEB8Fo9p+EK+NxC1L6cF5JwWV89Q8a6VxO
	4rhKyONhug0RK5Kel7NfrsoNdzCzya0GjI50Np4tXs98M8gUUeTdLo+bmjFUP8EaszMIBlwLbqQjN
	R+h64MuYZqyfatdoa9jXCL7GDuzH1xKq7Nc8QCrzGi8ZhcqmaLlWPquBw8wl+MNFLkt4MtdnGo8bi
	QwCh1rDF2nq/5LANSdgTAWcaoOBVm+swsrINwm5nlbCaZMscgVHe/GkpwW6uGHBN7WcyGvkalO/dn
	d8J9IrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDydE-0000000GlQl-1pU3;
	Thu, 21 Nov 2024 04:17:28 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDycI-0000000GlJm-0sN3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 04:16:31 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6131789634;
	Thu, 21 Nov 2024 05:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1732162589;
	bh=/h+Aqf+FUd6Y7eBOAWkUFVG4S9BbIuewS7MSwsHNJ0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z47VNZrjkXdRpTnkUBfyeS+GzuPm3YNuXhwk4wB3lz3abLpC5KL+scqK74W7Qk6y2
	 Ykr9H/DHfjCHTHs4j0YoPjoj+Fb3BioGcvxQXmbexmKYeR8atLfkVNsyA5rr600KlS
	 GpFsOwPSmL9PQMEczOJRqQDKGz/93fO0sovc7vN7FLrey6j0cyuN6jgUZP8KtQeO2/
	 1FH6gk2or/Btc9F9JdpgirEgjHGTjOR9Xj9lIIXz/qI5KVnDhPBbfrzTOV0wdyBqF5
	 lEXsCO+3TQaC5xG7dcbbVKJI/A3LOlw9OMnhQsmLcMNdeDAf4ZcTe5Gw0WqpVUVKzl
	 nqjaRa7D319qg==
Message-ID: <5f56ac1e-7b88-4962-838f-66dbac292828@denx.de>
Date: Thu, 21 Nov 2024 03:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
 <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
 <1f5e9559-59f8-490b-9cb2-2f8d4a8823e6@denx.de>
 <41855af3-53bf-4a02-bd5a-9982becf2726@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <41855af3-53bf-4a02-bd5a-9982becf2726@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_201630_387820_63B7D193 
X-CRM114-Status: UNSURE (   5.58  )
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

I'll stop this thread, let's continue the discussion in one place in:

[PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp pixel 
clock reconfigure parent rate"

