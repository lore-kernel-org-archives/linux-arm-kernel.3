Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F9DCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRQnl4cL1WBl6UH6DzyzccF/izxjjWzeBGgbQMxLsH4=; b=JBZ4JasWIquCIhCm5MWXnGc8Fo
	oCTPYpZixoniUhmqYdOJ2n6W3XtN5bNsXiGbcM9N2G1P8YP9osJR+cCBgd7ydJP09xe6f9OQ9uwqC
	Ce5/d3DtindhnlElhxRbdsmsQmeNm6CCT6cFYL1Jj6C9WNMMu/dfKTTWNtWXgc3k+4ZbyxjnwbOGG
	ELXqdMQdSGCEMZJvN+25kMgLfMx+KgZ9VZfm7xTZEgieKuDofT166cKlqrKlsVgeW5sfOc8GgWNun
	RB3YW2SummfcuHtbz8c99Vd5vhT4J6wFo3TAVtE5cFE8Ob1hBcRSUJpzSt60QRMBIPW4NKFes59YB
	qk/QZ3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvGO-00000007Gjh-3gZT;
	Fri, 29 May 2026 11:20:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSvGM-00000007Gis-2w0U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 11:20:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48d146705b4so146125855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780053625; x=1780658425; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRQnl4cL1WBl6UH6DzyzccF/izxjjWzeBGgbQMxLsH4=;
        b=IJ0cnDjlVaSW8wUsulQCTZhbNlcPAkvf7ffjTVtwAATD1fzSy34aoibSeXQZW+491Y
         DXy6xcDEW1c8wGqwGoezfKaxj+5XMel8TQ53MsNcGLD2dIuE5B9iuMY/l6Zu6N8tVtmd
         ezBN7XZy/PmVvYDgPJa3ZxkG8TKkTavsUfQR+ixE/CUkZJdAa1mJ2d5eehTmkq9oeo1x
         KM2wu2SusMl1pfmkhN9/RQeo4WIQvwAlk7l8HAH+6Tm308PjAZGGgh895VGmIv4nRacG
         KMv//E0vRYPv2yaC6MO8lnk+V7Cp6TmI/xUMFw/bl79xMv60EL0dAqqbGuUCGS20194N
         jT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053625; x=1780658425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRQnl4cL1WBl6UH6DzyzccF/izxjjWzeBGgbQMxLsH4=;
        b=n17anJUZwFqSDgQ5vY6EvRfItZNzXWI4dnNuNfjGjVa9xPlN/VRWyTW6q8mfSYjJoa
         nfJYuVhrHwV/vyJHaCl/rV0cvtruEP9UG9fiK8KitCotf7JUU1uKjiVie67oKYSdOu8Z
         LgBa/Ru/8NC1RbcAotfaKDvMiOSi2l2RD2ICVxCyI56IXbG9FNNGctQB16lW8l6t4wcp
         6l4kqg5Ubr7Q5Izd+/TMPf2uRnwpnhDcimVFsBZBufdivdxu76ui3l5dZyZOliu96HSZ
         BFuraXfoFg/lFxI9E10D04y43g3tXMRsAiV/o7a9Ji9XaLkpvRYwnWm0iz3zI3yjY0aM
         E0cQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SJElnlxZULl5nWCtlUEz6h8yaS9M77p1bRALFYD0R4pcZl9h3yg4caZpQNJ9SHcKfHmBHxXk7kAJnhvWJWzJV@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHKM//fEBJq6+Z6EXyC7MUYyOW656PnBoTsFYXbnCVlv+VBW2
	soBW/QiSz2ruJ92BrAy1A4nHJkRH5RH3d8tIVrxG9AyxTyK/PACAhL2Xo7wDBjb+VlI=
X-Gm-Gg: Acq92OF/7ANdHvKBxSKofz288I5FKJnUPUWmmvFO4zIMBH8Q+80bAQ2kTLvYAuUPSqp
	eGjD1L67zKDFf//QHFncuaUuOPd05zMjkDVajzheUpL7kqGAQMBYKiKQBvprn/OmsuiADBwUYSH
	zkY/LYueSXRt3MNfCYS2LBNa0dccPBViYanRBXrh9GyuVEIyqIqhVpleaTd9H4zH2Fmdq++rRY5
	ax4WU/6g+koFAGvxlVi807qi2ULhE8dzr/1jXlpLO87N1qAqX4ylneLBmtK8IR9t7JgXklGpZr8
	bBquplmllPUyRFPscuUBV8C9KSVAHdkrDNqWKCouHFS2yxqqlQVaIA/Q1N4yA7IMNr1Uv1AtuCe
	hP/E7vxqUs22HoECddEtVpRstQaivR1KeakyZWiTt1E4SdZ0fU+COht1VrBih1l3YxywPKADH/T
	uJmkIe+GPgFz8+aTRoiFIo1N+nCeX1FBckZPJjvFqQOw==
