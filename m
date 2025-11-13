Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1FCCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AurxHB+1uui5/KyI6RjD3+/Z2czI5L1MebXDzDX6mLY=; b=rvzpGxbnZKX3RjHGLIINlj9ozX
	uQh08DjZY9CzSc8g+UvJaW+LmAEb4yubA93afduzCdKWG056rMmbWIy85zM0qRQ7St3EVB4ozRQrz
	W5Fhm0n8e2c+HGUKy9CiUjyoRo+qjo168h3vD7Dr3H28yAPm1krIbqXgAT+y8Ef2478I5YebYyiGw
	2cDAwR4TbSCQSgvOucHTTBxgj6N/Q5lBlN8PxxyoVax5cgTnl88CZ7LF5iCKZuYZIcoU9EcwM1M8p
	j2NnUGrceEXwJRs0AJXuRBhInDoyEjw1Rka72EYEH7+1Ilc4foAFJ2BqcgGQvDfBMGJaDaOMCWlPk
	qn1URV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTxz-0000000AEJK-0sUw;
	Thu, 13 Nov 2025 09:50:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTxx-0000000AEIT-00iZ;
	Thu, 13 Nov 2025 09:50:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E89CC12FC;
	Thu, 13 Nov 2025 01:49:57 -0800 (PST)
Received: from [10.57.40.163] (unknown [10.57.40.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B913F66E;
	Thu, 13 Nov 2025 01:49:59 -0800 (PST)
Message-ID: <953f1aaa-d8bd-4091-9bf6-9538ccdd3bfa@arm.com>
Date: Thu, 13 Nov 2025 09:50:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] powercap: dtpm: Simplify with
 of_machine_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Saravana Kannan <saravanak@google.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-pm@vger.kernel.org,
 Chen-Yu Tsai <wens@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hans de Goede <hansg@kernel.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <20251112-b4-of-match-matchine-data-v2-9-d46b72003fd6@linaro.org>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-9-d46b72003fd6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_015009_175212_41A5A1B2 
X-CRM114-Status: GOOD (  16.28  )
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



On 11/12/25 10:28, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>   drivers/powercap/dtpm.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
> index f390665743c4..129d55bc705c 100644
> --- a/drivers/powercap/dtpm.c
> +++ b/drivers/powercap/dtpm.c
> @@ -548,9 +548,7 @@ static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
>    */
>   int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
>   {
> -	const struct of_device_id *match;
>   	const struct dtpm_node *hierarchy;
> -	struct device_node *np;
>   	int i, ret;
>   
>   	mutex_lock(&dtpm_lock);
> @@ -567,19 +565,7 @@ int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
>   		goto out_pct;
>   	}
>   
> -	ret = -ENODEV;
> -	np = of_find_node_by_path("/");
> -	if (!np)
> -		goto out_err;
> -
> -	match = of_match_node(dtpm_match_table, np);
> -
> -	of_node_put(np);
> -
> -	if (!match)
> -		goto out_err;
> -
> -	hierarchy = match->data;
> +	hierarchy = of_machine_get_match_data(dtpm_match_table);
>   	if (!hierarchy) {
>   		ret = -EFAULT;
>   		goto out_err;
> 

I don't know if Daniel had a chance to look at it, but I can help him.

The patch looks OK.

The extra return error value which is removed doesn't harm the client of
this function in other subsystem.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

