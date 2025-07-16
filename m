Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA0C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE7s53Z2C1xLVTq+sUbquydW2QufgfeXOwWrYj8BYEY=; b=WDPHxdfWgeccAx98cURed1vOKD
	grZe/uOuMnCUlN1uuOU85p48pQo2fsEmIoDmHJnzAQeCogyyET49ooP6XQFKUK1c2brW407xSilyP
	eZGa2RGGaEoC5UXCwS2dAmuSfSbYU/ABvMhd2n6XrWfzC5g5wMl9HurC65/IZzl7ai9oqtmFJmKSX
	/cWUUzNhVlRwHnKVUGZa9YrgEVPkVVsxeFmdz6fbJw0W8UXFspJHfXwTD7iCSU3TWYkoUpQepr88w
	a7S221Cxhag3JO8/2pq0pDIrbAei2MQwurymdBDnL5oBcrFx7SYjIaJJEvwi+tHfBkkQ/dnMcY6ef
	06hVRUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzkn-00000007TdQ-14n0;
	Wed, 16 Jul 2025 10:52:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubzFY-00000007PAK-1QzG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 10:20:33 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso5424346b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752661231; x=1753266031; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yE7s53Z2C1xLVTq+sUbquydW2QufgfeXOwWrYj8BYEY=;
        b=jl5B3Nm74Vi75Eny5I1JHN4ODD+f3rxf83CxGaQRWa8UWRv9LQ3TXRHoNviiSDsjmj
         9JWCEioDoKWv+vBUx9HQRGQGUThUOjciT7LolwB+gpD82rzZq91ApHddORjRlkI5SltW
         nC5D9vh4rjXXA7x15aNK55/8v6OFwOK44Vzp9foc3lXg1/lnFiKeqG50helCzoV7A7mV
         MwySIDLxiKt2E4cP1OmzKpAUPYXZqoylL4GDp0d/QQHRs7fNHDgthwvgTMtnDI4wBOUT
         qTCQM5snq/jnFbqVhhwJbS9xI4XXVedzoOP0F7Yr866FmSEiOqEjac1ldzOood5r3peq
         fxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661231; x=1753266031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE7s53Z2C1xLVTq+sUbquydW2QufgfeXOwWrYj8BYEY=;
        b=hhI+MtYERQJFTtyZE8hgaKXa4xkpeN19RwKwQRy/3cC0zydcM/ZdUs3HWRBAD531nG
         Z/LmKz5r04Z3UvI7ZWPgmUV/iaPY74tboYvhhzYsrC8f6pRJ7JCgB52tEs5hLsS232zD
         gIxFz2JNlbz362zPjXfUuV2kihiALxS8FsRkCGnlJ0LPNbPvBS8xSI7WCzE6CAWvwF1E
         ilmz1awcMcBjAd1m1r27tXwYiFrDMZfVWRdj83fSwHOPSA8SCDEVxK+QgrGjg/dsSPzP
         Vpxze8T+ZS2fECq6GpUuZeQ4cNwSHon/LPem81lCgnysB96BmaHkqve6Qh4LE6CfYdP0
         3EIA==
X-Forwarded-Encrypted: i=1; AJvYcCVy6S4061u7Dw6Jd3jHSEyjs7lXiODBKMpXGzBUD99Iqx2Kszjhnu/630SP+lxG/xOLBO/EfzVsLhPjqlNFMDzV@lists.infradead.org
X-Gm-Message-State: AOJu0YywE6OG1T8nxc2aQ+edIvRDWyDs4UClsHIYVeTaOuda3Hg84PrQ
	L1fNbNGAqeNUnVy+ka5TxZtu+RhV4Wiu2dt5bz7YlSY3sshIriimVzGWbC5zaHFj+XkEXyVCu67
	RirB5MfrM8nZnoHifCsVilaFVW3Lt2m8fX5lfXU66cw==
X-Gm-Gg: ASbGncu+ezd5CFNpmeegrivMXP+PCneRE8ksZ6ejqdr5vgYk9V4ZaRl0/AQeS3d/Yzt
	fp9kZDAR4h3tXP584FGZwp1LUJjpFUsYWEQJ22f3LjFkXIbrPMvugZ8HNQf/7QWacfp8JYdATQ5
	iT+DHmjYT5nqtoFIFii68dPjPehYng0bo6myIAUD07i/qJ7eZtMMo69Fq1scN4ctGgVXqjW9T9a
	rn+VgXXqwhbdSbeb0pxAozgaQJXNRH9PSMGw1w=
