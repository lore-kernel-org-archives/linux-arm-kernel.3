Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D12C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+b12GfQ8In3o4ovjul5sBZbhYkFtSmsBEzRp61e6vmg=; b=hTXNhLt4AC8thtDgr9MfkwHsKs
	Tbz+IzAfN381FYg11lDer97ZzG17FXi341iH1Edo7sTJZ5tAczFygbCMY1xM0UFO8gLAnoKHkbC4o
	5uhmAKQl71xieW1395H8b0Dj026jVxLR3VxHtDvPMzvvZpyu9OmNwN43Qvl08tS6wncA05mEB5RnG
	qFc7BOsFZe/t+WRIesbpiCYzWVnyctNAgycNn8c3TiQKVkPhTCIT9o0BZQcsPCz6Bs+YfYeKAUdyP
	YUNv99kAUH6EQ9qNwUiL/ZPz5y9fpjYNCbje6xZTyFiAL3pVWwulADObwJVNzfnEW5rAhA2PY8AHC
	2d9Dp8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUlf-0000000GR7G-12jO;
	Tue, 30 Jun 2026 09:28:35 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUlT-0000000GQyb-2biT;
	Tue, 30 Jun 2026 09:28:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0200C1CB1C0;
	Tue, 30 Jun 2026 12:20:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782811230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+b12GfQ8In3o4ovjul5sBZbhYkFtSmsBEzRp61e6vmg=;
	b=c41trpg9FwCyH/Bhr0WpgflKpMSuo4ZMhShALqn7X/iaJeIVZ25Pee4Mgph7HO8HwfXQ0o
	OpVm+We7kMtlm6TX2Bvg8cenRxUXl/daSYdhhas7CmpED9goK6paeKeiCiCAkO2T/gk+Bx
	9/W/mOfO/EuqEn3DYSuxFOhoojF+MPldKOyiL3d98bn2j5Ll353kIFNY2qmjpjlHzj0oBb
	9raO6C0WxXUdWFf1Fh127vdvGLBPOLVMkjRuqvi8d5W4nZPZlu7TG7Tu0oca3W5r+LM+9E
	Mhs0G7LCI+zG5UwKJ7TFp9ynjIC9ewBN5n/fTb3GWuMWoQfGelD2XnSN1h3DIg==
Message-ID: <1877bda5-8724-4de8-8898-a7730344bdc9@baodeep.com>
Date: Tue, 30 Jun 2026 12:20:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a
 sleeping mutex
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20260625115718.1678991-1-v@baodeep.com>
 <20260625115718.1678991-2-v@baodeep.com>
 <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Content-Language: ru
From: Viacheslav <v@baodeep.com>
In-Reply-To: <CAMRc=McgB0gYfvE1KMXkNFnMgx6ahKoMFb2pi0_AF03m4BDk_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022823_891944_91F39D19 
X-CRM114-Status: GOOD (  10.47  )
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

Hi!

29.06.2026 20:06, Bartosz Golaszewski wrote:
> On Thu, 25 Jun 2026 13:57:17 +0200, Viacheslav Bocharov <v@baodeep.com> said:
>> The shared GPIO descriptor used either a mutex or a spinlock, chosen at
>> runtime from the underlying chip's can_sleep:
>>

... snip ...

>>
>> @@ -32,7 +34,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
> 
> I was about to apply it but then realized that it can be simplified further.
> The set_func() argument in gpio_shared_proxy_set_unlocked() is no longer
> needed and can be replaced with a direct call to gpiod_set_value_cansleep().

Good catch! This would even remove the extra fuss with the GPIO state.

> Would you mind sending a v3 with that included?

Yes, I'll prepare the updates and send v3.

> 
> Thanks,
> Bartosz


Best regards,
Viacheslav

