Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E20FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qziSDnZnW0hzNlxAbwh27iZM0znzpYCyRyBZAEASdgk=; b=Hc6FxDt59KCQ/IbVxmori3QidR
	XHE5i3QWoAVYmpOZluxnpzrkTRzgszl6UfV7hDZBLCNdn8uV/6jHROEBTQQHL4z9muYUevXsVxNrm
	/ZTnRC23Yeb5X2CfFSROYDCDaBWSs1e90M8qop24VQWwCBlRvvn6Hmr+MX4kG4+tcuEhVUButIULZ
	1ZL0jfdVCvQl/f990/azy+SyE6fhWW/5ueaiRcx8U4aUcTaBs3jg/hmsMxjKD4ABk34rmkVZarSJR
	3XXpXvRLoK1yjHjnLK536q3mPASr4luucbYmgNMJHkk3ufAzpUTkdTI+KBaabUki+z+zRn3BnFXAb
	lVIFYrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi0a-00000001TmM-3VNR;
	Tue, 28 Apr 2026 12:57:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi0Z-00000001Tlq-1BKf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:57:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b886fc047d5so2037299666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777381065; x=1777985865; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qziSDnZnW0hzNlxAbwh27iZM0znzpYCyRyBZAEASdgk=;
        b=X8/J8CbvByDedy83c4JryVJfNsSeVTAO5oNbzU8OMgOOBA7kvV+HaZX0I2Zs+ZxElK
         fZBBDyKvxZqNr+c8FWC6Dm1eb+N9RwhRA/78c8WZYQqJJGjKf8miYuZ24iesOZ9rXKJo
         3mTBvmm5iF+zA+Ik/FDgNHZci89Qrc19gkPkpKS7FWMuV9ThpwSC3gt0KsMNzOo99wL/
         Qd3mIWXw3/sUKXA+6VCv/iL4Bw/ncwcy42dQiOOmWKd95k/79hzJxlYylPHcbE+SpD+P
         xBpK2ZG2C1jqfo/f78PxRgum2QtB4NRSQoHkUt/sqhBhkq25+8h+RbAaPJvVwJMU0Dnk
         oZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381065; x=1777985865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qziSDnZnW0hzNlxAbwh27iZM0znzpYCyRyBZAEASdgk=;
        b=RxKYlMOo3fwdLZQvxrWqBtHznBbqlj23wc86LjKzfLr0RuXHD5VvFo8L0opMJ8jLsj
         D0qnFOJTvhmy0sWvnMvzcROg2P/VIAFJ2iSp8Q6Qut4vcYtWk+gU1p1rEREqkrftKPhO
         yomg1w5q2PnP5oGDfcwF4bbkuBSNOz/Vz9Eb46J2WLtu32LWCCSkz6MRyX39c9PF+s75
         XbruZoTAenX8Ebj92R3uYrQH6q7FHmE2fh//ih+jPHEUhvvGkaWabbYgjhO7SucO80WW
         tyTJtww4mM+ixhWu7kqcT1sdM9u5y6yh9+kvxo9SMmX5XiSEQoOWDswQtiTtuzRBOXWi
         qbVA==
X-Forwarded-Encrypted: i=1; AFNElJ8HI7b/F1XcdunYMUKnmexsNmBj17yVpGRZEKFTHdMfp9pzqqc3kXWGFW4FVOlznM0JHZVQpDFYII2uJY0Elurf@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ/nyJE1283g5bTPO3FI7QDpU5ig83x9fhFA0PFDXcuFoyCADt
	zfC3GvGdduvvDrhS27svfkE2X3hcZ/8SORYsGctSRiXLFspCyrZYQbOfRchTYnDirgY=
X-Gm-Gg: AeBDiev/RxeZSi9YjztLEFs+oKWSNZ5csFhv3x0Jla934Fikz6gd4cmO/AiRr76UnYJ
	B8Dcb3D40cdm4JwTaLV8OLfd37d10bks4Ld6vFki5zxYLuAo0XGD30XxcHXXk//8zZMdHp3sIPD
	+oWG9U6tlvX9JYm985xHK9+2EHhqZSaLMI3ZGBrhK9dVOmFRDO+WdKhDYvVFC4CiUg87oNBb/Aj
	7ebeq2b6qMTo1bRUdKwcxwmCOWBOB0MfbmTwwMgMLMNJkcltAjegM/YWrShW7SjVlBSjkjL820N
	6FSqljGEPUGNjkRbK07GBtqpbaYW5mc06MNwcwRwyjyANUpU2TIVy41/WzsVowR9HWLW+b4Hlt4
	8KHp5kOg1CNYLA+yrO6ZMSlWC6rIziFH7Bc/2b5SlGGlAT4wQSydJYENARjHclGPlA+J6+Z07o2
	yVFJyWvqjbmmMSN7nm5ZXOyA0cymVN7elsFafD1d7Kew8AfneGqq0SoA==
