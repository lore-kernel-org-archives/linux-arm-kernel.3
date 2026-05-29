Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108C8CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVqrJ5YOhgpSMMFPFizr/QLCr+JjRNspqhTQiRXPy4o=; b=0+u6cviPDngR/vlADH7ER5jAtE
	tTQtKErhzsMXZnlkv4Xl4SHKEzKp771nFttr5/O0FBYYRB4g0d7Gs9YxsOJxeTjm7eZWUS37SKACn
	5Qtqz03Wo8fd3cvgWevQInHzj/ZARfYnO1NrKj4Epv8HDimbSflOOjgWjUkM/kpy0VWOoCOkk7mfJ
	umBX7wb3GWPTfXZOF0e7whIvQn+01Jw89VO8uzx3a/GNHXMhNceFVgWcbQC0g4kvKhqVEFCZyRLpr
	CUlD3iK33W1fv2BsBpSmCGBsp2D8Giecu0HSdUF1ijndyxRNR1HJdTmF0ZZEL2+DUZkb6IpS/4XZM
	rYTTO+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsXp-00000006x13-26ww;
	Fri, 29 May 2026 08:26:17 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsXm-00000006x03-2cVk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:26:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C2AA01D00105;
	Fri, 29 May 2026 04:26:12 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 29 May 2026 04:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780043172;
	 x=1780129572; bh=VVqrJ5YOhgpSMMFPFizr/QLCr+JjRNspqhTQiRXPy4o=; b=
	EzDQcSfGNtoOhqhXJ/+CbhMdj/NzxFMfQ81v5U0fI8BYGy9C4mZAfVeIuO0m3EPu
	zwXkBRrJGyQ2k6ZdWA2+VnoYT66hRFjmlwAAMMTKj/DksMxPuz2SYtWvCKe29/BE
	4xFKL7sUZrt+LLzT25+2LwYmIyNVEHu6VwbsJstWV3pjjbx/GO2gZSjtyq/z8Sjo
	jtY1EL8ZlNFwFMECtQnT2nuJTWF3EUVnca3t/9bp7Q01wlP+aiF58DQKtLny7I33
	OdcHrS2tq+rPh7kZKmO77sJ8n1lmvSdr1jRb6I9zhud4xE018E56BSbDMkOx8l/t
	ebSK4BA6dtVrFyDPjUpUHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780043172; x=
	1780129572; bh=VVqrJ5YOhgpSMMFPFizr/QLCr+JjRNspqhTQiRXPy4o=; b=V
	g8npqPQaYli1O0S0hyLYRgsOt43hS1mkYWqVKENEyqRQMbzkOP51fJKZ2tWZD/Hr
	yB/BhBcWACWoLAxptE5aBTFY/gIeESAZmIfrM1WPYQVq1kr99faJuKEdXhNpg26a
	T1qDB82AXQVYCDDqO2R9FjP0O0gjycxtojxg74y1Gvd0JUfvANyXu9l9yM7SybLc
	CT8jBWX1cBf26r9yiLu/hDFeBszg05jamTbi/OlF51T1vPrVdV7bNGGjgSR0cllW
	FgxuUD6XDvPF+jWuYk3csFutSDHRmPDRsX4POxS+0+/Yo6vn7Zn5RKm51plTLvlv
	uOFQ+fWehzKDs6InjxOKg==
X-ME-Sender: <xms:pE0ZahXPMj5h__AxH2nHeNjSTkpKk2FBryrYng4TcJXhGMiaCmwszQ>
    <xme:pE0ZasbdmRo5-2A_NXttDHr8GtmQkWd01AAWSGAKpNygXfFeoUfmtyaihZhPCB3zG
    JoKcbabP8LW0O_rvGtlQufgH7stTNxAza0ICsqJFdSZoBLx1dXBHbv1>
X-ME-Proxy-Cause: dmFkZTEj6IRSJxiszgT5zNBK/1zDM+VhH8WRyxcjfIYK/P71VN7eS+o4znfKSDu2V3BhKM
    Qm/cF/JsKzv3Zxo+A8TTWXCPmoJeg4wbq5bc5d9I740Y1X8YKbuvL4ZVDUQDh2QY1Ozu4I
    BtJMMXz3+SgTri5Ih+lVc6bO9KhI6NtE4In+tRUpd74ThDmC0O3/Qfi88dAdzk8TBtrMwv
    oRfzmiIYYKCySaJYh1WBMHARSlvJWVLwjqGBB/wc6NJUQKGHoL+rQ3s3LDTlIwDjw0+3kD
    eeOcFkE4f4krY72f/xknm5OgzJAKvBsgvjv6gExSlrmpZw6+eTmaY3/XzImXfTf9ZXbvVA
    4gPPusUaUJ8eQ+CM+eMXdyjW38fiwi7kRFR5L77wlPukEFvnupO7xySQNBx8Sf5HDZ/i5v
    w7xPFePPrzzd42hOdm93T79DODvq15B9G7tejksrzzrDWxBwgfQ0GWGsiDKdJlEOtVkQ9j
    hkaYnKiXpGA3lKEZ7EPwNdMs3rIw2AZZy9lzukUoa8SSAMoLwHaivB/5kNnA+SQdzb1ojI
    QWf9Qkhw/6EiIvTTDDcGnVz+31ZJHykziIO7f0nUgB8sP+63JbHAdVQR9+unBjR82MUl4u
    rG5ijijQIZxc/Y5EVI45/DlN2s1pErarWRJx6sVg8g6F/LUF9aF2iW6tmv5g
