Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2174CCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htAap5fw/dg8+xLfXOlfECPNRc9i+jW0+owdWC0r+RQ=; b=dJNkfwplhB/F3GzFBJJtDmRWLe
	X5AHpRBp+mPc2EvUkclZ28w5ToeJQdRzoOOTQ/g2LkidPxdIOKuRJZIUkeGAcLsNZmFAdDTiG71x2
	GLrY4eGkNYQLeVZVV7anLKiTZwPF1xx62tueygw6boF6EjAhIHUX0q43qTF1dDPlhDQwQ1fuhiVpA
	roVXFKJmGM7tY/ML67jLa+69LtxweQ8MJopbTHDjGtkflFWqgij+KQVREnHTV2oWsjxPIv/Is+8jp
	oJwwll0LQ9IhHAsj/z0hn9L1pU41wPMdmuOdlKvsKbBRu2O4EVOTAA1CrxCVFFqitrcE5fcLhCUYP
	3PFTgwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDvr-0000000EIe0-2JwP;
	Wed, 13 Aug 2025 16:02:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDG7-0000000EA7w-1Ut1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:19:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so61193195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755098362; x=1755703162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htAap5fw/dg8+xLfXOlfECPNRc9i+jW0+owdWC0r+RQ=;
        b=j6ipJs0FGooYZL72dgU9dEZoNFuTcjNLTgjJJlWWyuRAa/6mqMVWjvzKTcQqL4+VN/
         BWrZ11+N1OoTUPTBuWe421QdUQ+JO1E9MUfs1yk3IKHaPoJZTxGqtsKXDuc8oPgCrzM1
         rv9geBADK+yLuV0cOkyQbOBLEfCwwhqXRoZgFbFTgiGbqw8H0s753cryXkR5qgXEyoG+
         I2UXYd9TPxrJxttrtoiYSH2C6+6yA6zdBK4wupXPavvK5nks9cWUcdYm4qxPoppgkyV/
         gxuzMLtKqw2FS14LySac+25FexUC16lyqwimxUa4idsh0RglllJJ48XPxgx4bvO9ebYh
         tTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755098362; x=1755703162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htAap5fw/dg8+xLfXOlfECPNRc9i+jW0+owdWC0r+RQ=;
        b=VtA3JNnFn6dE7WfNmjDRLu3CL/mqk4+75/kJurOWgk0wPq8S5swJgpOW2E0Z8dnEad
         Nr7fMz/qSqIdo1tGBfw8vr9S2MGU7AJnQ4v55PwifgXykICNGMeCdSrt+pZ0IfgGMdkL
         75dLFzUQunKLXNkd2/b+6a4y5KaIQErzXUvPcz4py1Os23H8NCjidLfu7oKQABFYm2KP
         Ay/DP/LM4CuDnftkb9lT6s1iCZ6eRW54NQUG8OTwNYKpSpM/Z5jvbMESzN4Wd2PPJIqY
         PuMFhAuSBirLHEevihBtxdfVWWxR5/ad7AavKSEBenoPGFbdy9xCd6Ipq25RnFG8Al8i
         /DRw==
X-Forwarded-Encrypted: i=1; AJvYcCV0o6oHOiyWTf6MVG9qr7Jbxjn8QxSNp8cwWvQjlh1NZlb1FeZfUlH8ROsWL14Kx7zK91i+8abqwvwLu6n8NPwU@lists.infradead.org
X-Gm-Message-State: AOJu0YyNUidj61fg/apMHvG2u2T4RC8REf7MgnvNoGTz1x7SfhiQP392
	bDbCRpeI8t1HlN9tmzqOVbnGbZyVZxBNLX//boLBDMle2ZugJVmHjDsB
X-Gm-Gg: ASbGncukjEHLrej0Zk1DJhJG4v1gBvcLmGBrJ9+/4gHKvE+65sZz50MvHd7XTAQ7VNW
	/lvtYz9MVsmlczOt4yWkv9azX3SkheSNNJnxfG7E94aAkxLhuPZxrXtq5txBpkQ4YXCNY5RWfUt
	ypV5sc9cE3XouJHzUYS8Ww3OLVdaaTwYd/KGod2mXq61wxLg+EbV8IylPruc2T9cSdzj8rPycTs
	1BiULN44QBmKmFcDu90tMhImhLiU78jY6t+aZCbLUUYVgxKiz5Iq7VcPOJm3Xj/yp3WvUunIg+c
	gy9nH4zbvJbfPKZZRTBZxiBoStoZSeXU94yvest6FjV46R2Q3oHlic+UAaj/M9eu31DYBdxA7rL
	WIaplSHCY6rNq7z1S2xQK2jW+DUIGor2P93pc+IVpZy2MoH5rgUyKVZ92d/u5W9dKOCqF1fX0xw
	==
X-Google-Smtp-Source: AGHT+IGfIPb5dRAaA2WhedQJ3CbdENNLW9wcz91G+NNxprPgCPyCfh5MRUpcNjjB57ZCH9jlboc6ZQ==
X-Received: by 2002:a05:600c:4750:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-45a165b7b22mr36901465e9.4.1755098361733;
        Wed, 13 Aug 2025 08:19:21 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a50b99bsm6409455e9.5.2025.08.13.08.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 08:19:21 -0700 (PDT)
Message-ID: <0cddf626-5215-42d6-bd31-672e32ae293e@gmail.com>
Date: Wed, 13 Aug 2025 17:19:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
Content-Language: hu
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
 <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
 <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
 <aJyO-5k29AAAnHdz@smile.fi.intel.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <aJyO-5k29AAAnHdz@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_081923_394031_63AE3A05 
X-CRM114-Status: GOOD (  11.23  )
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

2025. 08. 13. 15:11 keltezéssel, Andy Shevchenko írta:
> On Wed, Aug 13, 2025 at 12:50:35PM +0200, Gabor Juhos wrote:
>> 2025. 08. 11. 22:31 keltezéssel, Andy Shevchenko írta:
>>> On Mon, Aug 11, 2025 at 09:49:57PM +0200, Gabor Juhos wrote:
> 

...

>>>
>>> Sounds to me like this one should be applied first independently on the
>>> discussion / conclusion on the patch 1.
>>
>> Yes. At least the users would have a working although not optimal solution in
>> the meantime.
> 
> Then please reorder in the next version.

Ok.

Regards,
Gabor

