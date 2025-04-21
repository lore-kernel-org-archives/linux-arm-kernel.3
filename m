Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1161C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKfezAbyINz439QFK7u4LKc0xE0oolzizXsIr73Ko5k=; b=qw8s1j7xeAqgl8JzAluAlyDrIy
	zkOOSeOorDbXZggydKtjCoK7FLql43MJPtFhAQfXwcnVingOj1WRI9i5zMnwT9DMLNfU4O1bhOdvo
	VPENmKatk+V7grYhwGw1QoVhGOx2HWndvHQj9wYAnpVhYf0DSZI615GHy49rSEarWaZ+95tsT1Aof
	rq7+suhTjg3N2aamQdbTUvQ9IhVmsJ4nSJw6SZrsFvsAg4VYzmX3/27kD+MRkIQReD+zXKzPL0BnG
	+bH/5hmWX5GKpVugb0yeUs8W3+X2CD/xBIqikgB8AXjPhwDbg4rEOMJq2sGrkXgMQS8dVJzXo/2Ca
	rUcg2lmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vwS-00000004vBp-0LsJ;
	Mon, 21 Apr 2025 18:32:28 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vsl-00000004uhh-20qh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:28:40 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af52a624283so3600132a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745260118; x=1745864918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FKfezAbyINz439QFK7u4LKc0xE0oolzizXsIr73Ko5k=;
        b=k9gnLTJ8XFAFPnEJZFe7Z8kIykfbg8vAnKzyS2AysrhV8bDTSlvS1A3X4+PH99/WXs
         v+BiB+bTy6VFEv+TBooJggbl4b2r6HIg8LxXwUbkAOR/6g9kIbhsx3N/rXpq9j4XEM1k
         BfMkin2DWNruDHXEd7CNRMMddBdBoKtev+yvdlm9MNozsuVLpwKxNEHLB1RiNpgt3rm3
         zXH4V++daEx00sIBsrF8UBSQDq8BuN7tqzFJo7BLmVqXSZ+1PaopVwAI9/4ytxS06bJH
         pHb95V5s7wLmKX1ek0LKz7D7nc2N0uoqwsZvUZU2H8re67ozJcP/l9EAkzhiwyWF2hlY
         ceAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745260118; x=1745864918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKfezAbyINz439QFK7u4LKc0xE0oolzizXsIr73Ko5k=;
        b=SX9g6inZmtm1mziY+uH0LcadCqVNNhBVd2sG4ZtC+FQfI5xd4wgTKEnKRgLmJ5VVn3
         KaIbn9E4WFO5JCg8jGW9G9cGC6tuq5hxqfdVDjX2IK72725Sg+uqK9ASfY8cvh8Gu8PM
         0/ny7YzxZRiWBavCkWx9Kek6HM7svwsEuQ6rg5p1dgAvYmgflnRg7azXe9EXuZa9RLMx
         BLd2e4BfhiGIwexAJ6TyLE1Cf+pXxq847VrL/bAlTBAkc1bYh5OdY41Tmcr9aKAm9eLh
         htWwIZ7Op49XP4T2DsiG7UtT0D53a0anN4BDVAnMXPIq3BFdpT54l+sFeH/pV53yOImK
         SY4w==
X-Forwarded-Encrypted: i=1; AJvYcCVyGrwDj6kGU2u9rzv97H4IXyyNQmZvOKdMrt7Y6eTDvnpZjy/JzmRPgQlJllIvN6plIHfe8hLAPnzt0Z3Gho0S@lists.infradead.org
X-Gm-Message-State: AOJu0YxR0aN7qy1//4iRXYxDueg3pcaCLO936zfder7jpzb6OjGz6pjr
	uq7QAr/3r9rQoxRI2dHERm1MbLANp8mFUZR6EvRrTdC9PppT7jFV
X-Gm-Gg: ASbGnctFK/zNVWynu2OPFGdGcf09J/gwWcXw+Y9dn9GRXy9kttDYgLJusYNSFVxbRho
	ae1Y33I4Ow+8FDnsbxYmA7Z7dhVUg7JTG8TVp3Ob7ns8Xuu5qlnnohtBvMCiylGBkFIVk0BB7fJ
	eqPpyY3TxAKNDwbT3kXqUMnBIUOT6jas3f25L/x/TaB/N89DQmySy84TMhSRzKVwp216yyzu2rm
	Gm4b/76Oms5ALF4nfJoQV4hZ/0C9j9fEmCPYyZLg7E0AXg93PXcCrWfrad7Nuv4rFPF6KtvfPLc
	tFD/gK36DH5UZw7xGPwcOH5n0zXW5CA9Ff/pXhAEwtlTzIUyq/zqPjwm/I42ClFUn8AF7HauUa9
	2OsBsj8/uZs7r/XLrR6WqfQ9t
X-Google-Smtp-Source: AGHT+IH6BxuaRCy94Tqcr62CL4dRSN2/IdSa5qdhKN6CxeugqX6Z08+pZeNfnhrpl8lHjVMGtoOlfg==
X-Received: by 2002:a05:6a21:6b0b:b0:1ee:b5f4:b1d7 with SMTP id adf61e73a8af0-203cc5ce546mr17208028637.7.1745260118137;
        Mon, 21 Apr 2025 11:28:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c6355sm6013366a12.41.2025.04.21.11.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 11:28:37 -0700 (PDT)
Message-ID: <d21dba8c-dde9-4071-9b1f-8632b08f011b@roeck-us.net>
Date: Mon, 21 Apr 2025 11:28:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt
 compatible
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
 <20250420-wdt-resends-april-v1-1-f58639673959@mentallysanemainliners.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250420-wdt-resends-april-v1-1-f58639673959@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_112839_522157_AD86FE60 
X-CRM114-Status: UNSURE (   9.29  )
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

On 4/20/25 12:00, Igor Belwon wrote:
> Add a dt-binding compatible for the Exynos990 Watchdog timer.
> This watchdog is compatible with the GS101/Exynos850 design, as
> such it requires the cluster-index and syscon-phandle properties
> to be present. It also contains a cl2 cluster, as such the
> cluster-index property has been expanded.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


