Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4ADCDE00C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 22:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+3GoXf2mrfA1KP6AU6rLpBytQHse5+WqLmVOpgycR4=; b=aagh635Zx8YN3UUsqip+KS+1/8
	uQP90k1uLaU0S+OqZe/pDA3t+iY7J1+DOFJYTcQ4LpYxavdc8jRr9Gy1UzeVCIdDdcfmIvjPMlq6G
	j8ZqC5871/jgdHXPCrrGAvjjsRy2aXlsqkPeuc6L38IkwB6c5yzIJNBGqPjR4nApPVXqZBVd8zTmG
	M/E53QRI51G76O1cnZW4n3W621/IOhxqwbGQ+cNNLAduR19HD+Kn7NLyLGiniakJiA2YMy1f3d6BP
	nSyt2tvvDCYAAIGFzi1PJUoZE33X42LeufpwehWXwKBMX60qTxnrZ3P+O1cR80L+p45E8Gc2PMVKj
	f5KvTo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcsO3-00000009vPm-15RX;
	Thu, 25 Jun 2026 22:17:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcsO0-00000009vOr-36M0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 22:17:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4924f8db066so1688695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 15:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782425846; x=1783030646; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k+3GoXf2mrfA1KP6AU6rLpBytQHse5+WqLmVOpgycR4=;
        b=APusZBR0xJ2wohhtYjyf1VqSX62ePwB2wrn0dwNQ67mQvy3ra4NnvrZ8vOp6R8CyDN
         AT9dBiXnWj73c/e5Bt7tC9Ch5bKcMNKu7EBt2sb+zojzzy1RZQVkHTLn4ftJzXW1Yj+1
         2rK6tIXV2eY+a2vHHBK+UFC8GzOCE189IpHwlVe42/45H28H5lMaJ1Wy+HC5RwCdGQRH
         dXDpBXkJJ3+s7QOQVuSj3NFUMJDUoWCm1nxWWvXTZQtUlw0isnIEuriSQYgAhL93KOEn
         U3w0oF7GdTZAzYB+CBdrpVgHIdN1/XFa75wc51R4diKJPBQ2rhHZ6s0u3PP8Nrx6AbJE
         FKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782425846; x=1783030646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+3GoXf2mrfA1KP6AU6rLpBytQHse5+WqLmVOpgycR4=;
        b=K2XTFcTwB4oGuW8zR8lmIl+Uc0wF6SXoDU3cYmv0WsXjpiQNm4vgFZCFxzHRdyFZKl
         rFZfIjSVXzlDQJKRgP9a/IV1inROD2fbrXf1uEWhyM9cjggcKTyaTyzACkMjtm9tjeWn
         cS44dZInYvVXoJOUVAS31YtbiTjjJ1W21n8tpGxi3zi9OQ0jWlPyPTzaaW0utZfixx9j
         v2PfF1qZrAwO1yF4SVwV0ikTHoIvk46dJvU6/KKpxn39Ew0DFjJOsa/84qb1X6TqQvP8
         6EW/6fLAxDCq4ZI2+trMGE8RyWFsFPGVtZPHP5mY2IvZmtrLhRHUxp3hXU108Tb3ZDmG
         vRUg==
X-Forwarded-Encrypted: i=1; AFNElJ+b5xL682XR6HM3MWbN5b0Im+GPLmNJksd6WVV31iFTYuaGMu7m35hjT1W2VT5yf6IVJcKMVUKmJld2rQk8p5Zj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz48EcoVfX0AALFpq1PntqY5dQk6PsERQfxk301UaZx0u9gLP+o
	l/N3cPGs8u0CbizfQfqgje345BF3HaAzHZYKzKPXtMMQ3MGk8Ohn/hOX
X-Gm-Gg: AfdE7ck4DEEi3nweQXtIUlLRxd1MKaaqmlC46/GrJcaOFDDYOMm+HzyHDyS62OuvDzz
	3nZN8QmeHEt3bnvMSpncTPPSzXf+n+1pfMwhuOG/ub0Fqk8rsSVPmzUxRF0DFtRfO3C1YXkzL2d
	TrHmRsr+01n2Ub+VSIL1L+kjTkPFISkSmstPhIfYNLcCNfX3e4AlPT4PDP//F6KGDy1TGS3AvoV
	80lwV0DTW1OAwMtFHU3Er9Ldz4sHgGJKD/uxIK0+K3U4UMFysQrLj/Im9CAMy2BQdxW4cCmsZdH
	8zCxYiep3Y2rxzRdaT6a8lc+HosBgdlLCmnwWrYe6NgVD5vR5+JPSHACKCHxYV9rSg/geg3V+gL
	9tRoqkigz0ppPZiRGro4yqKwlO87pDeKhMyJW7OA2jcURoTINMGaehMY36W2Cf6wZQd31UQll0K
	mr15947V8LmzV+USWGbD1IPX9T94P3sl53+hVeKFObBqEwcQJX/iq0yofDPW9gqa8wdGVyNvmoa
	V1013W3
X-Received: by 2002:a05:600c:3549:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-492668acc8cmr62424645e9.32.1782425845982;
        Thu, 25 Jun 2026 15:17:25 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269071e49sm27961115e9.10.2026.06.25.15.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 15:17:23 -0700 (PDT)
Message-ID: <4a35af81-8dc5-4c13-93cc-52585f84372b@gmail.com>
Date: Thu, 25 Jun 2026 23:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com,
 Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_151728_797894_CD56637D 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Shenwei,

On 6/25/26 16:54, Shenwei Wang wrote:
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on OF && REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
> +	  i.MX9x.
> +
> +	  If unsure, say N.

You've got GPIO_RPMSG defaulting to REMOTEPROC, which is also a
dependency, so it's effectively the same as using 'default y'.

But then you've got "If unsure, say N" in the help text. Usually this is
used when the default is N.

- Julian Braha

