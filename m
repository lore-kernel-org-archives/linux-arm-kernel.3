Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590D6FEE4EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE4wHOtl4QFDYLaI8Z+N6cuSjBv02ee9bfXFs7o+Rlg=; b=G5XbseWoynwfXy6jyNv1nlo5Tt
	TitBavZArgBZY2L3/mHc8lexW7dpW8zL1viQPX9C6bjmZXS4xlwLJkYqODt08zNb7N4BbhU98wwvN
	3USJfpkQLbC29CF60S9Mnq/OvUZhgw4aAPOLtJ+4y51WgahzQC41YPXEgljn153alhI6qOrbWb3qB
	yc4WTG3PrN80j6s1dxcacSA+QI2rVAbI5RmIEvXM3st7d8ukUJdr9yv/ZVJW8GlHdVcbshl5eaD2b
	uC/4bonpR4ok+7XR91p2zoiceL6XtA6NlfmOMywxlEsFI7qp04flAPzx3ehAvmKkFe6aJ7DqTqDdB
	XksA2fQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKtp-00000009tsV-1C1l;
	Sat, 28 Feb 2026 14:02:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKtn-00000009trR-0Jc7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:02:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48374014a77so34853985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772287345; x=1772892145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sE4wHOtl4QFDYLaI8Z+N6cuSjBv02ee9bfXFs7o+Rlg=;
        b=H1fHTd/39O+XcnZJyw6nlcsJjp4qsp7t7OsPGNwrag9AYM/qzXQx/IlQHF5LR+6iZn
         IhhjQpqMI8u/pvoqvs3z6MAd3tml5T0xWb7O4ko/IuOclGnaS2rfX2CErBct8T1VhFx1
         +TvwuYSAq7J3ylHaKaEQFa80mqG+JDpiqqqfF4/f+W9rb990mCLtBYPZ+vuBhQ6/sTWd
         L7zG4gedqQ4liRMje+5pJsJ7eQ27G4LsgiAMzAx9kSo8iOBU6ACavQMHXTN3RCc4zANy
         6q7APQZ9Kjq58KOiWj4p6Z5UmTvXQo8wh50Xrg7AcfnraxlOJ1+PoE5xb5wTq3An0gOI
         zNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287345; x=1772892145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sE4wHOtl4QFDYLaI8Z+N6cuSjBv02ee9bfXFs7o+Rlg=;
        b=U10qimUAzCwO0xZpegJdkFFUOq8+WuzNu84CIo9ALXTgIasygbtXJGoOdCF7UIwZ2c
         an+pObTNBqODJX5Vnx9npg7W0ludvsDY0Mrr1U+7/hQUqE8elg+lXOs/Qecc9NdgfNEt
         IVdUlIievtWBiMu1R9d1CL7Y7KZR7ffoKzVRzuPzLF8W3InTrHpQ3H8wiEgdKJMIlM4s
         wObhu5NiYaoEKsfKS4laatfPBxgiNdwpl0thgiRPg2fWQHgBA7HMV7LVa2KR0bcVLJ0u
         XUlLmCfkJ/B/HTv+NrjtUcIQGaqw9myZODupM73DnLWTLame3ihz8IohmF9Q0ghSt5RR
         +TqA==
X-Forwarded-Encrypted: i=1; AJvYcCULJn4JmD6kCixZ4TYulKfMYILiQJsUI/pyu0tPK/4Sk488fhb2zwn47VaoZVGUtoZjTYmUvhBTbuUKBjsVL808@lists.infradead.org
X-Gm-Message-State: AOJu0YyhmAyurGio7Lv+419++79etGXstIbAmKgNuDNCDOQTwjsuYgqu
	c1IQTeqeTVT+MAK5PijkhU+mQKQ8XQSn9tHJ4EdIEYLOpdbFt6V36gxLK8ufGvRhlH4=
X-Gm-Gg: ATEYQzx0cRK5/CzMM+FO42E/ZUlF1J5+fgz3U80hTZJWpnTRr6MwRRz+tu/j5C+Jaao
	P+wab3U8gL8qv9+/ko5IMMBkwpVOs88oXiWTtvoIf05Q8Y2PuNVZzQfvEqUVN/gdCwt6gnJ0PPD
	wtC4g2+0NLk6YTs2GN7v8aCQ9hyKKXoBaY133YH/1+XFWGacCUKmMl/uEw/gCXdyuhJJYVp+SAx
	Fh22WV8ExDgvQL2cu9I7m7HhCl3PNnPaJDANYwt3+FMgMk3NUlI/lFL8pOAUoc4DKHRL19qIgCX
	XaOq0424ifGkkQ5pMNUVXnODb1VOEvuCYzYoDlef5gzxm2SDfVqaauku7/4Janzk1nsKWeu32tx
	yhjedv086uGQbnqyrR0vU7OJYlwuOUT/x2ixlIzBD/sgjc6jrM+oWTSaQqGwUhmeduGDHZ74hLq
	XZUL7j02+3x6Vrfw1EGkQftX/TGRJ9oA==
X-Received: by 2002:a05:600c:4e94:b0:483:6fc6:1e20 with SMTP id 5b1f17b1804b1-483c9bc0291mr95806085e9.9.1772287345117;
        Sat, 28 Feb 2026 06:02:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm144734705e9.2.2026.02.28.06.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:02:24 -0800 (PST)
Message-ID: <9b88e1e8-bb9e-4b79-b722-72eb66a9309c@tuxon.dev>
Date: Sat, 28 Feb 2026 16:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ARM: configs: at91: sama7: enable LVDS serializer
 support
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Aubin Constans <aubin.constans@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-7-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-7-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_060227_127852_8CFA94CA 
X-CRM114-Status: UNSURE (   5.81  )
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



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Aubin Constans <aubin.constans@microchip.com>
> 
> Add config support to enable LVDS serializer
> 
> Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


