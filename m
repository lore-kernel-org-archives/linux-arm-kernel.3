Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528BCCFD341
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgj16XmQKLfzuMiMJnYwYhnRMSc7HIdJxo40jdxC8fc=; b=ag9nkNInkv70F/YOSHANTDLhrV
	bnX0faXWWkjlVwxcpIL2reufhtT1uiLNrmd6L2RhUKSs6Qsd8QHctYwkjHtRMq1WEEKbhuKTKyvt8
	xKNQNM0owTIfKLhJuSgL91fHOLwQMnFhRU9H4sYbfbVxKDAZ4id6JrM8f16pEmdL4DKlBhOONi5d1
	d355yoAw2wPsfpYtR38LYLRV8fUzPxcrNjl6F/jsUc01VqOVCtkIm+95yiwvIDK9N40/+UI8Mpjs2
	j6Jlctt5r1xEs7Xk0LAOs/f5a3P9Nit2Pgqy9wY5TOrr14HCuw9/8YN0DdLoRH5H2gQEARNOUG/Of
	ZR2yGMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNank-0000000C8b3-1a1k;
	Mon, 24 Nov 2025 17:56:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNanh-0000000C8aD-2SN3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:56:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so48258485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 09:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764006991; x=1764611791; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgj16XmQKLfzuMiMJnYwYhnRMSc7HIdJxo40jdxC8fc=;
        b=A/n34a9DxVpJXi1RaTVFZj284yFUdo0wNHNJQ54to2LNre9Rn0d23Gy0hvLGa2NleQ
         0RS+HhnhHVsPYBD+9ebSxWir4/uvzW3dotWaBZM+xUQKJJQlqU1MCmM0uW+EA5OEc7r1
         OWJul8K5/ELRHoyOyaK2n9Dkobv9QbVdGHK+KvX0XTOOEdyjaZMG/+UTYQGO6GxSgq19
         aI4G5jHEkiFjPDD/mOIODI4miCSWrzyUHnzEDMTICMyDN5fhVlhZwEY5JDiimeEi5p9i
         GVgLQgBlQU4bLGvMZ9yOn/D89STKWHOmNb4s2iq1bPATKh58Sy7wrSm77htUPEs1YXUE
         JBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006991; x=1764611791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgj16XmQKLfzuMiMJnYwYhnRMSc7HIdJxo40jdxC8fc=;
        b=ULWHLqmezr6cSaPTTfriXuzWdVVkqmojqavnhYfQpxWmSq7UA8fmFJFe10yz8NXRL7
         Wtc8ptVfxFAqoLksEdMDsYkCl0glsVqmqW+XM+QomJPHx8BGKOtIdM1SSBNyLgrgWCW8
         R5CCI3XOgAJqvceVuz0AMsGxXCZuZ618Dr4/OaRP2jzls/u+HZOYNGYXBL7y3iriod+E
         ZWrJMhTbfcUoaL/rvYTUvO22elyhBiP/yAVn8t9gvYkLU8/TT9TIBXYvVmgCYvrwqQop
         rh40QXvQscKZILrurlrMvGOPQ+qGA1nVPqtfJdnjSnYELlPcdFVIzJ9qRRwn5bZ1fNvv
         RZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6b4QDhruffH77zVqtyPBQG8W+ttGNh8fKpWnLJ5uzlFNyAeCQmZBDL8SHipuYiddneOm1SO1thrbMb0J/aifj@lists.infradead.org
X-Gm-Message-State: AOJu0YxUx2NRd3ExtlCDZ6BXV5PhpSUNaBR3Sse9IU75BoDHcBLdx4JZ
	jqmFGwHh/SUzCdkrsK6IGotGcSmjJYAN0T1BGmkMYEmkhyXaizRg7m9eNqf+zCyrVXc=
X-Gm-Gg: ASbGncsK1V15FikKCrikDFpem7VzRm1+kbeX6Z8vDvb6kC5d1pQjX+4t4jkcaKYxQzP
	NZMLCft7zejAIxGjApEvuz9SJFp7bgPQtBKXb/7i3wVg3cuQQ0uFbTJR/p6pnEQVco/owpXUE1K
	WRI9XCHafqoAKy9xWY6ykNQ1ConcmwI6dsdf0ySyDre2rqPXA8xXVZbTA/J7jNSa5INen3Hbqmb
	sAJsVW7c627RC/+eby6VRLQck7IyUDH/3xPNOkBG2GLhmQLnLcKUueS/zrJhb1HHSt0t/IzGiZk
	94T/vjGxS8fvxumustVQroPLmdGEwypoYmWC5/F64WxVHIfVMoVEfP9Luhdrfd33Tpui9JIPNys
	gvXaoZZNcY/cfXur1HFJuigy5whynov+J9QT9gIlD8MW+2LTZesNPTxo4WfAfMoEKjACkrfTL9y
	gan8W7jS732a8e+x4grVYIXPn8w1UL8X5KaECOfyPnNcfl4zbsg0zpEkV2kQyA5NgnXJK6FQs7P
	3SC
X-Google-Smtp-Source: AGHT+IF9jQYjGDYWRD+2xNGzxOUo7frTRxo+/YiP6cBgQWSgQQXQD/fGaLUkrkLZhoAvTfv/zaiUjQ==
X-Received: by 2002:a05:600c:1f94:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-477c016bbd5mr123402035e9.7.1764006991417;
        Mon, 24 Nov 2025 09:56:31 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf198a67sm217894095e9.0.2025.11.24.09.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 09:56:30 -0800 (PST)
Message-ID: <190003b6-2931-406a-a8f6-ec8909c65162@linaro.org>
Date: Mon, 24 Nov 2025 18:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] thermal/drivers/mediatek/lvts: Fail probe if
 temp_factor is zero
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
 <20251121-mt8196-lvts-v4-v4-3-357f955a3176@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251121-mt8196-lvts-v4-v4-3-357f955a3176@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_095633_654390_AD98F62A 
X-CRM114-Status: GOOD (  17.47  )
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
> temp_factor is used in lvts_temp_to_raw() and lvts_raw_to_temp(). If
> platform data is incorrect and temp_factor is zero, it could cause a
> division by zero. Fail the probe early to prevent a kernel crash.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index 1c54d0b75b1a..b49441d82ffd 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1346,6 +1346,11 @@ static int lvts_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> +	if (!lvts_data->temp_factor)
> +		return dev_err_probe(
> +			dev, -EINVAL,
> +			"temp_factor should never be zero; check platform data.\n");
> +

 From my POV, this is not really useful. The temp_factor is set for each 
version statically in the code. The scope is limited to the driver, IOW 
it is not a parameter other subsystems passes to the driver.

If it is NULL, then shame on the submitter who did not test the driver 
before sending ;)



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

