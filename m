Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F54FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CU2BZNsdQalnMnKvhf/1pSUDKAtqWXZYwURN0vGgLo=; b=Lg0qNiIN26gP6URqFYyTtvEDlr
	vUJANJCfz2J7hvYZhbFYjetiy1i0FWLGm/1YHLa31raGirG5WyVrdVpOlhD+IjWUOQmmSdBG9HHQj
	j7BJBZex1HZJKES4ceXnAaWDDnjJ4g9jhmMTNM5CtFf/pDTPMxxFsBIL7p+gU8IXhd4bn3modXfDc
	us/vBm5wNqW2r5EBZh9vGOXsJF7V1BnUFEXkPRcM1Reg75Vt3QartVvEEDoUDC6L0GxAVHFFlhV6V
	ZSSIgFYtHgln4QALWmJsEHPvmw20xBeAcZb6x49IMe3f9wIev0aSxY5dOFfC912EnBLkkUvY5TMpe
	a7MXMS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MKU-00000008kVJ-3NYk;
	Tue, 22 Apr 2025 22:43:02 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MIb-00000008kP0-3tVD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:41:07 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-72c27166ab3so3745832a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745361665; x=1745966465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CU2BZNsdQalnMnKvhf/1pSUDKAtqWXZYwURN0vGgLo=;
        b=sQFLMAGQZarqKSYVcxFEkpODv2TorgMzNycGHYWcR7XIC1Aq/U5C6nd/F6BH6ntAOM
         M9dXhxK8xfXNyXEBH7Lvm68UKuHcjI0NAKBHX0oX4At0DIbb2bAIZXOBzxDsj5KhmOGM
         wWoNFnY0okqC6KpYxdX7gOAE1dmZXqR1sNTlgspkiwoZHlx6NFfadgm5QuyJRlns18cJ
         KgSe1WOTb5c9Slp3Q0mmcdqImFpd2226nQ5JrtRUXLMLpuoY7DkUjPSOd3EVGBT8C2Zs
         lnfW0dOTpCBpOb+hXx3W9g/Iz1hMTaGOBdPJgXls4rUaAWnxRYsh3mOocVBhgXrVPnaa
         P2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361665; x=1745966465;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CU2BZNsdQalnMnKvhf/1pSUDKAtqWXZYwURN0vGgLo=;
        b=OUrKsbvIIBiMBqhUSrrt0nMGjIyTpUjYy1Wz99CJkhnk69v/dlNbC90nt3pRqooHR4
         def94/pYSBgCErCBVqmRC7T+WzGU5APvNpHTZcvMNet6FC2Ihg/xlwVtNrfl6BmkYjb8
         7LeHQ0uX5I5BA45Hyqm6NOEYTKHeo/GGO81Sxxyh8OHF0zs7tlMID2kJvAbW6Uyp7lQ4
         7sIPoqmxSVmENJqs4m/KaLKg3qt8dMv/PNPQvlBmdfLmpc5nKCX3gdc+kul8TDOmR3hz
         X3CB3sSk13uGeTrV/3LXkt4H09kn3JjTCuw6zhxUdpqCXmP4vUAcFEKUF6JeKYhwYH7C
         LwWA==
X-Forwarded-Encrypted: i=1; AJvYcCU0JZOcbhoXMTCREUF/8hwrkIKK8RgJNeUkdj7J0qnpqowaPgRb4Q/0Ei7mVdEP+6JV51E9N+EP98pnPNkjfdbE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/S/QZLGRy/vKZAghf7N+VrDthboL1WpJ++r7lg2MD1AzO2a18
	VIsMi22/Kt8sPaEhTjMtwIRFxzVVZp0zAMrn6UpPYKgYNIgeKQ0PI0yL5lE4VpE=
X-Gm-Gg: ASbGncuA54zT13+olDn5CK5Dm5zjWV/RvaxRNbnh8Ql2AxN5TzVU+gHwfgzKTjCDYWW
	IBoj/zXd4UhLgipVlANeQB6IoP8050IaZ4YYEQpIUiblW1l5ygT2mpwqMgPeAqWHJ8sxY8Eq4zD
	pZzcbT16Ylk26rZUC1DS4IzJ4dOtjJgZWiuAZCkaUGqO46+kMEhAu8Bcz5hNK/m+GGJYBYa8w4t
	94mqCx7wHIJ7fmWUqNFcRT/ySl180WlGmjz3UhNKWKZLAMajyzQ58Wkp4DKUkfntkQXa+xmGP7c
	VHNWfkBLSX2QfNtb9IQ/IC/FmElmwGUpWCgsU+aIFV0cgJWHSI7KFCytkZC46V5Xy5Td8Z62bfk
	hdAHL+rxUzWnFdiDzww==
X-Google-Smtp-Source: AGHT+IFW74VOQ4Vg2SYdWLa32CZpVY1sP9GeRo1HKg02wFCgKoCAWSnBjBlMYWitwOZHz2q8mjOBeA==
X-Received: by 2002:a05:6830:6288:b0:72b:823c:8f66 with SMTP id 46e09a7af769-7300621472cmr10397261a34.9.1745361665013;
        Tue, 22 Apr 2025 15:41:05 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300489a8b6sm2176057a34.58.2025.04.22.15.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:41:04 -0700 (PDT)
Message-ID: <55f8a997-77e7-4d07-aec2-8d20f56314d0@baylibre.com>
Date: Tue, 22 Apr 2025 17:41:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-4-3fd36475c706@baylibre.com>
 <CAHp75VdqanGpwB5raE8AmH-Tmb82N9yYmhB+k_rQtc2_Zb8HQw@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VdqanGpwB5raE8AmH-Tmb82N9yYmhB+k_rQtc2_Zb8HQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_154105_966640_ED8E072E 
X-CRM114-Status: GOOD (  11.99  )
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

On 4/22/25 5:33 PM, Andy Shevchenko wrote:
> On Wed, Apr 23, 2025 at 1:08 AM David Lechner <dlechner@baylibre.com> wrote:
>>
>> Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
>> iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
>> and understand.
> 
> ...
> 
>> +       IIO_DECLARE_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * sizeof(u32))
> 
> Btw, why not DECLARE_IIO_...() as other DECLARE_*() look like?

IMHO, namespace should always go first and people who write DECLARE_NS_... are
doing it wrong. :-)

There is not existing DECLARE_IIO_ to match anyway.

> 
>> +               __aligned(IIO_DMA_MINALIGN);
> 
> Forgot to drop and use the DMA variant?
> 

oops!

