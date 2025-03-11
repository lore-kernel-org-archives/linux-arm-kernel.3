Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF8C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 05:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUlywhCQq4uCWufEMKrFo7MVjuzCwOMvUwcuZVYGs6Q=; b=P4t1mHDumtwXDi0zlicDOEDAWB
	G8OAKTbNjOQoXRnp+0GY6H9gtEKhwe4YfumTt5QU6aQYGZlsQ1D1+vGQsUVqFqnAoHARDL2U1WtO3
	e0HP2w5TTEbFcVt3l84wh5F0lSfX9PFmzDbVgwLoTcB0Sj5ptNcK+3SmaXJ4LBeehEWJLu3kWOZBq
	pmLvb63Y6tG/sQL8cEklfTeJPsVJzyCnPmBABXz0hdugKylnlJt9JC/sHtsWrgaDxpd3knvNibib/
	zPwJTv4tW+1s2VwUANZkOBWjpJJkjn8Rge64YjUiGWPDCEzDDjKARcvd2vd6C+/oATFEfgBKnm7Cg
	uMdK5YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trsWQ-00000004gGi-3KSY;
	Tue, 11 Mar 2025 05:51:22 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trsUm-00000004g21-3kXb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 05:49:42 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5499c8fa0f3so2487865e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741672179; x=1742276979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUlywhCQq4uCWufEMKrFo7MVjuzCwOMvUwcuZVYGs6Q=;
        b=nOUzYpgkQZfABYA9LuaOXlWbK95wzqDqP+NuB9FmbRtypyL/KlnpuEfyBhUXyc+l0Y
         k0fMB/GCjuIANvoAes3CLDwI8MPVUrIQEnYkfS0CQcLfZPEDhPbnz/fpozHtg3WgRyTe
         +8H7N2GXhlUkW6cSfY4Xom6IhO24aCzz8rHgVYM6E7+5mPRFBVu8MHeSRipz8yrwoeF4
         +otidoEVJsooxUR58usbLwm15fXCOeVWB0jkEldTP77D68RkbT12TmHXOp6ar1C5G1ox
         GzJOH1MqZlbs7VZ6eKIBAGzpD+u1G2a1OBEzkCbAjkrqs4sSvI2TyXIDtUACn8yBki3e
         7KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741672179; x=1742276979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUlywhCQq4uCWufEMKrFo7MVjuzCwOMvUwcuZVYGs6Q=;
        b=fDbBdg5OcQRICCNpzfyE9x9vU+IZMqTlPmSjVg+mHv/p4sJ+dyc4Lxa2jZEVLOdlxK
         JW26ZnszbSQi1hOVQY8+yWpecksOhJnDP5ggoPZ5NMKY7LxSvveX0NW9LNYTZdI29qll
         VZZpPPQApym/JyTePaowArVqrq1FHIcEt4hE/CMNnsTpxyTplzLhq7vlNu/bxvpiv1CB
         NYTJk4FKCxcLTledgprNa6A665gGnt6R2M8Wmqpi21Cwv1raBCTkIJG+AaPqCzzlo8s4
         RTSNAF+LQgUo0neWXnWuA2A3xc3Gf5DHbAAP4O/zVqUwjMbLXkoDx8IHJ70vmKw9W2Bz
         HZLA==
X-Forwarded-Encrypted: i=1; AJvYcCXa1jNpBD17sMXrtELKirNEMqGq3AlAz1wxaXQFS5So1NZxRJ/NdAk6Qu7u6UNrZPlsxxnqma1bnqJi2GWOvFMk@lists.infradead.org
X-Gm-Message-State: AOJu0YyTyJBBPzqlmDznw8WAXlxOndfKicEW5rJQYF/If+7vKe8cJVPX
	Dh3o3EhdzCT02OjuVTz19MIjY6l0VgEvG4hBONH5edqFxFkvBkrb
X-Gm-Gg: ASbGncuP2+rwO1WrEMg4PIr9DPA1fumRFFdc7BNfY9dUZv+pj3D9WP1zwEKSP/WN9kL
	0NVgyBdDt2gSMNKIqB7+errmmMnQM4zXnebmIaBj2fWKjIWN0UgbN0Ilku/4DSeNeMyNwCQF54S
	yqNO52G2u4nUABF4fB9Xc4FGc0ZZEhYm4DIWaIB6WOJTpdwR8yykWesPMBRgGdVHdE4Xqp1FfpN
	+BwQWM9ZWGItVzg9xiIc0m9lMNvyD9O/U1rpGYldqw7mxPNSJVPtR4yiJ7i3Uyugilg3SGoxTDb
	HxmsaFH66c3WPmtz+2BydU8Syd98XUbLsAjTfeqwMwTzD1sncoxZ2B5IPMvEBvxihqu1+VozhnR
	u9h+18sgxESAYgOeM2m2xBrgbrA==
X-Google-Smtp-Source: AGHT+IFm0afzcaF8TIv4cXHtJLsVwhvjYD4qt27mTceOLe/iKEGhGrdN2AEjY+GxRz1y2ryUkV4/gA==
X-Received: by 2002:a05:6512:2309:b0:549:7145:5d25 with SMTP id 2adb3069b0e04-549910b6189mr5273956e87.34.1741672178594;
        Mon, 10 Mar 2025 22:49:38 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae5904esm1651369e87.76.2025.03.10.22.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 22:49:36 -0700 (PDT)
Message-ID: <e685d31c-8cdc-4732-b3a8-8e70a6f82578@gmail.com>
Date: Tue, 11 Mar 2025 07:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] Support ROHM BD79124 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Herve Codina <herve.codina@bootlin.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Nuno Sa <nuno.sa@analog.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 devicetree@vger.kernel.org, Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Lars-Peter Clausen
 <lars@metafoo.de>, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-iio@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, David Lechner <dlechner@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Scally <djrscally@gmail.com>
References: <cover.1741610847.git.mazziesaccount@gmail.com>
 <20250310202738.13301548@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310202738.13301548@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_224940_953566_CB3ABDC0 
X-CRM114-Status: GOOD (  15.70  )
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

On 10/03/2025 22:27, Jonathan Cameron wrote:
> On Mon, 10 Mar 2025 14:53:50 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Support ROHM BD79124 ADC.
>>
>> This series adds also couple of IIO ADC helper functions for parsing the
>> channel information from the device tree. There are also new helpers
>> included for iterating and counting firmware child nodes with a specific
>> name.
>>
>> Series does also convert couple of drivers to use these helpers. The
>> rzg2l_adc and the sun20i-gpadc are converted to use the new ADC helper.
>>
>> The gianfar driver under net and the thp7312 under media/i2c are added as
>> first users of the newly added "named child node" -helpers.
>>
>> There has been some discussion about how useful these ADC helpers are,
>> and whether they should support also differential and single ended channel
>> configurations. This version does not include support for those - with the
>> benefit of reduced complexity and easier to use API.
>>
>> NOTE: Patches 4,5,9 and 10 are untested as I lack of relevant HW.
>> They have been compile tested only.
> This probably wants an update.  Also, 00/10? There are only 8 that I can see.

That's odd.
There should be 10 in total. And the 4, 5, 9 and 10 was updated.

9/10:
https://lore.kernel.org/all/1c4b9b4ceb1995bce76a0ddef0e04ad0d1d81190.1741610847.git.mazziesaccount@gmail.com/

10/10:
https://lore.kernel.org/all/ab79cf4415d21ff2854fee4f4189fac555c30b7a.1741610847.git.mazziesaccount@gmail.com/

Perhaps it's because of the "net-next" in subject?

Yours,
	-- Matti

