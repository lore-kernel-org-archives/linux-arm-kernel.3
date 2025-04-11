Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C9CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2fznhoTGlfhy6bwDHoklI2QzmN6aCONWUMAdXUv1oM=; b=bZwEFxvl8p58jcIvTCz3ls6on/
	1qzzknNmXo7+BcxNahkQfG9zcik/xXw1DSu4uhiocEGp4GZSFRUcavfkc0AFjmA9KRwDxUNxdvTty
	gToxd3ChjAxZHe9ueBQColynqcuvKBuL0lJIP7jF7qjxfXX0ijYxT7kotG6CBlZ3yt2eHysZI4+AF
	8t1jnEvZVekg9QVCUvNR/b9ig16DyPJDTclDqDgzojGb76JT79+bYRgiqNSJxRd8fbLcmjGloUcPN
	fazyOWWm5Vry1gsLmquOcYsA4P3xwDck4Tblprm0w3Ao9bKiGfXylDgq/GiBub9VpHab9joRxdakn
	zQQGIhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IVD-0000000EZdy-2Yzk;
	Fri, 11 Apr 2025 17:49:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ITP-0000000EZS8-0aEa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:47:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so11359755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744393645; x=1744998445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2fznhoTGlfhy6bwDHoklI2QzmN6aCONWUMAdXUv1oM=;
        b=N6Zwdex7/4Q3DI8awBoNd7VlFWFU1JG5XhEqOfF7JfLYxqfBfQ5KldzGuX/PLYt3Mz
         w/rkIzblJanuP8wX7rH6MgMxHOE5NEYdO9PmTXxp2N+v696cyGMZfvNMcLcFifipnIGL
         daabjtjJyke7Z0p3PXHqTYiatxmbLhfv8TO9K0TebLF8MLjlxIRRInA1KFRFCA7j5EjG
         7Bybo7OLzxuEjUtL6ji1DvxatyMtbLcDkxjobzvLxzU3UW9h5vLDM4PIrkgmiJEYUQf7
         SXrLW6+qOXyOki2VF5CSm5Q6dJhBmcwUJRIMA1ELsXR/VyzThMrAsQPZsrE4e4D0ic55
         IqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744393645; x=1744998445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2fznhoTGlfhy6bwDHoklI2QzmN6aCONWUMAdXUv1oM=;
        b=omZiZbaX78MpH4v3NeUD23bLd6ViZmHdGUbWq1RR9E6HeUnkJxZkVhCrECkuWhxRJa
         VypAP7sSwZ6JsRPPAfcGhb5D2ysDHSBWJmyDtM4OM8eEtt6Ed21CpzOiL44+bPjHeMOR
         xqXqHc3XG87V9v2Fx3V4ZAlaErQMxgByx6uBKofZA2B7+FKB3LBTs2LgDPjeFl+P4isi
         6Zrwi6plUBbXU3clLC4vrFMAJsJQ3jJW66TCMk/WmIhTLEaIWgE36ERtdI2bxumliEaG
         VWLoEb6aNRTzJ6vd1HXDzMSVY77iRGzeITauf/TfgeBstmX3jV2PwzG21gt9z2XbmDCO
         R04A==
X-Forwarded-Encrypted: i=1; AJvYcCXjYF1WuEWpQr7aLFHal2xPH9k0+iN1lubqbnwtfXCdhFAmvKB+JqaspDzsEYd9gcSk0ln43acWJBLQ/I2HU27b@lists.infradead.org
X-Gm-Message-State: AOJu0YzL4dDmO9Ok2fpp9Yi7DMyZyPiEUkKmpguSOOdIXH5ggIugZkTd
	3HzrE/CWI9D8uH9ObXV4gJfIkZyKDBL9rLAIE7Ms3pcT+LbbZX5eZBmelA==
X-Gm-Gg: ASbGncsmqqfYVb4lCpnS4ncWp4bNJdoaYCkITgOlbObUe7d2Zl6lFUfZnnJdIkTdfgE
	it7dkoxfONy5oW64KeBkuQcaLxfWxrAJA1NeqGzK16yKvRnv5HEf/Vlut1fvZFb+ZqCPPDLs3f+
	eXknCDtyYNQtUw8Mb7S9W05j76ZIxjZntnKLegmyyybmmWFPFqYKICGOJVDy/mNKpAUJjmNQS8I
	JbC+S7DU5JtrryDaOhMCyJEIqhLxd3ZHzfnRbxMCtGIvKTHsRXFO8BIOLpDCNX40RLH2W8M9Cl1
	/Wx8B+H5WzynRve3tRrLvUtw9a2FvReAZQ34CKTogxiCpHIvo3s68s3kqizr/Qx5m5XjN/DzuPJ
	5KjbVu0BDM7svYZp/X0M=
X-Google-Smtp-Source: AGHT+IHKgxGk7ctx/4csBqrnqZpUz6mKKVmeIDv4j+S1OVFBpZaUYqHi1No3wJ+Lyfqa9wjViAwAPQ==
X-Received: by 2002:a05:6000:22c7:b0:39a:c9ac:cd3a with SMTP id ffacd0b85a97d-39eaaecbdefmr3169374f8f.51.1744393644804;
        Fri, 11 Apr 2025 10:47:24 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445713sm2624289f8f.85.2025.04.11.10.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:47:24 -0700 (PDT)
Message-ID: <7b5ef003-7a3f-4ffd-b563-b4b7f77ab011@gmail.com>
Date: Fri, 11 Apr 2025 20:47:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos2200 compatible
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>
 <2025041157-stilt-sculptor-c978@gregkh>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <2025041157-stilt-sculptor-c978@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_104727_180000_92A77C50 
X-CRM114-Status: GOOD (  12.64  )
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


On 4/11/25 16:42, Greg Kroah-Hartman wrote:
> On Fri, Mar 21, 2025 at 04:48:02PM +0200, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
>> the existing Exynos glue. Update the dt schema to include the
>> samsung,exynos2200-dwusb3 compatible for it.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
> This doesn't apply to my tree, can you rebase it and resend the series?

Yes, I will rebase this tomorrow because I'm a bit sick right now.

Best regards,
Ivaylo

>
> thanks,
>
> greg k-h


