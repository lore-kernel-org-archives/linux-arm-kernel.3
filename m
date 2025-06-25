Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F236FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4Q3XUg6mnWivyzUnSGdcZM/aknf6tlaSlyzdrGZxGw=; b=O/B3u6YsE4GtWx0T2ym7GwvrAZ
	YqcgB3d2JGCEBqsZlsNFNh1p6BZZtCs/6hZYctsaPZylCLBzOwQ9IKHqO6fDa3m89YznPpSiirnJo
	YRLI+FlE/fup0Ef1+FXXmPUivt8HCj744EvtuQ38m2xnNRKfub3WjQ8qXnT4wj8jd02kF1Vv3N4SQ
	zqfdX7BzOM9Tl0CoiTHbl7sSQ+UpQ5YvsTp8mOyzM4dU6UtjbxbLLrsdra2HPLGOvpvIGZD2LaxSA
	5YTvjoGYinjD6Tl0zSDMvXPj4rdaiD7jWKoElOh+3/k/IrxV/34Mg4THcQlYdoFFZ+j6jGmbt1Mhb
	8Pfa1HTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVor-00000009kku-2FWZ;
	Wed, 25 Jun 2025 19:30:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQOi-00000008qTI-0AP9;
	Wed, 25 Jun 2025 13:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750858962;
	bh=9Qc6KYO7RtqwQsPT7/J6J3b4FamcfNGBV+14cCp2izs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XpckavdawoX1DCh43/Am0LH/gsqEKUZj73AImthw2dp6FK0lU4hvB9PXTBn5usVvQ
	 YdodQs+fr4Vjhjj6SvrvcKUOr5aJWu7qpugh6iLTl93WQD1xvnNhUV+DecA6QlDIde
	 hezEBgKbPxlLgSLzOOI5rZLz75+ZzqFD45culiYggww+8HBLhZqFK5l/PB0CdXcj6N
	 ePPtPmEHR66MW5jxy+hWm7O+ITy4JCHGoXJeAeK2ZdFtiCIMu6AST8NJJRPKSFRw1Y
	 CQyopfFIwQe4Gsn1Ywf4WQs6tgIs9YGG8mJZhykiKn4YNzP8p+2vp5G2kTXLDKJkxT
	 LGomKnW8T0tRA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D7C017E0CE3;
	Wed, 25 Jun 2025 15:42:41 +0200 (CEST)
Message-ID: <4fc2d5d5-61a5-49f1-b381-4ada37cf3c20@collabora.com>
Date: Wed, 25 Jun 2025 15:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] wifi: mt76: mt7925: Fix null-ptr-deref in
 mt7925_thermal_init()
To: Henry Martin <bsdhenrymartin@gmail.com>, huntazhang@tencent.com,
 jitxie@tencent.com, landonsun@tencent.com, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Henry Martin <bsdhenryma@tencent.com>
References: <20250625124901.1839832-1-bsdhenryma@tencent.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250625124901.1839832-1-bsdhenryma@tencent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_064244_234251_91CF4C95 
X-CRM114-Status: UNSURE (   6.43  )
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

Il 25/06/25 14:49, Henry Martin ha scritto:
> devm_kasprintf() returns NULL on error. Currently, mt7925_thermal_init()
> does not check for this case, which results in a NULL pointer
> dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Fixes: 396e41a74a88 ("wifi: mt76: mt7925: support temperature sensor")
> Signed-off-by: Henry Martin <bsdhenryma@tencent.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



