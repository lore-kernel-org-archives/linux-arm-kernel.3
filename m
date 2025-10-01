Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902BFCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHL/hr5PfoxJxCym54jKmtMLqbKne7xHE99xd1VNG8E=; b=Zydx//M2WLNh28a65Fr/md6UBD
	LceQRj2+oVPjqfIgFrf2HrRzB42fYDV5YLImYXG64h2VT6oLDUxmSyHT6xlmpt5eQo8pYtJ6RQSpJ
	7AWlKIesB206sq1yXS2gQxiMxDVwJNqKzxdmdyqLjx8HMY9lkRHhTd2eNLuGNedjQ90U9Eol7Vt0U
	eMwxfQIWR1+bM3Vv+PSYV37SfJeaH08Xgxr09E5K2YFk1wEJgL5S1kq/FDAnEFRUrZfURfoIdQY4+
	wHI7GrTXGbfQC1JaIVBrvI/IaVhPqUHwAhgmAGOu7C0IRAd4ifZENx4YklCOrmc3W7maf2sncNp6V
	0VDhdRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sVa-000000074R9-1IkT;
	Wed, 01 Oct 2025 08:48:22 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sVX-000000074Oz-0dL4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:48:20 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so5900053a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759308498; x=1759913298; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHL/hr5PfoxJxCym54jKmtMLqbKne7xHE99xd1VNG8E=;
        b=mG5QS5hvxG4mUD2ZLuHg9v6blutSSS6Ou1kX/uqRYt4lsxvxnTLicD1wdb2tYqHdO+
         u5QAWBT5kG/DktIACWf3CYZj34TN7x9jQCAX60qlQi1y4pPWHOL5VCZU9JF7d9eFcDOH
         T2/5vJ4ysrRdvpV6EXuuNPX6jn0FqMmEk4wRPKKqJv8zdHojzNAjXdzzyzgJgAucu6tr
         G3nR9Fxf6GGyrpaKTq/WIBkbjwCMV1rKeAE6MeNe4q11RtR6PxSE815nUq4EEDjTsKFj
         bIKSPX2+LWrGpXy3thjm49zbSQlsxnahcGcyEWtckMgtRXWfMpwKk7yees87A4RciU9H
         RBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308498; x=1759913298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHL/hr5PfoxJxCym54jKmtMLqbKne7xHE99xd1VNG8E=;
        b=dz2MQyMFE/zoYrkeEScfmXocKzUZMKCWxEdMAMxI6rJdfFlNnm9GSTL6k/QDAYzo8g
         YHX31m4ec81ruhvENqjAj7UYgsZZVpj8VHAwU9ThvHGrbp2Rps06VRo27tgmaEkxYsze
         /YgcBPa8EMT5DjqiK1kYEtYIDszC9ImDnPNLZS9l7YIxRZpachsPn3N+8+d5WHv4s6lH
         W+h/RzJhoJd2i/VlVvNT2lm0ypntWAMHJn1we6K6OUKg2HoNXtD0DJVfk2gSHxqCO5kg
         Z/yoMQ7KcQ8MhQkyWW9gwIf2Nq/dsrDVifXlnRoWZfkQPZXfxz3g+IJwGb23ZgTjyT4o
         tlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH/Z0K7AWlLJ5xbkvt2zB2P+f7t7nQL7sFjxyAugF9gzlSe9B6FLr0G4HlUWV864Ug8bwssUcmx0kvW5kiHsVc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8uY0r4cDZGWBBLWcuaz3AidYOw4ZlXvV1xVwmdbau93EATNvX
	G51hq5VS2T7YCsW3nI6t237ix81vw9o212ixGNEtz69zIK0YmC2arYnhSmmWuRiSWNuqNxirffk
	a+OMWbWSfmSfnS+tpryJdyHPX9ui/aSLJhKArXF2a5Q==
