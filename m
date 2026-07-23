Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ECEC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 21:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVBWHG8ESuMad3qr42QTUda7Z4q11ujZE8cB+I2e/yU=; b=AewxX9k044GFnaeidwUdOCdeKW
	mUUveRCFEOQpbOOm+3hZRngGJ+edFH5wBMmOrbHQ5wMFsV8YLme11fssDGrnUUJyuHg19jOD+glN8
	i76HsAngQKdUI9+etEjWSBwMYwFf41XcIRZRObqFQmjAkPyG4dUl0oOU+wt8Rh3oJdh8qDWixLAnA
	etBLfzCIgQGANkTuNdoYwfeTsKD+BBML+PLvm8Qr9cLmbIvMuJ3CjFYnGpWMWHFfZI7ay16EGw8w5
	1VC4z3OBX9DGjc8uUtfEGmIpfrs08J3Md2cU/hRX48BwtgG+K6ylV+eIqJ3XWNjzx1HoyUj9q2nBK
	3A+MiH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1Go-0000000F8am-2rHN;
	Thu, 23 Jul 2026 21:47:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1Gl-0000000F8a2-1cA7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 21:47:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49553515a8bso11729375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843273; x=1785448073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVBWHG8ESuMad3qr42QTUda7Z4q11ujZE8cB+I2e/yU=;
        b=cczeuaxLIvX2jHwYd7yF4TB/rER9kjOQfHOnNZ4WzNIERITJ6P3DBisxzrD4OIWCOn
         NFd+3MuikcSDxzMT7fbyzJ0EWGZnAwkTSLzxxP7J4vxaSoMqTAyJYC4zF44KMnSZl1rE
         N4UscSf4y+qTUPBgZnb15qBUHoMQgu8uWDdIKG1gJV+Wd+fpAmXNz0enfNwkjwXzHaQt
         E8tMYlXKvNcKR61GQRBRG7FR/lBVucedRhxP2yZ2O+pSIxOYAiSfVi/haMsNEu2U65vI
         GFYyZIQv+h7KVIx1QjXC3NwawcYHyh2u/e/Zos0Fk3O6cSAjhP9ytNHmBBptVOOPQmbb
         AABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843273; x=1785448073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVBWHG8ESuMad3qr42QTUda7Z4q11ujZE8cB+I2e/yU=;
        b=aERPc8JRxHH/yU8K+ORy8+NigyWfCcHUGu03eeVu8LME8MPq8uhnKWmPqanf8tEeoh
         oKCBEQFAVinRC7Pq3CrQhPTdIFem+f6Z3CCMjbN6Lrcwkd89oielqEz7mbTYf+Ru85U6
         s8+ayLaIEk8DnatQHVZO6glwWff5EjMeaNr/sfbtf41RmDBgRKzi61qfKytUVOMmvV5R
         1lKHpR0V5rdU4n74RHBApay5gnVYAgFWPzNQnf8cK50w9rtD7VIEen3+mJwUiDMxEV2p
         VNzBWauUaH4KqEnZOh9xtk+oROhwiSKWBEVssYqN/UARD/8zmZsGchT/JXXs9qXroCaD
         Owzw==
X-Forwarded-Encrypted: i=1; AHgh+RoqpihsJ0vM9F3zj65KzHeIhXluSCeckSrhUQfLGkYlFf0S0mGNAVBG0TIuCCc26SE9oJjd9OCqYNviQRlvkt9m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzci2sWLl3W2zUYFNk3TUV+CkjXwlkkqenpJX4IAl1TxYPRp+ev
	3DKZdvAq1cvjEBBQIvpxvzPxrnZOJ6E5muM6qh3BuoWPCXBApqanpgHH
X-Gm-Gg: AR+sD10mPo6osb2BjKaiwnufMq88auTh/AFAogJ+7RS4iDckEu4MthvJIasqnKPe6DJ
	tXJrxP0gxbQyIhnNLe3njCK8hBzrmFCUkcTgC5MpZHVNtSF53scbenU+Vfu1SPMwnCV9FhyXYvb
	JaSAPjcJrjCrSeP4vhRYznOrCSyU8mfwlYfd8fEn3xTe2OZGjMEKehMOkHyUYvou8jb4Ka4O1p7
	MY4CQOG8etEmhGt/J3imYlqZuO1Y7hhu9CN0A3UIx0WXuFGSnBYI1CXWiPJq6gI5V+vahcNfgSv
	+Rur4636hQZXRV+gAI90V65fz8FaAgJWGRtYSAHLaoRrTXeYmdMPwNPTICkeKms3kUTMzOxbsvY
	WbunIaeE8FwOPrzkK+bwHumvXZqsIqZ3lduxXj1YqLPTBxFpZu/DMfkcOR8u4CO7g0e9w2Cms0d
	PT4mJi6LcU+Qx5l/8A9AJBP7r7E/ID6ljtQFPK9Yug9kq0ZvRMvcLHmQM7WnPpUqFItGeBRJcH3
	+TMkCYJ5lpghR7mKjlx294mm47+JC/7goDDWTkJXC6nndvDTS0FqLUCDTPbMvTHs4ccFCE8bdil
	0IegI6UoVhrSdWyFLSlC5NtH29xrf0KflLs0kBtmojGeRa8rUF91kTyzKtC0BRsg33TNJVZYgy8
	uzn4OFvKB2/Y=
X-Received: by 2002:a7b:cd14:0:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-49573cbfb7fmr37428135e9.2.1784843273372;
        Thu, 23 Jul 2026 14:47:53 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9bbc4sm13559335e9.3.2026.07.23.14.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:47:53 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:47:51 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
Message-ID: <20260723234751.5ff138bd@systembl0wer>
In-Reply-To: <20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
	<20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_144755_449949_CB5DE254 
X-CRM114-Status: GOOD (  14.10  )
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

On Thu, 23 Jul 2026 22:58:33 +0530
Kaustabh Chakraborty <kauschluss@disroot.org> wrote:

> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
> Corporation. Unlike the other GP2AP* schemas, this is strictly a
> proximity sensor and NOT an ambient light sensor.
> 
> For power supplies, it expects two voltage supplies, one for core and
> other for driving the infrared LED which is used to measure proximity
> distance.
> 
> This chip has been used in production mobile devices such as the Samsung
> Galaxy J6.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---

...

> +  vdd-supply:
> +    description: Voltage supply for the internal circuitry
> +
> +  vled-supply:
> +    description: Voltage supply for the IR LED
> +
> +  proximity-near-level: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

vdd-supply and vled-supply are definitely required.

-- 
Kind regards,
Joshua Crofts

