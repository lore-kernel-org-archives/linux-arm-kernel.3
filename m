Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D450C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79oGkqwqtoEAg+LJ8PFwsRkiBa1NsJHHWe5PT8aLALc=; b=pXwygYyx8u8jKZWua0Z5HkH0wC
	dE77FsVxT3OfPG6DGg3xRmyc5+Z1fYr7eMBjDVDBfs95loNejywwxtavcWguJywV0eF5nM+sIDhq8
	7jtv6JF4vb/Gau10w4eVlNYKNcMRs42FUuicNrC6GWt4WW7LHQNhsRZAQl5EW/iUUoXJClYenW/9P
	dBu26kFG4QZ9+i0rALRr/3oKpw7vw3YyeMAGLXCiOA/OuXqyDlsvv25IfeMjX7S8+uFS0LfnbuoMd
	mRipdZg9woYzjMuz+P8dN4pkqx2vXiPS1QbWmdVGp0I0V9gr5SkmJz6TBG+zwWzJJAS8wCCKHgFEM
	ETu0u9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VMc-00000007VES-3wYW;
	Mon, 28 Apr 2025 20:46:06 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VAn-00000007U53-2TTO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:33:55 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c5e39d1db2so319934585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745872431; x=1746477231; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79oGkqwqtoEAg+LJ8PFwsRkiBa1NsJHHWe5PT8aLALc=;
        b=SyLXtntweLUy/i6fZgm55qYK1FE4RiI10NOrRjEYMCQckkLbwZ0lTw86h4K/U5UX47
         ruWL8z3xqxaEFIAjHHi/6KOEGRqbcUX6rRWwHpgZ1Vu9Wdso4KizJZMX/IwBd2Et4Qzj
         RGE/z+30wJPMC+p5013FCgvn3LHTRV+zVfNPM1qs+8AW0QmC3i2sge7oASpxD/h2sbev
         WwxruSYoqSf88eKsNPGrEmvrCsHhylWjF+KvxZSCIOFItXwutha3UnJEsnEsjDM4fFMh
         X7yUbUnlgOIRdmq1Pzg3eeHZRhy9NmNDlnVevjFceZtnNtOwUoo5g0LYpcm+uA4C2Wcv
         2osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745872431; x=1746477231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79oGkqwqtoEAg+LJ8PFwsRkiBa1NsJHHWe5PT8aLALc=;
        b=jgv+rxI1Py4q26CwIPfcKGR7rp/x78OmThvt2QnkjhkOvxY1V2CrJQd/mpfhgmyTrq
         9YWBTKQg3RS2dLXk5Cp2VFDcOV218+YiySNpB7G7uXSOnJee7kZbJ/gU5z6mXHuO6Pdl
         pP0Gwtu5M8SYHMJdDHWOQbr7PGNA1XsECw9GNZc9ym/J254V5ZmjL548QA9IxyRw3jXu
         T5S1/H0pWpnwLEzUxSt+oXJglYrKTKoSxVz3b0wF2FhIuKvkTzxcaaOBOWLy14pTJ7hZ
         PO9lpnMNaphKHVs1f01B3QgfQlyYCe58cqngcVR0vvrvH+zW8T7awjY+ZpZOfG+OEjj8
         7STg==
X-Forwarded-Encrypted: i=1; AJvYcCVsuDDyJbEoVFMbVDyhk5jiPCIOj3EkvCvJQ8BwR/q+wf4m74C3adWXkH1bZ05veJ5K+8YoYHFOHE9SoJAsaM7/@lists.infradead.org
X-Gm-Message-State: AOJu0YxUA2VJZEUYiI0U40a3Elc+CDIFsEEhAey2dTT7p2UwJVZWLdJ3
	46eXxxbE+lvGQQU42Q86n8APnqiOm9NwBAHOs6uCw6bF0TBiUH56UNP4gdSoWfA=
X-Gm-Gg: ASbGncvNQr4yphKGUsFGBH6SWm8jkEYTScVhi31l3/XyiH4pvQptnkqXcfxHMkQNUKz
	ffZcwRpyvmBXKXKQJRxDGseZ8mTI5Gjpj/r9ZqrREeJoA7J1nQk8yD2v7ZAIJlVnsjjOHKH+003
	wCaXEDaMiI+3M2Ztv89HIRJqnL39rPGplys8oXqAztIoPbNfU1BMk69b+CL4LizLr/ihi/ZARsk
	OYOj1XBVujt0kG3WQ7upZC6Hj1cRoR52G9BZnatISI3vyB/namJviw238h0jYz92LH1AW5htnJz
	0MVVFi+CAq8eYyNnfcir9xBgfMRFmu6DCJQAfZmaDMPhlWOce8cNcAHfJ4z825w5JbS11ak2XYo
	SC5nsheX4EoWPfleTEJ8=
X-Google-Smtp-Source: AGHT+IFlcN5nnqIp3+wIDhbfjG3UuYw4IWpcYOaPFaUvM68K3UVRPZ8o7MouMxjeweLiSpXKf08LaA==
X-Received: by 2002:a05:620a:2894:b0:7c5:4463:29aa with SMTP id af79cd13be357-7cabddaef62mr157852585a.40.1745872431252;
        Mon, 28 Apr 2025 13:33:51 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958d87309sm661055085a.80.2025.04.28.13.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:33:50 -0700 (PDT)
Message-ID: <5d76e5d1-1cdb-4921-bbb8-a611c831cfb8@baylibre.com>
Date: Mon, 28 Apr 2025 16:33:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] iio: adc: ad4695: use
 IIO_DECLARE_DMA_BUFFER_WITH_TS
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
 <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-3-6f7f6126f1cb@baylibre.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-3-6f7f6126f1cb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_133353_633248_6501FEA7 
X-CRM114-Status: UNSURE (   8.59  )
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
> Use IIO_DECLARE_DMA_BUFFER_WITH_TS() to declare the buffer that gets
> used with iio_push_to_buffers_with_ts(). This makes the code a bit
> easier to read and understand.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>

