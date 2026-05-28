Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D634CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv0GvQR9LdZ5J0jYYwa7d5Uyc3AKXGH4YOdKXhneO1E=; b=Oye+CkrdtinpmtH4aP2WYOZRsI
	+w4eTW+a9ve6LVatI2XhbOyu4H9eLC/HClwjkgoGculb9cXivk3ZTPh09srbIyYF3ZcxDmIhptxcQ
	joGNNIMoi/i6lpNfHW9HLW5yk6kI7q86lff5tv1ugrTR8oJmatIIgf9MaSkptUsQub4zcRdLou30A
	MjlvlP1f++nhr8a4iMQAbW6gUQimWH2UkDPiLdvHu5V4BZWryjXR8M8X/ZF/xOtu7gDW/8y+ij7fl
	t1sLFktgSBh3Z2TxKSv8DXOLkzpls6yy2xb0va/LxUwvrL5RY8KaImtqmpzmO1+Xi2OSUgT53dpuA
	eFVTm0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSemj-000000067jk-3U8N;
	Thu, 28 May 2026 17:44:45 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSemg-000000067ir-48Rx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 17:44:44 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 263D31D000CD;
	Thu, 28 May 2026 13:44:39 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 28 May 2026 13:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779990278;
	 x=1780076678; bh=Tv0GvQR9LdZ5J0jYYwa7d5Uyc3AKXGH4YOdKXhneO1E=; b=
	VMjSVWPL8CUZrqTgfYcdXq0OhW1qOrR7LGZ0yymaQR/b6wnZvPfCcaxMs+tTofKH
	+6mktGBcwvopUmyKalcWWWnho7cK2c1CMnIHN62lteDcIwwYy+58KIPg4k+UZjQq
	vXQOcB134YHNp3ARtK/9ruo2UJLtdAXbY8TiaffBqzlfrPBd4QgzaoJ/GnQrkX9t
	2k5M5tYzX5jpkWgyxnfrwFQnfbO1gCvpEzK4RQ8fM+5pKDK6X79On7DIzrmAboHI
	oTGG35a7FcN32YLGYrPGrIzZupJsRSTk4BC1DL7nSdV4NMQXwH+bwcafiUsI/sFU
	H0Oi6y2qavKt2nmOyAWGGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779990278; x=
	1780076678; bh=Tv0GvQR9LdZ5J0jYYwa7d5Uyc3AKXGH4YOdKXhneO1E=; b=O
	nYHJ+HEBGfLSfgR9faVDKYA8WIGs9nU/m/0xvz7zotzmDQXMc1ARN9fAePngamQR
	28vmC1ViYoV2/om90T5XGjig8gFIOOaGzcUwVcq0FuripuVOyuwzzqZoVvEmSZDH
	1JD0cF3zVW8B9DTmE+L0b9N0xbpq8HxzBl2FPVSXFaxyZwIFvz9WMq5WhnXYbZuV
	96/WqJiDKYHWSAdMrL6ulE9q97ZzlBtAqkTQCkkFiY0SHbwhVeEb+SUWdzycPvN8
	8IjvLGQS8BNJE72+mhcj/AQzwTMe+OhZoz5YO94JEgISdLg+8BZuOIGkCM8hn0Ch
	N/k8SG8RlvpIT9a9F5duA==
X-ME-Sender: <xms:BX8YasIjzB6KaaZdxw9LUYG7v3wzUEDo7VuOxxeXOtN0PGtUGW8gJA>
    <xme:BX8Yam9ZcpMLau2S9VvEv6L3k-6SMc3eODzZCRUqM54fuHb6sTFxEzuMtDGgsDgiX
    7MlmNa5Lf4UA0oBWCcYRoiutSMkA028W3Z8nAxGZcT5DVM9cMsMDQ>
