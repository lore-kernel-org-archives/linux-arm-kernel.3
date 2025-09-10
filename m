Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74917CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICw5UVZppfIHu8NY2KftQw2Tbujo0P4n38PmOjfW6RY=; b=YBQ/VZrWp5vR5KpxlkVU8znw2L
	QKsKTLUNwsqXuEuZmSyt5+P19mZbaJyuNgMYFylAPpvhRhL9fX3lySbW77G2ywYdjTemJEBW0VBSM
	eRtx4KwZKpksFi0UAQ+r7SKU+12rhM70p/Rxx6jzpRgAep3ipmpap9rdIqZiqlDvSepuYY2Icijlq
	ObTNfWpiJ++EXEts4lxN6POAjYqEweZdUVLFY8d7aO7mAmNFVU3kafUIxC8q2s9Rre3LCo+xUqFE0
	+65H4ySbKFGON3/EKst4WPuj7AyDOk6gtA90KKSORLMh5r0MVbAhYm49sysRFaEh7T5Mewlti90HB
	ipBW5duQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHCp-0000000DEoT-1wck;
	Wed, 10 Sep 2025 09:33:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHCm-0000000DEn4-29o9;
	Wed, 10 Sep 2025 09:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757496810;
	bh=4TW25vHkdcjLk7pdZ8NdI1vAv/tKPvhm66WuGiHLE+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cd/oGOOJc4U2WUp7XJXVtXpOjWP/MDcbgLpQZb8xexNryDX/Joz7CozswDCywThc1
	 0Or8g/UM46NVvS7NpgT7mEh6BSpi80p1qFnCsTC7iPjTGn2zjscp6eVSCWIOLp2mEn
	 161E4AjeuJyoMnIHMRbxSv7RYt3yXWx4wNoO46z5zIW7I4LRUnAL49//HIMqPEfnUA
	 6tm/4jFzAYL7bk/RCG29RF2bsWpZ6Dse7IlGjhLSZgveMzrqowkzeNSAIoy2rNRyNO
	 QqY4QCmobYYIWms9Ea8aDykmcY0MN1+CJnDaXVtlnUiozXTe1nyUq/kQ+LbmwBVO/s
	 S2socrRuR3ktw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E342417E0100;
	Wed, 10 Sep 2025 11:33:29 +0200 (CEST)
Message-ID: <cb896db9-6fed-4e83-baa1-c075fdf1df1e@collabora.com>
Date: Wed, 10 Sep 2025 11:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/mediatek: fix potential OF node use-after-free
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ma Ke <make24@iscas.ac.cn>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250829090345.21075-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829090345.21075-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_023332_712368_B210BFFC 
X-CRM114-Status: GOOD (  12.38  )
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

Il 29/08/25 11:03, Johan Hovold ha scritto:
> A recent change (included in the drm pull request for 6.17-rc4) fixed a
> device reference leak but also introduced a potential OF node
> use-after-free.
> 
> This series fixes the new OF node reference imbalance and drops the
> unnecessary gotos introduced by the broken fix, effectively reverting
> that change in favour of the minimal fix I had previously posted here:
> 
> 	https://lore.kernel.org/lkml/20250722092722.425-1-johan@kernel.org/
> 
> These should go into 6.17 which (soon) has the broken fix, which was
> also marked for stable backport.
> 
> Johan
> 
> 
> Johan Hovold (2):
>    drm/mediatek: fix potential OF node use-after-free
>    drm/mediatek: clean up driver data initialisation
> 
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++++++++--------------
>   1 file changed, 9 insertions(+), 14 deletions(-)
> 

The whole series is
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

*** URGENT ***

CK, please send this immediately, because [1] breaks *ALL MediaTek boards* making
them *unbootable*.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/mediatek?h=next-20250910&id=1f403699c40f0806a707a9a6eed3b8904224021a

This series fixes the situation and makes them boot again.

Regards,
Angelo

