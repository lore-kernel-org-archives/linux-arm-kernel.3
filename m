Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9YmxWtXYqkzVIIum7XUTZUx/6VEWdJTe6WXroNegUE=; b=1msCT7/cqcaTA63ArrZwQULrIC
	D6NTCb+DsXmc0Xe6Lx9ZfKIQx3nIc40PLCl3eJJxWRSLiUqhbZdg+tyl3LjjmhpNZc/yJ34bhgdD3
	hMnx/XABT/W3yfLzelCZeNa9CilCUAkMmhzUsAPuvY4hjcybrmayvUIOiULKQ1Y1LeLjj02BfmvOO
	AbE/zZ5CNfva1hfktUnjlX81jLKz0pUAB9HlsLl/RhBq1pQmg82tqJlV/unvXmaHGhE9tsTliyCPs
	FdyhUM3sQkHM1tGEyUVfNx1E3xZFg06i/eCZZcaJqgrKgcG0WznArtipgwyKLzVGGx46t0ovDDF3J
	6ifFqccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfSa-00000002zm6-1SGb;
	Sat, 08 Nov 2025 09:42:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHfSY-00000002zlG-0ne2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 09:42:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4775638d819so8425065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762594932; x=1763199732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9YmxWtXYqkzVIIum7XUTZUx/6VEWdJTe6WXroNegUE=;
        b=JrwcdfjhuOlbFhs55MF/o7dBiHFukidwkwR84ivUrLbZT5VhrFHIovKwP9eBwqzt/p
         XHpTMWdkHzQbZlgVczD29tSbdPNvxMN4CEAlS6t2K2JTx7Q/t0RT+kH8+5WFRalym+qw
         GRnzsVI85dXrmTONfVbCww71JQSUHP7IlJwRfDofllEnLIFF3Brg55IoX2tYZ+Rm15CK
         VIgTsf+JVXUh8ytpWoeC0ECWLzlJCOTghm329EZE45a7EU68UFON0goUcN48WOrxl2H7
         /fonnqtDquGa0dvTb71dH5hvOv2i7frs+6l39VqzHoxdTRU0/4Q5y5NnxHT6KlMHoIiZ
         csKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762594932; x=1763199732;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9YmxWtXYqkzVIIum7XUTZUx/6VEWdJTe6WXroNegUE=;
        b=dB2DT3ziOt5r/CJxjSL6uu8COEUyOQLtmyPBhGGeaW31cPJhT7z+PC4BjOYLy4QRrX
         YtvaGncWQOtZ85iSjIeCr2BLy6n39T6/DesYw+lN1ugaRDjRVYoWy4SfN5+nYSBI0puG
         0KsIj2tJBHfGJnkWvyne4CzmhH3mUUaJIrVqqH5xdkMogUioW5Ho60TzNlS+CEdVbosu
         M72OKfiMFLE+7bIfXH69ui1oj4CXIRjlwhHQmDFr9umAMEHYt/OnnK33IryLYhRZEhKf
         9D9WOzFBy/y421JSET7NY0ETSVrm/62EsIk0AaawlwzfLOIO7QZdyVXopHzN6JPzkfEv
         OsJg==
X-Forwarded-Encrypted: i=1; AJvYcCUkEWnQ6OpEZdF556ibCyzrqvAGCkFUqL4m1HV3p68QlU8t9D1hqoZ5xs031bzaTqABLsHmbNb3UWtWJ5oA1Lot@lists.infradead.org
X-Gm-Message-State: AOJu0Yw46HjC+Oev0KAbZwTi1wTyG/zNMcIbMnHbs9CFzygskRX2iEZe
	WUtGo158+IEKbxBVsL/QEQMaryKirYOUiH0VTjLoF7oDBupY0rp73Q8kS6TqJOCfT9E=
X-Gm-Gg: ASbGncuruIKSoQdHtcAdNw/qjqB7IwIjzjNI70Act/h515vcTUATsjpXhgynCQDWOCu
	pTC8q/4xONZuCUY2oE1zhj+yW8DfNaK3Cr+Yw2UWBSri/r9j2s+wLrKjg6I3VtGXDvKJrEffSQj
	NM7KXQNetoqV7nEKg2X35IuW+wYSTCzlCMfJxu5vc76qYY2jH1z57BLjaoZ7FYoLcBWjRg/I0XQ
	tl8VXrrEVhqD9fNlySXITPKT2Ypwq67/N/U7QHAxSNXDTuJju3FTbNdlJwV+uqK7iRkOQmJ78F+
	WBKfXNJYJyL6BD5p3c/pGcsF3zy2YytL1a9ptkBLS71DROWiqz3r9sI0gaCnOyF14mX0KFnIM5w
	dim4kM3PkJ3i90ySi+65jwEuFHFjIKAOy47woDgN870JgLli7AGtReeB0kVg5okqfLLEkW6Jem6
	VTifMFVdCOPVyvOH4rymA=
X-Google-Smtp-Source: AGHT+IH3BtLqTQUB+SHQHAtRZHshnkzra2M/BuhwjfAVOXR0jPqldKeFSnSP5TDfhaeqsZUfxrXZjg==
X-Received: by 2002:a05:600c:1f10:b0:475:de81:563a with SMTP id 5b1f17b1804b1-4777328fc3emr14493545e9.33.1762594931960;
        Sat, 08 Nov 2025 01:42:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd2e5sm93911435e9.13.2025.11.08.01.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 01:42:11 -0800 (PST)
Message-ID: <8bdaf52f-0e4d-4455-a33e-d2151154589a@tuxon.dev>
Date: Sat, 8 Nov 2025 11:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: at91_dt_defconfig: set MMC_SPI to module
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ardb@kernel.org, martin.petersen@oracle.com,
 mihai.sain@microchip.com, ebiggers@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250923094552.430595-1-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250923094552.430595-1-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_014214_384655_03E5068D 
X-CRM114-Status: UNSURE (   7.07  )
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



On 9/23/25 12:45, Manikandan Muralidharan wrote:
> Change CONFIG_MMC_SPI from built-in to module in the
> at91_dt_defconfig. This allows the MMC over SPI driver to
> be loaded only when needed for WILC subsystem.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Applied to at91-defconfig, thanks!

