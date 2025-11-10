Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87DECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFcBbXPwvkiMGC/UX+vL3kGptND9Aa39FQ9X5eJiJ0I=; b=eeI8AnyMnfwnqer8xLIOFK49xH
	Z1UUD5sQgE+viR1d+VWPDeKLbqR1rgAlkhqm/eatUTMmQXsV40n+IEyis1O77LL2Ges3kyD6MAEU0
	TIx+c4R/De6hyTJQuwAJUeWSxVks+USx70FS33oVc+HMhj/6Il8lUoRlKg5L8H5jpqqhMdVOfEDZb
	8UEDYpAyzS77edjFzEPkxBQn9IIAJ4Wm/laDk6je2Cwe5KzLCWZIo/zE/j22J3apyANZ0nJ/Z0Ce6
	GyqHHUL32uSNFiZpfoliT/GybWLh3EBOKd0kFJA5eOMsEuVEGkXjEybdYi2mUpnp5Rvem0TlzkFeZ
	+fLaK1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRb3-00000005SRz-3qMH;
	Mon, 10 Nov 2025 13:06:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRb1-00000005SR7-1xUH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:06:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47755a7652eso19945105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762779969; x=1763384769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFcBbXPwvkiMGC/UX+vL3kGptND9Aa39FQ9X5eJiJ0I=;
        b=YtGdcGNc+zK+LVeEimyfktnRP7zj/wZu5o2duz+9ykD7o9Kl3e27Ejsvhlsd6SO3QZ
         Igv+mbohT22zNq3q02/3967qjT4egIzazKnqPJU5GBdLbQQGVMxIpQcrVumL/O7n49oK
         MR0tVakIXr3rTGst7IYmH2LUh22kJSnlcqUY4QyN5ea2epvjk5LBDNzFEZHXDH6c0SbF
         LbW6uf/EeS2cRlNUD+l6+MjHcFBhUVah+9VtL50u3DOtg5/15jvv3BcPSZXG13e8OHLi
         Knfv46I37hylR0Y3MFIXd4OrDEk84HqH1ZH2xRcuhdpmJeBN365ky00VIVJ0SMb5kQ9w
         BWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762779969; x=1763384769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFcBbXPwvkiMGC/UX+vL3kGptND9Aa39FQ9X5eJiJ0I=;
        b=VDbAkQa3q5TGtXwtuAgMNdLkI16ds9u/cfd7s0s8fFeBF7B5l6e3zSWBFy7MpqByih
         N+ZZ0Gu/tBLuqrTIGEi5PWeGreIjyHJeyZAtLyvc+6V/02xhwRFlR8lLbeR/xh95htyv
         h4j6wIKD6PAeGvRyXNfrUH+t0k5ZvVApt8pMhKKZHSWmZIeawdU26Rfhdn9LLgKTprtX
         8te7cwSCBC1wrdDlQDr6BeKDzfIXjVwDcuyaF/Oj2nSYID14Ceauulu7aPM0uFjBQK8s
         x4cD+PsiWBADyMAf+DyXQSJfFmEBImhypuRZeNo2EqBQSO05cGaJsL7jmpvUFQNMwUmI
         lRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUi9zbfXHLS0eH8QakADqS2XexQGCgLdwpWwB21RZ8uR0/Y/vBHenBovVlLFkjgAHtVMlKVVAssENWoV1ZCNLk@lists.infradead.org
X-Gm-Message-State: AOJu0YxRCUI7VZGuqzq9r6YS3wdw22i6/mCCAQZhzRhV2+lo18oGgOg0
	YDTly3DIZ2Es2sOZl/sNa/a4ulKCvnF5kbU+4cvZaz5KtSSwO6HkibJ6OjNBxAizMuM=
