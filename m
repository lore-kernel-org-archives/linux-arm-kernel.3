Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD42F417F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ucGesIfhOfGml+MzHLEUPi7ZmCwSE7hKO5Oy5YMidY=; b=OhP0tY/764gelS8RVF4ySJFHEq
	TwJarMeFCa4m2ldmMaOppVPdxchfIekA4DJN38q4ZwD7KoyxdsTIeU2ATADrdqsJHcOUB1qTMP9Uo
	hpoGrgKV8ZL7TCXE8OOpbECOcPFTSjjreXoFIc6ZIDy0mcsxl1yQ9hb/ONjehxL0dgn7w7AJ1Rl/2
	/7FI9JpA/ybL3T3xT4JQ13juq6inyXcFXrH7z5eyIXF1nYkuKIy3VoLccF5EbXjk1sH9ddKLH9wlS
	yncJFZMa/P6DVFqOglg5KHHaKqbkY9XPbUK6/tgIEL4H0tdkhczsaRxvDrm1lCqIT2IqrMJHrg1uM
	HnvlaAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcC2-00000007YVs-3eBx;
	Mon, 09 Mar 2026 15:06:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcC0-00000007YVM-1Cvp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:06:49 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59dcdf60427so6569637e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 08:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068806; cv=none;
        d=google.com; s=arc-20240605;
        b=Bz0q5LxkdoqfjIXomhyWprznVnBHl2etDBUjOWXwUFdu5IdSwtwokM6OHzKGiMkT83
         UfC4NbUAKFV3rkdujcHUZWthoaNK8oPrgpFPjy4oYty3WSkM7a2zTVCOzZyRbnaa/EI+
         sucifQBwwMl6uZ8AFxL1eW80eBAASGlqaE4hHsYRfoUTPNB+Si51kJKabinHMPbLiD9f
         qBUA/8kM/IuUNf78JJxBb2pxI321g/xIQdjsrygxy+nZYmtERjsk0yRyAzJUjnLsJy81
         SGzlAw9thrY8ZyakE/nr36kvK25vRznM1Mb4bA+N2g18BNdfcfeB5LIRlREnRUVSrD/F
         tJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6ucGesIfhOfGml+MzHLEUPi7ZmCwSE7hKO5Oy5YMidY=;
        fh=0wcWaGm0iYiUsZf8ceg12UOqyuNa3vrpXfaAhFnx9P8=;
        b=dLYD1rWayvrl4+MWY1FpSaLA3vqsqFH4gP/y3M+9+C/12EZNNgIFQAgwGDsmE+b+df
         +NV/7PYUYPXG/w7q6SAe/b9Ot3w38QE0c0HRR6zZCOkLq8HLk8HMey/uQYd5OY6QJ7UA
         G1L8Cr8cGU1PBlmKBxp0ktq7Q1Z7DXx4429Oy3HEOqiP0vD59FhvPRvqt/047oEVnVnD
         B4eVSIZi4jHepf2ZZS86FzzISCJOGNiFMx/NjYba4YLo3980CWOOBlmaX9SllChfOyuR
         PQ6lI/CWLs4za50CtgBkEontCxM31Om3ZtfTeCT50UfMJZUpY1+gAU6Mpk/VxH3iSsfU
         wTPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773068806; x=1773673606; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ucGesIfhOfGml+MzHLEUPi7ZmCwSE7hKO5Oy5YMidY=;
        b=riGS5WoeAnL1hfAhlosMN3QTaXqBBNcqD1tRgtPjPUJUk59mPDFNVuiU1gydQG0njD
         lTTb/QE8+t/eXfi0rxbnwIOd5BmL8/q8q7orie0sO0lWorvlwZ67x0EMfPJ2WQaOMpwq
         MnUHN8fBqTM2f3ecZMoRQqakzkz4uzaiW6q2LmeaQOFIRKRu7R2FBHcdICaDNHwacr7L
         fyMCTmC/R7WvShCh5sQJ0Ccb6aO+5kU+VUaJdpFxzd6+LCNlJS+jfihWS3HZu8UJFmtL
         qFQLYUaiy4ysJ9u6g2krnEkSVyezwRBZbj6v8IqOg5D9LNc3om53Dhw1Td9hHZDlN/XO
         b1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068806; x=1773673606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ucGesIfhOfGml+MzHLEUPi7ZmCwSE7hKO5Oy5YMidY=;
        b=Pug28PA4G5H2T2GYj9MkddGLEVH6vDoADPFzGJhCFNg61Xa6QI+9PrafQWYfn5OaPJ
         OzSp/8wC9nzZzqPRV49fKdTEPTUzxe2NX8UZvb0veWJmXU+1NpwLM+a17wNvAcqvKYwB
         OnyITaMrn4UpiXxi7dsDu1sBHvSBTn3F+BKHQaBayW7o8TLhH+eNrvxVQ/B8I0V9xNzr
         1I77d1hywUF4BGHUsJWHeD0aR0OfVhBFbsgFxYHyIEilhBNcxl1zEfIpRtSD47IomJf0
         nnGmfigFLGQRM6dRluwa7zMxwkEFAc/iS7eGHO+uNvIMSMtSyqjV7pO9bmACkEnp3sJH
         J7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0YxXwiLlPevsPPNAu7R4oHV+Ci1VQwobUOp6znyTytV3IAE/g8z1l9vjlsZQ1JnqVN86w6s+pY93YLxFDF8ho@lists.infradead.org
