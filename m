Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044FBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTxGCx4zj4KRJ8B1DI2WEkLZlXQbTwcBBSMe4+Qh/hw=; b=qt00kVFLtTHWF6QGzdmuey3AhW
	LJZTBLACSkwrNQMgXdGytUIG0SFpFmHbS38Y+HQehrhUqdwOWgxLp+ii+mAJXGW7taBYgxPyeuPa3
	//4KpUrzdp8e3C6QeKQ3mMDqzYtyByUFdyGdHQm2f7k3+dKMWyldHJoNAirgX0QwXK4gW83XCyg1K
	aRT0EGKzDC1sw/kCaRc8aGQeifo4wIV2thaitADcHPFIKRCTUatfa9v/TWWWtaClHaVJbwdOC1Gor
	l60cZFRTdSDQkQU4T2PWig2oQ235M2KDfslfwytiK+lDVxD6B8C1xy1jyo5VayATwmsDFboHz6kGN
	zXqj72fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iD-00000008A5W-1QTt;
	Mon, 18 Aug 2025 17:32:01 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1h7-00000007uXu-1XiF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:22:46 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-435de7d6d05so2498930b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755530564; x=1756135364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTxGCx4zj4KRJ8B1DI2WEkLZlXQbTwcBBSMe4+Qh/hw=;
        b=Bz8M0DmsfTtOy/QoaUx+0Dlz0HCuKLPmxEZTk/vUJmt+5cz0v6JUDQDiOVYbOh0SoO
         CpFOPwgKEQ5AUfL1Z5lVLN+ej3l8xm2tSKuHhXv/aoY2UwuSDsgv2KWobcdLta+L4wth
         z+6xjsq3LBNIi5FzKTPs28b0K4zatssxouXDSXHV4AkwA8wiPdo8ilRgMOkeXp////94
         G6O5eaORvx89oBs1capj0yC+Cl7a85zGM8OgRWRhUSbSgZ1zvhA2qUfaGI8onvr9Non2
         JmjCX58n9u8HALli6w+mXPX6Qtp1/Ew4dTk/7d5dcGNkbYIJNX/8xuXd/y3NpFtAC1to
         nm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755530564; x=1756135364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTxGCx4zj4KRJ8B1DI2WEkLZlXQbTwcBBSMe4+Qh/hw=;
        b=hRk+CxDFN+QC0J8w01QRHfuCG8NgkTb1mnbXbsoPEIY8OOmxci3cjSzovmovpEc8Cb
         Gn3xZUpOHTVOkr7Lf/elPwc5NfPM67+6spcnhi0vqjNzeLJJZ7BOjv1gCqKyrBDxQ5pJ
         csmnLPbJ+YS04m3tx014e+54xXkxJ4p/4WPYLNk0WBydBTmzgpBmSk8SE7o8q3nMNTfZ
         jDe+7chTq5Yz2rvRTh4dKINW463aqaA3iifKhMTH7Zn+ezyCgLlGBCU1ajfVshjJ5TZx
         buYI1HkTSfOvYOobAcMNwWo6V3VvwjGPYIbEG69JqVE7X7ZNQSAJ+mEYgyRfKvO5CTrX
         dm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7OxpXop6k+T3XbUNX4qw6W+OPQtgXfEAqpTTfpJwq4EMFf0RXUZqVGvUtE/d/jQjBoTA7lKkQniu3nCCmgG4g@lists.infradead.org
X-Gm-Message-State: AOJu0YxTSawQVn/SzNvf5uE/uU1BEkhmpXhpoePPscMT3Fp90fmo0sbk
	FmlsTGujFU9FoCQW/eZX6R+0qUe9pjoE6EiUN2M7lEDQhJBredbaF3MsOQTriHZKc4Q=
X-Gm-Gg: ASbGncvD7ELXLSii8W4TusyCa6O3f4b00vTeYJU1VwMCMGkUCTseUjna+rglf4yQXKk
	vID+Fho+Vus/gtOq5Z6mKlic8MJQgDCxS8VzteYiTYZzAdSsZ6qnLe3XSom5THT7myXiXw983YK
	Lip8gKzv8vzoUaY77GMwu/yVS3HhotDTEAvoUryGQJ0f0ExRE+ZwO4fVD3fCiJrTu/gS50Tqr1n
	l5eQ0neVRue6eXZDXZVz14AWbp60ZvZnK5hAgtI/6oAbQaI3A94BW0mspjX4HAcOS7TJqdJ2Qaw
	ipJ8yVAKlxeq9EHAkPxenM0OhCrjHlbtwV266qvy5U9i+X4x6YXjs1Mi/MHPh1j42xwXCjC6Ir8
	ksP4XTzhDJyxDg4lWOAgw1WNxu4TJwt1NUYnBRyARGpBGwtr+HBPoyi69b36CpzAy4eHw9faBEH
	E=
X-Google-Smtp-Source: AGHT+IGPBTHW30IdobikaWZYenZffvlRVfNOQG0PIn6NtUluKl6ZS29TrtJlRc5HqzQnb05egqYH2g==
X-Received: by 2002:a05:6808:50a0:b0:433:fdfa:913c with SMTP id 5614622812f47-435ec4c9ad7mr6463423b6e.30.1755530563885;
        Mon, 18 Aug 2025 08:22:43 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:ee1a:f057:94fa:9a73? ([2600:8803:e7e4:1d00:ee1a:f057:94fa:9a73])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-435ed1bfb0bsm1759838b6e.22.2025.08.18.08.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 08:22:43 -0700 (PDT)
Message-ID: <0b9a3b8b-11d5-4722-a7ea-e80d893bc209@baylibre.com>
Date: Mon, 18 Aug 2025 10:22:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
 Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
 <ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com>
 <87frdp119x.fsf@bootlin.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <87frdp119x.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_082245_406012_35D900B7 
X-CRM114-Status: GOOD (  16.59  )
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

On 8/18/25 3:28 AM, Miquel Raynal wrote:
> Hello,
> 
>>> +  spi-buses:
>>> +    description:
>>> +      Array of bus numbers that describes which SPI buses of the controller are
>>> +      connected to the peripheral. This only applies to peripherals connected
>>> +      to specialized SPI controllers that have multiple SPI buses on a single
>>> +      controller.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
> 
>>
>> Finally have some hardware to test this series with using 2 or 4 buses.
> 
> Out of curiosity, what is the practical use case and intended benefit?
> Maybe an example of such device and an explanation of how useful this is
> would be welcome, as it does not seem to fit the initial spi idea
> (which has been greatly "improved", not saying it is bad, just unusual).
> 
> Thanks,
> Miquèl

From my side, I am working on supporting complex analog-digital converters.
There are many of these that contain multiple converters in a single chip
and have multiple serial data lines so that the data from each converter
can be read on a separate serial line to speed up throughput. And in some
cases multiple chips are also used in parallel to the same effect. I.e.
all chips share the same conversion trigger and we want to read back the
data from all chips at the same time to get max throughput.


