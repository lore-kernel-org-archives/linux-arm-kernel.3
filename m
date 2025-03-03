Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A92C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrfT43/ChI686f8asUl/9QZweWrcr9+CbhtUfhxyfBk=; b=s4TqECY032CIL0UkRMa7vX7Ttv
	B8XXSWJWmeXsKF1DkuIPiBu3JYRn+hjYJZmoHNBWOtkDFl78HUHq719W1xS6xF0swzKTijgcY0h3N
	uKI804RiZYAsYY4gcgB4cqbqQgzvXYOoSM7ZM5zb7vFvLBneogv4RTd5HQDi/a+kIH4u3cUxLAzCe
	fXS6mG1F0tMyzLUOv3Ft0gM887g2aQsuAXVAqu1G47UTRw08fjIvAfgRMv4861hjZf/nS3D60FLON
	nCQ9OY1B87rXhGRV4MQJ79Kso9uyLUl2lAzEOAtHnmOQTB341O5bgH8pcHnUNbg8GIezrIBC3AoKK
	fP+xXMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0K8-0000000HRKY-2I44;
	Mon, 03 Mar 2025 07:34:48 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0IZ-0000000HREl-2Dh9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 07:33:12 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30737db1aa9so38342471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 23:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740987189; x=1741591989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrfT43/ChI686f8asUl/9QZweWrcr9+CbhtUfhxyfBk=;
        b=DLkf6Y55xrvym7GAigXG35M8IcAl+ueqs4022niJti2cSd+oLvcMUJizbXSon03vQc
         945s+3cVr/kr1BaF6LgyGVANy9ktmU3Y65MzQfUg3rLK395OvhT/hXLSRjDDNjygSxHg
         f2oDvEmxShHlVkCeomFXiXJdUjcrzau04QDg1igfRKBeHAxNzJmYsto5+blFqP4cvZpT
         C24jgvWkCvL8g+Ma2UqIjTs9u+iu9pI1uZEMY1wHpSQKSQMmhdrdaQs4OiPlV2W0oDu6
         qNeAkSbxBsf9XSjyu5E0BUDcjvgxlZpGNP8OnYK4cOPa+5qiTOOJ4lr86KYYRGsKp4J3
         DeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740987189; x=1741591989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrfT43/ChI686f8asUl/9QZweWrcr9+CbhtUfhxyfBk=;
        b=XiS8/B06W1z5erSQgNluRd8M3/3tlmbbsGNj2NZ1W+BpJoUvQk4i7oZEJeukFBkJSY
         CdNO2VbygEl1TeQMkfvQxXMfv7J70RNgaSfGu8AlHqrvgLxzKAxb5M3l0uuK9746+kwy
         4raeG0mPT+5GlSleKsVRx81WmR9Q9e8vg7WI3u+u+HvDjojxQuBdsCBkmNdYnVGd80N5
         h/m8WyoRy8UPB9ZO2NJtb3ig2nxLNPdFn7pgL+QVEU+wIAU9JBnhrtjv4MpcFxICZ+sM
         BrQJbIzEY0buuASgDpGBKIjh48j+Fm8Pkejh89kSTKJHw5Xpnth5UMulXeHeIFIMHlkz
         LziQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2JXGvIKyWZ0KL9PKHF/RtjdU1OeVuFGrPJW0fx6niF5Wvlh8IbfeKRZ1GM/2FhKULBzUmoo9Bn3sVakSOi69c@lists.infradead.org
X-Gm-Message-State: AOJu0YxqhDRG5onekuQEaAUEXB5Q2bsKmwDrp44qJmKipJWxS1gPuYWh
	hvEGNpn3YuNFAAkGpM6U/V5vHDpKbsnsfbWYedGW25EkPzQZhV23
