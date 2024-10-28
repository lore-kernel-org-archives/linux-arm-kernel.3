Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EDAD33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkP0+GfB4+j93jbSm3je77DYUaHxULsEZggoMq4brYU=; b=RHUVAjoqpIXE2EQyrpNHNyzChp
	iJa6vX/We5ZBmF5EYnb+RAFVkGtbCFmXl0il575G8EhQ+6D5mPwuX2py2V1TZIDF2LlojYlB1FtdN
	OCNxDVLkFYrGRrLeQ6irn5shzOgPqjAhOHKpCTw4Dp0GJY3UiUNdCr3dgvSigFe2ORrIWRrqZa5tj
	eAmsoVo6gIHkKNMutZpO+RiNQ1WvQFuhHjmifIHZR3+0uPq5/9pICEkArmCaKXY3s3bOCcOeAULCo
	6jIenOpu4G88ifbCl/ZYo/1oS5t8UV028f17ySDDZIS9f8TEFWTMBFC+uHBDAI+47PiebUyLWQMHO
	EOTBghYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RMY-0000000BG1w-2dlN;
	Mon, 28 Oct 2024 15:08:58 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QtP-0000000B9QB-17CR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730126331; x=1761662331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VnKHNq/LVYhXDEEst8PtAj0P/TxTkAgJaUiIvrCxnO8=;
  b=PChxgv2/E5kSN5X1iD1ufQAOAYSEYmB8lXmnqrr9rlaWtGbCWtX6u/NG
   DVCfWpmVGmqnuZNu4j5bpMljvl6v7u02Dzr6FjUvm/7/EnkGty50HileV
   zCO34NoZCjqXbl3WxpwDE0zXFJoTdjWFgmI89NPtiqKaCZYrSKyoctuTN
   ET4rO3maeImH34DXbnDlfa03M4wk6VTGM9LNnIXWf5nx1cSXAV0ijgiSD
   oQ90UVWQ86BX9lAljz8q3gE3thyFMgpvQbTCgBVuhluTnSWTyjwm5Aq7T
   ttmShHAFwFB84vPi8+HvdnwdEFKajweqO+PqQH8mQRz5p8KfUtxXu2kmB
   Q==;
X-CSE-ConnectionGUID: c+8YnRujTF27RvYkHPV9Yg==
X-CSE-MsgGUID: M2gXOTn/QxKpjMiFW3sMzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52277498"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52277498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:38:46 -0700
X-CSE-ConnectionGUID: Zv0JGberReG955Uff7Y88g==
X-CSE-MsgGUID: X4oBG17qSt+qqfke9r9MQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="86424632"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:38:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5QtB-000000085dP-42c5;
	Mon, 28 Oct 2024 16:38:37 +0200
Date: Mon, 28 Oct 2024 16:38:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <Zx-h7QUnCKwtu8iC@smile.fi.intel.com>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-4-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028142000.1058149-4-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_073851_386624_4D1DFC87 
X-CRM114-Status: GOOD (  21.42  )
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

On Mon, Oct 28, 2024 at 10:19:57AM -0400, Aren Moynihan wrote:
> The vdd and leda supplies must be powered on for the chip to function
> and can be powered off during system suspend.
> 
> Co-developed-by: Ondrej Jirman <megi@xff.cz>

Missing SoB. Please, read Submitting Patches documentation for understanding
what has to be done here.

> Signed-off-by: Aren Moynihan <aren@peacevolution.org>

...

> Notes:
>     I'm not sure what the proper way to handle attribution for this patch
>     is. It was origionally based on a patch by Ondrej Jirman[1], but I have
>     rewritten a large portion if it. I have included a Co-developed-by tag
>     to indicate this, but haven't sent him this patch, so I'm not sure what
>     to do about a Signed-off-by.

Ah, seems you already aware of this issue. So, either drop Co-developed-by
(and if you wish you may give a credit in a free form inside commit message)
or make sure you get his SoB tag.

...

>  	mutex_init(&data->lock);

Somewhere (in the previous patch?) you want to switch to devm_mutex_init().

...

> +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
> +				      data->supplies);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "get regulators failed\n");

> +		return dev_err_probe(&client->dev, ret,
> +				     "regulator enable failed\n");

> +	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to register regulator cleanup\n");

With

	struct devuce *dev = &client->dev;

at the top of the function makes these and more lines neater.

...

>  static int stk3310_resume(struct device *dev)
>  {
> -	u8 state = 0;
>  	struct stk3310_data *data;
> +	u8 state = 0;
> +	int ret;

While changing to RCT order here, it seems you have inconsistent approach
elsewhere (in your own patches!). Please, be consistent with chosen style.

>  	data = iio_priv(i2c_get_clientdata(to_i2c_client(dev)));

-- 
With Best Regards,
Andy Shevchenko



