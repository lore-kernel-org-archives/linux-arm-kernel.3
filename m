Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEnnc1dXj5lNrYUNbaQiHP03Z2g3b2VRGVuLnQpfuiI=; b=AMEyv0yPNWgk5CYozs3S3bvUbj
	wmIflzZfYtG8Fk5ZrvB0GpQCpo/0VrNvgPLErwP2n9gmvwdO594xjh/rSIkjnKcElKo8OtOsBw1pC
	dWMawrveqnNl9dO/rQ+zEYdT/HvEcIHFq6CWidflDE5BX3klPZ8bvQBymMhfrNJVqNmN+1T4TjS72
	9pcD4e7Yo6hdrgY1IVXyX3QgMRSUY167ZOw22b1eDeYK/8JiOG7cC68LnMtVRKrotNCHT30XbQPJR
	O5Ls5OgZo1W2LdL48W78NFu9n6scgiA24N01u+oXCK4qsDQpHjZ0e5ldJ+7HRz4GK/NGD0QnVDzea
	kzFIIW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toiN1-0000000FzSf-36ST;
	Sun, 02 Mar 2025 12:24:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toiLU-0000000FzJ6-0mIE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 12:23:01 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5495e926364so631910e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 04:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740918178; x=1741522978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEnnc1dXj5lNrYUNbaQiHP03Z2g3b2VRGVuLnQpfuiI=;
        b=YGIUkuqfMN3BltG5okn8nD/WdMHnkY3i4FIv+hS3xMsM1e1Z6RZGcaNWnan2gdvYlC
         K6AEAgCkjxvWJdOKk2O5mrOBU95yNALJekYz4QbXFAkhamvgTw4GQM5RaZYAT7CQKmZh
         +tcKdqj53qGIhBwUcCnDqDGBwW8kL8f3FczlslRj/6UxPTJdUdWNVqS2mtmkAAZYocDt
         x44Nf//O9he2bFYMOws+OgDDdG8KCFBDn8+OdD+ToJXdztYwDzwqjV9RZGwqBRfHJRHO
         NJP8nikoKaZfAb26NZfDNfkMbhz0pn7BExv+sxz1qspX76Qe3RE1g4R4W15gy+ldSBIj
         FFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740918178; x=1741522978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEnnc1dXj5lNrYUNbaQiHP03Z2g3b2VRGVuLnQpfuiI=;
        b=vMQC82lo+mNw0YRwD5+m3fyO0VJivwOf+zuPOLYbAqhLs1kf2qfTxKeN7oo+tccLe8
         3fszjNAeqShjfyV4GlJVQq7xQCuWw2VojIe5IWOTYALV6Iu0lkhNThbNBSpx9q+ywRkH
         AnroDTrWdnF9IzpBJ0RRRR/t7EsxbmvQeHeRGeUVijVK1Z6zrbDslcD3ikKVi3Lm5Lir
         KOB6Es2rE8hJeM7EfoiYFxnOaUqtOFdmPeltKReo0iRvSa82fmMqzaYj3vFkBnA/Mo8s
         h0m3lnw77wYgMIpElyeIagHgZxapgnu9xhHPPRM56QGYy8wDArFsIFjjx4f0A6AM/KU7
         dL3g==
X-Forwarded-Encrypted: i=1; AJvYcCWSRDQMWJ6/+VR4gKuXRDzeubRNmtcAV2ngAnVAlxhnZeBdyBEfnb7shJn4gp10g9qOiAaLbSolwJ5cK1aFcJuW@lists.infradead.org
X-Gm-Message-State: AOJu0YwMEak2/hIq1bGfVabO5vB7X5XbW9NbJuzC6WgQnl3+WgNQfSUB
	z5PaWtWZ5ei51taRY/kyS3GIeQMTKotX3t7BNo1FLs8ZPMbVUABs
