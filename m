Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8D4FD0651
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYnY+3DKY0veSRem1NblkrzYhy2DY8QYTpChFSfMhRk=; b=S2DBDGxL3SuRgcRVIJcZ7gWv0g
	P+TeE/sTtNalcrMeE298ld9uSKtDHo5nqcPbnCo2t3Mr46JnjZopGxj6Z+tht+GDjSa2Giau+xXJX
	G6ecBn1SN6qP3QPqytcTJvHskvD9RfgFcH9dVIZqmlrTXsRBYbLAuOWOLsE8z17crqHgzZI0/SKul
	HYYYHybqZvNj/JU7lVRqazgKj1XOpU3PsMJRN3gcNgVcKB8M9aua2JeX22z2wSjsSQme73iUUWqli
	lyoI1dPZyWPgHnKJamK7565eYOacQsp3O+0DIrm62KRYrh7IFF+Sx3/+3cx9os9d8vKl3hHNqP0E8
	zqPfg+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kjj-0000000Bj2b-2H3i;
	Wed, 11 Mar 2026 14:40:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Kjh-0000000Bj0r-01MC;
	Wed, 11 Mar 2026 14:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773240027;
	bh=nzYLErF+rKuMbmIvpwK9XSY2PctEWxTOicG7WCugCiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SDIuy/ap7S/UwJ70JlObrZN6gJfPs8RCSCsxRB7u0IniF1h5BADbzh6Xe686Pt/+w
	 Q6u6uTvVebjTTWQGIXqowvmlwh9GNxynAFzfFDhuVFoRxuWD+oKHTqjaMUEV4qY6Tk
	 6uV0goOoAKCIDFzmmZ3uNXOi6TwvJKZCSkCyT6XHEwfIEop5KxE0Yq0rABA9gFms5U
	 OhTHw8IC1RhqxmWtLzrRwZNMiMXlb6oCp3U+CzctvHKG8ngUcshgZQDdIxiVNfPS2U
	 RSOAYdqdB6q9kgk35yyyySS/siNOIRCQD1uhDr3vck4HBGfyC88MFPMWMZ3lw/xSoq
	 p0lTGOfSfzwAw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18C7317E0EAC;
	Wed, 11 Mar 2026 15:40:27 +0100 (CET)
Message-ID: <6dc969eb-0dfa-4ab9-ae39-13c4bef90704@collabora.com>
Date: Wed, 11 Mar 2026 15:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/mediatek: Set dedicated DMA device and drop
 custom GEM callbacks
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
 <20260311094929.3393338-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260311094929.3393338-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_074033_217785_78F384F2 
X-CRM114-Status: GOOD (  15.45  )
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
> In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> drm_gem_dma_object, but custom callbacks were still needed to deal with
> using the first device of the pipeline as the DMA device, instead of
> the MMSYS device that the DRM driver binds to.
> 
> Turns out there is already partial support for dedicated DMA devices in
> the DRM subsystem for PRIME imports. The preceding patches add support
> for dedicated DMA devices to the GEM DMA helpers.
> 
> This allows us to just set the dedicated DMA device for the DRM device,
> and drop all the custom GEM callbacks. Also drop the .dma_dev field
> from the driver private data as it is no longer needed.
> 
> There are slight differences in the mmap helper: the VM_DONTDUMP and
> VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
> VM_IO probably doesn't make sense since the buffer is allocated using
> dma_alloc_attrs().
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Aaaaah you're removing all my code! :-P

...but it's so pleasant to see that. Brilliant cleanup. Kudos!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



