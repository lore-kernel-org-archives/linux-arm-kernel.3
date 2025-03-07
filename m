Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD83C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaMH1NOSXXEyX+4I+PnYIXnBgRaLQ5ST8GTB4hff2uQ=; b=WMtHaBo+69o8nYFLim10qq5kNo
	Hek/jlZGNluy1FtKEOwvBKMCQoAC6LlbtfONsN+jvMX6KoHF2zs6HJYr2cmLA28TUN+aJwBM6aitR
	eU2dsi6bYED7P3Bi9TuDEw78KYiNOwm1uDI2U0sIdKo7mHAriKlEx04gdRaEV2ZdJec/1R1pzgbeG
	3WVfuN22O+fPNDwcuHF07UUDWxFk5EBy9Tal6QukLyBjCQJPUgCL/KGRVn2ZRG5fsSKW8YFstb4bU
	BRqlGp6ixhAt2c7Y6mRHdvAnP70mXxkEXaIuV7A2y8sCxEMg6TrHJWbD5R1x5reTUc4Uev32DusAr
	Pq9urCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZW8-0000000Ed2T-0w9J;
	Fri, 07 Mar 2025 15:21:40 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZR9-0000000Ebh5-14LA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:16:32 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3f674610374so1067045b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 07:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741360590; x=1741965390; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaMH1NOSXXEyX+4I+PnYIXnBgRaLQ5ST8GTB4hff2uQ=;
        b=ilIxdwJO1kUoeDw7nSLmloU75UWUKBtzD8tRkUGnCHEkuA7s5hOVoLsk4F+AYGFj2y
         OE7OcjfWUFykoDaYUiYhJV4ZwBq+7FoIPGQRjHYuXQG7kQnM+oYp9Qre7Ll8vAiULcUp
         wRm6Rkss9h8I3f62WwumMQsWgMGV8xwbpwuv/sJqrhKtzyQEUl/q2VcCaLcmoHIsy1lZ
         lX6/I+TWDXgBV9RE9ELcd5WUVUMZV11B07t7/Xf7hN0+zBppbmxyREywDQmNfU0r5vIg
         +BtqgE/N1p8NYVDSDMucySdA8QW7elSqlKuKi0Je9sGyECXnblRsKfpaVMgxTE0ZJPua
         Exbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741360590; x=1741965390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaMH1NOSXXEyX+4I+PnYIXnBgRaLQ5ST8GTB4hff2uQ=;
        b=Q8E21LMjncsU8JH08R3ekn0XDTc48mgS4naEJFSiBmI63wEd6XrBqAGBasbIwe6tTl
         l5EOsx4NPiXU/p0FaAoIJgFBJ1TnM9ebzjB4qILfYaADLjPtJFLwO6qC+PZECF7hJF6e
         fHoac7GcivoazUjQm+Nc2FvcNR22Skl+uSyf2yp7YnriflKdhSG4BD3SHFjVbL77ii1C
         5hutvsVSU/8vR7bs1erhI0WXFWIMDtHV4isBzUW3+IOHx5ikX6krgpvHbUzMI43dnJLC
         Yk26ySnppbbn8oVqdeJUwKXHzbrFJ3di/3QSO/pfBqDry6+NHGWx8SHenUSN7sOTTxOg
         QMkw==
X-Forwarded-Encrypted: i=1; AJvYcCXT+HCOpsBzW4vsT7QKD9wAQgZgBDE6uKwEztnBP9HL/5bFmMaFMXyZW5xqFAtuFFZOW41q9HvV9C8FkJxLPN0H@lists.infradead.org
X-Gm-Message-State: AOJu0YyC8gtjHcGK2yCKCkV6UrkYyhi8JkEYwaSN7uIosXBc44W4ZbnS
	U+cr2ZeIrKvuh8CUGO2T7SsrWtDhXaTsNJbi2wXP/cR/rN5lIbomS4UPsWKxcrP27U7Jvzxlzwj
	ZMvHC4yVJzHYH3k0fJ+KqBB/WwdllJJShO+69f/ZcTLJl8r19Qy0=
X-Gm-Gg: ASbGncsTwD2dKhx4oW+7dDgNCrAxFmFdo2wxLFUSudgptaqUj60HlGmSfG5V50cdyEg
	pR0JtWkvqCFMpaAbFG2+0UduLN6suBMaJWaLerQP8ZPIJuYQbJhJZW2QBUPSy28mJUrur2W8ots
	wSXkA5Cc+kh8ycJmkXZnsjTO4khhY=
X-Google-Smtp-Source: AGHT+IGmSI6uKhyqp0Lz6umulak1/qdCrknOZ1BwGtVXVr7Hw1ALnj7JKNyxJ8z0WKOu5JKZrR6BgmZGuCc1usZ1pxU=
X-Received: by 2002:a4a:ec46:0:b0:5fc:f3b8:78c2 with SMTP id
 006d021491bc7-6004aaf90aemr2063696eaf.3.1741360244995; Fri, 07 Mar 2025
 07:10:44 -0800 (PST)
MIME-Version: 1.0
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-5-peter.griffin@linaro.org> <20250305024020.GC20133@sol.localdomain>
In-Reply-To: <20250305024020.GC20133@sol.localdomain>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 15:10:33 +0000
X-Gm-Features: AQ5f1JrG484DP9qv6Qb4pGd14bkBMzxvaPSxEwh5c_p71wnvCQXfRvFkoiXZo_U
Message-ID: <CADrjBPpju3MmZbNy1uaPzAWTWrmNHx0nT+03DmkM3p5qFEUHdA@mail.gmail.com>
Subject: Re: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
To: Eric Biggers <ebiggers@kernel.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, krzk@kernel.org, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, bvanassche@acm.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_071631_294619_5FBE6530 
X-CRM114-Status: GOOD (  20.04  )
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

Hi Eric,

Thanks for your review feedback.

On Wed, 5 Mar 2025 at 02:40, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Feb 26, 2025 at 10:04:12PM +0000, Peter Griffin wrote:
> > PRDT_PREFETCH_ENABLE[31] bit should be set when desctype field of
> > fmpsecurity0 register is type2 (double file encryption) or type3
> > (file and disk excryption). Setting this bit enables PRDT
> > pre-fetching on both TXPRDT and RXPRDT.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> I assume you mean that desctype 3 provides "support for file and disk
> encryption"?

Yes, the PRDT_PREFETCH_ENABLE description in the commit message I
copied from the datasheet. But I can re-word it like you suggest if
you think that it's clearer? I notice now there is also a typo with
the word 'encryption' which I can also fix.

This patch came about whilst comparing UFS SFR register dumps of
upstream and downstream drivers. I noticed that PRDT_PREFETCH_ENABLE
is enabled downstream but not upstream, and after checking the
datasheet description it seemed like we should set this if
exynos_ufs_fmp_init() completed and set CFG_DESCTYPE_3.

> The driver does use desctype 3, but it only uses the "file
> encryption".  So this confused me a bit.  (BTW, in FMP terminology, "file
> encryption" seems to mean "use the key provided in the I/O request", and "disk
> encryption" seems to mean "use some key the firmware provided somehow".  They
> can be cascaded, and the intended use cases are clearly file and disk encryption
> respectively, but they don't necessarily have to be used that way.)

Thanks for the additional context :)

Peter

