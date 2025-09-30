Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F968CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2XzdHgwhHFe3vRRHqIivPQxQxw1sb8jKoJSkurcqII=; b=uachx0VOjhdAps06h0Mh1WiUyJ
	lnlHaX41+VJxX8hSrHbxD7HqyWtI3KnuZ3IqgCfQ+9P1kTP5hniVIkvv3VF4LlRVCZigg7OS1Mhw9
	sqvxp3eHOrkEnQGuLRLKhkv1EcBhvJ0lOQ6GYMxNaXFNysI0lzJcZwc+v5XI9kvGEhb89gjMZBh6x
	XZq18fezMAZi3WSZoOOTY1BHTaZIeCr5viB+5NOBq063KHtNX+IBJi6LI/k2GKLX2ct9okiZ6Rrzb
	kNs0FxSGeUH79D9BnZ7o8IVW4d+q9Ba2FRWVk8zMKI83AISw5S2ZPZCycDSj0X8qMDT9xvdW9R1le
	pZUazzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bqz-00000005afS-1lw1;
	Tue, 30 Sep 2025 15:01:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bqw-00000005aey-0wbS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 15:01:19 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b57f08e88bcso3567364a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759244477; x=1759849277; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h2XzdHgwhHFe3vRRHqIivPQxQxw1sb8jKoJSkurcqII=;
        b=NXm8sN8fOKqCNpmXn/c4Y+yJIWqVE9k2pZ2cAqxk2XodesjMcFF34Jmvps7nyN8+MS
         twAF2WJLX8SglPlF4TTy3gd4XB3Kfswg3EYMiM/7MWGjHyHLr/o7yYfAXp4qKUHM1Fbh
         XfGhUSgP4WxwspwfCg+f6ywsCt1K8rCLlX7z108w2r1I/S2mrSdmLtudRKn2n+/eOSF4
         dUjeN8n/jp6BIkpb/mB0xavDBVlMeDhF8nyX8nFrouZX0Uz+O29rwP9WMOGJziFg1ylk
         jbP5ASn29pVTSp0rAJHr1oZiQG2Y3otAlve4eIsjcpMKfS3GbpEHG/REbMj/RHVwgcGW
         m6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759244477; x=1759849277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2XzdHgwhHFe3vRRHqIivPQxQxw1sb8jKoJSkurcqII=;
        b=DJbKnFXn//favj8wInRty/h5iZYQgI+uWOu1A+YiqmbGLb5NvYFgjppQFpDdz3KEPI
         p3OUrGwbbz5sfQ5yGaIns5/ojRUb/Vz62/0lFdvYZJ2qjDF0VZN7wkUCd3XQzc68PkOf
         EvVY5mzZqExJoquNCJcosvOPYjf+CfO4lJThpk0di8G0WpmY64cTK7dmrdfaQp2dBGab
         02Ojp7VPqo7g4mvVQQLpzYUfgmf4OIbA8Hi+N53xTtzc+DJ6uuXdcm1hWLyIqOeJhcWe
         TtTQmH8wTP6+PLw3Gsxcmqj5FVeZeKzjRXDEJJa6T7N3FiyyIPvmafBkc6hYe8IvMQTb
         kepw==
X-Forwarded-Encrypted: i=1; AJvYcCXunV75RIzc5AsAAHw4s5OQXwMT3ox4L41lcyuQf/Fzmz5Ka13sP++jhbSgGqOJVaiJ+U2HwatxzJYLIfp8G8Fu@lists.infradead.org
X-Gm-Message-State: AOJu0YzUg1fHolnjEjZclYYUKXHce0Q0RkEUWVuPyZFeq9uF0s3uXKep
	MhlvQClYDywQwFaR7wqMuvSqOERaxP49wqDg9xLFLfnm2ITrlN2NFmUSTg52BHyvv617/i3TAqV
	7kMYp8wPHHiiwG1P/JFXXyENUWt0Q9J5JPqIPYngarA==
X-Gm-Gg: ASbGncvgUwWfO+mDCaHnlI7vD/FYC9awwmxq/1cUdxKFFmc+Tp1LJi/ubASfiU2kxyF
	Q0Kx+P+hbddlUmJCJLonwSpwtN5tro1970+OtG8pW4MOVLjpOAETf3KUR2u074E0VcfrHSCVPDN
	udUQkG6bbrpl1BmvRQKCZQQJ7AjiMCskWCmDB7quO/8iD1/qiF4Ykex4OTcOzp3FrBGVThCYRxZ
	uekiUnpQWJzwiha47Y15pecu7AHNYmY6dOmdPkwfxnMnmBCNEiOF/EDW2BUbSzpnp0fGff8Yfs=
