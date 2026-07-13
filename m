Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE0EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jN2Uqyqlk4BlB1zGW5Bw3R7JyKk82NVHi1lz3053mrA=; b=BKi9KZD5Ol1VX60QoF8LLtocwS
	ACf0IyZ2mUM3GntLXSQespG7cbBhQqX4E+n/lE0rdlz/5twjJCVGgAlQZHjFyTttBGkVBmlqAocSf
	nq3XOtyUQMIytcHCJHhs1WZDqBxP9KT+leRrd2HpxLniwbJzk+UwpKnUthjA9xTIWjEPbjyCfTX9D
	fiwlzzkK3U0hZhi7VBpoZBwINaqzUwN3PUu0X3cK8M1BrAPZ7WA/M9GAYimNYnXimVT1siIXV2HuO
	9XFh+Wx5HVpW9ulVWMOiT/Hi9TuGA6lX0E65OCGAD8givTFk/mRglxB1a8vNXhrFgNuaISRhV9eQY
	qSxDVz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjH8x-00000009So2-027I;
	Mon, 13 Jul 2026 13:56:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjH8w-00000009Snr-0akg;
	Mon, 13 Jul 2026 13:56:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91FED6004E;
	Mon, 13 Jul 2026 13:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F661F00A3A;
	Mon, 13 Jul 2026 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783950981;
	bh=jN2Uqyqlk4BlB1zGW5Bw3R7JyKk82NVHi1lz3053mrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FzJ62VPZgdUAUQmiLBMA+9B94QtywjBJVEiCmeTsr5MglH2TgGMUQpuPtxjxtwlbH
	 9MQA6kk33gFAdx2LG8KWQAQcjMWaLnqHI370mEp0J44O6UaKFLSyrpJkp9AhHPMKvu
	 vFt27QaijnH6K66ijOMHSS7oqiA0xDP+HJJ/RAGLx5I6mz0zLQUZ+jc9TroeaU/GxY
	 KuiFHu9WqX95/NNMxDqB1uZA/7RIuuUotFj6rAQVAwwraZpkl7acyV1RYmbl8zmmRH
	 znCPiEDJVsQ/nklC2VsRzVjPUBc6meF1hdkWmCB58n8Dmw+2MZWZNOoPfEc4uNTZ8R
	 OPAra+BHvl9sw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjH8t-0000000527P-02yL;
	Mon, 13 Jul 2026 15:56:19 +0200
Date: Mon, 13 Jul 2026 15:56:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in
 v2
Message-ID: <alTugxmHG_s4kY4E@hovoldconsulting.com>
References: <20260713112957.884640-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713112957.884640-1-lgs201920130244@gmail.com>
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

On Mon, Jul 13, 2026 at 07:29:57PM +0800, Guangshuo Li wrote:
> mtk_hdmi_common_probe() gets the DDC adapter with
> of_find_i2c_adapter_by_node() and registers a devm action to release the
> adapter device reference with put_device().
> 
> The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
> adapter. This is not paired with of_find_i2c_adapter_by_node(): it drops
> the adapter device reference before the devm action drops it again, and
> it also puts a module reference that was never taken.
> 
> Remove the extra i2c_put_adapter() call and drop the now-empty HDMI v2
> remove callback. The common devm action releases the adapter device
> reference.
> 
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
> Cc: stable@vger.kernel.org
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v3:
>   - Add Reviewed-by tag from Johan Hovold.
>   - No code changes.

No need to resend just to add a tag. It will be added when the patch is
applied.

Johan

