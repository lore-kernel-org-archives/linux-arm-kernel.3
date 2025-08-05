Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADA7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+p+3kxq3ntOlQXSdZIEKvX59/vh/dnjsv8DSeV6UdvM=; b=zQaJyG3Frs8zITLjqNeoULFr9s
	bzwJYxV4V2ZrOTzNIzYgMwa2AGmZ0muC5ZyMHctsdA2uJtLk/zcDLTksgdS4xHh9xa5LW9Syqb2c/
	rAnwricbs/HXxTSOfz4hA+O/DcLMFFlZyel2VWQQs2RxcdAh1WCxusSF4KFgLspSWPckrfkPGv6AT
	vvMX2Ajjj9QmNvL9wuIC4qa31/cFUsPQVF05dPgQhVam8+6BF5CssfrbpuIqFZwn5tx6Y0GYeBtME
	G2Q2PaRstAusvSJY4QRTHAoE06ha7rrdE970mRhopehWIpGjvzvcXevV0vf/sW7WkVIaKJsa8HYcK
	t/mdekKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujH2c-0000000CkR1-3OsK;
	Tue, 05 Aug 2025 12:45:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGml-0000000Ci5S-35Ph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 12:28:56 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76bd202ef81so5998046b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 05:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754396935; x=1755001735; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+p+3kxq3ntOlQXSdZIEKvX59/vh/dnjsv8DSeV6UdvM=;
        b=RNn26n8SyrAv9GB6Vb4mhma5dR1X395YWjTgzrUkXM2i/TN/NNh+jC0WsPBXE5rqLQ
         nGDvv7kS0izHcqRndJjnzt8o+nAvnXy1hddDQdYt7AepVlV/7RMm9BFIX0AJt1nZtf5/
         a7dE1veNDx/j943nvQgco2TLQ/2KA+aU4tw9qQuGRByPI8rXsRD2xf1rMNKuuRJi2lgM
         Rt/zQpJxVMODXpTn8JqY3qZlfgGjlmffYAzo4/rYYBuriAgFzOgOZeWQQ2KpDl9oppNn
         s8c6HYObQGHRiFG4OdeGpbjCa2vBxhtfM6tcdK2oX5RZBgeH6VnY8GnrazmRkWnrTa+A
         ioLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396935; x=1755001735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+p+3kxq3ntOlQXSdZIEKvX59/vh/dnjsv8DSeV6UdvM=;
        b=uKG6HnKj4HUEYOqeLjamYGEgMakhWkTW2mg06ZhxxXGRiUxz9orYW6K8IXlBQroNTJ
         kMbUk4z7dZOP5AosIjuHgJbD2nBbBlsG7/BH4WKQ3KSo7pdQK4RIZXimeio+pWw4ve5X
         AL62sSb9kvtc/lyZSNE/W2n7e9rzIhULj9Nqu+vHgiL0NSY2artu7xY1PU6k+u7F+BlE
         qVf3ApVoX3OkZxJ1xvPP2VRp0iAmOAWKG0A8+p+CHLSrdf+zwZhb3aqtcLeYstVU6Cuq
         +rLC6/QcqgRckGxeXKRTLRt5AhnUL2PMJdmpuTdBi7PkrITdCrMqNFaq/glmHywLncOm
         DsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpxqXw+AHq4MS5qq2oAt8MZzJQ1fkF9QKvFNbb5Bu8XWkC7fCLVc2Bj0HSeqhxS17FPnwEzGRV1aUtC7GE9/gj@lists.infradead.org
X-Gm-Message-State: AOJu0YxtIzNssTTgGYY4UZAwCsgDOlCTaNiPLkMYEHe4MbbUAv/wEdhg
	l9WcgkCWRWxMgf5gN9CMV3aTPr08ZAds9ivkymZMblRiDKomMK2O2SB2LUvCLP2f4eLYUIIhreZ
	kMcXxsrSKtt0Y1+JUohe34km7/6Z8KBtMu6hhP/YlKQ==
