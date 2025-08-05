Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B67C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/VeXe/l5rldBgts5OXynawp98C/Mo434FuRGJxE2aI=; b=TkNgP8i+846XxIm0a2uaU4f9EV
	73LLyTI5gCpiAScc33ER5/zOaxKpnYN9jCn8k9LjyRzXJFTIzm7uFiMHmdtmNHNBXTnV8wEy4XSZd
	+pSSUy6f1hvzji0Sq+raP+3rdhhgaQSZSyy3iYWcv/nvYjGgVDWmBi5OSu3gXQAAhOodVBYwk9/0f
	b4N+iPyv2p+hgjM44tEZ/6HmdWvYEy2We/dAktrXQ/ELPpVoOsvPaniKdHDqWgLPYYUiI+h0DLLHY
	VjcJa9h6OCnEqHA2fIaqIUOLuGMDEk1PcsAR/DG/qtT3+F6F3KhUbfbpunDlW+gcbOYxYY1T8nUnZ
	fMLYSvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFV1-0000000CZ74-1Qnj;
	Tue, 05 Aug 2025 11:06:31 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFKu-0000000CXuE-43EN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:56:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so4532937a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754391364; x=1754996164; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d/VeXe/l5rldBgts5OXynawp98C/Mo434FuRGJxE2aI=;
        b=X0f54MwfiDUMMKVnC03EaO/LNWklhwvjVbgrNi287KeutyCYqRqxKVpqVYZthp7SGj
         aLtnMBXXuPL2pGYAaS5+U0HdJvsKJ5EUxrNtEMH2zHKL+FnSl4YSOe8GsrSkC2SCSpxJ
         CCEgPSe0bQ/KS3UfvpUx7r2G9oVGLfAT0Aqp4GSFXPfJrrh7N1Wz9j29kYaKCErZbYUQ
         OXXOwxnx9UVmNFeqAAqqTTSRLTgbv794zJ6ddJIYHc9cQu++M2C/A1vAY8y2zDIsi/wt
         QsFxFnn2k4MGLEInfjC4mrNsKnkEcmLKluzw50vFzDftm4ILBcrM/NECZu56Q1G2DZy4
         eFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754391364; x=1754996164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/VeXe/l5rldBgts5OXynawp98C/Mo434FuRGJxE2aI=;
        b=YVkK5+trRWqCB9Xfr/7Tt/OJaye1+RRQn8tyqkrMyVN3986hatIKmsjCzxc6ZCcOMS
         1xQqwMsFcwrxoflJazPj4UnXJqy3lJSkk11EwSneZcLz2Zt5/HdwWICS4naLn2ZC3iTZ
         ovPg/CdomHsXrYfmfQFLqsy7xmj4qbfl/l8KUQrsOVWjpIRCdxp/WhfUggzAL4hCOddw
         nJ2w19+OhjA6QCrZJFgQOx6mambirDG1S+ZHJEgj/z+/6sOEDC23q+fg/AoSejBPV5Q2
         sBoyeVinTApHfphDU2Wr/kM+TK7DY5/4eIqo//e2/ISo7yTFMqnTgoxh3cHEj0W2m4bp
         TQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtQeTingKdIPElUjAPYUaRbHzkBwENbKRGMI3KWAKGSQKU765my6ZqRwZa/+/yAGFxvnx1wptcTc38DYxyvUrQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc+QPFAFYSa3VHFSUpvvgG0AyFgROA0WeOtupntnpl5Qzp3CQc
	6hnfJi38tkNv019oB/2iTTs6c7zoNww4m47XwebtbSmtixJb24vQfOK3wHfX0KTrj/PL6f8IZRf
	i65YYpdDcx0YRatcR2MsGNu5WplU0f96ZUWsn2aPCfA==
X-Gm-Gg: ASbGncvavlwfo9zTi1bMCSPfvbuJEfnDxFL2flRtySEmJw5rCVMKgHMs62+6dz/OMBJ
	J4Pfe/atlmqKtImeXuv6OnQnzK+3PLx8BGAPKZB6QUe2+CjINThKkcrSMklkhZ8J9rvhElK/lH0
	4n0l3VwKEkIR/FhOncRYYrQ4c+oL1fqBXPo7Rt0M9XkMzLlJmqdpRv5htsCBIRAKXQb3Ks16Tki
	YCDAw==
X-Google-Smtp-Source: AGHT+IEarYHV4A5AvxOCETGjSWGuUOG+XoZBKhChS1CnqUYMruWNrncS7P2ua9m9JrHio5YV96s8YEul/OYU+9TpaN0=
X-Received: by 2002:a17:90b:37cd:b0:313:1769:eb49 with SMTP id
 98e67ed59e1d1-321162037c2mr18706130a91.8.1754391364067; Tue, 05 Aug 2025
 03:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-6-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-6-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 11:55:53 +0100
