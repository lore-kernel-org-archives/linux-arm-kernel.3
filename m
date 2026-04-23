Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A0FDEE3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7B9//ZIs2xqUgapk+BAH8bzTkTMhU5fRky03+jOP4c=; b=eDeY7QvthnZEbCI/pY0YH1YuMr
	SilDQMV5JQC2hIUnbZRltm6ypRygK8EqpHUT5psU5L6cC6cx/jtXgAYML1BEryQp7J+cJ+1YDd/q6
	M8bo6HOJ/CO5vR1tlolzEvVoOW4+D3VBo4caFaCP29LGX2Lv7A9XlvVmWmMC9NnUH7ZPHcGQq7s03
	p80zaDqXd9J+xDnnS/z/NiahkgkE31AXiplKv+tA1JeO1pNSbnwcddurX4Ip+rmlT+7rN5/ivzPKD
	MjwEnqg0bGpu/6kB1yVtFqGuW5B7hTdurFwrYpGASyrlLM6w76ZbsZ/GIhZZPbkeg7fOmZYit544N
	+nl6kBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz39-0000000C8gk-1zF2;
	Thu, 23 Apr 2026 18:45:19 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz35-0000000C8gQ-2YLV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:45:17 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7de431da8fbso1491235a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 11:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776969914; x=1777574714; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7B9//ZIs2xqUgapk+BAH8bzTkTMhU5fRky03+jOP4c=;
        b=ZkLg2G5WWugLDLRsA/9By24o14MndiRwzayP7lAP98Lczco/iOKYDZ8Og7wRDkuPmb
         FHNlHDQPnP+lsgSD9IzJya+EWpxlW2s6Q9DEt3ptwRUHxIJgNNRT8yE7T3ZHXldw3IZJ
         R84YB4SrVDHo1TJ6zeSlolsX7aT1yU9fVFW1fU+dtS7T2dkPpDsGfxox1ZHkytAi2joM
         OzHsKmGZU1+va97WfZ+5jmcsL+CKB7uLwp1KfiCx8pPWppbuedVRUkyzmFK67dkYYFRH
         FFRIge2CscVQBJJMpU7u4uBuiXBx6Ti/Vo7ao1iiwwhxxtHD6rDPFXaD7HmgFXjxdeT9
         cqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776969914; x=1777574714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7B9//ZIs2xqUgapk+BAH8bzTkTMhU5fRky03+jOP4c=;
        b=KA22xMMl3XAiZE56pVF03QMabXRyZlJv0wwZ2XEsjHgP5rXUyZjDfmk9ESLNVUYgHJ
         IXkO+jRk88MrLEtDbqeDrlj9CDcMSkHiiOcc0QBB1AsBsWyQz4X925oZPAj2f2mNumq3
         p+JKoaRjvyenCFGBEv1hwAKNWqfKwerLIAfVSI+82x6jPXClOExqOMSSWBw0Qb2dPN+B
         G3voPP+anlrgAtAXUqeqno+6rF5F3jNJ2ZNNI0cR64FCMDUzStBYIK4zDRdTQGEkBrbZ
         /mxl5d8bHEwaZxSTtJOa9bjAAwCnEXiBKlLWFqFe5MnhY1fK9bDB+eDAJnS4pkLf+Qke
         uqlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lE0X63dVc4zabYGBDU80DogM+0rbL2APicF5SwuVIwMDgO+rA9HeaiClyC2eyUtF3Vnf3L5S25NhoAEAc0wdr@lists.infradead.org
X-Gm-Message-State: AOJu0YwYC05P8yuzi8dDeKIov3up3UM4X90TwH2GYSAd+6Pm2pqSih2N
	SNPV+FMBJ3TEN1h8L/wwUAq0ZEscBu8UaAdjc2dqhmfZL7zvx/s5W7j9zq7DCaKmvZg=
X-Gm-Gg: AeBDiev+nbIs7ntyW3m8waV+6cVjFXLM+DMxmjTfSHKrPkuq25vT7VTWyayf95HSBsK
	XHDiGVkqQ3BVUvpnsbvLGTW7QqBIrsKuLvNUReRZ1OX1Fym2jc8bqXeIqAiHquJWvaLEKmro+kE
	kx3UrXSvM9QXTWFEEVUHcuCCGBLQkqOAUP75GTGURe2CTeIiAxMzfCgg2NkyHQnFFdMkGoSqzQu
	bBlqGItdrU7ctk4/71zCwN9MHB1JMaXcCObjxeD5jh0bpR1XR/n/bV48OAIk64frS0EpV4PT1e1
	T+e529iCsQG5Rgd81b9H6xTt6VPiJJ9ZXexrE9D0KmAJcIOrBnQaO8wTS7Ol4bsPOCEQnj/IRp+
	g3rjY6fXWATJwUfPRQX80WlqYNaIeB81asGw++MKZ1K1w2pEOo4LZAXELUfT1psbmaWOAXZ7EZQ
	BzWYJMxd0ROJ5FfGKztXTOjZGYVo9Xt/Sga3FzpPr1Jkh2IxEWPsO9UystK9PIz6XmElGVNr38o
	gFAb23qnZQY
