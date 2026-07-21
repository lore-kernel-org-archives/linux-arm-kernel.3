Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFFBC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLoRxgeU4eLbTE5cBel+nzCrJ1tx2QkUTBvlydG2Zzg=; b=nbqXz60gn4BBAJae86ZNR4dlFM
	bUJDh0hV8w8TzELdW14zYVpk5EZN2Pf57dV+C5+PLxey08pnb+8pWOZffRIavPj7tiEyRHlOu3BNZ
	wsI6W7Fo2Z5GZhdEagrgjAEobQKKlTNeHGIss67Xv+4gUuvK8PmWFSDHWoa3oHjzGEOR1gpRnjXcW
	+KyL7U47tTmvXrpyQi6AozikYnU6bBQ5ZWpIz9IZa5zvLfc/CI3hNX11VRkc2HmrVc7fLWkkq0Noy
	r31/i3uBT/IJGrf4keFovkCHwJ+F5aIFY5sSXhcFprDDGz2U6ozqHU5XvZ6jdcITLE6qO1aW0Q5ga
	jqtNLu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA7b-00000009TZK-2l4J;
	Tue, 21 Jul 2026 13:02:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA7Z-00000009TYG-1bQF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:02:54 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so2003786166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784638971; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3yqPBgxt3qvhg2jW1jFMfILWdUqSSOt4B0/bfuCPbTkftidEpV4Th4MIzaUAg+8+y
         hSvNSP/dXP7DCv5pQjLKoexqjO01XYndj6SCTPRyNOhvi88keRyFMxIP2TBMeSV+W11V
         NB5LLgzalfaP/EJfltg6rx8fsTeCz5WNyrvCHPZoLs1AdCqAjcK4Cjmizp+rUxM1mwXv
         nN2PNhenW/WMDFxTS55mPCkJxQhVNEynWL72DiAKzH2xA25FeZBuOqIc6jIKMrdBwj2G
         XCwx6kNLmfYSuOYgx3fl8Wgrn6mC7GNIZ41ssEj8Q15ZRExiKaj4D1cE+3txsVEVI1AU
         CAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PLoRxgeU4eLbTE5cBel+nzCrJ1tx2QkUTBvlydG2Zzg=;
        fh=Iy2McslmmGP7TTMG619L30uMlQW3Ju6x4HINl6OSgJk=;
        b=ESvzjmfiurt24iBjgn/7XCfARaZTrKlNZ1FOi7qPISfbDxlfbH2pCY08mQwLbYy+Z/
         YGWioP4qI8A5H+clnXhGFgNH6oe745gde+tsqfG50t63G7s5k2ayg2RZsOmVyA5uPqYb
         4g1Fw1c9I/ofKgZp3lCL0qTQCesPJgep4OXxS6W8dnyP4/jMoL+DTUUChupCyppw8Ho5
         AK0MVk+6OZ+IgNbHFwXtU7d/5OhRvgwOqOJr2draLp8OLpBE3eagelo5RREs2xQcKawf
         D6wz0m5DNI6eTqRlqyZ+y6JAIWKEQd/70EYV/6iuTJIDCeskOllOQEHkd7cg1IrU7mlN
         P8lQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784638971; x=1785243771; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLoRxgeU4eLbTE5cBel+nzCrJ1tx2QkUTBvlydG2Zzg=;
        b=EB9xrTu45z06tJr4Nt6aQUazRdwXqj0DxtWaoH84VcN9C7GUoyckyVnvtxAp1sL9cu
         kx3+1Ion05aBiIXH4egWMgXriXbtqQXwrpg/UyrL82drs5A587FDJ7F0y6WqseBPLuvf
         boXByRhdzOgpmCvxwwKDog9qmuM9soWIXuQ9UVnZPiN9el5m1LswzyLNi3gMNWIrHyIN
         zovAxAbRzxj49gFGOrpMOlKzw60pzl5qs/68d7b5cL4y9nA3riScuUW1nlA25cJRAhSx
         gxYqL5lsUYp/cJUy41CZm1fIjzInLrujyytCgMh/s9cfe4nr32jF9V28KKKz0ZevMjGG
         WwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638971; x=1785243771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLoRxgeU4eLbTE5cBel+nzCrJ1tx2QkUTBvlydG2Zzg=;
        b=s+CaIp0ZtuxtIKVSUxLEnb8J0wiVNcXXi/FOasmVn8oKnI+A3K9pSKykOSTO1ggZ+m
         Elplnu1ZG815lGsXXeWs3pW+420voXYWxNmkAU7JCn6HZXGsJTbiwXzFZfB2GbL6MMBb
         WTV5al8G7bXC3cfcpeUDRTPM3j2fw0AyXAtlfV6xkQAevNMo4gQHobeJqzQ6VBENFMrW
         b6JjHcG9bPEt7+iGUPWuz7ueN2LcJS0L/MrF6ga9WF5Ytb32b1xY1JtLXxObVWja5Msf
         y35w8sqrPhztvlADVOew36inQvLynCReG+WPuOLR6y/epDiJqkKXXssVB6E9aJlsLifl
         W1Tw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1dmFrtqHe9qy4oNql//4yf4BcdbhlilnPlbScsK1BRTzC0HIPKvRvGoGs2ULy33N8vblIILDuIkuqH/x5GwWv@lists.infradead.org
