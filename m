Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A254C36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkLZTgUTl0od51OvChnwPqYfzOJOlJAUzehMCgDZQSE=; b=KD2T8kAAzY5fMHhgAOPzP5Slg8
	Jrzt8LUpOsSMVfLY+wLX62zJhAsS2pIGc1eDkKM1IFHMMO9SmHGQh3T6U8B38PyIcUdE/h9qwoM4Z
	gu+xjD5A/trmIpIo9GURyPUlKOwY76RS/zMT0CsJ9lsDX5vv2pjhbs5gp1OGzMS7bAQbefaj6glZt
	b8/W9rymjdkktYvrj++hQBxD9gr6IueD2O1KPNaOEmDjsf6mW6vYTcwxgEypcfEFmrh8P2N+LURLr
	2cw71LKNGqkyjgm8kHOPijsjWHeGD5EqBkdarRWKJgnsCtSe/cBnFOOGpjfgmKkprzlRN9Hg3tu40
	NkwBnlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxoJ-00000006CJb-3chH;
	Wed, 02 Apr 2025 13:07:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxkW-00000006BYV-392m;
	Wed, 02 Apr 2025 13:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743598998;
	bh=QChMnVhP79OYUjktTjNwX0bo36faAS1EdEROK2OJg3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WyXnBZMel3gNh7BZTQeXHJGyXEMggDb6Ha5exyzx+nLrvLq1/B8RHRfUmtj8FypP+
	 Vkz8TII3BK5E3bDvqrYBABKa2/V817tfqeu05lLzur/T741v8UJJgQ8XOFfV1XyxQO
	 8dapgOlOLD7RlL76DvYA2w6TYQFDugIw0p8zbKrzzP3CPTsTxfjxMxRTTaW2M6bpsJ
	 VMk9lbuenzw9Ka9d6cXRQGS33z5ehjZDoRFkJ6D/Vsx/LL1SKbiZg8jIXA0z8QAx/g
	 BjVahbvnUI15ISXLMPlE9SFlieT2Q9UCoY1GwqYJYNre277nqFpvtndNE3fAEJBhwh
	 7QRCXfxXRMXQg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD74917E0385;
	Wed,  2 Apr 2025 15:03:17 +0200 (CEST)
Message-ID: <4d916221-d9ea-4e08-8d22-1be1982323ee@collabora.com>
Date: Wed, 2 Apr 2025 15:03:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] rtc: mt6397: Fix mt6357 RTC year offset handling
 for hwclock commands
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
 <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109-enable-rtc-v2-2-d7ddc3e73c57@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_060320_966463_95B76FB6 
X-CRM114-Status: GOOD (  24.94  )
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

Il 02/04/25 12:51, Alexandre Mergnat ha scritto:
> The mt6357 RTC was failing when using the `hwclock -r --verbose` command,
> despite reading correctly through sysfs. There is high chance for other
> platform to be impacted by the year offset handling issue.
> 
> The hardware RTC registers store years relative to 1968, but the driver
> wasn't consistently applying the offset when converting between
> hardware and Linux time representation.
> 
> This inconsistency caused alarm rollover failures during device
> registration, with the error "alarm rollover not handled -22" in the
> logs, causing hwclock commands to fail.
> 
> The ioctl interface used by the hwclock command requires proper time
> range validation that wasn't happening with the inconsistent year
> offsets.
> 
> Fixes the issue by applying the year offset in all operations:
>     - Adding (RTC_MIN_YEAR - RTC_BASE_YEAR) when reading from hardware
>     - Subtracting the same offset when writing to hardware
>     - Using the same logic for both regular time and alarm operations
> 
> With these changes, the hwclock command works correctly and time
> values are consistently handled across all interfaces.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/rtc/rtc-mt6397.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 692c00ff544b2..ba52e225dc8fa 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -77,7 +77,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
>   	tm->tm_mday = data[RTC_OFFSET_DOM];
>   	tm->tm_wday = data[RTC_OFFSET_DOW];
>   	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
> -	tm->tm_year = data[RTC_OFFSET_YEAR];
> +	/* The RTC registers store years since 1968 (hardware's base year) */
> +	tm->tm_year = data[RTC_OFFSET_YEAR] + (RTC_MIN_YEAR - RTC_BASE_YEAR);

This patch received a NACK because of RTC_MIN_YEAR_OFFSET.

What you're doing here is avoiding to use the "RTC_MIN_YEAR_OFFSET" definition name
but otherwise doing the very same thing that was NACKed before.

Regards,
Angelo

>   
>   	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
>   exit:
> @@ -119,7 +120,8 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
>   	data[RTC_OFFSET_DOM] = tm->tm_mday;
>   	data[RTC_OFFSET_DOW] = tm->tm_wday;
>   	data[RTC_OFFSET_MTH] = tm->tm_mon;
> -	data[RTC_OFFSET_YEAR] = tm->tm_year;
> +	/* Convert from tm_year (years since 1900) to RTC register format (years since 1968) */
> +	data[RTC_OFFSET_YEAR] = tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR);
>   
>   	mutex_lock(&rtc->lock);
>   	ret = regmap_bulk_write(rtc->regmap, rtc->addr_base + RTC_TC_SEC,
> @@ -165,8 +167,8 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>   	tm->tm_hour = data[RTC_OFFSET_HOUR] & RTC_AL_HOU_MASK;
>   	tm->tm_mday = data[RTC_OFFSET_DOM] & RTC_AL_DOM_MASK;
>   	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
> -	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
> -
> +	/* Apply the same offset conversion for alarm read */
> +	tm->tm_year = (data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK) + (RTC_MIN_YEAR - RTC_BASE_YEAR);
>   	tm->tm_mon--;
>   
>   	return 0;
> @@ -200,8 +202,9 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>   				(tm->tm_mday & RTC_AL_DOM_MASK));
>   	data[RTC_OFFSET_MTH] = ((data[RTC_OFFSET_MTH] & ~(RTC_AL_MTH_MASK)) |
>   				(tm->tm_mon & RTC_AL_MTH_MASK));
> +	/* Convert alarm year using the same offset as in read/write time */
>   	data[RTC_OFFSET_YEAR] = ((data[RTC_OFFSET_YEAR] & ~(RTC_AL_YEA_MASK)) |
> -				(tm->tm_year & RTC_AL_YEA_MASK));
> +				((tm->tm_year - (RTC_MIN_YEAR - RTC_BASE_YEAR)) & RTC_AL_YEA_MASK));
>   
>   	if (alm->enabled) {
>   		ret = regmap_bulk_write(rtc->regmap,
> 



