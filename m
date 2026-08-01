Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523E8C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIWEG8Ya4E7m7w4a7i1eN4G2oAOrDPnyYXyAS/kJfKE=; b=ohc3UKOCmedAyYHVZfjXU/N6vW
	NSoQqnttgkFM4g7vvuvebzkn1Qw7UD3kegqfLC5rkpTEVGCImfHrgE39v2Y7OCzgo6WxorKzpXc7V
	vd+EpG0eDHo6bsmX9FV5iqXc+trpFjG4PBfR43Q5fZjHGkdx/YNNEKAXtThi+uVNmzqjPmFXmS9Zd
	AmWlxdSbo2gUaCyUfbeeuIxcKn36fBVnyE78D0MJb1qePJCPfOF4bIiTYSfH5p7w6JSWAzC8C1bKi
	CuKo6TPcIAvcH2oxoNYcfAtdJ8W3zliAPrfITcRrXb349G5NLkEl5dgtKfDD6r4ayoMxbw/iG81k6
	uRnkhiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCrt-0000000EsuU-0LmH;
	Sat, 01 Aug 2026 16:47:25 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqCrq-0000000Esu3-3D1k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 16:47:24 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7ebd88be784so1350470a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785602842; x=1786207642; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qIWEG8Ya4E7m7w4a7i1eN4G2oAOrDPnyYXyAS/kJfKE=;
        b=IQLr9hEXAhpF8p00DfgCG4J54EczeWWRQHlPqXXeYGYPY7ffLp87FpgVZW4k4A1n1u
         PxFPQVfiP5CEHKEw4Ctc8tqjGD7qa9/0Z7Iff/zTrU4s0riL2ikgsckU9xHuctvCEz0B
         uqntvdvvhq0yKXenHvciLAtWQH6pJi4qL4injSIfKyZxTHO4cLZZpWhyRVX2HhkVgQ7d
         C4RLEBFzEgUPO+C8b4taLDxQno4v+/D6R3oBKpuk8D7UuhK5+eMcy0f2jRx36+X0Z6H8
         84fZqH7AE0mzzX8wePZghaMnboHX9DnepaGUC5EHN4CUt+XXHN+dMr/VipYKhQ8t35K1
         BMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785602842; x=1786207642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIWEG8Ya4E7m7w4a7i1eN4G2oAOrDPnyYXyAS/kJfKE=;
        b=bEhc9AeUsEHVC7s7+8v0HyutEzqhm4tWIvN5xYlFEPpxBjD9T5z7Q8aHnkrw7riE+u
         WQNCd4CLcSC0ANv06vDYrZOsbGZZEGpjEIqEkYLvNmBALN8QeJ8b46Tnmqrovim+83fm
         K0hEHtmBo/RE6Ilg/0XaJq30lEsH6ZXVQtCfr+ziCGZFb3wf5NwwPXvNPiHh8YsbyIKD
         ev4+e0kTQlRQJy97ib1PzgNxwYN3fPx5AYCM23N8taDde+v0na7PC/hgWTqeu7Oasqpp
         zDUjfAn0ZmAUGKqQ4S9KdSZ0dan+zPkPVY4zbkFcg5dPfK/0RUiRgJdAbuetUyGfsos7
         QDaA==
X-Forwarded-Encrypted: i=1; AHgh+RotELVWOXZbhtmsVMgU8R4sUPv8kPr79N5bJRcXDaygi7xBfH44/bEvesUBO9a497FMjLOiYjjm7HmOd7tmgzgK@lists.infradead.org
X-Gm-Message-State: AOJu0YxRkHJGtR1ZRv9oL1WClTzhurs/F+JxRciDnUxFjiAsw7mRQmpm
	/fvtD6XMiBTnLL6NOYn2vw8wco0tXSBLqA1GCwbandfXDBQvVdNKQIXGHcm0g7hOa2A=
