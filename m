Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593A0CFA761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl2xu8XKN1gPMV9ACQzl23UL67KsRhgGQiSjpamCaq0=; b=kOVAqxVpVgU+rlphXRXg7EGFyg
	RruY++NZ7SQR+uFSqyO89tmEEHKRCSSxiuFHvUGvsF7uAJ9y3S5rIdoO8UdLYeuzzYYzN/sqeSBra
	FKTEdjw+OLwJVnVIqKQIQKMwK9zQdqIf6hlpgdsNVbAYoTZxwOi2tvlXSuIF2+C4KvkypmxlAylFG
	z/pZdsFWbBQMj6QzHg2TNG0xE9oZnDqoFx01M3zEgvDLaR2GGqMWogZLFPXtmVfhs2c9QDS5WFsZR
	56rS/XbYFHl9IPUafZOOis6rfgZoHDsfuNbBvwQvjpLNeqhgxXAycgqq3cT2O397ahNHtQwMRn7LB
	NMzOF4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNSl-000000089gp-1w5W;
	Fri, 21 Nov 2025 09:29:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNSj-000000089gL-0gpH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:29:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b71397df721so334531966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 01:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763717391; x=1764322191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl2xu8XKN1gPMV9ACQzl23UL67KsRhgGQiSjpamCaq0=;
        b=EBN+RZvhff4uNbJtXi+dxUSBpmFPUQGJo94/79Y7VrpV9BS7EXJXVhFc/hzQ051ArX
         GtvQ+X53n0+ApQlVMnWyacX+lHj1xZs/lv+uom7HeGvfID2gaRtIViupnxyt2Gezu1uo
         2cpkM1uCiRqlp4TS7MSE4mCpLyE2N6FfwUwqz8d+Wblhn8Rxqy1EY5B1yynvwn0cvfAA
         kUonp96EBjYxr/Ztnb1oB7G4PzUMNQKSCEdB1rrG4K8muiXu6LHw/gzXb1axttamFau7
         0FbBfnzzfcGjjLbRLAOwY9ZG0d+llvTohMPSQr5BTXHom5bc539Yi/MjruGjG9XpwClv
         IaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717391; x=1764322191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl2xu8XKN1gPMV9ACQzl23UL67KsRhgGQiSjpamCaq0=;
        b=LnSMRePi7z1+GhHFfCDkuBg5sOWG4Y6ZrxuWlj6SWh8+7nFAlkLryEBhaVs8o842nW
         0ndmaH6nINS0QV7iTqUm3XYuHmqqJ4p+PJ4dT+9GGoWzXj4zjI4PiSmlZc5rlBmUG2EV
         5WvxQ0huaEk1DTk5VrbgSgeOONUOh/hpZhrc/perb2mmutzxqQKV1FRanj9Z396Li4Kc
         WjnVN3PuutlcXTT3IxYSq9DHH5NKyrBUbUZaSxgIORbl+JMap3nRBegqCryIsgWd2F9X
         GQOc/8QXvr2FhHPlpt3xlFDsFC4U9wECGUuaoVe9f4qnlPe4K/mIg+fh5+oVJSdJgf7/
         KK3A==
X-Forwarded-Encrypted: i=1; AJvYcCUWgxAsm4TKLI0+BInMWRchYeXmHNSVG46WdYKSXH5WNVZZOkgdMebzAALsSEMF1qxFxKr5QnP9LxCtjkpIodq5@lists.infradead.org
X-Gm-Message-State: AOJu0YwCyXsCU2AfrKixjNlg60bvmjFAZXbMzTPCUGDcrwJlwJULibYM
	Vy+8B0VII5/qT+8DlCDGp+Ga8JckV9RiG+G90C48f8c6hw3Hkx0yhvuC
X-Gm-Gg: ASbGncucvYo8ucEHLXDOSv6Q+abvAzK74Th3PvaQ2uo16LcJ/1BetPGchfbw9liQmkG
	4MI1LI4iCgjK0/i3fi4ZiZs8QvaGcwnXZG5KFQXHCt/f15DpxHlXR+GS/YTRBUYmdtVnFu8iq/u
	jHQDuXWdiobsXyeDWu8lhJ1sO3EEZqTG2cFWjJq9INT5BSfsMHYDD0jfAhhBK6XtE2ZxXelx5SU
	dbsW5ZDUx/4nk21UopPnBzysW5WKU4EA5eSwz97y6/CJy1T2UqBcDhAEKkKVDgFe5aDS8kX1S/Y
	xKbmJNl9F6jJLkRlm7qkclKxIe0T2pWJOGs25of69HB3R1/sy1tuu7yGn2J269dc82WehgRyvTX
	1rOq8xkx8KGka9SrlPPgKLjZA/L+goixoump8jcrTdbcVdEVcaHNml5x9XwhDKabnsNgPU/PvuL
	Mj8iULFYotFcV0WbG8ADDx1H6F+0HamVPU3Ihy1Z1IWUQ=
X-Google-Smtp-Source: AGHT+IHq8hk9zncY5NjxJIA+5dLJtbgJgeFMs63IXI+ZjuoPAQXsuFcRPpdcxS7UMwvUHeWvXnedJA==
X-Received: by 2002:a17:906:fe4a:b0:b76:277b:9a3d with SMTP id a640c23a62f3a-b767170a37emr166265266b.29.1763717390579;
        Fri, 21 Nov 2025 01:29:50 -0800 (PST)
Received: from [10.25.210.163] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4275sm402635166b.37.2025.11.21.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:29:50 -0800 (PST)
Message-ID: <3959e908-ae61-4424-a8ef-89f655a4de8c@gmail.com>
Date: Fri, 21 Nov 2025 01:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] reset: imx8mp-audiomix: Extend the driver usage
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
 <8b225c56612ff01845a90388be0945c7d0b3f0d2.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <8b225c56612ff01845a90388be0945c7d0b3f0d2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012953_220994_B60C4B60 
X-CRM114-Status: GOOD (  17.44  )
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


On 11/14/2025 8:02 AM, Philipp Zabel wrote:
> On Fr, 2025-11-14 at 05:37 -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Switch to per-device reset map to allow reusing the driver for other NXP
>> block control IPs.
>>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index 35df9bd5f71a..d3396f37d1ff 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -24,7 +24,12 @@ struct imx8mp_reset_map {
>>  	bool active_low;
>>  };
>>  
>> -static const struct imx8mp_reset_map reset_map[] = {
>> +struct imx8mp_reset_info {
>> +	const struct imx8mp_reset_map *map;
>> +	int num_lines;
>> +};
>> +
>> +static const struct imx8mp_reset_map imx8mp_reset_map[] = {
>>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.bit = 0,
>> @@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] = {
>>  	},
>>  };
>>  
>> +static const struct imx8mp_reset_info imx8mp_reset_info = {
>> +	.map = imx8mp_reset_map,
>> +	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>> +};
>> +
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>>  	struct regmap *regmap;
>> +	const struct imx8mp_reset_info *rinfo;
> Since only rinfo->map is used in imx8mp_audiomix_update(), you could
> directly store a
>
> 	const struct imx8mp_reset_map *map;


hm, that is true, but I wonder if instead of replacing "rinfo" with "map", it would be better to

keep "rinfo" and add an out-of-bounds check for the reset ID in imx8mp_audiomix_update().

Something like:


                if (id >= priv->rinfo->num_lines)

                    return -EINVAL;


we are stuck with "struct imx8mp_reset_info" so might as well fully make use of it?


>
>
> regards
> Philipp

