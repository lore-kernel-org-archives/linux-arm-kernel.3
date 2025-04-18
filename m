Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFABC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 23:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atnsX2Ib1Wv1iIZ+2HRhddbg893c8+OuKKzqJdxz9N0=; b=Y01yXCCoJSFUXOgoDpbXcIn8qj
	YugU2sUwSDG94Em9BNgOCK6U2itzowhGMdVKawiAcEC/TyllND/rciy+DV3fQbppKct3blsO8o41u
	IfXjtJJ7tE5e5Cfmb2+8APTCDrSqjnYosorkdhKGTZ6Y2UCgcIInPmSKHd4YFl81LpJhPHNzlPrrX
	Cb4mg5pk624BjK4Z7h/t+CYAK1YWubvVD9XjxWVXjTgG0eoiGj6SPyUdowpXAEGB2CyLtCzoCTBiU
	i66rFeVrz2MiD7u6tUodmc0qiJFCRQUm/XHhtupj9kNcMbSgfUg39uFOZGhlmw1U3F7oecIh8qeLo
	FkzBEalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5uoB-00000000WBZ-2quZ;
	Fri, 18 Apr 2025 23:07:43 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5umH-00000000VwD-1VtD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 23:05:47 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-72c1818c394so1375122a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745017544; x=1745622344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atnsX2Ib1Wv1iIZ+2HRhddbg893c8+OuKKzqJdxz9N0=;
        b=oV4jYXcXMFo3ty3tFDK3XZw75zQC0COOkHfS/oQhNHRWBy7R5xSOTkSAI16hKvq3RR
         gaKWqopYuRFNfkVvFEysGFvuVE05Okzc/tGU5rXcckBs7mlX00cSbBMsXTlza79ifgxG
         rMiUTEVTvu4aba+Wut6miYoUBY3asLUJZ+ZF0FUKONXzT/viKIIvw3rYpaMzzg9zp5if
         0UmAkzyBB8RoDSzbKEzYp6DkbL6P54/F2fDViZTKB0XTINBekVRvTPQPht7oCnnVxQ5L
         UQN4BCy0bIUBNl6iOZLSczxnwzrkQfHmMieUU9C92PhfpgpWZPqenfxrd0bnBuHjdHGf
         A4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017544; x=1745622344;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atnsX2Ib1Wv1iIZ+2HRhddbg893c8+OuKKzqJdxz9N0=;
        b=ZGhtZp3mAQAqFfqScuvAMJvqba3TE64+mXR5w1rbdX/JdfBDjo3I/aZ0+EiB1d0TpH
         ZHA+TGTv7OZE7X6R/oZx8jdZXW3QFbJamZfc6f63nOVxdmsCqe42tz4fRi2nmXgz7QgV
         8w/FQaiPZwcJduaT2464XUJIPf73B7douoTVOUB270wI98GNQO5LOu8xsWkpWio0uUUY
         umxu9vSP9j1VKzEvewfw2NTWfx2KMp5cMJBbqr13d7VFbrz7CEO544tvETH29ALFHdrd
         RbYTjAUMGh/7YTpgQmqI4uj6jJUVsF1WMfWbfWC+F9F32BLJ72lLfzkG/WaiIkw6H/aR
         +XCA==
X-Forwarded-Encrypted: i=1; AJvYcCVYFyxxjT2vgwDz9CB9SGMb3WgdLEI3PC1jHcaQYZF0bnHM27WDTfIlk3gsbn+2Tm8HfqgQBBSsowYzcLIv9ETb@lists.infradead.org
X-Gm-Message-State: AOJu0YxoYYQtijUurd4s2tPXjlsgvgS5NdPGE7rg2W6iUbpqNifLIXtH
	lP6LZR3XJoJUoEi0M+yLLGyPjWRnLjyckoty1D5VRsgc5aYghbG9Ihp8IPqvJwDpk+ADp3xO6dl
	cals=
X-Gm-Gg: ASbGnct7rZRQQJgzC9+RDnDJR4FyXOjTMR2dJfQjKV4Cbg93xd08nyf0+j7Za4hri8N
	bQAtFGqFEctJ217eQrVnv9Dpzw5/t7hoVkCZY6sxppEuCFHCOv1HbuhFA6c8SzGlZ/gMArq8uIl
	EYQbt/DpXeN/lHoj/rYpaPAMNnGbhHaD7Q81Z8amSPg6UmZKBTPh5OMVGaa2MvkacrRw/sPQUpl
	alJcRq5CDb4m0XrxBOXasKriJAIwinoqxcFLmZWM/SROn0JtrLo+Glgw2iyFSn7i/qDDrVeRidb
	cprsAv2GdPPyyLMMzzVUFX2+GSy9QabB7V777drc357/6AYmnmm7eKKlKc8xAM4tsDk/D4OmIC1
	8/buPwsJ10N/RH8mSIRx5Dl5mhtbx
X-Google-Smtp-Source: AGHT+IFo3+CGCCjL/MDLKOL98VKpPnk7r+cnqZ8GYDV87Srf78OvwPE2vbzd7+9ZcA062oFaVEN0Pw==
X-Received: by 2002:a05:6830:3693:b0:72b:9316:d596 with SMTP id 46e09a7af769-730061f15a7mr2627791a34.3.1745017544135;
        Fri, 18 Apr 2025 16:05:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279? ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300489c6e7sm502383a34.65.2025.04.18.16.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 16:05:43 -0700 (PDT)
Message-ID: <abe0db44-b27f-4cea-9edc-862e4096f80c@baylibre.com>
Date: Fri, 18 Apr 2025 18:05:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] iio: prefer aligned_s64 timestamp (round 1)
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andreas Klinger
 <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_160545_407009_60C5B8C5 
X-CRM114-Status: GOOD (  19.48  )
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

On 4/18/25 2:58 PM, David Lechner wrote:
> While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
> I found it very time-consuming to check the correctness of the buffers
> passed to that function when they used an array with extra room at the
> end for a timestamp. And we still managed find a few that were wrongly
> sized or not properly aligned despite several efforts in the past to
> audit these for correctness already.
> 
> Even though these ones look to be correct, it will still be easier for
> future readers of the code if we follow the pattern of using a struct
> with the array and timestamp instead.
> 
> For example, it is much easier to see that:
> 
> struct {
> 	__be32 data[3];
> 	aligned_s64 timestamp;
> } buffer;
> 
After sending [1], I realized that some (perhaps many) of these would actually
be a better candidate for the proposed IIO_DECLARE_BUFFER_WITH_TS macro rather
that converting to the struct style as above.

Case in point: if the driver using that struct allows reading only one channel,
then the offset of the timestamp when doing iio_push_to_buffers_with_ts() would
be 8 bytes, not 16, so the struct would not always be the correct layout.

As long as the driver doesn't access the timestamp member of the struct, it
doesn't really matter, but this could be a bit misleading to anyone who might
unknowing try to use it in the future.

[1]: https://lore.kernel.org/linux-iio/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com/

