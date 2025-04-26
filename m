Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF14C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 14:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DSi4zR0uq28zmQAXB8VDFfiTdJQqtBQO4bDZ1Ewn84=; b=bTi4iQ3y2tYlzTyLxWEZ0jNXZT
	gXtvQMRvFaCiASuMXfnUCBbc3urA032Y0S24ZCHKaKKd4bzR0U/6IsBlRkJVe6hDfW0HK+lsao9kR
	pfKzcdMDuiDq/AYDCBdjgpMxzd4R65JKoKraF0ymTZgnXltVFD1trgj3xUxsx6isgsAmqBuHlgFKF
	CN5Wul4jQrxmoJYNOVoCcCiiAdq7hrWvya970y8W3wZljG5SOvk9t2c5kx6FpPE4RuNtgGdC39BPf
	MkT87XNqSAuz2og4HO9sX6Y494f63Lo1CPdowAGnyXwC5lxZHJiNxmaKqhPFqcKluaWVIxzNubQFz
	zvKuytpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8g6b-000000028JS-2DuD;
	Sat, 26 Apr 2025 14:02:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fhl-000000025xJ-2cDk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 13:36:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso4799633a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 06:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745674588; x=1746279388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DSi4zR0uq28zmQAXB8VDFfiTdJQqtBQO4bDZ1Ewn84=;
        b=qov2ITsyTaIgZl3blMCDbqz9gYIKP3XHCdLkP/7+aOqV37sjkXj3uaLehViVFMd3iP
         3CQ6q2K4G6fxLeetuhQvk1l/qmBMwTEh6AxetHGfDU1gUNfYwRTVgzl0hew2fk83Pjk1
         uB12dLaEFH4Zy2mgsbRolyeguA+rznfBwL81evC+NwLgDUZNPQhdVGnRrL7UnD82I1qD
         L7f2HnwIiQ4ylejN0IrgJljxEIoXPqTY5lmdyZjUUWs65YkBSJGlP2yefHs1pwsx+ZJQ
         tIiA0Dxhi/xNSkfTTVbOQBHEjfLTypyKhk434gmAzv1ixCq/bHnlL+WVoaMJVTGlrLJA
         P5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745674588; x=1746279388;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DSi4zR0uq28zmQAXB8VDFfiTdJQqtBQO4bDZ1Ewn84=;
        b=qa5EwvVlwfRc3RrZon1FtaaSwLCnZeZx1cVj7uancGJ+MhdMgMM2xFhcCNpL8l8L3G
         g1vGpB0hWbaglf7gf2BcWsT1NpLHSUyqRMqZ+v398dDJnVzlMC50H0FSrJb2ivDI1fRC
         B2zGQNZi7on/sI+xGBdGoa1yYLqHwuvxmpkINkP2c3oahCunIxP7fuQ4YGgHQB70fwxW
         zDkOJbEIwEJCiXPUNQq65ZzUjHiSLIJMWL1ukI1p8y7lXBM8XZ9yZGxI+IoUCAd01Kh0
         8niTs1EFGEfRMLx1FHHuu5XM99XbexWGYWyah3H8iTD0C+hqd+hPleyagZ10X20QqLFF
         1iWw==
X-Forwarded-Encrypted: i=1; AJvYcCUER+uS3p0nX9d9QU9hgaeZ21WtDE2+5CXa++k6bTwSB3g2NshhcRGQdL8Xk5199bq76wcmt9QcBUiOjUgXxk1/@lists.infradead.org
X-Gm-Message-State: AOJu0YxiimrgLniMfqAlHLIIqt0YYqyVTgiHM6kC7ieAtmT+BTCDny0S
	QDaRmXWGVfIJdXwqEykVU0DzgPofWv2O0zNRQiOPoMmx01kpFq6vYYySK0FhRhI=
X-Gm-Gg: ASbGncu99H3cKMG2P9E85c5hRZDK9OqphpHkeKPjVxiy/CAiJPc2Qy6PyK6Vi3zujPf
	3c775nLJGzbwQo+zNS1PhT7EfcwEc+bdpN9rQwvR1xK8060L0Nh33WELQ639woEOMO4sLWEfmL/
	OBGor7aUnrXMwNxi26sPYaH0dvzcH0tpXEmrXkH2xdi2x0TG98vxCZhoCHCjpgsF9AUIRZD/2or
	n1r3WQYvSKkTPTQX3uJ93KBmoDKgDBGSAgzdNrtSrTlr8osNJjNwh92p30Zd4se1FZPyR4EUh4X
	XW4xqiJ7A50e5ja/Ak+KMDHTB24O2FrCqmMXwd1+/+Ed/6HEnw==
