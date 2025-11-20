Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB024CF8854
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cp81uKru4wbNvqQa18pM3cXXjO6aiL2ymDVP2zgdSCU=; b=UlWuvb0J0dv3Fe21hF/c+0p0hQ
	/2J3aeJJxpEYO5qkVj14//+aZW5TtuL96ltLQ1MXmUA8lo5Iqwbarb7wbVa6qGqj1GMFZts8QEeya
	qIUcCDydq74gnCmuyZ4RgYRNWavOArG4U1OEyUzDeFuJ1gP18BH/3Qm5zxlu4FNY1o5U26P6d2H4J
	qdIP6ezu+65ySBtAq7Iayh5Ml8VgICsIwX/cpZPmOB/rKVzBOV9SekGiMsHZgRHzQAihxCUJKXpkz
	ZMrs2YyL7d+QpHtRh+8cyLng4VNL9LHI2IScKMoT16QEDS9K0K8lkHu+4e4JmDTgasd3pafnRSp1g
	Um7v3nIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4LU-00000006hE1-2Ywl;
	Thu, 20 Nov 2025 13:05:08 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4LR-00000006hDC-2EQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:05:06 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-882399d60baso5865436d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 05:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763643904; x=1764248704; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp81uKru4wbNvqQa18pM3cXXjO6aiL2ymDVP2zgdSCU=;
        b=m5+ZR4i+8y0DYVFbMltSvAejxl+cRtd6Ff/YX33wxYpbunqVkCHL1k1gUWfFNu6Q5S
         F/C5rBgt2HQwgBLWzmYF7uzqFdNI82EWGVCHfcdN4l8+ruEtcH6GivqhuKGTAh+a5lRr
         XrE/GgOWtEPnoYJqZAyN9aDAElx1Ty8RYGkNl/vPHq38U+OOL9C1oXo/CH2JFyN9cy4B
         JRwuNLRQjjwSXbjykjjUf7DOkEaYpzyChLTP5mFe0Yzy8oDOCmzmHC+YhlVWKDcMrx/5
         KxfqeGmJspdRumlm8dh7NxT+pO/1xdvv9MYW1NvsaxMbcNVV9JP/ZPKkql3+jXFx229Y
         WE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763643904; x=1764248704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cp81uKru4wbNvqQa18pM3cXXjO6aiL2ymDVP2zgdSCU=;
        b=bLWQaG2sH3SyR5cutRtvjBYMgu6cl6nRdwDig105L6QXUBfISmD70fopkLV0a9ZUHm
         6cQEHH6RhvsVDYdWOUDSEHk/sU8UgH80w7rVxkvTLN7VQkUMQF0V9FXnARdvX8sEngLk
         VVBqlqj1Beo1r2D8/MVwTk5qb1+n/A9Q0g/jq4lPThDdBt94TVnn/wyJTs8cavriIOLS
         QMHS0PHsdV8gnmvEkAEEChR+jWZgrZRi2tlERiZ9FL4wTi+a0DcllrOxUryQ/ysETdDL
         QLAqGlN6M7iYNoPPS7O9VHa4Ag8larducZoPUEerVY4CkxrjPthfml60EJQ1N5Ynu8E0
         uQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVwG/ufwAxC+DQb0wTNgLhLGSpoltMBooiwx8TI3qVKyGlGIEZiXFwnTDgdaIZHpMYBJM6qell6Nx4vw584Vv8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi5eKIFcpQs3ARphtDlwTYpB1HJyBQWALhLdV/nym2S5QIe7iq
	q2Oqt6nVtMhBvN+2Hnt8ZZzvDRrfzLElZeju4mkd9Osv4lR6vucmhsb+0yNUUu7x92Ibx1astpL
	cYz0XeIRbDlwiF/M+Sf8zPVg+Q7Y0RWu6fxFsrW6ctw==
X-Gm-Gg: ASbGncuUBRwTqTWRgYXaS7XmrRT4MolDO/9BOgeMTO+u0LY+S0DR/PaEs1wXgPIqywT
	eudxo2/nqw6vQQzu4spNTLzzB8XWNMl3DlKddmxSD7J9gZLqbEyDO8jM9ppsmpeQTrKFPU5WcKs
	AoEqQNMqekDyjEGk0tXC9rprnZcC3TKuxOJOkRL7v6IBeowDh5ETOI7iJjzcbhf4WWQokR1kzK0
	o51739+pr/PjoKyI+jHAdlW2bAyscyP9foXkr1moYNm0yiR3WxcC8nx1UQ6QrS05ms74sNMzsmq
	hxMYVZWAUboL61GXZ2AKwLOoX7SM
