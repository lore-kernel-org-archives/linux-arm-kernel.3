Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8BEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtkdEm0DhE9kMHrzm4v1hwSlsrJYtgXqAtJA7aT6OdM=; b=SrnRzq1Y5m+cxD1VOaIJCSzceh
	0ubD0IKOzAsSVsROpk1M8psja5HvKCjmRmEnI9SUyQUd6Qf3jFwRYjca+ZkBOJNRzASrzqFBo2Amq
	0Svjy/lt5C4Z80XV7aNPU6LL3JKKjuboPeGuUemjIFGX0JGeDb/0gPy7u0AYkPuCnneQAE+0QOkQb
	YVkvl6gDJ42bk7gXgSc6gDeF/dgMraEL7y6rQ73ePFcmeSCoooD23CB9OER6m4fhHEdeo+PWa+P7n
	/MhdtGKmbq6/3FuXPI21UPG39ZDU24Akj7x8ykW0sImLhSGuFv6mIKyqFEQCAMI8QPi/8w0SNkKzc
	tOMTBVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5Hh-00000001sEx-10D6;
	Wed, 26 Feb 2025 00:28:21 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5G9-00000001s1b-2te8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 00:26:47 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3f408052bdcso2194436b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 16:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740529604; x=1741134404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TtkdEm0DhE9kMHrzm4v1hwSlsrJYtgXqAtJA7aT6OdM=;
        b=QF0xHGMP8Royj7T02I3Uhmkf6L5iXn0ubhIM/Egb93yQKuq+cvihXBF2f4bxkHI0Fy
         qwkcsO3wYUeQa8IIzDTNcgM4BGIBWXmZWDqCjLNQ8M+oPF5Fv/Ii/w0xZWr9CIP4enYA
         NzP+BqIygmoNuppO1o/45DG9m3LMVo//DlzW9R6U5re0cgABcKWfsdemTJQf9Ykv8mkz
         e0ESNOL5jUOzWxoVpyY7bZOSPWQT5V4BXmTq0j6yovGE2xl/KQ+OZKZN9+cv9k/GVdJ3
         Qa9MnW8DV0t05wV8GH8YbYYKS3yPvTCgyLydODUSFYt4rTXuAGmTHYIcYMgXnMmoFCS/
         1/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740529604; x=1741134404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtkdEm0DhE9kMHrzm4v1hwSlsrJYtgXqAtJA7aT6OdM=;
        b=D2GOjPNTKwoQCPnUEBrLTbATwN0UVbz/CST4kd98mxclGtFpuTlOlg/wv7s9bXo8eF
         AiUeVZkAWkX4Ro6IrJDtME8bYhsAShoihrXOsrBGqgcVqLuXf13PZoR/+koBEGn2OiAs
         gf04we0+ePAVF8d9oggrAFCN9uGL1OjWdJmfSc5ecrXlOFiKfsc8Vd5j4WYpr6bd7yBW
         ZRuv7a1/Kaf+sDkA0kwhknYoCD2ZiH+hPbnt2rBppxevTcLjDE3/tfi5Kz41CkeW1yts
         jmOj2IZzO6Myw/42XLtPhVP/KacIy8etHWjLmszMelS7+ykNqzAoPsuCp2gXpSS2YWhp
         B8og==
X-Forwarded-Encrypted: i=1; AJvYcCWibAbOKnjEyRjRt5SHzQE0kvH/xZ6wGw8+F2uMKs7YOWu279+nuMeD5HzD6nUWYnuZon9/6oYVE8S7qbikZZzI@lists.infradead.org
X-Gm-Message-State: AOJu0YwURSWQJslAQQh7LueEmbn472+1aA1jrGP7rvk09MWqU+Ih7aSv
	V6pTIE/9Plcg3zyZ3FiKAAqQBkK/FiwYuvoyGlvmg4LCMhIno8Tkv9mHzVR8F8Y=
X-Gm-Gg: ASbGnctSCQ8FrD2g9dWBVd7A+xn/Pjj4UGSNwGNzJN3uekmUg2lpPi+i+px9PME3EVH
	DkvIpTd2c3cbTFGVQBcMBS2ioYsoyowuzIeCArI0Y/KB2GW0Kf76NBqsYPUuRrTFT73L/X0kfmw
	C8DrSYWzEPEQSmFzG4lUDJ4EyyGu1VZlmhxxQ00MwioTEZr68hj98RGQgQOq4/R/+yO95Z1AK2V
	pkYCIC8XZ3UJw0nSoDDZd2Fv7khn3wPyiLtN1pgSqbAZRpWal/Y9b9CftJUWWvg4WuQHPlRbdPH
	/dOyy6Ktc/Y3sBS0HDt3j4unkhCw1fDRHpelMgZXcCtAW5CgCnnEwu685gSdcbc=
X-Google-Smtp-Source: AGHT+IHrEzlhOgkq+zDuK43ZJTHn/TAq6eat4Ph04G840iIXAUXagf0yq5sPkcY8nyRgOxiDTjBreA==
X-Received: by 2002:aca:1a0e:0:b0:3f4:ad6:5190 with SMTP id 5614622812f47-3f547de878fmr763766b6e.2.1740529604637;
        Tue, 25 Feb 2025 16:26:44 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f541c5bce1sm510105b6e.46.2025.02.25.16.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 16:26:43 -0800 (PST)
Message-ID: <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
Date: Tue, 25 Feb 2025 18:26:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_162645_735430_C45074AC 
X-CRM114-Status: GOOD (  21.31  )
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

On 2/24/25 12:33 PM, Matti Vaittinen wrote:
> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.

I think "preferred?" is the key question here. Currently, it is assumed
that basically all IIO bindings have channels implicitly even if the
binding doesn't call them out. It just means that there is nothing
special about the channel that needs to be documented, but the channel
is still there.

Similarly, on several drivers we added recently that make use of adc.yaml
(adi,ad7380, adi,ad4695) we wrote the bindings with the intention that
if a channel was wired in the default configuration, then you would just
omit the channel node for that input pin. Therefore, this helper couldn't
be used by these drivers since we always have a fixed number of channels
used in the driver regardless of if there are explicit channel nodes in
the devicetree or not.

In my experience, the only time we don't populate all available channels
on an ADC, even if not used, is in cases like differential chips where
any two inputs can be mixed and matched to form a channel. Some of these,
like adi,ad7173-8 would have 100s or 1000s of channels if we tried to
include all possible channels. In those cases, we make an exception and
use a dynamic number of channels based on the devicetree. But for chips
that have less than 20 total possible channels or so we've always
provided all possible channels to userspace. It makes writing userspace
software for a specific chip easier if we can always assume that chip
has the same number of channels.

> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 

