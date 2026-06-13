Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938DCCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmpCRbwKcDT9ljmI6gDYWNgoa8Oz6gngcqL23DluDRY=; b=aEnmRje4F7pN0WGZyoX5DjS78U
	rOxIA1LroyM5EL1SnlgFdGTDIoYL/b66JqLDZl9ufZS+nqsZ5ZmoRioY57uU6gIJkMyT1WTvxOlBh
	iGrmactCoP0+Kk/bL3zBshkPhoY8f0/iErkq3B4LPTxkKzIlPyBMLrO6wpK4bM921a74y8XZxirXe
	sbbl4M4Ic0XVXnWUI5+ykXBIf7wLiHPffjFYCHXs70QLgQwKcHpWLoLPY0vKzNjdq1M/d4wC54/jb
	fIG8mdGcPaoLLevkraZmx1Lg+WNH7cMbDT4jZp6sNCIVPEwMWUjegl0ApHTYLYcf8WvHhgBwAH8Kj
	rG6ZYI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNSw-0000000CH11-2L98;
	Sat, 13 Jun 2026 12:27:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNSs-0000000CH02-3tNa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 12:27:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so11514565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781353672; x=1781958472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wmpCRbwKcDT9ljmI6gDYWNgoa8Oz6gngcqL23DluDRY=;
        b=gXwN/lO7GwM+yApgzErwCZDzB6JmKnRVxAlKevnCxOIlsCeUzL2USj2wOjNtdKrNaa
         Cd2WNzaro3Dq/rI+w5Y/5W5fJU1jRlcl6g0lLjnVB7PuJ11I9GbPpnXLdEyovfE22Lyy
         LTQrXS38Zj2iWSo7cmYOQ13u8AWAcG8MlasA+SHYbKcINescojQEHbH/OggUegy9shEo
         w7KaLVAFOL1td4AmjVn3q+Fjv5aTi+QH7dXl5bn7O6O9YYnL8NrjF1b6tpp4OgX/2+KX
         WzVXzk5ZNt9LpkPb7ihPgsgPMfGm/L4nui9UA3Hr8hcUl5SCy4usS7w9BLnXqfA4hhtx
         BO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781353672; x=1781958472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmpCRbwKcDT9ljmI6gDYWNgoa8Oz6gngcqL23DluDRY=;
        b=qJ41zrXNzpWgZxeuapB0pNY4IkQw35g/huRjlHtkqUIpoGlD66yM7KXYNH1vPRmB8M
         EGxEGttB4hzSf2EvpECKB2xQP9FTdMsdelreJ+NUHH4zWflxVAbdUZcbkGCoAm3h7awB
         8/kICd9mvp/Jh7gXxJ0TvndHEFS4Bp+DHXMn74XEE01v9TtRGk53mFJQJxQBo5rlzoZy
         HBc0MN805/yCikM9oGdc+wF6ITH6tcccQlZcWVwHOe4a2rpjw4yCEqqp3DMR/VdkZhU8
         AOixjMBaleUiHiJRJ6ErEX5tFkX7RSeDwPdGns+Oe235t1W3VX6D4QhHEbii9QQaK2qK
         YmNg==
X-Forwarded-Encrypted: i=1; AFNElJ8GqikmDFzm7TBc3O1n565pkM7q952yNJ4Z+wGc+B12m2Us63fr9ZBBnbq7OtuRa/vFaUwyOSecRqrSlJMlyHHZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkkl6X+YwTreCtFZiU9UrNult4FjtiDO/57YaZ5HQuWSpiUsh7
	LWWKEXhZSjFG66Fnn0hC44LJMX/02XYhSflRygfzHkUJM7K5PaMCX3qF
X-Gm-Gg: Acq92OGBl0oxtCeXUI7b1OJIfWlBc0iievu5bc2NFVCs7hkjkWhYFKL/r/SNp4uXOml
	dQ78TLiCQ7cjPlbBuFcR+jaWDMFX907o1GN8aYprggBBk3Ob94kWia6bSh7VDJX/D5tG8Q0L0s6
	bLq9MpnT+kdSOO57ZRTEW1WIi5Ka0RKBXUa01Lhr06tuLp8kS5piVAC0SpTDx9Wae6cP7Ug/ORn
	69nAsx0DRT/sX/cYzREyu6qN0bRjmFBqp26D+LpdwQGmU8LxxL6SYk7AFTqhcgNBwwFtjTUSSMV
	9Kd6QAuwCps2kf500dqwY0UP8Dkv5LLz4gaifGCdyyIGc8X49GVMhcVFxkKF1Pgd0T6RAK7gO+i
	ErkecS13Vb3DznWd7mxMWacHLZ/gbQKRntedRx0i3paGW++iD2w5g+qVXRkVBpwTeSSl4wIggw9
	Ww/XDWrYk9IcxSlNzmqBkXuuCKFgthPAZB3EbWLspSQwKJkD5MTcV489hO7KdOvwJSUBz3C9tP2
	RFOaS1sA2QQFDwBm6M79qDej2t7nA==
X-Received: by 2002:a05:600c:1d11:b0:492:1e36:552c with SMTP id 5b1f17b1804b1-4921e365572mr47345445e9.37.1781353672276;
        Sat, 13 Jun 2026 05:27:52 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm62586845e9.2.2026.06.13.05.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 05:27:51 -0700 (PDT)
Message-ID: <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com>
Date: Sat, 13 Jun 2026 13:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_052754_975807_0BF3D926 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
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

On 6/12/26 15:01, Andrea della Porta wrote:

> +config PWM_RASPBERRYPI_RP1
> +	tristate "RP1 PWM support"
> +	depends on MISC_RP1 || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select REGMAP_MMIO
> +	select MFD_SYSCON
> +	help
> +	  PWM framework driver for Raspberry Pi RP1 controller.
> +

Hi Andrea,

Selecting REGMAP_MMIO is unnecessary here since you're already selecting
MFD_SYSCON.

- Julian Braha

