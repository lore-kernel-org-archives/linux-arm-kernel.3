Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA555C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qefuz4/zXGnZQBriDiq772OSKh+NBl3pjLrowf6tFto=; b=tGLEt6JBq3GuaVly62HJpVNBca
	fy1CIS/Dh7qQ/tbFeHi541b1NBahdRQbCEY7sEKtNO1BBghpnAvlUOld2HB26sfYj+GQdU62vLQ8M
	sdicKdLa5onbG497JqnfYThmZUI2OASKY0tDI4MhYlXc3YPU3p3j4rqUKKxPU7XGQhjppC004UNep
	YN9ZOtXq9KpBrQBK2f/ATnBlBn9TnRJXoeUZzaj5pGl26ztfZinvsfswcfSVuF2x+DTJpYAHw5cY7
	TPT5SOaX8oURDKc4itAYztiYle22AWo7JnJXfxkN8jM+05saQqUyk7AZ7dEP3WuuJwC6M6z0Q6SM7
	fFvK0d2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXrP-0000000ELcI-1odo;
	Fri, 07 Mar 2025 13:35:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXpm-0000000ELSb-31f4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 13:33:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2240b4de12bso6144505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 05:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741354430; x=1741959230; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qefuz4/zXGnZQBriDiq772OSKh+NBl3pjLrowf6tFto=;
        b=BxVswqLKlERwh96xO/25LlMj0KYr4kf71g2n029ZeGoho5irVDdpjPup9pE7tapgXc
         Iolyxu7WgFRl/tF3POzSsRs5k0cvCE5QbA85rSdkTRXf9ZUHIUS0Zc0xUFtxoYU5abGL
         w35NOD+n9/fBXR0+z4o1JzNwrSjFDFmp9/wSSEHJd1QduuPVMol2seegHVnxW4mlYsWP
         O0LlZELcB7AazjOC7+6bITYtov7bLxZe84lDsWYyOcLQq+2tNlH605B4SY17UF6N9K6J
         +N00v6pn9ey3JL2yNesqsN7bbGl1k6uyCHXchfjf7sHnSUbz1PkUr3ATuvi1pGOGlcBf
         idGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741354430; x=1741959230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qefuz4/zXGnZQBriDiq772OSKh+NBl3pjLrowf6tFto=;
        b=CSLiwKDlorTkK0PlFKCUFy9AGkI+V8OR1Hu9U6to2tG8s2XCgaWOM6fvqNf8o066F5
         8lKMHscq9q6Kimqh5G5o6V4Fwd2Yf3FI0Sx72hp3qP9jgxE+Z3oVTr2eBOd6ogPnp3Kw
         PF0graAwje1MVHPk1ekDTMfGzaw4Pci8x+eJFDAaKB29JF3CRn3EI4gnvq3nAiPG6Zoh
         vVta2PItPNHOW6Qi5C/1MQQhVqMFJ2aPeNJn6CBXAVltyiwGB0E+t9qxIwkat4a8NP7f
         Wpvd8XuZ340YQA1r/1iPi3C/x1URDbxcPz5GflLxRFODbP1SYRtpjsOo17Hczh790VCM
         C0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3AwUd2lGUEyDQIDhS+46yrPi7GIwiPBg0xh+KbdeC/Y0yNqrfnAIOWXEJhEHvPaoC43AT7olYSsfQnPWC9kP4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Anh11KkXi8m/569f6eLwxtZuJ9ifgHjYvv8PBKaCBQ1iSL/s
	XOtFvC+XjtuNs+tnWR9e9wH9U8umIfCYnUQf6vk6LO9x5zrZ/Mxjols3AVFZqiVRgFPdxAWLpir
	z69NR0Mm9zGZkeVmRNU2GpAcp8mg6rZWQYgSK0w==
X-Gm-Gg: ASbGncsfEgUvZGDF6T/weZ50OJN1xNMntxt6IeAP2MBvA8bEvKLQ9t1UDpA+PgfXSdv
	ES9ZTPIJMxU7m2C9q2ynWTHedyG6dYTkhSs7AxP8MKCM8mx7HhXqu4n6R3toJjAavhXDEma4zlH
	cDylD4NjTcpSZfiqN0vT72ztsJVs8=
X-Google-Smtp-Source: AGHT+IHRGxC49ANZft/8x4Umwrvd3CXrktB6JJunoqMwcMyPwq3u1UK1JigVlbNzMjMBwBcmwlqKciC3HjjxVzAjDN0=
X-Received: by 2002:a05:6a20:4322:b0:1f1:a608:230b with SMTP id
 adf61e73a8af0-1f544c6869emr6393060637.26.1741354429780; Fri, 07 Mar 2025
 05:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20250227092640.2666894-1-quic_songchai@quicinc.com> <20250227092640.2666894-8-quic_songchai@quicinc.com>
