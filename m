Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A36D12D69
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5qskISDAKCg4z+QIWL0gtQ4d2iJmhM+zHnIWEc1eUg=; b=kxHCeM9vEVomNQTUJyy5Q5Bpyi
	moQRbSNTTKk+R6mVUgiiBfOdrgsAy1DbDuCR8uUdcsTzG9TDyaMoba6EKmOny38fenUi4TRmib9TW
	jDkqwrK62wckFHXmy/Xtv+mqXVAEDzqRCpetr0TGeX7KGGgJHVGzb39C8VJx4LLcdKeFjWrkBTzaS
	SrIwOoeAMSdhF7C31ClgorXguyNa4Dxcf4T+E/ILhK+2o2BBB4vZ5eWrASqpkBI/Xxea2SllE/RZ9
	aIK7xpNWCEVaqqmAHFNbJaHjfIuHN2G5xhpFTwrxvrcGgfaeWBqJvyRIdcblhT0gGTaIpqUE6QvLW
	j987pn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnmT-00000006e5K-0sqH;
	Wed, 03 Dec 2025 14:24:33 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnmQ-00000006e4y-1xw5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 14:24:31 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8b2da83f721so121899385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 06:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764771869; x=1765376669; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r5qskISDAKCg4z+QIWL0gtQ4d2iJmhM+zHnIWEc1eUg=;
        b=OaarqdEAhG6wAShzZ0KZ9p0faTc5skXwDKW5Oot1YLVV4YzR+ImiWHFnTkvwTeE02s
         JbhalCjZyRVoQPrTdORiAgAT07/LgczqcUIkiOlG9TV+Q6hMZXANjwJb/lxNvKvucVd4
         rvtT49X53byjZL3VFcoKe3z+q1p3Kau0gqURBB4AgclT3+//F2zW7YGBBXiudwMQaYUZ
         oLLUmRTGEMX+q1i2kThdYgChISgyBEKTEDOHwaBzHaU5RQx8+96JTR1co9tnRuMXiuOj
         13l2hcqI20ylTUbB4OEi2iAAAIbBOx1XU+5VndpvmybY3kLSLl0cGRCnN0a9fHHzrruK
         Y5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764771869; x=1765376669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5qskISDAKCg4z+QIWL0gtQ4d2iJmhM+zHnIWEc1eUg=;
        b=L3/lW62F8wmF8z6C7mkR65XkrKgk0VFSYfZbUo55OEZ7ghYeXXEz2/+VJDmQ6S7kYS
         o1JcAjeSlP8QQnPfef2SC/OWr8+9wFq57XYmd94ElH7rbaAhbBSx6Paw2mKmv5xVIbLe
         tR+BQb4MXxGvl57XN3eL5fIGg7cnmfC1luvGllVBf03KM1V9YhdwG7/GNdwvCj4TJAc3
         fSrXVQgz4Vjga60d1FCDliwSpVnaB4GvDa28lsYX2KhC2/Vw8HLjrnCj9muZjjTDR33D
         fKpGHxXa90uP7RTmHFhESToHKXvsMfis0s/XSb4mtPg9b4pEtGC6EukiIKlyk/T2c8il
         OPQw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Ra6nEAyC2WCPgOwTqcJ/35rZ5MfqVR9tJ9Eqcaxb0ThpbEqBfQKOUmJ/T7cu+tz8yB1Ao1gH+C2m6IGwkvMn@lists.infradead.org
X-Gm-Message-State: AOJu0YwKrgX9gC79cBITGslmClWFnsAtzTrMcPsj1qM3GcGn18DRRe8E
	oewm9TEr/e8F3s9cBTU6ThWvnAffK8j462SR58yPQCV1s86Nin8F1PxQ7XehI1VJcfRIp4QP1qG
	yetFLpk4SE2uFs6KdwjYlLNlOGw/s4COxJWjbs7lx9Q==
X-Gm-Gg: ASbGncvYplQaTy5QkNhK0/MAhDgeC6bqCivGhSiSd2Z9fJtU3GOFWAdu8QgNI6PRnTr
	QVbIXuPhrN4mVbkgNf8UPJu49llwv79kwJp2QNcPFfTrdVGPAW7xtPJBk6BFzLm2i2RLUnpikLq
	XmGoVnfWez7CwTnCg179gbkRNfjuEc9ULZ12CIBOjeFBfeCH/gN1FZf/PaQNvIQVS3q27GxKcY+
	vrA8AEfTOWGIkUh6gsPGAKgimaeyqsY+eQQ1QuS1BStu8y7EvxBKtajQ8AeH2S6ywdXkPS/lcV+
	9AFMGsfR+y2C6qWcbW5ul2b7PSBV
X-Google-Smtp-Source: AGHT+IHW/wvz46cirJVdb0ydTGRkXFpB8nU++eDo7RKgpwGtmzjwrPlqlevKOHAq78DzOPpbB2V/P/w7c/OdxPVoer0=
X-Received: by 2002:a05:620a:4509:b0:8a6:1a5d:7ae8 with SMTP id
 af79cd13be357-8b5dffddeb6mr382232285a.28.1764771868569; Wed, 03 Dec 2025
 06:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 3 Dec 2025 14:24:17 +0000
X-Gm-Features: AWmQ_bnPqOnbB2FC46dO5gwckHxNG_hP9_zgKDxddjfNsZgM-YCOIMCE4ibSDP8
Message-ID: <CAJ9a7Vgd7+Gd5=Es=z17BB+DbOiL1WYGvNWx3uC0VyEngj2v0Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] coresight: tmc: add etr_buf_list to store
 allocated etr_buf
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_062430_565323_C2882623 
X-CRM114-Status: GOOD (  21.43  )
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

On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
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
>  drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
>  drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
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
> index 6541a27a018e..292e25d82b62 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>         s64             len;
>  };
>
> +/**
> + * @sysfs_buf: Allocated sysfs_buf.
> + * @is_free:   Indicates whether the buffer is free to choose.
> + * @pos:       Position of the buffer.
> + * @node:      Node in etr_buf_list.
> + */
> +struct etr_buf_node {
> +       struct etr_buf          *sysfs_buf;
> +       bool                    is_free;
> +       loff_t                  pos;
> +       struct list_head        node;
> +};
> +
>  /**
>   * struct tmc_drvdata - specifics associated to an TMC component
>   * @pclk:      APB clock if present, otherwise NULL
> @@ -242,6 +255,8 @@ struct tmc_resrv_buf {
>   *             (after crash) by default.
>   * @crash_mdata: Reserved memory for storing tmc crash metadata.
>   *              Used by ETR/ETF.
> + * @etr_buf_list: List that is used to manage allocated etr_buf.
> + * @reading_node: Available buffer for byte-cntr reading.
>   */
>  struct tmc_drvdata {
>         struct clk              *pclk;
> @@ -271,6 +286,8 @@ struct tmc_drvdata {
>         struct etr_buf          *perf_buf;
>         struct tmc_resrv_buf    resrv_buf;
>         struct tmc_resrv_buf    crash_mdata;
> +       struct list_head        etr_buf_list;
> +       struct etr_buf_node     *reading_node;
>  };
>
>  struct etr_buf_operations {
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

