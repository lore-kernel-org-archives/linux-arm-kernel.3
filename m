Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296C8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yZrG2IX4YxIpRwaDv2ArGlK0M+w1CHoD4d5r14y/Vg=; b=vpcwXjg6a9esAQVD1+D8Twl5W8
	pu1x4Z7MZFR+HgXLiiK/bXXv0/zvnoEgYIysl01Nsx6lm5mox9j4bXXbWvat35V030YlCcEdcNNkv
	mAniAl176OD9mKazvv9NTZV2EDiSY48xgb4sMYebme00J8mFpykSrgtR4F67aMpWpV9I5RzGjO5cQ
	ZnqxbytiHOZABmG2f3t8zVKztV5BjqVXP//2mXvaxD7rICMPFIUIp5BptjJTyqAG/743WhQX5aWSa
	mVw+INJgO9ZqQ/HhreSxvrKBf8en+rbiWi0rKS9gxaqFdWCvJLKyCRiNn4og38aLHmv0R2Gl2ZSpr
	5AGyu3yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6nb-00000008Qcv-2EDV;
	Wed, 12 Nov 2025 09:05:55 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6nZ-00000008QcF-0Lag
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:05:54 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8a479c772cfso47375085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938352; x=1763543152; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5yZrG2IX4YxIpRwaDv2ArGlK0M+w1CHoD4d5r14y/Vg=;
        b=KHyHoawjxZuodWyTa1jN6Hy+Nk0Oc8vpuGlBi92fjIiJVplyKxMW4dDfWTbzqGNoDT
         AqestI/FHZT3TVSsFInZ9HI0ZzraKn8y7WWgJS6x+F3QBnd7wY/N2OiW3n2FjVw4L77j
         4dk722hr5byLQ55oXSorjimWhGfrHVUekW3LBUMurTjjsB039YGrrsu+QMPY6/SBCTyn
         b+HquNB0o49kJa0xD869y4ovKKdxUraIuUtfmKgrV3jYdvOUAkQzWskBzgJFArVy2CO8
         x890acCZ81ZxAyrZbUCatxCofC0GBJ6PwGsEDYaAKg2XcxqzIWfUBpybc0BzwvfqV2hB
         MPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938352; x=1763543152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yZrG2IX4YxIpRwaDv2ArGlK0M+w1CHoD4d5r14y/Vg=;
        b=K68uppuUPmiL3QFmqtXZ5fw4XQrVlFBkUzU/g7Ih3gp/4jNY06SVEifmQTK0vCQAeD
         l6LAdnC5K+/pdb7afmYVX24tbsFrXRte/qfNRGgCK2ZZoE/CJn62uqfXKADyzooQDn3s
         MbYFTIwWRDcc0UIbLmcNLtszAsW6FTNY6x/j6yaGT1gi7Lvy72Iw4D0IOYJTxdgW0+YI
         2DncIZK55vjvS6sSxl5miQD4lW8zTTgVlRKdvnl28T5rgU0omY8YvcUG4WRC9ybzJDBa
         pB6q2f56zPsKOMaXXhSxoxq5SgIrgyh86V+ZdgFWLT5TVxA8IaMzWY7Xa6r08gfe94Vp
         sb6w==
X-Forwarded-Encrypted: i=1; AJvYcCUSK4cvjYYNQPWnIA9sLwxhfVQkjPcYDpxNlDR0AWA9Cy6MQUPFRQX+sy4QeJ5C253jwRbPAQSmMzved1xRtpXO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4wArC3V39LVtxmRHAnE/ieY9rQJIOpszcRroxeZXYuP/pgTPR
	QySu+jtrkvAlo4fcbX/fap5QFiZVaxma/ho8arQZxT1Ip80FRqQuHe5fJ5ShcJWQ17W3W9BuPSC
	yVRmLKamhZn7c+qmvYJdF6TTu6ya7ycxJr4WdDkC0rw==
