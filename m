Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383AACD484A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmwb7DAwmyvjAf1IkP/b/C+gnygE+nYIl1lFsfQt/Ug=; b=AYG0Wji6voO4L+CuNS25Cu2V6D
	NHZvkC3KnBQVNa5iX0s0ipBpeFjLdzk1xC0j/L7sqpFEmWGq2OX7+mNyOUskRXCRcQ81d7KIxphVo
	PBAbqHffCOcvy86w/IndzjtF+VinOYH9ucvAfGxkpA186FSL+FaPauxdhUpNMRjEAze4WTFN4kZ6u
	mr7GPu/EUwad1/4WCvzHrev8AHCnmRgQ1DiH3KycvFsthH0tfOGDzjkwdNZnulwfILbT6XCG7FOBX
	KENkbrlWGqnR1Wh4uAG8VSW76TonneG/1I8cxaliOnUuf10OuImZeGv5g/hL6o3QrPPYHuvDwNWnZ
	773o9Y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkY-0000000E4gy-2dTp;
	Mon, 11 May 2026 15:40:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSkW-0000000E4fH-0XQV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:40:53 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a88db610ccso5179355e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514050; cv=none;
        d=google.com; s=arc-20240605;
        b=QNatGu4BqhaIT7o/BxgR1fjdVK/iQ36x/iA7bH7I4u7CWcDifa5MoQdbGUUqrCYpcc
         lFoq3wobhVaui1qNTmcHMA6UGSknTaM3+TWpDQdxSj2aF55NOkxRUn3szQl4imXL5kw+
         jWKPjzOdjswbkLbreqfGavD2sIxRfOn+ZLPZ73QfHjfvT8SMtOXyN8LKz8Vhoo8em0+t
         tPxXdozGhhmkSPbnDziUBIH+9c0PR4HAb34oYKv7BOc3crkzaYcdz1xhXPEH9DEj42Ig
         ac2r8vN5QDl42z3Ai8e16UDfuNSwbXZQ/yoX+zDe8IXKBQmt9xhilAU7GgjT+883Jksw
         qnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vmwb7DAwmyvjAf1IkP/b/C+gnygE+nYIl1lFsfQt/Ug=;
        fh=84XH+3YZMXXNhMGnCivIusPsAkhK7OkU+R8+3PzB2CA=;
        b=JR7zXqbrZvD3Z/qW+OfkfN5Fd656ImDl/b/1SLV8PmO8v2c5FW9U20Siesmj6FxklB
         uKBdJyqvGewbGOOyAcX5cO9kWPJAsSU/1TxmaLNBJG9zm4Jt3Nq1fvBfy+IE13DbXVxf
         SHbK4VHetLJcZGdOvhiwfjyq1tvqY84/H0W5T1SxnSIId6+pPxZPlJQiTFW9pKr2z9Ij
         /E2YY5eLYYUmdownfuEtOPooc74MNcUPjuQ3F/GPSvqQPM2ObuP+WpyFrD/PcJEVzHSA
         ijeE/2UN5lyiOYs8nqB74+mx0HY7X4GLmWEjCYDzHKfZ4sgKIIiYBQB3s5CFTgvXFXbE
         b0LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514050; x=1779118850; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vmwb7DAwmyvjAf1IkP/b/C+gnygE+nYIl1lFsfQt/Ug=;
        b=WHBB1EL3bNMdSc1hUySC01Z7PlkIx/aeHYDIRccwRUvnXT1v4MYzvKz/FLktk+rLWw
         +SKqXNJmMyflwBEjShwPTKGrolqY79rt/2lU3N8Lb3Hol7cWSl9nk8mifus/4XaHiftB
         Xj1AL3f4lmSwxqSgGpJ+GqwU90MdNFjJhPpBKi/lahECaf+BAz7U6cYhRj/0P0RF6JlP
         UBHBTh1PSvC4w4OWaPc0hQbJsaQl5SbGeele70ciVWdzgCw4tPl7og0agzThTVDf3Z8r
         PY4DNCWgx9HxrZaFXl2aR6dp/iyzO4gRkBx1afXhPAMs2uy06141z2eHGGGS3e2/NxCr
         yzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514050; x=1779118850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmwb7DAwmyvjAf1IkP/b/C+gnygE+nYIl1lFsfQt/Ug=;
        b=jbvPEU7QBRZTzD4hKQGvqPOq9gflxne/m8XmmFHjxanWErIk0PyzxQECXUMMuXahc7
         q49K6iQKGlU78GhmundsMuzThZEbCOgd0tHUrBJ+YmjbZi987LiAaiR5pWt9R7Zo5My1
         3h5ZBVQnMBvGNDX5xzi8qYNsNHF6UKbCCK1KEFSDhWODZJgLUaYcylb/9PDumdHEOPl6
         xOeO84+iwbipt9a7HTnkv+0qYIAxSfMg8sX48CswtnrE3oYU18cPPRWFw749+8zL126U
         1F4tOMBkNDMDqYybJSCemmhkSx6QgA+8rCBhek/xaa2aWZxSR/JZdhNhgiHaihGuAahn
         ZoPw==
