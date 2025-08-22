Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A5BCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=; b=YgkG9k5xtHSgO+IuytQYU0PRpW
	hxzX4ZH/hUIZQlyXZ67HSWHHfpXqeYLRd0HZyehWCqpMAbyvq+0OOwNxXD0BYEXsdQ3RT+rC83Zuj
	Sbid4Az2iO5pyDUjC1rMI0tzDwJSSWQar5ILKZt+pRR+LnAMYLvQDkG6R+5UU1N504FqGdqdRunb4
	0DSyQHpp8lQZSc5lGmCRc52w0WKf+drOWM9c0V7SPs4SQ99Vl821VwaIT96YgL497K+uC2vHOsVoX
	FEcFjZpCP6Lf8Q770GE8j99OZyd79+dNWRqnNyslCfDs7KpteXDOrrVSduY9lthZhtha0YzxdRk+t
	BOFAHAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQGc-00000002O4k-04H0;
	Fri, 22 Aug 2025 11:49:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMAO-00000001oSV-24rd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 07:26:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so14674465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847587; x=1756452387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
        b=TWinOb+NXML3JOplfv4+fZL/nX9KOdXmONwJ+bSBsp7xUkkjtfdiqt/DmV+G/aZODn
         U7ZQa5JZVfcjQeNyeAxfuZksCAZ7SV/ema88Fs3sgHVCXlcbu4oML1ePu9C67Q3Y6LUw
         7hreDwxOeaBc5D+WCi2ChxMSpV55upYgWigxYJJrOsONHHwH1WqoK738IbfQf330H2zo
         kJYzDMlpDA9zchdMI/iQwvQ15q86ucfG0gtNyADt2kFfjFHK2nrrDputnoLAkDXFWSRH
         Qk6NdvZQ4Yies4ofBpHWQEd2UKxftQWjFU78Sfc1a3oOQ5DLNKAGskf/QuYfD/23U1Z9
         yoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847587; x=1756452387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
        b=u6KlngyeF6MLpAeE3KfDJ16HWZ5yh+c4D93tKe6De2uBdehiwfwLqmb+EFArSfDwpz
         08wdVdSBd15MpXM9xNitEOWS1YvbGjWTl/BmrSz4yUUZfmAU9vamuUxUKUaZJlkRZHcx
         LEaBWwfoQ6yKWtdDASc4XuDWI4IprW18YbhYBJAdHRRX3jqKJXW2YEp8TvFDrpIGPO1t
         OF86CDtT5Ki7Usg/9Q5msEj2B4nn7hXVzEC577gAUY/2cgHTsvZQMmBMyiM4jkPb1on7
         p78cVcTvWXo6k4UCin2zEkd1ijVfErAWDyZR4A5cXEuLBKV+VziOHQ15lz+Ny6jtBC8T
         0hvw==
X-Forwarded-Encrypted: i=1; AJvYcCWEXDwu4fjhzqhkJPtw7/qqjQBufXKQCkCMhKF2lTwqFfC5Jkr6UOy6IB10dRmIVGEBB98wD7lXwvnUwtr0zEqk@lists.infradead.org
X-Gm-Message-State: AOJu0YxWuStJgoG6eG2HUCZt9dOf/y4vVG8d4hRx/k4HU+eh/drmkVVQ
	rtFX7O6kG+N7Vx7e2DJmcTxOtbtahwgBCudQcd4bbio4toL8ivkAzfyZ1ySa2dWuEe8=
X-Gm-Gg: ASbGncsdMUkdKar/43KxytoRXETd56mygTPRj/mWMRLnSBND7oSh6wbm19HQ7ajGU4/
	I3fKwI05XUXHAEMYMq2Z5anW9yNuo1vaPLPRTcIhuZlqlRmVv8ny8E3E+GOy77EJe2bqN2AN8Yp
	1xPtY/AKsYNBHfK82JgNVZMUYXyM7n5Be0t4Su4ROOdbUaLXSWM4W36AqxJIelZo21ha+J1/ybU
	gUoQAzUDXLAY5am8IrbyDQHthNWGsOoWqqKtfeHrMDyOIqEvTeQ2pYpQe1zSZx+k2iVUphKTAVR
	HaUW3DdeIUO38kiMuCP7B/Fo2g7XZhQ4IJEnBewhKmcY36BY+Zs4ba9raV18D/NQERN5qRgXriP
	HnxyKzczsMbVmArkoPAgT8ZN+CQGv5D9R6y7jlrlD2qxG1u+4rx13bpvtRib/bWuXHK2BuG8bNZ
	ASzIny2g==
X-Google-Smtp-Source: AGHT+IHDuHRP55niLwTskQO1m/b/5ctH5UZu5kjoy3BiQ8RvkZmMD4Fr6kF/PognPgs2X/R938TpUw==
X-Received: by 2002:a05:600c:1c28:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-45b51798fb1mr14095255e9.3.1755847586840;
        Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e2f0adsm25076255e9.13.2025.08.22.00.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:26:24 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <aKgboFjwjtZsanWb@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_002628_545911_8187E95C 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, Aug 19, 2025 at 12:58:59PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..30b591152fa31d5e43243cac44c72028b05b5f8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Is the interrupt useful for anything?

AFAIK its perfectly OK for DT bindings to describe hardware features the
driver does not use... but is the driver missing out on error reporting
(for example) by not using this interrupt for anything?


Daniel.

