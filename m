Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EADC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nTNTlZNHWyRFYDg5bngNoKX8zKHnMqcB37IegXuxL+g=; b=Gc0dask2o2MA45
	rzXpCAKs0LNnNkmXJfQhzCQquY7nq/0wIr6Nohe5GnXX+8LOkYQhE4bbsPjo4ulsx4fidz/AnKRIj
	8TwRZOrEqartvSvmUGieOnTOhi/HVQoyl+2IpfPyqw6Ov2IYvErm9awkAzHO0Uv0D3517H3dWWrU/
	gPXhELjc6gvTI+MrtEjVELkZjV70qzvG6FBazdkrqpLQfu6/xOW3Tn2RpWGqJuJXS3m0VTkLGpPgv
	ClSqUR88HYsAJ4OcTmQrwii+zbxGJnftifhku/XiGwNA+SlNxM7tb+sNG9XDc9pPUYSMgMPfo13bF
	YYGPG86H27FjJ4p4zX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUE0-0000000BX63-0sNi;
	Wed, 11 Jun 2025 22:47:16 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRuG-0000000B9CY-34Dv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:18:46 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-40a4de1753fso133590b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673124; x=1750277924; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTNTlZNHWyRFYDg5bngNoKX8zKHnMqcB37IegXuxL+g=;
        b=KuAOCMYVK+b8NyPoC4UMJVaDXu6ZcSlyZ4XunrxiGRCLltjgsCe+iX1kIMdT7lH0tb
         g/ClKeRyXAZCDyPHyjAzXqAqiLD3jzLkHBpP20WfqFazSRv0y7mTF/VxB2U+V9kL5cO+
         3Ux2bRVTWEefHFsmU1QpJx+qojwo1K9sPktKCv1zFBY8IO9GTlcs5T9q0G2QNfVWjg1U
         cfdWSD+6weziTyl51NDpu9VpZ6VCalwvYXkuh5J36RyurZRHaw13wFzk17X5zEjHqfpA
         fEBr2fthQayz3I+4FIMxx2brFqPpYiGJlDpmFqqHAsBp/ghhWQT7GqjPmazlXL6LeAwo
         djyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673124; x=1750277924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTNTlZNHWyRFYDg5bngNoKX8zKHnMqcB37IegXuxL+g=;
        b=ip6MqK+c+ERHgx9/6ZZ31VpUlZiUflFQKbNCBZfyzr2mZ3OzZ+pNk1wABaJhf39Dep
         b14w7/VPJS7/LfSnYumUp+UN45uNWKYr0G6+ypRBNxUqjUddttstzEL9cMiSEcRR3/9C
         7gAXfJrnjGCYK4y9duz9hlmvIewtHEx8Ry35prR4iayduzg83rpVa93PiFbBHTeul8RY
         KIPiN/yncI41uK66+aAURBg43CmRLi78sSdCdhLNVZiJEBgXdMWmggtAMlADU7QDokHV
         yxBzXkeOsiisDZRABGUld/x6orrHLEpa/s7hYEA4EpMjDn3Fb06mDATv/a6j/v+jgUVw
         pmdg==
X-Forwarded-Encrypted: i=1; AJvYcCX0AGdUSB5KR6H7jxV9kmaFaKqquKDVK8EAmcmnZdd+IMME8Bh384jygA8U24hFUmmDvYttMGzigd3UnTm1Ff33@lists.infradead.org
X-Gm-Message-State: AOJu0YxpuB0fH5xq/YuhUSWIbA1c0vnSPohv5cGQS6T4KfVHoCj/xC7T
	/6VF8RYvHLoZHN/9gjxuGmnmKngPQBDVdyZCwq4gxMJzIHYfiQV/oiYuYl29jfiuLYU=
X-Gm-Gg: ASbGncvVSN3ZGedi4rC9252YK1JnO2Q+1IdoAnnPpNqVlXqJ2bC+8EC045BznhzRypN
	Bbjg8s6Z4aMoNx2nawn/9A777WNn9GE+8rqY6P14UA+ymXnLwbL/JY4+6zXqMdIhgqN93dOH8H9
	3kwzMQ35Yg79OksxIvdfJyRymTr7jw8sDmiRs1mmHH/dzw+IciknMJpXrpX+6T3jXG+qLjBVps6
	S7OXqhzgNvWckQ/kethcZiJ9F9S3HFIVPg8pNE2Yh26LXrckWIekblIM0qz3QFKL6Xw45hO9Geu
	ehHr6pYt3jyr+pzdWKend/t2/V9OKNR++Pmqy+VLbFY5XwJ+o7ACalHzwusICuepNvlx
