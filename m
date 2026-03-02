Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38644D58E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e68qiM5Z/tLR2me+b5hOCaInO/EcJkXq3qS1H6cb7Bs=; b=aldSVdjIco14CqnFLTYL1HhTcR
	WNNXGqQ+DAZ1QyhHdnVSaeRfqwo/FBAjWj8NAobSTmiQQEmby5YkujJuP3bpYit2LuP+3HemI9rZn
	QQuBugNy6Zs73N5H6iOsNxvlrhcVqxAsEDcs2wjC0WrMub7PQ0w/ioJAlow87gj16OxyLc+F8C9sk
	EgVhvWi0ob5tJjFH6vTr2Axxb2gNAxD+bjMTxQuONWplXfpYO+NZG5vlo9ite37AIxA+pPxWJIadT
	zRqtw4JndtzT/dlOGDSDoQUJhGpiZ+eVJjuivGmjrvYKse5p6GYg8NrgJ8nO8e29Jo6TMWQLZxCyD
	uZAwXXpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxzm-0000000CRD7-0F0B;
	Mon, 02 Mar 2026 07:47:14 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxzk-0000000CRCR-0NxI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 07:47:13 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-386b553c70eso62404451fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 23:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772437629; x=1773042429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e68qiM5Z/tLR2me+b5hOCaInO/EcJkXq3qS1H6cb7Bs=;
        b=Sd3n28shNO6cbCYYrAHezxFlRwmiO4LK2df55RbfPjXQSj2twm6d3exMGrtqgVA8sG
         sDqaqQya8VeF06Pc3t6kYLOgnoa6PTYFVdBUgCAs6EP8SKXenxK0zY8PrSNmQ2c0W1gn
         g82OwaTlVWKfLnoDsoPXGjC3oTHypcJhpdELOjmnVWVdC9AnfctOJgjkoX5JMp44Gonq
         KstsflGCX4P/64Fk/sYXVS2KsIeuB02T/UmJ5WPHwIX248m3X0s/ClIn8aNcl93hga36
         XWygcNwKKbnFUdXRPw7Pm3wMenwdt11DyIC1P/U9KOwGGVlAxfmzU7vl233NjI1BvGPp
         m41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437629; x=1773042429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e68qiM5Z/tLR2me+b5hOCaInO/EcJkXq3qS1H6cb7Bs=;
        b=mPeCpoiCrrL62Vbc/ErwSMFTKgkRno30hNepB/PX8pt9QS0pFCfUUSH4qfv11FKd7t
         zUVoeFQqgYmiVSdyeKtUITV9jUX0s3wlJ/PFk3HT7kcXVrsWaQ8QbBdCyV2hBmSryKuY
         wavxmTeyDpqMclz3vDBtJ+LZSBSl67RDKkNi3cc3jdOiUIpynamJtaHyDF55vXEgV6o2
         x5XERPknwSpO4AGvXBaAsrNlXJHTk5V21rTBRbzwTYjRYzxd47T7dFqsUU0egmXiObyX
         cRPx+hsPn0swe7Vk+ttJcOVbfVDocvzstrq51+ODaL/Huc+yWGSRlAHD8MPpT+Eorp2I
         EJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLgjkj8dtHPtd8hd5f0xBtPp7LDF3s1bKLe6k0TDnE5b7rjoxNmaghFWFYM5r7CoVNluwKA79YOvKROcao/E4f@lists.infradead.org
X-Gm-Message-State: AOJu0YxSpvqLzvoa42r9/dOTb1sihW3BKpvh7kUvMk/L/M7A98M0ZJBr
	LpEkQye9b3nJpv/uWyKOrXNb0Lk3fZl/snAPaHzBE+U5ZHJ0wNCQvIif
X-Gm-Gg: ATEYQzwXvdXT/jIh+sp7IDLdZvMZCGqofIeRYBJz6nVp0U6MlKaWEaTALSbTwl5KCzZ
	c6LY06LjMb/XeCi2M7dqfebWBbGticWkMOspoc30ytyjw3Dk3WSEV0Esncbhm7w/PCV3Lq0nLts
	NYhNYnKZgeXrJZVVg520EIaymhmfFSJ/SDcKBtFUFUXSGP9fkZki3IVjKcwAekJYG80RScXtdWk
	GjvD7bozA6NnNviADDkq00fuPg5sNNfTysoYsq/z3Di5FlZfXbCYRrDOdfzSGZv+N4B7MVFEnJi
	nxImnc74yOCKirGzesrzFsEv4vixPPod1++wZkgFvZhC4YV3Ux25I85eqa5lh6B+x2j81nSf2HY
	hRwf0CljogFol1BEo1+uoQkpOLE3Vank2un+N0nZH+sPTB4HhcTo5DZN06oTzVz+pOtq6+4uAXl
	9UydjrKPLd/dQTKFC6rDQ2XzYY8g==
X-Received: by 2002:a05:651c:1c7:b0:383:1c5f:84c7 with SMTP id 38308e7fff4ca-389ff130e18mr78428611fa.12.1772437628986;
        Sun, 01 Mar 2026 23:47:08 -0800 (PST)
Received: from [10.38.18.76] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a319f05sm3299418e87.50.2026.03.01.23.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 23:47:08 -0800 (PST)
Message-ID: <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
Date: Mon, 2 Mar 2026 09:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 Matti Vaittinen <mazziesaccount@gmail.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_234712_200483_21384A2F 
X-CRM114-Status: GOOD (  18.27  )
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

On 2/23/26 11:05, Bartosz Golaszewski wrote:
> In order to stop i2c bus drivers from dereferencing the struct device
> embedded in struct i2c_adapter, let's allow configuring the parent
> device and OF-node of the adapter directly through dedicated fields.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/i2c/i2c-core-base.c | 5 +++++
>   include/linux/i2c.h         | 4 ++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9c46147e3506d15d53b9b7d6b592709de56e41b9..dd8cec9b04c64b8340d20e018ab5ba28f1f7f5c9 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>   	adap->dev.type = &i2c_adapter_type;
>   	device_initialize(&adap->dev);
>   
> +	if (!adap->dev.parent)
> +		adap->dev.parent = adap->parent;
> +	if (!adap->dev.of_node)
> +		adap->dev.of_node = adap->of_node;
> +
>   	/*
>   	 * This adapter can be used as a parent immediately after device_add(),
>   	 * setup runtime-pm (especially ignore-children) before hand.
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -761,6 +761,10 @@ struct i2c_adapter {
>   	struct irq_domain *host_notify_domain;
>   	struct regulator *bus_regulator;
>   
> +	/* Device configuration. */
> +	struct device *parent;
> +	struct device_node *of_node;
> +
>   	struct dentry *debugfs;
>   
>   	/* 7bit address space */
> 

Hello,

Automated driver test system bisected this commit to be the first bad 
commit, linux-next next-20260227 was tested. Failed tests include driver 
tests for ROHM PMIC and accelerometers, which are connected to 
BeagleBone Black.

The failed driver tests all fail to first i2cget and the tests stop 
there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or 
directory".

BR
Kalle Niemi


