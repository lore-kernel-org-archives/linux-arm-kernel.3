Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2D7C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpKqYnXH25f3lqGlUZbd0EpV+dGbWQ4Gs839plYWRIY=; b=m6pf799WLeRrJe92ah+LPIxoHD
	Vfy6aiF3b6gX/2RuBRg3tlNu1cUTqVIkcb7gpYQdZhqPDyEscrPmU01sDP/O9sIUIT9FyXavVIiaC
	HWdXRjruHzbb7jP45vto79GOx+MsjZ+HdT6mRhLxT1VB4VLuWvgu0RX4eQ1ldHN06GFTUfUYf1h31
	lKr261zZ9K/bMUn0UoVSPZKttBOTioPyngBulZOl34g9guxYmqv6rVt15KydEekpNh8aOHzec+L9T
	3WeulzjbXXN/ShIanEmoXLrsULu7/9jR6OvcajdaH90lpbzpxrjrZOkqyqTSfb6oYAXHN65DxSNRe
	MCs6vwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8g4m-000000028BT-2u4i;
	Sat, 26 Apr 2025 14:00:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8fhC-000000025tF-0TAs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 13:35:55 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so5610910a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745674552; x=1746279352; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpKqYnXH25f3lqGlUZbd0EpV+dGbWQ4Gs839plYWRIY=;
        b=cJkWoXADLq4S8vM/4poZ6PfnGZCfXSruT5Ox113ZXuw0SYC2DXFN7Qj/G6cCN+zlVt
         ZwvDJKjT0qzYDiLcytKBZX/QCIUJf8Iq3ewWyyggwQ2f9jaHae0YEIvkQwLu2uBmlBUa
         Zgbltg8svyv03W96d/1+uDkQAU7YOJydu277zN2NXlNCz8y4DffMivzd+sN+7Vz/jQ3Q
         xP847O1epC9WmOGkHHzvwse0n4Ruk8g1FsPncRsWwP6c0N5n+rBCu/gd056JmCD58Lrl
         ++rzSjFNuPori39PdymMSd8wgoEWtt7rZ20DfwQmKZR7P7HsF1dMmxO37wqKMOt7gehY
         wFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745674552; x=1746279352;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpKqYnXH25f3lqGlUZbd0EpV+dGbWQ4Gs839plYWRIY=;
        b=Zaqb7PQFKBQoyWy1wP3ulQd7QS9SQGbz2AKwhvTyWh5EblmSV1NY2SMHJfm/v34IFW
         FsnBXUBNjBLpL3qMlN3YmxB74UGOJCbB3u10EWV38dC2IqscBVE0Ii0taDn2reks8tDu
         xeufXholUSjO37kSeSZLDhwBfkvEeZ0j/UzOgHRbWD53gmmscuLgU4KmIWKwdK8LySuv
         yp1fVfQ54z22F1lhSPHuLdPiFtClQENhin5CoucpJoDpnhlJduYWuzT43r3FSqIkCNf3
         IB2leKG1E0Q4tX8SX7fHrpBT2/tHK2KuTWLa4PMsi3l5+mwDXkYPdJ23zDdN7bjaKxlr
         xrrA==
X-Forwarded-Encrypted: i=1; AJvYcCW/jNsrKMZN0/wqz2DbLh34pUuDzwfyeY8JLDE7QGEkysrW4RmmoVW+zpQ+rx2pZ6xZdHsN83cpf23BU27Xt9tr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv4FarbogWzalMW+7xrReXsWJ/dMDjJYzWUjliK5L4r3nA48dK
	snNUeZHXJ3Xvl2h+3T12R8+zlL9r4/I41AsN3S3kOINkWusGyopowuw0gt9o/To=
X-Gm-Gg: ASbGncs4Ay301u2kasrymASbcEHwGITZvjUEwIilGSwvIe/xzrkoRdrW3t0XFk/WD1/
	xdvSry0KOhDIpVZDIOeEqv7tl1Prfg95OdFdXt8/RVJFussNuxYT/Ev21CQ6f4DZcKPwmfC7Eh4
	Uyfa4sYP9AiCqDJ3z6S1CSDiZjTwBVdCqcURk0Lup5FtKSjE5D0FZWmJ6T+bb6NHdtt3XxEcdsa
	dpP6SqOE3BvkAv5c0feVmmpO89Xc10vfnHOnxKSBb7kkc8h8Rexl2DBE+70GV55zBOl18GFWMK+
	c+Va6i1KyUU6d9PEXiEuSLr4vw0RFd/W8H5AEreZmUPFnUe7CvJ7lI26JBY+
X-Google-Smtp-Source: AGHT+IEqy1Bjndt2pvxsKMV5+EcxiW6j9NOhnrynY2cN18NYigRKOQiOJgaMqvmfCZqpsJ/rAvLIew==
X-Received: by 2002:a05:6402:4286:b0:5f6:23d2:e6f7 with SMTP id 4fb4d7f45d1cf-5f723a1346fmr5017034a12.32.1745674552326;
        Sat, 26 Apr 2025 06:35:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464e6sm2639700a12.64.2025.04.26.06.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:35:51 -0700 (PDT)
Message-ID: <47b54406-42d8-41cd-a561-9073db09666e@tuxon.dev>
Date: Sat, 26 Apr 2025 16:35:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com
Cc: sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
 <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_063554_158252_26441D79 
X-CRM114-Status: GOOD (  17.12  )
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

Hi, Ryan,

On 25.03.2025 17:55, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The main_xtal clk_hw struct is not passed into parent_data.hw causing an
> issue with main_osc parent. 

Can you please describe the issue?

> Passing the main_xtal struct into the
> parent_data struct will ensure the correct parent structure.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama7d65.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index a5d40df8b2f2..08306261c9c7 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  
>  	parent_data.name = main_xtal_name;
>  	parent_data.fw_name = main_xtal_name;
> +	parent_data.hw = main_xtal_hw;

I think, from time to time, you can still hit some random failure as the
parent_data.index is still not initialized. I think the problem may be
solved by doing something like:

-	static struct clk_parent_data parent_data;
+	static struct clk_parent_data parent_data = {0};

Can you please check with this?

Thank you,
Claudiu


>  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>  						 &parent_data, bypass);
>  	if (IS_ERR(main_osc_hw))


