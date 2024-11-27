Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF97D609A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=; b=zFAsWxVyreSDB79niR8bsmT3xz
	0ag6+etSudnGB2/Wqa4oGMyLD1Zkw7yOPn/pBP/hmls2DFqnB4oVX0LK/CfV9g3soscBS9GW4LZzE
	h1DXXkRYDNdd9IxjTojid8JYJZ2AjNoAuPi3en+B8Ib3Bl1xdBFvLd0sHynnm/dZDARdKWoWDhXIg
	C2bG382Qx52odcadiRcgCpFoVSxyeqTYRDfQEFx48OwG9lNSqw+8M15Ogq0LJgRp0M69METe1xa8t
	FY/9srAh8g2hw0rtLZjEpzr7c8mpkL+OaDEG+k9w2IaGnFk5FNjqHCHkz4WVm7cdmJqtFnBMyDLbJ
	UC+Ruc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD6F-0000000CXSn-0wg6;
	Wed, 27 Nov 2024 08:08:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGD1S-0000000CWUQ-2j6x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 08:03:43 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so5296425a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 00:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732694621; x=1733299421; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=;
        b=MTOFhguC2GAg/LACMfYZhoWQvUJMFjU45ryRMU4NaY3Z4F/dAhp/y3NNJExqVbV+SE
         mgoQ2WzXyt4vs0Ntq6AzqYnwGJhjEzB+/gjE+BrRTw5JYM+JgCit3vptZ0zrghHJkw1f
         pbW5ABJS3yk3MFP6VRjkmHAD+U+Om0JR+0j7r1kZ9YKG2DPElT/D9rEnfGSlhdWWv+4e
         4uBnAYX5BHx6xVnl6WnPQFA9QPeUED+W34LTaIPcF9tM/p2aj57UGm52UAqLLkNNoHgi
         lOgqfgZFGxTrhm4gYORfzjCPyQJCIInQXz+sKO+1ftVk6StKKLMH3J5LzayUui63ilqq
         vJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732694621; x=1733299421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=;
        b=rNV+0qPnFXtRMNyb1okGoulG6xtMOynHTrbvDI/MSY/qUsuuZGmc0EsPHwFXBFo7j0
         e1ii+sVJmWv3HYtv0GjWjOG9e2yj7mHPSNWBULkGoBUUdrJa0DiVPj4ng+Bxzf24UMeG
         rJx5nvufeffRBBHk3v+MARD5gvytnXXabRPrYgvzs/z7mw07SB/Tavqeubxgsy4QLgaM
         mildfqlIlYJw5DL6djs1aRRV3bx7clplF3mDSQqZFD7gZghFA1Q5BepJjzjy4hhTnQ8q
         bKTAb/a7PvySKAqqFloHkeVhE1y3raeTW+XwntlL6JuOM9x9XR+weV7BEHp6bGPeoZ9p
         S2gw==
X-Forwarded-Encrypted: i=1; AJvYcCUoSDzDjpSOho7iMynp3/2PMA3q0jothVsRCtLikR6enyChm9NJ6IGh8bJpL18+Onmg5bjfMm55J4/IklIdB/Ax@lists.infradead.org
X-Gm-Message-State: AOJu0YzxLnGoiIYg7sxy2YpfuXAkxVzhSCJV7icW6dO5ZU5qIXGZXepC
	sawcTdnOJzV25ctZ68Mqa0d/CAamgSl+foBV47eeGxb+q272sh2G
X-Gm-Gg: ASbGncsDLr57u98AlNpb0B+4c65HZXt9go3kBEurAxSjoxmKAzDpphE8Z+WdQZojIrZ
	It7zd6JzX1pZsUCzy7VuGYt3fOAmu54s8x8u3/72xCxOrrO+WTOR4005W0rnqIOsrC6XLoFTdf7
	oTPPJkEBDG4BoZBZlo54reuITgsdvymjho5pvAQhKy/LzVmXN3t620jzG0qDrzdWVkpmVO0/G3l
	oqa1a1ts7YfElogZa+yuzlZkfUKKGzxuFkTR6k4LQcnTBIY2itmwT7XFE/pBJf7Q6BYty8kA5IF
	vFJPt6YUIIJUjncOSwoYX3m7IdSL
X-Google-Smtp-Source: AGHT+IHRo3XtMbkGU/iUkrZZ9kDEO66Pm5yljji2WIQGTrvtOISCN9QXMkeyFyIaUUK12nAZ7FFb4Q==
X-Received: by 2002:a05:6a21:3288:b0:1e0:d380:fe61 with SMTP id adf61e73a8af0-1e0e0b9dbf6mr3148053637.45.1732694621422;
        Wed, 27 Nov 2024 00:03:41 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531308sm9618017b3a.110.2024.11.27.00.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 00:03:40 -0800 (PST)
Message-ID: <fb61cf82-b14d-4f58-99bb-9677305a0aa6@gmail.com>
Date: Wed, 27 Nov 2024 16:03:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <7c132784-87db-44f9-8be4-a0805e438735@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <7c132784-87db-44f9-8be4-a0805e438735@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_000342_687319_CD4BC3F2 
X-CRM114-Status: GOOD (  14.06  )
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


Krzysztof Kozlowski 於 11/26/2024 6:10 PM 寫道:
> On 18/11/2024 09:27, Joey Lu wrote:
>> +
>> +static struct nvt_priv_data *
>> +nuvoton_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *bsp_priv;
>> +	phy_interface_t phy_mode;
>> +	u32 tx_delay, rx_delay;
>> +	u32 macid, arg, reg;
>> +
>> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
>> +	if (!bsp_priv)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	bsp_priv->regmap =
>> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(bsp_priv->regmap)) {
>> +		dev_err(dev, "Failed to get sys register\n");
> Syntax is: return dev_err_probe
I will use dev_err_probe instead.
>
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +	if (macid > 1) {
>> +		dev_err(dev, "Invalid sys arguments\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>
>
> ...
>
I will use dev_err_probe instead.
>> +
>> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* We support WoL by magic packet, override pmt to make it work! */
>> +	plat_dat->pmt = 1;
>> +	dev_info(&pdev->dev, "Wake-Up On Lan supported\n");
>
> Drop, driver should be silent on success.
Got it.
>
>> +	device_set_wakeup_capable(&pdev->dev, 1);
>> +
>> +	return 0;
>> +}
>
>
> Best regards,
> Krzysztof

Thanks!

BR,

Joey


