Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCCEE674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA3M7XOTwFjd5+WkbcfE1Ns/HpZ/5cuPqqQTA2g43go=; b=16ccf4AeMLbJKYQ06kaw0OqWsp
	a/Pnqi7f+SzMGkkCQE0nf3ux/XdLy/NgA9mAsItg0NfwV/ZTaZZRDGRcE3Bbxf4gfw25u5umL4UKk
	zJxfaNnt4gCOXw6Wf1YyKj0bBNZwwRfoTu1Q2nXWrKlsnrQSRZSkdzGiOKHu9g/6Rg0SW9fl4id4m
	CUEiW65JRSnhcOo0Ffbe6fTD2RqdBnRPA26FQkfemd87/ZZsNc26VzRW6dF4V7amKcXOgPG+dAuLh
	+zSozvkGkSTR2giN3FNv87kLUhTtgIiLJrgFpCqTyzcjD0m11Z1TyRAMR50YUmVcQ6+U/ZwPK3dsQ
	vDA48bUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgeQ-0000000DrVN-2b7w;
	Mon, 22 Dec 2025 14:12:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXgeN-0000000DrUw-3tHZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 14:12:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso24323655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766412757; x=1767017557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VA3M7XOTwFjd5+WkbcfE1Ns/HpZ/5cuPqqQTA2g43go=;
        b=xONIgtGBWM2NUtzEF223SEizVE73+sZK4v1aOUSa6U3d69zdBvNa8p+hLmPxOwAbng
         wmEMZSMW6OC9UMUyJeF2OIAhZ3HhI5X5XItnXNNPpfM/gieQMsXP9eCTxIOGEbAete9+
         PadQNvr8lXniKgMRoMypKg/zTcnQK/uW5znSFrdjBxsUTHv0Yvs/lRdDL/gj1YnPY614
         03AUJtx5z4KLVrZntd8EotkZKLsvxbLCiODgpJ8wJhSHgxSRFnoGmWDzXUE5/eH4tY1V
         AujN1aWt41jjBU1BuNX69GeH4LUmkn/qI+y1apVSmR5tJgbhL3WtVWSAzluspn3mVIqh
         b5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766412757; x=1767017557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VA3M7XOTwFjd5+WkbcfE1Ns/HpZ/5cuPqqQTA2g43go=;
        b=JdyBrX2NCxTIwHqqsxwvoE2CQVthAPiC7fnIhHDST7xkjGwcnTt/OUqn+YCztCk4M0
         5VPNMUNgJ2hyWlCugIz3aPjv6AMr8u/4cwNzqmAJ3unLiq8X+k7KfXJSz6jbyv6gzvkk
         B4Ws6F5fWd9aqV3C2r9buKxqS3VrQXwId7CYsFv+8+XvGsR/n44sWObrfayqvDk2ugZH
         kO5faYI/6rL4xRosZE6wyUK0Ft511/sp3yed4KuFO5nswpFb+rNEwLXQ6IKWI61Zj+/2
         xgk5ZhA6Dv6BW8rtuBkB55CZZ6RiikfdMW1ms1cPt4b+4J7YjuOoVqdoIQzcUdcF4XP7
         ZCrw==
X-Forwarded-Encrypted: i=1; AJvYcCXY+tTMioahdhIiD5ItbxG858kRf1wRmVLJDWqO9JuKB82B8bkEhoQxj0sBdvV5XHBcJr/DWhiugXzdoCZwouxO@lists.infradead.org
X-Gm-Message-State: AOJu0YxmEH7rytBUUpF4v936C0Vh4/IXym3djN6MDoVBSCjT1Mb2iAQg
	k4Rf39iYt+4APVTcJsbK9ibZ+DcE94OY7/kYNk5zDcTTqzxShWKKCzBxH5HhaNXx3rc=
X-Gm-Gg: AY/fxX5alE11552cL6nLLYd8wOACSYS7ROIa06FjL7xdKzAqKLwzyhOqSA3inEo/43J
	lzDF/bMAswxKK/JrELtLQ9ac+9+Vl0QW6Y+WqBFZw6G9XMsY2T10iM+onxshI1nziwBk7nlA8sg
	AFkE4QBiGrmftlioRSO2n7GHg5eIhFLwz3f9wbiaTIar4yyhtsw7KOkHTm0zzKCw4ttok/x8VTL
	6g+hzwF9/IrEKUCqtFxE8PfWaFUQUcD3is533uhbcT1+MY9uYsjw9KFURaijkDTghMSu4IyGOUP
	3ynEnmrpZb49ZeGetGbW+LWp8zjZ3n5m0cgPeaqhRQ1cRKkXYu3BkwTj+iJEyUfF0mmiW55kBUg
	iFWya7k3fwiZ2ffkIcWofWDIswisvrYZofO4UGrmYQ+91lSf6YPM6ZQFd0W0ytn042Hp+W0nRbT
	SqG+qbms9sAR6MzBAbPSBt
