Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B163C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 10:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MayLa1R4scxJAi3qqwwISZdET2R45SifKgwOpAJ8kQ=; b=hRyVIYu/0VKcJtupLUNCQ1HvD7
	HWcEQ9hNnEsW0s9DZP3h5lUfnLMVyNrAdimVhjux2MpcxC6oamI4Igwvm8Ol19J5OSP+LfAljms5m
	il9VAvZl/XC9/Edk+lhpv3Sd5Os/C4yEMuFWXExKX/PdHBE9zwMMLrn6xYFqYc8gy6+KxGsWfpAg+
	pMGkkKTh3ObdtFqT2GinRX2EcCWG+0p9e3r4+cV8oZWKfVOR9y+MoXeGmnJ912EJsiI4Y7/oj74M1
	zUuyudRtWkTEwTYLNNExmPorrCxDGk5v+5uNVLoV1v8NNR5UlW4ft9HBY62ogkPvBGTlDW7/+P5nI
	sPE1iqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3Eb-00000000iTz-18aK;
	Thu, 22 May 2025 10:33:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3CB-00000000ht8-0yen;
	Thu, 22 May 2025 10:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747909837;
	bh=8iGntFQbL8GyTwozwP1vKL9KhhFgtY8ccE9Bf576A2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MVVZqxhl4Gbge9gbMkOlT+f4gnKPpv87Zwj0xWaV5byaRKY09dD3b4XPfH/e+IzUw
	 Z7UjslOoRz4XTo/DN9bGkAXn9m6kVgSeDNcZntMnk5ADdYWU85PdisjdH9sQwVrWbi
	 OAB6g/5VkfdX78uyCH8UL1zvlqC9U+kE9rkIHp8F3vCqsoBuLgbduGJRjhZs9QwOYI
	 DH3tlpegyKX77Bn6LA5ovZiPyIDfXU2aUU09Do6J7iGA2w9HUl5KpCB73pDVwwoi5r
	 joFD/1NveBRB/8IeKIvFt+tCuw59l1mL5Hy5iXOUIoQ6+oANkhapcKSLiB04oO868J
	 0Afx7dsIrgxTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFA4117E0FCE;
	Thu, 22 May 2025 12:30:36 +0200 (CEST)
Message-ID: <aed94e06-455f-4aa3-8740-57bd1facad22@collabora.com>
Date: Thu, 22 May 2025 12:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_033039_449889_79B32E68 
X-CRM114-Status: UNSURE (   9.38  )
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

Il 22/05/25 10:34, Jason-JH Lin ha scritto:
> Our hardware registers are set through GCE, not by the CPU.
> DRM might assume the hardware is disabled immediately after calling
> atomic_disable() of drm_plane, but it is only truly disabled after the
> GCE IRQ is triggered.
> 
> Additionally, the cursor plane in DRM uses async_commit, so DRM will
> not wait for vblank and will free the buffer immediately after calling
> atomic_disable().
> 
> To prevent the framebuffer from being freed before the layer disable
> settings are configured into the hardware, which can cause an IOMMU
> fault error, a wait_event_timeout has been added to wait for the
> ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



