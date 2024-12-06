Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC765E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkgL71aCC+c5eU3/5Ahdd+PfY2GgDv7LSswVdp5m+AA=; b=aso9YK8hqffBq4zc0+F3t82NKS
	jvXIceo/bSdJBaMRJ9cu/bPBNdDRk6gOFYjKlHl2x+OoWOhrlRSFYGEl7gFWj9bbkBR2J2w+hT9Ao
	khIYm9ZVFRNlSORzZbkv0o8Uv6B8MX/qZlOC2kmn0jnHEhBAt+EGwRDjJNO6toUZAijgYlLshpBB6
	fD2vU+5PWZUkgeIifPdmMN9O22KBjKqLTvPe31Vi2PK+aLXQnCcstcSZxXTqMN0FaD+dP+5EMfIZE
	sjz5o8ddUkLzlrfTmAUTT9Gozx+XztSX2ozZ6THrRBnqLnrdN+Xo15VB2B4em5B1e2gsyyvqir7jF
	gyTq6Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJX0F-00000001VqP-2aIJ;
	Fri, 06 Dec 2024 12:00:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWzD-00000001Vj9-3FbK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 11:59:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa5325af6a0so307018466b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 03:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733486345; x=1734091145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkgL71aCC+c5eU3/5Ahdd+PfY2GgDv7LSswVdp5m+AA=;
        b=oWg7pRipIin9YS08yiWyArAiSI6x3uwgwV1/6HRx/IbCtdt6Ho1mLQRxTDI6eXTR0J
         kRCCvvknh8QJIDrneVfkB1Oorh+A6Dr8a1yS+aKLhVQpYwFMk6rEu8DmDj680MKifLHb
         D/wOy+XPxccotHxPywmdX+wbKXDlsUHZCKH4VD0Uh/FSoCKnVLJQRy9UEBe5UJ4H8Zec
         ZKl8sLsUFN5lRZpBycmQ+UO+MlCRLkteES21D+Kp7zZUMkYH/zIw8dhSnzQfhjtQ1iA6
         SANjUmppeJwXuNZ/qdpm2oTbLgfzy5T5/plB8EGIWp0VFHHGA1K2mZcIwqAMWyYPIzyy
         87bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733486345; x=1734091145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkgL71aCC+c5eU3/5Ahdd+PfY2GgDv7LSswVdp5m+AA=;
        b=D+osEEp9CAO3sTOBHciMJ3lDfirBnC41BGjBRuovhTZlB32BIeJNFSjUj/e1LDeZ0E
         XoXKqRvFx9MDcasmYX6lcwKT9U3FFzB0p1L128c7vUm8S5V+cDtWydw1Nwxcw78zaTAJ
         Tw0GDdNUI0yTgvVVcAi0dokfXsUYlRa7mhPhtSMtMH8vobYln1Cuik7EB6eDfKrRaYig
         ZHoum2VXTGBSNU98hdjMHVLGmzvvIBBBF9nAIYnj3mvc5lSE9mpe2yh/UAKElLl4+UWm
         ZeNWwA8lxTAt2z5jNoY9rc3oRv9kaan8RgvEsjuBV4UPcYrMFuGUB3pWI8nWx8oFnQkH
         bM/w==
X-Forwarded-Encrypted: i=1; AJvYcCVZhs1Xn/XTqghPR19IFP1mIHoPQRNi6VKpM2rNxdvgwO1krDKPczQmP1lcuInakLZbNyeHQdyfV1EyC/sA6bzF@lists.infradead.org
X-Gm-Message-State: AOJu0YwqEDmmdyId9amqan1CEt/wv/3kbKd2mZQrJN14HsBoQzXQzpvl
	zGeE4wwFGMxadUKHmQzPk4DB1n8Lw/BPWU+gAyoVXdagNVzAjUIXFj34Rns9KkY=
X-Gm-Gg: ASbGncvbYvlBP06u1KQH6E8d7hCClGzs4B7FutaH1sYJdEFwLis19PEdMM3WSmoAwQm
	ciRKKLgHKVk3a1Pub/1iQVtFKRGzMGSUuMJbY8WdJj+4hytc5LRqbSvnaBzoty71OtUYW0N1kjL
	f+mfIZcVbk8nieV3GNx/r00AIRROgnXHFNx2c2cXIPpODsJoy+crxpvBzJpeuNbsXyiiS2udN0k
	t6MjBZDZ4ZnePFODvduRrnHF2jeBuKwcpNgUJ27bv4r1yQtme3NBEXQ/Q==
X-Google-Smtp-Source: AGHT+IEHIi9QWxcwQ/B/5PO4EWqQexTbFpihDQmGHpBVwImN5z7OBHtx4LNIPsp//1PemqEWOn6Y3w==
X-Received: by 2002:a17:907:9385:b0:a9a:3705:9ad9 with SMTP id a640c23a62f3a-aa63a2550c2mr202722966b.50.1733486344908;
        Fri, 06 Dec 2024 03:59:04 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260eb8b5sm229008366b.193.2024.12.06.03.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 03:59:04 -0800 (PST)
