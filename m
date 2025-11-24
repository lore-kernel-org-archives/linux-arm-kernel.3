Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69769CFD345
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tT3hJS80cNjtdeK1a1hTCAW6GUTi3Z7+AdwEEe81LCI=; b=VzYKklRqC/ZA1Z2+0EIV1qSH0u
	k5V18KtfhiRSsQa7lv6RdwOrzkM+NW7LaOss9JgvQh0W7n3sLEdNuz8EfdSkLjy4yaT5DZ9Kv5F5l
	D+rqFwjjqNPV2jYoebNpXBvvxnkNC4fpc0KENiOS9pbssSdNVgsbnxiDKGgga6v5O0CfM388HmadS
	xd1H6ZGSGbAfsDy4Ei6vv5rsQjPCjxgJSPokKWFb+HxkcPa1IUPtEjkpWnqPrg3Lg2gTyrI9pSIvc
	ALgb8zvc5ai+KSThKzQitkX02gh7aprFDwuIJtEyld6PcBPawYhVaNUrf2Q4yhxBaEhHB8yT/QHen
	WDiFWrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbFZ-0000000CB0N-1nlU;
	Mon, 24 Nov 2025 18:25:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbFW-0000000CAzg-3AKP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 18:25:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4775ae77516so45300445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764008717; x=1764613517; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT3hJS80cNjtdeK1a1hTCAW6GUTi3Z7+AdwEEe81LCI=;
        b=iL+j+91D/uno1IU/VD6uUb90j8JbPmw1QiYEmTpZFJ2b4zONTK4sRnQ/uk56RU4B4a
         d/ZkdtGWWSTys6UGwu/SQKurOu4ZenSHK2dTGM30NRPBaSAgdLUpTD51xsLmS+Yw+xKI
         mVqobcEZTdtQnVGJh46o/eOA9CY+sOc1/5/Fz29AW1ztTqrSrO1UTjnn1DyycFw8U+d6
         d0+oojkNOFfTZc0dOuB4ejvTHhQdd1ZK6S28vNzS4KLXmwAuxnB3jtnQIH3DmgLs/cDc
         zJ1VI5STas73axofiv78QIngwkEJNYHZgRWzGgNIvNrHR/sYJ6q16fkq/5qnY5jK5Fqe
         zSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764008717; x=1764613517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tT3hJS80cNjtdeK1a1hTCAW6GUTi3Z7+AdwEEe81LCI=;
        b=IsZp0IC/BWTyRUR4pZ4tlnq6/p2NfpyKIf5YRwfA9AcgVe1/NX97ioV+tpvTVzmVoW
         8lGdaneHJnWY6w1ICdIFNFbTLDiiq12eYIGNcsfIKK6FaNtsoBFyp6QTyEvXV+PpH5AM
         L1ZXAvGFnJml3uat4/8IP7Y/PJmE1ZaIoFrkZOShnIzLKxuh++1Vp/fYn5VSz5zPMagu
         PlcIN3SC2kpBiyvPngT9oQmKmPb4gXm7DXMuGIZJoa0Q2i/9LGGUiMa03o6VD6DamiKG
         qJjDCyQnMKeqeTZJ/yQRqoDViyjEqJA7QAnfr6cmx4e1Bzbz0OBpHDOjN1DnvfDiNWRU
         n9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVS/X5SLcM2/kQ+EAB+No+jqp/IqiokzU1xxOniS0edC1pEMG3m/ydLINKzY6Qrwm6HnuDP4/avXJJf26mRCoX8@lists.infradead.org
X-Gm-Message-State: AOJu0YzlUBuOnyKLn885QKJNuWsPOezkMlerLR3YlxxlATyv/nAL6HmF
	GolDR334AIb/EMWaIb7og0aSsmCLefLOQp+njV6sOKl/tEfzMKAqvFsnNy2GdS6hM3I=
X-Gm-Gg: ASbGncsK7NsKw+8/uC46CGiBucsCiASHTIMv6DeHeHpMjcoNCocDd1FTLxKfyUqJrSO
	DKWvz02GvN/bOCartPLf0REzvFFXhwZ7e31kHinTgoxOY89Bu1O15Fqkz1gpf8VmhXYEM+z1XOw
	Sf/k2su0YF/Ts8N61OXF7QNsW5MiZFtS8X1ohY168GxDEggXQGTLOdh3R2SWq/USrzK1gRNAnFf
	HW82pGvDNZ0Y4LKpTzZh9ydZ56g2ostOR1vrogKNhB6m45SdeUXBgJ4Piy4N9lUERdkMPFhMegm
	RmXUuC80dehoz9hQu1KV4+KnlJP4krxRiGGhC7iLPBp2HZlpLK+kBSyjmlMxKIRFJULDBy5bcHx
	whUSKBgycE/xGfb2zNyD/d4mfKr08XwPPz5zdrzoWZTPjSZ5Bzb2c/fLC6U6ccJafX4p4zCRDNq
	dnpGC/WUddlVSMO0tsHN4SGTpFFxZEKiUogpjPGw1vCTguPe9l/upE3xf7EG/t865dCA==