X-Gm-Gg: AR+sD109m2TkX6upkI9oy1Hh19ucYHtLL+uwpkYO6wP5z/bXaFdmO9bnYqMHfvGPm+C
	rwhnMihlwxyhPod+6p89x7cdKMhnKButv4Px76t+3KEd3ek9K4LRGWhU1w1AnGmLprpFMgG3sZj
	PA7W1RpXetSTX44AnwZoYJZHXq7OR//z6vIyQuIh2HtisdsEtqnH3EoQ9q5e3se1dHFqOG1Whws
	CsSbbJIWFArb3pbwAiRZQSemIkbwt+lrOQwm3UuGEYZ4DIdaHZEMobtRDJc4OZFDfxEbYPDwFuo
	LneNxDwO8v6HcTpERKzHzfSX8P/4UbxsOO7wqLbfLMRU9AQp7zTUTk+tjE3LEnOJ2Gh8Pvb0VNY
	HmPsubWQRmVwXGgvceGEwED6QRRcOPxbRtRYBh7hOc9jsMCO+vWoRaCtLyQuGOSqG+JdnI0Kqs5
	jM7eh0L3TYX2yNjZKW6fML5uTWWSZt7eNRZ4nKcBD5sg5Ch3FlKPzSENhcS2OHbw+l0YqgPR1c+
	+7r/GUXrDajEsW1P/5caUt8ZE8LULQhqOJC/Fs=
X-Received: by 2002:a05:6830:4114:b0:7e9:bd00:c6ad with SMTP id 46e09a7af769-7f196f29291mr7933016a34.16.1785602841748;
        Sat, 01 Aug 2026 09:47:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:359b:17f1:d4f9:4949? ([2600:8803:e7e4:500:359b:17f1:d4f9:4949])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f11e522sm3400378a34.25.2026.08.01.09.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 09:47:21 -0700 (PDT)
Message-ID: <9d6d0f3f-ca6e-44e0-a280-c07a7d55453b@baylibre.com>
Date: Sat, 1 Aug 2026 11:47:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] iio: adc: xilinx-xadc: Add .setup_channels() to
 struct xadc_ops
To: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
References: <20260729125455.95893-1-DileepKumar.Nagavarapu@amd.com>
 <20260729125455.95893-5-DileepKumar.Nagavarapu@amd.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260729125455.95893-5-DileepKumar.Nagavarapu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_094722_822695_C4DB0FD9 
X-CRM114-Status: GOOD (  20.29  )
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

