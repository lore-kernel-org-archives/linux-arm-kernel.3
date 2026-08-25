Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C866CC61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yC0ABnqL3afPD/T9bA9JOpYrNE4Kd3K+0Xw3e1dg3hQ=; b=3Z5UumT9jUcuXiUEVfijF64s8L
	Kl9QklI0KV7DYPDmFrwk4s9O+6Joxx6zBWSmOQPKC6XmdvnZ8VOMijWy6dwQuJ2lI3INM+SLUGCGp
	JPIhy1vGnoVXYqq9nh6ij/ODnn3RZ6Ybb69miVm0kGVbTjNcfp9IJ1o4AXkQ8k7lXqHlgSVSQxRtl
	F1t5nnXvL6VKK7xvyqUUB7woY//BA2IkQknV+M94i+THgSsLXpkbSMRh/TgDkrUVN1UPn6b/nnvrP
	fdb5JzeJ7g5sVGm9+v/uoIZ+nSH9kvXiSWvzvkrbLZDalMn28xj7h8ym8RzI4+yCrQ2GIQia+eI7W
	rhdTZCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqKD-00000000mPJ-2FKv;
	Tue, 25 Aug 2026 12:32:21 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqKB-00000000mOU-1XL0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:32:20 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-85569d3a6f7so199577b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787661138; cv=none;
        d=google.com; s=arc-20260327;
        b=EH4hyctT+NS2ErsWqymFZAN9bXW3AmHNnyyuemk9NTZ2ZyUrDMUIgPGsX2Hb19ZG5q
         /tCW1A6vR9w5XCHMM59AD0ofabXTsbhPTUEpmQ+y6cW7zFkbXxKDyCFPf0haHJE7iN5O
         UUbDnjclJ26JGk4gy2kbaqBM1vBqSsn4eRPrDnEv7vd1s+R/bCbE3w9CCTuXj299HF1T
         yvbB2uZ7iDSGQWgdWJdo4XFln/cdIEe7k2f8VtXI3RwaE/x0iweUPsv1SHTYhZYtUfQ+
         178NJapX4Tp+pCmy0WnimtWD7RN7ONgkCvfT9IOwg5eztjqKux1Lkt+toYQjvWR8erqi
         7tBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yC0ABnqL3afPD/T9bA9JOpYrNE4Kd3K+0Xw3e1dg3hQ=;
        fh=MEqH85iWIV2M3bCuFrPZR9fp6L08iD7sR/DhnJTEmBs=;
        b=npoVL5LIwvSQYAnhpgffU895akwuHG5A9NU25VdI63IIiIjL7/7/0N34+gRVca1/5q
         xAJhngoZv71Xu+uEqEDDTPizi8McSZxmwz0I8or1UV2k4vRfR1luSkP/M7mZu6GmEfBC
         SxXALe2HpU2NwQciXugyOUGJd1ZVO9OAdOQwt4aXf4rxhGIv9shih0JXsUyY2QXo9l3h
         /KEDIsgGy0oB0aQSfjI+cjMJtOtgf9MA7D1hnFjia5Phl5h0829wTN4FRxbSR8E/zKZ1
         jwBXN4J622V8FXD5ZoQO+7nTXB3nzDFg6KJHK+O0p2i0ft4axpy+7owZv0NRZwcythLM
         s/EA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661138; x=1788265938; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yC0ABnqL3afPD/T9bA9JOpYrNE4Kd3K+0Xw3e1dg3hQ=;
        b=e6xF6KrjJiP731rsQZRD4DjdJipfDuCd4U1Bcl5sOU8PJmZmb6VSsguJw8nYWVaIdN
         jQ+urX5M9QZx302VhdEeX0x9Vmj3FU8UscpwBnU3DO+ihtaUg/NVy3OCdrQrsN0X4MIm
         pH+dFJUsY0Q/31T9JStynUvtChPqT7/XvaJJkeyCLZ+KX4N5izVYgePVRw0cXOgXUMiV
         1JI6vpGPVpnoqaBr5lSAY5jUBMxM3khKD9zXQeneOzYsCstsVk316JsvY3ByY6lBwgBX
         UcnPOPwelE4nFyUfhnwoHcbpL0t/pgA/Owt8Tp8ULF7T13hn4PxKCW9GOqWqNTKSvo1K
         DoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661138; x=1788265938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC0ABnqL3afPD/T9bA9JOpYrNE4Kd3K+0Xw3e1dg3hQ=;
        b=HC1iVqtHASA8/c5CYlc76szYkGzitCo7OCd301R9ya/s4mxQEpI4kpUDuD88//AkMl
         nt7Btn6SBQnI46m/1ceDg3uTViiN86M0m/arCpp4xnxnVaLqeS738VjU+d7cd0sQZ3PM
         2KjxOCtaLhwsL5II89H5ism04qSu8au98yhpIwlCNnD+Pm0jycFKz98r6c64j7Fv9YJx
         EBL192b0KBmVRZLM6IiBsIVWhrPvMMCeCsAOUsLjucylFnlpHbmC3l0TGEWufwt6B5oC
         z7wGeo+qyBQ7U/IUDm3+1EL0ZNCuZKAZm3vrOek9lYjjf1FOlwxMt6dQCX3SmQf5QP5T
         6omA==
X-Forwarded-Encrypted: i=1; AHgh+RoFFXg+XGS6R2tzbER7FJ3SebdLwvNQVvPpVgQdAC0c0D7BBSBD5n79LnW4VSWML2YS2x9zuxxDH6gaIyIKtyRd@lists.infradead.org
X-Gm-Message-State: AFuF++kDpv9CsRSp5f0ZcPPPa+lY/H4Hr89cDLePmnOybZXsf8qu/DzK
	Ah5NhwmhKo0012fcouv7dDiOvY4iEftzy1QvFNx4lTWBo+RvNMt1NdBozyx9VK+c/GmUc6MjCqX
	bNCVRrKM5d5jBNIy5AIFO7XoRJvUavPY=
