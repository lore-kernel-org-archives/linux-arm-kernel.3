Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE6BCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jzhovyCdDMlzw591/uRWQjYXHaudQMt+y2lzzYkfik=; b=0AjVRVs/wqmTXg5JD+600nwYFB
	Bz/GCVQGMkF1VbThQoQ+YJsUGIKMFiyz0Ltg4PDOHX2a0hMfGDWKWNaHgNE20yTvvS/ileGiXVg9u
	iCSdOoFhL2jueWkO9euDqEK02A8EYh+KuyUm2gNZy8FV8VWPJ9QM2vT/8Or1Sc1HEe8s2sqIAtYzE
	sSQULc5fHfoyaojNoCjukwBslBv2TgOMW76jCUIEUTgyc+1h6NWowOtJsqZr7AoUCjgZ3Jx1MkxF5
	LOwnopKTVuHJ2Su0/q/YbIHb0xI8Y1WH3X/bPQzRKfMEXL0H7lAu3XLbvCzE34pStnk6Khk+eNDTj
	kKYPCoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu4t-00000007h6L-20nK;
	Tue, 11 Nov 2025 19:30:55 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu4m-00000007h5f-2ST6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:30:53 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-88054872394so874506d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762889447; x=1763494247; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0jzhovyCdDMlzw591/uRWQjYXHaudQMt+y2lzzYkfik=;
        b=p2BiH16+mmRViwJBNKZNMm4PsSOib8L802P6LZVqIpWswRxf3xwCOBytgayY3hz4sw
         dCyCUTKAi93qeTSiiUI+i33xhz3P8bCzBTtL3BQHmFm0WmStm+brUHIaBn5TZYKalSt+
         viW8WlErEfDkbr1/RosNOkeOB5/cjY+eOSa6vrV007hl9aMa9whmhlrdeUxFe7GD8n9K
         XTj1nLGl45vCLGl2CNH5JsuFNgzXt+/5slJZq1efZ9++n9x7E5Ohjr4gQVmHW4hsJz/S
         vBQSVZkcRa2kzVLaxX8peq/dOLrrdGbnHXpyCb6+PeJLtX0BekDpZnweT/0Ch9g8mc3b
         x/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889447; x=1763494247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jzhovyCdDMlzw591/uRWQjYXHaudQMt+y2lzzYkfik=;
        b=ok+HW70Xp7O+5u2eo+oIlTLMyXbfd2Fd1zxQzKp7yOVk1eU/9dk23WCPPmtRU8XxDB
         Y50ZggR+ppA8/YBz7OEzQZfptWnjKtL6L+AkovB0QgwQr3RyHsioSnZlrXO29vAXe8Wm
         ndMAx2VoK4AN+tiztx8oHG+JwRPyz0M2rxFcui5Nh01J6nIQn9nKbcGdTn0sbH4Cw7iT
         7CNvhtJfneYBujdtWO3FkySvRmsJjBnKjE8Oy8iglgiI+7TfwE/R6ulRIjmI1WhI+EM+
         ZTa9YwWyxlN0UzkK2waTNGdTujcukpbTS/+i4BG+QvkFusxoX3K5Qit5Yh/Nti64YP0q
         YnOA==
X-Forwarded-Encrypted: i=1; AJvYcCVW6h34kjEPSEbfdBa0JPZYvmI8Z/yR5f6v93oP/BRl0MJ7iZQhcNPVwkUcLOlZuSDEuAXvt1Bcb+e4TGsND3G9@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFUaoT/FuTsDce62Y/3ZbqyQ9uj4fbTk7bRwiFLzaIL1fk0mG
	ySPFkoEXWAZwHpLj37SqfiuCVxQMLBtg5K0epYC5U45La1YmbgFNLPRpPBjd4ts8E2d2/iLw3SB
	EGsnoHyDmVvOugNU+R+3JTCQ1y4B1vQRroleEbCSJ2w==
