Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8073CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oEoT2KP7V1PJEfE5AN+ypOwpprErUyqXCGPljGUigo=; b=qZkHy3r5PpuPvN+LtuUHp1NTb7
	CVfT+ERsZY69FsgjTWrC3Lsa9b8EdsutnsJ3xngnBEWUwbRrJgHQq84uaeBLcCAb1KRilB8lICnWx
	HTdM57aoQBJERFmGr0rDESJnyjZ/QFCkW4bRIDRzWKFPNtHcRUOGJ2m6SFjtGrQUZahcI0sroFqse
	V88x8C1kYgOtJDzMEfaRpGpWOHPUZYQU6om/bXXQW+FRXjDT+sO1UuqbNRW0uwqr8G1z3guz/3TuL
	2D0Nyw9XmIIMJlqXvfN2xqNSBDw8qRSyY9wp93lU+wuKG+ZC+rw0KiMCCsUU7zADcyEKGez4cdFLn
	9fkbVNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu0W-00000003A1r-3jSU;
	Thu, 07 May 2026 08:22:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu0V-00000003A1h-4BZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77FFA6024D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 08:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1BFC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778142175;
	bh=LMq8xDnxTdKYfCuCG+skFVBIcnSJmYOfPOAasdH6jC8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=qxhLYK5growdB95Km/kYbJk/TAOwNG8Y8bBGm9bco5HO6H1D1k1RzSiP54M96fL+Q
	 C532LPLOojpRcvXtVpafQDExIwtCFDK6Gtpheq2fTdFhx4T7HXUE0ptixVMcBtXJNv
	 7hse5d/InE/zhkqPNdSnL/U0T41zN5Y1HM+5//5KBYYXUC72bfh5guda75ef6Ziy4E
	 Rb53wDE/lcyw0RkfZkRFXmPJh0W/0ROENyu2wnPaopdIZ0MPF887Ag34jtvboVaOz3
	 nHb7GOkVN0FG8ls9SM+eCvYyq7oJ3Gz+OSmriL+oVafZ+qDJjuGlj8m+CVd3ueqwKx
	 /XaT2ofpTkzuA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso458702e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 01:22:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8EqDqVf4h6r06cDBof9zcDpk0ctS71daev/Q1PpgeknXFrymL6ACapPSSyQ5TRknXdjaRlS/5UFm2F0E1+v+c9@lists.infradead.org
X-Gm-Message-State: AOJu0YwxFSXwwyU3hu5iLFAaXpFQh28Y6ohk4OO1VKMn6oQtdkRfY+oB
	Jus18nDFacpwwfgrGhuYKvTgvGkIjGyROtCzTd86lViFPjYwwNA7uc6rIIuxWoYXIlyNL1mn4rV
	xLQ2pXBUbQezxNDAkrpW7cgswjXDQ+eQz/5+51+9I5Q==
X-Received: by 2002:a05:6512:3d17:b0:5a8:97d7:8c2e with SMTP id
 2adb3069b0e04-5a897d78d68mr853517e87.28.1778142173725; Thu, 07 May 2026
 01:22:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 01:22:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 May 2026 01:22:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260506190538.596-1-sozdayvek@gmail.com>
MIME-Version: 1.0
References: <20260506190538.596-1-sozdayvek@gmail.com>
Date: Thu, 7 May 2026 01:22:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdwD6yzc-RTFxrnvryLbq_MWYJPD9Xsgt47Q0V=zUckOQ@mail.gmail.com>
X-Gm-Features: AVHnY4IZpcmG123-F6F4RQApOAxVE42MPJtpmmk9jKT5PYjWCPRUPG8ZLrJbh-A
Message-ID: <CAMRc=MdwD6yzc-RTFxrnvryLbq_MWYJPD9Xsgt47Q0V=zUckOQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: davinci: avoid NULL deref of host->data in IRQ handler
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: brgl@kernel.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ulfh@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 6 May 2026 21:05:37 +0200, Stepan Ionichev <sozdayvek@gmail.com> said:
> mmc_davinci_irq() returns early only when both host->cmd and
> host->data are NULL:
>
>   if (host->cmd == NULL && host->data == NULL) {
>           ...
>           return IRQ_NONE;
>   }
>
> So we may legitimately reach the rest of the handler with
> host->data == NULL (and therefore data == NULL). The DATDNE branch
> already guards against this with an explicit "if (data != NULL)"
> check, but the subsequent TOUTRD ("read data timeout") and
> CRCWR/CRCRD ("data CRC error") branches dereference data
> unconditionally:
>
>   if (qstatus & MMCST0_TOUTRD) {
>           data->error = -ETIMEDOUT;        <-- NULL deref
>           ...
>           davinci_abort_data(host, data);
>   }
>
>   if (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD)) {
>           data->error = -EILSEQ;           <-- NULL deref
>           ...
>   }
>
> If either bit is set in qstatus while host->data is NULL, the kernel
> will crash inside the IRQ handler. smatch flags this:
>
>   drivers/mmc/host/davinci_mmc.c:933 mmc_davinci_irq() error: we
>     previously assumed 'data' could be null (see line 914)
>
> Gate both branches on a non-NULL data, matching the existing pattern
> used by the DATDNE branch.
>
> No functional change for callers where data is non-NULL, which is
> the only case in which these branches did meaningful work before
> this change.
>
> Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
> ---
>  drivers/mmc/host/davinci_mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
> index 42b0118a4..42ad87aa4 100644
> --- a/drivers/mmc/host/davinci_mmc.c
> +++ b/drivers/mmc/host/davinci_mmc.c
> @@ -928,7 +928,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id)
>  		}
>  	}
>
> -	if (qstatus & MMCST0_TOUTRD) {
> +	if (data && (qstatus & MMCST0_TOUTRD)) {
>  		/* Read data timeout */
>  		data->error = -ETIMEDOUT;
>  		end_transfer = 1;
> @@ -940,7 +940,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id)
>  		davinci_abort_data(host, data);
>  	}
>
> -	if (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD)) {
> +	if (data && (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD))) {
>  		/* Data CRC error */
>  		data->error = -EILSEQ;
>  		end_transfer = 1;
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

