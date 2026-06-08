Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2A6CD8CAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XMQ94f2NnI3UCxBWCQnjfay4QTl/Mm3LGr0hsRVrJs=; b=QB0ghqlPocwqJyyuXOxltC6DJL
	bWQNLSuVlpDl7OkWaGPdL3uGpYwSY2iixk8oK7F8X+UB1uo4Vtg/+b4tev+xCSwq7x4ZbNFiF3wIc
	q7xNkkbagDkycivWK4IFPwuAdQQQuXWhXkcTpNBH0wYogqVcLZUu8UX4m+wXGDQHXsuvKwIGty34c
	lEHXaOXCCeiSnDzfleoYIYOZfPf03OftCVqb4B5INbWcMf8yrzz+XnkyEC+UcUNyWuuWiL2C6ZQbg
	9TWgtOrhFwKDnHguockJ+rRk0z1Fqh8oV2enQrDLM6rLwGyX5oyLc3I8UGO9aMHaGlzU5JF4wWEs5
	PJoIlRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbxi-00000003y82-02St;
	Mon, 08 Jun 2026 15:32:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbxf-00000003y77-1NNH;
	Mon, 08 Jun 2026 15:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780932740;
	bh=0uQ4uyIwFgJ6UABF/dPRZy9vsW0+jj/YnI0z8Vmpot4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D/5GDdGFDvH6mTnc2+1eYFBoojr+p4Y44ZIY5wlXhi2WDtWxnKodAMondy8zuotLe
	 4Uj8SH4EGutvTInjjMh8VUDLqiyuxbaoOeZjccJHCFiod8Mp9+P4UE5/D3wM+ArN0V
	 qqN8Vh9o7n1XvT9xutDKy0YjXVRqpHO6S7EYJKb7M1hpN9M4N3ySWE+VTuCpYZGzbV
	 tu2/4FCZJhYhgP4DRHX81hY1BQH/9m5RHt2ohRIKYRcqnBvgoIi7elYKH/6JEwvjZz
	 dcI00IEohlQzQ0pSBK6RBrLqCS4z4/MEi2utspP9pnR70wOPOYEL5TkkCBjt+6wCtL
	 NhHWvxZQ5z0Qw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBDDB17E0CA9;
	Mon,  8 Jun 2026 17:32:19 +0200 (CEST)
Message-ID: <d3b2ab1f-06ff-4ba8-a4bf-6eab95a81a2a@collabora.com>
Date: Mon, 8 Jun 2026 17:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 52/78] drm/mediatek: hdmi: Switch to
 atomic_create_state
To: Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
 <20260608-drm-no-more-bridge-reset-v2-52-0a91018bf886@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-52-0a91018bf886@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_083223_506992_F1C0F617 
X-CRM114-Status: UNSURE (   7.49  )
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

On 6/8/26 16:36, Maxime Ripard wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


