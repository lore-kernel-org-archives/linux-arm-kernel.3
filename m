Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91477C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2ob3i08zLMGbbPJV+x4UsT8JaLRG3gVzUr6pbYBjtM=; b=gnIYS0udSpKNbVTzY/wyfG5wYQ
	Rxzb3xpUTm+dyjTGpzuFCkcsz2GiqgLPTvbfvWMF3vLtPRR74e9r8hJ4pYj0Xi2dzgkfXQjQhrbxT
	/jHUVVzuQzHaNxDZrnGFfMuJJGoeKcpC0yl8eovHR0zYpFZZvxf5duAvsYmyHjCN9AsPOupQl08Y5
	rHX73Gbauy5MDGJxG8N9+87iz9IzmJKSrLLV7miAchSxr6RyWtqgbt1a0A2aLgEr6/BI6jpCuvOQD
	Y9nvCvC2oIZLAv3PEqgfOk3tPomuqRKUZe2mizGgr/H8p+6bCg8y65aRGL/z1xrS6iGnc/TVBRxid
	X4nNcZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujH5E-0000000Ckt1-33zV;
	Tue, 05 Aug 2025 12:48:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGoE-0000000CiTK-1vaG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 12:30:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76bddb92dc1so5052107b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 05:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754397026; x=1755001826; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u2ob3i08zLMGbbPJV+x4UsT8JaLRG3gVzUr6pbYBjtM=;
        b=Auuj6EyWxx6bqIa+4d91VVjFQKrCMxGJAbh3pc4mF3Juz6G+s83Mh6RCYybeAmuYMh
         lAVuuXzVR3QcbmxQi44CLX5TfhUsbcgFaHAvGitUaGcph9+GX0QUvjcFLF826py992Jc
         JClcyCd7m4m8EKSRm9K9gBAeKbti3IYXsqymoynspClJMorNh0E53yOvqQTZTqcDdAyX
         LHhQn729/DQgxB7zKnsVjP7t94HUMm+ocNt4IBXHuTEdiqOUmBMteWV/DvsEyFdvLXiP
         jGz5SbN1I5gZtAofD8XvUQ7j0aPNMHnPt/xBsERrVOoUlkeVkvk4cn1exVxeYJRqS8UH
         2/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754397026; x=1755001826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2ob3i08zLMGbbPJV+x4UsT8JaLRG3gVzUr6pbYBjtM=;
        b=vxsolJaUi6LlWRuqTA46jbBmkMnM/3Nm05lPgMIpOh68V5DF+HPiPkahtUpvA4v9o8
         0EsI7YTTcdOKyUvUH9bYFZl4UCxwHs2cUPxcftSIo/A161MuXUG9A5x07ToyRnsh2EN4
         xHqDx7BNZh5UypYq+L2Sh2R0+zllaZz197YgzUT0uWdAj/eeHPCOSwkmE+XscYSCL8Sq
         VqHrAL4+xMxGCmBzriXeflIWrUZ6arPcQl6PvEFQ83uhvioTpCngb4CU4/KB8FVvAGBy
         92SaBgGcIN42OXzOuHUDTHFSUC7E2bC4PVYpFan2hqe4/+ykfPE+/JnPToepJFI88+x2
         cDdA==
X-Forwarded-Encrypted: i=1; AJvYcCUOu+9AMzfYQeYIz6DJ7BomDLNYoNDzYQqMXGwWDrvblPnT586By0u0rFPrTjFjt5KgONUuN6as4PWE3F3zcAUI@lists.infradead.org
X-Gm-Message-State: AOJu0YylhssxG8Qd/AFPzx/+udUAUOEgU7qgEDcRBKlEYHV8cmtHJr6g
	xEKA3Wm1OCZBfw9K+3cJXZfkkCAkW/QkWCtdk+2GNbuw/WRulUSzSuzHgWcXGoy6xuWPzMrd63P
	zDE0ukze0+ST8gbUbxWQ8dWLvC7FS/pR5ijvKLWc1Tw==
X-Gm-Gg: ASbGnctxPnq6qiw434F34rTtZ4R3XLJ2hY4Zgq8HhYzymqas3XlkWpAaKmi2TcwgXnS
	9dWXpnWkY93k9XLo4wCzZ3wRvZxYLkKHSRHwhLkCKXBIoN00YxviMH5o4M1twECasxD1EMemWh5
	QbBBMWCq7IF9lauWg/wWgD9XOBAlektIiQVTP0F+A0DO98ABvvxZRYETEHMyw76cB3/VihoKPQF
	bxylg==
X-Google-Smtp-Source: AGHT+IG07ByK7vPtNDPAezjfjStcLbJ8lUJFVAVvDENQfYbYAPX0NPP/UC9e1+u8wnpzRfxKRdU83UiM5oeocg1jgoA=
X-Received: by 2002:a05:6a00:ace:b0:76b:e868:eedd with SMTP id
 d2e1a72fcca58-76bec4fc0bfmr16869805b3a.24.1754397025608; Tue, 05 Aug 2025
 05:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 13:30:14 +0100
X-Gm-Features: Ac12FXzhAbwcmWH8YH5Gri0KwxI-ciY9ES_IFaBVtdo9nO4aocbHgsFn_WqCcjQ
Message-ID: <CAJ9a7Vi8qpHH2SjmKNjgeY4gdRXY9wnQXhkjN71EcbYSKqayuw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250805_053026_503564_81FCA634 
X-CRM114-Status: GOOD (  27.45  )
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

These ops structures are for generic functions used throughout the
devices. Do not put this function here.

This is a specific ctcu helper. Make it external to the file and
declare it in coresight-ctcu.h

Mike

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

