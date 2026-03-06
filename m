Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9AEFCB61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flU13GMtw/+0UhfCUKIM3vLWYjN35HhW1mCsxDikv80=; b=lcduHDKWiTICk7/APhOZZ+lHN8
	Wr++5DdqbwQqkpXSgtVp7s2PaBm1yf88II9oQBTiI8qeI2o4oTZhS6LkCpCaCC/X7MKjdPmCzHWS7
	wgjJ8JyD9UZnKZTDMxj7bLL/9PNk6biX+lzGLqji8JwqWGr1fVnv2Kwi/U0t1QrARFtO6rFq/Pj72
	5AgDWmmj9R8CDDkBlJxzmPsERGHuQLb+5nK/RBRTyxZLt6IRBHfMmJ0HEe+LQh14pjjEyDL/WIr/H
	bPomfzI6VmGIc3Z52/pXnRHSYvIjDevD0NIkOW3BJtV7JfIciIPVJw4hNhalbrk3IpsL2RiSVLzFs
	Fy+tdWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXWm-0000000460m-06Yw;
	Fri, 06 Mar 2026 15:55:48 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXWj-0000000460D-2oWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:55:46 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2be19f05d7dso760025eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772812545; x=1773417345; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=flU13GMtw/+0UhfCUKIM3vLWYjN35HhW1mCsxDikv80=;
        b=YyI9/vB26SzvpOhj5UItoNOPZ44qKNzehFntHoIxIi3ORudKdsUJ/InEyh2bJOVP9x
         pZsXDMiZSGL8cA7GnVlq8oZ0fdM9/BuKZWx4zoBoCHmMb50zaSK/Dpo6GUFpgFk00myJ
         0qArFfyYP2WDIw5M0uV6wDs6aLkFuYtLXzjdnjCEDNWy7ZVN6LsOQ/Xw5rbQGUSGOfXp
         NjMbhomQR5YaUkkMiN+quamTZxwFFO3hNypzYnakYvszmJu4IQfChQuZ3BAvB2VW5khf
         +fZMuWHzgLoS3y5v+MyTQs1DxSsZS5KR0XHKRNnBTQGGF0C1f4+Mnvd9h75thM4SwhGf
         DolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812545; x=1773417345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flU13GMtw/+0UhfCUKIM3vLWYjN35HhW1mCsxDikv80=;
        b=HYeE29oBiB6A37qi1f00Jj748buzUPjEEzfjcLdEp27fCL6jiZFyxmL0xmaBU305u/
         2J3A+bQpU9GA2FwJHgF4f2ANOYGsIVj3zQ4GDst474q4zTYbM5w++bIvaVZeU7hCyJKw
         mpTiZTp4g4WcIWZ6wGUT89V6giWiBv68+cdccJI2z3i3fSDwmQEyuvjJKemUAgGggyYU
         bGCXzyhBNzuEHldMZxv/JTwtHGx/HOU4q7YJXpyjoL4erbyGaEjN4CWddacywvHhqg2C
         rRqYX9CLCdAM4NrNqD+rWURn6BIUaFGLv3woUkyJRioZT+xsOrfC6vDHAx+qETHAFySU
         8YJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJMteM6QnXhO3RiC/1eg0PxH47xeI8MrBiNG8UXf2GJtSsvAobLCwQYRgPBG2zGuoPPm3rPMIhFaspdcEr+Z9T@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ7SnqcGmDd/EF2L1HVddMHJ6Ixwb9PHC1YACT1RxF87pQp65j
	gcfCIyEoSImSxKy1zz6ZO/4qFigQUipx2TJag9MRL8mHodAFloMnlTiV
X-Gm-Gg: ATEYQzxR0FRY4ePMlNHu2X1ObUKeUfZDKx4GcFwwy0kuibwng0W3nNU2SVH0ce4VuZm
	ioJzYh+qkPJ/sm36bi7Cus/d0H2y423c2Lby+azLzg6OWn8YpYl46UASx2zWJd89xz6DO1BWwq8
	1OrkDJS36cuMiL2QADCxZcYn4uxss3EGMPNGwKubLOJ8kJseyFhtudd9PIcE34d+l3xbpuYDMmn
	Q0IendCF6WXhslhyTVqa6FD6RWREeoU24HPoLBXrdgK4WNuxk14Tr9EWEVqfLgCiuCD7eKBa7H+
	3TzjBYGwKcXAFCnERWHbDPUunwJ1xcK84Z+S1g9jxuENiiuAJeBAM8qLuXYeiWC1AhcyLPEFH7e
	ed3BDMIlbdhxusd70drTIWLa4fFscZ3lINK8TmChbfJyWCsHF10j7YRbrS4NqAHc0d1sHw23k4T
	GpDRCVb1lGD8AEwDmc2Aikn2sE/vFDPtEu9VgAfp/wYWRQtvKqfDKkZarI9IiBIuLAOUAmHvCyY
	KE2ENRNDnE=
X-Received: by 2002:a05:7301:128d:b0:2be:c4a:d31b with SMTP id 5a478bee46e88-2be4e02c09dmr1176487eec.18.1772812544584;
        Fri, 06 Mar 2026 07:55:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948411sm1369071eec.21.2026.03.06.07.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:55:43 -0800 (PST)
Message-ID: <0aaa530c-ff61-4e49-81ca-fd3c98a29f58@roeck-us.net>
Date: Fri, 6 Mar 2026 07:55:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] hwmon: emc2305: Set max PWM state during shutdown
To: florin.leotescu@oss.nxp.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, festevam@gmail.com,
 Florin Leotescu <florin.leotescu@nxp.com>
References: <20260306133439.564033-1-florin.leotescu@oss.nxp.com>
 <20260306133439.564033-2-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260306133439.564033-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075545_742835_4CC51520 
X-CRM114-Status: GOOD (  22.09  )
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

On 3/6/26 05:34, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some platforms rely on Linux to leave the EMC2305 fan controller in a
> safe fan state before the system restart handoff.
> 
> If a soft reboot is initiated, the controller may retain the last PWM
> duty cycle written by the kernel until another software stage
> reconfigures it. On systems where no later stage immediately takes over
> fan control, this may leave the fans running below a desired fail-safe
> level.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..d631d972c40e 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -714,6 +714,20 @@ static int emc2305_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> +static void emc2305_shutdown(struct i2c_client *client)
> +{
> +	int i;
> +	int ret;
> +	struct emc2305_data *data = i2c_get_clientdata(client);
> +
> +	for (i = 0; i < data->pwm_num; i++) {
> +		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i), EMC2305_FAN_MAX);
> +		if (ret < 0)
> +			dev_warn(&client->dev,
> +				 "Failed to set max PWM on for ch %d during shudown", i);

s/shudown/shutdown, and newline missing

> +	}
> +}
> +

We can not do this unconditionally. This would have to be configurable.
The driver could use the optional fan-shutdown-percent devicetree
property for that purpose.

Thanks,
Guenter


