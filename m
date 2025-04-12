Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DCDC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 03:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cCaU/9pItXeyQyKncm+hw9C0oW5ARKbMzPEkSk/lu0=; b=Y/FL3+SsmSQjbIqjHQvYwvvdgp
	OvZX0podd9VQwISKl8OD5BvGhFPF4K00NaIJp2X/ZrZmFqKgRtULqWZR4sVymY2xDCWPDiMn2KRvb
	MhgdzkusRwYVIhSGNhrh8KgMoZZdAQHO3jkMIq8GkIdMa/+lzHFDzwC/L+pk2tLr586I7pPhTNeO8
	a8FOY4z6g8xTbnbyX/8q2ZGDcqFI/45rQliz0LRfePJpGZr2WzULrPcyO7IotdKecgipZePxXBuhM
	aDV+ukgsuiHsoTxr74iBf0MSz44+al/tyoPh2JDb3dpNtAbT/rgga3txyznX0r2A+lUQmIddsT7Pp
	1UrNm1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Rxf-0000000FNDC-1WaZ;
	Sat, 12 Apr 2025 03:55:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Rvs-0000000FN61-0bw1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 03:53:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736c277331eso3531449b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 20:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744430007; x=1745034807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9cCaU/9pItXeyQyKncm+hw9C0oW5ARKbMzPEkSk/lu0=;
        b=FI3vvgfNLFgrvd2OXF0yXByEqimhYLydIT0MH+kpMnZr1ISSZNAv12F8Xr4WqjU8Nu
         rmjtb5x+Y/oolWe+v+dsVgSQdcTZgEAz+kMAYqFzs7EKVT+6RvH3MNdzjGUv4VpDxeW0
         Po0QZe5Scpx5y+29ug0qCBe/yZColXN6h1vx1oQmmVyGNl3qXe0l/eYb8MCln8bnTlra
         UsNwLkpKwcJZr+WeBZdCEA5IGeRerk3hpq0GMK72QSISN0dFKR26aFXMXepMaul6iaNh
         GCCX9YCGC2J9HgBYoLvoVhK+cf4pDeY14CZdY9r9B+AdKpJ2th/9I1rdPi5UKa5RSHFI
         MBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430007; x=1745034807;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cCaU/9pItXeyQyKncm+hw9C0oW5ARKbMzPEkSk/lu0=;
        b=J8ecDjAfYIYhb76kMFY8BJxK2lCssTwji8DCxP/UtW/GfBxTQID9qwFQKATz/RtXFo
         vgZ9yHhzCBnmhokTASr39x5WYAhHhM8v0jqb5ioAHRdsUk0vlWZkx161zjq8Xc4RjeKh
         mmcOkr4K6v9Ic/n3A2vzbWebZjRBv7m/R6QxtNVp5Ok7T5D9gIATvoE1YyPVGpNzJtjd
         fc2jdcwkZiHKScmC9vkrMgflj9dyJSOsWVT50l9x2dhgqHHqvSJc4mxDW77tEEnl2qNr
         kEp+6iPG5jeMAGALQ+AW2XhYuJFdbuPn0QGoLLqivE+mSNGNyOOLmx3MhTQt+5JRnuRz
         Zt6g==
X-Forwarded-Encrypted: i=1; AJvYcCVzaPW9Eb9UfBy+NdTPReooKu7tmnH2oerza7okJC0JdqJs6FaODaXJ/sdUe2j15K/OgQyHsMNQoMsolROZZeSU@lists.infradead.org
X-Gm-Message-State: AOJu0YxVWxa2TMiKFYZYo86lQXREKYqsOGTwYAn8ebkHifu9XGYdXL5U
	2QhyzRhFOeVrwT3NoR0skaz0JJm8RoEpnQFbDuZU+X+ivM4spC6r8ddEh94luhly/w==
X-Gm-Gg: ASbGncsqZF+n4dZWC+gJx+VaSylexVDn3knLdfj4bJTvQNinkTRgSalq7/psiFBkEr9
	xzk83kw+OmZly5B/DsX2HmLoE8YNo9RPNyKRfmqNXdFQBgufe3xwuI3JyF69fE0zjlCZski0i+Q
	Hn/9wV1XiG8kiU7vzOMEUoz6OHw0Q9sMnoSDeIt3nPzoT4TfrMoLMrPfceu/f25p7Ilm57gBlJy
	PNc/rd3v1yXERJCcxGmCPlHzz6noQb+C3lUMgKzEh1G/VudrZzGVWNU1ExjWon97BvlbCOMurgh
	Y0BwpVw0sPa1Mq7DqYf5tWHY3toKP6dD9imNONGzZ0T0
X-Google-Smtp-Source: AGHT+IEIMF5fg8Rc1Bjc1V7Y1P75rom0e3KD+7LFsWsIXn/FP8KnbU+SQpMciMlE4vYfRTYAuGDRbQ==
X-Received: by 2002:a05:6a20:6f08:b0:1f3:1e5c:c655 with SMTP id adf61e73a8af0-201795227d9mr7520801637.6.1744430007203;
        Fri, 11 Apr 2025 20:53:27 -0700 (PDT)
Received: from [192.168.101.248] ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198c00sm2594765b3a.10.2025.04.11.20.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 20:53:26 -0700 (PDT)
Message-ID: <5084c2dc-d268-4268-a827-2ae445782a4e@gmail.com>
Date: Sat, 12 Apr 2025 03:53:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Add support for A523 Thermal system
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Content-Language: en-US
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_205328_186596_C967FEF1 
X-CRM114-Status: GOOD (  10.43  )
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


On 4/11/25 03:38, Mikhail Kalashnikov wrote:
> This patch series adds temperature sensor support for the Allwinner A523
> family of processors (same die with H728/A527/T527)

Based on 6.15-rc1 with dts patches from

https://lore.kernel.org/linux-sunxi/20250307005712.16828-1-andre.przywara@arm.com/T/#t

> Mikhail Kalashnikov (6):
>    thermal/drivers/sun8i: add gpadc clock
>    thermal/drivers/sun8i: replace devm_reset_control_get to shared
>    thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
>    arm64: dts: allwinner: A523: Add SID controller node
>    arm64: dts: allwinner: A523: Add thermal sensors and zones
>    dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
>
>   .../thermal/allwinner,sun8i-a83t-ths.yaml     |   5 +
>   .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 145 +++++++++++++++++
>   drivers/thermal/sun8i_thermal.c               | 154 +++++++++++++++++-
>   3 files changed, 300 insertions(+), 4 deletions(-)
>

