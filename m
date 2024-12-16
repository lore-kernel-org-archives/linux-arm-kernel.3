Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC5DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqFXFmSmKLaSa4Vhvi8HNeoTtmpRApxU91TTMrXkHTg=; b=EE2qsYxxGUbZ2XerfOigyyZS8Z
	P8wh51J6tIc4X/4x9aKk+h+dsz/gxQ4AGNSGjuHzN9JXhq3S9B/4nAcR3GUCA5nXjRMTMbyJDiJDD
	5d1hkFXBLLGLDMgxRivQglR56h+aSQdb1IRYzKswDRVaqBwb3Z4b2xQffBj3W1GxuIXIh83d0dtDh
	iQMxwKamt0f8iKF1mkwzYSlwLESzhc3iE1PVFG385BoJfULE4Qt82BRLPgqrLPzE9ilg6PsMrTrUj
	k53j2rgsDuL01PnNNYQ0qfTr1kEV4o2tu8A+F/4ga7Y/UNg5MU/r2d5Mio2piIxlJSzuCSFw0lPlW
	guGifqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG99-0000000B0Lf-3VYw;
	Mon, 16 Dec 2024 18:48:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG81-0000000B08k-2cCG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 18:47:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-218c8aca5f1so2516115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 10:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734374857; x=1734979657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CqFXFmSmKLaSa4Vhvi8HNeoTtmpRApxU91TTMrXkHTg=;
        b=Cb6krtb8NPL945U8t9aoE47NmJ4p+DVLebbxZip9nhPGlRXv0DRkgKI0HbetGAUu4Z
         Qi5UtKWi4LIx+MKkGkhZwVbvw7GZYtISoIUYrxvWk8GUFLWAd5nbYt19FWJfQ+qWAdir
         gyh+UeV2Mi9Pv62RXcr+TAaz5wMzADlHqagiBnpa3SMx02BTUc7dAHc3+wecIjnIkrsd
         lU6rXXHjMkqnNBs//X9a+I37i/GGVLDauChBxgcVb1tnfO1AaBoaa7fKjBfds9NY1kQ+
         Yy5G+o32tGRPbd1Fe21vrCqvG9HyvzUbGoXNCa6XgcMfL3ruECQl5qH16YH4gDbPxARm
         u0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374857; x=1734979657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqFXFmSmKLaSa4Vhvi8HNeoTtmpRApxU91TTMrXkHTg=;
        b=DgoA4+TzG+bER+ctiXqpxAXescVlBY1NwyjeDvzqbIC9YIY92IbvGDDH1Lv/dEtq8g
         3pcbN/+rhNLXyECSDWf8e/vH7MO23gZyegMNalu8n/7AMCo32OhQhRewMGpPK5qy61aN
         4UDL4+wORwKZe5ukUHJ3xnLwSIwhZMWWJYUJtRtaK62C/MOpt4zdsHh8S5+PK0WdVI+m
         Hu3U27jTZLAlDEaq8kcwZ/xEiHS1r+Fsnx5YpebmzwI8AaX+TvQMkof/c24o1r61e7SE
         L6S7c6j0IdkznsAhE+5+CgllqEEFpmI3/UIlJC9FndOZxNJF6gE4ss893UxB2/bac4hP
         UUNA==
X-Forwarded-Encrypted: i=1; AJvYcCWsQItwrGJfLkzowS8USA/OXTmsDymoN6MYY+UuJu1NN17p6m/dXpIxgqopMMUomN/o2Wv3vuTvuHpcw/SE3Y5M@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ1fUqTb8BDriSoqjVDmgFCcl3+H235rxCNfyzc8TqnD5RTpEp
	2XxGyGpllsCFACBa3oKHIi5GUU07UFtM7KdtMoVFOe/qCsMM6I86
X-Gm-Gg: ASbGncuEt7Hh/siHshjYAND5kPnCnMIyx3sPC4lJR8Lm9pf8fAdHY3cwoaWgb1Vwm/4
	PxyAR2gytMZAXjTzmgjoaPDD8qv6IZm4As4XjgGM0w6Umbrp47i8J6uluEMoGKfq7ljnhiDjgo7
	BoAuUTuZbCJObzFRkFu5xRwYGGK2favnkTD2WIWXXKbOAMAWy7dy93Ls9gvOtquscZf+JeHCsC/
	EkbHh3WAGsmS4p+1Mcl1ff2Zljf2KUpjpS7Ru818zaAMNN+cOb8O+mHg62Z9VP92Z52UFbGXrph
	mR1MsEOflZMQJ5E/yLbbpP4ny+DsuA==
X-Google-Smtp-Source: AGHT+IEIIrPoJh1GXWlfdX3/QWjWvj2/h7CMhTzjWUDIMndNQJ5On8mQEgeMF8lUXxA39smV+RBsqw==
X-Received: by 2002:a17:902:ce8d:b0:215:385e:921c with SMTP id d9443c01a7336-21892a7a2d9mr152417255ad.51.1734374856981;
        Mon, 16 Dec 2024 10:47:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb353sm46475315ad.76.2024.12.16.10.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 10:47:36 -0800 (PST)
Message-ID: <a010366e-b911-43bd-8445-e893e11fa51a@roeck-us.net>
Date: Mon, 16 Dec 2024 10:47:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
 <20241216175044.4144442-4-ninad@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241216175044.4144442-4-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_104737_669472_2E4467FC 
X-CRM114-Status: GOOD (  14.12  )
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

On 12/16/24 09:50, Ninad Palsule wrote:
> Add INTEL Common Redundant Power Supply Versions crps185 bindings as
> trivial. It is trivial because only compatibility string is required in
> the device tree to load this driver.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Krzysztof had Acked this patch. I don't immediately see why you dropped it.
Am I missing something ?

Guenter

> ---
>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 73a49d50c4ef..7d07b08b1459 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -151,6 +151,8 @@ properties:
>             - injoinic,ip5306
>               # Inspur Power System power supply unit version 1
>             - inspur,ipsps1
> +            # Intel common redudant power supply crps185
> +          - intel,crps185
>               # Intersil ISL29028 Ambient Light and Proximity Sensor
>             - isil,isl29028
>               # Intersil ISL29030 Ambient Light and Proximity Sensor