Message-ID: <aa09bbe3-8f5f-42cb-a7a9-deaaef77affb@linaro.org>
Date: Fri, 6 Dec 2024 11:59:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 kernel-team@android.com, William McVicker <willmcvicker@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <427caa87-b9ba-4797-88bd-a18a96eefdcf@app.fastmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <427caa87-b9ba-4797-88bd-a18a96eefdcf@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_035907_830935_6EE56EE6 
X-CRM114-Status: GOOD (  32.05  )
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

Thanks for the review, Arnd!

On 12/6/24 6:47 AM, Arnd Bergmann wrote:
> On Thu, Dec 5, 2024, at 18:53, Tudor Ambarus wrote:
> 
>> +#define exynos_acpm_set_bulk(data, i)					\
>> +	(((data) & ACPM_BULK_MASK) << (ACPM_BULK_SHIFT * (i)))
>> +#define exynos_acpm_read_bulk(data, i)					\
>> +	(((data) >> (ACPM_BULK_SHIFT * (i))) & ACPM_BULK_MASK)
> 
> Could these be inline functions for readability?

sure, will do.

> 
>> +	cmd[3] = (u32)(sched_clock() / 1000000); /*record ktime ms*/
> 
> The comment does not match the implementation, sched_clock()
> is probably not what you want here because of its limitiations.
> 
> Maybe ktime_to_ms(ktime_get())?
> 

Indeed, will use, thanks.

>> +/**
>> + * acpm_get_rx() - get response from RX queue.
>> + * @achan:	ACPM channel info.
>> + * @xfer:	reference to the transfer to get response for.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int acpm_get_rx(struct acpm_chan *achan, struct acpm_xfer *xfer)
>> +{
>> +	struct acpm_msg *tx = &xfer->tx;
>> +	struct acpm_msg *rx = &xfer->rx;
>> +	struct acpm_rx_data *rx_data;
>> +	const void __iomem *base, *addr;
>> +	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
>> +	u32 i, val, mlen;
>> +	bool rx_set = false;
>> +
>> +	rx_front = readl_relaxed(achan->rx.front);
>> +	i = readl_relaxed(achan->rx.rear);
> 
> If you have to use readl_relaxed(), please annotate why,
> otherwise just use the normal readl().  Is this access to
> the SRAM?

all IO accesses in this driver are to SRAM, yes.

There are no DMA accesses involved in the driver and the _relaxed()
accessors are fully ordered for accesses to the same endpoint, so I
thought _relaxed are fine.

> 
>> +	spin_lock_irqsave(&achan->tx_lock, flags);
>> +
>> +	tx_front = readl_relaxed(achan->tx.front);
>> +	idx = (tx_front + 1) % achan->qlen;
>> +
>> +	ret = acpm_wait_for_queue_slots(achan, idx);
>> +	if (ret) {
>> +		spin_unlock_irqrestore(&achan->tx_lock, flags);
>> +		return ret;
>> +	}
> 
> It looks like you are calling a busy loop function inside
> of a hardirq handler here, with a 500ms timeout. This is
> not ok.

That's true, the code assumes that the method can be called from hard
irq context.

Can't tell whether that timeout is accurate, it comes from downstream
and the resources that I have do not specify anything about what would
be an acceptable timeout.

I see arm_scmi typically uses 30 ms for transport layers.

> 
> If you may need to wait for a long timeout, I would suggest
> changing the interface so that this function is not allowed
> to be called from irq-disabled context, change the spinlock
> to a mutex and polling read to a sleeping version.

I think the question I need to answer here is whether the acpm interface
can be called from atomic context or not. On a first look, all
downstream drivers call it from process context. Curios there's no clock
enable though in downstream, which would require atomic context. I'll
get back to you on this.

If there's at least a client that calls the interface in hard/soft irq
context (clocks?) then I don't think I'll be able to implement your
suggestion. Each channel has its own TX/RX rings in SRAM. If there are
requests from both hard irq and process context for the same channel,
then I need to protect the accesses to the rings via spin_lock_irqsave.
This is what the code assumes, because downstream allows calls from
atomic context even if I can't pinpoint one right now.

I guess I can switch everything to sleeping version, and worry about
atomic context when such a client gets proposed?

> 
>> +	/* Advance TX front. */
>> +	writel_relaxed(idx, achan->tx.front);
>> +
>> +	/* Flush SRAM posted writes. */
>> +	readl_relaxed(achan->tx.front);
>> +
>> +	spin_unlock_irqrestore(&achan->tx_lock, flags);
> 
> I don't think this sequence guarantees the serialization
> you want. By making the access _relaxed() you explicitly
> say you don't want serialization, so the store does
> not have to complete before the unlock.
> 

I could benefit of the non relaxed versions indeed.


>> +		.of_match_table	= of_match_ptr(acpm_match),
> 
> Remove the stray of_match_ptr() here.

okay

>> --- /dev/null
>> +++ b/include/linux/soc/samsung/exynos-acpm-protocol.h
> 
> Why is this in include/linux/soc, and not in the firmware
> header?

right, will move.

Thanks!
ta