X-Gm-Message-State: AOJu0YxYaahmq79pDBVjOReQw8VyflrblL5p5bHRkmwztjTa2im72jCJ
	y/n0S7ddOnshnjsXiwjTiVXfOY9ac3/9XBmT0WHpUXNdDPq1k1vJy7XnndRCPZrHpZHCy5msABE
	kQW28WfYqlLdAVCzmU/8K6R6V32n5KBPYqZx4cpcLkg==
X-Gm-Gg: AR+sD109XbUm8F+vM43kLXehnuBrlGEm7UV8GzedVtbFDIVzYOU97QDINhQW6GrxBxK
	lkVkh5c7mUNRr2qGHfQc1I7GSE7YQSEjo3aCh2v9OQBQvlAqv18V5r4JnICj/lEOWyvpjfdLDVZ
	Yeob7W3Y8rCufX2Nl16WIkaxpt4rfzUPe0fz5xJoslGftg5n1D7Cq09wjBORHFBiL6NAD0O9MfM
	Vkm2KMuuOat4eH1Xboey8A+poifmY2cih4xlr6y0K8QHQJVoorspfQBOzo44/Bf1Plon99loC12
	LwSke8WppMP3buMXwA==
X-Received: by 2002:a17:906:ee81:b0:c12:34ed:e0fe with SMTP id
 a640c23a62f3a-c16b486b059mr764236766b.60.1784638970824; Tue, 21 Jul 2026
 06:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260718031146.3368811-1-gahing@gahingwoo.com> <20260718031146.3368811-7-gahing@gahingwoo.com>
In-Reply-To: <20260718031146.3368811-7-gahing@gahingwoo.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 21 Jul 2026 17:02:36 +0400
X-Gm-Features: AUfX_mybR4TJcD7UtKT7vkslJHd83avKACirSY-Al4DoJE_V_nYHHDDfXmU2CdM
Message-ID: <CAKTNdwHL2Z3h-FN7LLPshz5B0duiMw_pyfe=VG4UDhfm8igZ6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/8] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, chaoyi.chen@rock-chips.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_060253_471426_9D8D0853 
X-CRM114-Status: GOOD (  27.48  )
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

Hi Jiaxing,

On Sat, Jul 18, 2026 at 7:11=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Add RK3576 support to the rocket DRM accelerator driver (used with the
> Mesa Teflon TFLite delegate).  Per-SoC differences are selected by new
> of_device_id match data (struct rocket_soc_data) so the RK3588 path stays
> unchanged:
>
>   - match rockchip,rk3576-rknn-core; iterate its nodes at probe
>   - RK3576 takes six clocks (adds the CBUF domain ACLK/HCLK_RKNN_CBUF):
>     the CNA fills the CBUF and CORE reads from it, so the compute path
>     stalls without them.  RK3588 keeps its four clocks.
>   - RK3576 requests one reset (srst_a); its BIU reset (srst_h) is driven
>     from the power domain.  RK3588 keeps both.
>   - RK3576 spans two power domains (PD_NPU0 + PD_NPU1) and attaches the
>     list explicitly; RK3588 is single-domain and keeps the driver-core
>     auto-attach.
>   - RK3576 has no maskable completion interrupt (PC_DONE is read-only in
>     INTERRUPT_MASK), so it polls PC_DONE via an hrtimer; RK3588 keeps the
>     DPU completion IRQ.
>   - guard rocket_job_timedout() MMIO behind pm_runtime_active()
>
> Tested on a Radxa ROCK 4D: the NPU probes, powers on, brings up its
> IOMMUs and runs submitted jobs to completion.  Full multi-layer inference
> is not yet correct on this SoC (only the first operation per power sessio=
n
> produces valid output); see the cover letter.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_core.c   |  39 +++++++-
>  drivers/accel/rocket/rocket_core.h   |  22 ++++-
>  drivers/accel/rocket/rocket_device.c |   4 +
>  drivers/accel/rocket/rocket_drv.c    |  22 ++++-
>  drivers/accel/rocket/rocket_job.c    | 127 +++++++++++++++++++++++++--
>  5 files changed, 200 insertions(+), 14 deletions(-)

