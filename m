Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0B4C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=; b=eHZB2wYBHtzjNyBQueKSohv58B
	kIFgouI479DIGe3nnxP55lRKvOwS/6yeUZMf73MvNuZAUoppfOM2UHKldSlGkdVBqZSXhWo2I/Okm
	qotuqjji6xEHnR9rVeO5MCMSsNZ6+REh4QH3+qLgHQHvbBkbqofdeNn2HCyLa3xG/V3awNwL6RGQL
	GP1GfT8eyq0JQmFx8dcKw67arPEgXs2kOTW5zHcSJZzTXAooBGNXYYfMldQhvc/sKTeO0F3FZ6nls
	GfrhXjqfgpJZ0hFzMvFEFuxGm1mnEs9ciRe+gFiTWRXkm0N8n+I0qKiwcIERdBEjdOIgoI7DyH96O
	yBMN5U4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBXw-0000000CbyN-3fu9;
	Thu, 19 Jun 2025 09:27:00 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAkt-0000000CRvx-1nve
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:36:20 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b82f3767so442486e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322177; x=1750926977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
        b=HxHQCusp7F6fRltFh2XBSIYQibglBT+FSSey9HA2sx4kalCTkHAIC57dIgUHyPiwxb
         K/NUJzGsfBQE6/krH8KmgpY+lb0GtiqtE26vlCQt/mUvNNrmKNaMaGwXU4S1y/Ta+acQ
         TFPC1bBt1vAtODy6flb+37HRmxchEEswl65BL7XTfBz6ZM8uu8aH535mKzUs4Ib+zkPs
         9cR1lIQLEihVrihczOkMlivZsl6/8xkyzq7P+G2TPf5P66PGg2nbWMJrylrOOUvPksU8
         UeWKeT8CyiyURI7/6NsQDLHfCYeiJlxXYV4jjwYkjyiswY9pg/LhhjepDm9nKLEpCxzJ
         qUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322177; x=1750926977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzf9de8tjudMgAFImVxK60pD4txhktnI7YYgbi2dkYs=;
        b=vNKbcVHv7ldHUBxdluPZA4wCJ5lb00EGA8YgH3SkbS6XSYql80lEFY8PB7zheyNu9l
         4aFi9ZewGTnPZNtXhWM19QMobgxjN+CkbK4+yzVr1u6OZDRsy0WxYwQvS/2NSyUY+bub
         feb+vzZNljR7hGNY13Y68AQ8sK5a/O108Vv2s9FrF0trXSl2z0SKvX3OrB1eT/0aWGgZ
         0Sm6Q44tllTDYtz92MwmUgt6p9nAN2g1JgzVG4syVR+cqViccZ0HpBI+s0XBGq8gYtc9
         K/upOjNtCH21G9lQ9565LgD+GVfgEaBSi+WP7uOS5Vmmzq6UaQQR0If7jHxPdXafVY4Y
         287w==
X-Forwarded-Encrypted: i=1; AJvYcCXJv57izWFCSzae/T9bQV6N10RzCFaMTOTQbKKs/Uf535K8wuQaXK2slV8VDS261B/yX1R1E6hD8DTFvsjz5jyx@lists.infradead.org
X-Gm-Message-State: AOJu0YwwKSULLD/y8VBxTI5hO8ysohpAdVXQVRMiCLts7bQtbEVVe2rw
	Tr+RrzkjAgbfPCvdY9ggApqycE1D+uVWyasB1FJPDRFeNXyMcfsEBOg1IavipdCA+kmwkBAFxf3
	X1GG/85aKZwDPTiOgJRZaBIBtycdetmASKrwwpnwXBw==
X-Gm-Gg: ASbGnculGrs5EHFysC7Gvirqm8KmNd5UkDzG0Mwlz8RzkbezoPr9ZTImlruA272a5lY
	bvfQUYV4LJR4pz3GNxfLIpRRLzUcIomVuCkuetmI9XXb9uUuTKNWuMDGNX1LBqcz7nf+oVnBNsp
	VP8mWqL+GBykHxhiuZE1N3w8Se44hkoW1NrzkdBoH7f8WR8E7qr9uZw94tFt1Qg1UqXxB6Azxyt
	o4=
X-Google-Smtp-Source: AGHT+IGROhB1BHEhVf7lp3K17L78LdhcTvHXtwk6/ks9ka8oVJATyogYr8tNLZyP1iVXGY7Rk+OL3YCyL3i+oERqtJI=
X-Received: by 2002:a05:6512:23a7:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-553b6e74f1bmr6127957e87.16.1750322177403; Thu, 19 Jun 2025
 01:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:36:06 +0200
X-Gm-Features: AX0GCFte8Q5wHOGkWFWXjfIA30NLlYd4ISVYqo5eAKH8rrJ08AS71jryqV8KALU
Message-ID: <CAMRc=MdkDF_HjRvCvUdKueRgNYDxe=aeGeWAw9bBgnAZ=kxZAA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_013619_466693_CCE7734B 
X-CRM114-Status: GOOD (  10.00  )
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

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Baolin Wang <baolin.wang@linux.alibaba.com>

