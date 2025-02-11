Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B669FC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6SXgYg7esmTxhwZTlIjFXRPb6oCtU1ku3PB/lUUVzA=; b=Sn2e3yzYyaSKa6CGyfmTRYxDX/
	9MAJUo6/n3Qj1Z2EaWY17MjBLooX+4GMo1gaesetVpvfMMUC24ob6T4s2ZZYNPBm7TUFBtMVL6BHj
	V3AU7PrkbRxUaalzYWk23ovKUk3kbWttOhQe9A1uf6mqRTb50s3onJIt24tr6HxmPRvIdbF+YzoTR
	8kwu6vaymF11VFNWoKCbieyMHhMUaXR2CtByFmuU4C7kHUwYBjMuTyxImLT7YcUXT5S79LV0Tg5ju
	JzOREL6XJbl8Bpik67w5mzfmogUHVQIUzps0eySNIwwz1E1S7R8MXrRI1H76bEZ2iiHCEJroKYrcG
	DqVTtukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thu1R-00000004fMt-040h;
	Tue, 11 Feb 2025 17:26:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu00-00000004f8e-34Yn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:24:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f49bd087cso79868145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739294679; x=1739899479; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6SXgYg7esmTxhwZTlIjFXRPb6oCtU1ku3PB/lUUVzA=;
        b=D10h3MnanpPv7tTIKaC36c9FAV7BpIj5WKPuRqcS5WAgIk1Un9aX58qZVI465tdoPH
         WDcROvdFUmwbKYmOgkVVFZFI4TKP2tHBqnHNzG6j43bamnAAqEb2ACIHDmMdniUxLj6k
         hPm5UPR+pRk3eYMkXN5lgMdAZ4SKRYplfWTcPIsubjSIcrxfnPE22GHvmA0hAOXgBdNd
         oSYVvjAgYzSEcxCXZc2qjwpaGp/sNd14fflWRA+E7HICjSH/NtN9UlEy7Tsm7CGvv2gw
         Pabnd+h5+8NIYO2hJtzXQAApZQmbAkxWU9XMnls9z8UHjwsvvgxu5UVw8aK9CiUwStS4
         +qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294679; x=1739899479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6SXgYg7esmTxhwZTlIjFXRPb6oCtU1ku3PB/lUUVzA=;
        b=gbjggt4DiVX84hU6Dp9eyX1VRpuu7KmntDIuwIbiytDg1k7K5FhQhKYM3wO6TxCMVS
         uubFIjIWYdyezpoa1i+lS+KFLdIQThBQDMwbarZFmD9N2VuktS30p3cInIyEjUa+f6lC
         cDXPIICVyVoQDsoL2oUqfY+bD/ihnUH8X+hzw0Z1lC7Ig08dNeJ+jDLeAB7yVxpyD5Y2
         /W4Tq1YsPXQv0cYASypQDzFrss5SoaKYwS/bdNYr9bi72Yza7lQPuOm3ocBcpS9INphZ
         qXRCqRhy7IfvjEoGhXbQQ5eGtFwsx1TMKvz/kipUjr8X9WG4WcqDsINQz2Pkl9DQPXNZ
         idWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj+iQRWqUSWvOD62q0n9TzYS/lRnPYkQe68ZllTBEklo9Kn28drOdPh+GGkEcfo8orHitND0Cxp2kM+JReVmMx@lists.infradead.org
X-Gm-Message-State: AOJu0YzpKxGKiQYuNhtqWobuFIdjEco/g02wVyFmcyidRAvsbmznxiZn
	8NfCH80S0AIzBc8CEV7ojvaiEL7kuuaK18jVBmoE6DkBNOA2Ef9O2T/YKFVSo5yyqNKZrirENqk
	cZQtl7u9z1bmKxDh5BzdLD2ffuS4Attv3C0/DGA==
X-Gm-Gg: ASbGncuN/YlsXm9lnlh3KQ6mf4gq0Hf23gfW4NYTjgjsyEgY7X3ZHY0JJrc8/0Nb768
	sUDWzR2154MmVRHox7tdtgN1/g9YF3L6vBqbvgfR43t3S6H0ZEM7khMLUd5S4pmUURHP2H/kypj
	lPiqTyHyFDsTdnbrTxQC1U0FEOgbkyjw==
