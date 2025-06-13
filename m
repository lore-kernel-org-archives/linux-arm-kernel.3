Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71459C71156
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4PmbLTdx7bKxmJ58LSBL+52b6YKUjWHxLD3jkqTwUs=; b=y2J6Mev/tXogt8JYDBbPv5a7bI
	zqFq/cxALMnOJKSMm6HVnJgYB7bj9KvMA3HOnQjwkZ2b8HRGOZVgBWI+qxD0NEAZvimQg2TNMW2l1
	7lc9iTbynA/ZIVO73nhUMtpxL2IrAmEcJZ9s1jTmlaS0sDejK38wl/P93JddVZwlqlATKfRKOhM/u
	IGWalQaYwHbydKcgGgLWuRJjm7+nTyZVgUPPOn60dSNttGWC1DDEfTf7uBRDs82sUm/C0y9pcrJVq
	Zre9/wYsTmTr7yotJWVnsAEo1d9xLJsHAqGmrxn3kmsjql04aAl7GAoCLgiMzUSmndzpdnOGq6YaD
	1qkZ05Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9hA-0000000HNa0-1wtR;
	Fri, 13 Jun 2025 19:04:08 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7lF-0000000H7tX-2CZf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 17:00:15 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-72ecc0eeb8bso1023128a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749834012; x=1750438812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4PmbLTdx7bKxmJ58LSBL+52b6YKUjWHxLD3jkqTwUs=;
        b=YM1puRez5TSi3uFWVTVbMptkT5suRX5s563jHYv/nlVUhIhh8cOKXNERWDgN//FOX4
         GplYSDYr1ndxyeCBd8V/ibQfKOZOkHqlI2PVqRJ393mL6jtcFRWke8zhYVbR4FQWeHle
         1VHZjlXUhpSTxpyG30dCXJqxB6RYLhQ9qnQ+hq7C8bnCW5141bZMftptvn2weKOYyrKH
         +2Ww+WTf3TZn9QP0Ax0x9T/fD6JiR3E/lS/poXXuPbAIHIymykuHzk4rLP9tg17xQJvy
         Ze/sPrrrEJQ9s/dhTm/D62fQzu3idQRtM9qUPeROOk+Tu42JDWtUZPFFphuHV1QAlH3b
         ZRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834012; x=1750438812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4PmbLTdx7bKxmJ58LSBL+52b6YKUjWHxLD3jkqTwUs=;
        b=fztPrT/L6UMbzxLvMHmNI4LSthyYN8BRYN39rZKLo+HkL4sfe+zVFGFo5VBAOghY7I
         x+nwyItXbtz+63xRqXRLG1f0b9Y1Qj7ri/AfM06qwBtqOuhgZFMOf6aa+fFfSF+YRMVO
         /HSkWT2jex5GWO+FHdjIp/zIqGNemezVN2vTfPOlmfMaUpFk8/m1+IrSOzEmwfo/+Lw6
         01HVn4gy43xT2nDNvM+IeCiFwrcTzOfY+7czi6XkBVY5PwpH6FteABtjiEcYu5/4enaG
         hYX59ETirmYnwfAMuMkhOpTH1zJjPF6Z4UL0QAj8uGmb/o2HC+usJK4/bNRYdXUear5s
         Q8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF3yWkRSG8RoIP8JNnAZDRUM6Z5NEE38KAVcJGyGQpRc+WGIB9FMcjNU80Ivs+86guerGeRSSn6mB6abYyvFV3@lists.infradead.org
X-Gm-Message-State: AOJu0YwDAfxnRneWfwlNPziPmXXNu4XEPKjqv5XfXmp5fwjrc+IkDWd8
	jz879HebuM7PhbabknpgP22/jUuSEq26zGDLtevsZG2JnNQrtg7rm4K6Oy5UEKxHf/Y=
X-Gm-Gg: ASbGncuxYs34ucuNodAFMvycKNdKBUqmAWaREXxX70UuO/07Gm36DPKyfh+vbECKM8p
	pUiab9NPy2ChRGYqLq+jd23pjpRQ97DTG0NR40/mnwpvDo6Y2Bf8cJrVK5VC1O5dFD3kvutgF+f
	OE2H1BGTkY3YpP89vfJ0t1hP4d4rD5zGZ/g2SeQehu1nSLqiF1heQLbZFn2EFcavtl+yKATaPLp
	FLFFvUI5w2O/aOv1lIiKJmGUq/ozjm28XpyYbSjzcHOO16hCcCUSrUUuts9cHf2Su8/F+RPrDmd
	AVJ04Xkr1afKpodQK94/mm+tV1znC460LGcUHcuOwpWUjcm58qtJKgOw5dSIvKYdimt93olI0PG
	Dd2L7F66js8PNudq5Bs6p4kCo9CSYbdzATtvL
X-Google-Smtp-Source: AGHT+IE7h+SZVToKJUAin3fOr868BbMSOLFocQ+et42SsT9JMuC0JS5qAKXXAH1oH1f2QX3S8vjHvg==
X-Received: by 2002:a05:6830:210b:b0:72b:94a4:9143 with SMTP id 46e09a7af769-73a3626644bmr315551a34.2.1749834011794;
        Fri, 13 Jun 2025 10:00:11 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284ff5f4sm258694a34.43.2025.06.13.10.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 10:00:11 -0700 (PDT)
Message-ID: <46208c8d-8370-4b9e-bca1-7ede7ee9b078@baylibre.com>
Date: Fri, 13 Jun 2025 12:00:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, jic23@kernel.org
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
 <20250612084627.217341-1-jirislaby@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250612084627.217341-1-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100013_572006_CB825C77 
X-CRM114-Status: UNSURE (   9.26  )
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

On 6/12/25 3:46 AM, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: David Lechner <dlechner@baylibre.com>
> Cc: "Nuno Sá" <nuno.sa@analog.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-iio@vger.kernel.org
> 
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