X-Google-Smtp-Source: AGHT+IHNzxxQYIUOVWQwfBscvE5oxt4qzgeppNl6lLLtKTTJxUl56GZ8osTujysP+N/gRTQxeXX9DykSkLFD/mtbljA=
X-Received: by 2002:a17:903:244c:b0:269:96ee:17d3 with SMTP id
 d9443c01a7336-28e7f43cf91mr300945ad.51.1759244477089; Tue, 30 Sep 2025
 08:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-6-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-6-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 30 Sep 2025 16:01:04 +0100
X-Gm-Features: AS18NWBHJU37zi0PrLCxGOzSBNMTyUbTu0q0VHKaTl-dOJ21frkcO2v_LhAwQ7k
Message-ID: <CAJ9a7Vj16gN40oukxZHU=PPM15Wpe-whLM9PeBTg0i8iZcMsrQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/31] coresight: etm4x: Add context synchronization
 before enabling trace
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_080118_273968_81388B40 
X-CRM114-Status: GOOD (  28.45  )
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

On Mon, 15 Sept 2025 at 11:33, Leo Yan <leo.yan@arm.com> wrote:
>
> According to the software usage PKLXF in Arm ARM (ARM DDI 0487 L.a), a
> Context synchronization event is required before enabling the trace
> unit. An ISB is added to meet this requirement.
>
> Improved the barrier comments to provide more accurate information by
> specifying which section of the document the requirement comes from and
> clarifying its intended purpose.
>
> Fixes: 1ab3bb9df5e3 ("coresight: etm4x: Add necessary synchronization for sysreg access")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 +++++++++++++++++++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 31d4838b47ae4a3a96c6a06774707214943268fc..999bceef4cd771e46aec891f4c814a95e0921c2f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -446,13 +446,37 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
>
>         etm4x_allow_trace(drvdata);
> +
> +       /*
> +        * According to software usage PKLXF in Arm ARM (ARM DDI 0487 L.a),
> +        * execute a Context synchronization event to guarantee the trace unit
> +        * will observe the new values of the System registers.
> +        */
> +       if (!csa->io_mem)
> +               isb();
> +
>         /* Enable the trace unit */
>         etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
>
> -       /* Synchronize the register updates for sysreg access */
> +       /*
> +        * As recommended by section 4.3.7 ("Synchronization when using system
> +        * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> +        * self-hosted trace analyzer must perform a Context synchronization
> +        * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> +        */
>         if (!csa->io_mem)
>                 isb();
>
> +       /*
> +        * For the memory-mapped interface, the registers are mapped as Device
> +        * type (Device-nGnRE). As described in section 4.3.7 ("Synchronization
> +        * of register updates") of ARM IHI0064H.b, read back the value of any
> +        * register in the trace unit to ensure writes have completed.
> +        *
> +        * Therefore, polling on TRCSTATR ensures that the writing TRCPRGCTLR
> +        * is complete.
> +        */
> +
>         /* wait for TRCSTATR.IDLE to go back down to '0' */
>         if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
>                 dev_err(etm_dev,
> @@ -933,11 +957,16 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>          */
>         etm4x_prohibit_trace(drvdata);
>         /*
> -        * Make sure everything completes before disabling, as recommended
> -        * by section 7.3.77 ("TRCVICTLR, ViewInst Main Control Register,
> -        * SSTATUS") of ARM IHI 0064D
> +        * Prevent being speculative at the point of disabling the trace unit,
> +        * as recommended by section 7.3.77 ("TRCVICTLR, ViewInst Main Control
> +        * Register, SSTATUS") of ARM IHI 0064D
>          */
>         dsb(sy);
> +       /*
> +        * According to software usage VKHHY in Arm ARM (ARM DDI 0487 L.a),
> +        * execute a Context synchronization event to guarantee no new
> +        * program-flow trace is generated.
> +        */
>         isb();
>         /* Trace synchronization barrier, is a nop if not supported */
>         tsb_csync();
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

