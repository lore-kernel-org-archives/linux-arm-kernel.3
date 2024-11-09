Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CB7D5E368
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NvoWxOGMS26RaMPQeNkP8wJhymcZ2E5Ofu6/v8OGTc=; b=UC9Mxe19du10VmCKu6XE7E/Pgf
	DrKghbUuNHEsR4RQniBu5Cj2UKViEgcbmJzBLA7QSxZYKFDIvUia1m1gIXVzZUbCuqZ1Om/Q3ZjJT
	YyAwVNWAXhmyYoO0uIhZAnVhUNz9wpVt0W1zCuS56t6C8Eo7vkCWoG0Z1qDm7z+yNhHKPdk3VZj46
	lc3TUDqabepIuPCK+Dl7/AzTngrBqXV9now4C+K01bO9czF79MsRHA79ElHPh0ZjVY2g4VxFuZ4Xl
	QO138RIUPKaZ43NKzbGhz/DtI35DMkO+mXumMDpB1hdNsTblHFVD74lVJzi4MzFUGGZQlSBfCVC/n
	xYKB6XGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9lLs-0000000DOT6-1qHr;
	Sat, 09 Nov 2024 13:18:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9lK7-0000000DOMd-08UV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 13:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E00035C555C;
	Sat,  9 Nov 2024 13:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9964C4CECE;
	Sat,  9 Nov 2024 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731158176;
	bh=W8bqZLpt4rrtBzLA5A6KOuK7kihkpV/PaF/68GqkGYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jdQl9hCmLhD1qtr2s0+I48Op0yghNG8fgHQw7ehzVh+/6TSFo7sX8tGvLkuuHLmxZ
	 2Dmi/0WNBxgljjxrnYXnJ3l+MJvEhLEPQqIwPx7LkA3mPIbTv/jRiwilWJsEQK5dWk
	 bse3kCWLGmJwThuqA6axk5wAOyw0SM1wKe/Fx7BFEZ7lWT3a5zKBx5vmLv2mb1aIur
	 aPkJ1U4609C9BbexDRUyPyK+tIW3DKLw8e8wiorkzwQ863UgLCUdy+Wbyn0U9LP8I2
	 RDEr/ZNvW/Ar2FaYA7Wk9qpw6xbsj4IZS8+UrqUl+SCLzC6owZvh7GU1IH9+IPz/pX
	 OhG/J3lDZMCow==
Date: Sat, 9 Nov 2024 13:16:04 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof
 Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: tmp108: Add support for I3C device
Message-ID: <20241109131604.5d8b701a@jic23-huawei>
In-Reply-To: <20241108-p3t1085-v2-3-6a8990a59efd@nxp.com>
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
	<20241108-p3t1085-v2-3-6a8990a59efd@nxp.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_051619_195847_6736E89D 
X-CRM114-Status: GOOD (  20.94  )
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

On Fri, 08 Nov 2024 17:26:57 -0500
Frank Li <Frank.Li@nxp.com> wrote:

> Add support for I3C device in the tmp108 driver to handle the P3T1085
> sensor. Register the I3C device driver to enable I3C functionality for the
> sensor.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/hwmon/tmp108.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index bfbea6349a95f..83d6847cb542c 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -13,6 +13,8 @@
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/i2c.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>

Seems odd you need master.h in a device driver.
I'll guess that's because you should be using i3cdev_to_device()
and not looking in the i3c_device structure at all.


>  #include <linux/init.h>
>  #include <linux/jiffies.h>
>  #include <linux/regmap.h>
> @@ -442,6 +444,35 @@ static struct i2c_driver tmp108_driver = {
>  
>  module_i2c_driver(tmp108_driver);
>  
> +#ifdef CONFIG_REGMAP_I3C
> +static const struct i3c_device_id p3t1085_i3c_ids[] = {
> +	I3C_DEVICE(0x011b, 0x1529, NULL),
> +	{},

Trivial, but no trailing comma needed here as nothing can come after
this terminator entry.  That is also consistent with existing similar
tables in this driver.

> +};
> +MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> +
> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(regmap),
> +				     "Failed to register i3c regmap\n");
> +
> +	return tmp108_common_probe(&i3cdev->dev, regmap, "p3t1085_i3c");
> +}
> +
> +static struct i3c_driver p3t1085_driver = {
> +	.driver = {
> +		.name = "p3t1085_i3c",
> +	},
> +	.probe = p3t1085_i3c_probe,
> +	.id_table = p3t1085_i3c_ids,
> +};
> +module_i3c_driver(p3t1085_driver);
> +#endif
> +
>  MODULE_AUTHOR("John Muir <john@jmuir.com>");
>  MODULE_DESCRIPTION("Texas Instruments TMP108 temperature sensor driver");
>  MODULE_LICENSE("GPL");
> 