X-Gm-Message-State: AOJu0YxXKkBxnCputAmoZTv92upjIBDMqSqynD/tWU3WpZdFn0AYmWRg
	U7xFuKf2DP2edRHdgyiNvzEOu4H7+iCFFK3jgBIF6c4BKEUxIr8f6dnZsFDzO6x6X31hwpft8K4
	f/RiezRU3gIBCaBPtSplYGeAfhZCoVq4kcOhSGIi2igXcWzkEuGxIBQ8=
X-Gm-Gg: ATEYQzwoXLETWT0SuLE29BKp0FdUyhQ8MqOnXsgNpgm0RsH0T247fp+wG/YRDgzgXMt
	y4kL7IdgVt8dwXK+fBu/XFhFgOoLPWg9VJRwkjVorOOiM8co2WfSzW9bmBkcNCUWYTYSf/NJNQ0
	7PIhj1/mMBFCGNvZBT0MJwg6dAdcBLSpsPlcfCo0amii7+xB9mPQrfEmxj3lLJP1EBdolFhwph4
	VJtwT/J9qo9OxzDnLCdY9/BLmUhuETmEO9yW42PxCk9355vmB+0b7ZV55J0SZyVmyCKBxSP+Uqd
	oPm/+dww
X-Received: by 2002:a05:6512:39ce:b0:5a1:2a8c:d6dc with SMTP id
 2adb3069b0e04-5a13ccafadbmr3870240e87.13.1773068805450; Mon, 09 Mar 2026
 08:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260302-bst-v2-1-c7bfbed68d10@gmail.com>
In-Reply-To: <20260302-bst-v2-1-c7bfbed68d10@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Mar 2026 16:06:09 +0100
X-Gm-Features: AaiRm50s_BRGZVzLDZ62jUR4o1sZ0eDPxuow_fMhTFzk1FXD5XNYgYL9ecpU_OI
Message-ID: <CAPDyKFrgq_YBSgSookD_MsidNoKYXQJiFr3pTRmXtek8X38m=w@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-of-bst: Fix memory leak in sdhci_bst_alloc_bounce_buffer()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ge Gordon <gordon.ge@bst.ai>, 
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Albert Yang <yangzh0906@thundersoft.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_080648_352716_C0356B16 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, 2 Mar 2026 at 14:47, Felix Gu <ustc.gu@gmail.com> wrote:
>
> In sdhci_bst_alloc_bounce_buffer(), if dma_alloc_coherent() fails, the
> function immediately returns -ENOMEM without releasing the reserved
> memory, which results in a memory leak.
>
> Add the missing of_reserved_mem_device_release() call before returning
> -ENOMEM to properly clean up the reserved memory.
>
> Fixes: 695824f45629 ("mmc: sdhci: add Black Sesame Technologies BST C1200 controller driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Fix Adrian's comment.
> - Link to v1: https://lore.kernel.org/r/20260301-bst-v1-1-ddbc22ec3ed9@gmail.com
> ---
>  drivers/mmc/host/sdhci-of-bst.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-bst.c
> index c124990a64f4..f8d3df715e1a 100644
> --- a/drivers/mmc/host/sdhci-of-bst.c
> +++ b/drivers/mmc/host/sdhci-of-bst.c
> @@ -425,8 +425,10 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
>
>         host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
>                                                  &host->bounce_addr, GFP_KERNEL);
> -       if (!host->bounce_buffer)
> +       if (!host->bounce_buffer) {
> +               of_reserved_mem_device_release(mmc_dev(mmc));
>                 return -ENOMEM;
> +       }
>
>         host->bounce_buffer_size = bounce_size;
>
>
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260301-bst-76bb7c6d7931
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>

