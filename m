Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2613CC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF6qnH1MPBcvf0mZbM+mDy/rYdlkBECVBGQCKmvr+68=; b=NRUyo+w67aKOU58IyMbAov9sQe
	nqCggc8U38ijJDMnitQVXdL8oGASQ+uytYMalrHA1exWybzAVGed4yB3hLmQ8smp+DQ9J6lg4Xemj
	BmIJTibVEoMa5d73HPg0nxj0piVMI/2nx22iBz+IQo0z86clBkBbGGNG/1XADaG4ShzLGz3g7m6Pu
	I4ft7R6Yw7JM81bI6NGhnEgI4fGrCo1X9G090ugtEaZJlLbdOxD3NdO8Ls6+S/v6zQLRwJuJnei5l
	r7lMKE2VjqlF57cVUamtqW8Z6JgbhLmySc3FgYosiF4onVjqlQOGrdw5bXyQDdu/wx+70EeYFM2lk
	2A8atKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrDw-0000000E6iJ-2pjI;
	Thu, 23 Jul 2026 11:04:20 +0000
Received: from mail.lysator.liu.se ([2001:6b0:17:f0a0::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrDu-0000000E6en-3ihK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804657;
	bh=WRCGx4B3wEDWfA3vSGt39yZv/ffunOWaZFhyROsM1N4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Thp2dk/hOtJd9WI+wxWwLNomeJZpO+1+yiiAYC+J6noLGGFMXmRJSn7gpU/pBDfL5
	 /eMO1Y/C9KeCHibvUWsDwmSAJmyCB2G2ToGShRnunCkZMF3oYenilupMIjbbeK8cy5
	 kc+jumJJB5YGr5c/mz5f/+j7sGZrQGVhcoV5b/qqkOCNUVn1cEabNi2+8qjDvdkKcr
	 Ac+WSfTP00mYcM6OAGBrQ7Q5na1JsGCB4QOwfyIkaGUTK2rXFa01l3hmBWHnOn7neN
	 P1JtaRdl2DQ1x/HQKgLLRPltw+vgNze9cVLJfepIVChafYfONwioULsiC/nFzMbWD/
	 CEDue0T30tv+Q==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id E517F1BA22
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804656;
	bh=WRCGx4B3wEDWfA3vSGt39yZv/ffunOWaZFhyROsM1N4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=dyL0npyGfGh3gF5tB2eRf3dFOXDEsxBZj1e9te5iBTvb3CfpWyg42FIHCroWTmIn/
	 O7W5ibbwFDlI5B2EPfzYR/QdxxYNhHWzzMQUexMTCWOuBh6UMQXo6BOmHwkrGdBJkc
	 Aq2k6TGIWzOtDQ6KsfafedQScaeUxg+OgwBsSjyG+fNjkQGvSYmzMkmnJP9nJQmDNZ
	 03U+YggXuJk4T9im/KodG6nhXf17HH0ZuS75Aw0+y9DT90r1MYHRNt4XYMIFzKiX8z
	 j0pWj5lgzewstceDISuRxGW6AeSyYJu/Hsjl++atuc7YnVwJjNGGd4k94xYzVMGxJc
	 +pvmPUVxBBQdQ==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id CA9B01BA20; Thu, 23 Jul 2026 13:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784804652;
	bh=WRCGx4B3wEDWfA3vSGt39yZv/ffunOWaZFhyROsM1N4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=G8X5z9QW2owobkvfTuJrQHk883LhjpgXPwjwbcc6g1U27kBZFvsWo8SpqHfKwHL6Y
	 1mjKvJHiXYcQ6neoWv/FaCG92t8+gjiPLSrkmKptYkhgPsdHiid47DJd6xzLsEzBKz
	 nZP7oIg46Vf1HVjdVKIxbWF1x+oLYDaK6mB8Hd3jKaZh48hbP+SS/9xPlcl4ykGNT0
	 IWOn6GO6kmKtZgttJjhmbwLm8jyCriSnePY6ke9NgtnPZ+uaX1S1C4C1569XV0CoDq
	 vOUcmgZuXZs00VOlezcPZK2+WIzi5CKOMZ9yO2uIie7z9x50yyvORb1gQ2wLpH7H2D
	 japzelfFSvogQ==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 3A4D01BA95;
	Thu, 23 Jul 2026 13:04:12 +0200 (CEST)
Message-ID: <d76f9802-5da8-4058-a6b6-4a782c1f2e3c@lysator.liu.se>
Date: Thu, 23 Jul 2026 13:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [PATCH v12 2/7] i2c: mux: add idle_state property to i2c_mux_core
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-2-a5010d623a57@gmail.com>
Content-Language: en-US, sv-SE
In-Reply-To: <20260719-i2c-mux-v12-2-a5010d623a57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_040419_099562_60002CB7 
X-CRM114-Status: GOOD (  22.81  )
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

On 2026-07-19 16:59, Marcus Folkesson wrote:
> Muxes treat their channels differently when idle.
> Let the mux core have this information to make it available for
> internal use.
> 
> Possible idle states are:
>   - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
>   - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
>   - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
>   - <n>: Enable channel n (starting from 0) when idle"
> 
> Default value is set to I2C_MUX_IDLE_UNKNOWN.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   drivers/i2c/i2c-mux.c   |  1 +
>   include/linux/i2c-mux.h | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 681a201c239b..b126ce7338c2 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -247,6 +247,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>   	muxc->select = select;
>   	muxc->deselect = deselect;
>   	muxc->max_adapters = max_adapters;
> +	muxc->idle_state = I2C_MUX_IDLE_UNKNOWN;
>   
>   	return muxc;
>   }
> diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
> index 1784ac7afb11..a348f81e7a90 100644
> --- a/include/linux/i2c-mux.h
> +++ b/include/linux/i2c-mux.h
> @@ -15,6 +15,10 @@
>   
>   #include <linux/bitops.h>
>   
> +#define I2C_MUX_IDLE_AS_IS      (-1)
> +#define I2C_MUX_IDLE_DISCONNECT (-2)
> +#define I2C_MUX_IDLE_UNKNOWN	(-3)
> +
>   struct i2c_mux_core {
>   	struct i2c_adapter *parent;
>   	struct device *dev;
> @@ -22,6 +26,18 @@ struct i2c_mux_core {
>   	unsigned int arbitrator:1;
>   	unsigned int gate:1;
>   
> +	/*
> +	 * The mux state used by the driver when idle.
> +	 * Possible idle states are:
> +	 *  - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
> +	 *  - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> +	 *  - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
> +	 *  - <n>: Enable channel n (starting from 0) when idle"
> +	 *
> +	 * Default value is set to I2C_MUX_IDLE_UNKNOWN.
> +	 */
> +	int idle_state;
> +
>   	void *priv;
>   
>   	int (*select)(struct i2c_mux_core *, u32 chan_id);
> @@ -38,6 +54,20 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>   				   int (*select)(struct i2c_mux_core *, u32),
>   				   int (*deselect)(struct i2c_mux_core *, u32));
>   
> +/*
> + * Mux drivers may only change idle_state, and may only do so
> + * between allocation and registration of the mux controller.

This is simply not true. It is a limitation imposed by your series.
The pca954x driver has a hook to change the idle state at runtime
(the change takes effect the next time the mux is deselected).

Cheers,
Peter

> + */
> +static inline void i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int state)
> +{
> +	muxc->idle_state = state;
> +}
> +
> +static inline int i2c_mux_idle_state(struct i2c_mux_core *muxc)
> +{
> +	return muxc->idle_state;
> +}
> +
>   /* flags for i2c_mux_alloc */
>   #define I2C_MUX_LOCKED     BIT(0)
>   #define I2C_MUX_ARBITRATOR BIT(1)
> 


