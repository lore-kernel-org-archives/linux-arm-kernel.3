Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A8ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW2eGo3adp7vL0WPh8eMUv7d7xYmlEVOF6vZyWrzZlw=; b=QBaetb2ojid7xU3znWrG/cGo9E
	rpQM7zfuiWY73nafAaXPJb+ZrkomLaFT5ogrtDfoBciCN+umUA5Z8jh2eUNJxRN+ljEKYU7fXb/h1
	YhQlB/lrNpMlet16E9KQ3hY+M6yUIqd+0fysboG617eNGy7K3QzovDwi42whf8kL3m/XpLjWT+NgW
	taczuoWZV6wVcbwyMS8x0WHvIFTQfewnEU2GKEk1YJg+I15cAD8s4CvJrtMe+2lwveJ3iFwGd6lIQ
	DqQpO6mDSNXAkK55DEzrueAIJloQdWl9MGaXBpQoDhF0vnwz8Oi8fz4Xzhnh6JIfY/uroFEE1KTK0
	ZPG2PdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cRg-00000005foD-26SN;
	Tue, 30 Sep 2025 15:39:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cRe-00000005fnk-0Dyn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 15:39:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so2559321b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759246753; x=1759851553; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vW2eGo3adp7vL0WPh8eMUv7d7xYmlEVOF6vZyWrzZlw=;
        b=RpRxoyo6qvJ2FVanOlN7fPabYClBLET9ycj1+F3xJ1sZvwnmUQl9rNlFNZO8hIl/5C
         aSt7+Y6mitkdKkIJKiOqU6oz55j7chfz2FYuyWubb0YYS99v9FChWEJN1yedI/saMvcX
         hP5n9iS/sbyA4siF1bZieisIl4tQAma21WNHCc2eUwZCY6vVyEFcLZilKb6oZryu/Xqf
         cYdFyEA6yK6uAF2Tf3BSRECvnFEdyga6rpEgmV1LshP7MNyjDK3jbC+dERkAm3lROqiy
         k09GrwhueA1ReqA915QDLRdjU1nSibQSt/43HLVF6FWGolbTSRYhx9C4sYliqCJjJwkz
         ej6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759246753; x=1759851553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vW2eGo3adp7vL0WPh8eMUv7d7xYmlEVOF6vZyWrzZlw=;
        b=UR8PBy14okPFXacLzv3tt4/OzHhOygvbMnrhlDCDkHwnbT9/3WPZ6MOAjXCyTmXfjv
         3iD9Srk7IIlw0s5M6h7XSGf42liQWuxUCsmI9AC5H9NqV58DLN7qVcOj8CzQc1uygZga
         5CdW+zglnThYcxpIUGb2iZgdvKYHtaKm7LCFrqlGetOn7p/+MG0SZmOy/k5B0i6qH6DN
         EqU3lsg7Ry/XerwsPrPvh0fpn+AP+vDP/mi8VLhvGbCU5cAlRW0drd7lyQoWMAfkm9BU
         MnRvPBx3CLuWXYqny30DhlQPqlnXxWJ+Fqd+9PLVw44r66wb31HBYWh2aKAkNb4oSE4m
         ln2g==
X-Forwarded-Encrypted: i=1; AJvYcCU+vCtizzke4tesEZ0CGuCOTBRToLolx+MsscjIC8AC3zxhtHy2vRCmD6pJw2oSe2PAatNUZSX1JkMiVOo3bGzz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/rGcaPb8CgEv6/ftb1AxGhNJ6SU6aJDTUPhbceqmVIkkxahUc
	kRARke/blbtIZBJvyNWt54dB4VIEeQUwaNDirBcBK2xrwVmlAw46XpUxUCq3FKo0J8qTFAlw+Le
	JXhTSO0qQDQQUtU2loEqaJkRHYP8MQ+QzzplDI5qCaw==
X-Gm-Gg: ASbGncs9g+aV2ZOtwabT21wEqqSmctev4vmrXRjg+a7KibRwFR84zsYvrRvyddq2hhM
	KB56QrPybuZ+2Y1p7xRaurPlpQXOBnRS0o771ZLsmuCa9xUSftsq90t2PloPDLSJ/VG2WoEi+cM
	RzYyGUIv00GdO3KGZx095JIczXbiO8tfVVLIchVsZu+S4Lv0C+vAeRFFd/bdGav/yo09v98MQoD
	Suel+LkHIieDvgFgXHryZnJGXwHQhcMqF6Wx7eLhCTTSgQM6fERV5hD7rdYtWbT
X-Google-Smtp-Source: AGHT+IHD3haqqp9DvdKrb37/YP19LbUEYV08scwgPsb1WJGtzYNcwIU76PfG2HwoP9h65RVlv3DYnyY87P5WmUEzvjk=
X-Received: by 2002:a05:6a20:918b:b0:246:458:8540 with SMTP id
 adf61e73a8af0-321d90cd44amr268517637.1.1759246752562; Tue, 30 Sep 2025
 08:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-7-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-7-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 30 Sep 2025 16:39:01 +0100