X-Google-Smtp-Source: AGHT+IFkgPzgcEzzm/S7ihHzPfNjmkpBYEHZP9ugNRs1lGCTGJPSGFfsN+MEX7aZQeQUoYjvcxeOng==
X-Received: by 2002:a05:600c:404a:b0:47b:d5ab:3ce2 with SMTP id 5b1f17b1804b1-47be2a06182mr111267445e9.18.1766412757363;
        Mon, 22 Dec 2025 06:12:37 -0800 (PST)
Received: from [172.20.10.10] ([46.97.169.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm22224955f8f.31.2025.12.22.06.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 06:12:37 -0800 (PST)
Message-ID: <e9a39590-39ce-43ae-8f44-1edd137d4ade@linaro.org>
Date: Mon, 22 Dec 2025 16:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] soc: samsung: exynos-chipid: add google,gs101-otp
 support
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
 <20251120-gs101-chipid-v3-5-1aeaa8b7fe35@linaro.org>
 <653202f78f060b7e001b78604dd26d0f18ab76f9.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <653202f78f060b7e001b78604dd26d0f18ab76f9.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_061240_009103_956369F0 
X-CRM114-Status: GOOD (  18.48  )
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

Hi!

On 12/19/25 5:10 PM, André Draszik wrote:

cut

>>  static const char *exynos_product_id_to_name(unsigned int product_id)
>> @@ -93,19 +99,53 @@ static int exynos_chipid_get_chipid_info(struct device *dev,
>>  		return dev_err_probe(dev, ret, "failed to read Product ID\n");
>>  	soc_info->product_id = val & EXYNOS_MASK;
>>  
>> -	if (data->rev_reg != EXYNOS_CHIPID_REG_PRO_ID) {
>> -		ret = regmap_read(regmap, data->rev_reg, &val);
>> +	if (data->sub_rev_reg == EXYNOS_CHIPID_REG_PRO_ID) {
>> +		/* exynos4210 case */
>> +		main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
>> +		sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
>> +	} else {
>> +		unsigned int val2;
>> +
>> +		ret = regmap_read(regmap, data->sub_rev_reg, &val2);
>>  		if (ret < 0)
>>  			return dev_err_probe(dev, ret,
>>  					     "failed to read revision\n");
>> +
>> +		if (data->main_rev_reg == EXYNOS_CHIPID_REG_PRO_ID)
>> +			/* gs101 case */
>> +			main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
>> +		else
>> +			/* exynos850 case */
>> +			main_rev = (val2 >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
>> +
>> +		sub_rev = (val2 >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> 
> The above looks a little fragile, comparing register offsets between different
> hardware platforms and macros, but I guess it works for now and isn't really
> much different to before.

Right, I thought we'll get this in faster if I keep the old style.

I can introduce a drv_data->get_chipid_info() method and add methods for exynos4210
and exynos850 before adding the g101 support. It duplicated a bit the code when I
tried it, and I chose to keep it as it is now. Happy to switch to a drv data method
if you prefer, just say.

cut

>> @@ -127,10 +167,24 @@ static int exynos_chipid_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, -EINVAL,
>>  				     "failed to get match data\n");
>>  
>> -	regmap = device_node_to_regmap(dev->of_node);
>> -	if (IS_ERR(regmap))
>> -		return dev_err_probe(dev, PTR_ERR(regmap),
>> -				     "failed to get regmap\n");
>> +	if (drv_data->efuse) {
>> +		struct clk *clk;
>> +
>> +		regmap = exynos_chipid_get_efuse_regmap(pdev);
>> +		if (IS_ERR(regmap))
>> +			return dev_err_probe(dev, PTR_ERR(regmap),
>> +					     "failed to get efuse regmap\n");
>> +
>> +		clk = devm_clk_get_enabled(dev, NULL);
>> +		if (IS_ERR(clk))
>> +			return dev_err_probe(dev, PTR_ERR(clk),
>> +					     "failed to get clock\n");
> 
> Could you use devm_regmap_init_mmio_clk() instead?

Will do, thanks! I'll need to introduce a clock-names property in the bindings.

Cheers,
ta

