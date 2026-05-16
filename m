Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC37CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 23:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbrzSYsKhGdQPEFMyRc5LNtO/lLaeNK/XZTpyuD05pw=; b=ZWRPK/zEyR+VOk+qKymZuLvm0i
	+eRAmj2Sspf75YT4CxtDKFFBDgG6zjcFdRsclFFsuSrP/V8yPgsdexSxFDqb6+C7DLVBQK+iBaJ1O
	rIQPnCs1awyx24WmWHVNQChhpJE1gAKJJa0Z4XZducWywedo2VL7lMy/hs1Xp1qUPKqGkfigziCkJ
	7rWFGi9JmUPVjSWtC/bn4JJOF++/7Hw2uXIGvO8cKg/Vg4hhdkSrcCAzkKll6u2Ml9b5b0j4BNu42
	P/R9JVA6SRt4C7LE6/QtO6TbyFwA4gWxW78U7LyzBmRTDjcY98ZVJ9xF3l63hVJCSyr74jd5iDlUi
	GR2AEO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOOJS-0000000BhM8-3e2i;
	Sat, 16 May 2026 23:20:54 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOOJH-0000000BhKW-44wN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 23:20:53 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so918546eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778973643; x=1779578443; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jbrzSYsKhGdQPEFMyRc5LNtO/lLaeNK/XZTpyuD05pw=;
        b=Mx9AZnVrg7N1To6fBgk1QWD7cGjRCehk2IZ3YD8+krVqpe+DM4JidnRA10jQ6IIGJY
         o+OjlOpPlNSuxZwzP3T3pJx2cItqLjvmHbcb1ckENx2y5kxmiNMvdgJ3JnszLS2qZIZN
         P4d0J9HzHXz4KW17fQgzue/55JdiweSq4TsWsJn6mxvxiIiXC1/vMU1LSQ00NE6ngsmt
         Oz/opjOw+RR66rAD9GN1AQFcBkYqDImcEtAQP0eMm4V8Lm/EGWzzFgNdwgSjtSOpiBcn
         VmesEWVU2Zm8zyQSM3gAO72rDs9YTkUyWfXRq6B/5ZIkUnwednVM/sJKr0SydKYAjC4g
         o6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973643; x=1779578443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbrzSYsKhGdQPEFMyRc5LNtO/lLaeNK/XZTpyuD05pw=;
        b=cWX5MS92lVKSIBCMALLLsr4pgbvVFTSt2R4Rr6f1sabbZwLRi35Xnc7hq46v4gGskH
         GAKvd8pmioRWVp5kd0u5LPAKG2pb9QdHogHN/Wp9pqwKrl1Y/DDzAY9GKxehlMEOFXnp
         6T55PNJHgxA7WLjddOiecFI7/qPU+mbaUjVWNOYOAW/ouTRJVHEhfUhj1GtCMbRjvlTT
         ax7AYwICURCb0f8BI86VkdCKvpncpkuzUp89Hk2g1KTz79daKrNHF4reIx33dmCP+C+6
         O7cIVCT/mmykUG+HtdqnkE0Jt1+muFmPa8N77Nt/TQggwT9LTyn4SAHnnQ42aFWaLoG4
         y/OQ==
X-Forwarded-Encrypted: i=1; AFNElJ+b0BPKYmVJp7CPKf3XBToqW3pZTfVc4o0EoG0Udf7NDFTVgrqwm1Vydsp1zv2jxd9UPHXgxnu1N+zQCuixjQMi@lists.infradead.org
X-Gm-Message-State: AOJu0YzwxHYmhGEKUzrlaVWwh+4sReLB6w7AP3qBI8jkwZjOsJ537kDF
	M6ML8JfA8DRk/9c1mIm476lEuEaZ4lSyw9BI+YjCmONCga5BK8hYnnhF
