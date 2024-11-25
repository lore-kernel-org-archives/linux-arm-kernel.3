Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79BCD58D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yNjBXQjq6liqwCoyTJ8H2umWraPjyjY3kFyRCIZqPQ=; b=hyPjN0bdDi5F6XRUsmzNGsePP+
	zA+g3twoDWcpc/oc/8WOT7FgYWj2WhYJx/52b78LznwtF4gbclw9mlyNK0OUhXJLUbouqQ/PsqppW
	StK5Nyzv2B7cWNJvRcwgn6yIdPkMwW3ZMDEbjF2wB/6jYzDQraNTE13rIO0UwCfB4KVJv6s7N3VnP
	qv5qkIOQLC5+yY5xkDTTm7R45v7ocuxgLyh5/twmNKyxEVz3OPzVWg7INCjTZ+FCE3zSPIEcAbGBy
	T2SlNfsv4LOJxAFdBzN5RWDSObbuZptiSxcAAD/DpHijSs6mysGGANlRE/WHHEp5tdAJtucOGkVit
	V08Ua1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcNv-00000008gEn-3Xg7;
	Mon, 25 Nov 2024 16:56:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcMx-00000008g2b-2kXb;
	Mon, 25 Nov 2024 16:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732553724;
	bh=g7ZFlFRwgvLlLhUGEJJ8enN5gy7+MkcR980Ufjiw3N0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F8ckYirKSeB1nSa/dAQa+nGHYDN6IFCY2QLCzMNSq7/dlav3MOXuwyvaMi9j1FxIw
	 8VGqeXiqYUMGsUQy/nRSgKlBqc/p4zpNI9GESE6g2skvZbqW3UeqbiDS6fq2EFmLqY
	 7/I+Dud7vqPzeBRhPevUAOgsfE1Y6fiol+JZ5wkfjnHOpFssXl3A/9ChHGZWPpkXYA
	 sFZZS5z05n8vpifBuQgwEvF93qDvgpIXbz4DMfvGghnXdUCgeHqMmzeetJ9fdQ31pk
	 VKH3PWyJ+a7BVqlqcM0+kXSFhKLLDL21nwzEehBgGRqQWcAz88mqM6MJoZ2HNSww2n
	 aMGx/GQrEBJOw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9CF617E376B;
	Mon, 25 Nov 2024 17:55:23 +0100 (CET)
Message-ID: <15864b39-c68d-4240-926b-87d5d3876c8c@collabora.com>
Date: Mon, 25 Nov 2024 17:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] drm/mediatek: mtk_dpi: Use an array for pixclk
 factor calculation
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-4-angelogioacchino.delregno@collabora.com>
 <6e07043e70111920848cc3d22e5c60371c0fb65d.camel@mediatek.com>
 <120c65e7c21821a72fa5165e578cc1c39cf0c864.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <120c65e7c21821a72fa5165e578cc1c39cf0c864.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_085527_850655_BA91916C 
X-CRM114-Status: GOOD (  14.61  )
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

Il 22/11/24 07:23, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Fri, 2024-11-22 at 11:54 +0800, CK Hu wrote:
>> Hi, Angelo:
>>
>> On Wed, 2024-11-20 at 13:44 +0100, AngeloGioacchino Del Regno wrote:
>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>
>>>
>>> Setting the TVD PLL clock requires to multiply the target pixel
>>> clock by a specific constant factor to achieve the target PLL
>>> frequency, and this is done to reduce jitter to acceptable levels.
>>>
>>> On all MediaTek SoCs, the factor is not retrieved by any real kind
>>> of calculation but rather by checking if the target pixel clock
>>> is less than a specified frequency, hence assigning a function
>>> pointer for just a bunch of if branches does enlarge the code
>>> size for little reason.
>>>
>>> Remove all SoC-specific functions, add a structure `mtk_dpi_factor`
>>> that holds a clock frequency and corresponding PLL factor, and
>>> declare the constraints for each SoC in form of an array of said
>>> structure.
>>> Instead of function pointers, this structure (and its size) is then
>>> assigned to each SoC's platform data.
>>>
>>> The "calculation" is then performed with a new static function
>>> mtk_dpi_calculate_factor(dpi, mode_clk) that iterates through all
>>> of the entries of the aforementioned array and returns the right
>>> factor.
>>>
>>> If no factor is found, the lowest possible factor is returned,
>>> mimicking the same flow as all of the old per-SoC calculation
>>> functions.
>>>
>>> This commit brings no functional change.
>>
> 
> [snip]
> 
>>>   static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>>                                      struct drm_display_mode *mode)
>>>   {
>>> @@ -529,7 +550,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>>          unsigned int factor;
>>>
>>>          /* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
>>> -       factor = dpi->conf->cal_factor(mode->clock);
>>> +       factor = mtk_dpi_calculate_factor(dpi, mode_clk);
> 
> mode_clk is defined in next patch.
> keep mode->clock in this patch to keep my reviewed-by tag.
> 

Oh! Nice catch!
That happened during the final cleanup, heh :-)

Thanks btw, I will fix that in v2.

Cheers,
Angelo

> Regards,
> CK
> 
>>>          drm_display_mode_to_videomode(mode, &vm);
>>>          pll_rate = vm.pixelclock * factor;
>>>
>>> @@ -964,48 +985,6 @@ static const struct component_ops mtk_dpi_component_ops = {
>>>          .unbind = mtk_dpi_unbind,
>>>   };
>>>
> 
> 




