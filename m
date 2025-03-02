Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3668C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOHZ9RwHYzXMQ8jAnz//sM4ODepJhiFxm1L6Ef+fj6g=; b=GrfkH6Dgwx7o163rrgkHJmesBM
	0f0fXfH7hdZmUE23myzJxi4TFXEMzuMEnu8HUoi3x5bJJMOcOLH4YdoZRO4cY9N3RqLNxyNyXZaPN
	nJK8bW/cKLJfIabDR8oVusti4GzCh6a657Gv/j6KhpZ90TBQOXY+ABhuytm9jsJ4Xgn+1xs9vTNGy
	8sLWeb+4/6erE1dyEjTZji6Datw46xeBATIjhhmIq6Zebv+OW1N0g9DEQqZbPjs7TpsbFVeLJBjTv
	UuR64xENlX4gpxxwgk6v+eeAHqn5rr8q/DNa66Zt1SR+yCGt4K6xQTU2KbedMjU5wgGsEvwvjjByC
	fptjDQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tojCC-0000000G3QH-0V9k;
	Sun, 02 Mar 2025 13:17:28 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tojAc-0000000G3LV-28UY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:15:51 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54959d1a856so1047939e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 05:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740921349; x=1741526149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOHZ9RwHYzXMQ8jAnz//sM4ODepJhiFxm1L6Ef+fj6g=;
        b=NkgTXZ3sZ7fGwCfDkZiqbnWGIdruJ/ztshPv+1W6MapA+IJYAqaffT/jOuvAz3xcBj
         fuzaQ+/Z70CnxMf172qjT4Hp3eGIHuEKe+ZGm33b7o8IzdqZ+afP17Htr+5YopzUrPbJ
         jihTbwNrV/VH/c7/bA6V24SGugvjacj8FsneXtJvin5qYk0B5ip/hj2rEGSIPE5oaYiI
         BgXitmkZN8uH1kCcLGwPsZxe7ACjYMOsWs7cQ0PJ9guUbrkwuwVplCw26dNQ5KJs6qod
         q7BCjRsuLu6oC+P60i53JfllXScVVq5jY3qadg9a+6ZuTCdAfuczyDTHik2auTGCUYJL
         gzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740921349; x=1741526149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOHZ9RwHYzXMQ8jAnz//sM4ODepJhiFxm1L6Ef+fj6g=;
        b=o+t1r9xdlJE92uSwaPKyVTrf9Xjqh/shDnLXn5TN2YYa97ijn91chVF7q8M0lILP4y
         cGSWzT73/fYsnUjf/NezLz6xOoV7TMe88cON5ecdG0SejFNY72JP3O7aMVsW3YQi/M/p
         sI1p7MLk3PEz2uBd6WtdabKxf3yh6vpDS4lN7Z5355AonPuC+QZQBsvoPQ8BTQVYf07U
         bfAIR3RswAkjRYw5qwvx8+wUF8x9Ys7Zo/MZUL0Q/phdMQjmziivRrIaNSUiVdSXk55x
         9u2YZFDk6mU4WBcaxZVqcvUvaBGurLuA3oPkVtXIXfuJovTOxWfHN/t2M/WQqSwkOsAk
         vm0w==
X-Forwarded-Encrypted: i=1; AJvYcCWMceU2k/0gevXCIYcipcnEQDZPQr1Yo13S4VJ36USg08Gn4oDm09xTY5oTU8oGdZaFfOcetwnMbbupbKrA8sDL@lists.infradead.org
X-Gm-Message-State: AOJu0YwAiJwnrsJBJWJw5VJGN8MB2ZFKDul3zwyXTj9lm13PnnLGnqGq
	SD4g4UBFnikB8Ns3+VRLKBIeRapZf+1q/BN8ohzffHXGBjqgaL6M
X-Gm-Gg: ASbGncuUIgTrvj5WY7lW/Vt5nZTMDraEJvK8tboJK9R6hzUOjabB4Slg3eZ/0olTSSD
	h5MTL56FIYvq7rexp9Ol4NJqTpT7CAA9z98Jq4ZEuBySCWQ9f8wxWfzrmFkKGszvSWe3zoPu2kb
	YdHYSgCCktx2uacupjQiQ8m7U57E9HxhR/d6qqVDVbjRIJxDTY4nkuBausEubytC6Ns99WLleMX
	eeLtwJclPEM3T29n2SqCUceLYxcKnnalmNBh7tBcrT2RR+hmrQAl8+GEPGqRqZDK5jUDDSB2pKl
	lsF+5RzT2ZdHVBo9JXbnJJNqrsVp2IHRVO8wXIbtCjb7HucCYssJqhzShxMDRWYsjtGME1ia/vc
	l49ljhLx5rb3gD/6cGOdLP9hX1Q==
