Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9BCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 05:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJxYvXKODjOtMv/aaVdKBa6NeBdC7u8qy7OeqKDdoDM=; b=y/FRWhLq4VYjNVhWMGSkrMOqK4
	5nVEVIb7aEvez/ppr75CWy22O8C/czd5A16Zegx4wH6Vk/H+C/iMq3clbBem8hx+xHoRMxx9AXIZ9
	We3hxkQstIcXMtBZGVpCV9w7U3/nQWpFkbrrxH0mj6QovJZXvYsf2Y9QUhVmqOTPTuK1QRu0gf5+Y
	3cvyXSq3vOD9x6g5RxoofpiLh65On4EaUZPDYj48dUNdaNCDyRQfYa1APsU0zJNhGMtdmQH3iuIbC
	3rGblc5dGmcnQGeYRzg6whKzv2LerOWggf/PcyoVfQ2vtIuPRl9Bnk4kHt2PNBhgklyIE72QWqWl7
	e1gobOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIgb8-00000006XHV-2jp1;
	Tue, 11 Nov 2025 05:07:18 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIgb5-00000006XGp-2VdL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 05:07:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29516a36affso36890025ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 21:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762837634; x=1763442434; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJxYvXKODjOtMv/aaVdKBa6NeBdC7u8qy7OeqKDdoDM=;
        b=FdLgNVTiW0inZKgrN5UJKz3b+hQuBhzZJM8atkQVEbv/Upkd4d14XLjVV3tnpl2fHG
         3DTbIU+qnM1mP3HoQRMl/YrZ7lGOSJQknTHdClmsNt9yDEIBG66ANhrPVnDY8kVzEH/z
         AR944mQys5jx7T6Rv32tDCRGPK8Up6WjrzVJxiuK+wcTpUrY3Z33sPsNqFzgWqB3vXbA
         SzUDy77631b3IHnXCKKw2a/m9sCkBI/qdsusEULLF4wgHbaocv/fVNCbIGXnW0WNrXOf
         YI/CytO6yi98v5DT6zYoP27vDMzICG2aFD4sK7OnPmiyoiZpvE1VJvTRJOsevHhzPl4d
         TMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762837634; x=1763442434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJxYvXKODjOtMv/aaVdKBa6NeBdC7u8qy7OeqKDdoDM=;
        b=sbW2WancGqF+q4oBYhePPrlroTIKcFUFNDGzTsbZdpDt/R9RQWuhxKkItwozkUfxuj
         48iFKSgIOP9Omj7KqMXuhFNai3vu+brOWvFrjunMFNQJ8vGe+ZbXntTSM55btKz5n+JM
         VhqVv2iqrau9YmMA2BCFrDV+zVKXAC9k6ZBuJCsOYV/rARi50twdGnTGnPCswOImWfzd
         xmdNozDaMxwPka8aEWMAXpKAFpvG7N7JPILEf0qdyVWTpcQIwEpEumCrcmlcG12hTwh6
         Le7h4D6qA6WXaY4Z+GcxcB/l+PtnkTxRfr6fMm410xyKPOjmuUHNzrJCLw8Ib2EmxqUI
         qOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHpsZ7NAb3F17xllq4WSlyXXld596RZMfJoTG3ADfMVC1+AsUxqnRwH6g1yJjQWjmafOPb3j3+wHtyfb/qezNP@lists.infradead.org
X-Gm-Message-State: AOJu0YwJXJG+W6b+b02fuy6TzjGFK370FN3dRG6DaE304OJL1Y42WNjB
	RqVtp0d+KSaFq28jGvd3LBFh5y2KnDXKVbNydT/lP8/dW9pF+0iNq56U
X-Gm-Gg: ASbGncsc3+JwYHDpEHNgZ/lYoFzhcMP2HASc3JOX3WbEQYOJLp4hGnW8mpvzKHxEpgw
	ca6JnNJ6ugMIG+4ywv1FpMsnBY6QplhQhtQoRQvlg1v9gITEmnOElyjEqgDtb34vuqa7n4DmQgM
	p2lg+7UqmHeuLlOjF2U2pvYcUBOi9A6y3RIMl6SIpL7k1SIAgbwbJJYYg17PGrF7wbhAgYWXKGG
	SgsLRkRMWvBVer3DuGDprRqTPUKV5pXmDh/ABSTKHhnoU+uwXxS2Wvj23z9vZzCcrj25h0AF7LU
	dxo5mahUwBcNYhKsKRzf8cexyGra9mOkOA59twkrf+ebRmQHHR4tOORBBNO3mFznR9tA9GOZDZO
	saVp7bF4MgekaBFt40BRkCepCZCmaVo2JS4eOMU67u/jU1HUqu0kfMxg932IUhOw=