X-Gm-Gg: ASbGnctaWXOh650lMjdxZI7vhJRJ5Fs9YnMlui2f3pXSpG/3UuxBUYV7+NVP5kdQr1k
	VAZ6sgl64gKjARlPVN5+2e3tN4XTVMt+wfbIsSSxc8DUqCNtrd7ajIaK4sDwUt+hM3bzmFqSXeH
	rVPuJQmgEivgI5TuOpq/QNtY1yOn48a7ZKxEKb+ruwFYozXukZqNyxwXEURZ09//skab+Kq0fBY
	dGNZk7urO+d/ZDv2uc7FX7etYQeYQ289dA4WtAQ0glbeKIEKqAAuaE5V3wOZdw=
X-Google-Smtp-Source: AGHT+IHPewrrQT6ElXHmsovN6BLWFOVM32lZKl40D0ExfhlTAobjfSQ2bhKW9wWr5zf6Xrpy8a/WSVP4bVMn1kCov64=
X-Received: by 2002:a17:903:19cf:b0:248:79d4:93be with SMTP id
 d9443c01a7336-28e7f328bd6mr29384255ad.30.1759308498196; Wed, 01 Oct 2025
 01:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-10-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-10-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 Oct 2025 09:48:06 +0100
X-Gm-Features: AS18NWBxodV43snFfXEzUg2xu6_Tgb6pVBJUx9iCJHBKfmYJbA4OAmNugLoYsFc
Message-ID: <CAJ9a7Vgk0Pj5c9AJBKa+wBNNZR6a7RCTUWqW0Trvksvt6fCBXg@mail.gmail.com>
Subject: Re: [PATCH v3 10/31] coresight: etm4x: Reuse normal enable and
 disable logic in CPU idle
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_014819_221700_BED7C735 
X-CRM114-Status: GOOD (  43.50  )
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

Hi Leo,

Overall I like the idea, but there are some minor issues that need addressing.

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> The etm4_enable_trace_unit() function is almost identical to the restore
> flow, with a few differences listed below:
>
> 1) TRCQCTLR register
>
>    The TRCQCTLR register is saved and restored during CPU idle, but it
>    is never touched in the normal flow. Given the Q element is not
>    enabled (TRCCONFIGR.QE bits), it is acceptable to omit saving and
>    restoring this register during idle.
>
> 2) TRCSSCSRn.STATUS bit
>
>    The restore flow does not explicitly clear the TRCSSCSRn.STATUS bit
>    but instead directly loads the saved value. In contrast, the normal
>    flow clears this bit to 0 when re-enabling single-shot control.
>
>    Therefore, the restore function passes the restart_ss argument as
>    false to etm4_enable_hw() to avoid re-enabling single-shot mode.
>
> 3) Claim Tag Handling
>
>    The claim tag is acquired and released in normal flow, on the other
>    hand, the claim protocol is not applied in CPU idle flow - it simply
>    restores the saved value.
>
>    The claim bits serve two purpose:
>
>    * Exclusive access between the kernel driver and an external
>      debugger. During CPU idle, the kernel driver locks the OS Lock,
>      ensuring that the external debugger cannot access the trace unit.
>      Therefore, it is safe to release the claim tag during idle.
>
>    * Notification to supervisory software to save/restore context for
>      external debuggers. The kernel driver does not touch the external
>      debugger's claim bit (ETMCLAIM[0]).
>
>    Based on this, it is safe to acquire and release claim tag in the
>    idle sequence.
>

Not sure I agree - in the original save restore the claim tag state
was retained - so if an external claim was asserted it would not be
lost.
here if we do not retain the claim tag value, then an external state
can be lost.

The debugger cannot access the device during idle/oslok, but it can
detect that the device is powered down/oslocked and this potential is
a change of behaviour from the external debug perspective, where a
race to claim the resource now exists over powerdown were one did not
before.

