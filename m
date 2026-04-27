Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B919FFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2h8blBSrwRFFIylxjD5SoBFjJEMtlWyFl4+2ryE3Mc=; b=ALUBpwItRY8NVGTHHNcNP7Uphu
	xn+3Q3ahw9GEkNEylRV9e6IFRlJkuG2syQlkHBC+8PHsCzuye4yopXXerFkJaOm/5PZFWGRzH2PTt
	bSrb/tiJX2AvBe1Eb9AoyQj49O52Op7qldqtp5jZUd/6I2ILryGDLlYhg1DkaKLdXUe7FARoGq5DA
	QH7DWskSQPPO662Acrr2NmRVnIPAnkuP56UZnsTH4280xA2N0Ew0SPsWy1gkKU2WEeWmZbEmwQDfz
	/bK7SsmOj4uVPZy+hTsZp/9DMWV7VmJ8TK+Iq+3MgzSLvPkXznvT6LCi1XtqFPMpm5auPZwI+ls6d
	Os0oaFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOzy-0000000HNcF-0NkA;
	Mon, 27 Apr 2026 16:39:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOzu-0000000HNbn-3oGN;
	Mon, 27 Apr 2026 16:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777307985;
	bh=f238bjapOZ8zpcnG+Q+ZHGREX5Zx5UvSKClStNdPxjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BHF9E5yZ2esbtbd4p4gLa4dp9X79XhbP8MMTNq1IVqdI/jUxRqbEr7JFQv0Xkg7Ff
	 yHpwPcmXQjEndOP/JJEWOc2B0jW50tvR3vqEbPaC+onIYVIACbp60JckRTDzR20cB3
	 gxa1XL8+Wd5s2TnaSVfmuuS821QEErQLKodgbN/9ckxZ88OdQYFOwXLEpxewiLY9GK
	 HYZ1BLKU4OAFF+CPUfuAHutyfh3/ARPS1+mmHwy9WDh2SjMM7J7VAsi9qPYD/w0sra
	 wWHncdgXBicN0mN3o44yKCHZS95QepzhbC3Hf7BzmX7Za9yowxfhBM5G72xPE5/oDE
	 LwajlnH5tEhzw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B9F417E0F33;
	Mon, 27 Apr 2026 18:39:45 +0200 (CEST)
Message-ID: <d3b5239b-e3d9-4d81-9220-d6057d670ff3@collabora.com>
Date: Mon, 27 Apr 2026 19:39:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] drm/bridge: dw-hdmi-qp: Add HDMI 2.0 SCDC
 scrambling and high TMDS clock ratio support
To: Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-5-d778e70c317b@collabora.com>
 <3826043.PYKUYFuaPT@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3826043.PYKUYFuaPT@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_093951_141969_687ADE62 
X-CRM114-Status: GOOD (  17.19  )
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

Hello Heiko,

Thanks for the quick reviews!

On 4/27/26 1:49 PM, Heiko Stuebner wrote:
> Am Sonntag, 26. April 2026, 02:20:17 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) by adding SCDC management
>> for the high TMDS clock ratio and scrambling, required when the TMDS
>> character rate exceeds the 340 MHz HDMI 1.4b limit.
>>
>> A periodic work item monitors the sink's scrambling status to recover
>> from sink-side resets.  On hotplug detect, if SCDC scrambling state is
>> out of sync with the driver, trigger a CRTC reset to re-establish the
>> link.
>>
>> Reject modes requiring TMDS rates above 600 MHz, as those fall in the
>> HDMI 2.1 FRL domain which is not supported. In no_hpd configurations,
>> further restrict to 340 MHz since SCDC requires a connected sink.
>>
>> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
>> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 188 ++++++++++++++++++++++++---
>>  1 file changed, 172 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>> index d649a1cf07f5..c482a8e7da25 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
>> @@ -2,6 +2,7 @@
>>  /*
>>   * Copyright (c) 2021-2022 Rockchip Electronics Co., Ltd.
>>   * Copyright (c) 2024 Collabora Ltd.
>> + * Copyright (c) 2025 Amazon.com, Inc. or its affiliates.
> 
> I have no real clue about the inner workings of hdmi, but that line
> does make me curious, because no part of the patch authorship does
> mention Amazon ;-) .

That was intentional: although the code was written by Collabora, the copyright
belongs to Amazon.

> Also I think "or it's affiliates" might be way too broad, because this
> can be essentially everyone. So noone in the future will know who to
> ask on copyright questions.
> 
> Similarly when _somebody_ comes forward with "I hold a copyright on this"
> no-one could verify this claim as well.
> 
> I somehow expect _one_ entity being specified, not possibly hundreds.

Hmm, I followed the wording already used elsewhere in the kernel tree:

$ git grep 'Copyright.*Amazon.*affiliates' | wc -l
93

There appears to be only a single instance that omits “affiliates”:

$ git grep 'Copyright.*Amazon' | grep -v affiliates
drivers/power/supply/max14656_charger_detector.c: * Copyright (C) Amazon Technologies Inc. All rights reserved.

Which was added nearly ten years ago, so I’m not sure it makes sense to adopt
that form now.

Actually, this seems to be fairly common among other vendors as well:

$ git grep 'Copyright.*affiliates' | wc -l
1014

Regards,
Cristian

