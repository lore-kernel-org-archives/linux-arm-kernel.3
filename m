Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8CACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N7hk82kSw/hD5RnH/Wdj/jHeKN7m/X8ltb3+xi6FX4=; b=i4oIg7m7saU5p1qel62Tjymzmi
	7Zq0R3hyALLWHPkMS1dYKATt+jbDBg6h47hyZuWffb272I1XhNg8tKiooRssnJPFDhqQjIMFx+wUS
	UlmQlcqPY6JVivXs/0FV4wAW4VCdY5sJro75CLHFQGCX9SZ34zf2Zg/fqS+GhT3rOJ28CDo5A95x9
	+1GOlTOm60KjCOgoP8xACyW/3hpGM4Y265jlg2Rw4kDlJJU0nxxtJYnidnknDEVrlDNSI2yJn+V/M
	aC5OdkxZXVvtrLDSM01em3Tj3lIQ5Y1v3uifRQcd4rxGKKQu2S/q0L68QyJ4hYhTS0XKKYBAg9JBi
	vT21G11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwINi-0000000DcFg-2RHF;
	Wed, 10 Sep 2025 10:48:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwINg-0000000DcEM-2ZJt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 10:48:53 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso337810f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501330; x=1758106130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+N7hk82kSw/hD5RnH/Wdj/jHeKN7m/X8ltb3+xi6FX4=;
        b=fVT1kRWJQ54h2eUzzLI3r8L1dg4f/Re5eR3weDEA8fKqPWb+40FaH0nzD0DhMjgp9P
         39AYD5eST5sPgtzYGIeQdT/EOrT5ijkQDibE49OYIKMFigxVIZGKlw+gZLJYOkj1x7mn
         5AzdTpH7ZVXP5+xg7LK/sHM4Ry+a8KIBjQ5+xnBMQ5D5U9yMDnA/ga0WM83M0s4XxS/+
         WWYT9/mdM0EnIWuAJkKZfPk6mlm1C3g88hu0xYgIc3Xq1JkhcVbdkb9VGwsipUNN7g3U
         zBh+DVHyhxt630YX1LDw1e32Tl6/bF0Ng5cNPMkboC3aU7a0NgjiJHAzZitY+CK+9ian
         1Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501330; x=1758106130;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+N7hk82kSw/hD5RnH/Wdj/jHeKN7m/X8ltb3+xi6FX4=;
        b=xDXbwJ5nSvP5+fT9ALU7AfthPRxQrvJ7POEgTbEM2Otrb5E4Ya6J1uMA2XOfUVEdhZ
         xGPnj3+jD9hKcLVi+AmYv7oRDLIy/KG0guUTmwBLO2fRVKfA/KMlfkX6+kyAg91Ta+WL
         URogbl70oK4c4Rg4c0/lhBmaWC9b8AqesLrd3aOC5z2apLwNYZupTKTsEduqhDbdyqx3
         NYtvJKmvLa6OTXNpWhvmj5DzixzKn8egh9IPZvXAmKVn3MEk4/as1JRpj4ZSVeNasAAh
         Xun7pgoGj50cweyz18o4cj+YFHG5zsJWKJbkX1sik74XSpkJ8AvKMnBfNmJ01mnGKWGG
         612A==
X-Forwarded-Encrypted: i=1; AJvYcCVK0NjZMxrQKWI2UKyKc5Gu927JMqWcBe6I0egEvWbQkcR5xCx521kSs3xV1G95NGSwTTDiwFk07XEh4qQTW+ac@lists.infradead.org
X-Gm-Message-State: AOJu0YyrwjQONZFd7RUAVFC7qeEwBxwIkHNd7gq8C7g98xnuXfCWo8eZ
	NWodIgRLk8CpVpWnVouCnPgRA1bS1aJ36g7aNA7gbQcXIvWEUj59BpA9i4wcyA==
X-Gm-Gg: ASbGncvl7Y+loiSaktIovupRV3/C8jZ11jXbKQ3hJUBVwXSvmTo3HUat8K9IcZzxPOw
	XR16FEcBtdDU+KJuoKppT8GhdANllBWQjxoOv5/BS+r0O+szuaAzrkDAXxmM/8Zrna7NtEnZv7g
	zhO8MAMO0WNxfAtQoiOZHQS4n9Z/KRikYL5MiuRJwhJBbpyvIcb6ypepTvDGtcAw4mzAyWVoV7Y
	Opt0JjNmtHYiKxyaXrNT3qrToU4Np8ZsKFbfNS8ZLEZbp7YqRMJeQAmW1j/GR/Vl6yFdf/d1x3g
	eVpkQ1/ATOP+upaG3Smx1hyGgTbCL7dTAattGWjWQU/t50MZnqCDz+TXxJhxVXJCuybt1JebJBz
	WWKVKCCMdWVn1f6EWekvOFUOecN7+FVa4AStvip69ZjMpngN9H98kNTslL6TWoxA=
X-Google-Smtp-Source: AGHT+IG5tS3kYUiCCRtnanVvpm0dBMkyeaNotcMroSTBo+RZ/HHESf9S7ra3pDeqhyi3AeZM8IcVgA==
X-Received: by 2002:a5d:5e92:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-3e7428f0fe6mr15632685f8f.16.1757501330343;
        Wed, 10 Sep 2025 03:48:50 -0700 (PDT)
Received: from [192.168.0.100] ([188.24.124.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca0e9sm6821205f8f.25.2025.09.10.03.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:48:49 -0700 (PDT)
Message-ID: <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>
Date: Wed, 10 Sep 2025 13:48:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
 <aMEgNtjcy1-NuBds@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aMEgNtjcy1-NuBds@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_034852_674597_C1D46EEF 
X-CRM114-Status: GOOD (  18.95  )
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



On 9/10/25 9:52 AM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
>> Hi Sakari.
>>
>> I recently left Analog Devices but I will continue to try upstreaming
>> this driver. After the upstreaming is done we can switch the
>> maintainer status to someone else.
> 
> Ack, thank you.
> 
>>
>> Here's the output for the commands you asked, provided by my
>> ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
>>
>> Do we need to fix anything based on the compliance tests?
> 
> Looking at the errors, it looks like some fixing is needed, possibly also
> on v4l2-compliance side.
> 

I'll take a closer look at the failures whenever I get the time.

> Regarding GMSL, are the image width, height or mbus code used for anything
> by the serialiser or deserialiser drivers?
> 

No, not really. All the information needed by the GMSL drivers is
provided through get_frame_desc() ops, and there's no fallback for the
data type, so the stream format is not involved at all, but as far as I
remember it's necessary to be set properly for the media pipeline to
pass validation.


