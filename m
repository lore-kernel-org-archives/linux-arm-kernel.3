Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DFACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=; b=HOgIvTHBHZQ78C6vGHurDeO/wB
	Rp2VkqH9N4Qy75mVzjYFEUs7CQxTrvmxLfw1ff884kQCBp4gb061tHS/MMG441fm5nfRNM9kln+8Z
	cVl3Lp4UwyHOpzIwObZ779OgqKnpW/Wqlxt+csGv7SWZ0I+qYp8QVxb8nL1yOqymsK5xUd8eb9FX+
	ZL60s5ZUr+sQmNZEwdRZV2KeGaTNT2v71KB6n025z41RSIRKYwfF/NXi8eIXr40qMpUYYL7tiZIBO
	18zg1eV2S80GwqJv7dcXk/lhBwaQ3RdwhHQhQRKHn1/AC+UcOiso87W6SAXPtuYhS83ux05Y7Gt8M
	Zp3Ra9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKRU-0000000G3bH-2S6Q;
	Mon, 25 May 2026 01:49:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKRT-0000000G3au-1tCB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 01:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=; b=CzNOz493O4qx2wrUIf2GZyxhFK
	ddpN0/4adsJMRBmLlXWwR1JhChN5VsSfQ3yY4XHGdqRZFJ90XdbPRglzkokGxAzNJW4/fmNb1oWwK
	R6d9q+ZtcQBo5JF8BaCiW3oRHZgAEWjYVI06WmXh+NvNH8qEQiXgPzHGsaolLDOGHLii7CvdbWPwa
	yJyDVA7tHZQPLUAm4ICsWDatWIP2I3tN019PAkcbPZixbNdrVhjwRntNgEwrXr42ZqCPQgZZv69gG
	UIJQ2ZF5OKkJzkmWl5WZq2fJpvtR5SFV5bupyDLb07UHeUfYlmwGqOd6Ge0qgeCeYi2dMdnopHx0v
	f0cTwxwA==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKRQ-00000008GqB-0OsN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:49:18 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7df05fc49e5so9423244a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673753; x=1780278553; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=;
        b=j8SfVJlky1XKA0ReVqvuC1Z2J3QoASw151Z6JnaPfSUlBASxVbEe97gcLMAZMLQt9Y
         2zK2sxCVf8qdHevvEz4BpW9b221+7TIsHfxeIgNifbJ38cq1S/YsvBex5tJ+lpMOizgS
         efLoX5yyKvg94QBN3r5QEnrzyUwnzEe+46FMsjLP+0dpwAmJg1thdvksXZAPcsW8s5Sa
         bD3OJsaC01iyv5aiO0Dk3+xzVAqVK0Vcu0AB+26Rx0Jo2H0ZKGlz1/epFxINeTSApyo8
         nsPJHk1gyfN6d0kWfOrNFmmgZ3ufBJCcPe97XIEM2twJEz2cZnieQr7Y3fMDDuRQMEz8
         HPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673753; x=1780278553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=;
        b=npB8gJCYXXwFvjHqv6GW4snKqP7t5L4gQodkNslnQ1kWXxz0J4oq376C9j4WPPrife
         dJzsBFJYqp+a+FWwb0DOklkKVHXqm1/4IwQ+vyFrZhdynN34XurbKD4+aculish2Ai6e
         0qSE11sKSxDVgnKnss3E28kR97vA698cmR9HrBQv+I9w3kbtIS0X/XCPKBt3xNjhGPPS
         IpCz47dGujHxiobrnyCR26IrNebQyZ26leQVZy6VzHAi7iPt8e6Dfm4/A1vBe/4cGigo
         ad/icW1QDn/51Fz8Url6edF+n5IzZ/u91wAQMfwpJd1zsBxK5Tecdn6Y6F+QQEEyRxxQ
         abCg==
X-Forwarded-Encrypted: i=1; AFNElJ8CTgG9XzGZoCxvXJqe7jxrZCtDGg5oCyDC1OXcQyh89GPL2yOonmJvtiFmZ/h5zxJ3SK6Fw9zoP1Q7pV+K03ws@lists.infradead.org
X-Gm-Message-State: AOJu0YxJW6ci9TCxg2KQaRJnj9E9Ik/fUKjKnr86LgGyfmpPFgz6PINe
	KgbrFVDd1SagbAz3wBhaLRqQp49Ustk4MXEULUNYrDwvzxQQ1x9nGHIutVu6iIcU7m0=
X-Gm-Gg: Acq92OFS0sVNVQh/W5i2ZjPRNXsqqB0iunHI08wyF8PWQm1UYFRF7XfkaDH+VapseWE
	rUx4gtNcOdxHg+KhEO56i6FLqMVzbLGvlITZcttgbpDNhbn2dNCp2SPxxqm1R9h+hQf61LNbQV0
	loh27rw8YEJfjUu+ORHLDeri0XFvU5Dw9xekpRjMvyKkTpJFIwOPDCYzVqb9hVTHCP7q28NzGqn
	xVnMFrJpYw5SNjJ9iE/5tSbn2KSPsOcDgxkQgAy789xJrkofuErRQhi1N7PHy+nBlo03kcmzAGe
	/bZh+wNj/n/hJfrJGrMOj+nw7AzLe3HkDeqQiyZIK8SHkG/3Yh/bpsgXUsMYw+ijly4euiwHgEX
	MmlWsK0yzhhT2Utc+GwjHIkSZ0nqQ+Sqm8DAFdAMqMTFR/EE7JPIK/VyUxIs7AP4osogMlPk3+5
	d3uN97Y3wI3mnFzboColkcV7Ah7LyK92beyTJWuT+C/aSSyMhRu10azv9PapzaRLOhJp704S90q
	w==
X-Received: by 2002:a05:6830:6682:b0:7dc:dd58:50a1 with SMTP id 46e09a7af769-7e5fee5ef73mr8197143a34.15.1779673753669;
        Sun, 24 May 2026 18:49:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:713b:3006:84c3:c1bb? ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606459dadsm6267227a34.4.2026.05.24.18.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 18:49:12 -0700 (PDT)
Message-ID: <3c12da03-6c62-4045-b831-e7b07c0ecb5d@baylibre.com>
Date: Sun, 24 May 2026 20:49:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel
 definition
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260525014654.2399354-1-dlechner@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260525014654.2399354-1-dlechner@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_024916_588262_6819B5F2 
X-CRM114-Status: UNSURE (   9.19  )
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

On 5/24/26 8:46 PM, David Lechner wrote:
> Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
> manually filling in the struct iio_chan_spec fields. This makes the code
> less verbose and mistake-prone.
> 
FYI, there was a server error when doing b4 send, so this last patch
didn't get sent with the rest. I missed the [PATCH v2 9/9] when editing
it manually to send again.