X-ME-Proxy: <xmx:pE0Zag6tg4XvyupcFlo4N7LAw_h4fVDEZOwCpvmQkExs1nyuU-BcnA>
    <xmx:pE0ZajeAIQas64ZmOvNK-3CH4xJqTxlBsczSUI7Sd3-Oa03QE0jlLQ>
    <xmx:pE0ZauuXs-DqpNMmjUPlSn17WGXfCB_ZJ0Rnca5bmeSqz0IgI1TrTQ>
    <xmx:pE0Zarmilwgk0SzYviu5CJsG3j9O-1J7lmX_5mTRPDbGPVsZPnA9FA>
    <xmx:pE0Zai62aJy-RDcwnnQ_ztC8q_IYFu7iZUaEVnECNt9XGv0crgFxaMhJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1A563182007E; Fri, 29 May 2026 04:26:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AR8ZB97ino5k
Date: Fri, 29 May 2026 10:25:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Peter Griffin" <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
Message-Id: <26e9c700-c519-4888-8739-c48c73b8a39f@app.fastmail.com>
In-Reply-To: <ad30ca8b-01ba-40b9-a631-503ff463bc50@kernel.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
 <a1629d9d-0357-42a3-aef8-c8d1cfa5ad39@app.fastmail.com>
 <ad30ca8b-01ba-40b9-a631-503ff463bc50@kernel.org>
Subject: Re: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_012615_077696_71F55390 
X-CRM114-Status: GOOD (  18.42  )
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

On Fri, May 29, 2026, at 09:47, Krzysztof Kozlowski wrote:
> On 28/05/2026 19:44, Arnd Bergmann wrote:
>> On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
>>> Sashiko identified a silent data corruption in [1].
>>>
>>> In acpm_get_rx(), the driver reads the response payload from SRAM using
>>> __ioread32_copy() and subsequently updates the hardware RX rear pointer
>>> via writel().
>>>
>>> On weakly ordered architectures like ARM64, writel() provides a write
>>> memory barrier (wmb()), which strictly orders prior writes against
>>> subsequent writes. However, it does not order prior reads against
>>> subsequent writes. Consequently, the CPU is permitted to reorder the
>>> writel() store to become globally visible before the payload reads
>>> have completed.
>> 
>> I am very confused by this after seeing it in the Exynos fixes pull
>> request. How would anything get reordered here? What I see is that
>> 
>> - The SRAM is device memory, so any access to it is architecturally
>>   ordered against other accesses to the same device. Even on
>>   architectures that don't guarantee this, Linux I/O accessors
>>   do.
>
> Well, __ioread32_copy does not guarantee that, I think. That's the
> relaxed version.

__ioread32_copy() certainly does not guarantee the ordering within
the block, and I think you are right that we don't properly document
the ordering between a __raw_readl() and following writel(), but
as far as I can tell all implementations do provide strict
ordering here because either the MMIO load/store instructions are
architecturally ordered (x86, arm64, ...) or there are sufficient
barriers in the writel() to serialize the __raw_readl() as well
(mips, alpha, ...).

[side note: there is a difference between __raw_readl() and
readl_relaxed() here. The _relaxed MMIO operations are required
to to be serialized with each other but not against memory
accesses, while the __raw_ version used here provides neither
guarantee]

>>   after the read (because of the data dependency).
>
> I don't see the data dependency regarding the write. We read 'rx_front'
> and 'i' in the loop. The 'i' is used for subsequent read (addr = base +
> mlen*i) and that's dependency, but that 'addr' is not used in any
> further writes.

What I meant is that the store into the target memory buffer
(xfer->rxd or rx_data->cmd) depends on the data being read from
MMIO first. The writel() guarantees that this buffer is visible
to all DMA masters in the system and that can only happen when
the __raw_readl() has provided the data first.

       Arnd