X-Google-Smtp-Source: AGHT+IFo/aSS/I5Woxf1qA/vvCJm6TdAHl+dgzCvKj51CgfGGOhvLqYrfFg/UH0QYaSj40AF9uzcSFIopG8Wvcb/bo8=
X-Received: by 2002:ac8:59ca:0:b0:4ee:14c3:4e65 with SMTP id
 d75a77b69052e-4ee4945555cmr42191351cf.29.1763643903522; Thu, 20 Nov 2025
 05:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org> <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 20 Nov 2025 13:04:52 +0000
X-Gm-Features: AWmQ_bnYbLkNGfXqgQNiuHzyH9NftZl88vYLYuzV3kIyrDY6MDUWnA1h9G1RZDg
Message-ID: <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] coresight: Refactor etm4_config_timestamp_event()
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leo Yan <leo.yan@arm.com>, Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_050505_617950_F2E69CFE 
X-CRM114-Status: GOOD (  36.28  )
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

Hi James

On Tue, 18 Nov 2025 at 16:28, James Clark <james.clark@linaro.org> wrote:
>
> Remove some of the magic numbers and try to clarify some of the
> documentation so it's clearer how this sets up the timestamp interval.
>
> Return errors directly instead of jumping to out and returning ret,
> nothing needs to be cleaned up at the end and it only obscures the flow
> and return value.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 96 ++++++++++++++--------
>  drivers/hwtracing/coresight/coresight-etm4x.h      | 23 ++++--
>  2 files changed, 81 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 560975b70474..5d21af346799 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -642,18 +642,33 @@ static void etm4_enable_sysfs_smp_call(void *info)
>   * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
>   * there a resource selector is configured with the counter and the
>   * timestamp control register to use the resource selector to trigger the
> - * event that will insert a timestamp packet in the stream.
> + * event that will insert a timestamp packet in the stream:
> + *
> + *  +--------------+
> + *  | Resource 1   |   fixed "always-true" resource
> + *  +--------------+
> + *         |
> + *  +------v-------+
> + *  | Counter x    |   (reload to 1 on underflow)
> + *  +--------------+
> + *         |
> + *  +------v--------------+
> + *  | Resource Selector y |   (trigger on counter x == 0)
> + *  +---------------------+
> + *         |
> + *  +------v---------------+
> + *  | Timestamp Generator  |  (timestamp on resource y)
> + *  +----------------------+
>   */
>  static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>  {
> -       int ctridx, ret = -EINVAL;
> -       int counter, rselector;
> -       u32 val = 0;
> +       int ctridx;
> +       int rselector;
>         struct etmv4_config *config = &drvdata->config;
>
>         /* No point in trying if we don't have at least one counter */
>         if (!drvdata->nr_cntr)
> -               goto out;
> +               return -EINVAL;
>
>         /* Find a counter that hasn't been initialised */
>         for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
> @@ -663,15 +678,19 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>         /* All the counters have been configured already, bail out */
>         if (ctridx == drvdata->nr_cntr) {
>                 pr_debug("%s: no available counter found\n", __func__);
> -               ret = -ENOSPC;
> -               goto out;
> +               return -ENOSPC;
>         }
>
>         /*
> -        * Searching for an available resource selector to use, starting at
> -        * '2' since every implementation has at least 2 resource selector.
> -        * ETMIDR4 gives the number of resource selector _pairs_,
> -        * hence multiply by 2.
> +        * Searching for an available resource selector to use, starting at '2'
> +        * since resource 0 is the fixed 'always returns false' resource and 1
> +        * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
> +        * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'. If there
> +        * are no resources, there would also be no counters so wouldn't get
> +        * here.
> +        *
> +        * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
> +        * by 2.
>          */
>         for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
>                 if (!config->res_ctrl[rselector])
> @@ -680,13 +699,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>         if (rselector == drvdata->nr_resource * 2) {
>                 pr_debug("%s: no available resource selector found\n",
>                          __func__);
> -               ret = -ENOSPC;
> -               goto out;
> +               return -ENOSPC;
>         }
>
> -       /* Remember what counter we used */
> -       counter = 1 << ctridx;
> -
>         /*
>          * Initialise original and reload counter value to the smallest
>          * possible value in order to get as much precision as we can.
> @@ -694,26 +709,41 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>         config->cntr_val[ctridx] = 1;
>         config->cntrldvr[ctridx] = 1;
>
> -       /* Set the trace counter control register */
> -       val =  0x1 << 16        |  /* Bit 16, reload counter automatically */
> -              0x0 << 7         |  /* Select single resource selector */
> -              0x1;                /* Resource selector 1, i.e always true */
> -
> -       config->cntr_ctrl[ctridx] = val;
> -
> -       val = 0x2 << 16         | /* Group 0b0010 - Counter and sequencers */
> -             counter << 0;       /* Counter to use */
> -
> -       config->res_ctrl[rselector] = val;
> +       /*
> +        * Trace Counter Control Register TRCCNTCTLRn
> +        *
> +        * CNTCHAIN = 0, don't reload on the previous counter
> +        * RLDSELF = true, reload counter automatically on underflow
> +        * RLDTYPE = 0, one reload input resource

These field descriptions should match the terminology in the spec -
and this is not field in this register as defined in the spec - nor
are the following really. The event format is generic - so need a
event select macro, which is then applied to any register that needs
it

> +        * RLDSEL = RES_SEL_FALSE (0), reload on false resource (never reload)
> +        * CNTTYPE = 0, one count input resource



> +        * CNTSEL = RES_SEL_TRUE (1), count fixed 'always true' resource (always decrement)
> +        */
> +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
> +                                   FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
> +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
>

So if we define generic event generators:-

#define ETM4_SEL_RS_PAIR BIT(7)
#defiine ETM4_RS_SEL_EVENT_SINGLE(rs_sel_idx) (GENMASK(4:0) & rs_sel_idx)
#define ETM4_RS_SEL_EVENT_PAIR(rs_sel_pair_idx) ((GENMASK(3:0) &
rs_sel_pair_idx) | ETM4_SEL_RS_PAIR)

