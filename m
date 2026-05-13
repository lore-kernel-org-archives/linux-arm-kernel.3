Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95243CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73hvPWQ+wdtYrhL6I0NsaqzzCZ8hyWVDUJfnT/gOLyE=; b=GVEUprEvdjqe46aR7SxgViyHET
	QKZe706yNl5v8xHQOCg6LbO9WTKdGc7G6oOT05JZhtwZKF2d+BCU8yMGmtg7FYESr/u8CDkWrLF5i
	4FtK8wum2LFK/mY8tGZskEEgKJgRdSbEEkWTEpeddqJcrpORj6IxxmIjPXavrOelNYnN1zCkYGP2M
	dBaeZeh7Wb+BM1C5UD9+/6RjkrDA5e4v1jsPY++ei64hRFK5ABYJKSB3vya5Paw5pDpr8HnpyF+Ag
	0DLWHsWl8TZxq46cfsMaX4qRV3zZ/Zi45Km6dIZ2t0s7ai9lJ0FM25K6XJ8mjbXaCubuDMRqtOSsv
	g6BkBRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCk4-00000003G02-1Gqt;
	Wed, 13 May 2026 16:47:28 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCk2-00000003FzO-0KK6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:47:27 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1332772f6b3so5134026c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778690845; x=1779295645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=73hvPWQ+wdtYrhL6I0NsaqzzCZ8hyWVDUJfnT/gOLyE=;
        b=VOHiV4RqffqSAhXHGMoH9uQZpmXpi+QGBsZKEhm12MnuWuzbX/tCXTY3OFRGfI/JI9
         cIPLEE8HRNnxmlQ1LZ4GkDtsKyd/wbzvFXqSFgXIOwhyQbVaHQCjBl/zbDeoKFbkGly/
         SI8r1uUM3k/4Ie3zTsX5ooBaBgtmUjaHi7BC5OXpd/RCBz9CEpb9zoWMvhzIrTdd5OJN
         ej2Zib/Ze5HmGqP5k3SFbnwCsEtualpyybpPM5r+YqPrX/H7nISIKnu5T5KRZWAlypJG
         /Gtdl7MOVZFFF+rFpOpmOBsemjXsdiMKcKtsctfBMqVZWXciuwBP7lNf3O8dZm1Zc62k
         c2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690845; x=1779295645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73hvPWQ+wdtYrhL6I0NsaqzzCZ8hyWVDUJfnT/gOLyE=;
        b=OK7gZc8psxePC/ZVzZ0ldO5KP2FhAjRrqm8iHtf1R4OTZT00C7wvpHcYPE2lp3CNIE
         0Rr3pGMTcH2u53wvtdcdCNI/jq1pFO1twFkRVLqyzVnbHmReKPEmD/3M2de/GrnWFfZ7
         7VaLsR+uRWcXodJ+xuf6bcZ4UvCiHJ970cHlpOpWwelhSVd/7GUv+xgjN5qcyIqfYm+C
         S4OCojKo+JDcsyoD5M5kBEzYuKUmwlRwOiIzWt6g4Hbz4fK6Zx4AKXB0rR08yha57mfk
         7nOYGUlVs7Ivk7sqWRien6lp3glqkFxAqUlODGKMmISK1oIFYX15/+HnGYLHFCJRYhez
         p5qw==
X-Forwarded-Encrypted: i=1; AFNElJ9RUmSyaU03kmq3FWYGOEPkwKPBkLH9UFqVsHMALbAzVGD3UI1E/JjO2tq6+ES8nqy6ZiT1a4sRE8g6RCKiIa0x@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoc6naNQ62YA9kQhDSY5i1szYo1H/BB9G2d+wcq7F/KjlvV426
	G0TDsk5KDQmIVd6nokjhfQU95cVnU4Ls5sAdcuLzjdAkwVJV8MgNCW9v
X-Gm-Gg: Acq92OEuzJhTf2aHlgaQ2aRdSUf7hDsSlayg4r5d2wAzsKpwIzik4zA48gWJfEftPrm
	Q4DHMAP2RLxp9lGEsLy36X6pG4SNVXTuA4sI/iBgX0HaAOOa35IPD5QJ1PlruUU1pWRXrEcK79f
	hQiHQVudY693nvDJXT6p4VUluGwFCJw2hhQzBwg0TB9pbAa89ip0rXDZkMlwiMzZzLcGXYsKhKr
	YApAL2YSUgEchlO0DbatNsFsd1kOitwidMgL8a5v+pYuHf1KgcnJnswOvbKKVmm4bYhs48r+Rnu
	HjUsRR621AEy8URVV4iqpQx7UbexiKeIQTpS38PQ5ovWGnt1dooqmJfCS3C8sDRJMYxX7gMAxTK
	9hpaKeOApxbsP68GdZq39r4QFAlLQ94Rho9NUyTxvRCWS24ysTuMRnqhqtNYVVNqd6rHnvcYlTL
	dUyOWY2s5mJOnx0dNtXs91w9HSs4wcB29Jnz0KqZ7SCEdZ6ZddsgGxP7vhBnWjQYdlY+C4qq10
X-Received: by 2002:a05:7022:6b96:b0:128:d20a:2f40 with SMTP id a92af1059eb24-1342ef3d94amr2693546c88.8.1778690844483;
        Wed, 13 May 2026 09:47:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm30303483c88.11.2026.05.13.09.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 09:47:23 -0700 (PDT)
Message-ID: <632c1bf4-0f3b-4ed8-a6a2-fc102fc7601c@roeck-us.net>
Date: Wed, 13 May 2026 09:47:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: scmi-hwmon: Log number of sensors
To: Alex Tran <alex.tran@oss.qualcomm.com>,
 Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094726_124816_D72AA7D4 
X-CRM114-Status: GOOD (  14.45  )
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

On 5/13/26 09:44, Alex Tran wrote:
> The SCMI hwmon driver does not currently report how many sensors were
> discovered from firmware during probe. This makes it harder to confirm
> the firmware exposed sensor resources during debugging.
                                         ^^^^^^^^^^^^^^^^

Then please use dev_dbg().

Thanks,
Guenter

> 
> Log the sensor count after a successful probe, aligning the driver with
> the existing SCMI client driver logging pattern.
> 
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> ---
>   drivers/hwmon/scmi-hwmon.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
> index eec223d174c0..6f1b0559d5c2 100644
> --- a/drivers/hwmon/scmi-hwmon.c
> +++ b/drivers/hwmon/scmi-hwmon.c
> @@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
>   		}
>   	}
>   
> +	dev_info(dev, "Initialized %d sensors\n", nr_sensors);
>   	return 0;
>   }
>   
> 


