Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBE7CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCDOWVvvPjn4Zn7DxkNlW8KIDmqPC58h+Qgu1lcXnuQ=; b=IGD0hlqG2Omi1l2sPKw1CbZ05Q
	2pRB8kYjF1a/iv4FumS/l5D3xz6kA5NqjrhpzFxAPKXgitIEW8Uwo9zRqC85luuvq8VhC2VGcwSKI
	zjvzfe3ODYs+2ne27cIUoWDG3boRkRW6YaYGABbpX8mnBQVwpMzYsVMoZ+vgHBBW7yEsGZkT0hghj
	Htjy4Bk0pQhzRxh8CThYoiQd0dVtkskUwEaooJF3xPATD9mAimpFZUsFvo0YqtbErteJElTiUD0cY
	soDww33MgerFKHYhiDPx2MHM6VzimKsgLbOJ8hb39l+wMOgQcShc+XTvNii1DGjAqPi2kdibDfF00
	geXXeF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBze1-000000073Ls-3bOA;
	Wed, 30 Sep 2026 19:07:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBze0-000000073Lb-0fDm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 19:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PCDOWVvvPjn4Zn7DxkNlW8KIDmqPC58h+Qgu1lcXnuQ=; b=f7bcl1m1HAJsmtUke6oEaqAADo
	o6B+YqtQrlllDMqgsJiQNr7XO0xBi6yzHcXPxhZOmgSDZJxB+Qgftg4atzKFTmq0336tEeMq/cprj
	pboVF/HE74W2k0mDEKp/NeuJ99pcAmNwdAo7uu9U3xOWhUJypua9R2DaFgA/kMZ8NIL8p5/9TzPaH
	vvDgTRch1DHg7bbUlUesnLgmZYEiOft+I+Y7JiXwcu66p2ZGNoAIQHLAnjOll3a2OOhvwA4vH23Ye
	WcOBjbAV0W4DUxps4SB67Aaf783jZPSuwKLoVNw5UNDU1wWj5Z45ZSElG608uxVTUUotnkLzra6r3
	5vURBufg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBzdv-00000004ECh-2mRl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 19:07:06 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so20937875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790795222; x=1791400022; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCDOWVvvPjn4Zn7DxkNlW8KIDmqPC58h+Qgu1lcXnuQ=;
        b=JQBoZCLzIcUhAcnuhDVCKnVAHDzo+Jp4h3/ONofGvqAHQiPVU2iN3+XUzqWKcrT6/4
         WxkQa5rSSlleoKouIcNF2Z2Jbfkrrv7HhvVTJc7kPdzTWcoARivvpeA0tVPQqHteZA37
         UJT1mxI9+EpRnEqZcZY7059MWbM/aEAKOZ1LvgGSqjmaH7LQEmbWtsXG6KotasoP5TPL
         fXL62jgdHgOcBPH6WdDO+51p0yQ7eCYoNLS+kvjEsKm2ZETJbfTcx/imtvk2CI0/3FQ6
         fFNnyupHDbFefXBRukQXs4CDYxZeX3L4UmQyqAnwgyuHkFMzCLCZ0uoQw0uLj5dJf9T1
         KWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795222; x=1791400022;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCDOWVvvPjn4Zn7DxkNlW8KIDmqPC58h+Qgu1lcXnuQ=;
        b=DaUYivdXl2USCcngr4AAtMv6y2+q/IfhwjSaWnphlBp9YHNYUYhNg6iACsGA2tG9Es
         pLu0da+HdkryTQKAojslbWZ6IpLMRJ+VS4VAI1m6OuTAcinAZAendNeJuF6NDrBh9jxb
         yaYl92ES00Vp9RMhaLLxGWCGzBQky7X3PxbXssuaAw+JGbnh+D90HUj0aBk+tBaB0oso
         dwgCa3teFYG7KgIEszMAQE+tld+NKlrR4DbIq+5dYikNEHnTTgNdoK4FAcQ9elUct3gh
         OqK08Mo6MESe8SacD+hrrnjyrPGAkgF3o1NevPqlCntz+9oikJURJX3CZs4O/8d6+BiH
         DVUA==
