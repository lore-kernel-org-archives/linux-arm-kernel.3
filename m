Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105DAC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0tC7vV+OGBtLj6C1dSzqQ74owp2ZWgS4CBF+5vZQqs=; b=esLPQIgTuOMbbB65JwaPbhQfhc
	1yZapDwkIWqNhnFU7FVgHC4aoqX/mnaic4MNDRybcOY+MOfhOgPi7falZZM4qbWc297e8AVCwF2p/
	kcWp/VcU9oSsXFZ/kuB8TYZGIFCSX+3ZWWNO3zrbqRxr1/MzkesmP2P16+g3G/+YQJF2Y5PyQaR+2
	aivV5SxJFHZ7AdRz2co/cEeunGi7SE2b5O54T03jegDR3/6c9Yk6zuKE2Osdjdg76tF/jT+lBYdZU
	WEZ/JNJLDy4t3vUdq8B8t94YJlE/braJuNeToWJiH/RUP0ac8aLFV5yyHYmVXC8a8+NR2B2Tj2sfG
	pqEpQWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLWr-0000000H9rC-0G8L;
	Fri, 24 Jul 2026 19:25:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLWo-0000000H9qh-05oy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:25:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ccf2360620so8575775ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921149; x=1785525949; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0tC7vV+OGBtLj6C1dSzqQ74owp2ZWgS4CBF+5vZQqs=;
        b=n2yvXn5IwznaFfNj8ZV/7nZ5nvQBtSL7XbOwVo8pwGU8XyNCrHkGMdZL6A0tqnE/nV
         GYuwcx58PbN5zyMEmJUdRO++Cs/LGo7s1+bN8VQWINeOgpv9spo/QdIvSjNJcBOR0aX0
         oKHYkHqdpT78DLDi8lRyteISqTNog7fdTfpKzuIDKN4SGezyAVOvpp2P8ZSLIFBYEckv
         oG3J3HE34IXHtanijyq6Z0hqV06j71Z40zEJEHeXggZk9oM/oqz+NiwsWg3LPoFSlXwy
         b3K/S3D7Cc1rzm7AqghdBCrBfNIDWraR/Lxc2yxcqFyHKHYT9awal/RqmhLOI1poIxJO
         5w3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921149; x=1785525949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0tC7vV+OGBtLj6C1dSzqQ74owp2ZWgS4CBF+5vZQqs=;
        b=RO5K7/LczbvXj9sDx3pt1HLPrPsX/YRsvVPwBAOcXmVeZ6e3eJHeAPZ8JPEEsUr58x
         odyGrAIrRe6BGvuZTsZQ8SUj24CrXXjGVn+Xuj3js85HhaSk22gNMIDPXZqDXS/E8qNU
         8Ojk4kEO9EeS2hc7t8M4W3uDyXEQuwuxn8KaTC6TnMl38gAI1lY4jrV57eugQxTo1ZfT
         83wfjCwePaMMDIwJsOdQEYfhLQmWFXWAH+o/CSIC1zKsfVQrw46Wa+W2+tOdHplWiBuF
         ZedsBgVsmIIC4OSLd6HlWBj7s4OHKIfriUuNWXgHCc+Awh9NynhUTMpfRtWnIFV7J8k6
         3HXg==
X-Forwarded-Encrypted: i=1; AHgh+RpqBHaIet+CG3bNkg+2y/7XBMKOWZgpF7h0grkW5P6y3FpUueuLBmeeMYBBSM69OY7wjOOqqqxVoXZAslqSaNcw@lists.infradead.org
X-Gm-Message-State: AOJu0YzuvxHVkIpvBoqBU2OFXC6ODLJO9XA4h8y+Ea9LatA1KTnKD75w
	dw5iwTnDipRRvZNzzKIKN1rMr6l9KxVN/lfGOwY1nK2xRUYMQe4i4MKUH4CbhA==
X-Gm-Gg: AR+sD12jD0q4/x5sv9tzCsY/AWaf9XxEg6wf478c4QwFxdvoWBiZdWIGcaGvGqPkAcl
	PaExiAIUAqwlV2nvbQrxAEV/B1Zwk4zujnL6FRYt3a5C96tX/avV1EG+JGRWKde70RUsD7S1orQ
	8ZXKSFzTwMhOrEFALIcQrUBtrsoX1ZWvrMIVrMY8D92hE9z8uICVSOVgSeTbRoB7dbSNJeMPud/
	A+7e/v9JaBzmUI4WobPcgF643q61D00AaAv3yG7tYYzS8TcoFFYwTJ04+fEyZOzLmdbj/sy82RH
	JnVRtMwVEkxJYuEEJuQ96g3oEucp041PHnKM5pT9GuMoox3cJi5SF0lMSSMNfVwLiFEPFYxORYg
	tlvIuIgmmn+sMEhHwMUC/VuQNU6MOjwhe+Jbcf8056qybcZKvdaOkylFUJCOrs6N4tHUjgDG/oS
	Lt8NLbUq93Q6Dap87FXW1mWtaVkTpQSprrD3v7mTQZ1rs=
X-Received: by 2002:a17:902:d491:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cfa6b77547mr101121265ad.14.1784921148827;
        Fri, 24 Jul 2026 12:25:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:40e1:40e4:dabe:543e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc579127sm1679206eec.21.2026.07.24.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:25:48 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:25:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Linus Walleij <linusw@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] Input: zinitix - add support for modes 0 and 1
Message-ID: <amO7_sEL0hknUGO5@google.com>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-3-f6df7d86a878@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-zinitix-modes-v1-3-f6df7d86a878@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_122550_084576_3A5745F3 
X-CRM114-Status: GOOD (  15.88  )
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

Hi Kaustabh,

On Fri, Jul 24, 2026 at 12:54:05AM +0530, Kaustabh Chakraborty wrote:
> Zinitix touchscreens have three modes, numbered 0 to 2. The driver
> implements mode 2, and leaves out modes 0 and 1. The difference in the
> touchscreen modes is the schema of the event data.
> 
> Implement modes 0 and 1 in the driver, along with their event structs.
> Maintain a common, canonical event struct which is to be the superset of
> the mode-specific structs. With that, introduce functions to convert the
> mode event info to the canonical format.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
...

> +static int zinitix_read_point_status(struct bt541_ts_data *bt541,
> +				     struct touch_event *event)
> +{
> +	switch (bt541->zinitix_mode) {
> +	case 0:
> +		return zinitix_read_point_status_mode0(bt541, event);
> +	case 1:
> +		return zinitix_read_point_status_mode1(bt541, event);
> +	case 2:
> +		return zinitix_read_point_status_mode2(bt541, event);
> +	default:
> +		dev_err(&bt541->client->dev, "Mode %d is unsupported\n",
> +			bt541->zinitix_mode);
> +		return -EINVAL;

Instead of a switch this can be a pointer to "read status" function.


Thanks.

-- 
Dmitry