these are then reuseable for all registers that need the 8 bit event
selectors, beyond just this register.

Thus we now accurately define the fields in the TRCCNTCTLRn

#define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)

and use

FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
ETM4_RS_SEL_EVENT_SINGLE(ETM_RES_SEL_FALSE))

etc.


> -       val = 0x0 << 7          | /* Select single resource selector */
> -             rselector;          /* Resource selector */
> +       /*
> +        * Resource Selection Control Register TRCRSCTLRn
> +        *
> +        * PAIRINV = 0, INV = 0, don't invert
> +        * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
> +        *
> +        * Multiple counters can be selected, and each bit signifies a counter,
> +        * so set bit 'ctridx' to select our counter.
> +        */
> +       config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
> +                                     FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
>
> -       config->ts_ctrl = val;
> +       /*
> +        * Global Timestamp Control Register TRCTSCTLR
> +        *
> +        * TYPE = 0, one input resource
> +        * SEL = rselector, generate timestamp on resource 'rselector'
> +        */
> +       config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
>

FIELD_PREP(TRCTSCTLR_EVENT_MASK, ETM4_RS_SEL_EVENT_SINGLE(rselector))


> -       ret = 0;
> -out:
> -       return ret;
> +       return 0;
>  }
>
>  static int etm4_parse_event_config(struct coresight_device *csdev,
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index d178d79d9827..b319335e9bc3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -225,6 +225,19 @@
>  #define TRCRSCTLRn_GROUP_MASK                  GENMASK(19, 16)
>  #define TRCRSCTLRn_SELECT_MASK                 GENMASK(15, 0)
>
> +#define TRCCNTCTLRn_CNTCHAIN                   BIT(17)
> +#define TRCCNTCTLRn_RLDSELF                    BIT(16)
> +#define TRCCNTCTLRn_RLDTYPE                    BIT(15)
> +#define TRCCNTCTLRn_RLDSEL_MASK                        GENMASK(12, 8)
per spec this should be
TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)

> +#define TRCCNTCTLRn_CNTTYPE_MASK               BIT(7)
> +#define TRCCNTCTLRn_CNTSEL_MASK                        GENMASK(4, 0)

per spec this should be
TRCCNTCTLRn_CNTEVENT_MASK  GENMASK(7, 0)


> +
> +#define TRCTSCTLR_TYPE                         BIT(7)
> +#define TRCTSCTLR_SEL_MASK                     GENMASK(4, 0)

TRCTSCTLR_EVENT_MASK GENMASK(7:0)

> +
> +#define ETM_RES_SEL_FALSE 0 /* Fixed function 'always false' resource selector */
> +#define ETM_RES_SEL_TRUE  1 /* Fixed function 'always true' resource selector */
> +
>  /*
>   * System instructions to access ETM registers.
>   * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
> @@ -824,7 +837,7 @@ struct etmv4_config {
>         u32                             eventctrl0;
>         u32                             eventctrl1;
>         u32                             stall_ctrl;
> -       u32                             ts_ctrl;
> +       u32                             ts_ctrl; /* TRCTSCTLR */
>         u32                             ccctlr;
>         u32                             bb_ctrl;
>         u32                             vinst_ctrl;
> @@ -837,11 +850,11 @@ struct etmv4_config {
>         u32                             seq_rst;
>         u32                             seq_state;
>         u8                              cntr_idx;
> -       u32                             cntrldvr[ETMv4_MAX_CNTR];
> -       u32                             cntr_ctrl[ETMv4_MAX_CNTR];
> -       u32                             cntr_val[ETMv4_MAX_CNTR];
> +       u32                             cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
> +       u32                             cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
> +       u32                             cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
>         u8                              res_idx;
> -       u32                             res_ctrl[ETM_MAX_RES_SEL];
> +       u32                             res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>         u8                              ss_idx;
>         u32                             ss_ctrl[ETM_MAX_SS_CMP];
>         u32                             ss_status[ETM_MAX_SS_CMP];
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