In-Reply-To: <20250227092640.2666894-8-quic_songchai@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 7 Mar 2025 13:33:38 +0000
X-Gm-Features: AQ5f1JrIaweQlcl4Gi_z5MPaMgCPO4piq25c6LCh0NkwnAfTW-agNeURPRb-cXk
Message-ID: <CAJ9a7Vh4OTZdbEygtwc7BxRJSLgkALoaNRPEiQLJQgZvFtnTtw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] coresight-tgu: add reset node to initialize
To: songchai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_053350_765476_49DF27CC 
X-CRM114-Status: GOOD (  24.91  )
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

On Thu, 27 Feb 2025 at 09:27, songchai <quic_songchai@quicinc.com> wrote:
>
> From: Songwei Chai <quic_songchai@quicinc.com>
>
> Add reset node to initialize the value of
> priority/condition_decode/condition_select/timer/counter nodes
>
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> Signed-off-by: songchai <quic_songchai@quicinc.com>
> ---
>  .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
>  drivers/hwtracing/coresight/coresight-tgu.c   | 79 +++++++++++++++++++
>  2 files changed, 86 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> index d88d05fbff43..8fb5afd7c655 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
> @@ -42,3 +42,10 @@ KernelVersion   6.15
>  Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
>  Description:
>                  (RW) Set/Get the counter value with specific step for TGU.
> +
> +What:           /sys/bus/coresight/devices/<tgu-name>/reset_tgu
> +Date:           February 2025
> +KernelVersion   6.15
> +Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
> +Description:
> +                (Write) Reset the dataset for TGU.

Document the value needed to initiate the reset.

> diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
> index 693d632fb079..b36ced761c0d 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.c
> +++ b/drivers/hwtracing/coresight/coresight-tgu.c
> @@ -343,6 +343,84 @@ static ssize_t enable_tgu_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(enable_tgu);
>
> +/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
> +static ssize_t reset_tgu_store(struct device *dev,
> +                              struct device_attribute *attr, const char *buf,
> +                              size_t size)
> +{
> +       unsigned long value;
> +       struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +       int i, j, ret;
> +
> +       if (kstrtoul(buf, 0, &value))
> +               return -EINVAL;
> +

Check "value" here and bail out with an error code if 0.

> +       if (!drvdata->enable) {
> +               ret = pm_runtime_get_sync(drvdata->dev);
> +               if (ret < 0) {
> +                       pm_runtime_put(drvdata->dev);
> +                       return ret;
> +               }
> +       }
> +
> +       spin_lock(&drvdata->spinlock);
> +       CS_UNLOCK(drvdata->base);
> +
> +       if (value) {
drop this line

> +               tgu_writel(drvdata, 0, TGU_CONTROL);
> +
> +               if (drvdata->value_table->priority)
> +                       memset(drvdata->value_table->priority, 0,
> +                              MAX_PRIORITY * drvdata->max_step *
> +                                      drvdata->max_reg * sizeof(unsigned int));
> +
> +               if (drvdata->value_table->condition_decode)
> +                       memset(drvdata->value_table->condition_decode, 0,
> +                              drvdata->max_condition_decode * drvdata->max_step *
> +                                      sizeof(unsigned int));
> +
> +               /* Initialize all condition registers to NOT(value=0x1000000) */
> +               for (i = 0; i < drvdata->max_step; i++) {
> +                       for (j = 0; j < drvdata->max_condition_decode; j++) {
> +                               drvdata->value_table
> +                                       ->condition_decode[calculate_array_location(
> +                                               drvdata, i, TGU_CONDITION_DECODE, j)] =
> +                                       0x1000000;
> +                       }
> +               }
> +
> +               if (drvdata->value_table->condition_select)
> +                       memset(drvdata->value_table->condition_select, 0,
> +                              drvdata->max_condition_select * drvdata->max_step *
> +                                      sizeof(unsigned int));
> +
> +               if (drvdata->value_table->timer)
> +                       memset(drvdata->value_table->timer, 0,
> +                              (drvdata->max_step) *
> +                                      (drvdata->max_timer_counter) *
> +                                      sizeof(unsigned int));
> +
> +               if (drvdata->value_table->counter)
> +                       memset(drvdata->value_table->counter, 0,
> +                              (drvdata->max_step) *
> +                                      (drvdata->max_timer_counter) *
> +                                      sizeof(unsigned int));
> +
> +               dev_dbg(dev, "Coresight-TGU reset complete\n");
> +       } else {
> +               dev_dbg(dev, "Coresight-TGU invalid input\n");

not needed if early exit on input errror

> +       }
> +
> +       CS_LOCK(drvdata->base);
> +
> +       drvdata->enable = false;
> +       spin_unlock(&drvdata->spinlock);
> +       pm_runtime_put(drvdata->dev);
> +
> +       return size;
> +}
> +static DEVICE_ATTR_WO(reset_tgu);
> +
>  static const struct coresight_ops_helper tgu_helper_ops = {
>         .enable = tgu_enable,
>         .disable = tgu_disable,
> @@ -354,6 +432,7 @@ static const struct coresight_ops tgu_ops = {
>
>  static struct attribute *tgu_common_attrs[] = {
>         &dev_attr_enable_tgu.attr,
> +       &dev_attr_reset_tgu.attr,
>         NULL,
>  };
>
>


Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