X-Google-Smtp-Source: AGHT+IGmRUXrQTlIf9W4HKabU/xBKx/DTJE7QzDhgMGQDvFVAUo/kz1vNcNccn/atrBA/7YiFzEFo4a1RxFVzd8BNaI=
X-Received: by 2002:a05:6a21:6b17:b0:1ed:a80e:932 with SMTP id
 adf61e73a8af0-1ee5c83de1bmr74737637.34.1739294679456; Tue, 11 Feb 2025
 09:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
 <20250206103213.GB8855@e132581.arm.com> <a2d221a7-ca6d-4956-8537-bee39e89f61c@quicinc.com>
In-Reply-To: <a2d221a7-ca6d-4956-8537-bee39e89f61c@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 11 Feb 2025 17:24:28 +0000
X-Gm-Features: AWEUYZnowpZtnynJFEXqjgvxW0cjB3n9o8gMcQxWCocSbFlTqxgJUzvvcjSrNt4
Message-ID: <CAJ9a7Vgre_3mkXB_xeVx5N9BqPTa2Ai4_8E+daDZ-yAUv44A9g@mail.gmail.com>
Subject: Re: [PATCH] coresight-tmc: stop disabling tmc when flush timeout
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092440_780527_5CD7FE87 
X-CRM114-Status: GOOD (  45.45  )
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

Hi,

We are not seeing these problems on other systems with multiple ETMs.

How are you using the system?

 Perf will strictly disable sources before sinks - which would mean
that the ETMs will flush before the TMC requests a manual flush on
stop.
For sysfs use, we recommend the same, but even halting the TMC first
should result in all sources being requested to flush at the same time
(subject to propagation through connected trace funnels).

On Fri, 7 Feb 2025 at 07:25, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
>
>
>
> On 2/6/2025 6:32 PM, Leo Yan wrote:
> > Hi Yuanfang,
> >
> > On Fri, Jan 03, 2025 at 04:01:54PM +0800, Yuanfang Zhang wrote:
> >>
> >> When multiple ETMs are enabled simultaneously, the time required
> >> to complete a flush in the process of reading the TMC device node
> >> may exceed the default wait time of 100us.
> >

How do you know that it is the ETM flush process that is the issue?
TMC ready can be delayed by issues in the memory system that prevent
write to the memory buffer.

The TMC flush complete will indicate completion of flush for all
connected devices - so if flush complete is indicated by the TMC then
a flush request cannot be the issue.
With multiple ETMs, then the connected trace funnels arbitration will
ensure flush is indicated complete on all connected inputs before
transmitting to the output.

The driver code to stop the TMC will first wait on flush complete
before waiting on TMC ready.


> > Have you tried how long time would be safe to wait for the
> > TMCREADY_BIT bit to be set on your platform?
> yes, 400000us.

This is a huge amount of latency for a coresight system.  This
suggests some sort of contention issue.

> >
> >> If the TMC capture is stopped while any ETM has not completed its
> >> flush, it can cause the corresponding CPU to hang.
> >>

There is nothing in the ETMv4 hardware specification /design that
should cause an CPU to hang. There is an implementation dependent
stall mechanism that if implemented can stall a PE when the ETM fifo
approaches overflow, but this is switch off on the drivers, if
implemented on the hardware.

The flush process for the ETM is a purely internal process of clearing
out all trace currently in the ETM, and is not dependent on the PE.

> >> Fix the by checking the TMCReady bit after the flush. If TMCReady
> >> bit is set, TraceCaptEn bit can be clear; otherwise, return directly
> >> and stop the TMC read.
> >
> > When a timeout for TMC flush and stop is detected, if the driver
> > arbitrarily bails out without disabling TMC, this would leave the
> > hardware always on.
> >

I agree that this is not an acceptable solution - we cannot leave the
TMC in an indeterminate state.

Where clients such as perf are using the hardware there is no
mechanism for re-trying if halt fails.
The functions you have changed seem to relate to  reading the buffer
via sysfs. Do you see similar problems using perf to collect trace
data?


> > I would like first know if a longer timeout can fix the issue.
> >
> > Thanks,
> > Leo
> >
> yes, longer timeout can fix this issue.
>