X-Forwarded-Encrypted: i=1; AKwUvBx/rykgPQKW2TONa6SW2Y3q3Lzsx6cGXLBCRmm7Gzuh5pSmC4QCcr2W0DYHt97/Vu6ojsqYnYOyraQQi0O3X/aC@lists.infradead.org
X-Gm-Message-State: AFuF++lLY6CbNITeytEzBWjycaE3DobGpQ4BqCjD1OJsff/Cke5mZo0f
	p5Pr/C4GBbC3G0y158Rux9ln/drxPltpNPQcsSwTP1LcGT4mNrTpCfED
X-Gm-Gg: AYBFou3h2+9CxRbUFb4areZS54v/jKu+Ns1iXax4SeAHqpzw36eUOTjOn3XCeynGbKt
	S/2oSj3ZbBGNz2k2kdXQBUHPmTgqblEt5XumquvULpqNuLec+pTAp6mtRxgXLVNTu88dgufQhcQ
	FCI8tC+SBNmI32UM/34qT5GqGCSq7R1t00tfpr0Ac0D0OzJ3Qv4Pa1KXWEop+b4yS5kYrXMyAU7
	telc17+g7B77PFyHlmwmscXpOEMPclDoIEqK08gFBLVFRJh8jCo0vjccyw9/7/0Qn5Sh/VHZb8i
	eVJRRTkxiIQ14yZo8oM+Lwr6fMtkV48oGjTApdWtso0DKptS7tjT8wyA6ce6RO9NMCln5nwfQec
	sZgppvKVc2gxniPaJGoAzIvtMkmQT4tW5ku/4zx2XNbAIqJa2wRYontl+rO31CpbHdESMv+RVVd
	+j7kZPynC2PiG81d5+EeLFlHX2ULUq5tyIybFqsjuPrNAyYX6LfCCkA85R3PnuL53lzciUNDQbo
	Vx28Id0yyTbI+DYiyqoB4XtZL5zHD0vMU5GdYiLCb8=
X-Received: by 2002:a05:600c:a05:b0:4a0:6bb:237e with SMTP id 5b1f17b1804b1-4a01b01b407mr37229355e9.29.1790795221532;
        Wed, 30 Sep 2026 12:07:01 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f957b83sm3700185e9.15.2026.09.30.12.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 12:07:01 -0700 (PDT)
Message-ID: <bd02376e-f42a-4251-8e7d-7c4e7579a845@gmail.com>
Date: Wed, 30 Sep 2026 21:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rtc: Add Raspberry Pi 5 RTC driver
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com,
 Dom Cobley <popcornmix@gmail.com>
References: <20260930095203.492949-1-sander.speetjens@gmail.com>
 <20260930095203.492949-3-sander.speetjens@gmail.com>
 <7441de5b-e9a6-4080-b312-d6c7123fdcde@gmx.net>
 <2872a37d-4f24-4429-aba5-34f020740821@gmail.com>
 <550045ab-fe74-4445-8f6c-4a031f5b436b@gmx.net>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <550045ab-fe74-4445-8f6c-4a031f5b436b@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_200703_968346_DAF9413F 
X-CRM114-Status: GOOD (  12.46  )
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

>>>> +MODULE_ALIAS("platform:raspberrypi-rtc");
>>> Is this really necessary for module autoloading?
>> I'm not sure, it was used in the previous versions when using the 
>> platform device register on the register_clk driver before it had a 
>> custom dt node.
> You can test by removing the line and compile it as a module. In case 
> the RTC driver is still automatically loaded, we can drop it.
There is no DT node for the RTC. The firmware driver registers us as a 
platform device at runtime (we deliberately avoid a child node per DT 
maintainer guidance). Therefore the platform alias is still needed for 
module auto-loading.

