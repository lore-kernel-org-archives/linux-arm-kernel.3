Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DD9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hfDJLR9yNuRN5GPzA8PeCgTr8s7BG7gSfHQ0NUvCN8=; b=ZMAvnUXjr8QAbbYKit7BXIDZpK
	qwTel8+uA5/2Csstgh8/z8OmAhCtAs3XN29VpTXnO+mrRDf+mWcfyb1MRep8TcL0jcZgUPOW5u5ke
	BFyiix5PMFotcUcRTrq7OPlj/N2nX3qrvHk2FY0G5OiWDPkXYd1TTxyepS+0tpu7DR3+syhvW/Efe
	UTRTSd0Xw03XgPop0xoFvomL/9Js93clk52ocKOodhCzmg29spJnEvjIWfsYWz6EsZDANcJNULonr
	LZqzcBUEBpvIW/h9vlFdWTO2GwbRE5//3swRkK3Qa22oXTM/RN3LeNoicGCLsbzSXDuuc+QxOA9HI
	XLG/USKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipQR-0000000DrDW-0VSy;
	Fri, 14 Feb 2025 06:43:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tipP0-0000000Dr1f-1b1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:42:19 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7f2b3d563so316567066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 22:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739515337; x=1740120137; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hfDJLR9yNuRN5GPzA8PeCgTr8s7BG7gSfHQ0NUvCN8=;
        b=pi0GtKO5VmBaUx1sQs1/yShT1+JBEC+O3v4b3LOzkd6fZjC9kW72fax43O0kgnyFRU
         ZOxZcelaLQK9k0/mXd6Ww6Vtbed/gn19LZ14S5i+dq5EFGwjCIqeC8y3IcvzSMjsyhsU
         L4HWmWy7AS4GOaSlGXspRG+JLmDg84VaXFrZIaQTXVk8ZNb1pLhEOCZTevO+VEOOmQhd
         WKHrAhmDVjBA5gU5/D2EN9eUXPFUBSO4mZ5L70utrFR/KI1ypk+ewhYlXObroa2lKNd/
         uvCcF8ld4OGTXVGjVpvQf0T/XnuAD86Pdhj78rxIw56OsS06Prv6JUK0UwmDS1Zt5i9A
         gY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739515337; x=1740120137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hfDJLR9yNuRN5GPzA8PeCgTr8s7BG7gSfHQ0NUvCN8=;
        b=p+/F4cUWMR++UJd6L+6NNtIizCftnSoCjQRVZicC9I063LhmL8RuG2jGZqMT+7LzmS
         omHNbQQDsE2Jgkxur/WY+cgDgi2sNGXyZsJEmdqwVhIGduzGsbN8po1wwPpZCFL7UG5p
         sXnB2FWZX2yhyw8Q7tAMGDm5A6E/oXDfAaZwqW8lfxvF7DgB0dY+26FZzpk+WROYU3Xb
         jf7zXZn5OIQDOd8Z+XWNcGlPhug+mwiHsKPK363EdQY0gAL1dmfhZEqGLE6k/duPGxjE
         TznvLEfmj+/zPOUJSvNA8oJxGEMkzv/wZxMozOj3wZUzbAfLTHFJb5aH1CgO4Tf3XBy1
         r6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+LemC1IHT2mjRAbaqk2sOAqiu57V9LtLCZByCFznczLuyTX4GTY+vrT6ZD5p3oUuptpx+JW3B16Wg4LTzNJc5@lists.infradead.org
X-Gm-Message-State: AOJu0YzojGzZZTBdD/+hfz579BA+r5ivyqJXdEgeZTQKW2AKJEGjeo/N
	pENjGG/4TWRq+1i1SLJrenTiTfjrKOjFgE+7NoQCPBcDU19verPDFySx/5YOoK0=
X-Gm-Gg: ASbGncuSQh0hDsuUTj0JJzBYFwT9s5eayTMdVBWfcROSGj8EoZJNBoFNUKXHX5ehok9
	FxQ7l18Yz1y7zBdLCfoolUgVopApnzFmcKC5MfXpvqBmVN98yBmgF8vdVltQiZu8RA3xsnuPdp2
	0nBS5fBE/BxUwn3sgzFhENBimz/rYadu/Y1/se4PouQKJiTChu8lmSiktvQBMR12a7Kgutf2ESW
	Ix42btfl2UiZwKgJ0iEPFWU89XMdXTKd9Ld9X8fDFx7hwmNa6qoZ3bl7wvvh1vysfayyAXG9ujc
	vmcAeQAW+YWl/AbUYJMFejyE
X-Google-Smtp-Source: AGHT+IEKcusDJ5ysfHl3uoOwCsLd2p8Ws/FHvKfkzEK57YdhmOYKIadpK1QRFMVRV3ZXNrzmUuWp+Q==
X-Received: by 2002:a17:907:d15:b0:aa6:9503:aa73 with SMTP id a640c23a62f3a-aba501bc5admr629562966b.51.1739515336656;
        Thu, 13 Feb 2025 22:42:16 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532832d1sm275659666b.81.2025.02.13.22.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:42:16 -0800 (PST)
Message-ID: <55028ae3-ffab-41e8-b1ec-fb2098b65d7c@linaro.org>
Date: Fri, 14 Feb 2025 06:42:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: serial: samsung: add Exynos990
 compatible
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 robh@kernel.org, semen.protsenko@linaro.org
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-3-wachiturroxd150@gmail.com>
 <fc341dbf-3add-4728-9ec5-7291ad3bcbe9@linaro.org>
 <Z67Rm0HoEqGsiL/F@droid-r8s>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <Z67Rm0HoEqGsiL/F@droid-r8s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_224218_426428_C744AE9B 
X-CRM114-Status: GOOD (  10.46  )
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



On 2/14/25 5:16 AM, Denzeel Oliva wrote:
> On Thu, Feb 13, 2025 at 07:20:22AM +0000, Tudor Ambarus wrote:
>> doesn't the 32 bit register restriction apply to uart as it applies to
>> SPI? If so, you shall probably fallback to gs101.
> 
> Of course not, downstream of the UART serial driver there is nothing
> specified about 32-bit access restriction, nothing explicitly
> in the driver. [0]
> 
> https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/drivers/tty/serial/samsung.c#L1543

that's very strange. uart and spi are part of the same USI IP, on the
same bus. I don't think you can have the same IP requiring 32 bit
accesses for SPI but allow 8-bit accesses for uart.

Maybe SPI can work with 8bit accesses? How did you test SPI and uart?