X-Google-Smtp-Source: AGHT+IExhWtGNKPwRnOwsmDXgg/RlKoph4199SUPBrA/vgunndUh/aKsrqhRu/XH/oSztR8tBsQK8g==
X-Received: by 2002:a05:6808:181e:b0:408:fef8:9c91 with SMTP id 5614622812f47-40a65fee5edmr732537b6e.5.1749673123808;
        Wed, 11 Jun 2025 13:18:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a5d80d967sm467732b6e.4.2025.06.11.13.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 13:18:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v4 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Date: Wed, 11 Jun 2025 15:18:08 -0500
Message-Id: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDkSWgC/4XNTQqDMBCG4atI1k3Jn1G76j1KFzEZNWCNJBIq4
 t0b3bSUSpfvB/PMggJ4CwFdsgV5iDZYN6QQpwzpTg0tYGtSI0ZYTiinuB2twwEmrLxXM+6gH8H
 j2gjFWckLYjhKt6OHxj5393ZP3dkwOT/vbyLd1n9ipJjgqqK61LoWRsK1VnNvaw9n7R5oQyN7Q
 4zII4gliOq8IaJsikrzHxD/gCg5gniCjFSy4LIQRpVf0LquLwm4GHhPAQAA
X-Change-ID: 20250131-gpio-set-array-helper-bd4a328370d3
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=fl1skejRdYPAXQJachyawZhX+X0nZDq7tf0kNuLhVqk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSeSDnP2x2LEK+fLj5yc2iRew7RstZzKtuFXLX
 p3MJHtaiP6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEnkgwAKCRDCzCAB/wGP
 wOfdB/4ipvtAe+CwmELCP2yQlVhCMr6n4zq/Aligv6zjBb+DKG9GHsQ2+Uk1KbbKa1W/r7mBBEB
 E1ql6DHjcLnZgvEdKXQObOLA7++2Wb7ALNErFObpEEAe0DBvtoXZov+AcwBxzgfyVrYaVtXQXUb
 +rZB2jwuWZwU6AqfOJy88IqHXmXfxRVz7uVuQ4FnNW5Y60tIjadU5MShX/pBXi/8vMyR0OMNHG9
 b1fOZhZtmAeMiI044Uih3mclXT8ttjd+MVvSbosF4Vz4OpvkUPGiaa4v4830mmiflgbPdYSnFsz
 q+zEBFudRiIlgN0yOWNpNb7q6mOe87q1WCX/aknWMqSwobjH
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131844_869322_BFAC1F7B 
X-CRM114-Status: GOOD (  12.00  )
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

This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
that didn't get applied yet for the bus subsystem. So I have changed
the subject line accordingly.

Arnd,

There was no maintainer listed in MAINTAINERS for the ts-nbus driver
and it looks like you have picked up patches for it in the past. Could
you please pick up these as well?

---
Changes in v4:
- Dropped all non-ts-nbus patches.
- Fixed a reported issue with uninitialized variables.
- Link to v3: https://lore.kernel.org/r/20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com

Changes in v3:
- Added IS_ERR_OR_NULL() check to gpiod_multi_set_value_cansleep()
- Added new patches to clean up accessing bitmap directly (ts-nbus, ad2s1210).
- Added function prefix for max3191x.
- Removed unnecessary braces in ad7606 patch.
- Picked up additional trailers.
- Link to v2: https://lore.kernel.org/r/20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com

Changes in v2:
- Renamed new function from gpiods_multi_set_value_cansleep() to
  gpiod_multi_set_value_cansleep()
- Fixed typo in name of replaced function in all commit messages.
- Picked up trailers.
- Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com

---
David Lechner (3):
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiod_multi_set_value_cansleep
      bus: ts-nbus: use bitmap_set_value8()

 drivers/bus/ts-nbus.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250131-gpio-set-array-helper-bd4a328370d3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


