Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54013C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG16IxyNFQzdJ+l8YiIgV31gwxuUGCnbYmlOxmYE8vM=; b=iuXjgAQQHui7/dNpRzpXacyR5Y
	iIExvsgdSThg7QO/mp2OE6NlyEF1xPlJwdi0LO7SBPKdXej98sWwc4ama1p5JA6qmmxc45RxJP4hF
	xrH+keiLIJHxZHn/7immAoVbHJetypv545busP7J9IpGqJnyq70SkFlHcOwJJubSzuWMCYoTytx6u
	n6yqg63/1T3p1rOajNlM0eePLipR7ODGSFxsMzvQpVUGOKEuoRO5PerY4J/tMogIGAXHYu/VKR87o
	W7x9n5aZvTUXQzZSrCPSJFCiUP9c8MHwe07Fs7Szh+rPiRmHqJr/zl8bR0osuzhqN7tqGrcmgU+d2
	cfm4wyaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VOY-00000007VNZ-2VYk;
	Mon, 28 Apr 2025 20:48:06 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VEB-00000007UOa-02ie
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:37:24 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so62610036d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745872642; x=1746477442; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RG16IxyNFQzdJ+l8YiIgV31gwxuUGCnbYmlOxmYE8vM=;
        b=TzeGk5GjHXS3s071IdEB6cpcu5H8XZ2lPbB3xgw/pXmIf0dWW1hhStfnQnzHICdRw7
         gam0enejw0wH+igJ0XptKQ5SiPQoFR/3WIm5mCNCSwLAjpe+132rnTQOXtht3InFou6z
         Lt3xmu48SC/+IkYZxLcvikLm22l8ZgV6j/a0cT92icKy0O/eT7XvussOaOe/xV5PbIzU
         Vsim+cs3C33Z6tBFmZX8gxewr73giI6EUzCIDkdOC6mbznBkSzahLXq8kIFaYVFjqqoF
         DkX0d2oev9xG1YYhjhM5flswXpi21/JcOYCRvvgGOiDf9AqkTFHoaVfUR29H7sIgcCdu
         fMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872642; x=1746477442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RG16IxyNFQzdJ+l8YiIgV31gwxuUGCnbYmlOxmYE8vM=;
        b=XvPIafr7Vuw+3uYHBMCSkfYQPA0QC2IuLXWQBYFHwNli8n6NnR2rEsLQLsu3N5/VhG
         gY/u0UIIHhr268IsC5erTYwLEuj2RTD7eHZGPgKJsWYuBNFZ0V6HRN3W7srMY+0H6Ya9
         YbX0RS7xn09/lZW1UpKnTAUWY2SKi0wUl450Nxp6egmYEJR0e1WII7QAi5enq0BW1uI7
         2iIGySjD3WTLOCwU/UI6Nfn3RUFm5IKnngpEFQFZ53rTDfGXKqk0tXP9nj8nHBFoJ5WU
         WbxtCF+XdJwT6R2mizSbqpDLl/zR1ATVbq16hF6SVORDaTkLkgsscv6S2qVj7j8VlCfT
         z37Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpsB/uVK+DuhCz0bXotiB2p/Ss7XdQKSbrO48+oPiHGezgMpzrvQM0iqABOjcFmK/jwI3TgD+TS9xvP2TwZWtj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz89yXHrw3EDUB4t1aAtI9NxCTcJdjFdz9GlELmGWf1FOOHuTE
	uEGnmhB68kE2eWlUrIcMCeQ+rkFSLuDf4Kk60RDa9Pn4J/ERLmcmOBIU7+OPyjM=
X-Gm-Gg: ASbGncvAXhmORnbHTBbxK3df3dpV+vWc75oleDWJbv3Z4UObENWy0WADTkDDAW8SNhc
	kSvLwN50M0p0iLsAshkkE5kzajpt4UE+B5gADZ6rYaMJBvYRUaFD+FBdwY7kUPAXeGh/lnVexz9
	gQ0hBKxuFD2wPVCvqcB2fQFDG6lnP9mHKF1c0eAOvY1tu2Emnv7NPf3yqdlp8IxHxjwis7NjA3L
	f2vzvpAbOBWScSKLBPvJVVXclxyHZzLTc7RozsfbkB4Qlp2cpiG1G9JF3rgQyLqLunjPf4m3cIN
	ZZp1TmVdg2W+fQY/gTn3THAS7Gipx2vV5huxcKi66uOG7qz9dOjCyed2MZg64rYXu5D9Y7DQjln
	bCdk4Fy/5
X-Google-Smtp-Source: AGHT+IE8cclfNjGpRErtSU+IQYlC80KA/mvktmZUSPUgteaPfn+oZPkriEMGFnPqNoJ53MfrrkiFuA==
X-Received: by 2002:a05:6214:19ed:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-6f4f1b9bf0bmr10177236d6.3.1745872641862;
        Mon, 28 Apr 2025 13:37:21 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0ad4382sm65108736d6.125.2025.04.28.13.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:37:21 -0700 (PDT)
Message-ID: <0082078a-32ef-48cb-a181-c2d598ae29e6@baylibre.com>
Date: Mon, 28 Apr 2025 16:37:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
To: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-4-6f7f6126f1cb@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-4-6f7f6126f1cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_133723_050162_89925E42 
X-CRM114-Status: UNSURE (   8.27  )
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


On 2025-04-28 16:23, David Lechner wrote:
> Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
> point of confusion that this macro is only the voltage input channels
> and not all channels.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>