X-Gm-Gg: AR+sD13u4C5vQ6p2/0SE5qcDgOwyazsT2T9epNpy+4U8rVDXCNSJHEXaoB1MH/XDf1V
	Ix0ooheqC4ojCn+xXVMi1FsJ5b9VKwOaKOG8q06S1/2OoLa0s8wpmktlAw14TD+p1Ek6qdhD5v6
	8xCSRmrD3djR/QBJealDRgXybnTmEqzG0OZl1NjeDCwRdi5DvJ/XB3VNVcrs6VrRyyf3d0LHYxn
	NZXN9PFomfcMO+CRGEPbV5P3HxzJGvTw+jn7Q1+5Ar66jikhl/N3XZHXpFTRkIR/a16+0pwHTQz
	iiek//62EcSapN7l0PMxGwsubqk7ydTzr2CYHq8z41/mIF0jDOnIzaRo
X-Received: by 2002:a05:690c:6e01:b0:80b:d006:6436 with SMTP id
 00721157ae682-854c6f01138mr19294437b3.4.1787661138041; Tue, 25 Aug 2026
 05:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <b5265e47492897d0ada844c2ff7f477bb715cd07.1787568944.git.gahing@gahingwoo.com>
In-Reply-To: <b5265e47492897d0ada844c2ff7f477bb715cd07.1787568944.git.gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 25 Aug 2026 14:32:06 +0200
X-Gm-Features: AcwNN1V1tG9pfMaEZxfyNcf1kB3QFf3O-ye-4Ztbjbyn2rv0eJ21NSEcDStkJdA
Message-ID: <CAEWPSH5MVzoQMaFOEQ93+1pOPmcXCDNfuXsv5j-X8Lb1fy_hrg@mail.gmail.com>
Subject: Re: [PATCH v9 03/13] accel/rocket: let the core suspend after a reset
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, u.kleine-koenig@baylibre.com, 
	chaoyi.chen@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_053219_422263_7CE968AC 
X-CRM114-Status: GOOD (  34.85  )
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

On top of the as-is protocol re-run I reported on 2/13, I ran
one more arm with this patch added on top of 1/13 and 2/13,
same machine, same tree, same config, same JOB_TIMEOUT_MS=3D2.

Two passes (console_loglevel 8 and 4), 13 and 13 induced
resets, all recovered, oracle 48/48 throughout, including after
a forced autosuspend and resume.

The behavioural change is visible on RK3588. On the 1+2 arm, a
round that ends in a timeout leaves the affected core
runtime-active even through a forced autosuspend - the leak
from my earlier report. With this patch applied the same
sequence leaves all three cores suspended, and the next
inference still scores 48/48.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three
cores, induced reset, JOB_TIMEOUT_MS=3D2

Regards,
Igor

On Mon, Aug 24, 2026 at 1:09=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> rocket_reset() drops the in-flight job's runtime PM reference with
> pm_runtime_put_noidle(), a bare decrement that requests nothing. The core
> is left at usage_count 0 but still runtime-active with no idle request
> pending, so it does not suspend until something else asks, and on a
> platform whose power domain does work on power-on that work never happens=
.
>
> On RK3576 that work is a bus interface reset the domain cycles when it
> comes up. Without it the NPU's IOMMU stops answering, and the job after a
> timeout returns a surface of the output zero point with rk_iommu reportin=
g
> that MMU_DTE_ADDR is not functioning.
>
> Measured on a ROCK 4D in one boot, three runs, one variable between them.
> With the bare put the core reads runtime-active with its rail still up
> after the reset, the IOMMU reports the failure on the next attach and the
> inference returns 0 of 128 channels. With the reference put back through
> pm_runtime_put_autosuspend() the core reads suspended with the rail down,
> there is no IOMMU message, and the same inference returns 128 of 128. A
> third run repeating the first failed the same way.
>
> It also matches the put in the completion path a few lines away, so the
> reset path no longer leaves the device in a state the rest of the driver
> never produces. The remaining put, on the error path in rocket_job_run(),
> is a plain pm_runtime_put() and is left alone here: it unwinds a
> get_sync() that never reached the hardware, and changing it belongs in
> its own patch.
>
> Igor Paunovic ran the differential on RK3588: 45 induced resets across
> three cores, with and without the two preceding patches, and the domain
> dropped every single time with no MMU message on either kernel. So this
> is not rocket-wide. His conditions cross a healthy block with a lowered
> timeout rather than a hung one, which he was careful to say his protocol
> cannot settle, but it is what scopes the change to RK3576.
>
> Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail=
.com/
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_job.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 3c0ed4605..a89ab49e1 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -406,12 +406,12 @@ rocket_reset(struct rocket_core *core, struct drm_s=
ched_job *bad)
>
>         /*
>          * No handler is running now, but we might still have stuck jobs.=
 Let's
> -        * make sure the PM counters stay balanced by manually calling
> -        * pm_runtime_put_noidle().
> +        * make sure the PM counters stay balanced by putting the referen=
ce the
> +        * job took, and request idle while doing it so the core can susp=
end.
>          */
>         scoped_guard(mutex, &core->job_lock) {
>                 if (core->in_flight_job)
> -                       pm_runtime_put_noidle(core->dev);
> +                       pm_runtime_put_autosuspend(core->dev);
>
>                 iommu_detach_group(NULL, core->iommu_group);
>
> --
> 2.43.0
>

