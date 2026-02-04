Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A0FE95367
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17mdBVJ/BxCpkvtQ0p/YqUqnFTuIJSk9AaIKX6mK0A4=; b=lnuScPQHlvRrOqXGDgWAlq2U75
	G5euNfqMWLTkZRVq1xVt88hJ3PRe89Xl0A0H8eiNVEp7GTHe3jfxJg+7y80SQqVYwgUnbDBDp5b4h
	5LLkIi8SBqjihyazqRFQh1uVED4UuxgHQv6YjAUffFJz9I7PZwyhoUS1+kIsq69dJhZVLsh2kDiKt
	EBK2lZYEC0lYdrDfTxje0WnbMJkUS9JrAroOJFjFNIDrsyMd4ww1u8bDbs781LdfZHX1LkCsGCd+I
	tHVQuLzu2kGMUpP2Lv77/KpbUYFgQi8JpjVU2/Firntp8f84SFTZa7uzRRSbUTA8ZoA+z8YDKKa2Z
	TUZ05wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZgi-00000008GAc-3R6J;
	Wed, 04 Feb 2026 10:00:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZgg-00000008GAE-0H4u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:00:43 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f5bRr4S31zHnH7q;
	Wed,  4 Feb 2026 17:59:36 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id B5DB740572;
	Wed,  4 Feb 2026 18:00:37 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 10:00:35 +0000
Date: Wed, 4 Feb 2026 10:00:34 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Abdurrahman Hussain via B4 Relay
	<devnull+abdurrahman.nexthop.ai@kernel.org>
CC: <abdurrahman@nexthop.ai>, Michal Simek <michal.simek@amd.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v10 1/7] i2c: xiic: switch to devres managed APIs
Message-ID: <20260204100034.000050b2@huawei.com>
In-Reply-To: <20260204-i2c-xiic-v10-1-c2b996425235@nexthop.ai>
References: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
	<20260204-i2c-xiic-v10-1-c2b996425235@nexthop.ai>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_020042_409870_9F419513 
X-CRM114-Status: GOOD (  19.77  )
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

On Wed, 04 Feb 2026 07:01:58 +0000
Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org> wrote:

> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> Simplify the error code paths by switching to devres managed helper
> functions.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

A quick drive by review whilst I have a coffee...

1st one is a taste thing. Second one is kind of a bug - be it one that
I think is probably harmless.

> ---
>  drivers/i2c/busses/i2c-xiic.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 28015d77599d..16ff83fe280b 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1423,6 +1423,7 @@ MODULE_DEVICE_TABLE(of, xiic_of_match);
>  
>  static int xiic_i2c_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct xiic_i2c *i2c;
>  	struct xiic_i2c_platform_data *pdata;
>  	const struct of_device_id *match;
> @@ -1461,7 +1462,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
>  		 DRIVER_NAME " %s", pdev->name);
>  
> -	mutex_init(&i2c->lock);
> +	ret = devm_mutex_init(dev, &i2c->lock);
> +	if (ret)
> +		return ret;
> +
>  	spin_lock_init(&i2c->atomic_lock);
>  
>  	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> @@ -1472,8 +1476,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  	i2c->dev = &pdev->dev;
>  	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
>  	pm_runtime_use_autosuspend(i2c->dev);
> -	pm_runtime_set_active(i2c->dev);
> -	pm_runtime_enable(i2c->dev);
> +	ret = devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return ret;
>  
>  	/* SCL frequency configuration */
>  	i2c->input_clk = clk_get_rate(i2c->clk);
> @@ -1489,7 +1494,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  
>  	if (ret < 0) {
>  		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
> -		goto err_pm_disable;
> +		return ret;
>  	}
>  
>  	i2c->singlemaster =
> @@ -1508,16 +1513,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  		i2c->endianness = BIG;
>  
>  	ret = xiic_reinit(i2c);
> -	if (ret < 0) {
> -		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
> -		goto err_pm_disable;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
>  
>  	/* add i2c adapter to i2c tree */
>  	ret = i2c_add_adapter(&i2c->adap);
>  	if (ret) {
>  		xiic_deinit(i2c);
> -		goto err_pm_disable;
> +		return ret;
>  	}
>  
>  	if (pdata) {
> @@ -1529,12 +1532,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
>  		(unsigned long)res->start, irq, i2c->i2c_clk);
>  
> -	return 0;
> -
> -err_pm_disable:
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_set_suspended(&pdev->dev);
> -
>  	return ret;
Trivial but if you are respinning...
If you get here we know ret must be 0, so make that explicit to the reader as it
was before with
	return 0;

Otherwise they need to look up a few lines to realize that is true.

>  }
>  
> @@ -1555,8 +1552,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
>  		xiic_deinit(i2c);
>  
>  	pm_runtime_put_sync(i2c->dev);
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);

Take a look at docs for the devm_runtime_enable() that is called
by the cleanup for devm_pm_runtime_set_active_enabled()

Short story, it will call pm_runtime_dont_use_autosuspend() for you

>  }
>  
> 