X-Gm-Features: AS18NWAIWSfxoDL7HukYwo5-wcmxpSlNyYCSvSz2eEAcrTR0Jm1v_3ZGjJAFc_o
Message-ID: <CAJ9a7Vg23taf0XhT+EWck8Yc-qQnn1PkkBodQ+3sYM7FmV9WHw@mail.gmail.com>
Subject: Re: [PATCH v3 07/31] coresight: etm4x: Properly control filter in CPU
 idle with FEAT_TRF
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_083914_105443_5A0AAF69 
X-CRM114-Status: GOOD (  28.63  )
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
> If a CPU supports FEAT_TRF, as described in the section K5.5 "Context
> switching", Arm ARM (ARM DDI 0487 L.a), it defines a flow to prohibit
> program-flow trace, execute a TSB CSYNC instruction for flushing,
> followed by clearing TRCPRGCTLR.EN bit.
>
> To restore the state, the reverse sequence is required.
>
> This differs from the procedure described in the section 3.4.1 "The
> procedure when powering down the PE" of ARM IHI0064H.b, which involves
> the OS Lock to prevent external debugger accesses and implicitly
> disables trace.
>
> To be compatible with different ETM versions, explicitly control trace
> unit using etm4_disable_trace_unit() and etm4_enable_trace_unit()
> during CPU idle to comply with FEAT_TRF.
>
> As a result, the save states for TRFCR_ELx and trcprgctlr are redundant,
> remove them.
>
> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 ++++++++++++++++------
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  3 ---
>  2 files changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 999bceef4cd771e46aec891f4c814a95e0921c2f..2d2ef58393db10d058b3e29c5b270dd2d62e1a49 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1884,9 +1884,18 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>                 goto out;
>         }
>
> +       if (!drvdata->paused)
> +               etm4_disable_trace_unit(drvdata);
> +
> +       /*
> +        * As recommended by section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        */
> +       isb();
> +
>         state = drvdata->save_state;
>
> -       state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
>         if (drvdata->nr_pe)
>                 state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
>         state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
> @@ -1996,9 +2005,6 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
>         int ret = 0;
>
> -       /* Save the TRFCR irrespective of whether the ETM is ON */
> -       if (drvdata->trfcr)
> -               drvdata->save_trfcr = read_trfcr();
>         /*
>          * Save and restore the ETM Trace registers only if
>          * the ETM is active.
> @@ -2020,7 +2026,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>         etm4_cs_unlock(drvdata, csa);
>         etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>
> -       etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
>         if (drvdata->nr_pe)
>                 etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
>         etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
> @@ -2105,13 +2110,22 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>
>         /* Unlock the OS lock to re-enable trace and external debug access */
>         etm4_os_unlock(drvdata);
> +
> +       if (!drvdata->paused)
> +               etm4_enable_trace_unit(drvdata);
> +
> +       /*
> +        * As recommended by section 4.3.7 (Synchronization of register updates)
> +        * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +        * ISB instruction after programming the trace unit registers.
> +        */
> +       isb();
> +
>         etm4_cs_lock(drvdata, csa);
>  }
>
>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  {
> -       if (drvdata->trfcr)
> -               write_trfcr(drvdata->save_trfcr);
>         if (drvdata->state_needs_restore)
>                 __etm4_cpu_restore(drvdata);
>  }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 13ec9ecef46f5b60a38c464e8ebde3ef72e7d50b..b8796b4271025f6aba79fe3cd6e4d17d0b56952d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -866,7 +866,6 @@ struct etmv4_config {
>   * struct etm4_save_state - state to be preserved when ETM is without power
>   */
>  struct etmv4_save_state {
> -       u32     trcprgctlr;
>         u32     trcprocselr;
>         u32     trcconfigr;
>         u32     trcauxctlr;
> @@ -980,7 +979,6 @@ struct etmv4_save_state {
>   *             at runtime, due to the additional setting of TRFCR_CX when
>   *             in EL2. Otherwise, 0.
>   * @config:    structure holding configuration parameters.
> - * @save_trfcr:        Saved TRFCR_EL1 register during a CPU PM event.
>   * @save_state:        State to be preserved across power loss
>   * @state_needs_restore: True when there is context to restore after PM exit
>   * @skip_power_up: Indicates if an implementation can skip powering up
> @@ -1037,7 +1035,6 @@ struct etmv4_drvdata {
>         bool                            lpoverride;
>         u64                             trfcr;
>         struct etmv4_config             config;
> -       u64                             save_trfcr;
>         struct etmv4_save_state         *save_state;
>         bool                            state_needs_restore;
>         bool                            skip_power_up;
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

