Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B7CC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHvE9KdNsby4sHCddzcTTAl5JGIGZZ6vBvIrbRG3YdE=; b=FICA4ofcQCYacvxliizzz6hO4S
	qmokaR7BTxFSX09WQ+4fFqI1yF1UJnY2mHYxwSwnBDxhObXaa+hLhATqRe9LRgO2q0nvxNia/tLC5
	yMLbo5WwbOC4ym2Xz8+OA4DFCvk8IK4d82XrAexpcPo1uEvfI79UV2S5j+k5V2kDnrg9lphaUA69x
	aeePw/d4qi3dYbfmn2VQNgt8ciIM2jxK2EW96xo84X8p3TpgRo2wqjBtbvH+8zsSE22wh5r2LtMcB
	xlcLT54NSVrl/gKDmh8yGHchgnyfVEXfxPYpQ10kFLrpy5ZZQDs2HUYfwFWxGGO9r/IbBWX9NHkrw
	th+dRdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6D5-00000001oqJ-41BT;
	Mon, 17 Mar 2025 08:52:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6AT-00000001oBt-0uu1;
	Mon, 17 Mar 2025 08:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742201391;
	bh=1rfFLt1FGwRgYWw/LMCOw039hfCefer9lrU++Y7m7yQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DHO7A4TzNIY+kl7FjgK92H8XgzGX5OK+PG92cDnJsYXUKg79N/I2KtlUzLpcFN3OZ
	 xGVtDl5g8o9InTjieFWFOHsp9jKiL99tZEHE2yImw1eLFOAIOKU/n/zw/EuFiI4ZNg
	 bf0cs3Je4lPc2GVdirmD8RKUaKyYderkv0lZD/ac38d5gAq8qbj27yBgip9Uf6ii0o
	 2nrCkJwtql8o376/PNVzvuQtOqlpKMH/cUkU+VdwxtAi2llJjMLE2S3awcaLMuaSJp
	 /vcHRnd96R3bOYqenrWofpH4LGBQ3OQorx/9t5m4wGC9YUq0EKwKklQQtQy0TL0lNm
	 aTBbzanb/LRiA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3565D17E0848;
	Mon, 17 Mar 2025 09:49:50 +0100 (CET)
Message-ID: <e217363f-5492-486e-8063-8e3eed047b00@collabora.com>
Date: Mon, 17 Mar 2025 09:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-5-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250314173858.212264-5-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_014953_410771_186CF367 
X-CRM114-Status: UNSURE (   7.65  )
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

Il 14/03/25 18:38, Ariel D'Alessandro ha scritto:
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
> Address Extension", which in Linux we've called "mali_lpae".
> 
> This commit adds support for conditionally enabling AARCH64_4K page
> table format. To achieve that, a "GPU optional quirks" field was added
> to `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

I would've preferred the LEGACY format to be a quirk, instead of AARCH64, but
okay.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



