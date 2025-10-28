Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A85CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaeV3ReOG98zpsdwkv/9umMpI5IPraCJeVtVuXAToME=; b=yqb8+Lt74kEp2CSrc0p5HwKHla
	DSt4u+jV6i2bVNIJi0kyZH5G7Ez+0S9sQ12UI0TeU6G9gX6t7VXlMvmla9bXS+G/VCQ5OX4Z6mkHu
	c8UpLnCttGXOh7Dfm4YcP/HtRmnwkRHgmkon8n1wQl0enNZqJWYIKgfE5WVqmw8HfEft32zG3PiBj
	U+5mlZ7ezkqCV3KzxGcMSPUQVK4bq1aOAahQUeN4WDCUZzdBdV/vrmwP48O9Ecz16WOfhOzI8fUtA
	iKQYqXySmiujjxsWhMXdjZZ7c7JSs+YY5WFSKTdGTBlxLPHTczX5W60IQUOsj7ydUwU9mOQJFbYKF
	HUvkkz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrKV-0000000GhMT-0MG6;
	Tue, 28 Oct 2025 21:34:11 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrKR-0000000GhLX-3ICM;
	Tue, 28 Oct 2025 21:34:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63F6B40D1C;
	Tue, 28 Oct 2025 22:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1761687241; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OaeV3ReOG98zpsdwkv/9umMpI5IPraCJeVtVuXAToME=;
	b=Pq77o6HDo9/OSHrQ6/4t3Dekd4Q49eaGkoic01K1yveOMuxs2bsV2H3d/whs55vA1RyDCx
	ln0HayR5AoExJ7Wbfga9ma11rsONrEU9oNlFPw9SCS83lUocgFw8EHTxi5RN8wabT4y2Bk
	EeivFgTwt9Re5mbQKNby3HqAN9OvLEKOa6SiiNQDfthFfsW6FeSPh4ZBd3UmQMmdS1aw59
	u71NY+SwqsDrt/PCLeKunLGWcO2gBl24d8WGsVD298qayTt4K2qP2w3cu1hBaYCPj73MwS
	7lPDhjLxRc9kgJ5MvzAUH6/XZ0N2E363TB02zrWCv/sQCb7DgndQLWjExOo+kQ==
From: Dragan Simic <dsimic@manjaro.org>
To: nicolas.frattaroli@collabora.com
Cc: alexandre.belloni@bootlin.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	heiko@sntech.de,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 2/4] Input: adc-keys - support types that aren't just keyboard keys
Date: Tue, 28 Oct 2025 22:32:09 +0100
Message-Id: <20251028213209.2646838-1-dsimic@manjaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-2-0b3c8e8fda9c@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_143408_065096_A21AA312 
X-CRM114-Status: GOOD (  23.93  )
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

Hello Nicolas,

On Monday, June 30, 2025, 12:19:24 Nicolas Frattaroli wrote:
> Instead of doing something like what gpio-keys is doing, adc-keys
> hardcodes that all keycodes must be of type EV_KEY.
> 
> This limits the usefulness of adc-keys, and overcomplicates the code
> with manual bit-setting logic.
> 
> Instead, refactor the code to read the linux,input-type fwnode property,
> and get rid of the custom bit setting logic, replacing it with
> input_set_capability instead. input_report_key is replaced with
> input_event, which allows us to explicitly pass the type.

Thanks for this patch, it's indeed very useful!  Please see some
comments below.

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/input/keyboard/adc-keys.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
> index f1753207429db02ce6510e5ec0da9b24d9edb61d..339dd4d4a0842108da2c6136b1e0098cd1f6a3cd 100644
> --- a/drivers/input/keyboard/adc-keys.c
> +++ b/drivers/input/keyboard/adc-keys.c
> @@ -19,12 +19,14 @@
>  struct adc_keys_button {
>  	u32 voltage;
>  	u32 keycode;
> +	u32 type;
>  };
>  
>  struct adc_keys_state {
>  	struct iio_channel *channel;
>  	u32 num_keys;
>  	u32 last_key;
> +	u32 last_type;
>  	u32 keyup_voltage;
>  	const struct adc_keys_button *map;
>  };
> @@ -35,6 +37,7 @@ static void adc_keys_poll(struct input_dev *input)
>  	int i, value, ret;
>  	u32 diff, closest = 0xffffffff;
>  	int keycode = 0;
> +	u32 type = EV_KEY;
>  
>  	ret = iio_read_channel_processed(st->channel, &value);
>  	if (unlikely(ret < 0)) {
> @@ -46,6 +49,7 @@ static void adc_keys_poll(struct input_dev *input)
>  			if (diff < closest) {
>  				closest = diff;
>  				keycode = st->map[i].keycode;
> +				type = st->map[i].type;
>  			}
>  		}
>  	}
> @@ -54,13 +58,14 @@ static void adc_keys_poll(struct input_dev *input)
>  		keycode = 0;
>  
>  	if (st->last_key && st->last_key != keycode)
> -		input_report_key(input, st->last_key, 0);
> +		input_event(input, st->last_type, st->last_key, 0);
>  
>  	if (keycode)
> -		input_report_key(input, keycode, 1);
> +		input_event(input, type, keycode, 1);

When EV_ABS is defined in the DT as the key type, which happens with
joysticks and whatnot, separate handling is needed, by requiring the
actual associated button values to be reported in the input_event()
invocations, more specifically on the keypresses only.

That's also visible in the gpio_keys_gpio_report_event() function in
drivers/input/keyboard/gpio_keys.c.

>  	input_sync(input);
>  	st->last_key = keycode;
> +	st->last_type = type;
>  }
>  
>  static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
> @@ -93,6 +98,10 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
>  			return -EINVAL;
>  		}
>  
> +		if (fwnode_property_read_u32(child, "linux,input-type",
> +					     &map[i].type))
> +			map[i].type = EV_KEY;

Going along with the remarks above, it will also be needed to read
and record the values of "linux,input-value" DT properties here, and
to extend the associated binding to define their presence.

>  		i++;
>  	}
>  
> @@ -156,9 +165,8 @@ static int adc_keys_probe(struct platform_device *pdev)
>  	input->id.product = 0x0001;
>  	input->id.version = 0x0100;
>  
> -	__set_bit(EV_KEY, input->evbit);
>  	for (i = 0; i < st->num_keys; i++)
> -		__set_bit(st->map[i].keycode, input->keybit);
> +		input_set_capability(input, st->map[i].type, st->map[i].keycode);
>  
>  	if (device_property_read_bool(dev, "autorepeat"))
>  		__set_bit(EV_REP, input->evbit);

