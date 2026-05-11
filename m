Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1192DCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKKfwmDWueuzuiwLmDiqHwAUuKDTiRg25fPDMxAtu3I=; b=toYqbxTjtSVfFHMp3DyY+GQoge
	acJufZ8Sm7cmK4SVraQLWfYjCL6tRP+6iwhF3/po5l8T8owSmMXE0/Wk1qLBjuj9z+Y5XfBRODvbr
	SbLOK/alS1Bt5bJP8Qkfc21NfCHr0mRFORC2ekn7KNJDZCw79P+MfiY7YwkGVTMNKfVWLqp4kUhAK
	2rXK2CAsWrflzyfVY7issDkiNxYiWgo2KLwq2ydFWJSyuS3HrXBJvOvMGeHUb/yJ0Wa1wT5RM+DtG
	RzxW+Knr/WWT+asDgd+oyYdlbT2Nptq0lusz9CrDMzSXQGF9JDwMDJXR6vEmP5mg1VzmgDZIoGjxC
	ng+y4Izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqu-0000000DKY1-43Jh;
	Mon, 11 May 2026 11:31:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqs-0000000DKVm-01uw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:References:MIME-Version:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EKKfwmDWueuzuiwLmDiqHwAUuKDTiRg25fPDMxAtu3I=; b=bX3oKMLjDA8THtHEOeCvQekL21
	2aqqZtZcG8BCLOl0i4464glr39tayMyGgr1BczJ/QWnyXgqwSjyFulioHNc687Syc4hv1pxtkr4YL
	icGW+xt5+EeFO2SVYMPYyWp+/t6ozqNDnwxLo5+Msz/6Z9uMntZAMh1KXiy1bp6BmOWoHvBHu8t8j
	65UFINh00gn4uhdoLmeFVpK4hdv0fBRRuYGb62F9hZKVATLly9r3j6Wz5H6zP2sRxwv2TObDm/N81
	PeHgZzYSu9tHfV3ENrZAhUFo54IDddkiyobrkK8/lvAnOqbig1i2XoCtGVgJsHtxQkq/GYypg2h7I
	eojO+kHQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOqm-0000000BTj2-3NAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4073844570
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 11:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AF8C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499063;
	bh=EKKfwmDWueuzuiwLmDiqHwAUuKDTiRg25fPDMxAtu3I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Ndaf6Okb8sk0A8O7VL3aBsk0ONkOoBV714yHk6/dZQl1jlV/1eKAE9dRNOp9cBaRE
	 oSicQNFzSi63gMWcQjyBj7ALHHOsKMQNy/DkmJBrk84C5kXsKd4iHdpoMiDNfEQR6m
	 9T5ynO9CX+A67VySvl/YM891b+6++c0Cz3sDZc2ZZ/O8tbjI0h4kiBTJofBhkZuFvx
	 zJcCXgj7y+afgvWRIKGS7D34JC29RgLIPoVv5TTP7rW6QNTfotzWaeBj8zkdteLjUN
	 OegFcEWhkCYBg0KEZ6qCvAuruUlzQgbG7d19IO11CR5mBfMdoLVWiN/nAhSW1Q2TJ3
	 eS3xMcJM1t8hw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso3768532e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:31:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9BhLPxXa3DGPBx35GcJOGtnBCfnCr4dopi4xqZZAGsXPv4jKLYUjIaBfP8Ld+wX9G2uG/i6z/i160kIT3ZEF5B@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1fWSKmjuM1J5T7eAfUxrDbelULdmT0KvJbyUYWr+BblqIMnSj
	riSZjeVoTNBCIUQU1P3jHukXbhLtbmsuPjIzHucUGF30pU/wCmxJGsZBfK59gkXgZqbcQQW302n
	6VPxm7mAD3WDVRnZMJ6CvIVCIRJD9aR5L/cb3jKUZpA==
X-Received: by 2002:a05:6512:8013:20b0:5a8:9909:50a3 with SMTP id
 2adb3069b0e04-5a8a94c1fc3mr3003771e87.32.1778499061711; Mon, 11 May 2026
 04:31:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:31:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:30:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507212451.3333185-3-arnd@kernel.org>
MIME-Version: 1.0
References: <20260507212451.3333185-1-arnd@kernel.org> <20260507212451.3333185-3-arnd@kernel.org>
Date: Mon, 11 May 2026 04:30:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=McjwW-LfB8+jAF7zGkThCzSWgWWbgRR8_4UFCZLGjrGGA@mail.gmail.com>
X-Gm-Features: AVHnY4JxFqpXMEt4_ocDaPjTOBgIpI7Eah18wC4y2ej7QetMh_kqZpgwKUVhjKE
Message-ID: <CAMRc=McjwW-LfB8+jAF7zGkThCzSWgWWbgRR8_4UFCZLGjrGGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] [v5 net-next] p54spi: convert to devicetree
To: Arnd Bergmann <arnd@kernel.org>
Cc: netdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	"David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Felipe Balbi <balbi@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, 
	Christian Lamparter <chunkeey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_123106_892558_0638D5AD 
X-CRM114-Status: GOOD (  11.29  )
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

On Thu, 7 May 2026 23:24:50 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The Prism54 SPI driver hardcodes GPIO numbers and expects users to
> pass them as module parameters, apparently a relic from its life as a
> staging driver. This works because there is only one user, the Nokia
> N8x0 tablet.
>
> Convert this to the gpio descriptor interface and DT based probing
> to improve this and simplify the code at the same time.
>
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