X-Gm-Gg: ASbGncsZ46aNpUVa5qZMyIzdB6iQu/BnNK8ipP2cHTkqHilt9vmZl7UG+FQ00JCeK6v
	aFeakzTACm6m1cdv6JMpaQsu6GTjksFPpDfgOrq0E6l+bTcaQhTWvnbvlX3gezb48Kmd2AJ/fur
	lumSxyl6M/yhhz63XCcyoimx4ZQL5dGaT8AhkMrcsL+sVNTDgR0kLFp15hLIUit41aRbpWETPRh
	F//Dz6N8V2pRouyq9ei+A3t/B5YZGIYFqINlY40Knad6oFjYyO3mtQtPel2JTVhTfD9T+iyZZ1V
	52ef6qBhdkOY8Thf9Cs62WmRRap+4udx1rOi7HgL8gP8wN4FYZAGsQQ8kWydYLoVpuEDLxE+Vb7
	2U/q2Hq42zUOgAmcJNo6RLoewfeRFbKG/ujPnvOdfPd1CyWAnQqjm7UDo4548/paVePDeEALV2w
	z0AHIig5lZbeB2T1ijhjAWiPIXaGWy90iPwMq4fAGKHpktJXahuCiVrGc=
X-Google-Smtp-Source: AGHT+IFtXNJpzD2gW9iSn0NztWrLxTZvcOLBaFBOCFqkmNRmqw71Iuc2gfKNjESDEOfAEahNU8T56w==
X-Received: by 2002:a05:600c:4f8b:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-47773271a62mr83156425e9.23.1762779969396;
        Mon, 10 Nov 2025 05:06:09 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4776bcfcfc7sm240169015e9.12.2025.11.10.05.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:06:08 -0800 (PST)
Message-ID: <1e0545da-5d24-4ca4-863d-0d5671902d0b@linaro.org>
Date: Mon, 10 Nov 2025 14:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 4/9] thermal: mediatek: lvts: Add platform ops
 to support alternative conversion logic
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 Fei Shao <fshao@chromium.org>
References: <20251016142158.740242-1-laura.nao@collabora.com>
 <20251016142158.740242-5-laura.nao@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251016142158.740242-5-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_050611_578242_CF516CF2 
X-CRM114-Status: GOOD (  18.77  )
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

On 10/16/25 16:21, Laura Nao wrote:
> Introduce lvts_platform_ops struct to support SoC-specific versions of
> lvts_raw_to_temp() and lvts_temp_to_raw() conversion functions.
> 
> This is in preparation for supporting SoCs like MT8196/MT6991, which
> require a different lvts_temp_to_raw() implementation.
> 
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 27 ++++++++++++++++++++++---
>   1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 4ef549386add..df1c0f059ad0 100644
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
> +	const struct lvts_platform_ops *ops;
>   	const u32 *conn_cmd;
>   	const u32 *init_cmd;
>   	int num_cal_offsets;
> @@ -300,6 +306,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>   	struct lvts_ctrl *lvts_ctrl = container_of(lvts_sensor, struct lvts_ctrl,
>   						   sensors[lvts_sensor->id]);
>   	const struct lvts_data *lvts_data = lvts_ctrl->lvts_data;
> +	const struct lvts_platform_ops *ops = lvts_data->ops;
>   	void __iomem *msr = lvts_sensor->msr;
>   	u32 value;
>   	int rc;
> @@ -332,7 +339,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>   	if (rc)
>   		return -EAGAIN;
>   
> -	*temp = lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);
> +	*temp = ops->lvts_raw_to_temp(value & 0xFFFF, lvts_data->temp_factor);

Don't do this in each functions. It does not help for the readability.

May be something like:

int lvts_raw_to_temp(u32 raw_temp, const struct lvts_ctrl_data)
{
	return data->ops->lvts_temp_to_raw(raw_temp, data->temp_factor);
}

or

int lvts_raw_to_temp(u32 raw_temp, const struct lvts_ctrl_data)
{
	int temperature;

	if (data->ops->lvts_temp_to_raw)
		return data->ops->lvts_temp_to_raw(raw_temp, data->temp_factor);

	temperature = ((s64)(raw_temp & 0xFFFF) * temp_factor) >> 14;
         temperature += golden_temp_offset;

         return temperature;
}

... and get rid of all the lvts_platform_ops_v1

(btw _v1 is confusing, it suggests there multiple versions of the same SoC)

[ ... ]

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