I think that a longer timeout will mask some underlying contention
issue, but it should be possible to make the coresight driver timeout
configurable, and set the value appropriately for your system.

There is a new TMC logging patchset here:
https://lists.linaro.org/archives/list/coresight@lists.linaro.org/thread/7Y6NPTNKKIPERUUBHG5UEUNVR7ZMFUGM/
which improves the error reporting around timeouts.  This might help
establish if the error is in waiting for flush complete, or TMC ready.

This API could be extended to add a timeout value parameter, that can
be configured from the TMC driver, set via sysfs for the TMC in the
initial case to further debugging of this issue on your system

Regards

Mike


> >> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> >> ---
> >>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 17 +++++++++++++++--
> >>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 22 +++++++++++++++++-----
> >>  2 files changed, 32 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> index d4f641cd9de69488fe3d1c1dc9b5a9eafb55ed59..bded290c42891d782344d9a6e63ebdbed6719133 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> @@ -80,11 +80,21 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
> >>         return;
> >>  }
> >>
> >> -static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >> +static int __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >>  {
> >> +       int rc;
> >> +
> >>         CS_UNLOCK(drvdata->base);
> >>
> >>         tmc_flush_and_stop(drvdata);
> >> +
> >> +       rc = tmc_wait_for_tmcready(drvdata);
> >> +       if (rc) {
> >> +               dev_err(&drvdata->csdev->dev,
> >> +                       "Failed to disable : TMC is not ready\n");
> >> +               CS_LOCK(drvdata->base);
> >> +               return rc;
> >> +       }
> >>         /*
> >>          * When operating in sysFS mode the content of the buffer needs to be
> >>          * read before the TMC is disabled.
> >> @@ -94,6 +104,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >>         tmc_disable_hw(drvdata);
> >>
> >>         CS_LOCK(drvdata->base);
> >> +       return 0;
> >>  }
> >>
> >>  static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >> @@ -650,7 +661,9 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
> >>                         ret = -EINVAL;
> >>                         goto out;
> >>                 }
> >> -               __tmc_etb_disable_hw(drvdata);
> >> +               ret = __tmc_etb_disable_hw(drvdata);
> >> +               if (ret)
> >> +                       goto out;
> >>         }
> >>
> >>         drvdata->reading = true;
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> index a48bb85d0e7f44a25b813f3c828cc3d705d16012..63a1f7501562fa0b5c2fe6ea53dce4d82842bec3 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> @@ -1135,11 +1135,21 @@ static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
> >>         }
> >>  }
> >>
> >> -static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >> +static int __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >>  {
> >> +       int rc;
> >> +
> >>         CS_UNLOCK(drvdata->base);
> >>
> >>         tmc_flush_and_stop(drvdata);
> >> +
> >> +       rc = tmc_wait_for_tmcready(drvdata);
> >> +       if (rc) {
> >> +               dev_err(&drvdata->csdev->dev,
> >> +                       "Failed to disable : TMC is not ready\n");
> >> +               CS_LOCK(drvdata->base);
> >> +               return rc;
> >> +       }
> >>         /*
> >>          * When operating in sysFS mode the content of the buffer needs to be
> >>          * read before the TMC is disabled.
> >> @@ -1150,7 +1160,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >>         tmc_disable_hw(drvdata);
> >>
> >>         CS_LOCK(drvdata->base);
> >> -
> >> +       return 0;
> >>  }
> >>
> >>  void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >> @@ -1779,9 +1789,11 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
> >>         }
> >>
> >>         /* Disable the TMC if we are trying to read from a running session. */
> >> -       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> >> -               __tmc_etr_disable_hw(drvdata);
> >> -
> >> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
> >> +               ret = __tmc_etr_disable_hw(drvdata);
> >> +               if (ret)
> >> +                       goto out;
> >> +       }
> >>         drvdata->reading = true;
> >>  out:
> >>         spin_unlock_irqrestore(&drvdata->spinlock, flags);
> >>
> >> ---
> >> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> >> change-id: 20250103-fix_cpu_hung-b5a95179ada4
> >>
> >> Best regards,
> >> --
> >> Yuanfang Zhang <quic_yuanfang@quicinc.com>
> >>
> >>
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