X-Gm-Gg: ASbGncvxpkzSRNIlB29WSefz6qB7+G9BfUraaPgiR69HlurmhRjGTsnC4smwlEsoOfU
	CSax7NYkcSvWun0kD5XjP+1GDPeYvCXN3+G0+tkfkgkgk7gOSITRe+uUEuM6XJK1rlf3DKWRldc
	y/avFqK+YTxIXNMyKNPtpSWEK/EgJvn6cIeX1byC7vdZDwo9AI4JjbmIQwsxh2Nlv94RkgG0M2e
	Ic5uDBFtk9/zxiW1i1m+vej8gcnkCVx3cO8brRm5pS/qNnBz71+XoHWwrscIPfHC9mzpKmDG6TN
	3xyC2qFtbwPYZOXYBUHb65R6XkZj6T1JlCb5IpRnDWntq09hJIi7QHTF8s8H
X-Google-Smtp-Source: AGHT+IGThWKE77hsPoXqWgnkV7dySmx95GCAux2QX51fNtZJUGhMymurQtLnvR49RwGbhitCyFOn7Ens77igYTz1EQI=
X-Received: by 2002:a05:6214:d61:b0:87c:208b:9539 with SMTP id
 6a1803df08f44-88271974c91mr9002396d6.28.1762889447036; Tue, 11 Nov 2025
 11:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <20251111-arm_coresight_power_management_fix-v6-7-f55553b6c8b3@arm.com>
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-7-f55553b6c8b3@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 11 Nov 2025 19:30:35 +0000
X-Gm-Features: AWmQ_bln1T3k3hjGWWraYQQ2PzN-9xXByJEWmZBfrUj2dkKidxrkpTlsMf9lCGw
Message-ID: <CAJ9a7VhOxystZgx4n083UvHJL_95cXKdGyLkdu-dS9zPqPCfzA@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] coresight: etm4x: Remove the redundant DSB
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_113048_644210_F3182FA3 
X-CRM114-Status: GOOD (  24.59  )
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

On Tue, 11 Nov 2025 at 18:59, Leo Yan <leo.yan@arm.com> wrote:
>
> As recommended in section 4.3.7 "Synchronization when using the
> memory-mapped interface" of ARM IHI0064H.b:
>
>   When using the memory-mapped interface to program the trace unit, the
>   trace analyzer must ensure that writes have completed, to ensure that
>   the trace unit is fully programmed and either enabled or disabled.
>
>   To ensure writes have completed, the trace analyzer can do ...
>
>   If the memory marked is as Device-nGnRE or stronger, read back the
>   value of any register in the trace unit. This relies on peripheral
>   coherence order defined in the Arm architecture.
>
> Polling TRCSTATR ensures the previous write has completed. Therefore,
> removes the redundant DSB barrier in the enabling flow.
>
> Update the comment in the disable flow for consistency.
>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 23 +++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index fdda924a2c7117a6828e5325d78586b09e75febd..bdf5ab85b2213dfd601391fdcf50960667fa7cea 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -475,10 +475,16 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>         }
>
>         /*
> -        * As recommended by section 4.3.7 ("Synchronization when using the
> -        * memory-mapped interface") of ARM IHI 0064D
> +        * As recommended in section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        *
> +        * For the memory-mapped interface, the registers are mapped as Device
> +        * type (Device-nGnRE). Reading back the value of any register in the
> +        * trace unit ensures that all writes have completed. Therefore, polling
> +        * on TRCSTATR guarantees that the writing TRCPRGCTLR is complete, and
> +        * no explicit dsb() is required at here.
>          */
> -       dsb(sy);
>         isb();
>
>         return 0;
> @@ -974,8 +980,15 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>                 dev_err(etm_dev,
>                         "timeout while waiting for PM stable Trace Status\n");
>         /*
> -        * As recommended by section 4.3.7 (Synchronization of register updates)
> -        * of ARM IHI 0064H.b.
> +        * As recommended in section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        *
> +        * For the memory-mapped interface, the registers are mapped as Device
> +        * type (Device-nGnRE). Reading back the value of any register in the
> +        * trace unit ensures that all writes have completed. Therefore, polling
> +        * on TRCSTATR guarantees that the writing TRCPRGCTLR is complete, and
> +        * no explicit dsb() is required at here.
>          */
>         isb();
>  }
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

