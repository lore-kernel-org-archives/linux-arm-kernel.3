Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61EFE67802
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0leqICJyTXfsj1QTNtYhe89s48cLc/TfjqKKmksT/s0=; b=4AWOru64aG6Kd4jDO3NRU3HSnu
	F7Lyv1wJvrwqBGrXNoGRnOiQMjGhKFGXpN9LWXALSxcB33RSjFW7cQaYY5bTuCPNXOCcS4L+GU3it
	fyPMKRkX5ykFfWd4eOpYrZoJpjwVNAoIaZ5gL8DBG8y7f3ciCRmQYCNNlFAVw8us7faAILeJSmIx0
	1zFBEeZSyO0WiQSWPvpiAOaXQSZD5WHFVXQmB1R018Hqz1sGJdgfbEodVJjQKAUUYikp20Nozlv/l
	RxySmFlTtQS4jn4EOsOrujaLXYBrT5Bax33vK6qjUmYm8oDrIt15CZGRzijut+ZIXatJSxrH0TW+/
	qxhfrxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Fmc-00000009v3z-2FgA;
	Sat, 02 Nov 2024 15:11:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Fkw-00000009uuf-34nl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 15:09:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c803787abso22453905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tweaklogic.com; s=google; t=1730560178; x=1731164978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0leqICJyTXfsj1QTNtYhe89s48cLc/TfjqKKmksT/s0=;
        b=hZ4E2T93BT8JConU7pdm6kVLpUGoh19WBMm8/lQvCIr6iIxxa+US7p0mhLxkFzaYUV
         GXTHYlGIAT5NkWBerthpOE/tR3Ckd7YmtCRmp84TeMIUdFhFxVEPviATnPQJSNMvpuWF
         JcwqWMgpjj8J5mRe72zBgOrrhYcXdsH3LFAGW4gdpaJXuH1NexafsZX//Xpkiiq6F0gF
         mDHoWM9v1+YIXd63jGAGnwpNAVdJxSKYc20uYmORjZ/n/xkLyVmCtmU9cT//ujXd+jaH
         BzV3/f82a163NI9nzp6NMO7S9cAonOtc7VZRio7mBuLQyg1vChvYFOy/uFI9HJmD/urB
         7DXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730560178; x=1731164978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0leqICJyTXfsj1QTNtYhe89s48cLc/TfjqKKmksT/s0=;
        b=j/zhvfsZN73ivy9Npv3pDIGsjyblwOnlrouAkopk6JpHy5JSlJGLis5967KlBbLKvE
         p5h7iYFJIwuGVGoIx8W2McdTBzhqab0xkhAtkZ57s/pwSZ6auqnStvbCWc3sPq9ZiEcy
         96vIWUGsdg66kjDB7+6Q7aekoeHzCjv2V5m13aKw/4Vd9DPYmQZ1jWeRwEkn1P2xQUGK
         Okyh3tQaW+AHjp5PphAu7oZmttlP4GRuIjzdSrHRlR+5LJmcI7ZCxUnoJCYl9n+jST/i
         UY33B8bUkpvmu3QSDRYB5XhKXHnqnytinI+6gr/fw5FkneFV46yEmQ+3jXpkNnrgYhkK
         1jfg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ieWWzJ7WDqVh/XRJ13n4VMkFBz/3/hBH8T2Mu1haoVTzRd+hKRLXxW3ncGCnXRyq4p7bFEFuv2fmu/zHe3sV@lists.infradead.org
X-Gm-Message-State: AOJu0YwUx2wstP++N6RdIhF/rGxIKkLEM1BLm4MnJHTbotXTQK3KbbEr
	SYrM9viBEl6iIhknL1GftambxwsyIQfZEUOtXCxTFdflPd9WPdNFGAvAqgic5k0=
