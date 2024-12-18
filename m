Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854F3E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DrgQ6VYoOikcPNwAN7qFiBn6qy+vxpbGN4powdV010=; b=K7k8kDh+wvN7/Kfs0TdP8B6Qxg
	wuaZKh4hVXCdyWhxK86bGTI9xpXSzaAL9vaw4e6U6qgx97wBxViYHl/ZJ44AGhV4lwuaCj3YEB+Wd
	eSDGEha+GyfzH4/NIxq9bszcaMlXIFTE+FHr+iyP/6ZWGRvxEIFiO2/fjNmhrcG2atURCUgwnGsA+
	uebiL2clXQM5UyPwq6XtA2YkfLI4utWUIR2eotH7MpVfEIPQnQLgocG9Y/yEkFMWGG9f5FUduoGr/
	F9eF34yuKES+IDsls7R+rv9HXhU5o3hlonIxgSsw51mUkdbxGSb3nHqWTiyyhcrxciQ0SsTym5urW
	diY91n1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNryZ-0000000GPMm-1ARn;
	Wed, 18 Dec 2024 11:12:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrvM-0000000GOcJ-2On3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:09:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21661be2c2dso46984595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520143; x=1735124943; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7DrgQ6VYoOikcPNwAN7qFiBn6qy+vxpbGN4powdV010=;
        b=Qudxx8IUOH79mGeZe1WRAjSC3Pt2xtcaDDJENDuyLKHOrcus12sqkoTPHwM5L7TOpz
         pU2hxZrusBX2AzYxwsJn5NstZ9Fu34SiO/VHuB2aHofK9K8qa/rjRsYPsyWx0kHt8TDs
         uG1c2n4SC9b53MYnmA5jiOGJlr16aMvdG8FYCE/58u2V3FQaSKxD5Eg4l+GQHlgMpZF/
         Sinj78THY6NbV7M7RdSJ5HTKg9LmZ9RKOIXh7qd72rwI4O5pCNCUuVUl26oFB9HBH8PI
         XUVP4NuzT+JJAhKbwjUsGhosTY6KBjnan7RWiu/MqcOOHWREqi3eMisqP1OEWo6x7EqD
         dLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520143; x=1735124943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DrgQ6VYoOikcPNwAN7qFiBn6qy+vxpbGN4powdV010=;
        b=g5WZMkztg7+lAD/XcKqnwFvPszq55fMp50Y7WtUINNDjIKg8oI1WNv8DJUGUaruyCG
         dCx/2+CfKSe4N4w0uR5QNnozn/NtUWUxb8q+k20f17puT4QnX8MCBQa+PnfI/fcvvEPJ
         yqp9WcwXR1Lzdl3wmsRoXJu/ZaHzkqsB9T1+fxG1e5IzRvi1jPU/CRMyFjJ/9G/is/mB
         0/qJ1O354ON1YVrqHh+pQ7++WzTVxz4mIKEI2K2mKd9UltTCVI971coG0RXj2v/KYiXR
         J7NYw27JPdlS+UaNNa6DdKUPusVrKJubvNeF9EqTvIhfU9hfQAcMHN97F3Ow9G3Y9+R1
         JvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYKqdhgotiL6Y8hxC2U/MaC8saLjDMM8xSY41Plkj8yO4Hr194ogniN2rj0R7avUNTYGiNQU2P1Y/JPr9h/wEL@lists.infradead.org
X-Gm-Message-State: AOJu0YyoAAtvxWSpi2pRjBk7pc0hF4kV2aqruoF7VmZsCdgZWqBiUJHf
	lexCkPIKATv1whY5P9p4rrM/9qjoNI/uBe8fhk+55tICtYHLPAR/UgIq82XdxcrzUc4Q3xs2eoM
	ZRxspLyAlGT1+g0t/wx7kLq4JRcvZaQUdusTZ0w==
X-Gm-Gg: ASbGnctrUUobezfKDyny0uCyc8rAzq1m+JVuyvh6DDvReJeBH81PIBsdX7kMsJU33+y
	LJpS2fYaY5epJ52kDEzXTzO+TO3BY9MSRxPeBWIQ=
