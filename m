Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E46C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiomPRoehPP/Pd6s0e/rzZMKhGmqOUjksCImVbGuUDc=; b=M+XgGPQ0Bhk0jVz8MytGMRafeE
	0GJ8g8yiMnnvMWvh9wIv4dh0k9CBidKRKMJlffOcjN2Ij1vcvq9Q1ZJKOLN6afLVU9qyF5cU+duB+
	tWobIJmh6//52J51nDC4oQCOzWo+EwOEPefRPfdyo3L12FV0FPLqrocchOwhkkKIZ5kQq9YBZkXfT
	uRZ1+yFiXKDeu60Doz1aXUxT/rEyGl24fFbY2m17JTd9D/Tl4NeIjBS1wLWbv6gAv7FDlTDG2S3s0
	e0A5Qn22QuDXLPcKx5ugxkPMSRiQT0UEGmSnoQOMbEBsDphxKxLQn8HPoQmnj5ycpkqU5rxsyr/Ju
	NP+32agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkRJ-00000005AMD-3p24;
	Fri, 01 Aug 2025 07:44:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkC7-000000058KK-23ff;
	Fri, 01 Aug 2025 07:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754033325;
	bh=EMVwpG37bgqFGohQRsO75cPRK1G/rDe+DuVSBLIxMoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rv/vt5CWaBk8BqZWNiED+VbmzHUIAXxWMxdTcUPLrmLi10vKiAtp1cKRY+V0iE1ZD
	 PaPec3XSKqyv+KDbm6EE45aF1txbnslJVvFR8gA1qjPfooxhat61e/KgEqpsgqKUQd
	 SRNx5waZ6VNSvFXqn82bKC++hZDC2ATUsPnpx0lZx7VbibglljfcpJQu6yYlMEHQLr
	 C1UaOsXc8OR9TxTUKihAhw6Aauty/tNKioToAT2jcC3JsMQGzboCe77M0tq1GXOc6m
	 G56FCbMuA909y8UMBUtc9Kv0fZBLw2bTVb+BDpz/6UkW9YLfdELD9idlmZEptc2IhT
	 dyfiif+0lF9TA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A297D17E1324;
	Fri,  1 Aug 2025 09:28:44 +0200 (CEST)
Message-ID: <fe21aa13-d92c-4f3e-8311-2d75468ecb4a@collabora.com>
Date: Fri, 1 Aug 2025 09:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] thermal: mediatek: lvts: Add platform ops to
 support alternative conversion logic
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: wenst@chromium.org, nfraprado@collabora.com, arnd@arndb.de,
 colin.i.king@gmail.com, u.kleine-koenig@baylibre.com,
 andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, bchihi@baylibre.com,
 frank-w@public-files.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-5-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-5-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_002847_708654_8E8E149C 
X-CRM114-Status: GOOD (  18.25  )
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

Il 30/07/25 17:21, Laura Nao ha scritto:
> Introduce lvts_platform_ops struct to support SoC-specific versions of
> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
> 
> This is in preparation for supporting SoCs like MT8196/MT6991, which
> require a different lvts_temp_to_raw() implementation.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 46 +++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 8398af657ba2..6e4a35ecaf34 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -125,8 +125,14 @@ struct lvts_ctrl_data {
>   			continue; \
>   		else
>   
> +struct lvts_platform_ops {
> +	int (*lvts_raw_to_temp)(u32 raw_temp, int temp_factor);
> +	u32 (*lvts_temp_to_raw)(int temperature, int temp_factor);
> +};
> +
>   struct lvts_data {
>   	const struct lvts_ctrl_data *lvts_ctrl;
> +	struct lvts_platform_ops ops;

You can constify this one - but then there's something else that we can do here
to waste a bit less memory.

	const struct lvts_platform_ops *ops;

const struct lvts_platform_ops lvts_platform_ops_v1 = {
	.lvts_raw_to_temp = lvts_raw_to_temp,
	.lvts_temp_to_raw = lvts_temp_to_raw,
};

static const struct lvts_data mt8195_lvts_mcu_data = {
	[..... stuff .....],
	.ops = lvts_platform_ops_v1,
};

....and goes on the same for all the others.



>   	const u32 *conn_cmd;
>   	const u32 *init_cmd;
>   	int num_cal_offsets;
> @@ -300,6 +306,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>   	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
>   						   sensors[lvts_sensor->id]);
>   	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
> +	const struct lvts_platform_ops *ops = &lvts_data->ops;

...then here, and everywhere else, it would be just

	const struct lvts_platform_ops *ops = lvts_data->ops;


After implementing the proposed change, exactly how I wrote them:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo



