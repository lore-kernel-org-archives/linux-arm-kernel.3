Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE53C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ar0NLemVcS8Q0eL1gYpaDXHf8V6Ud9JA+Ifa04irXg=; b=Yobu+3QjCmBtlK/Re9endD1Cj2
	12DSt52aYctFpqx3E0yMAr3c6PHzKJFgd5vx7KnZZSvKavF2NoX+Z4LvMwWL3X85zBcj60i7mCNm2
	7hENaUbyhooG/axBZdQ+UGxcgpt2rmc9MECD/u6CfTfEVNhs7osEcesx/OUmKkSybZhIylJX3aL4Q
	LW/wzpBf43KNV1UvYRVaXu2GlZYoozHWiB0LbKUb09aWHGIXQckQl8/hvEVetlaDHHkv+hkAEvUgA
	igYrxZ1dbs5+yI1n3w2gUnD4HEN/yeiRCZftv72CyKkf+9t3YteR8MAZ6DnTY243ExKGZFpm5vIPP
	+Omcz4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujF3x-0000000CVZ9-1Ukn;
	Tue, 05 Aug 2025 10:38:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEhd-0000000CSnb-2OxF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:15:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af95ecfbd5bso397276566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 03:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754388928; x=1754993728; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ar0NLemVcS8Q0eL1gYpaDXHf8V6Ud9JA+Ifa04irXg=;
        b=cwRm3Up2aq7/hLu852FdSI34Iemq0D/i5YOZNoIbe6ihShiDQCncwmI/M5d2zOtQuj
         Ha+IsnBcz7ruv67pzMvOJgu4wdLGd/i9ebog+uTuxy8xlHgvebKuTzWtLrILN38sFLki
         VmIOypTJlYGoHZ5ArgyVu2YFWEVDiJT5rCKOFgjRrCNV0N6zG6hrfJGhHcqZlp+3rxHT
         ocwc2QuywihNhyZi+HQx8MB1Ua8A6ZzbkQ847LQ0ZsUvJ+u1XmyV/TakikUYJsoSdmre
         US+/HZmR4KtkQM5Z8yIEtoa4QscM5KQ9mdkre9xlq8Ld6vQQ6ttjQyKrRpg8thJxRGSX
         qvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754388928; x=1754993728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ar0NLemVcS8Q0eL1gYpaDXHf8V6Ud9JA+Ifa04irXg=;
        b=i88DMfet+4OtOT8i6DWLTsyAPzRIY1sx2DdIIE+wP2q4P2tSpy4vhj5/0yMxLmWsbI
         E2O5Wt6llM9kOvznGmz4pZGaHka/KRqGvQokDPp5D4dKeHnVQ8Oi5G9alsBPn3VG3l1R
         rvOsuZ66ieNyw8v91SGzqt7pAVBSaDSzDdrgjfIKYaSkvpfTubemJDRFQcmM03BvEZqq
         A5yICvON2lK7dkyyg1n3LnIbFsaygEfBy6dUpEbQszH1UHUacI0rteT5VqkLNoBh1m/c
         fPhPjKE2emT+JMg/PAVyUQSgVZwEEpKdAm9GAYcruG4CNQf4t5FJD5QJanydbGspnZWQ
         aCIg==
X-Forwarded-Encrypted: i=1; AJvYcCVlG+a9GbOHbfLCVtOj62v3c++5epZEAIMsitw0Iwo7grjBncjk88D9rCqo1/N1HbSdrk//sJyhXh8aberHtQux@lists.infradead.org
X-Gm-Message-State: AOJu0YyKomVor4kO5CAcqyfz0WaWk4gBs/96RC7TRJXiapUEluK26R+B
	LXvctsVJVJsbCGNQpSpd6v3aSfO95LF+f4sJbSTtBnwjil1g6V6m3A2yr4yQjv974fyueurosVD
	NRsftnoN71qkOmIMkP5s56aDNA3kgCUxv2spP0uNoHw==
