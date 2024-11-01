Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F92CE6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucvndIe1j+JUcaQ+11MzhgAcWgZkSLB6dGu60TSB89w=; b=eFzOLQiYUgo/jlTxWlaPtwOHoF
	0WlyBAhJpyU1wEuDmJP7RJR2Zt0kP3kvUawLJnTI08SIcFDduD9qx1SWzJbqWJL/FzkIkwRMUiD6E
	VpJRt//vc+bMGiIp6IZN96LAtcTaEi5LkW2Po28Hnw6dIdvzBZbzaiAcKhKkVAHvYLmic7Nlj4MY9
	wNWZ3D19hgHWR+kcMD6hEzszkWdrJuHUox64W84wWO4SHm9IZ6ZHxzWPY2DwEyPzZ/RqkGCw+AcPq
	SwlJY6GGFh7euHAyGFOajzCwCxgfGh9cVfiz8lLXHwlInau87rZj7lv60KDS/JdCt8MjgUcBPHY/1
	wwuA6+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uqp-00000007kWD-0Qh9;
	Fri, 01 Nov 2024 16:50:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uha-00000007iGm-1Iz8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CC0E5C498D;
	Fri,  1 Nov 2024 16:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFD5C4CECD;
	Fri,  1 Nov 2024 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730479244;
	bh=DvSXCpiKc8373d/ShlW5K4xcJlHzMFMf1zR+xMexCHs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bs9ZbcYmg1J0/HaInPkVgKVS1cocVnMizPIxPqupxNDp8GjrkU3/T65uszjP/rZ7P
	 VPmIfATWJuNkC0nkiFZtZxIVDDtxtA1MbZyGFwSrslgVpuH/o6Fy4pvcfnAkksBncG
	 VRJXlQzBVfRxZAfGKIBWEsSa8HvmRREB5DAmEP0CstN+e1s3J929lDSTIePHEam8R6
	 b51ma+yT250Wzh4uzHOpnzCFj/FN89rdzZ3/TCr5cBpUOyuaALryezbJIP+4spdxpV
	 KtPEVUeA+mDqFMUHLRlpbqfn7zxSJx4AWBWmHanBVDn5yO87wmhnsmpCjmm0QsSHK9
	 gtV2jDgNpN1Tg==
Date: Fri, 1 Nov 2024 16:40:29 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Mudit Sharma <muditsharma.info@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit
 Ghosh <subhajit.ghosh@tweaklogic.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 12/15] iio: light: apds9300: use bool for event state
Message-ID: <20241101164029.2d15fb6d@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-12-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-12-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_094046_475198_95B36E70 
X-CRM114-Status: GOOD (  20.26  )
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

On Thu, 31 Oct 2024 16:27:07 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> Since the write_event_config callback now uses a bool for the state
> parameter, update apds9300_set_intr_state accordingly and change intr_en
> to bool.
> 
> Also update apds9300_set_power_state and power_state for consistency.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  drivers/iio/light/apds9300.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/light/apds9300.c b/drivers/iio/light/apds9300.c
> index 95861b2a5b2d94011d894959289c5c4f06cc1efe..98bdf8bc298b664aba71d3c38d7f224808e5997d 100644
> --- a/drivers/iio/light/apds9300.c
> +++ b/drivers/iio/light/apds9300.c
> @@ -46,10 +46,10 @@
>  struct apds9300_data {
>  	struct i2c_client *client;
>  	struct mutex mutex;
> -	int power_state;
> +	bool power_state;
>  	int thresh_low;
>  	int thresh_hi;
> -	int intr_en;
> +	bool intr_en;
>  };
>  
>  /* Lux calculation */
> @@ -148,7 +148,7 @@ static int apds9300_set_thresh_hi(struct apds9300_data *data, int value)
>  	return 0;
>  }
>  
> -static int apds9300_set_intr_state(struct apds9300_data *data, int state)
> +static int apds9300_set_intr_state(struct apds9300_data *data, bool state)
>  {
>  	int ret;
>  	u8 cmd;
> @@ -169,7 +169,7 @@ static int apds9300_set_intr_state(struct apds9300_data *data, int state)
>  	return 0;
>  }
>  
> -static int apds9300_set_power_state(struct apds9300_data *data, int state)
> +static int apds9300_set_power_state(struct apds9300_data *data, bool state)
There are a few calls of this where an explicit 1 or 0 is used. Those should be
updated to be bools.

I added this diff whilst applying.  Shout if you disagree with it.

diff --git a/drivers/iio/light/apds9300.c b/drivers/iio/light/apds9300.c
index 98bdf8bc298b..938d76f7e312 100644
--- a/drivers/iio/light/apds9300.c
+++ b/drivers/iio/light/apds9300.c
@@ -221,7 +221,7 @@ static int apds9300_chip_init(struct apds9300_data *data)
         * Disable interrupt to ensure thai it is doesn't enable
         * i.e. after device soft reset
         */
-       ret = apds9300_set_intr_state(data, 0);
+       ret = apds9300_set_intr_state(data, false);
        if (ret < 0)
                goto err;
 
@@ -459,8 +459,8 @@ static void apds9300_remove(struct i2c_client *client)
        iio_device_unregister(indio_dev);
 
        /* Ensure that power off and interrupts are disabled */
-       apds9300_set_intr_state(data, 0);
-       apds9300_set_power_state(data, 0);
+       apds9300_set_intr_state(data, false);
+       apds9300_set_power_state(data, false);
 }
 
 static int apds9300_suspend(struct device *dev)
@@ -470,7 +470,7 @@ static int apds9300_suspend(struct device *dev)
        int ret;
 
        mutex_lock(&data->mutex);
-       ret = apds9300_set_power_state(data, 0);
+       ret = apds9300_set_power_state(data, false);
        mutex_unlock(&data->mutex);
 
        return ret;
@@ -483,7 +483,7 @@ static int apds9300_resume(struct device *dev)
        int ret;
 
        mutex_lock(&data->mutex);
-       ret = apds9300_set_power_state(data, 1);
+       ret = apds9300_set_power_state(data, true);
        mutex_unlock(&data->mutex);
 
        return ret;



>  {
>  	int ret;
>  	u8 cmd;
> 


