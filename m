Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DEAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcvIS8eeddlDCHMQUC+mFz0BhHofMLV7E7SV2Sxv+AM=; b=pIpZEt8ZEM8NKdrV8UVdY08tdP
	DJNybG/z1xusq4hFS/EC88bzpChlHVZkksoDMWEL7C9OZckDmqIx8jTkKa1IwVEBe8SfOBWFCxI4y
	16vXI8db1dx7Yvh5dTH/3jRpV+X7Xzulb1bXJy+zIp80gcED+f1gd4uloY2gKpELP5yUz7ADxJsml
	2SGYINNVAkszycyccbLih09DyIuHGS76dHgkObCFAYjQ+Unui2yk9Su9RXz+JClRt28vc4bQ+nobA
	CMggHaFVvTAKb5TlPB9OInIqB6dXZRFfeCP5QmIs+WnsUsOcHA45GHXjOjKF8iLtKhNv6uIkIP5Uq
	saN6wl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFPV-00000000TLW-3y8q;
	Mon, 31 Mar 2025 13:42:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFNn-00000000THC-1mCa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 13:40:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfe574976so30789425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743428453; x=1744033253; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JcvIS8eeddlDCHMQUC+mFz0BhHofMLV7E7SV2Sxv+AM=;
        b=RZeXS+kqL9ATqZvzi8JJ8weaA6bOWUvyllAch1zCbE1O7c5ZkpYZMlA1wNhxdWfCyH
         sIMEnF/yRoAffoRu5Bg3iYjibQU+qKTaG6TRY9Bj92BPFA5fdEZif6j1aU67gqLO23sa
         Q5IGUinURCkabyWSY21o8a7EvKCSaNY/BpLFzg/INPlm7NOFEIsplCRbsDNcSzhtryOG
         NmTilW2inWI9zxJzcXbbKMCjPBctxjv6AyvjOFgu1bTqbgxsAqbFYNWIn2O9Wlm3DucV
         F3SbYZRyd12v5DuE9PneJ0f81n1yjE6Y/LNfkL4+PkRJE0AfIQop1k5Dx43WvRK1JFyO
         GNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743428453; x=1744033253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcvIS8eeddlDCHMQUC+mFz0BhHofMLV7E7SV2Sxv+AM=;
        b=XNU8yybr1Nz7Hom7m3TnWnw9+Z7BVB+lVPbXwGA5W7O0cB7Pwasz27nVHMZN1NeO4i
         bYsXWWq9ZvSICurRtY6INqvBmqsoF+x99Viu420gYaITJebtbA6UV+PtsyYhPstajXbn
         mN6opMr6f6AfUGV/o819jDgH381ZOuLdpFXdaeuFACrof+EGykkfUPyu3mXAKjedK+Ef
         Sk/YvU2FQHMghK07bASJDIpfHBdaVrQHzIH07181OvL6Gs3c39i0YhVcVOEyydO8yEBD
         kBK1jgnnqu9pQWztGG/j5LgnVhyQNc9VIH2Fyd+ejwyYw3MM0DQYUzJLMjfDsyVMcPA3
         T0qA==
X-Forwarded-Encrypted: i=1; AJvYcCXZDW/IGqdbuK80JATd2Av91Rlgsl/8oOTisas5xZRDmKEJWZ1q8i9NymXRTWJRyCPnBiD4DLFTu+nkQOcZAz3G@lists.infradead.org
X-Gm-Message-State: AOJu0YwN8ToTmDQIowgubvfwyc9veslZ52kRmCjX9pXDgYVoKgPyItJW
	nNAntGm04t+yOppoFMtILYS0wZgsGkNdbTG+T8fk3vE4bgyP5mGC6kyoIzLv1Sw=
X-Gm-Gg: ASbGnctlBPM15Fpzx96i1Fa9uZa4HufAhwfwyyTxuO4IkNP0CD+9bVlRQ8Q1B3tIAEQ
	JonQ+mfLGnPrCevlMRywtNppmjEjUXLP74zSbSTayX6QRvC2oUFyItE9eJgTw8Ve9KdXZJY8blF
	sceD4xkBbPrapsl1Ne+eQmWs7TJocxKBdScNYnC4XLmZwydN5lCwdCUwXQEYLUWDJg/jWI2iAkK
	sLnIiGb9Ov7lovQr04EUiJPXcIRLKN5nbPNLlItvdIWzroTebbACD3jXf5Y1KYy11HIsJxyDkDY
	QF9kGVAqRUjaS+SLKmicVlKrPFNauwIHCjHNqGEeqsS/k/Ob9w==
X-Google-Smtp-Source: AGHT+IGh3YEVtbE+1fjKhYwzjJfyAVJuJJfdjvfuRwAaPfMFF0DAxUF0d09/qUn91/N/4A/L9IqzrQ==
X-Received: by 2002:a05:600c:ccb:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43e9dea008bmr28889355e9.27.1743428453321;
        Mon, 31 Mar 2025 06:40:53 -0700 (PDT)
Received: from [192.168.1.247] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1716sm120986445e9.15.2025.03.31.06.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:40:52 -0700 (PDT)
Message-ID: <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
Date: Mon, 31 Mar 2025 14:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_064055_475916_DF71697E 
X-CRM114-Status: GOOD (  17.74  )
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



On 31/03/2025 8:14 am, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Since the code wants to use the pointer to the struct fwnode_handle
> the forward declaration is provided.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/hwtracing/coresight/coresight-cti.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 16e310e7e9d4..8362a47c939c 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -9,7 +9,6 @@
>   
>   #include <linux/coresight.h>
>   #include <linux/device.h>
> -#include <linux/fwnode.h>
>   #include <linux/list.h>
>   #include <linux/spinlock.h>
>   #include <linux/sysfs.h>
> @@ -17,6 +16,8 @@
>   
>   #include "coresight-priv.h"
>   
> +struct fwnode_handle;
> +
>   /*
>    * Device registers
>    * 0x000 - 0x144: CTI programming and status

Reviewed-by: James Clark <james.clark@linaro.org>