X-Gm-Gg: Acq92OGOlHepldi0BPz9BAfp2de3uyYnEEb0unLoycND2LHih/TLZyrIydkB1cC7t3g
	eYBMZBB5lADt9x9MQNUi0b3IkWO2VtodkvU28BfsDysffO4GTU6lSU3ufmhfKddJZfrXdwmAAKV
	batlLX78WEs29kHCKxqEcC99ZMVB81GVngPKdDioxXQV7hDpLEmpn1Xqc06kekLEU5ZLF4WINbY
	d1si/8wJHNc0WVlTvp+wJQtJEkXBRaTwDX3lpqSc6GFtahFWTE/f1ZbSL7SDY61UvSYoqHnFkbu
	Zn+iGHgQcjP/cKIAc4UT5u9y2KqB+AbjvHkLr8jaaNMBnRMpZCnaI2yLVtPB0ZzghJY7xc47ymA
	ac/lj2+HGIbNU3myrSqw5y6MLtTkivaiv8r+PkSvHhKGSSGQLoh2kHJ7eVz+5dCWjey+4bkOax0
	KsXgFBke0aKxzDuM3ygUGcfNMj5bk/NbdqWi4jn5wIamHuQF6mLr7Wf9XPo4vK4Slti3rZTjC7
X-Received: by 2002:a05:7301:5809:b0:2f2:6dde:df50 with SMTP id 5a478bee46e88-3039868cba3mr4710436eec.17.1778973642800;
        Sat, 16 May 2026 16:20:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6e9sm12599260eec.16.2026.05.16.16.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 16:20:42 -0700 (PDT)
Message-ID: <3443e6a3-4b30-4c67-94c2-8687de58d9ab@roeck-us.net>
Date: Sat, 16 May 2026 16:20:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: raspberrypi: Add voltage input support
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_162044_024305_AA3F8D4E 
X-CRM114-Status: GOOD (  35.26  )
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

On 5/16/26 12:15, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>    - in0_input (core)
>    - in1_input (sdram_c)
>    - in2_input (sdram_i)
>    - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>    Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   Documentation/hwmon/raspberrypi-hwmon.rst |  15 ++-
>   drivers/hwmon/raspberrypi-hwmon.c         | 134 +++++++++++++++++++++-
>   2 files changed, 144 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/raspberrypi-hwmon.rst b/Documentation/hwmon/raspberrypi-hwmon.rst
> index 8038ade36490..db315184b861 100644
> --- a/Documentation/hwmon/raspberrypi-hwmon.rst
> +++ b/Documentation/hwmon/raspberrypi-hwmon.rst
> @@ -20,6 +20,17 @@ undervoltage conditions.
>   Sysfs entries
>   -------------
>   
> -======================= ==================
> +======================= ======================================================
> +in0_input		Core voltage in millivolts
> +in1_input		SDRAM controller voltage in millivolts
> +in2_input		SDRAM I/O voltage in millivolts
> +in3_input		SDRAM PHY voltage in millivolts
> +in0_label		"core"
> +in1_label		"sdram_c"
> +in2_label		"sdram_i"
> +in3_label		"sdram_p"
>   in0_lcrit_alarm		Undervoltage alarm
> -======================= ==================
> +======================= ======================================================
> +
> +The voltage inputs and labels are only exposed if the firmware reports support
> +for the corresponding voltage ID.
> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
> index a2938881ccd2..4f96f37116f3 100644
> --- a/drivers/hwmon/raspberrypi-hwmon.c
> +++ b/drivers/hwmon/raspberrypi-hwmon.c
> @@ -5,6 +5,7 @@
>    * Based on firmware/raspberrypi.c by Noralf Trønnes
>    *
>    * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
> + * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>    */
>   #include <linux/device.h>
>   #include <linux/devm-helpers.h>
> @@ -18,13 +19,26 @@
>   
>   #define UNDERVOLTAGE_STICKY_BIT	BIT(16)
>   
> +struct rpi_firmware_get_value {
> +	__le32 id;
> +	__le32 val;
> +} __packed;

My earlier comment is still valid: This should be defined in
the include file, and it should be query-specific, just like
struct rpi_firmware_clk_rate_request.

