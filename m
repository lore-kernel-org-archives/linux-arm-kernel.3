Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E487CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytqEhAxy/srK4PE5fYXUu+ILxq14nFexjDv6KA1/UU0=; b=eA2Vq54jDOBBkWSPyCyhNDeWUL
	6MYLFB2fKp4CTRSr4o8ozRlYClFsBIdAA/6vLjwbroHFt/treXujnyCp0sv6qukkTFAWKApYLBkAr
	INVxRNIULRzhz/HhO0S0LQD5y7oi/16eJaME1cZYtZXxd6m8hLg8ZUysJwIRxRBGtvVho8qznl/n/
	FgXY5yd7xJbtUAL0fkmMkBmxfcAhj4CxT2DC07IO6AkxXHlD9OYKjFyGslmxzhqNaOHSK7LN5Ar1b
	2haPb0R/OS/yCKScZOIVV7GyBUmzd0mt1/BqWzYb7oGNHjKCdxSx44vFVlW1a90nN9/qcu5IfWyzP
	p1AYxjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Nmx-0000000GyPZ-2j1C;
	Wed, 24 Sep 2025 11:35:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Nmr-0000000GyJg-1zr4;
	Wed, 24 Sep 2025 11:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758713751;
	bh=cwneILn6ZVC29eFS05rUz6lGLlw/AQ/6m5dsiihK55g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WLkIaNPpWRiIekxvXilghkdGQpTr7UPljwSUQQNEy+zQxBZhDdmEl7xtSqm6EYArg
	 EDFH90PlD/WUere4CBQGzMY1VA9HQHBHs2X/xyXG+WAr1RwBJ4qYtA8obudaz7vJp0
	 fOtyIKJxBngqmWSkrMtRV6fMAYwWhYK7o3+Zh6KX3dqa1NtueX109ivMZ4bsl/l6O1
	 7+5nyMDMqY4muqjoHCy8f+kZ3KPX/ucBMm0kAPyg397DDYyJ0dRwJsf36Ee4DssNgb
	 n59KWdu86YleG0oSLiFgcpc2MiWFx2jDhWT0viE8fa0lXoR9ZdFGAA+HGG6KBe74dC
	 tSdfdXfBU5Qfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D9D717E00EC;
	Wed, 24 Sep 2025 13:35:50 +0200 (CEST)
Message-ID: <63be9fee-46b4-4bde-8e42-18966981f165@collabora.com>
Date: Wed, 24 Sep 2025 13:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-5-6cd63ade73d6@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923-mt8196-gpufreq-v4-5-6cd63ade73d6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_043553_706349_1FDB0B94 
X-CRM114-Status: GOOD (  14.21  )
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

Il 23/09/25 13:39, Nicolas Frattaroli ha scritto:
> The MT8196 SoC uses an embedded MCU to control frequencies and power of
> the GPU. This controller is referred to as "GPUEB".
> 
> It communicates to the application processor, among other ways, through
> a mailbox.
> 
> The mailbox exposes one interrupt, which appears to only be fired when a
> response is received, rather than a transaction is completed. For us,
> this means we unfortunately need to poll for txdone.
> 
> The mailbox also requires the EB clock to be on when touching any of the
> mailbox registers.
> 
> Add a simple driver for it based on the common mailbox framework.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