X-Google-Smtp-Source: AGHT+IEJfkGlROyu9Urq3ipL4Dbt8kv9P0xUk3Y2bWsJERuyYfUiMSGv/EVjUwE4Kw1m9p08wVXMdS7ntVU1yq9lKEg=
X-Received: by 2002:a05:6a00:99f:b0:74e:b9fd:4a3f with SMTP id
 d2e1a72fcca58-75722869e6dmr2716478b3a.10.1752661231203; Wed, 16 Jul 2025
 03:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-2-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-2-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 16 Jul 2025 11:20:18 +0100
X-Gm-Features: Ac12FXz-xYQrg0Cua4muCLaPsoupDwBUZISKjIA1TU9xkJsYijMrosZo4H6_Ghk
Message-ID: <CAJ9a7VjyWtopbnTirRnd4-486PrdQH00cvUR0kcPde2hxCUH-A@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 01/10] coresight: core: Refactoring
 ctcu_get_active_port and make it generic
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Mao Jinlong <quic_jinlmao@quicinc.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_032032_382183_51196139 
X-CRM114-Status: GOOD (  28.08  )
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

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Remove ctcu_get_active_port from CTCU module and add it to the core
> framework.
>
> The port number is crucial for the CTCU device to identify which ETR
> it serves. With the port number we can correctly get required parameters
> of the CTCU device in TMC module.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
>  .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
>  drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
>  3 files changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 1accd7cbd54b..5297a5ff7921 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_sink);
>
> +/**
> + * coresight_get_port_helper: get the in-port number of the helper device
> + * that is connected to the csdev.
> + *

As written this looks at all connections, not just those that are
helpers. That is fine, so perhaps rename as such.

e.g. coresight_get_in_port_dest

and name the input parameters src , dest respectively.

> + * @csdev: csdev of the device that is connected to helper.
> + * @helper: csdev of the helper device.
> + *
> + * Return: port number upson success or -EINVAL for fail.

sp: upon/upson

> + */
> +int coresight_get_port_helper(struct coresight_device *csdev,
> +                             struct coresight_device *helper)
> +{
> +       struct coresight_platform_data *pdata = helper->pdata;
> +       int i;
> +
> +       for (i = 0; i < pdata->nr_inconns; ++i) {
> +               if (pdata->in_conns[i]->src_dev == csdev)
> +                       return pdata->in_conns[i]->dest_port;
> +       }
> +
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_port_helper);
> +
>  u32 coresight_get_sink_id(struct coresight_device *csdev)
>  {
>         if (!csdev->ea)
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index c6bafc96db96..28ea4a216345 100644
> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> @@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
>         return 0;
>  }
>
> -/*
> - * Searching the sink device from helper's view in case there are multiple helper devices
> - * connected to the sink device.
> - */
> -static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> -{
> -       struct coresight_platform_data *pdata = helper->pdata;
> -       int i;
> -
> -       for (i = 0; i < pdata->nr_inconns; ++i) {
> -               if (pdata->in_conns[i]->src_dev == sink)
> -                       return pdata->in_conns[i]->dest_port;
> -       }
> -
> -       return -EINVAL;
> -}
> -
>  static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
>                                 bool enable)
>  {
> @@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>                 return -EINVAL;
>         }
>
> -       port_num = ctcu_get_active_port(sink, csdev);
> +       port_num = coresight_get_port_helper(sink, csdev);
>         if (port_num < 0)
>                 return -EINVAL;
>
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 33e22b1ba043..07a5f03de81d 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
>  u32 coresight_get_sink_id(struct coresight_device *csdev);
>  void coresight_path_assign_trace_id(struct coresight_path *path,
>                                    enum cs_mode mode);
> +int coresight_get_port_helper(struct coresight_device *csdev,
> +                             struct coresight_device *helper);
>
rename here too

>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>  int etm_readl_cp14(u32 off, unsigned int *val);
> --
> 2.34.1
>

regards

Mike
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

