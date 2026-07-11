Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EDAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=; b=RARa72VrcytZHP5xvFjlYRgA2h
	IHt/6tlw/6ZvyYZ1a2jMnSWTpUlg/ELcLcR9PlP/IxuGxU7zPNfA04pb8cDx7ABOz230SoZyjTcqU
	pnHfWrDU9DJwN9bhq2ab4+saXhrW6PEbGQGNTK1CkZbdUBxXHKtaA5Dp0aFngK9r5BP5iOGlH8rFR
	qSj3eFay1vwKpTnGa21m8HpUmY296oklMsBMhnz1kiHs9OGqRTKaEre/D7v8HhMUCVX+ZxVpHdUux
	zzqpHeeMFGNgPQdTpRzxgPcnqwZDN4YKx4/OSav+W+i76EQlUi0V+Xi19B0gElnxG5zHbsTcg/zbl
	bwvsEwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSEH-00000006JpL-3eZM;
	Sat, 11 Jul 2026 07:34:29 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSEF-00000006JoN-3BwI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 07:34:28 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-39c9452243cso15134551fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755265; x=1784360065; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=AKV2hVNJx40YInVxrPSOjsFiZJ60kAq4HIjdmsqBjnaTuHCeSSmLQskhqBH8aIJKvj
         57E1OTI5ofmylhm+P3MnNQB10+ZS16wIu0392S3xn6iPJT6z+kHLAFk67S1lctpJTt5W
         QQNAlCxyI25efJPFPOIBmNxySGXvI4u+dI5b3+zgUMZ5Di6yojc6HwP+5Z/Txi/7ncGX
         G1qzJ8JCS5Vi3E2t/bT8xuJuUxXKWIF7489zIXw5EIUtQmMbSbpqLVvdcCv+SYV1tOdc
         6WIi7Iicvf4NJ7yswUKdScZBt6MYoBM6Wngm9rO4cGwVciwaRIFxGE8lERHvIt5vtTy1
         53Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755265; x=1784360065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=lmSlSmT9Lpmn7gi3IRmxz0IBr2O9zuZ9wDp8zGPjYtbrbadO3lHPkZUH9w3578jHfC
         wSorqXIYCau9JP8RdLdJ9cpqsHi4DSVsTUsHVh293sJcbLYLHfCPvuimGC5phcVjV1fN
         4wYnhuijtycoU3CCP0hAPQ9F1yTMGbyhzhyxqKlWTWvIDb3bSrZXMLyr5FoqMx1E8Twk
         T0YJujJN/2Qj8jY5wYaBL4JRL+p3VGZ8HBYQa+4lOLnK7j9eDF+msUv8nRMRuIpkMdhN
         4xJQmhEWaYzJ1Si7/noJ+gyO0a7dIsaF9YAVr1mzzmZbRhTx2zoN5o3Zxwx1tc+VRU46
         FCXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgQHwulNjYnGBmHuSgGQXQ48POJkkjWAkfivmt969iPEWMI+nMY+T8YUwRsAWSU6tKIQnOh7qDRqhuGetT/yUD@lists.infradead.org
X-Gm-Message-State: AOJu0YwdhKOLIi8PBGrFZbASJYZ5psdk53q5esgE9ihXidQS8nl1lRro
	d4vk1eYr/w3/vDeLbphclz2WWzmsgIi9DWQdLMXA4FSi3Mr1QWp8DSqP
X-Gm-Gg: AfdE7cnItgjA8pAPk1NXzZNYDg1VnlSgZhZZycuPQdO+tuSap6iAEPwLJBsDNUFefBf
	oN3w5xgfYHOzpdmVt86+zsK7LIavIjTXJvjvdqAvZkgRFGqw8RqSXjuPbIdo45m6/kF4UomqPQ6
	teyG5jNElcyolv7DacggQy8YoQhe5YJeWlRm+ZGZrC6EYocXOdYSy8MToFOtpTA8Dhq3dxq57f5
	XCFcfp9Zc9P6WzXE5Ow0xBnFnpvGX/Bw5njUbQkT/DzWTsYeR4Vyi1Svl7PTUgK/5zrqKEGI41J
	4wcpB/awcsl9fhmA8/vasswRpidN1vSnfPBa1pkdEg1s++0Fqbo6C+/dXIZq6UN6DkoDPRoRvS0
	Yobwc+O4RBlX5GvbnR8jZvxku+E/sPHI2lUpmdrzkTLzzaV/A8GUUcOPyJ3NK4Io7riJVop2GJQ
	Z4YTwsS1E3gg1saBCYvkvgRqhPJsb/G+ebWDu3xLCJgiMcvZhxot8H/a2DESo1TVj0WZZDIw==
X-Received: by 2002:a05:6512:3f8:b0:5ae:bf45:e3be with SMTP id 2adb3069b0e04-5b0236689cdmr321070e87.21.1783755264967;
        Sat, 11 Jul 2026 00:34:24 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb? ([2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd41sm1117527e87.48.2026.07.11.00.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:34:23 -0700 (PDT)
Message-ID: <de1d491e-159e-41c2-b145-4d09db091031@gmail.com>
Date: Sat, 11 Jul 2026 10:34:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] ASoC: replace linux/gpio.h inclusions
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-7-arnd@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260710211954.1373336-7-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_003427_820923_1D2656D4 
X-CRM114-Status: UNSURE (   7.61  )
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

On 7/11/26 12:19 AM, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.

   s/s o/ so/?

> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>[...]

MBR, Sergey


