Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E885CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iomTY4Ad9VMho5vTBG2rGPVpkuu5FijZvMIWhno+SFY=; b=vzRR/vMpuilqU65I/zC3AvOiO1
	5Gkhlld4ZVJe853MqYd2VaKoUqZqu9MADYxdIoDysVMzRQRAjDkhheWkxg/XPIEHKw/WWV8kciVQf
	dPbZ35li2jYo3L2nWDbuu86FgaOt6p2wvUGbX6a4/VIs+MRQbNkm+AkcCknrcwlbjbODOrc4miNjY
	Mk3YIMy96mSa6y3yCwVkgIAhCXqyTV+BbhoD64VQhxAm9M2lCElNlB7FNCJ170CXYD7tfk3zJPGb1
	7OiScgCi0E0i6aVH0eC7J9C+QTYMjcAYJ5JPqGev7ECxbE0Oq5quKH7S83LWfV6Y8wPkNgUNT3oJd
	8VTnkWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrwW-00000006uLv-0NnZ;
	Fri, 29 May 2026 07:47:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrwT-00000006uLZ-3oVh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:47:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33F5C446EF;
	Fri, 29 May 2026 07:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7763B1F00893;
	Fri, 29 May 2026 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780040861;
	bh=iomTY4Ad9VMho5vTBG2rGPVpkuu5FijZvMIWhno+SFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BQ2xNQjFvx798LQaafRp0qHl4e/SQjVrVHNZPyfzx/PuBbDNICyKY0w5mzA//yE8+
	 bnaL6668ZqrU3Y+QDFDECJba7z6HMVy6WccEJCjRy3m7EVNMDER3pydwX72seN44K+
	 WHdMtkhF7Z5LTT6t/hWwhgDZJxnSigaA4ua3ohZ5qd6A8XgJKBjU4GXSkXkPNTkJ1x
	 JpUiJw0ZmEMWoZnYfw5YIrPUpqSk5qxJH0NlyrLo04QtI/xJELrSJg8VEaIZOi7wZC
	 KroKImR6OBgZwj1H4MuUQGIul1DnXn9/Gz0mITY9LfQL1jAhnpkbrIYkCh7AVeWMjZ
	 1HOhvGCpE/X2w==
Message-ID: <ad30ca8b-01ba-40b9-a631-503ff463bc50@kernel.org>
Date: Fri, 29 May 2026 09:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
To: Arnd Bergmann <arnd@arndb.de>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
 <a1629d9d-0357-42a3-aef8-c8d1cfa5ad39@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a1629d9d-0357-42a3-aef8-c8d1cfa5ad39@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_004742_004032_B86896AF 
X-CRM114-Status: GOOD (  26.77  )
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

On 28/05/2026 19:44, Arnd Bergmann wrote:
> On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
>> Sashiko identified a silent data corruption in [1].
>>
>> In acpm_get_rx(), the driver reads the response payload from SRAM using
>> __ioread32_copy() and subsequently updates the hardware RX rear pointer
>> via writel().
>>
>> On weakly ordered architectures like ARM64, writel() provides a write
>> memory barrier (wmb()), which strictly orders prior writes against
>> subsequent writes. However, it does not order prior reads against
>> subsequent writes. Consequently, the CPU is permitted to reorder the
>> writel() store to become globally visible before the payload reads
>> have completed.
> 
> I am very confused by this after seeing it in the Exynos fixes pull
> request. How would anything get reordered here? What I see is that
> 
> - The SRAM is device memory, so any access to it is architecturally
>   ordered against other accesses to the same device. Even on
>   architectures that don't guarantee this, Linux I/O accessors
>   do.

Well, __ioread32_copy does not guarantee that, I think. That's the
relaxed version.

However everything is guarded with mutex, so we do not consider here
other threads and within single thread it indeed does not look like
misordered.

> 
> - The __ioread32_copy() writes data from MMIO into main memory,
>   and the store into main memory is guaranteed to be both before
>   the final writel() (because of the implied __iowmb()) and

Yes

>   after the read (because of the data dependency).

I don't see the data dependency regarding the write. We read 'rx_front'
and 'i' in the loop. The 'i' is used for subsequent read (addr = base +
mlen*i) and that's dependency, but that 'addr' is not used in any
further writes.

> 
> - The smp_store_release() in addition orders the write into
>   rx_data->completed after the previous memory asccesses and
>   before the writel().

smp_store_release() wasn't there before the next commit, so maybe that
was missing when interpreting Sashiko suggestions.

There is no code flow where smp_store_release() does not appear, except
when RX queue is empty from the start, but that case would exit early or
would not matter.

Tudor, please validate this more. I postpone for now pull with firmware
driver changes which were put on top of these fixes.


> 
>> If this reordering occurs, the firmware may observe the updated rear
>> pointer, assume the queue slot is available, and overwrite the SRAM
>> payload while the kernel is still actively reading from it, leading
>> to silent data corruption.
> 
> It is possible that I'm still missing the point here, but it
> very much sounds like you trusted a chatbot over trying to
> understand what is actually going on. Can you explain a
> sceneario where the barrier actually makes a difference,
> and what the corresponding barrier operation on the other
> side is?
> 
>      Arnd


Best regards,
Krzysztof