X-Received: by 2002:a17:907:3e9c:b0:bae:642a:8712 with SMTP id a640c23a62f3a-bb804728367mr182366766b.26.1777381064507;
        Tue, 28 Apr 2026 05:57:44 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80bd9381esm101392866b.52.2026.04.28.05.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:57:44 -0700 (PDT)
Message-ID: <4421c95f-3ee7-40ac-b239-d877709b498a@linaro.org>
Date: Tue, 28 Apr 2026 15:57:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] firmware: samsung: acpm: Fix memory ordering race
 in RX path
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com,
 stable@vger.kernel.org
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
 <20260427-acpm-fixes-sashiko-reports-v2-4-1ff8de94a997@linaro.org>
 <6bba950c-5527-4613-8c16-b52534bc75a5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6bba950c-5527-4613-8c16-b52534bc75a5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_055747_359601_DB7EE76F 
X-CRM114-Status: GOOD (  25.21  )
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

Hi, Krzysztof,

Thanks for the review! I indeed missed something in the acquire path,
details below.

On 4/28/26 12:52 PM, Krzysztof Kozlowski wrote:
> On 27/04/2026 17:04, Tudor Ambarus wrote:
>> Sashiko identified a memory ordering race in RX path [1].
>>
>> When draining the RX queue or reading saved responses, the driver uses
>> clear_bit() to release the sequence number back to the available pool.
>> However, on weakly ordered architectures like ARM64, clear_bit() does
>> not provide implicit memory barriers.
> 
> And it does not have to if entire access is synchronized by other locks.

Right.

> You need to analyze also this and mention here path which is not
> synchronized and uses these weakly ordered atomic operations.
>

The TX path is protected by tx_lock, and the RX path is protected by
rx_lock. Because the bitmap_seqnum is modified by the RX thread
(clearing the bit) and the TX thread (setting the bit), the bitmap is
accessed across two different lock domains. Therefore, from the
bitmap's perspective, the synchronization is entirely lockless, and
explicit memory barriers are required. I'll add a comment in the
commit message.

>>
>> This allows the CPU to reorder instructions, making the cleared bit
>> globally visible before the preceding memory operations (memcpy() or
>> __ioread32_copy()) have completed. If a concurrent thread allocates the
>> newly freed sequence number, it can execute acpm_prepare_xfer() and
>> zero out the buffer via memset() while the RX thread is still actively
>> reading from it, leading to silent data corruption.
>>
>> Fix this by replacing clear_bit() with clear_bit_unlock() across the
>> RX path. This provides release semantics, guaranteeing that all prior
>> memory reads and writes are fully completed and visible before the
>> sequence number is marked as free.
> 
> Barriers should be paired and release is paired with acquire.
> bitmap_seqnum() is used with test_bit() and a separate set_bit(), which
> do not have acquire semantics, although in some calls it is within lock.
> Problem is I guess acpm_dequeue_by_polling() which is called without any
> locks.
> 
> This means that other thread won't see updated values.
> 
> I think you also need to investigate and fix that acquire path.

:) thanks for the challenge!

In acpm_dequeue_by_polling(), zero-lenght messages (rxcnt == 0) can have
their bits cleared by a concurrent thread draining the queue. If we have
our thread sitting in the do...while loop and calling test_bit() we risk
speculative execution of the caller's subsequent instructions before the
bit actually flips to zero. The fix is to s/test_bit()/test_bit_acquire().

In what concerns acpm_prepare_xfer(), where we use set_bit(), I find it
safe as it is, I don't think we need an acquire barrier. By the time the
test_bit() loop observes a 0, the RX's clear_bit_unlock() has guaranteed
that the payload was copied out. The rx_data->cmd buffer is dead.

Another thing that I thought about was about the reordering of memset
and set_bit in acpm_prepare_xfer(), but even there, the internal
execution order doesn't matter. Both are guaranteed to be completed
before writel (wmb). One may notice that I even reordered the memset and
set_bit in patch 6/6.

Also, test_bit() in acpm_prepare_xfer() will be replaced in patch 6/6
by find_next_zero_bit(), they are functionally equivalent.

I'll send a v3, s/test_bit()/test_bit_acquire()/ in RX path and update
the commit message with the details described above.

Cheers,
ta