X-Google-Smtp-Source: AGHT+IGtMCKhO/lNmhTUeMJKCu6Ot50mbF1xufreQMYqVzRQWGDn7Q9Kxh30qqU37dlU6/vepIGY0Q==
X-Received: by 2002:a17:902:ec8e:b0:211:2fb2:6a6 with SMTP id d9443c01a7336-2112fb206e3mr49239715ad.24.1730560177752;
        Sat, 02 Nov 2024 08:09:37 -0700 (PDT)
Received: from [192.168.50.161] ([180.150.112.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0ed3sm34953685ad.216.2024.11.02.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 08:09:37 -0700 (PDT)
Message-ID: <43b07db2-6856-4dd2-8616-560a24d9f09a@tweaklogic.com>
Date: Sun, 3 Nov 2024 01:39:25 +1030
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in
 apds9306_write_event_config
To: Julien Stephan <jstephan@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Dan Robertson <dan@dlrobertson.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@amd.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
 <20241101164118.687be624@jic23-huawei>
 <4e4e5281-d489-42b5-b358-c44958cfa4f9@tweaklogic.com>
 <CAEHHSva6+Br9rXE9n0wqXuwQqetXN=Ae5vg0rxmPRfCVdw9atA@mail.gmail.com>
Content-Language: en-US
From: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>
In-Reply-To: <CAEHHSva6+Br9rXE9n0wqXuwQqetXN=Ae5vg0rxmPRfCVdw9atA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_080938_798671_666FD707 
X-CRM114-Status: GOOD (  19.01  )
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

On 3/11/24 00:59, Julien Stephan wrote:
> Le sam. 2 nov. 2024 à 14:21, Subhajit Ghosh
> <subhajit.ghosh@tweaklogic.com> a écrit :
>>
>> On 2/11/24 03:11, Jonathan Cameron wrote:
>>> On Thu, 31 Oct 2024 16:27:08 +0100
>>> Julien Stephan <jstephan@baylibre.com> wrote:
>>>
>>>> Simplifies the regmap_wite if branch in apds9306_write_event_config.
>>> Applied.
>>>>
>>>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>>>> ---
>>>>    drivers/iio/light/apds9306.c | 5 +----
>>>>    1 file changed, 1 insertion(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
>>>> index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a630d42fe9b90438dfe8 100644
>>>> --- a/drivers/iio/light/apds9306.c
>>>> +++ b/drivers/iio/light/apds9306.c
>>>> @@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct iio_dev *indio_dev,
>>>>               }
>>>>       }
>>>>       case IIO_EV_TYPE_THRESH_ADAPTIVE:
>>>> -            if (state)
>>>> -                    return regmap_field_write(rf->int_thresh_var_en, 1);
>>>> -            else
>>>> -                    return regmap_field_write(rf->int_thresh_var_en, 0);
>>>> +            return regmap_field_write(rf->int_thresh_var_en, state);
>>>>       default:
>>>>               return -EINVAL;
>>>>       }
>>>>
>>>
>> Hi Julien,
>> Sorry for the delay.
>> "int_thresh_var_en" corresponds to APDS9306_INT_CFG_REG bit 3 (Datasheet: INT_CFG, Address: 0x19) which
>> is a single bit value only. If user does "echo 4 > /sys/bus/iio/devices/iio:device0/events/thresh_adaptive_either_en",
>> which trickles down to the "state" variable, do we really want to write any other value except "0" or "1"?
>> Correct me if I am wrong here.
> 
> Hi Subhajit,
> In drivers/iio/industrialio-event.c, iio_ev_state_store is actually
> using kstrtobool to check user input, then gives the converted boolean
> value to write_event_configOhh ok, that's handy.
> So state is a boolean. By the way the purpose of this series is to
> clean up code and use a bool instead of int for the state parameter.
Thank you Julien for your efforts.
> 
> So new code is equivalent to what was there before.
> Cheers
> Julien
> 
Since it is already applied, nothing much for me to do here.
Regards,
Subhajit Ghosh


