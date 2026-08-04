Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A89C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r1XUD+zcMbBMioGMZLAXYjDwYxQUe7uV3RFGy9lY+I=; b=Q4CFecM3DvKmN/QKCgQZgM3f9R
	hua0dQ7/7avj7brURcijdus6s9fo7yGfhJ9R3cqQLO6dScIwZ5ss6t5mFQmMu+rD13I1vT8EGx1Wb
	Aikd0DyZ9ZSgMjsIJHMjPBg9WCd9phYm0CHxDa0cDP7mxt8jCym61gnvU5syWy/Twe+Unubx1yTCl
	Fk59AcrFOuSJP5m6Bq43eUJc1b25BOIBqAetSEt11HAtc1pgBx+zJ2DKM8oEtH4jGwJHgXdwnjfx8
	PW3IMm1TylE1n9vzq9E5OqrEHJ6vSIXrg8tRRTen5UoxMXyxgekjp5PDcvAQ2pC+HqUoVBdsvbwz7
	bw8Mn+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGej-000000029wy-13pY;
	Tue, 04 Aug 2026 15:02:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGeh-000000029wn-31iu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:02:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B71141AB1
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 15:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91391F000E9;
	Tue,  4 Aug 2026 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785855731;
	bh=6r1XUD+zcMbBMioGMZLAXYjDwYxQUe7uV3RFGy9lY+I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=PcupWXGb+WmrZL5O2aU425S8KTLyXNs/kEBDqAF5gegtX5hNL+ecpOtWsawgtFLRc
	 sqKgmJXlEECA9CvJYZfOsMw6ZgqDMhTGzMj+e5qPWmmg5PGrML5Wk1vXGiqCz141sI
	 GzNMqD/+vyZDpc7hZ/etxwPrG2m/Hhm9VAJNEEhN0ZHBbr1s423k7/EDkbJ33zrfQ2
	 +aR+yzF8oLaajnYphS7CSNa2yehx6l9ES5qclV7J6ubSJnhVhXRO1rzoJaQdzavH9N
	 0dnkHSKoOxyIIG9UOC8lU1M+l9vw6LvMJ4YknTNe1FULEtgabypdvkd5FMo7Pakh4j
	 +pdRoq3H6C9Fg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6B7A4198008E;
	Tue,  4 Aug 2026 11:02:09 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 04 Aug 2026 11:02:09 -0400
X-ME-Sender: <xms:7_5xare-7YL9pMkqCzS67yqPCD7P-QRi78lPMDUMlXc1yga57IgOGA>
    <xme:7_5xasBx1bYl1OTxhAYo1WRAssCpVJhLBEVJmts0aYkyTl2gm_UDHzDwio1Q2xEus
    qM7xDOpAJTNyYWHvbAgUP64hxenoUUMiuCTadGPrZj2WYV3plC5LIQ>
X-ME-Proxy-Cause: dmFkZTGH7NHF/4bU1m4gEXdnc5ycGfy1HcQpdQtOeW8oFxhq6JTmTd3E7yQtTAzwt9ip4n
    N+XOaKih88UK0fd9Hidh4yQfkiBIk+6DkSZwchXROPhqtA5Aaww+Kq+fl6RR2qXYxM+v7d
    7sKp+JnaEwRb3/lsjqd7wrP/9GumnQWOpb3knId+JLJhJj1FtMM8CkG9X6wHFiCQoDD6wf
    n9luA9E253Wt6gcnAwN/V40vXyq1lk6ymuz13HilDq1ih2zqh1zhflr2bbeiLrybgsCHOP
    YMsm8P/hqb39RPaFGkq3raQoo3q4SM/mB+mJb4SFwVyDdV02aF7gGUUaDC1jg3mRRyDkCq
    yQ9RanwwFzSZjtLpZ5NPBP4VCNRqMBVfOu05+nw17unv5rjaEvd/LN0SlVMGDo0WQbVcfz
    w/Uszd5hXS7M6nTipyvODcBL4WI+jWVKEiB/Z+D5gau2tl2sJW8QrV9V4wBwF+PwAdhls/
    1PqHAL1XYvUAgUqfC+WQq3xX/us7GizCnji8bUkwVNuXWxykJw6nKwD9xJe08smydxgTj2
    9VYin+Aid6jeIYBvx/+WTx996beL5mvZuZAfWbupiwe6Rd0UmHjo5/7QQNoKAZjBvxLkLF
    9kXyNGtAWCHIpDNmGkRL1vRTJr/yrS3ftpGRaCDwSSk4r2mBpHjpAwZWKtpA
X-ME-Proxy: <xmx:8f5xas9EHmbjkD-jYyu-28kFA-8d_Yh2-x63bAetTGg9SGpqsTrA4w>
    <xmx:8f5xavpkuSwZEx9hUQoKevuGEzsMl2g0ItVzzZAlzS9yZ8GOQn84SQ>
    <xmx:8f5xahARKYy3RdwjlLgARYnI2cEfCIi-iLP9RlwIo8DCbZv9SUzoGQ>
    <xmx:8f5xahyoXiyDczi6-jlwI44CWtxsaVL2FZBL4DCmHbPQHQTNX_twfg>
    <xmx:8f5xau2Xahw0Tdbyc5YoP717QJvzXhQ8qimENbYaCpYJENsGlKFJEuqR>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B195AF80060; Tue,  4 Aug 2026 11:02:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 18:01:47 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Marc Zyngier" <maz@kernel.org>
Message-Id: <ae512d64-b56b-4032-bced-db69dacd3f68@app.fastmail.com>
In-Reply-To: <20260803164230.25172-1-will@kernel.org>
References: <20260803164230.25172-1-will@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: arm64: Add Mark Rutland as an official Reviewer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Mon, 3 Aug 2026, at 19:42, Will Deacon wrote:
> Mark has been part of the arm64 furniture for as long as the code has
> existed in mainline and is consistently one of the most active and
> knowledgeable reviewers that we have.
>
> Make it official.
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>
> Mark's actually OoO atm, but I spoke to him about this offline and he
> was keen to be listed. Honest!
>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

