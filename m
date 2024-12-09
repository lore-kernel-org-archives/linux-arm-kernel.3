Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DDAE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgDtgztm4NhJnDs4TqQbqTsKEgtGlsJ8O4rzoFJAYAs=; b=P12YiBWryxYg+MGfBnmOdZGHLZ
	OyherjbT6cMXougB+WL4MMSzWdYdrhbvIZ0gPkuGDhvhBkDbZbjlYVDbVOJMPzjoS2NlMCpbLdztV
	BUp6gBU7QgA+rygbjPGHVefWTdiTa75TicLFzWB+Vn/2d8KhXWGBCUoPToZ0sxlXOiYjogVcl8cYZ
	0QvvFn6uCJ+0YxNJ0mAkRHGY6/DRks2bnMc0Der9s8Q7W9zSXJK+3knEBlRPB+JeWlc8UCJyTtgnD
	Rnwfp5ZtlWR+LohdYv1KVxk7eijhFq+A6QZATquGGuCBWpG1H2rTgAqPKX68TVa5N59DS5e0WXUAj
	SmCaHWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbAc-00000007Kns-11nI;
	Mon, 09 Dec 2024 10:39:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKb3J-00000007IOr-2Gxx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 10:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733740304;
	bh=5FD+3+YGg66Kmg6Pb8md4YNs9r8XETLZGOR+KRhv8QA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EaNtCQpgyCPk0+4dHGkKhWhTdHGQNvGnLSeZ8De8z7kk8FfSPaT9qfsaGE9xPzc/8
	 4rq+IkOPuV434wXqQ9OBXRbZpM2g0fjWtpSIlpE1luurwphiPGgMAKOW6bW/olK3te
	 djaMne1S2nmnHT7SWdf6auM/yT4IPdJVPzn6DwKYLSQtNdptU7F3jouBElJ80b0gHt
	 d5vNswk+6jck15aLq/OagzA6EsPw286buniN/bo8X+/BHFlK9Mr3AQMoYvJdeYWZp6
	 CG5oPPdxPw2LvxlI7NIj1xZYh9sLEDTV2mZscHZM1lRnjgOIXGLmh4RZc+6Eds3IRD
	 qUiJb68WP7V/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EE5E17E35F4;
	Mon,  9 Dec 2024 11:31:43 +0100 (CET)
Message-ID: <0b5cbe50-12f8-4f7d-a410-811fc4063889@collabora.com>
Date: Mon, 9 Dec 2024 11:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,04/10] drm/display: hdmi: add generic mode_valid helper
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20241130-hdmi-mode-valid-v5-4-742644ec3b1f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130-hdmi-mode-valid-v5-4-742644ec3b1f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_023145_725881_C3750E0F 
X-CRM114-Status: UNSURE (   6.24  )
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

Il 30/11/24 02:52, Dmitry Baryshkov ha scritto:
> Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> It can be either used directly or as a part of the .mode_valid callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


