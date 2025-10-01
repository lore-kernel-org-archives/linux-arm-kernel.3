Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8E9CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu9ssRwNr8ysaq517JqqmVNQyc/JDLuURO2K/fukZno=; b=V9FjmrgpmjOrl6duHAsmfsuqO9
	rcTpu8y5UqYAfbCBTFlOfV7eKg0Xi0F5wktt9hv0j0DtdmhviWFOcQEZuEFPlE2QSNoPSIs61ynnW
	Zz+hGZXTg9WxMgZN0e2cyMrcBs/oUlE/PNkezG/TK8RVyE1dhfw3O4sf4GSeZbGlJSEtlybpoY9oh
	e8zKUHEs7ejeXE21QdsxSzZvnvpzcfve1KaaTJ4WW8kHZRPBNZHX9lsNu3eB3hPhBdg27t+WmgtM0
	GcEquvmBxQTLzg0VdfvSr7Zw8L8SA6vXMkM1OL5lQaSeOYLWiGhzKvl8W7XSNXp74gqv47f/4Miv6
	HEdKr4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sZC-000000075Be-3Kmh;
	Wed, 01 Oct 2025 08:52:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3sZA-000000075B9-0NdR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 08:52:05 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so8212714a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 01:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759308723; x=1759913523; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu9ssRwNr8ysaq517JqqmVNQyc/JDLuURO2K/fukZno=;
        b=yGDxaz4ffX401q3gV8B15VnrvJp+YFCI3m2547HQPkN5whod6WHPzs1CTw+yVvkkD9
         q1EagK7QsggFS6p+LyPaZWieJ0qcnfaXkysq0tNiKxdihw6UlgqxE6rTPENZahHEdxLR
         TixVu1rcYbhQGG4wGJdQ2jAZlElo5yjqIrb0MZrPLkHwAKDKaWm9LBbVzNRULhkzEYGH
         CaQ68XNEsppQbyRpdYYefoKgZFiAc3Ri5zFh5LF/7mbkYSdrCQLbon18AdvpCf9LmTWF
         oqAj2fNlFefCgmdqUOVcKA85rWCbONeySrjCbkrQimXO+yA8cWrP5fS64Vp//ypFa/QW
         4smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308723; x=1759913523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cu9ssRwNr8ysaq517JqqmVNQyc/JDLuURO2K/fukZno=;
        b=SWpo78nRLLef9wbuJrayLzghsQB8zd5dzhV/Iguc3Wa2s6FaYui1GGPqBOVILsIOYW
         0EKC0+yYvEnw7BCFGCvSohYqT7/wm7cONtKmHhlhIMWt1/wByyAdeEduF4x9dTmjL1lp
         Usw++MyKtsCW6RAuFAEODQq5PmHVAbZeKp9weZNLf2BXFzc8Mz4s2Djes5xD/1gHmTWG
         sQ5Ypy04Mz56JiKqRW9bDzbX6/HVqXDtdsz2NbwIDfvdDT3q3i8gVRkhFCEhUkakI07k
         nGFSOiqm6WIXwUAR1RbXGnSt6WlR9Ph9N0RQFsalDgW1JshXIvld2py52DSMiES3S2jj
         ks9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUG1OW7VptcFOZCbwfFlOd7brrBbGDeuUmfPNoN2RvFyYuyZ7c8MnrDCMrj1VKge46ZEc5UEK7gdzqeEbj2YzhD@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ6eMqsCB31B+ZC3/jsDoHzNnjxJm3K1K3+vA4M88v1VbWVqDC
	e/8RZzPzL/f/h6+/ETcGZPqAaMD8rrHEgBX8eRsCjgDJMQeHbcLGd/mLELb177iyAa5Qh4AmDkt
	3I3km25GScJwo/cFfHMhhL7c5NLC8ejEf0rNREODzbg==
X-Gm-Gg: ASbGnctMJFopuRpkHeFcfd9GA2Vps+OztWk5550PxqCycnoxpvBjI8q0CB29psrkedE
	qp+s361v2NWTxjLWtOsMFL5HJhoUMDBnuk1t4HSV70gMb+pILCVv6MuxPTEpWqPzL6pVOM4E435
	e0fRyB22lq/nVCRLYSui40eMyJT9q/p3fsJg4z3x6sfxqzqfgdPsKxmoH8mo2Kr0QREDVCFqDHX
	dUTxhxi8yc5pug6pKM9HhANwovJiLcaaqZxoMdvcFeDIPKItZ14/OrPPH732ic=
X-Google-Smtp-Source: AGHT+IGqK450Bmvg90xqT5a6Sy9fEvcidGXPelldLbmkrPBKY6b/9wS4caKkWXyqFpLWjsAdfEsN/vjzIkS/RDzSqsw=
X-Received: by 2002:a17:90b:3906:b0:32b:6eed:d203 with SMTP id
 98e67ed59e1d1-339a6f0766emr2880369a91.24.1759308723082; Wed, 01 Oct 2025
 01:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-9-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-9-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 1 Oct 2025 09:51:51 +0100
X-Gm-Features: AS18NWD65yCBDNxJOBXwfEuJim8LVKk06lCAyrdiCW2urVUehn1cL3tSHMyuAC8
Message-ID: <CAJ9a7VidaP-oVV0yc_oRVJZBQAN8TGPXoM942VxZr_XGqJL0mg@mail.gmail.com>
Subject: Re: [PATCH v3 09/31] coresight: etm4x: Add flag to control
 single-shot restart
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_015204_145394_4D0B73F3 
X-CRM114-Status: GOOD (  22.41  )
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
> Add a new argument restart_ss to etm4_enable_hw(). When passed as true,
> it resets the TRCSSCSRn.STATUS bit to 0 to re-enable single-shot
> control.
>
> No functional change. This is a preparation for a subsequent change.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index fbcd0fcd1992cd600d2eb8c95ae9a5adf0c287da..f61c9924ad0496be2e41c84172c2bbe348df7b60 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -487,7 +487,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>         return 0;
>  }
>
> -static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> +static int etm4_enable_hw(struct etmv4_drvdata *drvdata, bool restart_ss)
>  {
>         int i, rc;
>         struct etmv4_config *config = &drvdata->config;
> @@ -562,9 +562,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>
>         for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -               /* always clear status bit on restart if using single-shot */
> -               if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -                       config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +               if (restart_ss) {
> +                       /* always clear status bit on restart if using single-shot */
> +                       if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> +                               config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +               }
>                 etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>                 etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>                 if (etm4x_sspcicrn_present(drvdata, i))
> @@ -628,7 +630,7 @@ static void etm4_enable_hw_smp_call(void *info)
>                 return;
>         }
>
> -       arg->rc = etm4_enable_hw(arg->drvdata);
> +       arg->rc = etm4_enable_hw(arg->drvdata, true);
>
>         /* The tracer didn't start */
>         if (arg->rc)
> @@ -867,7 +869,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>         drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
>
>         /* And enable it */
> -       ret = etm4_enable_hw(drvdata);
> +       ret = etm4_enable_hw(drvdata, true);
>
>  out:
>         /* The tracer didn't start */
> @@ -1833,7 +1835,7 @@ static int etm4_starting_cpu(unsigned int cpu)
>                 etm4_os_unlock(etmdrvdata[cpu]);
>
>         if (coresight_get_mode(etmdrvdata[cpu]->csdev))
> -               etm4_enable_hw(etmdrvdata[cpu]);
> +               etm4_enable_hw(etmdrvdata[cpu], true);
>         raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
>         return 0;
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