X-Google-Smtp-Source: AGHT+IFqtoF/ET1GubMsEABYhPa61QmJqqXS0X7a81A3uzPmB/CXgLPnxaiciklUjFKSIYMFACeznH/zxD6fakuhkUk=
X-Received: by 2002:a17:902:ce92:b0:216:2b14:b625 with SMTP id
 d9443c01a7336-218d7223345mr36253795ad.31.1734520143364; Wed, 18 Dec 2024
 03:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com> <20241217063324.33781-3-quic_jinlmao@quicinc.com>
In-Reply-To: <20241217063324.33781-3-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 18 Dec 2024 11:08:52 +0000
Message-ID: <CAJ9a7VhjZSM-5kSwbF142s4AGdCRvcvmZspAUsQA5cdnHvnGEg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_030904_610297_403A287E 
X-CRM114-Status: GOOD (  23.56  )
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

On Tue, 17 Dec 2024 at 06:33, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> For some coresight components like CTI and TPDM, there could be
> numerous of them. From the node name, we can only get the type and
> register address of the component. We can't identify the HW or the
> system the component belongs to. Add label sysfs node support for
> showing the intuitive name of the device.
>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
>  .../sysfs-bus-coresight-devices-funnel        |  6 ++++
>  .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
>  drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
>  4 files changed, 50 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> index bf2869c413e7..909670e0451a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> @@ -239,3 +239,9 @@ Date:               March 2020
>  KernelVersion  5.7
>  Contact:       Mike Leach or Mathieu Poirier
>  Description:   (Write) Clear all channel / trigger programming.
> +
> +What:           /sys/bus/coresight/devices/<cti-name>/label
> +Date:           Dec 2024
> +KernelVersion   6.14
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> index d75acda5e1b3..944aad879aeb 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> @@ -10,3 +10,9 @@ Date:         November 2014
>  KernelVersion: 3.19
>  Contact:       Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:   (RW) Defines input port priority order.
> +
> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
> +Date:           Dec 2024
> +KernelVersion   6.14
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index bf710ea6e0ef..309802246398 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -257,3 +257,9 @@ Contact:    Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
>  Description:
>                 (RW) Set/Get the MSR(mux select register) for the CMB subunit
>                 TPDM.
> +
> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
> +Date:           Dec 2024
> +KernelVersion   6.14
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index a01c9e54e2ed..4af40cd7d75a 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
> +#include <linux/property.h>
>
>  #include "coresight-priv.h"
>  #include "coresight-trace-id.h"
> @@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(enable_source);
>
> +static ssize_t label_show(struct device *dev,
> +               struct device_attribute *attr, char *buf)
> +{
> +
> +       const char *str;
> +       int ret = 0;
> +
> +       ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> +       if (ret == 0)
> +               return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> +       else
> +               return ret;
> +}
> +static DEVICE_ATTR_RO(label);
> +
>  static struct attribute *coresight_sink_attrs[] = {
>         &dev_attr_enable_sink.attr,
> +       &dev_attr_label.attr,
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(coresight_sink);
>
>  static struct attribute *coresight_source_attrs[] = {
>         &dev_attr_enable_source.attr,
> +       &dev_attr_label.attr,
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(coresight_source);
>
> +static struct attribute *coresight_link_attrs[] = {
> +       &dev_attr_label.attr,
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(coresight_link);
> +
> +static struct attribute *coresight_helper_attrs[] = {
> +       &dev_attr_label.attr,
> +       NULL,
> +};
> +ATTRIBUTE_GROUPS(coresight_helper);
> +
>  const struct device_type coresight_dev_type[] = {
>         [CORESIGHT_DEV_TYPE_SINK] = {
>                 .name = "sink",
> @@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] = {
>         },
>         [CORESIGHT_DEV_TYPE_LINK] = {
>                 .name = "link",
> +               .groups = coresight_link_groups,
>         },
>         [CORESIGHT_DEV_TYPE_LINKSINK] = {
>                 .name = "linksink",
> @@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] = {
>         },
>         [CORESIGHT_DEV_TYPE_HELPER] = {
>                 .name = "helper",
> +               .groups = coresight_helper_groups,
>         }
>  };
>  /* Ensure the enum matches the names and groups */
> --
> 2.17.1
>

This is a clean and simple solution to this issue. In this form...

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