X-Gm-Gg: ASbGncuLMJaA2dGav0ZZDC4jT6XSgWdAWlpXP0X6yjJlzLzAWIrxVqNHkhVdVMga6FH
	yh5MVSqX90yLZqfqE78OlO1oNT8mPMwVzuUj/Fj0f87xulr4aKssqUUkbXMeJa0eLYbrb9EEt80
	a2lbi/nFDlrtadrSg+ZkcEba1PDB+NAvdYAv9CRUwsKXgsCxwmtHIAIQeqsrVGrPhaymjonwd/e
	iJgvg==
X-Google-Smtp-Source: AGHT+IExvJ4N1aljdcQ1wuCSC3UpK9yzFpm/S0FUzyPbPH6TNyJqC4OGMrFOG+eOwOOVTv5X+OTdnmr6+Qic86Q26FY=
X-Received: by 2002:a05:6a00:21c3:b0:76b:de63:4341 with SMTP id
 d2e1a72fcca58-76bec4f3eaemr17001782b3a.23.1754396934498; Tue, 05 Aug 2025
 05:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 13:28:42 +0100
X-Gm-Features: Ac12FXwYp4daB8lz5LB9vGwAGirh3SOTL_q0uxZYc7ZOfj216c9w3BrZkoxGXog
Message-ID: <CAJ9a7Vhw22ZoDSUced4tpBUx-Ej+8njQa+Z1SVGfyesMh-ChRg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] coresight: add a new function in helper_ops
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
X-CRM114-CacheID: sfid-20250805_052855_784413_2C420EE6 
X-CRM114-Status: GOOD (  26.15  )
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

On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Add a new function to identifiy whether the byte-cntr function is
> enabled or not in helper_ops.
>
> The byte-cntr's read_ops is expected if the byte-cntr is enabled when
> the user try to read trace data via sysfs node.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../hwtracing/coresight/coresight-ctcu-core.c | 35 +++++++++++++++++++
>  include/linux/coresight.h                     |  3 ++
>  2 files changed, 38 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index 8fc08e42187e..dec911980939 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -234,9 +234,44 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
>         return ctcu_set_etr_traceid(csdev, path, false);
>  }
>
> +static bool ctcu_qcom_byte_cntr_in_use(struct coresight_device *csdev,
> +                                      void **data)
> +{
> +       struct ctcu_byte_cntr *byte_cntr_data;
> +       struct coresight_device *helper;
> +       struct ctcu_drvdata *drvdata;
> +       int port;
> +
> +       if (!csdev)
> +               return false;
> +
> +       helper = coresight_get_helper(csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
> +       if (!helper)
> +               return false;
> +
> +       port = coresight_get_in_port_dest(csdev, helper);
> +       if (port < 0)
> +               return false;
> +
> +       drvdata = dev_get_drvdata(helper->dev.parent);
> +       /* Something wrong when initialize byte_cntr_read_ops */
> +       if (!drvdata->byte_cntr_read_ops)
> +               return false;
> +
> +       byte_cntr_data = &drvdata->byte_cntr_data[port];
> +       /* Return the pointer of the ctcu_drvdata if byte-cntr has enabled */
> +       if (byte_cntr_data && byte_cntr_data->thresh_val) {
> +               *data = (void *)drvdata->byte_cntr_read_ops;
> +               return true;
> +       }
> +
> +       return false;
> +}
> +
>  static const struct coresight_ops_helper ctcu_helper_ops = {
>         .enable = ctcu_enable,
>         .disable = ctcu_disable,
> +       .qcom_byte_cntr_in_use = ctcu_qcom_byte_cntr_in_use,
>  };
>
>  static const struct coresight_ops ctcu_ops = {
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 4ac65c68bbf4..b5f052854b08 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -419,11 +419,14 @@ struct coresight_ops_source {
>   *
>   * @enable     : Enable the device
>   * @disable    : Disable the device
> + * @qcom_byte_cntr_in_use:     check whether the byte-cntr is enabled.
>   */
>  struct coresight_ops_helper {
>         int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
>                       void *data);
>         int (*disable)(struct coresight_device *csdev, void *data);
> +       bool (*qcom_byte_cntr_in_use)(struct coresight_device *csdev,
> +                                     void **data);
>  };
>
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

