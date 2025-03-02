Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F448C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKMpELokI1Izo5JKWkdqhyiLCCqSlpg1TEXyzHNbP8w=; b=k2MLZwfsIbqW1Nqr++YmwmnrRY
	bDcGhVNo/Z7Dyot2J8oNtxtvwjPQI0oIgSl5EZAdJougKBbrTb9YIXAr3nd9V9zjvbXuPxrwLuYK0
	I89uOo7aiM3INk16OzmzDKkZQ/kh23H6p+r7Sna/IFDbKV5Wu33krty1/wtVr6GoUq53s33Vv4u/K
	RT9kxMy7NGuCMipH9iU3BjHnBo37r1s3hHAb1G5G1Jtc8MGRecJLwpQoI6PhxQlGG6h0FVVciuDuy
	tKjPT+RKIrjDNn6axt4nBLEmtycMH7+J6PsV1r9J8gGCUgctNqfZjW1/01K9bMmNSIE/993sa4hMP
	enIg+bUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toiym-0000000G1ds-14t4;
	Sun, 02 Mar 2025 13:03:36 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toixA-0000000G1Uy-0xX0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:01:57 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4112302e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 05:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920514; x=1741525314; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKMpELokI1Izo5JKWkdqhyiLCCqSlpg1TEXyzHNbP8w=;
        b=KleIGKaRTXxwGmpW+AKYBYQ8c5s3h5WmlhvMQW4D1DEpw58XcqoNOJ8G9zGSCknIEA
         lxSXSOsjO62mLdoz/PsT0hJ0/hQgcEt2kTdLJgQHBdACdg3fpohEVzJvcoR8FxZDQGrC
         xL/nFwR20BZPXyK8ontdiW9tlNoj3YtzxVzz1Frg7tesbRJyQ+P2Xwn7r+hGrsSI20yg
         XXow0GZ2g+MiCecuPyXCz5eTYIUO1jE8ynmde46jyZpRGYnVr8bSXjiOQ/qQOlHFn2+l
         pJB6ilg4VIX4QcDh6OUxo+ZMv6dMPWQJCmqDbYR4Qn0nXglSvbmm4mxYdjpw/eY7GiNY
         gLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920514; x=1741525314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKMpELokI1Izo5JKWkdqhyiLCCqSlpg1TEXyzHNbP8w=;
        b=XVNVgK9oZLNf/vyicA2lso8/XAFJomC4VPZoR7cg4eqiAjPo7B47jAks8RjiP5OkUj
         6b/pqTw5/s4t0M7vSymNnMu8adFjn4EZqbrb/nfMWmUHoFHw5++Yz9XNku7scrhPLiB6
         iJGL3ED4PVeylUXN/xN5uXtMN5nzUn/p/FBvYli7vly/AftHUVDQhYATmfFFBoztZB0m
         6ZgxzPE/cOpGW0xGvC8UYVsDPlEueKLNJ0SifMbBr5uyK9DV/RtyyJe6lXzg5csvY5UY
         ZrPCjH0dqlKBeQ/q1/pboJeSBeszV9G0F+Qp9fHorBxdrFU4fdstEbRzeihkckcy5kCV
         nTHw==
X-Forwarded-Encrypted: i=1; AJvYcCXQTFEZ09+TKCcyQQfddDZBImsZkeO7+RWZFlHYli2cflPumIZCBUe/2jPIwA+YjsXsnmyCr1NU1q0YYorYQbHM@lists.infradead.org
X-Gm-Message-State: AOJu0YyWi07xtK+LZ810qZEVVLXqDoDxQ03MkUZwSD/EZYUOHwji6xO/
	sYMO/Za+CXf3dP9VKQyhsMWRCYIGF1N0jQbdvHHZaw1eeKmJYFJB
X-Gm-Gg: ASbGncs50wNuuCrgx0t64XxsXeDIKK18L9vlT/1Roeciqs3Jrt5BZFNF5bdtkhUDEeL
	Qz65yRR0Yq5L9LSOVY9GS9bzL0kyk/QX7gTHh7juleiX/lc/6kfdHs/n0h/WpfNsSiUNVapyNXr
	GC50d0YOegYV4ixe7F0cOVH5O3UUAvf35nBFBLuOnpIBOfgod0xDD+jnsThwvNqRLXxwhE+tcUt
	AVlYK2tKfhGtt1MiiBPKrUndas9vis0FtxW+5OEwFU+QzQ9G7UBZR6cLHhtI/63ill9FSEBuI+b
	B/AFYoWniFG37iYxaDbSpKratrvzVzsFNTN/jVRd7ECZoGDkuqPlZHg7j9yd1Th/5lp8cJCAy8k
	LU+XgDpeBBqbRtV1DwDyQ308ukQ==
X-Google-Smtp-Source: AGHT+IFLfMqcH2cw9dr7pix/TGEb+jliFWHuNuFd3kEBSDMMDq3K44UkAX694UgEITw4mLC34ErNXA==
X-Received: by 2002:a05:6512:b90:b0:545:a2f:22b4 with SMTP id 2adb3069b0e04-5494c37d8e6mr3183877e87.40.1740920514146;
        Sun, 02 Mar 2025 05:01:54 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5496094e126sm201622e87.51.2025.03.02.05.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:01:52 -0800 (PST)
Message-ID: <023c8a59-55df-4484-a2c2-f629b237e21f@gmail.com>
Date: Sun, 2 Mar 2025 15:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
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
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
 <20250302034807.680a3971@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302034807.680a3971@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_050156_271570_3203B01C 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

On 02/03/2025 05:48, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:33:16 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 

...

>> +int iio_adc_device_num_channels(struct device *dev)
>> +{
>> +	return device_get_child_node_count_named(dev, "channel");
>> +}
>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> Just noticed, this isn't namespaces which is a bit odd.  I'd drop
> the export anyway in favour of static inline but if you don't match
> the namespace of the next one.

Indeed, thanks. I'll inline this in v5.

Yours,
	-- Matti