X-Forwarded-Encrypted: i=1; AFNElJ89v0aW+RJcnrHSdENrptQBTfY4adXI6TZYUOU2VCnohazgldQ1Zp6q1FhhdwWDttArQBJZ7/nEIun799JnOhh/@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCfEaIXd8LlbuKj3SNETehVaskpV3gG3t8DL2yKX/+EgNsgFA
	CMzaCtkZL/vr2WvTxbq49jWtlQoT7gRzshsXwyUfdCpLXWuWaEJ2HDh9T2b8nTPgATV5giiyPfS
	OlNL8rmGBZUjmLtptNvGLMKzSr6GQIw5In+4yelAtAA==
X-Gm-Gg: Acq92OFKo0KxD+u5hapoJAGP99+szZW/qILR++MVUZTYOIvXvYkLbSHCTb7Eh73g6+2
	CAYje9OYSw34tU4FxyGDCJnBCqffB3t0SkrB6VnCMA2ZRsfNCYBKMHYjUOGOQfc7dEm4CHk4c9e
	W0nowjqGOJaCluy1tah66FCbsnX4Dl9wNxGkif38de0DEXZItGuRb2/4TC41xdjAESE1Drg9zhl
	xLsP2vMUqacqYYkpZMOQWCTVuOfYWFOFv6kklaOdb3Mf2NqBNvsHpB4aabOFgN7p9dMP8ncExbm
	C7QvRf9CIjkWf0z9gfQ=
X-Received: by 2002:a05:6512:3d8a:b0:5a8:a558:63b3 with SMTP id
 2adb3069b0e04-5a8b709b088mr2920906e87.30.1778514050154; Mon, 11 May 2026
 08:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260506190538.596-1-sozdayvek@gmail.com>
In-Reply-To: <20260506190538.596-1-sozdayvek@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:40:02 +0200
X-Gm-Features: AVHnY4IfIknd1YNlE1aq0DnMQUiNiMoH11k9pjuFU-tNvWZguuBa9VK8yUFjorc
Message-ID: <CAPDyKFp6YvmTF+OL5WqTfaZ_=+csitJoHiK39An0gM=NPLpU1g@mail.gmail.com>
Subject: Re: [PATCH] mmc: davinci: avoid NULL deref of host->data in IRQ handler
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: ulfh@kernel.org, brgl@kernel.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084052_248992_A516B458 
X-CRM114-Status: GOOD (  24.17  )
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

On Wed, 6 May 2026 at 21:05, Stepan Ionichev <sozdayvek@gmail.com> wrote:
>
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

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/davinci_mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
> index 42b0118a4..42ad87aa4 100644
> --- a/drivers/mmc/host/davinci_mmc.c
> +++ b/drivers/mmc/host/davinci_mmc.c
> @@ -928,7 +928,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id)
>                 }
>         }
>
> -       if (qstatus & MMCST0_TOUTRD) {
> +       if (data && (qstatus & MMCST0_TOUTRD)) {
>                 /* Read data timeout */
>                 data->error = -ETIMEDOUT;
>                 end_transfer = 1;
> @@ -940,7 +940,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id)
>                 davinci_abort_data(host, data);
>         }
>
> -       if (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD)) {
> +       if (data && (qstatus & (MMCST0_CRCWR | MMCST0_CRCRD))) {
>                 /* Data CRC error */
>                 data->error = -EILSEQ;
>                 end_transfer = 1;
> --
> 2.43.0
>

