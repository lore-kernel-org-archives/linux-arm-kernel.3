Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4464C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niIEC24pa2jxdKXkefJ3vkZfAtNqJpvIieuArrIyjOQ=; b=A6Oqfk0cg8dGe/3wu4xudts74T
	ON3L8TfdMGmr9i7IhHPPHwquQ2akPV0pw3EGh0OG7zbiMxVO2qax5QpMLUNajTLTIkoKFeDTseYt2
	4b8HjEjxNaUZMUS58HuFSeQWnjOdbiAruAjXhdRad+aqCNXFl4pdrk7WafQGmgc2VFfH+y4ddq4SH
	AvdLAe1ustRzHWA43AJnWDmtrSqsn3SA70cHde6DCF/hQDJV6J2olBIfITlsqE0rPlfR/cLs2uX6J
	FalvFIUNRKns9UQj3L+E/QG+G2CLoEmkg7wm/OzsGEvz3jxc11fBJGS7nVbsN1n4aDZVLVAuWkpci
	zvHFSh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRo-0000000DRvo-3VDR;
	Thu, 19 Jun 2025 15:45:04 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDK0-0000000Cqfx-2FIK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:20:46 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e740a09eae0so712689276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750332043; x=1750936843; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=niIEC24pa2jxdKXkefJ3vkZfAtNqJpvIieuArrIyjOQ=;
        b=QZt8lqDvVmkO6EjTJwnRNGre11Cu4SS2KpHTqiesXVT/SJ5P/HtT//1QTGY87/BXx/
         UnID803UoRnuw+1hGeBfpPGbuij398xrws08BN8yoiSfOl6JCPhjrFs19VGKmc1GXgU3
         /s4azL0ILygmWWZzktGcPEdws+yo7VxEOXFY5OBaJU8L+kSYZzT/YeCJTlZ7PcFokAg8
         rwrEPwbmPthntGcrQdjnOP20Ac0SFh2PDVhJCMyalYMJt17iV5esT5I53TxkJSr25kX7
         3Rt+/M0J2r4rfZXlPIlZAHh/TkZmDf4ZEdfXLdYxbB4dF1bi2oVBr0zn1kyYfxdSUvOf
         vvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332043; x=1750936843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niIEC24pa2jxdKXkefJ3vkZfAtNqJpvIieuArrIyjOQ=;
        b=swbLsu4okW8mf05H2aZjPhFeQCx+vjlGgHzxsYcwtpj49l2xmDtZTc2ifbFgoWxD1f
         zCckBmLR/b90cuU6HoVkdJ8iRQ9lyqby+u2U97ZkbhjALQA/gpvVYCNl6YFqVF9Dgnh2
         2NgsHtdaWFQP+t2qC38ptYSucWPTo8tbP+YAucIeO8zRKEn3Yvys3KDu06gGVODbxfab
         SG+EcRFIDIhACktxaTsMoI6ctEiGiMNxX1rFmGSLGoVfnqRWUvBhuQqGucUpoiedV8uN
         sKDOp9ZcW2pH0hfB/dGh75PXtIKsfBfNYgipQKsHKX54ZrgpkMBI8zfzQpd1CToymqRR
         XSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRkXy1iJKAb3XdSoemf1IasLnAVCeJTT2AV8t5UZaQ6UGj3QX3fFduBZWjFCEny+Qaja0FrD2iOlAdm7k2f8C7@lists.infradead.org
X-Gm-Message-State: AOJu0YyN5fPgEZhbRrQd/tVZG25KaYUEOJu3oWkzH4zJCkfdz9SRtPn/
	W4Rvmo97bV35P7MLCXHIYR35cRGx6it+Tr8lD1ivPTv6Ao0yVLKujLLYfGFNQiIFAIYm6g497IY
	yk2CUEez7vsG9jeJNBwXrr6Wyr3KfSNnJVCb4kX8MMQ==
X-Gm-Gg: ASbGncuks/GiJPo3sqT0vbuM7aMjIn+Sh3f3TwU5tY1K444w0St/rc2Cp8ifW2WpWZ4
	hui7T5XqWRYIyZpTZzfmAmaV+11B/CVu796qLOEnrJsYe7iFdNQkhPWX3avVSA7YxVo95xKoaEv
	SlB3pmu4xNcGkxu9N52/XEBlPh8aeP+HMlYPN1UyOn9NhX
X-Google-Smtp-Source: AGHT+IF2iE0ox/gzxKHz5bI8Q+Pkgb8UWe4OY/z3MjCCMZXinEnzR7Rqk/xTiCIm/KwZ4rpmEsnSRUYX7m4o4AQKZbE=
X-Received: by 2002:a05:6902:cc6:b0:e81:7e16:aad7 with SMTP id
 3f1490d57ef6-e822ac7a461mr27597842276.24.1750332043584; Thu, 19 Jun 2025
 04:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
In-Reply-To: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 13:20:07 +0200
X-Gm-Features: AX0GCFvXjxV2EcT_wfBSHPu57s1TY2VkiQlHaijGThkd0p21SEv0wZoDeoPKInc
Message-ID: <CAPDyKFpCPLCxp54yjBAaLz2tJK6Ouk-ikpvs9uby7aXnic=U7Q@mail.gmail.com>
Subject: Re: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_042044_584634_D9401CD3 
X-CRM114-Status: GOOD (  22.51  )
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

On Thu, 12 Jun 2025 at 13:26, Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> If msdc_prepare_data() fails to map the DMA region, the request is
> not prepared for data receiving, but msdc_start_data() proceeds
> the DMA with previous setting.
> Since this will lead a memory corruption, we have to stop the
> request operation soon after the msdc_prepare_data() fails to
> prepare it.
>
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Applied to fixes and by adding a fixes/stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c |   17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 3594010bc229..56b4999fe58f 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -834,6 +834,11 @@ static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
>         }
>  }
>
> +static bool msdc_data_prepared(struct mmc_data *data)
> +{
> +       return data->host_cookie & MSDC_PREPARE_FLAG;
> +}
> +
>  static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
>  {
>         if (data->host_cookie & MSDC_ASYNC_FLAG)
> @@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         WARN_ON(!host->hsq_en && host->mrq);
>         host->mrq = mrq;
>
> -       if (mrq->data)
> +       if (mrq->data) {
>                 msdc_prepare_data(host, mrq->data);
> +               if (!msdc_data_prepared(mrq->data)) {
> +                       /*
> +                        * Failed to prepare DMA area, fail fast before
> +                        * starting any commands.
> +                        */
> +                       mrq->cmd->error = -ENOSPC;
> +                       mmc_request_done(mmc_from_priv(host), mrq);
> +                       return;
> +               }
> +       }
>
>         /* if SBC is required, we have HW option and SW option.
>          * if HW option is enabled, and SBC does not have "special" flags,
>