X-Gm-Gg: ASbGnctPvb+enlDRGxP4jyoMvMsRHVT14JKekkDfBCX5HNStuHnmfuxn7AtFxcFVeM4
	pZzXR3wBPXMnvoSW2q026YXFi9Xqw/Mq/g3JDGyMuWuAL0X+vxnTWkedxk+pBgnoLmbgaEbpkKp
	NY3EYDFGWdOE1sbdHM0SuJNPGWXtyw6hBsTOpx2cVPux5VNkGEDExYTGhLQE+rEA84G4gvWrnmM
	DN3ghLYe6mRC2YnvuiaiJmipfuI3WX3h896HDFkT1JUHgFj/PbYv0Y1Bu62diw/bMLuApZXUC3U
	2MrJmecfwRLGnKAs/3l8AZoYr/L4MB/PeFRRyozgbIfQAxm5IT3cTf4h91X0k2JKQLzagheogvQ
	DNoukBZ3xAkkDyueZ2l8qT7GzAw==
X-Google-Smtp-Source: AGHT+IGzZOd1/B02IxZfr4aBje6krfoPxLPc1fsPRoUlTQWF7jrLAwZCd5QWTmq/yw9opL1lzwKo7Q==
X-Received: by 2002:a05:6512:1044:b0:543:baa3:87ab with SMTP id 2adb3069b0e04-5494c354581mr4068349e87.47.1740918178086;
        Sun, 02 Mar 2025 04:22:58 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bb1098ef6sm2276001fa.42.2025.03.02.04.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 04:22:57 -0800 (PST)
Message-ID: <44b1cc7f-a5e1-4c61-8b9c-1ba0c51e6343@gmail.com>
Date: Sun, 2 Mar 2025 14:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
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
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_042300_231089_53616CA3 
X-CRM114-Status: GOOD (  19.83  )
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

On 28/02/2025 19:07, Rob Herring wrote:
> On Mon, Feb 24, 2025 at 12:33 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>>
>> There are some use-cases where child nodes with a specific name need to
>> be parsed. In a few cases the data from the found nodes is added to an
>> array which is allocated based on the number of found nodes. One example
>> of such use is the IIO subsystem's ADC channel nodes, where the relevant
>> nodes are named as channel[@N].
>>
>> Add a helper for counting device's sub-nodes with certain name instead
>> of open-coding this in every user.
>>
>> Suggested-by: Jonathan Cameron <jic23@kernel.org>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> ---
>> Revision history:
>> v3 => v4:
>>   - New patch as suggested by Jonathan, see discussion in:
>> https://lore.kernel.org/lkml/20250223161338.5c896280@jic23-huawei/
>> ---
>>   drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
>>   include/linux/property.h |  2 ++
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/base/property.c b/drivers/base/property.c
>> index c1392743df9c..3f85818183cd 100644
>> --- a/drivers/base/property.c
>> +++ b/drivers/base/property.c
>> @@ -945,6 +945,34 @@ unsigned int device_get_child_node_count(const struct device *dev)
>>   }
>>   EXPORT_SYMBOL_GPL(device_get_child_node_count);
>>
>> +/**
>> + * device_get_child_node_count_named - number of child nodes with given name
>> + *
>> + * Scan device's child nodes and find all the nodes with a specific name and
>> + * return the number of found nodes. Potential '@number' -ending for scanned
>> + * names is ignored. Eg,
>> + * device_get_child_node_count(dev, "channel");
>> + * would match all the nodes:
>> + * channel { }, channel@0 {}, channel@0xabba {}...
>> + *
>> + * @dev: Device to count the child nodes for
>> + *
>> + * Return: the number of child nodes with a matching name for a given device.
>> + */
>> +unsigned int device_get_child_node_count_named(const struct device *dev,
>> +                                              const char *name)
> 
> I think this should be implemented as
> fwnode_get_child_node_count_named() with the device variant being just
> a wrapper.

I thought of that but it'll mean we had two very little used APIs 
instead of just one. Well, perhaps we see new users though so I'll 
follow this suggestion for v5.

Yours,
	-- Matti