X-Gm-Gg: ASbGncsqydYuAucSpNcDSE93rFqsXAJiqoiostloWKRp7MgYWu6xmytr2LaTXXtkrF5
	zntFGp6JPj6Ga99WBIOdjzHTE8gGSylzj4NLuijUucN1kNoAkfuwVCP5JjiUCoN012RDGX4UUUH
	KuWaAtnhMT77WB2vuS9CIo8RXghpIoi2pn36w0cRcibivfCLoy13B+vSIzFQYAde6+0TgOVVquA
	TQ0sTSL96jrlTxPfL7+JMNBKjRvZtFQUWSec+j4uZsAiOukgb/k+4Hls9nun8N/WGY6gshY6DTm
	MyqhTH8I6i0A1fquTw==
X-Google-Smtp-Source: AGHT+IEC7n+0Hwkg9zr5NO1uSZUM7AK5PNiZZB2P46Bu53qwG53b5ovHC1jdrTqeK05WEuOnWhT3mAi7auMuGuRKL00=
X-Received: by 2002:a05:620a:29c4:b0:8a2:e1db:f442 with SMTP id
 af79cd13be357-8b29b77a962mr278703785a.30.1762938351858; Wed, 12 Nov 2025
 01:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <20251111-arm_coresight_power_management_fix-v6-9-f55553b6c8b3@arm.com>
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-9-f55553b6c8b3@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 12 Nov 2025 09:05:39 +0000
X-Gm-Features: AWmQ_bkmKIWILtUntJbmcwDYHQl58aiFuvF6wc_IMZKDOzzvd9U0QdClpUNo3ME
Message-ID: <CAJ9a7Vg2mbHA2wP0umUgh828uhnGqYZZ3LPWHt8zJ5ORF0LXwg@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] coresight: etm4x: Add flag to retain single-shot status
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_010553_135060_971A0465 
X-CRM114-Status: GOOD (  24.73  )
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
> Add a 'retain_ss_status' flag to the config structure.
>
> By default, the flag is set to zero so that the TRCSSCSRn.STATUS bit
> is cleared to restart the single-shot mode.
>
> If the flag is set, the single-shot status will be retained, thus
> avoiding restart the single-shot. The retain flag is automatically
> cleared to restore the default behavior on the next call.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 ++++++++++++---
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 560975b70474c3449aa6799fc1a8e05d5ea93495..8b85a73e29f407a8d5e26a25f4dceaadaeed05ed 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -565,9 +565,18 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>                 etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>
>         for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -               /* always clear status bit on restart if using single-shot */
> -               if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> -                       config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +               if (!config->retain_ss_status) {
> +                       /* always clear status bit on restart if using single-shot */
> +                       if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
> +                               config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> +               } else {
> +                       /*
> +                        * Leave the single-shot status unchanged; clear the
> +                        * retain flag to restore the default behavior
> +                        * (restart single-shot) for the next call.
> +                        */
> +                       config->retain_ss_status = 0;
> +               }
>                 etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>                 etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>                 if (etm4x_sspcicrn_present(drvdata, i))
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 012c52fd19338133129752d35523dc102df24604..d82ec1559b34787dffc7debf4643d948e3850b2a 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -802,6 +802,7 @@ enum etm_impdef_type {
>   * @ss_ctrl:   Controls the corresponding single-shot comparator resource.
>   * @ss_status: The status of the corresponding single-shot comparator.
>   * @ss_pe_cmp: Selects the PE comparator inputs for Single-shot control.
> + * @retain_ss_status: Retains single-shot status.
>   * @addr_idx:  Address comparator index selector.
>   * @addr_val:  Value for address comparator.
>   * @addr_acc:  Address comparator access type.
> @@ -846,6 +847,7 @@ struct etmv4_config {
>         u32                             ss_ctrl[ETM_MAX_SS_CMP];
>         u32                             ss_status[ETM_MAX_SS_CMP];
>         u32                             ss_pe_cmp[ETM_MAX_SS_CMP];
> +       u8                              retain_ss_status;
>         u8                              addr_idx;
>         u64                             addr_val[ETM_MAX_SINGLE_ADDR_CMP];
>         u64                             addr_acc[ETM_MAX_SINGLE_ADDR_CMP];
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

