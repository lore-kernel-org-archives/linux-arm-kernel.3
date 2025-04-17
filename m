Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D01C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 20:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkhkFAogJf6rcZdrKyxj+n2pOOqU53PozCIK3xijJrY=; b=XVmdBmxXnZCU5TBoEqzc01QPJv
	/B3ONGetA4hcUXNsOVPIwD9StUwEamO67dB+vs+WPA9SohR/cng0YlcyxzCXkeJthBUW2trCEvGpG
	C7gvXJWbcgmPlZ4caydfRinxh5n/rg5vm+u6XCjA23zGLozvp61GuPTLMCm9XjWGSVLw2YEa5Fxvs
	Nby0OZ6S/uZQmkKkVp1nnvGDBaH3O0w217kYK0lKTWekOkFrStt73BtMSE2YMteE3oG+Tg7XOQP9R
	WCAUSy0oEkYRQz07phYCKBXs2hpbqCDLNcGpcsN61gVQaaRgg5GXVKnFJlbulFFFfrZpgWLart9/E
	SskIQ6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5WC8-0000000EJYV-3yP6;
	Thu, 17 Apr 2025 20:50:48 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5WAG-0000000EJOS-2dZY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 20:48:55 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3f9832f798aso731870b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 13:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744922931; x=1745527731; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkhkFAogJf6rcZdrKyxj+n2pOOqU53PozCIK3xijJrY=;
        b=O2Sz4rc95b+hEzC+cmjdXbg5rVZQmmP74DVPIOuezm6bh5MFJFUcPYawfkQ+o7I3Cn
         yiMbcAPT65Kjd1UBbjk9lWR6Kewl50B+01u7CS0pvG4MYJJo5HS8EjsPFdA2lVStNc3q
         eTwYfsyDui+jqpkj3R+Bqz+UUR0zD97ELCinU9ijBMtHWkYfelbSqmRi1RZ/iezIOlzs
         /5pdjEUe1sS6XkRQHND0RqerftpgnWZpeMiCvtL/CYjcQMr7A6W548SpiCT0XpiNa2fr
         pXgUs6k+lip9jZJdxuTRqrItjCn+fmlgfIB6ct5cKcGw7L1g+en82lzkqtNRQh+7GsFg
         Zpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744922931; x=1745527731;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkhkFAogJf6rcZdrKyxj+n2pOOqU53PozCIK3xijJrY=;
        b=gSqrCtragEEwGvPRmBJwLs9SV0TENAqIYMWLUwxihPP2Ubr4pGqPJgq9nxfq1yDD9s
         HS42VMrkT09X92eCMZQJ3H1NuFnzcF8kLBCiEh++fW1LD+eCfpcG3c/DxllrKpleplI8
         Ngc81xcgFG4V3RHzbhrniUBFcohpGrR137klZOdNZbsLvYFcQRY/xYaxNTM6MXapKG4/
         x00QSYYz9n56URj06Kl9cupbUOpM5QSNzmgUAkWoeNFOyLHUN/Gpma5014QTzZFEAqBG
         3nR+4Ip1wkPeJWwx4NfgISkBSnHrPajDKgwEwuHSHpj+XhU1avnVq8Xor9lv3td47NBL
         2+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX7J8LOaW6LoaM7BWqYO5uXSvJdtXEBtxul1aGnhl3OfIllcse4MsMpTcW5tJN+fxb9tl6TjK5d7M32MP5LB6Uw@lists.infradead.org
X-Gm-Message-State: AOJu0YxkGIDkpUtL7CVqmK3y2DzBboFYUPy7rUohbf8St0o/DTRV0xzX
	5VKp/RDI5oeY0K3IvK61iyWDkt/bHxrQ2jLeqw/NgvlSlbVzAcZOA0gQCV5uNKg=
X-Gm-Gg: ASbGncs+nFol1U0J5YMEypG8xy3piNO+hYgKgJgG8mcVs/oVowdV76DN07CnTx+6ZaV
	sJANusFnxb2RMm+4Dm5cJw9N1ichN0LUq8g+D9Avcc+/GWe8vhi4H0k9J95zAiZ9FNyPh+zSSvC
	0Nh2ghBVv7B1jXGOdGqbcOZI4mtbQHSyB2E6hSvU9l55kaoaLYX8tNS5ceY6Mubr2du8dZxpY+S
	Y15VZheL3VM7GmsBWxlgmO6Hu5jakVLCoEeWYrgbrkJ0xL7Rnh0lE5TtnAfWHwJUmt82Z7HwF4V
	6/MMdVYbZztMPYy7PFI7PD7PkTc7PBhSO+qgc5GFF4dn3l3HEh1AvEWvP6BkptqZSl1NJfad94T
	roNk8mpjccB5sCosdpA==
X-Google-Smtp-Source: AGHT+IF7ZjPtLD+LrakaPKE8P6Ie7Z9AHBDyOGjvviQeXkjr+Jv27cdNwkf/cTlSFR3UJfutg615hw==
X-Received: by 2002:a05:6808:4a84:b0:401:2e2d:cb54 with SMTP id 5614622812f47-401c0c3f94bmr111311b6e.29.1744922928611;
        Thu, 17 Apr 2025 13:48:48 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d52135b8b4sm115918fac.17.2025.04.17.13.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 13:48:47 -0700 (PDT)
Message-ID: <651b1f91-fd5e-4d59-b78b-fdd7f89247e4@baylibre.com>
Date: Thu, 17 Apr 2025 15:48:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
 <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
 <f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
 <20250417184429.00002403@huawei.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250417184429.00002403@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_134852_865671_C114FC1F 
X-CRM114-Status: GOOD (  16.31  )
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

On 4/17/25 12:44 PM, Jonathan Cameron wrote:
> On Thu, 17 Apr 2025 12:07:37 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 4/17/25 11:59 AM, Andy Shevchenko wrote:
>>> On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:  
>>>> Align the buffers used with iio_push_to_buffers_with_timestamp() to
>>>> ensure the s64 timestamp is aligned to 8 bytes.
>>>>
>>>>  drivers/iio/accel/bmc150-accel.h | 2 +-
>>>>  drivers/iio/imu/adis16550.c      | 2 +-  
>>>
>>> Looks like a stray squash of the two independent commits.  
>>
>> Oops, sure enough.
>>
>>>
>>> ...
>>>   
>>>>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
>>>>  	struct mutex mutex;
>>>>  	u8 fifo_mode, watermark;
>>>> -	s16 buffer[8];
>>>> +	s16 buffer[8] __aligned(8);  
>>>
>>> As for the code, would it be possible to convert to actually use a sturcture
>>> rather than an array?  
>>
>> I do personally prefer the struct pattern, but there are very many other drivers
>> using this buffer pattern that I was not tempted to try to start converting them.
> 
> For drivers like this one where there is no room for the timestamp
> to sit earlier for minimal channels I think it is worth that conversion
> if we are touching them anyway. 
> 
> Jonathan
> 
There is actually a lot more wrong in this driver, so will save that for a
separate series.


