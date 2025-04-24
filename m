Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A30C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMDSe2gyY7VT/4LTz9u2YpY5KEIDQEp0d0WnKerW0I8=; b=WlCylxfGR4/k4wJtWJF0w2oVM1
	BpgZDtU0Tz+uoHFUMpX82FLDcD/Y3PgrBC6+rqIGAja9TW+1dgS0pnyzbpp2U/QQr1DL2mYBaXAFe
	+ZAYfh5bUyjC1oibHvRYKdZXc9XtcLUNKV8kmy+tbX0R4ViAhtaeywUW1804mED5mdCalw2igNYuo
	wx02Pnq+33rmxogJD+rbsKOCwbyrAV81/oVqK/nw5vqC3z5OyR/i0WFeN+8nDqFrpfKGQTxP44r0S
	5IVg/GoJ1YZesdEg4ui728+MVDPLDVNvhftEvuiw+FLLza4UEl+hs+lFckOROs2PqouLsz+qLbwXe
	WzaobV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zYC-0000000Elpt-002L;
	Thu, 24 Apr 2025 16:35:48 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zGE-0000000Ei7D-2CbB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 16:17:16 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72b0626c785so1056947a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 09:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745511433; x=1746116233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMDSe2gyY7VT/4LTz9u2YpY5KEIDQEp0d0WnKerW0I8=;
        b=krotWDFTh5/uwh8wBUZZrOkG11hT1OrLnockQeegl8z7j1LcJ21Dx9okNk9F6EO+l8
         LWD+oxSO8pBxmPFOBZ9EipeoFzW6ZtXfVYJkRGTri93NIhuytU6ANQID4tSvFwFkyCWl
         SuJX6/veSLghaUhDWL3gvUhVALrE0ASuc3ZUZSrWZgpIhoeFTlcb6B7zRDrractRuMzZ
         mz14QOu15ZVO3xxg1SWCrPqY6TQMWvU9m2Dr1oAhVf+VAw9y9AUTdmqHSZvUNCjpVDYu
         noMTDBqy1wbmrtchurSCYGTsMPkqd834LVkTobdw7/U3SkIsIiHUi190GhjFBocD+5ha
         d5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745511433; x=1746116233;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMDSe2gyY7VT/4LTz9u2YpY5KEIDQEp0d0WnKerW0I8=;
        b=gc4s2J96VxYfS2IKu1ZfX/QFw7WTfC958kRSMexAisa8HT3cn/0GaXvA1+cSnl2y93
         ySrna25wu0NQJq7ybSqQE3SpSeTdnKgIr3MXPF7uAO9OL6XC3zVta4Wxt4FKWLk2m0yT
         W3xBNly8+vD5iw99NmSiaKGwMSY7x0PNCG6DQClGmPD44i7ZQ73/O/EgmX2AdTzHRUCZ
         wmc+3QvBHbkSfoJT7JgQXwoRFKmiaS7jUQdlnWfO8XEvmqdVBlkVQSxHoVbQNWlevR/y
         egRDQ1x6MuMFCyt7M9o8By4ms7faeKdznrHUW+tb1E++DkrdOuIvIbuk6R2dWfFh++UH
         KTDg==
X-Forwarded-Encrypted: i=1; AJvYcCXiH9QsqkhXXhwvI20lEvX9a573MJlDMDbnE8r+UFQxtItuO66OpthI3GVwlBooqcXU9ZgwgzPV5YjU4bZ5mVCK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/iWi6MDVa/o82DJyzZf5EYvfg5uARgl0srQnM66s30oW5Hfy
	jyJ77y4L4JAcVDM9izwsDpG3KwHSg9+BsBpwtmQd2U1sztN3uFGtLuqm8vR1TN8=
X-Gm-Gg: ASbGncuSfkT22SEInxAkk/aQxphCtG3oOxHOujozsV1sfyhBSCvw9b16U5oxPx8CenM
	x2FBO64dgFw+G7kA9euwQPfJxfUOljNooDdG/ROQP1KkrzX1duYlZDxPc68KQ9jMHoi8lnz9jHd
	DdJ7rZrN1FPeX4j3TndT15kv4AOnUba3H5s6tfNNYZXc9s/tY8NUCOb/LvBsmJ2OgZ66+UZSnx5
	lsNyeceARcCasRyWLb50iYA2MWl8KMbxDWzsdWFUuBWJh+lVzJdsUxEbZrulSyw6eawE8UBKbY1
	9aLSA2q9oQvcJnsQ5L+u3ICH3iUzeu7RdNdlvkGSAH41eiASHfnKbg34fiPX/ac2tp4ux2y9ry7
	ZQoBuL9p9b7Gabfe+Vg==
X-Google-Smtp-Source: AGHT+IGYpdBfV2Zzsk0/8jMa28e3BnEWDecgbttEk0HlgDIzoWmi2sopZs6+yVh5h5dJX7VRxbT0tQ==
X-Received: by 2002:a05:6830:2586:b0:72b:872f:efc8 with SMTP id 46e09a7af769-73059dc7e88mr305240a34.24.1745511433030;
        Thu, 24 Apr 2025 09:17:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d? ([2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f188882sm291036a34.5.2025.04.24.09.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:17:12 -0700 (PDT)
Message-ID: <ab3dcc4e-bb85-4a5c-82f3-36bedec3e79d@baylibre.com>
Date: Thu, 24 Apr 2025 11:17:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iio: adc: stm32: add oversampling support
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250424151604.626758-1-olivier.moysan@foss.st.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250424151604.626758-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_091714_565407_4A9B0724 
X-CRM114-Status: GOOD (  12.39  )
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

On 4/24/25 10:16 AM, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing the
> data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution, a right shift
> is applied to keep the initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2^n ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio
> 
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> 
> ---
Don't forget to pick up other tags. In v4, I already gave

Reviewed-by: David Lechner <dlechner@baylibre.com>