[...]

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 2f1861f96..ce3f7c92e 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/rocket_accel.h>
> +#include <linux/hrtimer.h>
>  #include <linux/interrupt.h>
>  #include <linux/iommu.h>
>  #include <linux/platform_device.h>
> @@ -20,6 +21,16 @@
>
>  #define JOB_TIMEOUT_MS 500
>
> +/*
> + * RK3576: INTERRUPT_MASK bits 28-29 are read-only (hardware rejects the=
 write),
> + * so the PC_DONE completion signal cannot be routed to the GIC via the =
normal
> + * interrupt-mask path.  We poll OPERATION_ENABLE every RK3576_POLL_INTE=
RVAL_NS
> + * instead of waiting for a completion IRQ.
> + */
> +#define PC_INTERRUPT_MASK_RK3576_PC_DONE_0  0x10000000u
> +#define PC_INTERRUPT_MASK_RK3576_PC_DONE_1  0x20000000u
> +#define RK3576_POLL_INTERVAL_NS  1000000LL  /* 1 ms */
> +
>  static struct rocket_job *
>  to_rocket_job(struct drm_sched_job *sched_job)
>  {
> @@ -137,8 +148,24 @@ static void rocket_job_hw_submit(struct rocket_core =
*core, struct rocket_job *jo
>         rocket_pc_writel(core, REGISTER_AMOUNTS,
>                          PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT((task->regcmd=
_count + 1) / 2 - 1));
>
> -       rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | =
PC_INTERRUPT_MASK_DPU_1);
> -       rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 =
| PC_INTERRUPT_CLEAR_DPU_1);
> +       if (core->soc->poll_completion) {
> +               /*
> +                * RK3576: PC_DONE (bits 28-29) is read-only in INTERRUPT=
_MASK, so
> +                * it cannot be routed to the GIC; enable the DMA-error i=
nterrupts
> +                * and poll PC_DONE via the hrtimer started below.
> +                */
> +               rocket_pc_writel(core, INTERRUPT_MASK,
> +                                PC_INTERRUPT_MASK_DMA_READ_ERROR |
> +                                PC_INTERRUPT_MASK_DMA_WRITE_ERROR);
> +               rocket_pc_writel(core, INTERRUPT_CLEAR,
> +                                PC_INTERRUPT_MASK_RK3576_PC_DONE_0 |
> +                                PC_INTERRUPT_MASK_RK3576_PC_DONE_1);
> +       } else {
> +               rocket_pc_writel(core, INTERRUPT_MASK,
> +                                PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_M=
ASK_DPU_1);
> +               rocket_pc_writel(core, INTERRUPT_CLEAR,
> +                                PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_=
CLEAR_DPU_1);
> +       }

This whole polled-interrupt part looks very suspicious. Does the
vendor stack do the same thing?

It's hard to believe Rockchip would release performance-critical and
hype-heavy silicon which can't properly raise the most often triggered
interrupt in its critical path, so there must be something else going
on here.

One theory could be that the interrupt bits are not "read-only" per
se, but rather gated inactive by some internal hardware state which
must be cleared before jobs are submitted (e.g. some buffers not
drained, or init sequence not completed, or voltages/frequencies not
set, or memory mappings not written out, ...). If so, this same
hardware state (or something related to it) may well be the cause of
your observed "first (forced) job completes, others don't".

Best regards,
Alexey