X-Received: by 2002:a05:600c:560d:b0:490:4ee0:82f9 with SMTP id 5b1f17b1804b1-4909c0920c0mr32909035e9.7.1780053624779;
        Fri, 29 May 2026 04:20:24 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c50f6sm3257061f8f.16.2026.05.29.04.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 04:20:24 -0700 (PDT)
Message-ID: <ed771a16-6241-4246-976e-48349e544b5b@linaro.org>
Date: Fri, 29 May 2026 14:20:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
 <a1629d9d-0357-42a3-aef8-c8d1cfa5ad39@app.fastmail.com>
 <ad30ca8b-01ba-40b9-a631-503ff463bc50@kernel.org>
 <26e9c700-c519-4888-8739-c48c73b8a39f@app.fastmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <26e9c700-c519-4888-8739-c48c73b8a39f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_042026_777592_680B7240 
X-CRM114-Status: GOOD (  26.41  )
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



On 5/29/26 11:25 AM, Arnd Bergmann wrote:
> On Fri, May 29, 2026, at 09:47, Krzysztof Kozlowski wrote:
>> On 28/05/2026 19:44, Arnd Bergmann wrote:
>>> On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
>>>> Sashiko identified a silent data corruption in [1].
>>>>
>>>> In acpm_get_rx(), the driver reads the response payload from SRAM using
>>>> __ioread32_copy() and subsequently updates the hardware RX rear pointer
>>>> via writel().
>>>>
>>>> On weakly ordered architectures like ARM64, writel() provides a write
>>>> memory barrier (wmb()), which strictly orders prior writes against
>>>> subsequent writes. However, it does not order prior reads against
>>>> subsequent writes. Consequently, the CPU is permitted to reorder the
>>>> writel() store to become globally visible before the payload reads
>>>> have completed.
>>>
>>> I am very confused by this after seeing it in the Exynos fixes pull
>>> request. How would anything get reordered here? What I see is that
>>>
>>> - The SRAM is device memory, so any access to it is architecturally
>>>   ordered against other accesses to the same device. Even on
>>>   architectures that don't guarantee this, Linux I/O accessors
>>>   do.
>>
>> Well, __ioread32_copy does not guarantee that, I think. That's the
>> relaxed version.
> 
> __ioread32_copy() certainly does not guarantee the ordering within
> the block, and I think you are right that we don't properly document
> the ordering between a __raw_readl() and following writel(), but
> as far as I can tell all implementations do provide strict
> ordering here because either the MMIO load/store instructions are
> architecturally ordered (x86, arm64, ...) or there are sufficient
> barriers in the writel() to serialize the __raw_readl() as well
> (mips, alpha, ...).
> 
> [side note: there is a difference between __raw_readl() and
> readl_relaxed() here. The _relaxed MMIO operations are required
> to to be serialized with each other but not against memory
> accesses, while the __raw_ version used here provides neither
> guarantee]
> 
>>>   after the read (because of the data dependency).
>>
>> I don't see the data dependency regarding the write. We read 'rx_front'
>> and 'i' in the loop. The 'i' is used for subsequent read (addr = base +
>> mlen*i) and that's dependency, but that 'addr' is not used in any
>> further writes.
> 
> What I meant is that the store into the target memory buffer
> (xfer->rxd or rx_data->cmd) depends on the data being read from
> MMIO first. The writel() guarantees that this buffer is visible
> to all DMA masters in the system and that can only happen when
> the __raw_readl() has provided the data first.
> 
Thanks both for the detailed explanations.

I missed the data dependency chain. I focused too much on the read
part in __ioread32_copy() that I missed the RAM store implications
in it. The RAM store is forced to wait for its SRAM load, and the
writel is forced to wait for all the RAM stores. So the entire
payload is guaranteed to be visible in memory RAM before the writel.

Maybe I thought about the reordering of the final __raw_readl() loop
iteration with the writel(). But the dma_wmb() -> __dma_wmb() ->
dmb(oshst) from writel has a compiler barrier, so the compiler can't
reorder the code. And given the ARM64 device memory accesses ordering,
the ordering is protected.

My bad, sorry. We shall either drop or revert the patch. Please let
me know if you prefer a revert.

Thanks,
ta