> 4) OS Lock Behavior
>
>    The OS Lock should be locked during CPU idle states. This differs
>    from the normal flow, which unlock it. This special handling remains
>    in the CPU save path.
>
> This commit reuses the normal enable and disable logic in the CPU idle
> path. The only addition is locking the OS Lock upon entering idle to
> ensure exclusive access.
>
> The save context in the driver data is no longer needed and has been
> removed.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 215 +--------------------
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  57 ------
>  2 files changed, 5 insertions(+), 267 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index f61c9924ad0496be2e41c84172c2bbe348df7b60..4a75c76bb44fc284034e25f8eb8e7a04e9d35885 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1854,8 +1854,7 @@ static int etm4_dying_cpu(unsigned int cpu)
>
>  static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
> -       int i, ret = 0;
> -       struct etmv4_save_state *state;
> +       int ret = 0;
>         struct coresight_device *csdev = drvdata->csdev;
>         struct csdev_access *csa;
>         struct device *etm_dev;
> @@ -1885,100 +1884,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>                 ret = -EBUSY;
>                 goto out;
>         }
> +       etm4_cs_lock(drvdata, csa);
>
> -       if (!drvdata->paused)
> -               etm4_disable_trace_unit(drvdata);
> -
> -       /*
> -        * As recommended by section 4.3.7 (Synchronization of register updates)
> -        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> -        * ISB instruction after programming the trace unit registers.
> -        */
> -       isb();
> -
> -       state = drvdata->save_state;
> -
> -       if (drvdata->nr_pe)
> -               state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
> -       state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
> -       state->trcauxctlr = etm4x_read32(csa, TRCAUXCTLR);
> -       state->trceventctl0r = etm4x_read32(csa, TRCEVENTCTL0R);
> -       state->trceventctl1r = etm4x_read32(csa, TRCEVENTCTL1R);
> -       if (drvdata->stallctl)
> -               state->trcstallctlr = etm4x_read32(csa, TRCSTALLCTLR);
> -       state->trctsctlr = etm4x_read32(csa, TRCTSCTLR);
> -       state->trcsyncpr = etm4x_read32(csa, TRCSYNCPR);
> -       state->trcccctlr = etm4x_read32(csa, TRCCCCTLR);
> -       state->trcbbctlr = etm4x_read32(csa, TRCBBCTLR);
> -       state->trctraceidr = etm4x_read32(csa, TRCTRACEIDR);
> -       if (drvdata->q_filt)
> -               state->trcqctlr = etm4x_read32(csa, TRCQCTLR);
> -
> -       state->trcvictlr = etm4x_read32(csa, TRCVICTLR);
> -       state->trcviiectlr = etm4x_read32(csa, TRCVIIECTLR);
> -       state->trcvissctlr = etm4x_read32(csa, TRCVISSCTLR);
> -       if (drvdata->nr_pe_cmp)
> -               state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
> -
> -       for (i = 0; i < drvdata->nrseqstate - 1; i++)
> -               state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
> -
> -       if (drvdata->nrseqstate) {
> -               state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
> -               state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);

The TRCSEQSTR changes in use, but is not read back be the standard
enable/disable flow. This does not matter in a normal enable/disable
case, but in a save/restore we need to retain the current state.
Probably should be added to the normal disable flow to read back this
as we do with counters etc.