X-Gm-Gg: ASbGnct8V2jb4Q7N2FlEtdhcEf3ymjIdhg1y6suX7vWrf3tJmASthf6cdZEyOD4Zx/D
	OD+WBd8SvrnOc2gjVBoI4/sGqEgpgQ+ACAYpPshpfcxfOqT8VA1VLF+RT5TpuFukKcUJGhsMeJg
	OrMdiL9aVgrN1kOvwKpmrP3rw3r2Q5egS6RxyBjAP79vZDurIADLJ/TNLSJBGmPbRJePgmoPLmq
	up/MZgVtjz0TwBLqAzudGNxF2f9y3ahK+yjLpqY011dpa4eP6WJTEQ1Rju98OZ88oyKFfr7lR0y
	YYNRyoSjpJ3/F4STTUVX+wpSwBtW7hrmmxTXvMOL2hNebmbbzNE4cRscGHvObtHjKu3yeJCQ8be
	lf2eEsY7QeFvpHbz2xq44RmvCJA==
X-Google-Smtp-Source: AGHT+IFYoPik8tqIuOOXAJZxxEM4FjnMpyrSDbqpvuiBUw+N4rWidoyXw4/acgqr1fgBuicookECFg==
X-Received: by 2002:a05:6512:693:b0:545:b28:2fa9 with SMTP id 2adb3069b0e04-5494c122af7mr5686831e87.16.1740987189050;
        Sun, 02 Mar 2025 23:33:09 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495a7d6a2csm602975e87.227.2025.03.02.23.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 23:33:07 -0800 (PST)
Message-ID: <ce2c1a21-f418-4ed9-9cd3-fe2a68f08c31@gmail.com>
Date: Mon, 3 Mar 2025 09:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] iio: adc: ti-ads7924 Drop unnecessary function
 parameters
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
 linux-sunxi@lists.linux.dev
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <38d39befcca110132fd4349c87fcb5d7ff51a2c8.1740421248.git.mazziesaccount@gmail.com>
 <20250302034649.2d9ec2a4@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302034649.2d9ec2a4@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_233311_575759_2B99599D 
X-CRM114-Status: GOOD (  21.40  )
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

Hi dee Ho again Jonathan (and all),

On 02/03/2025 05:46, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:34:01 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Device pointer is the only variable which is used by the
>> ads7924_get_channels_config() and which is declared outside this
>> function. Still, the function gets the iio_device and i2c_client as
>> parameters. The sole caller of this function (probe) already has the
>> device pointer which it can directly pass to the function.
>>
>> Simplify code by passing the device pointer directly as a parameter
>> instead of digging it from the iio_device's private data.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Looking again at this function it doesn't seem to be doing anything
> useful at all.  It checks the channel nodes are in range, but
> does nothing with that data. I'd just drop it entirely.
> 
> Ah. I see David suggested the same.
> 
> We can't really 'fix' what this was perhaps intended to do now
> as what it does has become ABI :(


I took another look at this.
The logic in the ads7924 driver (without this patch) is actually:

ads7924_get_channels_config(...)
{
	device_for_each_child_node(dev, node) {
		if (fwnode_property_read_u32(node, "reg", &pval)) ..
			continue;

		if (channel >= ADS7924_CHANNELS)
			continue;

		num_channels++;
	}

if (!num_channels)
	return -EINVAL;
}

...

ads7924_probe()
{
	ret = ads7924_get_channels_config(...);
	if (ret < 0)
		return dev_err_probe(...);
}

So, it still returns an error, if no channels with valid 'reg' property 
were found from the DT. It will also fail the probe().

Thus, this change is not quite as likely to cause things to break as it 
seemed. Still, for now anything with even single valid 'channel' has 
been Ok, even if all the rest were garbage. This new variant would fail 
if any of the 'channel' nodes contained no or bad 'reg'. Thus this can 
still break things.

Anyways, I'll follow your suggestion and drop this patch (unless you 
have second thoughts) - but I will keep the function so it still 
requires at least 1 valid channel node to be found.

Yours,
	-- Matti