X-Google-Smtp-Source: AGHT+IGHFptw3pHDNvEkh6S8B9YASLA7Mxg1Ob35UR3qFEC4CECgPhwErw/f4EuhZrqOLOxsFMYCdA==
X-Received: by 2002:a05:6512:3a90:b0:545:a70:74c5 with SMTP id 2adb3069b0e04-5494c320d67mr3708996e87.13.1740921348639;
        Sun, 02 Mar 2025 05:15:48 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495bc78d51sm353840e87.27.2025.03.02.05.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:15:48 -0800 (PST)
Message-ID: <ccac509c-d063-42f4-a092-bee4014ec9da@gmail.com>
Date: Sun, 2 Mar 2025 15:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] iio: adc: Support ROHM BD79124 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <4d1bf5df8f3b0f760422b6b67fcc8245ebf520e0.1740421249.git.mazziesaccount@gmail.com>
 <20250302041046.7fde3c68@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302041046.7fde3c68@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_051550_559484_22A7890E 
X-CRM114-Status: GOOD (  25.78  )
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

On 02/03/2025 06:10, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:34:30 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The ADC supports
>> an automatic measurement mode, with an alarm interrupt for out-of-window
>> measurements. The window is configurable for each channel.
>>
>> The I2C protocol for manual start of the measurement and data reading is
>> somewhat peculiar. It requires the master to do clock stretching after
>> sending the I2C slave-address until the slave has captured the data.
>> Needless to say this is not well suopported by the I2C controllers.
>>
>> Thus the driver does not support the BD79124's manual measurement mode
>> but implements the measurements using automatic measurement mode relying
>> on the BD79124's ability of storing latest measurements into register.
>>
>> The driver does also support configuring the threshold events for
>> detecting the out-of-window events.
>>
>> The BD79124 keeps asserting IRQ for as long as the measured voltage is
>> out of the configured window. Thus the driver masks the received event
>> for a fixed duration (1 second) when an event is handled. This prevents
>> the user-space from choking on the events
>>
>> The ADC input pins can be also configured as general purpose outputs.
>> Those pins which don't have corresponding ADC channel node in the
>> device-tree will be controllable as GPO.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Some minor stuff inline.

...

>> +#define BD79124_INTERVAL_075 0
> 
> Can we make these units in these explicit?
> #define BD79124_INTERVAL_MS_0_75
> maybe?  Nice to avoid need for comments on what the units are where
> you use these.
> 

Sure, thanks.

>> +#define BD79124_INTERVAL_150 1
>> +#define BD79124_INTERVAL_300 2
>> +#define BD79124_INTERVAL_600 3

...

> 
>> +static void bd79124_re_enable_hi(struct bd79124_data *data, unsigned int channel)
>> +{
>> +	int ret, evbit = BIT(IIO_EV_DIR_RISING);
>> +
>> +	if (!(data->alarm_suppressed[channel] & evbit))
>> +		return;
>> +
>> +	data->alarm_suppressed[channel] &= (~evbit);
> 
> No brackets around the ~evbit.
> Check for other cases of this.
> Otherwise we'll get some script written 'cleanup'.

Sigh. I had a lengthy discussion about this with Andy explaining why I 
like having the parenthesis to avoid any confusion. Well, I suppose I 
have no options if you're strongly opposing them.

...

>> +static void bd79124_alm_enable_worker(struct work_struct *work)
>> +{
>> +	int i;
>> +	struct bd79124_data *data = container_of(work, struct bd79124_data,
>> +						 alm_enable_work.work);
>> +
>> +	guard(mutex)(&data->mutex);
>> +	/*
>> +	 * We should not re-enable the event if user has disabled it while
>> +	 * rate-limiting was enabled.
>> +	 */
> 
> Is this comment suggesting something that isn't done or referring to specific
> code?  I think it wants to be in the function above where the decision is made.

I have to take another look but it seems it got misplaced during the 
road. Thanks!

Agreeing with all the rest, thanks!

Yours,
	-- Matti

