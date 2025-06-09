Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5005EC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAiRbciuoiorHgM5EFNBfKf1XaHXDRt4R+Ad1zIscbE=; b=h6m/VI38CVzmJe3x9Cr2UbbICp
	jQwqQX2dEgxiIRwQgq0ztNfHkztg88/nAhR7JmHKxycM/ZwuSSqefpleRP7zHFeCSgeQU8afV8x9I
	UNDevEqTkd6WczW4ATt5s6mngxcz3dRAwnlH2vHfOQW0crBhnobdFpIc4QcaZEy1hIvMhMJSUmib7
	xAje8KGwBLzTOXKLtmaDi4V26UH+06IpREyFsOvBmYUAxjsCr9jwYbikCPeyfoOVdwKWZMioeGoOH
	I3xQF8Hmv8fHq/GrIE8kjt+sjvxaA15MnnRU4vJK8g9XqgA1NUsi8q4bVQh9TtEBVuhu2KzKks63G
	WE8GAVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcYs-00000004Exx-3gk5;
	Mon, 09 Jun 2025 13:29:14 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcWe-00000004EOX-45CO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 13:26:58 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e731a56e111so3712289276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749475615; x=1750080415; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mAiRbciuoiorHgM5EFNBfKf1XaHXDRt4R+Ad1zIscbE=;
        b=G+lISmyvAdWadDnWcOKK/bD6iIU4XEUaDKdh9DmHLYLNwdAOQrGFelJJxtGVbpslB5
         cj0vN7tDRnKZmb9e/n42UnJfU3lNX2+/KSJxFiK4VWsqU7vunsiKW0V7TnMkz9TBbPiW
         MGeIPl+0UKLVDY+DlmRZyz+BD7rdkVYJTzd7TFgAq+vf1uP5IiLVFDEGE7ZOH9IVw5b+
         FlYxjRRjjuQk390MfLw7cyGfDYWdcAJqtVXatnzDFCw7z9N4BwNOt9ePccTqqaWKetTC
         gWfL7sTw36Dr4lQt0pxlvZU2eDgTsnKyNV1wHiig7+Fy/Za/qLWhYnsdSQVxOl9G00HD
         k8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749475615; x=1750080415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAiRbciuoiorHgM5EFNBfKf1XaHXDRt4R+Ad1zIscbE=;
        b=EbiFsxXMpSPOk/MmTLUISCRD4sUM992aCwUI6hKdMLcPEw5gHi73FJJrH+bRRPC/Dj
         +wRcPUn9hXvoyaAP1ZcY98kRiFoQ0UBojJb+JRUiYqySQKM3l3xpzhrtgawTCqwqisrG
         Tcl24Vn6fq1w/rNmsXjMzENhKUBWVJ/R5fHKe2yRlmLeNJ8E0BSgKakhqadOAcG18BZ4
         w1I4T+8ffeT4loR74k6VvFKg0QLlWMP76cVcI9K/CFrk1cMGUkD08Xkx//RBxlo1SazE
         ae+orkGWElSFRDhlY53vxfs0faJ2zzGyqTS4UaGbN64de3+DS1CsdRslPVdfMVH0Z3fh
         XoCA==
X-Forwarded-Encrypted: i=1; AJvYcCUyKkztEDXZJU7w5JOk74tJGi1JiRauwhHQQmFPt7LwOJfJCJ1Lc2FKZTgWRMR4l4V6pOJ4DY9UQmjFNJ+YWyS+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1GO8DyFeGyKaaTURcAumn8k4NSpniogSy9x9Bsd5jyDEJTtaz
	nt/Ejh87bO9rFdtKrTAciRA31WhMitP8J21nE5X1QSjOe/ajwQfYwxylcfMCR7hczOAfD7cSjfv
	u0sSz4Ir67ZETAlgET4sKi6MDaQ3M6REK8Z8MhprlNQ==
X-Gm-Gg: ASbGncs/x/JdbQP9mg/1mRUTg4ossJeW2SOU6IuI/yRygLna5GvbQAnSKFUexgMjg5F
	Llb1KezvqYOkYX2kykerbeRpEScBVmFMi5h95hyHw6jqFJ63Rcs+clGTNymZMQpKZXkjwuK8uN+
	UJXi3NTzMuWeuxPt1RKeTuQr9T8H4eXMWvSbKvnmF0HUd0
X-Google-Smtp-Source: AGHT+IEdp4Uo8DXeT5EnMuQJvMNr8+WtEiGeMqcg+uuVjNdRmH13ttSqp1H/4vx3AbsAuwuDP4cRp1d7FkuP24yL/II=
X-Received: by 2002:a05:6902:98f:b0:e7d:7b06:c567 with SMTP id
 3f1490d57ef6-e81a226a49dmr18772294276.8.1749475615295; Mon, 09 Jun 2025
 06:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250529104853.1987456-1-alvin.paulp@amd.com>
In-Reply-To: <20250529104853.1987456-1-alvin.paulp@amd.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 15:26:19 +0200
X-Gm-Features: AX0GCFsV0kgRqKk0VesGIpH7txHIuNQCBKwAYohUvjNa9Wq16CR9xgCE78X7Q9Y
Message-ID: <CAPDyKFok6Ftr6OAHpy_qL3S17cecHT9f2tKWagCd+KvVFSmAFA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-of-arasan: Add shutdown callback
To: Paul Alvin <alvin.paulp@amd.com>
Cc: michal.simek@amd.com, adrian.hunter@intel.com, git@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_062657_020366_C97C5A8D 
X-CRM114-Status: GOOD (  23.18  )
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

On Thu, 29 May 2025 at 12:49, Paul Alvin <alvin.paulp@amd.com> wrote:
>
> Implement shutdown hook to suspend host and disable all mmc clocks to
> increase power saving during shutdown or reboot.

So how long is the shutdown process for the platform? What do we really gain?

In general we don't quite care about power-savings during shutdown, as
we are going to turn off things anyway, right?

Kind regards
Uffe

>
> Signed-off-by: Paul Alvin <alvin.paulp@amd.com>
> ---
>
> Changes in v2:
> - Make use of platform suspend instead of driver suspend as driver
>   suspend will only get defined if PMC_SLEEP is configured which
>   results in build failure if it is not configured.
> - Updated commit description.
>
>  drivers/mmc/host/sdhci-of-arasan.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 8c29676ab662..4abdad3c4e5b 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -2056,6 +2056,11 @@ static void sdhci_arasan_remove(struct platform_device *pdev)
>         clk_disable_unprepare(clk_ahb);
>  }
>
> +static void sdhci_arasan_shutdown(struct platform_device *pdev)
> +{
> +       sdhci_pltfm_suspend(&pdev->dev);
> +}
> +
>  static struct platform_driver sdhci_arasan_driver = {
>         .driver = {
>                 .name = "sdhci-arasan",
> @@ -2065,6 +2070,7 @@ static struct platform_driver sdhci_arasan_driver = {
>         },
>         .probe = sdhci_arasan_probe,
>         .remove = sdhci_arasan_remove,
> +       .shutdown = sdhci_arasan_shutdown,
>  };
>
>  module_platform_driver(sdhci_arasan_driver);
> --
> 2.44.1
>