> +
>   struct rpi_hwmon_data {
>   	struct device *hwmon_dev;
>   	struct rpi_firmware *fw;
> +	u32 valid_inputs;
>   	u32 last_throttled;
>   	struct delayed_work get_values_poll_work;
>   };
>   
> +static const char * const rpi_hwmon_labels[] = {
> +	"core",
> +	"sdram_c",
> +	"sdram_i",
> +	"sdram_p",
> +};
> +
>   static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
>   {
>   	u32 new_uv, old_uv, value;
> @@ -56,6 +70,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
>   	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
>   }
>   
> +static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
> +				    long *val)
> +{
> +	struct rpi_firmware_get_value packet;
> +	int ret;
> +
> +	packet.id = cpu_to_le32(id);
> +	packet.val = 0;
> +	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
> +				    &packet, sizeof(packet));
> +	if (ret)
> +		return ret;
> +
> +	*val = le32_to_cpu(packet.val) / 1000;

I would suggest to use DIV_ROUND_CLOSEST().

> +	return 0;
> +}
> +
>   static void get_values_poll(struct work_struct *work)
>   {
>   	struct rpi_hwmon_data *data;
> @@ -77,19 +108,94 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
>   {
>   	struct rpi_hwmon_data *data = dev_get_drvdata(dev);
>   
> -	*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> +	if (type == hwmon_in) {
> +		switch (attr) {
> +		case hwmon_in_input:
> +			switch (channel) {
> +			case 0:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_CORE,
> +						val);
> +			case 1:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_SDRAM_C,
> +						val);
> +			case 2:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_SDRAM_I,
> +						val);
> +			case 3:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_SDRAM_P,
> +						val);
> +			default:
> +				return -EOPNOTSUPP;

With

static const int voltage_regs[] = {
	RPI_FIRMWARE_VOLT_ID_CORE, RPI_FIRMWARE_VOLT_ID_SDRAM_C, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
	RPI_FIRMWARE_VOLT_ID_SDRAM_P };

this can be simplified to
	return rpi_firmware_get_voltage(data, voltage_regs[channel];

> +			}
> +		case hwmon_in_lcrit_alarm:
> +			if (channel == 0) {
> +				*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> +				return 0;
> +			}

The channel check is not really necessary.

> +			return -EOPNOTSUPP;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int rpi_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, const char **str)
> +{
> +	if (type == hwmon_in && attr == hwmon_in_label) {
> +		if (channel >= ARRAY_SIZE(rpi_hwmon_labels))
> +			return -EOPNOTSUPP;

Unnecessary check.

> +
> +		*str = rpi_hwmon_labels[channel];
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
> +			      u32 attr, int channel)
> +{
> +	const struct rpi_hwmon_data *data = _data;
> +
> +	if (type == hwmon_in) {
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +			if (!(data->valid_inputs & BIT(channel)))
> +				return 0;
> +			return 0444;
> +		case hwmon_in_lcrit_alarm:
> +			if (channel == 0)
> +				return 0444;
> +			return 0;
> +		default:
> +			return 0;
> +		}
> +	}
> +
>   	return 0;
>   }
>   
>   static const struct hwmon_channel_info * const rpi_info[] = {
>   	HWMON_CHANNEL_INFO(in,
> -			   HWMON_I_LCRIT_ALARM),
> +			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_LCRIT_ALARM,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
>   	NULL
>   };
>   
>   static const struct hwmon_ops rpi_hwmon_ops = {
> -	.visible = 0444,
> +	.is_visible = rpi_is_visible,
>   	.read = rpi_read,
> +	.read_string = rpi_read_string,
>   };
>   
>   static const struct hwmon_chip_info rpi_chip_info = {
> @@ -101,6 +207,7 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct rpi_hwmon_data *data;
> +	long voltage;
>   	int ret;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -110,6 +217,26 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
>   	/* Parent driver assure that firmware is correct */
>   	data->fw = dev_get_drvdata(dev->parent);
>   
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_CORE,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(0);
> +
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_C,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(1);
> +
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(2);
> +
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_P,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(3);
> +

This can be implemented in a loop, using the above voltage_regs array.

Thanks,
Guenter

>   	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
>   							       data,
>   							       &rpi_chip_info,
> @@ -159,6 +286,7 @@ static struct platform_driver rpi_hwmon_driver = {
>   module_platform_driver(rpi_hwmon_driver);
>   
>   MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
> +MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
>   MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS("platform:raspberrypi-hwmon");