X-Gm-Gg: ASbGnctCpcKXinWqIw8Aiw7VzdUtEDiHMtIJt2Nsc0lGF23qYNT4RYm2leGh4RjvVz4
	TP4IMsweyq199g5P2q95zP8eSOhzuN+oFzfHqniePIHuMsfDsUMWk8qXOIL+N1S9hQzIwu0v1XS
	Che2lmzMz1Rjb2YLrzWzVE3VX3vFbkXS9fZd4usXwGXtV69Y9F2Gl2ST51G31RZ0mbLgCw6ZOUq
	GgVwQ==
X-Google-Smtp-Source: AGHT+IHJC0OEe85WEW+uZTa05xouWEVU5GyBHg1A8HxJHnuylCsAviNXR5p7OpzyynSGKKmz7seq3XWzPEvfHkexNis=
X-Received: by 2002:a17:907:9408:b0:ae3:f903:e41 with SMTP id
 a640c23a62f3a-af9402574b3mr1323967366b.54.1754388923827; Tue, 05 Aug 2025
 03:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-4-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-4-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 11:15:10 +0100
X-Gm-Features: Ac12FXxr456QPb-g62XeDYWEW4C_Du37eJm8f_7Mmf5ggFk2nh7e_omeT6qcdRU
Message-ID: <CAJ9a7VijwFKiaZzKsSKPynWapA3ik9d7JLeE+yVNFB0T62iH-Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] coresight: tmc: add etr_buf_list to store
 allocated etr_buf
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_031529_640066_23587966 
X-CRM114-Status: GOOD (  22.48  )
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

Hi

On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Add a list to store allocated etr_buf.
>
> The byte-cntr functionality requires two etr_buf to receive trace data.
> The active etr_buf collects the trace data from source device, while the
> byte-cntr reading function accesses the deactivated etr_buf after is
> has been filled and synced, transferring data to the userspace.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
>  drivers/hwtracing/coresight/coresight-tmc.h   | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index be964656be93..4d249af93097 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>                 idr_init(&drvdata->idr);
>                 mutex_init(&drvdata->idr_mutex);
>                 dev_list = &etr_devs;
> +               INIT_LIST_HEAD(&drvdata->etr_buf_list);
>                 break;
>         case TMC_CONFIG_TYPE_ETF:
>                 desc.groups = coresight_etf_groups;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 6541a27a018e..52ee5f8efe8c 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,21 @@ struct tmc_resrv_buf {
>         s64             len;
>  };
>
> +/**
> + * @sysfs_buf: Allocated sysfs_buf.
> + * @is_free:   Indicates whether the buffer is free to choose.
> + * @reading:   Indicates whether the buffer is reading.
> + * @pos:       Position of the buffer.
> + * @node:      Node in etr_buf_list.
> + */
> +struct etr_buf_node {
> +       struct etr_buf          *sysfs_buf;
> +       bool                    is_free;
> +       bool                    reading;
> +       loff_t                  pos;
> +       struct list_head        node;
> +};
> +
>  /**
>   * struct tmc_drvdata - specifics associated to an TMC component
>   * @pclk:      APB clock if present, otherwise NULL
> @@ -242,6 +257,8 @@ struct tmc_resrv_buf {
>   *             (after crash) by default.
>   * @crash_mdata: Reserved memory for storing tmc crash metadata.
>   *              Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
> + * @reading_node: Available buffer for byte-cntr reading.
>   */
>  struct tmc_drvdata {
>         struct clk              *pclk;
> @@ -271,6 +288,8 @@ struct tmc_drvdata {
>         struct etr_buf          *perf_buf;
>         struct tmc_resrv_buf    resrv_buf;
>         struct tmc_resrv_buf    crash_mdata;
> +       struct list_head        etr_buf_list;
> +       struct etr_buf_node     *reading_node;

Potential simplification:-
do you need both reading_node here and reading in the etr_buf_node?
reading_node handles the logic for which buffer is being read, while
is_free handles the empty/full logic - reading seems unneeded?

>  };
>
>  struct etr_buf_operations {
> --
> 2.34.1
>

regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