On 7/29/26 7:54 AM, Dileep Kumar Nagavarapu wrote:
> Add .setup_channels() function pointer to struct xadc_ops to enable
> different interfaces to have custom channel setup logic.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <DileepKumar.Nagavarapu@amd.com>
> ---
>  drivers/iio/adc/xilinx-xadc-core.c     | 6 ++++--
>  drivers/iio/adc/xilinx-xadc-platform.c | 3 +++
>  drivers/iio/adc/xilinx-xadc.h          | 2 ++
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> index e3b1d5bebe98..d39ff54439ba 100644
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -656,7 +656,7 @@ static const struct iio_info xadc_info = {
>  	.update_scan_mode = &xadc_update_scan_mode,
>  };
>  
> -static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
> +int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
>  {
>  	struct device *dev = indio_dev->dev.parent;
>  	struct xadc *xadc = iio_priv(indio_dev);
> @@ -762,6 +762,7 @@ static int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_NS_GPL(xadc_parse_dt, "IIO_XADC");

This function is only used once. Would be better to just move
it to the file that uses it instead of making a public function.

>  
>  static const char *const xadc_type_names[] = {
>  	[XADC_TYPE_S7] = "xadc",
> @@ -789,9 +790,10 @@ EXPORT_SYMBOL_NS_GPL(xadc_device_setup, "IIO_XADC");
>  int xadc_device_configure(struct device *dev, struct iio_dev *indio_dev, int irq,
>  			  unsigned int *conf0, unsigned int *bipolar_mask)
>  {
> +	struct xadc *xadc = iio_priv(indio_dev);
>  	int ret;
>  
> -	ret = xadc_parse_dt(indio_dev, conf0, irq);
> +	ret = xadc->ops->setup_channels(indio_dev, conf0, irq);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/iio/adc/xilinx-xadc-platform.c b/drivers/iio/adc/xilinx-xadc-platform.c
> index 38748a38da15..bd033315c72f 100644
> --- a/drivers/iio/adc/xilinx-xadc-platform.c
> +++ b/drivers/iio/adc/xilinx-xadc-platform.c
> @@ -405,6 +405,7 @@ static const struct xadc_ops xadc_zynq_ops = {
>  	.get_dclk_rate = xadc_zynq_get_dclk_rate,
>  	.interrupt_handler = xadc_zynq_interrupt_handler,
>  	.update_alarm = xadc_zynq_update_alarm,
> +	.setup_channels = xadc_parse_dt,
>  	.type = XADC_TYPE_S7,
>  	/* Temp in C = (val * 503.975) / 2**bits - 273.15 */
>  	.temp_scale = 503975,
> @@ -509,6 +510,7 @@ static const struct xadc_ops xadc_7s_axi_ops = {
>  	.get_dclk_rate = xadc_axi_get_dclk,
>  	.update_alarm = xadc_axi_update_alarm,
>  	.interrupt_handler = xadc_axi_interrupt_handler,
> +	.setup_channels = xadc_parse_dt,
>  	.flags = XADC_FLAGS_BUFFERED | XADC_FLAGS_IRQ_OPTIONAL,
>  	.type = XADC_TYPE_S7,
>  	/* Temp in C = (val * 503.975) / 2**bits - 273.15 */
> @@ -523,6 +525,7 @@ static const struct xadc_ops xadc_us_axi_ops = {
>  	.get_dclk_rate = xadc_axi_get_dclk,
>  	.update_alarm = xadc_axi_update_alarm,
>  	.interrupt_handler = xadc_axi_interrupt_handler,
> +	.setup_channels = xadc_parse_dt,
>  	.flags = XADC_FLAGS_BUFFERED | XADC_FLAGS_IRQ_OPTIONAL,
>  	.type = XADC_TYPE_US,
>  	/**
> diff --git a/drivers/iio/adc/xilinx-xadc.h b/drivers/iio/adc/xilinx-xadc.h
> index 3a9cc87c43b5..67efa093157e 100644
> --- a/drivers/iio/adc/xilinx-xadc.h
> +++ b/drivers/iio/adc/xilinx-xadc.h
> @@ -78,6 +78,7 @@ struct xadc_ops {
>  	void (*update_alarm)(struct xadc *xadc, unsigned int alarm);
>  	unsigned long (*get_dclk_rate)(struct xadc *xadc);
>  	irqreturn_t (*interrupt_handler)(int irq, void *devid);
> +	int (*setup_channels)(struct iio_dev *indio_dev, unsigned int *conf, int irq);
>  
>  	unsigned int flags;
>  	enum xadc_type type;
> @@ -223,6 +224,7 @@ static inline int xadc_write_adc_reg(struct xadc *xadc, unsigned int reg, u16 va
>  void xadc_write_reg(struct xadc *xadc, unsigned int reg, uint32_t val);
>  void xadc_read_reg(struct xadc *xadc, unsigned int reg, uint32_t *val);
>  struct iio_dev *xadc_device_setup(struct device *dev, int size, const struct xadc_ops **ops);
> +int xadc_parse_dt(struct iio_dev *indio_dev, unsigned int *conf, int irq);
>  int xadc_device_configure(struct device *dev, struct iio_dev *indio_dev,
>  			  int irq, unsigned int *conf0, unsigned int *bipolar_mask);
>  int xadc_read_samplerate(struct xadc *xadc);