X-ME-Proxy-Cause: dmFkZTF15I2exDPtkrKztTne1NwFdgpQPX5RZHaMMfMA6gF6Y5BggLL1zRpelnKTMY3yBh
    R4wK9fwRoM7FrpSRvU2kUe/PJ8DEF0RJTiCet1Z3XZOzfJlAmAGguJwZ3Y4LdKWe5Ra1yt
    9Ank0wim2jQFH2IFOytzTNjNHGkn/Ae5k6iQRP/tXLhPqbG8hKldvfnu/5P4vgFmVlmTMS
    BLtSPVuZTPKbPlWJ9cLE8wplnT3mnotXJHkmv1+aPYsyy7a4tAyjiqHt+HVE0kLYH4AZ6C
    DNvtXHbwrbMim+efkocyZJvr+xOlXiy/azm8os8X9/hZer9SH/YJGVQBkADn5xfDHxnJQp
    wJbURRQfherRUAUXf6wVRJ3WwV9FbzJVFfZ5Oi+cIxTVkeKBQyd6BgZkFuuI28mvWfQryr
    YGa9xvBG7hJYWjUxRyb1ubjL1A/k+dlMbcS/cbIvnM1lVXSInksjQtr+P2X+apzPUbZTr/
    n2+clI183YNFxm9WcrZTH/p+5lDRsmgn36EWEuyvlKsUnO8oOcqECQwPNmWn91gnoW9fUH
    gN+yhtIPSMfvYV7PZ4LqqwYpvMkEG6Z2j/1goh8mHe3vMuvSXNLnnH3PxZ0CxbFQNo0jtF
    W7FUHfNKhUlQ2eAXdkMiECxHvTc0sHzdXmPWgFPVJMudAkKb99TH0ATU5nSg
X-ME-Proxy: <xmx:BX8YaitXoGv-ZZWow7DNa4wJSssqKd9hxZ8Kt0EeZWYeTLNwZAKuEg>
    <xmx:BX8YapD857mxD0bNTG9yFGDr_4EswW0hL6ukkwFYli7cxEZ6gbs6eg>
    <xmx:BX8YatB_-o-aj2Jt4p9laqnWNyjpMJp6UrdisKEHTWBjeBEQA0BK9w>
    <xmx:BX8YajodPLvCsEJrEAzYFDDZFCVvcDzzBYbLXdmE3dA6naFcSj7mIA>
    <xmx:Bn8YasNTWmvzM6wFwlhtzIQhrUiK3Ip3ud0OXdwgZBvctZSd8x0XW6Jb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 98AE6182007A; Thu, 28 May 2026 13:44:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AR8ZB97ino5k
Date: Thu, 28 May 2026 19:44:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Peter Griffin" <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 jyescas@google.com, kernel-team@android.com, stable@vger.kernel.org
Message-Id: <a1629d9d-0357-42a3-aef8-c8d1cfa5ad39@app.fastmail.com>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
 <20260505-acpm-fixes-sashiko-reports-v5-4-43b5ee7f1674@linaro.org>
Subject: Re: [PATCH v5 4/7] firmware: samsung: acpm: Add memory barrier before
 advancing RX pointer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_104443_469618_A8CBC968 
X-CRM114-Status: GOOD (  16.59  )
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

On Tue, May 5, 2026, at 15:13, Tudor Ambarus wrote:
> Sashiko identified a silent data corruption in [1].
>
> In acpm_get_rx(), the driver reads the response payload from SRAM using
> __ioread32_copy() and subsequently updates the hardware RX rear pointer
> via writel().
>
> On weakly ordered architectures like ARM64, writel() provides a write
> memory barrier (wmb()), which strictly orders prior writes against
> subsequent writes. However, it does not order prior reads against
> subsequent writes. Consequently, the CPU is permitted to reorder the
> writel() store to become globally visible before the payload reads
> have completed.

I am very confused by this after seeing it in the Exynos fixes pull
request. How would anything get reordered here? What I see is that

- The SRAM is device memory, so any access to it is architecturally
  ordered against other accesses to the same device. Even on
  architectures that don't guarantee this, Linux I/O accessors
  do.

- The __ioread32_copy() writes data from MMIO into main memory,
  and the store into main memory is guaranteed to be both before
  the final writel() (because of the implied __iowmb()) and
  after the read (because of the data dependency).

- The smp_store_release() in addition orders the write into
  rx_data->completed after the previous memory asccesses and
  before the writel().

> If this reordering occurs, the firmware may observe the updated rear
> pointer, assume the queue slot is available, and overwrite the SRAM
> payload while the kernel is still actively reading from it, leading
> to silent data corruption.

It is possible that I'm still missing the point here, but it
very much sounds like you trusted a chatbot over trying to
understand what is actually going on. Can you explain a
sceneario where the barrier actually makes a difference,
and what the corresponding barrier operation on the other
side is?

     Arnd

