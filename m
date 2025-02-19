Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0378AC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPFWXIiLXlI7pv8Al7beqruu6dIXxAx15gMOVAMfEgk=; b=vVaX+fzVqKwqPZqJEoP7+aiEVd
	IRcrY0d7RJdfhTyUlP2skRJ6iwU7v+om1QiJFK3WoJanpXd/he8HwQzM9S3K7qWBhQuRTsdM7NiTS
	OIA5tueI0afkvJD9oP0tlBdsB6bpJIsKxXZc/JIGPcXsH5btjDgTAsBU4otpfa7ck6UxvdyYx50qJ
	ffY3z55r2aJsnun/vDg7isHXn60uasywkK/l7ryb1cExqkJUr7PV5p6f+g/chxRbtwlP025/ZSGoj
	rhI9azViWcXFryI5StIiqJ6N0gP2l/kB44GJX86nuttLQKE0oLSmdDp0YlAd5xsFauePlDmfRKuxm
	HyZY+ZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjdW-0000000Co5J-10yH;
	Wed, 19 Feb 2025 12:57:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjVy-0000000ClHD-01PE;
	Wed, 19 Feb 2025 12:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739969360;
	bh=V/WEvuBRuTT45uwY1xRUJn103l1/KNoD2naTbW/Fd10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cK/vZpERB7nKL4xb6kb9RHN1i1yY2D6BWmuvV3dLZm2n7ENfEF/H3GrtIS/pVIH7V
	 h1VZGWFoXWuksKUT7gy9lX+sIbxe9Itm+ZqeuNOq/O7yIllgfRPuqBHjJXGREVsgA8
	 4kfix8eWWG8k2Sj5rPm1D+UDJaFQPn0gYGAVnEJMxPNq/xsihmTRZ5bg7sz0mFmhu9
	 9oWpVwPckn30yxd0GvrcL67HWaPEPgSLkYHxILxcRvL7tojgvLdWU1hOfrbXMecfBs
	 t/oxnLjdZr7XNoZDskPB0DbANqc8Llfgz6gUkZh23cZjnYeq19tve6JLGzVsDJWcVv
	 BnnMieV1cBuTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D86A17E14D5;
	Wed, 19 Feb 2025 13:49:19 +0100 (CET)
Message-ID: <9d3886e7-f7dc-494e-b77c-1e44e7114d84@collabora.com>
Date: Wed, 19 Feb 2025 13:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/mediatek: fix CCORR mtk_ctm_s31_32_to_s1_n
 function issue
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-3-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250219092040.11227-3-jay.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_044922_245522_0805FC78 
X-CRM114-Status: UNSURE (   8.49  )
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

Il 19/02/25 10:20, Jay Liu ha scritto:
> if matrixbit is 11,
> The range of color matrix is from 0 to (BIT(11) - 1).
> Values from 0 to (BIT(11) - 1) represent positive numbers,
> values from BIT(11) to (BIT(12) - 1) represent negative numbers.
> For example, -1 need converted to 8191.
> 
> Fixes: 738ed4156fba ("drm/mediatek: Add matrix_bits private data for ccorr")
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



