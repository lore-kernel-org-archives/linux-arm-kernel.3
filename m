Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9B8112583A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPlCUCKtC9ZfVVw7M+LrgvFFxTt7K1/EF3l2QsD/xVo=; b=nbsDTY9M70dKmQSbEgDx6bJjBh
	DlhvgRL9jVTW8CITYrxJUTycl51UiPxYwaJfYbkbMg0jVc0Wh2skHz6lz3i8vkZPfs4EbhDh3lxVE
	85YnRI+JrNsnlOtvE8BoG9/MVvP2vNPt+Z2S8nxV/2pRTQKXLLo3/ep8i1fZk6VzJV/mnVBJIMJpA
	Mqv9pNsdNs6UU4u8QsFNcdoMOjojJim4jR1Fi7dsTePHhSSxs7qd0dIWSU1rCHMJGS6MLZGOS8R1H
	/e36mKRLAY/z+kc7QvItvXt4LGkOQliTYS0bx98bZ/pKL9svdpy0sXI5coxH8u1DmPob12nCJpmP/
	DlTxP4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kjn-0000000Bj5H-0Qrl;
	Wed, 11 Mar 2026 14:40:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kjh-0000000Bj1F-43ar;
	Wed, 11 Mar 2026 14:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773240031;
	bh=EekSZLy6YP8Ncof+v9UOx5ImSQYENZkwGhIqc48E0EQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HHm/RvA0k+wuRqG5eVqAq6vTr3EYEyG1/AVKoth99YHN9DYkQGkFLRIUpRCve5fJu
	 qgKC7fIh0VJfeRlsUFZ8JciREDTXgX/hLriuusk46yl/6813q2FNsVkGH27miFCVjN
	 Kkp411oeQ6Zr+fu+h8B82wMXlvt7RSpE237QkbMaUkZsyxpFvT4THrnQH7Dsoz+rEs
	 mQzlDAz9c/4GrudO+9eOQoMLebe4hKRCfICWF4NLvWY5At6ilQkPxX2Y/M9h+X8OrY
	 DfC3gkBLvoc0YwFyv0C6QCAoohHVhahbyfgP3nImn07s4JALYHXrU8acHiR9X7FNXG
	 s371L6bUbYthQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D120717E0FA3;
	Wed, 11 Mar 2026 15:40:30 +0100 (CET)
Message-ID: <68d3d2f0-c356-4a27-bc96-c4f1ac25b756@collabora.com>
Date: Wed, 11 Mar 2026 15:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/gem-dma: Support dedicated DMA device for
 allocation and mapping
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311094929.3393338-1-wenst@chromium.org>
 <20260311094929.3393338-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260311094929.3393338-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_074034_161042_FDF9A2E0 
X-CRM114-Status: GOOD (  16.62  )
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

Il 11/03/26 10:49, Chen-Yu Tsai ha scritto:
> Support for a dedicated DMA device for prime imports was added in commit
> 143ec8d3f939 ("drm/prime: Support dedicated DMA device for dma-buf imports").
> This allowed the DRM driver to provide a dedicated DMA device when its
> own underlying device was not capable of DMA, for example when it is a
> USB device (the original target) or a virtual device. The latter case is
> common on embedded SoCs, on which the display pipeline is composed of
> various fixed function blocks, and the DRM device is simply a made-up
> device, an address space managing the routing between the blocks, or
> whichever block the implementor thought made sense at the time. The
> point is that the chosen device is often not the actual device doing
> the DMA. Various drivers have used workarounds or reimplemented the
> GEM DMA helpers to get the DMA addresses and IOMMUs to work correctly.
> 
> Add support for the dedicated DMA device to the GEM DMA helpers.
> 
> No existing driver currently uses the GEM DMA helpers and calls
> drm_dev_set_dma_dev() to set a dedicated DMA device, so no existing
> users should be affected.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



