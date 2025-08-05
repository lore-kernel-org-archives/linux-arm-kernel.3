Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA555C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQUJ+NctrS5XnN4MvLnb/JYO8sbKwmo81SB44CL6l5A=; b=asAjWK2ujkyJX4ekr3akixMh7v
	lDhndKytDLAh9EU9poqp3n/wgCANm9vZMkRYgskX/MpBwo7SpIL45frFWP+X7OE4ehekqOM2nv8Ct
	IGFBpcERO+cjjWheDdQGG0MQMMhL7QNxGyySmTfpzhuKjAqEsGt8kGjIsYirc5xVAbRhl6ctVEDuj
	wlKWRywT8mvCOklK4+A316Z7YUnoQe2vC5SnWYG+1QKiIyuWWcqS9oMqf9sEb3naZYCC8lsEbrDC6
	JJpJqFBrStiV6yj0K8FJm2kY5woy/eZEg0X1VxDuwK4HxsrBBHvm6NDe52Bx17eVLazEguTmv83Oz
	48DTVS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEgL-0000000CSfK-0vz4;
	Tue, 05 Aug 2025 10:14:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujEO3-0000000CQX7-2e2X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 09:55:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76bd202ef81so5848114b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754387715; x=1754992515; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CQUJ+NctrS5XnN4MvLnb/JYO8sbKwmo81SB44CL6l5A=;
        b=b8eZRBc0q2wm+gU8ksZHm/R9CFl4pkQP3e6BhSuQXDMrR4y585jhMlQHgvWEQRvroI
         yVKgu2c4vSi8GVOgPX2AEs0cw6eQxWX+/mK3ObZ1EulB2c3RC5PPAJ+34V8w9J6I1NLu
         9wQi9L1IPf5+xfLqO1ZjShO/RtU4Zc4XbHgM0IxvPAPEUGNKhgaZFri81JKDyU06AxE6
         LpaWjnQkkEvq0B2U/15ndXDLnfPk/LKPEMKOmJVmhyu2ryD1SOC7VxAz3G1yFAVYoQBJ
         pk5lMdkQEGpx5PW+JOisqs0lTEcHb8hY3rG2pOSw8jZw80I1iPZqKuS2RLq9h7w4AiPU
         rQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387715; x=1754992515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQUJ+NctrS5XnN4MvLnb/JYO8sbKwmo81SB44CL6l5A=;
        b=l84FJSmHmnCXCDOB9tkxxNkJbZ3v6+feNgij/5wKS4VrqozWiWqnVhJ5IJl7pit3ea
         FKbsYk82+7RTbE2B+91tBPPdiObHRIqonfziN0oxNfaYJ/H2Tum+k9QLCGBMSw/hcpjp
         K0XlIoZ5whwwhFubqLWCG0RGvFBDHhU9tk1tvrWDvCYxv39kvsQSORG/ZgZiIJWqtyqI
         uvOLGz2r8czPNOQ2d6x23At+p/ei/oeXqPzH3ljVrpYayfvdWrLyZ5/kO4ik1krsvUdS
         sK6oAsaQYDp37jJKSQg2+sjq95AljXJTkCLXos0j3f42ExIRhS6mDqu/KPHO/O961Sqb
         vaoA==
X-Forwarded-Encrypted: i=1; AJvYcCVSKPw0nNG6tkNsvpogALowUAGR+/9eS0Q/nXOaJ2jWIh6IWJWGW+UDLWbT6r6Lmtbnu7cU5z88rnJgrDoUmkU+@lists.infradead.org
X-Gm-Message-State: AOJu0YyzRvOyjhMjhS2xRuJ0GG6wNHOQvfSaTxQQCzM45tfdw7cPl2Ly
	D760Ymb0bqjKvNm7H9CJjHtYi6b7fKAPHxTkyIm5bArfu/BArHfuS5YmKalMWlaFSkIjbORIUfV
	knws8J7aJqLbT72lw3niFFdg09Cp8zLDW8WNx+dv6HQ==
X-Gm-Gg: ASbGncsv7bSotJ6pjsA0L5KKqRue/NvUYSOYA44c60IglTK6hIKsZCePYcpS8BtCDMK
	Z5TPOL4gAzumuQdQuinn5WYRP9YzkGfcpXT16g/i5uGD6FoG3XAgHh8T0gSRglycWiXJ4R9EaxR
	hL59sz5jT/938bAP2lpwU7UmOsd3AQ5Y6kB4tPDCYrSSNNUanTyxTAjmaTEcF4XFPQcH1ZPl5Gt
	P7mxQ==
X-Google-Smtp-Source: AGHT+IHfcD82/iX99lJflKhjf/q/ameBxbpugvuC2ABURfKeJyVve0DWx3ORf+DO9750X+uIrgMuC05+de0uLf7bNMM=
X-Received: by 2002:a05:6a00:2188:b0:748:e585:3c42 with SMTP id
 d2e1a72fcca58-76bec48fab6mr13243864b3a.15.1754387714705; Tue, 05 Aug 2025
 02:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com> <20250725100806.1157-2-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250725100806.1157-2-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 10:55:04 +0100
X-Gm-Features: Ac12FXyp4ZO5j-vKmsroGEkmGSaZdhjZTYW6dd1otj-TM37lG1iabpz7_60enUM
Message-ID: <CAJ9a7VhSMf43_GPhVf=He1S2J_Tn4XLi5cOadbCn+K0St+gdfg@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
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
X-CRM114-CacheID: sfid-20250805_025515_676778_541DE8C6 
X-CRM114-Status: GOOD (  27.35  )
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

On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
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
> index 1accd7cbd54b..042c4fa39e55 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_sink);
>
> +/**
> + * coresight_get_in_port_dest: get the in-port number of the dest device
> + * that is connected to the src device.
> + *
> + * @src: csdev of the source device.
> + * @dest: csdev of the destination device.
> + *
> + * Return: port number upon success or -EINVAL for fail.
> + */
> +int coresight_get_in_port_dest(struct coresight_device *src,
> +                              struct coresight_device *dest)
> +{
> +       struct coresight_platform_data *pdata = dest->pdata;
> +       int i;
> +
> +       for (i = 0; i < pdata->nr_inconns; ++i) {
> +               if (pdata->in_conns[i]->src_dev == src)
> +                       return pdata->in_conns[i]->dest_port;
> +       }
> +
> +       return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_in_port_dest);
> +
>  u32 coresight_get_sink_id(struct coresight_device *csdev)
>  {
>         if (!csdev->ea)
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> index c6bafc96db96..3bdedf041390 100644
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
> +       port_num = coresight_get_in_port_dest(sink, csdev);
>         if (port_num < 0)
>                 return -EINVAL;
>
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 33e22b1ba043..e51b22b8ebde 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
>  u32 coresight_get_sink_id(struct coresight_device *csdev);
>  void coresight_path_assign_trace_id(struct coresight_path *path,
>                                    enum cs_mode mode);
> +int coresight_get_in_port_dest(struct coresight_device *src,
> +                              struct coresight_device *dest);
>
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>  int etm_readl_cp14(u32 off, unsigned int *val);
> --
> 2.34.1
>

Reviewed by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