X-Google-Smtp-Source: AGHT+IHzRdTCrue2ZgiQ50oZybWSGURPQR9pesddb3UZWH63AO4FM9OjcqyLQkulc+41mGYvnLonyQ==
X-Received: by 2002:a17:902:ecc6:b0:295:54cb:16ac with SMTP id d9443c01a7336-297e562ea82mr121851615ad.18.1762837634116;
        Mon, 10 Nov 2025 21:07:14 -0800 (PST)
Received: from geday ([2804:7f2:800b:6d3a::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509680e5sm169778595ad.1.2025.11.10.21.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 21:07:13 -0800 (PST)
Date: Tue, 11 Nov 2025 02:06:53 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ye Zhang <ye.zhang@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aRLEbfsmXnGwyigS@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
 <aQ1c7ZDycxiOIy8Y@geday>
 <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_210715_689880_DE458838 
X-CRM114-Status: GOOD (  25.27  )
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

On Fri, Nov 07, 2025 at 11:01:04AM +0800, Shawn Lin wrote:
> + Ye Zhang
> 
> 在 2025/11/07 星期五 10:43, Geraldo Nascimento 写道:
> > On Wed, Nov 05, 2025 at 04:56:36PM +0800, Shawn Lin wrote:
> >> 在 2025/11/05 星期三 16:18, Geraldo Nascimento 写道:
> >>> Hi Shawn, glad to hear from you.
> >>>
> >>> Perhaps the following change is better? It resolves the issue
> >>> without the added complication of open drain. After you questioned
> >>> if open drain is actually part of the spec, I remembered that
> >>> GPIO_OPEN_DRAIN is actually (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
> >>> so I decided to test with just GPIO_SINGLE_ENDED and it works.
> > 
> > Shawn,
> > 
> > I quote from the PCIe Mini Card Electromechanical Specification Rev 1.2
> > 
> > "3.4.1. Logic Signal Requirements
> > 
> > The 3.3V card logic levels for single-ended digital signals (WAKE#,
> > CLKREQ#, PERST#, and W_DISABLE#) are given in Table 3-7. [...]"
> > 
> > So while you are correct that PERST# is most definitely not Open Drain,
> > there's evidence on the spec that defines this signal as Single-Ended.
> > 
> 
> This's true. But I couldn't find any user in dts using either
> GPIO_SINGLE_ENDED or GPIO_OPEN_DRAIN for PCIe PERST#. I'm curious
> how these two flags affect actual behavior of chips. Ye, could you
> please help check it?
>

While I haven't heard from Ye Zhang still your comment instigated
me to dig deeper, thank you Shawn Lin. What I discovered I believe
is a bug in the Rockchip driver for the GPIO subsystem. Look:

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..5387c78ea11c 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -272,9 +272,10 @@ static int rockchip_gpio_direction_input(struct gpio_chip *gc,
 static int rockchip_gpio_direction_output(struct gpio_chip *gc,
 					  unsigned int offset, int value)
 {
-	rockchip_gpio_set(gc, offset, value);
 
-	return rockchip_gpio_set_direction(gc, offset, false);
+	rockchip_gpio_set_direction(gc, offset, false);
+
+	return rockchip_gpio_set(gc, offset, value);
 }
 
 /*

It seems to me the current logic is inverted, i.e. GPIO Port A Data
Register can't be successfully written if direction output is not set
yet.

I have to double-check with printk() but from what I see here it may
be very possible that first call to gpiod_get_index() will not set
proper value and only subsequent calls made to gpiod set_value()
will begin to set value.

For what it is worth, with the diff the workaround to set as open
source/emitter with pulldown or set open drain with pullup no longer
works, i.e. PCIe initial link training fails.

The workaround to drop TPVPERL still works, i.e. PCIe initial link
training proceeds, system operational.

Thanks,
Geraldo Nascimento

> > Thanks,
> > Geraldo Nascimento
> > 
> 