X-Google-Smtp-Source: AGHT+IEp/+xfgqCCD0AdpFxMvmOtmfqswl3tOTSPHA1XXl6DHcUQiOYz7lT/1lNZ+sQorO1fAsI5XQ==
X-Received: by 2002:a05:600c:4ec7:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-477c1138445mr126058885e9.35.1764008716859;
        Mon, 24 Nov 2025 10:25:16 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf1f365fsm209857255e9.8.2025.11.24.10.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 10:25:15 -0800 (PST)
Message-ID: <24a5bd31-a79f-4f18-a190-6a4d886a29b2@linaro.org>
Date: Mon, 24 Nov 2025 19:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] thermal/drivers/mediatek/lvts: Make number of
 calibration offsets configurable
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 wenst@chromium.org, fshao@chromium.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
 <20251121-mt8196-lvts-v4-v4-2-357f955a3176@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251121-mt8196-lvts-v4-v4-2-357f955a3176@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_102518_855217_589FB3C1 
X-CRM114-Status: GOOD (  21.22  )
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

On 11/21/25 12:16, Laura Nao wrote:
> MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
> supported by the driver rely on 3 bytes. Make the number of calibration
> bytes per sensor configurable, enabling support for SoCs with varying
> calibration formats.
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index ab55b20cda47..1c54d0b75b1a 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -96,12 +96,14 @@
>   
>   #define LVTS_MINIMUM_THRESHOLD		20000
>   
> +#define LVTS_MAX_CAL_OFFSETS		3

I suggest LVTS_NUM_CAL_OFFSETS then below,

> +
>   static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
>   static int golden_temp_offset;
>   
>   struct lvts_sensor_data {
>   	int dt_id;
> -	u8 cal_offsets[3];
> +	u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
>   };
>   
>   struct lvts_ctrl_data {
> @@ -127,6 +129,7 @@ struct lvts_data {
>   	const struct lvts_ctrl_data *lvts_ctrl;
>   	const u32 *conn_cmd;
>   	const u32 *init_cmd;
> +	int num_cal_offsets;
>   	int num_lvts_ctrl;
>   	int num_conn_cmd;
>   	int num_init_cmd;
> @@ -711,7 +714,7 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
>   					u8 *efuse_calibration,
>   					size_t calib_len)
>   {
> -	int i;
> +	int i, j;
>   	u32 gt;
>   
>   	/* A zero value for gt means that device has invalid efuse data */
> @@ -720,17 +723,18 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
>   	lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
>   		const struct lvts_sensor_data *sensor =
>   					&lvts_ctrl_data->lvts_sensor[i];
> +		u32 calib = 0;
>   
> -		if (sensor->cal_offsets[0] >= calib_len ||
> -		    sensor->cal_offsets[1] >= calib_len ||
> -		    sensor->cal_offsets[2] >= calib_len)
> -			return -EINVAL;
> +		for (j = 0; j < lvts_ctrl->lvts_data->num_cal_offsets; j++) {
> +			u8 offset = sensor->cal_offsets[j];
> +
> +			if (offset >= calib_len)
> +				return -EINVAL;
> +			calib |= efuse_calibration[offset] << (8 * j);

May be worth for a comment here, ideally a separate function to clarify 
the code

> +		}
>   
>   		if (gt) {
> -			lvts_ctrl->calibration[i] =
> -				(efuse_calibration[sensor->cal_offsets[0]] << 0) +
> -				(efuse_calibration[sensor->cal_offsets[1]] << 8) +
> -				(efuse_calibration[sensor->cal_offsets[2]] << 16);
> +			lvts_ctrl->calibration[i] = calib;
>   		} else if (lvts_ctrl->lvts_data->def_calibration) {
>   			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
>   		} else {
> @@ -1763,6 +1767,7 @@ static const struct lvts_data mt7988_lvts_ap_data = {
>   	.temp_factor	= LVTS_COEFF_A_MT7988,
>   	.temp_offset	= LVTS_COEFF_B_MT7988,
>   	.gt_calib_bit_offset = 24,
> +	.num_cal_offsets = 3,

LVTS_NUM_CAL_OFFSETS


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