X-Google-Smtp-Source: AGHT+IGFY/we5oPj5BLcTsNv8SWpZqerfwxabzo7n0VvzgXfX7TOdes2xHvpN6ZPYUBny09V6ObQIQ==
X-Received: by 2002:a17:907:3f8f:b0:ace:4df8:b0c6 with SMTP id a640c23a62f3a-ace7136df26mr511805366b.38.1745674587960;
        Sat, 26 Apr 2025 06:36:27 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e6498sm290045566b.42.2025.04.26.06.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:36:27 -0700 (PDT)
Message-ID: <22b722eb-5ef1-4542-a5b2-10222b4eb6c4@tuxon.dev>
Date: Sat, 26 Apr 2025 16:36:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: at91: sckc: Fix parent_data struct for slow
 osc
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com
Cc: sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
 <d470bb761530827889beaa2c2815e127fc8b412e.1742916867.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d470bb761530827889beaa2c2815e127fc8b412e.1742916867.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_063629_671132_8A581F32 
X-CRM114-Status: GOOD (  19.97  )
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



On 25.03.2025 17:55, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The slow xtal is not described correctly as a parent, the driver looks for a
> "slow_xtal" string which is incorrect and will not work with the new
> formating of xtals.
> 
> To avoid this and keep this driver backwards compatible the
> parent_data.fw_name is replaced with parent_data.name and the original
> parent_data.name is replaced with parent_data.index. Using the index is
> safe due to the driver requiring only 1 xtal.
> 
> Fixes: 8aa1db9ccee0e ("clk: at91: sckc: switch to parent_data/parent_hw")
> 

No need for this empty line.

> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sckc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
> index 021d1b412af4..952a805b6f7e 100644
> --- a/drivers/clk/at91/sckc.c
> +++ b/drivers/clk/at91/sckc.c
> @@ -374,7 +374,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
>  	const char *xtal_name;
>  	struct clk_hw *slow_rc, *slow_osc, *slowck;
>  	static struct clk_parent_data parent_data = {
> -		.name = "slow_xtal",
> +		.index = 0,
>  	};
>  	const struct clk_hw *parent_hws[2];
>  	bool bypass;
> @@ -407,7 +407,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
>  	if (!xtal_name)
>  		goto unregister_slow_rc;
>  
> -	parent_data.fw_name = xtal_name;
> +	parent_data.name = xtal_name;
>  
>  	slow_osc = at91_clk_register_slow_osc(regbase, "slow_osc",
>  					      &parent_data, 1200000, bypass, bits);
> @@ -476,7 +476,7 @@ static void __init of_sam9x60_sckc_setup(struct device_node *np)
>  	const char *xtal_name;
>  	const struct clk_hw *parent_hws[2];
>  	static struct clk_parent_data parent_data = {
> -		.name = "slow_xtal",
> +		.index = 0,
>  	};
>  	bool bypass;
>  	int ret;
> @@ -494,7 +494,7 @@ static void __init of_sam9x60_sckc_setup(struct device_node *np)
>  	if (!xtal_name)
>  		goto unregister_slow_rc;
>  
> -	parent_data.fw_name = xtal_name;
> +	parent_data.name = xtal_name;
>  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>  	slow_osc = at91_clk_register_slow_osc(regbase, "slow_osc",
>  					      &parent_data, 5000000, bypass,
> @@ -592,7 +592,7 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
>  	const char *xtal_name;
>  	const struct clk_hw *parent_hws[2];
>  	static struct clk_parent_data parent_data = {
> -		.name = "slow_xtal",
> +		.index = 0,
>  	};
>  	int ret;
>  
> @@ -609,7 +609,7 @@ static void __init of_sama5d4_sckc_setup(struct device_node *np)
>  	xtal_name = of_clk_get_parent_name(np, 0);
>  	if (!xtal_name)
>  		goto unregister_slow_rc;
> -	parent_data.fw_name = xtal_name;
> +	parent_data.name = xtal_name;
>  
>  	osc = kzalloc(sizeof(*osc), GFP_KERNEL);
>  	if (!osc)


