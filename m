Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A273FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 22:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D49XJVrQTmcvUOSHcXSF7i5rCDIKfDnqsHggFkXm+zU=; b=L9fCPfwD8BEwcI6lolaDIXXqbe
	cTUkI3c1LTEfKtaa2pmHywC/eh5CvrDjb+JtRwyOqBTOBaR41yQj8VwuNVYKTc9fK/YGs7iaGtUhf
	UtpTWexYRLPIRjgVYlfKCdwKlDEzp25Tms1jOwfka6VwLTUsbyjOMuosf7VMEtXHWRwVWbPbzvZnm
	bBSYun/Kqt6tKdWZ4iYGbQHaSQrNp1gZYcCh+YEkc98XYpkW6q2VyxEDMrjbxok8iQgicN+z263QD
	lDXFyKUynX8aofyrqLVlUfy12rBUCrleMQeqHIgtf2zaUCStwkKSkdimZIx3VkrdBdpFpOh1Uq8AL
	3SHomyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1Vm-0000000F9Fv-1is3;
	Thu, 23 Jul 2026 22:03:26 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1Vk-0000000F9FW-0hJW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 22:03:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1427395b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784844202; x=1785449002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D49XJVrQTmcvUOSHcXSF7i5rCDIKfDnqsHggFkXm+zU=;
        b=nUwHB+HMcneWLuiBNKsg4KpE3EVl/tAYVqy2BO2SDUeBMMtpRs6ZO5L3DbH8v0/yoM
         /1uRqUewwKA8tLop8a235L242kV02kkrINZGl2potK0KZuKNJkmbpwVKCfg0FZ+cciwJ
         nhU+7uHMhr5BAgtxJlJ+vkLZXQurkRxNDJjs+rHToJeU2IqCM42ii786K3pjAWQMTbDM
         1qH39Rz3RMoqUV0NUHcwR907SY0vSJTNeiL9rV5bIHXKCXne9YPtRxEemW+CoZwH1ALz
         aluV8n4f9FkOnLl4U5lg+XMgIkqawQ9+RuMNgXW9IPuW1krwt4zFL+NCHJwqQjgcRAPw
         Afow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784844202; x=1785449002;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D49XJVrQTmcvUOSHcXSF7i5rCDIKfDnqsHggFkXm+zU=;
        b=Tshnn9OEKj/SyVzt3v2MB7hzWPQ0KTUP8gh8Tul8Ez5U+q9ZafXdfEIothLXFifBUI
         iCIsm3/tu3lImNDKltMvD3dzogot2AG4gCLxBzXiEB19RHy2U1IyrwRB2fRwuMIGlxMM
         5NvZoLRLdcNJAdnJpuH6zRE/oLCJ7PoGyn+yg3/tL1zsyycVi7ERSIY/Yjb8A6Wrf1I4
         oeiM8hk898N+RCucs7sfjvM8vCZybXg+OO/y6oo3GdteP1GjGnf0WJpEfjPaC6irPGlc
         y2SDst/QSkQ64ing1iyOlIDdBD4UY7ZUIDn41d/AwR1uAwkMTyUItPRZUdwG/iDl9Ej2
         ZC0A==
X-Forwarded-Encrypted: i=1; AHgh+Rpxuij4WVYXADmkF1v6G0F1yt0LsPXAdkE1tTye5c7fCsWWTrvLk8aXy9yBQ06nQfw8mhVFLlKpFPyhLIFqZ1yn@lists.infradead.org
X-Gm-Message-State: AOJu0YwNQQspqG0F67QIDhqSfMdEU2CqPzPLZFhtwDUPuipcsjFYGmFc
	fdkRrBgUsymZ0C0epFMRuNIjv7nvgtG6FULGNy8b6e6vDIPFwPFh95zc
X-Gm-Gg: AR+sD13p1BZp8UCrl4+9UT8O08Nh4qMFLTy+dvAx3dKTWHE6t4P4YOyA+/app5/Zfxr
	aKVTfyoDDW3Z2XCRP8WeXLbfPBQ3eUX1CUnwaG9FBsysFQ8bf7USNY0b9f88saBxUw6kTboZSW1
	P+xEld3m2a4nDSmOCPe4xOcnk7yIM04jHzrjDc0BQn3H5PLRUMPm7PnKDAaMeT+l2shUkVbi1W9
	n8wxjmq3qff0vM7qIlZlyx2HG5ReQb1JHZamke2rNg1TuzkumtGR3eSZB4cxmDIxovHcidvkrM9
	8aLSaBTrzSV8+rdw9aECZtyOqxxR8nAhXHAxNS2crt17B02LmYzvbHvqqUbMu3HBhghUCoacb4d
	FC6kqrY26MoxhyAODKibREEnBmMaP4IckUV5rY0urDYTurjVlwh39F9CPUUQZ4DHqdNotHH3Veh
	Nn3NN5cVndFmEmeg6Hc5l0XqgY8mlhw8kKVpELkbdBUIXggiYf60k=
X-Received: by 2002:a05:6a00:10cd:b0:845:d286:1fac with SMTP id d2e1a72fcca58-84e2bbf64efmr5108692b3a.59.1784844202517;
        Thu, 23 Jul 2026 15:03:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm3746020b3a.14.2026.07.23.15.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 15:03:22 -0700 (PDT)
Message-ID: <6b81d914-7d29-4818-a1c1-748dff7e9319@roeck-us.net>
Date: Thu, 23 Jul 2026 15:03:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] watchdog: Remove redundant error messages on IRQ
 request failure
To: Pan Chuang <panchuang@vivo.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Andy Shevchenko
 <andy@kernel.org>, Sander Vanheule <sander@svanheule.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>
References: <20260722084218.79073-1-panchuang@vivo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260722084218.79073-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_150324_223248_F60B6B8B 
X-CRM114-Status: GOOD (  10.61  )
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

On 7/22/26 01:42, Pan Chuang wrote:
> Commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
> added automatic error logging to devm_request_threaded_irq() and
> devm_request_any_context_irq() via the new devm_request_result() helper,
> which prints device name, IRQ number, handler functions, and error code
> on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
> 
> Remove the now-redundant dev_err() and dev_err_probe() calls
> in watchdog drivers that follow these devm_request_*_irq()
> functions, as the core now provides more detailed diagnostic
> information on failure.
> 

Series applied.

Thanks,
Guenter