X-Received: by 2002:a05:6820:629:b0:696:1a25:fdda with SMTP id 006d021491bc7-6961a26036amr2084343eaf.26.1776969913953;
        Thu, 23 Apr 2026 11:45:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3cc7:689f:be44:d58a? ([2600:8803:e7e4:500:3cc7:689f:be44:d58a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-694994277a4sm5442766eaf.4.2026.04.23.11.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 11:45:13 -0700 (PDT)
Message-ID: <a9307e04-3754-465e-a610-92c6e83cc3e6@baylibre.com>
Date: Thu, 23 Apr 2026 13:45:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: fix header includes across multiple drivers
To: Caio Morais <caiomorais@usp.br>, jic23@kernel.org, nuno.sa@analog.com,
 andy@kernel.org, michal.simek@amd.com
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260423183349.636757-1-caiomorais@usp.br>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260423183349.636757-1-caiomorais@usp.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_114515_678088_B268F890 
X-CRM114-Status: GOOD (  16.54  )
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

On 4/23/26 1:33 PM, Caio Morais wrote:
> From: Caio Morais <caiomorais@usp.br>
> 
> Remove unnecessary includes and add missing ones as reported by the
> include-what-you-use (IWYU) tool.
> 
> Files changed:
> - drivers/iio/adc/xilinx-xadc-events.c
> - drivers/iio/buffer/industrialio-triggered-buffer.c
> - drivers/iio/common/st_sensors/st_sensors_i2c.c
> - drivers/iio/common/st_sensors/st_sensors_spi.c

We'll want to split these up, one patch per file in case they every
need to be backported as a dependency to a fix.

> 
> Signed-off-by: Caio Morais <caiomorais@usp.br>
> ---
>  drivers/iio/adc/xilinx-xadc-events.c               | 4 ++--
>  drivers/iio/buffer/industrialio-triggered-buffer.c | 8 ++++----
>  drivers/iio/common/st_sensors/st_sensors_i2c.c     | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)

This looks like sorting alphabetically, not actually adding or removing
any headers as seen by the equal number of insertions and deletions.

Usually we don't bother with sorting unless we are making other
changes on top of that.

> 
> diff --git a/drivers/iio/adc/xilinx-xadc-events.c b/drivers/iio/adc/xilinx-xadc-events.c
> index d16e61953..20b796ec7 100644
> --- a/drivers/iio/adc/xilinx-xadc-events.c
> +++ b/drivers/iio/adc/xilinx-xadc-events.c
> @@ -7,11 +7,11 @@
>   */
>  
>  #include <linux/bitmap.h>
> -#include <linux/types.h>
>  #include <linux/errno.h>
> -#include <linux/mutex.h>
>  #include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
>  
>  #include "xilinx-xadc.h"
>  
> diff --git a/drivers/iio/buffer/industrialio-triggered-buffer.c b/drivers/iio/buffer/industrialio-triggered-buffer.c
> index 601a26398..5796c9da7 100644
> --- a/drivers/iio/buffer/industrialio-triggered-buffer.c
> +++ b/drivers/iio/buffer/industrialio-triggered-buffer.c
> @@ -5,15 +5,15 @@
>   */
>  
>  #include <linux/errno.h>
> -#include <linux/linkage.h>
> -#include <linux/module.h>
> -#include <linux/stddef.h>
> -#include <linux/iio/iio.h>
>  #include <linux/iio/buffer.h>
>  #include <linux/iio/buffer_impl.h>
> +#include <linux/iio/iio.h>
>  #include <linux/iio/kfifo_buf.h>
>  #include <linux/iio/triggered_buffer.h>
>  #include <linux/iio/trigger_consumer.h>
> +#include <linux/linkage.h>
> +#include <linux/module.h>
> +#include <linux/stddef.h>
>  
>  /**
>   * iio_triggered_buffer_setup_ext() - Setup triggered buffer and pollfunc
> diff --git a/drivers/iio/common/st_sensors/st_sensors_i2c.c b/drivers/iio/common/st_sensors/st_sensors_i2c.c
> index 6ab143498..974e349ae 100644
> --- a/drivers/iio/common/st_sensors/st_sensors_i2c.c
> +++ b/drivers/iio/common/st_sensors/st_sensors_i2c.c
> @@ -10,10 +10,10 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> +#include <linux/iio/iio.h>
>  #include <linux/linkage.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> -#include <linux/iio/iio.h>

On this one, it would be more logical to move the iio header
down one line to group it with the one below.

>  
>  #include <linux/iio/common/st_sensors_i2c.h>
>  


