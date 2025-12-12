Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED560D4417F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4GMPobD7IxP3ob9nUYxNPU1e+JR9o/OtQgZwmUoU4Q=; b=oYbGy7cEdrOume0mpqPSEGqb/c
	SZ/QlLIMC/nhRa9Vb/4D8LlQGmJHNdJHdXoa/5+GWA6EAOKv845ywbIlBUlH5fT+3QzlOoKzzDMjH
	B+EbuDQtsKRN3fuKkbCq0T162pFBqWBWM590ZZaYm0495bd9U0f1RT2fHMs9uGX7CCMZoOUiSZnrd
	Uwi9DrjFek3hlCGxRxPc1Q5Q9B6PjDY1CjuIfzD94uoj7MhMkE4QNn1Ltz+rUCRtPWjUYT2Hvem6n
	/i2RhBlxl32uAnkLXviiyW6f9qf7pn40T26YLfVSbRxv8XmY9ji5QICIyE4PgNNmeV4Q5mNvhPcxl
	DVHJZamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1bb-00000000U5P-0czU;
	Fri, 12 Dec 2025 11:46:39 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU1bZ-00000000U52-1mat
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 11:46:38 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso486648a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 03:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765539996; x=1766144796; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z4GMPobD7IxP3ob9nUYxNPU1e+JR9o/OtQgZwmUoU4Q=;
        b=Cz9Ou4N8q6PEyzog7iPUFP0MVHWIorlhpuy9/qMbYpsLGWZoNvVK/Zukok0YqoZJIp
         pU3FJdEaNzQc9/B/PJraCPG/YdcQw7LBVZqS+0PHTFSJ1YgTqYEYnKlj/O/auCz+8gTD
         cqctMnY5NbWkCvGlbL9APGoofQhmXuHcQYxp4+KaH98CD/RkQQRQqiyu3hIhi4vmqFR3
         gbA4q5ovs1zP1WSw2y4nDmiSohBNCJ+mZSNGAcjZo/5tYBlAmX279a6fZD7vCdfczjlb
         hU7sx17MFQd8J0Ch4cPYVtDv84yPVsRiekJsf33bv8t8uTcoftXnZl9juwWaaaST3Ddn
         kciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765539996; x=1766144796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4GMPobD7IxP3ob9nUYxNPU1e+JR9o/OtQgZwmUoU4Q=;
        b=ln7wC9OvcVGqYp+Js0mizfWtyXikW2ioC66lup5fh1Dh55eUfioedM0U6G7ylLkERb
         +lqNtYomU1TdBLounc3fQGCBOqT2a3Wlp//Nzfqt8cz2FKuUAbOPhIuEQXBF2/oGUAn5
         lwF1QDgQLvq5NuaVGZ4dZXyHLn4W34MXEC8Z5bLNfraeSH81ULinGpG1CMtKhj5StpJr
         Jd1NK+DU4ROeEF61TdVFKa6tSqck/5HOViDQpsFzon1lZI4cNkL3YXxnzLZzuxQbgbFP
         KrQThc1+jaG/MwfODhGjsMYTqQtnUwq5wGNr9jakHY7I7YDUVh4sCgCwYcJXXTWVTHW2
         WQIA==
X-Forwarded-Encrypted: i=1; AJvYcCWWgRdywaIB2yZ8enU964DKHcY94isaRwMkLNj9TV6Fq0+yH96kHfgDf42yDvUf9CR8xQmgbYt++y+cKpyi0JSA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo1may/6KDPLojlYM6ONk1TqA+BSvfOVv3htcHoTmdS+Yhpkxw
	+5IIqklsLZDDtXEi38ZEt7NlsATR9NDe1o5YSAZY3e09bK6fGNQzhC8M
X-Gm-Gg: AY/fxX6mPoHa2CArXr8FdGsFa2sLTmgSiUeI0f1qfjgC0EAhnjnyQa3qrBwFD9ZNRsl
	jD32LJLGAfskHlvmuTzhktCsvQneZ6ljqmOEmEq94ZNjYJoZx0g+FYgfzatl/8md81hWp/2zk/S
	QhFJQbVtt8ZRUomGUdQe9eOoaCZb2XEYV/jcEVJn2j0NsX2MVR5y+l4k5Hc25NKuIOtC10nKR3Y
	owfhgQ6NGlC4MxtYNRE99ldv52JOWzedicC/WnrwPyMnaLbObMO9oWHsT92u5tnLRje9KY1Qa3q
	H5EYNq155wWJt4HH6ySN6jrHIbygFbRFNk80vr+HqtpsRHAq1GdmLlI285tKrcP7SrUM8HEBHA6
	bfkhsIlcBeSOaT/GyiTVSl2jqFxVHvkRhl9AGgob7G+E5HwJyoJmnW9SZ7cjTvQbA79r46ZoTRT
	lo9sACw2MW3m7S0w0Ev61JXul9Q2NHxK1LB/TGEOGZ5+5nuD+yf28e5C2tvDE=
X-Google-Smtp-Source: AGHT+IHR46BSZtOI324yzAFj0w4+1e4VNfwgJW+ezGfESsq+Vo0qiOYkxIP4b/0EpEPMS2QFY6BySg==
X-Received: by 2002:a05:7300:7b16:b0:2a4:3592:c60e with SMTP id 5a478bee46e88-2ac303c944bmr1236445eec.31.1765539996404;
        Fri, 12 Dec 2025 03:46:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac190acd01sm14309187eec.1.2025.12.12.03.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 03:46:35 -0800 (PST)
Message-ID: <cb8031bb-9213-49b7-a85a-5ca9091aee5c@roeck-us.net>
Date: Fri, 12 Dec 2025 03:46:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] dt-bindings: watchdog: Add AAEON embedded controller
 watchdog binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-3-6bd65bc8ef12@bootlin.com>
 <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <019aa49f-fe59-488d-aff8-f07cf07ee68d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_034637_473279_D1A8E8B3 
X-CRM114-Status: GOOD (  10.80  )
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

On 12/12/25 00:20, Krzysztof Kozlowski wrote:
> On 12/12/2025 08:41, Thomas Perrot (Schneider Electric) wrote:
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    watchdog {
>> +      compatible = "aaeon,srg-imx8pl-wdt";
> 
> No, that was discussed many times on the mailing list already. Fold the
> child into the parent. Your driver model really do not matter for DT.
> 

Theoretically there could be a 'timeout' property since this is
a watchdog driver, but that isn't supported by the driver, so
I agree.

Guenter