X-Gm-Features: Ac12FXzy9skcWLeiWYzpEUCVA6zwaFefbT-SOpZQ5EoCrDUgJmWE8FSLWcnmKIg
Message-ID: <CAJ9a7VgYTUsBn8=qtfwmkoS6Lib-8LgESLBDxXrRVqLnScLKZA@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] coresight: tmc: Introduce tmc_read_ops to wrap
 read operations
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
X-CRM114-CacheID: sfid-20250805_035605_018864_C6A7DF85 
X-CRM114-Status: GOOD (  22.18  )
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
> Introduce tmc_read_ops as a wrapper, wrap read operations, for reading
> trace data from the TMC buffer.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-core.c  | 50 +++++++++----------
>  drivers/hwtracing/coresight/coresight-tmc.h   | 17 +++++++
>  2 files changed, 40 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 4d249af93097..f668047c5df4 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>  {
>         int ret = 0;
>
> -       switch (drvdata->config_type) {
> -       case TMC_CONFIG_TYPE_ETB:
> -       case TMC_CONFIG_TYPE_ETF:
> -               ret = tmc_read_prepare_etb(drvdata);
> -               break;
> -       case TMC_CONFIG_TYPE_ETR:
> -               ret = tmc_read_prepare_etr(drvdata);
> -               break;
> -       default:
> +       if (drvdata->read_ops)
> +               ret = drvdata->read_ops->read_prepare(drvdata);
> +       else
>                 ret = -EINVAL;
> -       }
>
>         if (!ret)
>                 dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
>  {
>         int ret = 0;
>
> -       switch (drvdata->config_type) {
> -       case TMC_CONFIG_TYPE_ETB:
> -       case TMC_CONFIG_TYPE_ETF:
> -               ret = tmc_read_unprepare_etb(drvdata);
> -               break;
> -       case TMC_CONFIG_TYPE_ETR:
> -               ret = tmc_read_unprepare_etr(drvdata);
> -               break;
> -       default:
> +       if (drvdata->read_ops)
> +               ret = drvdata->read_ops->read_unprepare(drvdata);
> +       else
>                 ret = -EINVAL;
> -       }
>
>         if (!ret)
>                 dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
>  static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
>                                    char **bufpp)
>  {
> -       switch (drvdata->config_type) {
> -       case TMC_CONFIG_TYPE_ETB:
> -       case TMC_CONFIG_TYPE_ETF:
> -               return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
> -       case TMC_CONFIG_TYPE_ETR:
> -               return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
> -       }
> +       if (drvdata->read_ops)
> +               return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
>
>         return -EINVAL;
>  }
> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
>                         "Valid crash tracedata found\n");
>  }
>
> +static const struct tmc_read_ops tmc_etb_read_ops = {
> +       .read_prepare   = tmc_read_prepare_etb,
> +       .read_unprepare = tmc_read_unprepare_etb,
> +       .get_trace_data = tmc_etb_get_sysfs_trace,
> +};
> +
> +static const struct tmc_read_ops tmc_etr_read_ops = {
> +       .read_prepare   = tmc_read_prepare_etr,
> +       .read_unprepare = tmc_read_unprepare_etr,
> +       .get_trace_data = tmc_etr_get_sysfs_trace,
> +};
> +
>  static int __tmc_probe(struct device *dev, struct resource *res)
>  {
>         int ret = 0;
> @@ -818,6 +811,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>                 desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>                 desc.ops = &tmc_etb_cs_ops;
>                 dev_list = &etb_devs;
> +               drvdata->read_ops = &tmc_etb_read_ops;
>                 break;
>         case TMC_CONFIG_TYPE_ETR:
>                 desc.groups = coresight_etr_groups;
> @@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>                 mutex_init(&drvdata->idr_mutex);
>                 dev_list = &etr_devs;
>                 INIT_LIST_HEAD(&drvdata->etr_buf_list);
> +               drvdata->read_ops = &tmc_etr_read_ops;
>                 break;
>         case TMC_CONFIG_TYPE_ETF:
>                 desc.groups = coresight_etf_groups;
> @@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
>                 desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>                 desc.ops = &tmc_etf_cs_ops;
>                 dev_list = &etf_devs;
> +               drvdata->read_ops = &tmc_etb_read_ops;
>                 break;
>         default:
>                 pr_err("%s: Unsupported TMC config\n", desc.name);
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 3cb8ba9f88f5..2ad8e288c94b 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -223,6 +223,8 @@ struct etr_buf_node {
>         struct list_head        node;
>  };
>
> +struct tmc_read_ops;
> +

declare the entire structure here rather than later.

>  /**
>   * struct tmc_drvdata - specifics associated to an TMC component
>   * @pclk:      APB clock if present, otherwise NULL
> @@ -259,6 +261,7 @@ struct etr_buf_node {
>   *              Used by ETR/ETF.
>   * @etr_buf_list: List that is used to manage allocated etr_buf.
>   * @reading_node: Available buffer for byte-cntr reading.
> + * @tmc_read_ops: Read operations for TMC device.
>   */
>  struct tmc_drvdata {
>         struct clk              *pclk;
> @@ -290,6 +293,20 @@ struct tmc_drvdata {
>         struct tmc_resrv_buf    crash_mdata;
>         struct list_head        etr_buf_list;
>         struct etr_buf_node     *reading_node;
> +       const struct tmc_read_ops       *read_ops;

probably should be named sysfs_read_ops to be consistent with the
perf/sysfs differentiation within the rest of the structure

> +};
> +
> +/**
> + * struct tmc_read_ops - read operations for TMC and its helper devices
> + * @read_prepare:      prepare operation.
> + * @read_unprepare:    unprepare operation.
> + * @get_trace_data:    read operation.
> + */
> +struct tmc_read_ops {
> +       int (*read_prepare)(struct tmc_drvdata *drvdata);
> +       int (*read_unprepare)(struct tmc_drvdata *drvdata);
> +       ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
> +                                 size_t len, char **bufpp);
>  };
>
>  struct etr_buf_operations {
> --
> 2.34.1
>

with the above changes:-

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

