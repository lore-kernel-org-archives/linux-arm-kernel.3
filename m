Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9450EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3KRD6Y81KP0hnKo/0jrjQjgKZ+r4kg7mu+pEFOiLI4=; b=Uzk2PuuVY7Uyuy+rQ3W98a2zbT
	RWshfQfJPpIQ6EllcQlOnLRRU1NkuaLc2jMSIMHqRA1rizA0Tpjg1FOyZ2b5Ihcd5mEdm3bfxCawR
	1rh7zctVw51q0haVFJfH71CNjw02agkTvC9+5j1YLbhpi44ZPAGsfGyu9zqUwJsb9XXDGbU7UrgCY
	IOyDAKkO+SDzxyveKpc+iwpT/BRXA+yTmJVCPdiX717zxBVrbG/2VqQmmvNTmRSkZ/3ymD5Vb+B47
	Avw+zhwYHScpDNvbvEEMgXCY7bNIEo4Wt03I98Oqqqtct7WhxfQ2UDrdHJG2qJadpGyin4xutx6ri
	VFgckstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiptB-0000000DvTx-1Ivz;
	Fri, 14 Feb 2025 07:13:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipqF-0000000Dv6x-19xS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 07:10:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7c14b880dso366838966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739517025; x=1740121825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3KRD6Y81KP0hnKo/0jrjQjgKZ+r4kg7mu+pEFOiLI4=;
        b=HPP4d8JLPeZR4djJt92nB4m+mmS4JHqQt1pxiiNw1DdFGdZ0HBaxoDozdrPE2b6Tlj
         nl/mPHb5as3FNUDYp1AjUoeIlcruPxCnRVhod+VKvyaGIm6RhBkTvJhL1gzhEgeGHzS/
         EXMCT9JUbUXT3TyRgS98atT7InJVPGo+Y1JzgCWQ5SMLdqUD8TspVs5ZHMwy9YYTV6xT
         5RonSFEYAPNvciYlraG3qapb19+gycGi5CjGoX8brkTpJZpwmOADEdZIyuo9NRqImCBR
         Cm0a679cAfpBA/oH4ASOGnO52vpAcMlzQX2dLEgx7cLWsKy1e1bGtSvr+utAAz+bRGZq
         EVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517025; x=1740121825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3KRD6Y81KP0hnKo/0jrjQjgKZ+r4kg7mu+pEFOiLI4=;
        b=myR5zrpMOsH3FjIEHdEEFdB03+XDtcpNk1SzMdEpm7PGTks6PnVMing45y+iTaa09B
         5sXTHsksLXUmjFiWR0A5ITdr6wRs3nIkm9aab0VxcskxbGIysD/ngg04KR+4hDOVzmtq
         kgjm6+eQ9jC38JDTqQBNHwU26Joaenk6r2sdsgD2GomiM4WaP1K4dSrTRV8XUe2jwDlr
         Ja8shiG/evSSRbUFhLrX+PF3Bgo3Eo6MDFaQm+NDvaLBpdKBkK1nGtS1ePIsbAzxkSE5
         8xcSkz9NrRYIGmVX6cWyZlhooSdafrVkwBDKX5dZtz0zkRl5szYhkwvUFCY9R/FrEhf5
         Y9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUwd9Pw7u9FSovh4rXgwkOlUia4YZAqgf9z34InkI0wN9N1yVcT3hobfS4j+TnUyzqf3UKv4XyEPs+bKzU24cWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzdePhLRTNdplbfVFBHc/qS19MOG/EPi42usNoVdNzvtEItLlBv
	CElP2mak7sjAvTub5ha7ZQLYF90XPVZ9pLPLxltWi11lOcdDLSMVXSzAJEgFQis=
X-Gm-Gg: ASbGncsuTnnmg2ZL60BUaxvlu9jAEnc6ID3jHGL2WU75IBUUApCkpleNSiNR9Err/QG
	FHNNWfpD0HRWDf9OM8NU6OJ/kEmGA+BGq/imU3RrIlpJSYT1H9+8F+PI4teX4fewD4o1Qvs96np
	VyINM1SKj94th9b+vyod61/2Zu9Nk47/Nz2g7aoVtcd6LExpbFVCdtc9KK+A8T/SkH978Z9Yr0b
	Sbq7OG+Iptx9O3YvryCQYEzLJvKsDCJsOjXgrHNayufH+YQB7WMQxutAnYc9tRKR5f0tEAp/+NN
	A775nUl5qVx5BgIKlPWV220k
X-Google-Smtp-Source: AGHT+IGi8WLS5WHEderG6CbIqrMmNonKomIvShKsRt+y2awNKUvUu9Cp4ZCauxABS0cVTnSGyBw2GQ==
X-Received: by 2002:a17:906:7316:b0:ab7:effd:a395 with SMTP id a640c23a62f3a-ab7f389fdf1mr929358566b.52.1739517025159;
        Thu, 13 Feb 2025 23:10:25 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bdc41sm279199866b.162.2025.02.13.23.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 23:10:24 -0800 (PST)
Message-ID: <12a67e21-220c-40d6-a6e0-64ba23cf6ecf@linaro.org>
Date: Fri, 14 Feb 2025 07:10:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] spi: s3c64xx: prioritize fifo-depth from DT over
 port_config
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
 <20250214043343.263-3-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250214043343.263-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_231027_323263_DC153A65 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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



On 2/14/25 4:33 AM, Denzeel Oliva wrote:
> Rearrange s3c64xx_spi_probe() to ensure that the 'fifo-depth' property
> from the device tree (DT) is always prioritized over the fallback
> values in port_config.
> 
> Previously, if port_config had a fifo_depth value, it would override
> the DT property. This prevented DT from correctly setting the depth
> per node.

sigh. You had a fifo_depth of 0 in the driver at v1, this proves you
didn't test your patches, otherwise you would get a divide by zero.

You can't do that, you risk to get your contributions ignored:
https://lore.kernel.org/linux-samsung-soc/fbd06330-ccf3-485b-800f-83f624a7c90e@kernel.org/

Please provide prove of testing in v4.

Anyway, you shouldn't prioritize dt over compatible driver data, see my
replies in your v2.