> -       }
> -
> -       if (drvdata->numextinsel)
> -               state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
> -
> -       for (i = 0; i < drvdata->nr_cntr; i++) {
> -               state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
> -               state->trccntctlr[i] = etm4x_read32(csa, TRCCNTCTLRn(i));
> -               state->trccntvr[i] = etm4x_read32(csa, TRCCNTVRn(i));
> -       }
> -
> -       /* Resource selector pair 0 is reserved */
> -       for (i = 2; i < drvdata->nr_resource * 2; i++)
> -               state->trcrsctlr[i] = etm4x_read32(csa, TRCRSCTLRn(i));
> -
> -       for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -               state->trcssccr[i] = etm4x_read32(csa, TRCSSCCRn(i));
> -               state->trcsscsr[i] = etm4x_read32(csa, TRCSSCSRn(i));
> -               if (etm4x_sspcicrn_present(drvdata, i))
> -                       state->trcsspcicr[i] = etm4x_read32(csa, TRCSSPCICRn(i));
> -       }
> -
> -       for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> -               state->trcacvr[i] = etm4x_read64(csa, TRCACVRn(i));
> -               state->trcacatr[i] = etm4x_read64(csa, TRCACATRn(i));
> -       }
> -
> -       /*
> -        * Data trace stream is architecturally prohibited for A profile cores
> -        * so we don't save (or later restore) trcdvcvr and trcdvcmr - As per
> -        * section 1.3.4 ("Possible functional configurations of an ETMv4 trace
> -        * unit") of ARM IHI 0064D.
> -        */
> -
> -       for (i = 0; i < drvdata->numcidc; i++)
> -               state->trccidcvr[i] = etm4x_read64(csa, TRCCIDCVRn(i));
> -
> -       for (i = 0; i < drvdata->numvmidc; i++)
> -               state->trcvmidcvr[i] = etm4x_read64(csa, TRCVMIDCVRn(i));
> -
> -       state->trccidcctlr0 = etm4x_read32(csa, TRCCIDCCTLR0);
> -       if (drvdata->numcidc > 4)
> -               state->trccidcctlr1 = etm4x_read32(csa, TRCCIDCCTLR1);
> -
> -       state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR0);
> -       if (drvdata->numvmidc > 4)
> -               state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR1);
> -
> -       state->trcclaimset = etm4x_read32(csa, TRCCLAIMCLR);
> -
> -       if (!drvdata->skip_power_up)
> -               state->trcpdcr = etm4x_read32(csa, TRCPDCR);
> +       etm4_disable_hw(drvdata);
>
> +       etm4_cs_unlock(drvdata, csa);
>         /* wait for TRCSTATR.IDLE to go up */
>         if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
>                 dev_err(etm_dev,
> @@ -1988,14 +1898,6 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>                 goto out;
>         }
>
> -       /*
> -        * Power can be removed from the trace unit now. We do this to
> -        * potentially save power on systems that respect the TRCPDCR_PU
> -        * despite requesting software to save/restore state.
> -        */
> -       if (!drvdata->skip_power_up)
> -               etm4x_relaxed_write32(csa, (state->trcpdcr & ~TRCPDCR_PU),
> -                                     TRCPDCR);
>  out:
>         etm4_cs_lock(drvdata, csa);
>         return ret;
> @@ -2019,110 +1921,10 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>
>  static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  {
> -       int i;
> -       struct etmv4_save_state *state = drvdata->save_state;
> -       struct csdev_access *csa = &drvdata->csdev->access;
> -
>         if (WARN_ON(!drvdata->csdev))
>                 return;
>
> -       etm4_cs_unlock(drvdata, csa);
> -       etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> -
> -       if (drvdata->nr_pe)
> -               etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
> -       etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
> -       etm4x_relaxed_write32(csa, state->trcauxctlr, TRCAUXCTLR);
> -       etm4x_relaxed_write32(csa, state->trceventctl0r, TRCEVENTCTL0R);
> -       etm4x_relaxed_write32(csa, state->trceventctl1r, TRCEVENTCTL1R);
> -       if (drvdata->stallctl)
> -               etm4x_relaxed_write32(csa, state->trcstallctlr, TRCSTALLCTLR);
> -       etm4x_relaxed_write32(csa, state->trctsctlr, TRCTSCTLR);
> -       etm4x_relaxed_write32(csa, state->trcsyncpr, TRCSYNCPR);
> -       etm4x_relaxed_write32(csa, state->trcccctlr, TRCCCCTLR);
> -       etm4x_relaxed_write32(csa, state->trcbbctlr, TRCBBCTLR);
> -       etm4x_relaxed_write32(csa, state->trctraceidr, TRCTRACEIDR);
> -       if (drvdata->q_filt)
> -               etm4x_relaxed_write32(csa, state->trcqctlr, TRCQCTLR);
> -
> -       etm4x_relaxed_write32(csa, state->trcvictlr, TRCVICTLR);
> -       etm4x_relaxed_write32(csa, state->trcviiectlr, TRCVIIECTLR);
> -       etm4x_relaxed_write32(csa, state->trcvissctlr, TRCVISSCTLR);
> -       if (drvdata->nr_pe_cmp)
> -               etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
> -
> -       for (i = 0; i < drvdata->nrseqstate - 1; i++)
> -               etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
> -
> -       if (drvdata->nrseqstate) {
> -               etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
> -               etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
> -       }
> -       if (drvdata->numextinsel)
> -               etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
> -
> -       for (i = 0; i < drvdata->nr_cntr; i++) {
> -               etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
> -               etm4x_relaxed_write32(csa, state->trccntctlr[i], TRCCNTCTLRn(i));
> -               etm4x_relaxed_write32(csa, state->trccntvr[i], TRCCNTVRn(i));
> -       }
> -
> -       /* Resource selector pair 0 is reserved */
> -       for (i = 2; i < drvdata->nr_resource * 2; i++)
> -               etm4x_relaxed_write32(csa, state->trcrsctlr[i], TRCRSCTLRn(i));
> -
> -       for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -               etm4x_relaxed_write32(csa, state->trcssccr[i], TRCSSCCRn(i));
> -               etm4x_relaxed_write32(csa, state->trcsscsr[i], TRCSSCSRn(i));
> -               if (etm4x_sspcicrn_present(drvdata, i))
> -                       etm4x_relaxed_write32(csa, state->trcsspcicr[i], TRCSSPCICRn(i));
> -       }
> -
> -       for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> -               etm4x_relaxed_write64(csa, state->trcacvr[i], TRCACVRn(i));
> -               etm4x_relaxed_write64(csa, state->trcacatr[i], TRCACATRn(i));
> -       }
> -
> -       for (i = 0; i < drvdata->numcidc; i++)
> -               etm4x_relaxed_write64(csa, state->trccidcvr[i], TRCCIDCVRn(i));
> -
> -       for (i = 0; i < drvdata->numvmidc; i++)
> -               etm4x_relaxed_write64(csa, state->trcvmidcvr[i], TRCVMIDCVRn(i));
> -
> -       etm4x_relaxed_write32(csa, state->trccidcctlr0, TRCCIDCCTLR0);
> -       if (drvdata->numcidc > 4)
> -               etm4x_relaxed_write32(csa, state->trccidcctlr1, TRCCIDCCTLR1);
> -
> -       etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR0);
> -       if (drvdata->numvmidc > 4)
> -               etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
> -
> -       etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> -
> -       if (!drvdata->skip_power_up)
> -               etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
> -
> -       /*
> -        * As recommended by section 4.3.7 ("Synchronization when using the
> -        * memory-mapped interface") of ARM IHI 0064D
> -        */
> -       dsb(sy);
> -       isb();
> -
> -       /* Unlock the OS lock to re-enable trace and external debug access */
> -       etm4_os_unlock(drvdata);
> -
> -       if (!drvdata->paused)
> -               etm4_enable_trace_unit(drvdata);
> -
> -       /*
> -        * As recommended by section 4.3.7 (Synchronization of register updates)
> -        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> -        * ISB instruction after programming the trace unit registers.
> -        */
> -       isb();
> -
> -       etm4_cs_lock(drvdata, csa);
> +       etm4_enable_hw(drvdata, false);
>  }
>
>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> @@ -2309,13 +2111,6 @@ static int etm4_probe(struct device *dev)
>                 pm_save_enable = coresight_loses_context_with_cpu(dev) ?
>                                PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
>
> -       if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
> -               drvdata->save_state = devm_kmalloc(dev,
> -                               sizeof(struct etmv4_save_state), GFP_KERNEL);
> -               if (!drvdata->save_state)
> -                       return -ENOMEM;
> -       }
> -
>         raw_spin_lock_init(&drvdata->spinlock);
>
>         drvdata->cpu = coresight_get_cpu(dev);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 012c52fd19338133129752d35523dc102df24604..9dfdcfc2b16748bedc278ba2ceaa7e39b29cc351 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -862,61 +862,6 @@ struct etmv4_config {
>         u8                              s_ex_level;
>  };
>
> -/**
> - * struct etm4_save_state - state to be preserved when ETM is without power
> - */
> -struct etmv4_save_state {
> -       u32     trcprocselr;
> -       u32     trcconfigr;
> -       u32     trcauxctlr;
> -       u32     trceventctl0r;
> -       u32     trceventctl1r;
> -       u32     trcstallctlr;
> -       u32     trctsctlr;
> -       u32     trcsyncpr;
> -       u32     trcccctlr;
> -       u32     trcbbctlr;
> -       u32     trctraceidr;
> -       u32     trcqctlr;
> -
> -       u32     trcvictlr;
> -       u32     trcviiectlr;
> -       u32     trcvissctlr;
> -       u32     trcvipcssctlr;
> -
> -       u32     trcseqevr[ETM_MAX_SEQ_STATES];
> -       u32     trcseqrstevr;
> -       u32     trcseqstr;
> -       u32     trcextinselr;
> -       u32     trccntrldvr[ETMv4_MAX_CNTR];
> -       u32     trccntctlr[ETMv4_MAX_CNTR];
> -       u32     trccntvr[ETMv4_MAX_CNTR];
> -
> -       u32     trcrsctlr[ETM_MAX_RES_SEL];
> -
> -       u32     trcssccr[ETM_MAX_SS_CMP];
> -       u32     trcsscsr[ETM_MAX_SS_CMP];
> -       u32     trcsspcicr[ETM_MAX_SS_CMP];
> -
> -       u64     trcacvr[ETM_MAX_SINGLE_ADDR_CMP];
> -       u64     trcacatr[ETM_MAX_SINGLE_ADDR_CMP];
> -       u64     trccidcvr[ETMv4_MAX_CTXID_CMP];
> -       u64     trcvmidcvr[ETM_MAX_VMID_CMP];
> -       u32     trccidcctlr0;
> -       u32     trccidcctlr1;
> -       u32     trcvmidcctlr0;
> -       u32     trcvmidcctlr1;
> -
> -       u32     trcclaimset;
> -
> -       u32     cntr_val[ETMv4_MAX_CNTR];
> -       u32     seq_state;
> -       u32     vinst_ctrl;
> -       u32     ss_status[ETM_MAX_SS_CMP];
> -
> -       u32     trcpdcr;
> -};
> -
>  /**
>   * struct etm4_drvdata - specifics associated to an ETM component
>   * @pclk:       APB clock if present, otherwise NULL
> @@ -979,7 +924,6 @@ struct etmv4_save_state {
>   *             at runtime, due to the additional setting of TRFCR_CX when
>   *             in EL2. Otherwise, 0.
>   * @config:    structure holding configuration parameters.
> - * @save_state:        State to be preserved across power loss
>   * @skip_power_up: Indicates if an implementation can skip powering up
>   *                the trace unit.
>   * @paused:    Indicates if the trace unit is paused.
> @@ -1034,7 +978,6 @@ struct etmv4_drvdata {
>         bool                            lpoverride;
>         u64                             trfcr;
>         struct etmv4_config             config;
> -       struct etmv4_save_state         *save_state;
>         bool                            skip_power_up;
>         bool                            paused;
>         DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>
> --
> 2.34.1
>

Regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

