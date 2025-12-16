Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CDCD5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5zoZFyP/UKoHmMIxoc2u4i7dlhbVg1+Ja56v9O8ZVo=; b=d8+Xe/taorg2Q8agVwuvq2Dbwz
	f8ryipVMzUB55108OXePXl3mF+4O6N0SuGE5zhbk2oO1WNd6GqSKaBOr+lBx72p44RSp6pXlO3emW
	UPvimXALN40IxxzR2a2j0y/aUTwlkF3uVoIhk2kFWMMgFEapS/qZYY7FsToHMmyXT9C2zBoSeVPNf
	LAu8UKwQfeFoSkoHgG/sSI81FhpR4dK5l9DDBu9GBwkv+5tlCqB8oxnDosiBUNUXOqswTwYnCryum
	Qay41VERacYvYfjd2LVWUPb33YDbxJqwGppO7EXIOc3gjLa2KWuoLcYTtRGfLRfrszenbXHPCr22n
	PesORlzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOJB-00000004lZe-1gDB;
	Tue, 16 Dec 2025 06:13:17 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOJ8-00000004lZH-3kST
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:13:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bfe88eeaa65so2848776a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 22:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865594; x=1766470394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u5zoZFyP/UKoHmMIxoc2u4i7dlhbVg1+Ja56v9O8ZVo=;
        b=nJ0bse/XXJpITGQCZJ5XWdHDONC6LcRNDGT7E3k1cDcYQMgc66ILF2MFdRsiLsG1e3
         CXxMeVIDMjLNbMETq7I9Xc0Z305cdbHGcbjP8irHGpPzNZCLDrezaGgTne6jvGFLZEe7
         9YLtLHQ6giztjDujpCvmu8Mi3SL6J8R3wm6i+8hsY7JM9ybqWcWNlKUqr0XBOl9HcilI
         U4qZUy1cy577nwZjcsj7ZFe4l39UYO5/6OYnopC3CFjLLaYizwJsZE5WXUjvoz6Dp5As
         8zo9badUkE8/zrN0isLuN+LiAFqokxqyA4npAiBKqHImnjVAjEpwmM0fkDtob+6ObT0E
         vqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865594; x=1766470394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5zoZFyP/UKoHmMIxoc2u4i7dlhbVg1+Ja56v9O8ZVo=;
        b=jdBqmbzBgGq+ZefMuaJm94TltO2/Uh4vbd9Gu0buK55PJXPMVKiJtvfd2Z3NzBfgly
         zVvVOxMmc0dJoUWck5pEVjzpc/pe2uXzxhcer3puXGjRiT25QggMvYKIPXzXMFBm4sgL
         QLvFEgX51zPXPWKhZyYZC1DfXtqWV7QPKqy96DdjuzYBh66yzeJwOrPAGOkxC95LX9by
         nmAMmtiWbRf0gg2dnrP+VsPagDHfRVMntOOUfVPB/dkGeoDTfO7yIK7dt+YYATj+3Fti
         N1X+0ZyeD6HfrBQDbwleC82vDdwC171cM4R0vb5faioTVYAlsLAwt7eIgH5tmwDbs95i
         dkAA==
X-Forwarded-Encrypted: i=1; AJvYcCVlereOvVsriPXL/cxxviYwnpW662MgJPgq2ZxBXD99DK+JgZFzV6JiOG0Qk4RrQj/KpaoMCnUhanJyV4qd1oP0@lists.infradead.org
X-Gm-Message-State: AOJu0YyIZEr88bPq8KG1grGFH7r2G7QjNnDWu43pWMlNLZN+sXHsCW4p
	claxNMfXoKz+UepDhSNnodvLAAYwyE5/b9TZd+RUTAiqWnEO6UAIEBM9
X-Gm-Gg: AY/fxX7+//ZCypTRC3r7wd2kn5i9ErtR1AiiPgzmqt+sEgdmv6aW91Nir8bYPC8WDDg
	AbBRy2Zj6NRf8+rAVW2AskPajKkEUJIHrAmnW8fM8pY7vvGPKWCYcOdvie+PUZ1wvV8yX3OQFkk
	hYAWv9pWRt+Y1n+J6hLiJ7rviLq73vkF+pz5ccVON+KVJbtQljgGrmsExewZ5Zo30fuWFc7MnLn
	akBgp0CWCBn2AGC5IF3Q0ObvjzUmuNjP6GmY0Oc+ivjWwYPrA1PlAdv8XyYiaYLnbcNjVwLUp65
	gsJ36SXJ7ndHNGjiq69oFusXJrAVKmH29iQ6mX1POIGCHSYsj1ZYJiIJh6rqbKhY6BasgDuJA2v
	sPsUlW6997kEfj1M1jTVC6f0yjUY5j4xcQ+WyE8JcV20yCQ5onaEz6NtvWpReeZLdqbjn71hVZR
	svASV3SZXEyW2jn5ZawehcrM0/pwQDOyZ+COb+g7+BkD/J9AsKHZ8=
X-Google-Smtp-Source: AGHT+IEmPAJNRn3fZOAHPgVaJN4wVPNoEF0Tp25i8w7vUd23/VJa6NjYmY8OiorI1jp6xbp+SVUYoQ==
X-Received: by 2002:a05:7301:907:b0:2ac:1e68:2331 with SMTP id 5a478bee46e88-2ac3014dd34mr7837424eec.39.1765865593824;
        Mon, 15 Dec 2025 22:13:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0546d9sm499892eec.28.2025.12.15.22.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:13:13 -0800 (PST)
Date: Mon, 15 Dec 2025 22:13:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Input: stmfts - use client to make future code
 cleaner
Message-ID: <hpmm5fhs74swrhkneaif4s5dquqeclujdlua7ygmkvcmtf6n4t@rsahxu23xwfp>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_221314_934104_C627591E 
X-CRM114-Status: GOOD (  20.46  )
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

Hi David,

On Mon, Dec 15, 2025 at 03:30:04PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Make code cleaner, compiler will optimize it away anyway.
> 
> Preparation for FTM5 support, where more steps are needed.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/touchscreen/stmfts.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index 4b166b0a9a5a6..06845a00348cc 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -747,9 +747,10 @@ static int stmfts_runtime_suspend(struct device *dev)
>  static int stmfts_runtime_resume(struct device *dev)
>  {
>  	struct stmfts_data *sdata = dev_get_drvdata(dev);
> +	struct i2c_client *client = sdata->client;
>  	int ret;
>  
> -	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
> +	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);

Sorry but I do not see how using a temporary cleans things up compared
to a simple structure member access, given that it happens only once
here.

>  	if (ret)
>  		dev_err(dev, "failed to resume device: %d\n", ret);
>  
> 

Thanks.

-- 
Dmitry

