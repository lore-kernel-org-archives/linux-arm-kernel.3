Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDF6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDSem0VEHhNCiFbhAejGqkNC7DQu7KRaDbsToqiPuSI=; b=di+8QvqUBBdXnyl6kri/dUpiRL
	lWU+AteVFvNRCOzQNGPzN1pcJnp/+4tQ0DI382XA4Lwgnozo5ni8cjjRRAGqfdh5YMSvI4Zbmhe9K
	JvoyOA1RTUI8XXIHLo/vM/pRgVCOmysDt/S5X9I5ViJGIVHGXBeigSyuO284zk2ydNJuyht6Fy+4I
	8wkrm+s5ywwBnKGfgLff1IDnLG/19HzSJpURE6Ze/BUhF+UbkrEs08FRvWFa08/bLyrChS9nq3U37
	HVQ09Toy7WvBsXYTPxETYNAXWIGt1Rh9FMQ/ZGS6ZPtp+C5c8lzXAZqvGHnd1y/2tP9Z01Mh+mLLq
	kmwZZudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujG7q-0000000CcYM-0feQ;
	Tue, 05 Aug 2025 11:46:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujG5D-0000000CcLi-3vpq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 11:43:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-31ecd40352fso4633380a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754394235; x=1754999035; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tDSem0VEHhNCiFbhAejGqkNC7DQu7KRaDbsToqiPuSI=;
        b=C63fY5h46830OkARbRTTIfmAn4Yod1++YzA5/6JhemqPJcLJw0b4/kbyF/XjsO+Voc
         DUcEk2lhbzWcY1/wO1qHl61Dg2wj4RRITcQWRRCUY+rI5aqsJ8o86r0KRJG/C5POMLpR
         GSYVzFr0fffT+Bs5k58LlZlsvnzDm1SXfQQ+m4PeFgb+6HPiD/P56Lz9N/uK6uNQSx3I
         9neKTCaEm6sSARkozMiz5qMOI2O9lSevLanigRLCrkrVGCiuAGDKXmioyahhm81yOs6P
         S2ee49TePJSonkWOV8qn90XNF8Vg64fRG73nKe9CL7QVTbbjOgbUQK2IbTH+rchfzKzi
         HAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754394235; x=1754999035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDSem0VEHhNCiFbhAejGqkNC7DQu7KRaDbsToqiPuSI=;
        b=s7/+LJQacsfLSqe7BzVKsraLAwDyqXKDMBlyiFECaT4i5Wx4/a6C+MaLfYctVk6Met
         7bt8gmoxwT33QWe50eud87I1hY722cPWt73uMVc3AOAwbbVIeyf90n7+a2sHknOQ6Mkq
         vv/+E5W1fBpFG5CL+t52ABI7JEhbVZhhcDuDXJ621IWBcWJFYzgaxEbBypmfysrYWnD+
         +mO+BGHr2FG1OweqFGUdU8SP+9pf0Rv1Qq3L6d/CuzeSzVOdbekth//ETQJ0sJSIUEtn
         gASB8P6ZEIMYCk1Qg4MDUxjbg9GjBuaLwGKbLIDgk9ZEoFy1485Y31pn39LV1P0lTpb2
         o5mA==
X-Forwarded-Encrypted: i=1; AJvYcCUc68oIjVqJhbrAtDD5YPnp+L/c3z6CIgvHNzcUqDLnYOase7wP1nCGlAcuY/lxfjC2K4LFlv03D/F7NRREgdiE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz6wOEd8lFq+vPhCpLZf8wryWJOBsyhfWOt7XSqjTrcARkqXKb
	hN2dkV8ud88RSB/CTalqYW0FCfPyzpjRrLdc8M24kf3gIODz8WPWXBPWTBkMeCdNrM6lChOqWnV
	+d5Agn5kySze8CsKOrASUREyktXoI6thq2ogUOgvPaA==
X-Gm-Gg: ASbGncu0mJJz3j2E5Tkvec+XFscl5DJ/T4NRcAf0ak1NTZnWcj2gpMylhOPYUXj/mvw
	RBKx0itZBh4DyUGdHxEODBl89qooY4OvYEoCD+OgdyDjzVWLVGxNn55AF1WcJnKiDxUbto2DhyN
	udfhqKXnUb/cSosIqEnBcGGCG92vqlW1EFEuio4wppaCp+GN4GLBaydEsJaLIMGJebW2csuQsQp
	lmK39G1ih0C0LOy
X-Google-Smtp-Source: AGHT+IGQh1IHldLd0Xsa7DV3WGgE48Y3oh+lMpkw5CWGb+Xj011SVcOFfY2rdo3TaHAT5I0VaX6ImgYZfxqtKmD2FQg=
X-Received: by 2002:a17:90b:3146:b0:313:15fe:4c13 with SMTP id
 98e67ed59e1d1-321162c9366mr18968548a91.27.1754394234942; Tue, 05 Aug 2025
 04:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250717125343.3820505-1-quic_jinlmao@quicinc.com> <20250717125343.3820505-3-quic_jinlmao@quicinc.com>
In-Reply-To: <20250717125343.3820505-3-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 5 Aug 2025 12:43:43 +0100
X-Gm-Features: Ac12FXwQ6TRr8fi74oMe-Ptz9AMCTyfI7J3MuYdWjVEh0hc8XNY3WysaB9ylgCw
Message-ID: <CAJ9a7ViD6MqOrtBp6LYnEg-rs6x0c9HuGfy4pWHG1iW67OdT=g@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] coresight: Add label sysfs node support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_044355_989341_D9EDC45A 
X-CRM114-Status: GOOD (  28.85  )
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

On Thu, 17 Jul 2025 at 13:54, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> For some coresight components like CTI and TPDM, there could be
> numerous of them. From the node name, we can only get the type and
> register address of the component. We can't identify the HW or the
> system the component belongs to. Add label sysfs node support for
> showing the intuitive name of the device.
>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../testing/sysfs-bus-coresight-devices-cti   |  6 ++
>  .../sysfs-bus-coresight-devices-dummy-source  |  6 ++
>  .../testing/sysfs-bus-coresight-devices-etb10 |  6 ++
>  .../testing/sysfs-bus-coresight-devices-etm3x |  6 ++
>  .../testing/sysfs-bus-coresight-devices-etm4x |  6 ++
>  .../sysfs-bus-coresight-devices-funnel        |  6 ++
>  .../testing/sysfs-bus-coresight-devices-stm   |  6 ++
>  .../testing/sysfs-bus-coresight-devices-tmc   |  6 ++
>  .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++
>  .../testing/sysfs-bus-coresight-devices-trbe  |  6 ++
>  drivers/hwtracing/coresight/coresight-sysfs.c | 71 ++++++++++++++++++-
>  11 files changed, 129 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> index a97b70f588da..55367bbc696f 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> @@ -239,3 +239,9 @@ Date:               March 2020
>  KernelVersion: 5.7
>  Contact:       Mike Leach or Mathieu Poirier
>  Description:   (Write) Clear all channel / trigger programming.
> +
> +What:           /sys/bus/coresight/devices/<cti-name>/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> index 0830661ef656..9a11bd5b15cc 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
> @@ -13,3 +13,9 @@ KernelVersion:        6.14
>  Contact:       Mao Jinlong <quic_jinlmao@quicinc.com>
>  Description:   (R) Show the trace ID that will appear in the trace stream
>                 coming from this trace entity.
> +
> +What:           /sys/bus/coresight/devices/dummy_source<N>/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10 b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
> index 9a383f6a74eb..ff1f89795188 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etb10
> @@ -19,6 +19,12 @@ Description: (RW) Disables write access to the Trace RAM by stopping the
>                 into the Trace RAM following the trigger event is equal to the
>                 value stored in this register+1 (from ARM ETB-TRM).
>
> +What:           /sys/bus/coresight/devices/<memory_map>.etb/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> +
>  What:          /sys/bus/coresight/devices/<memory_map>.etb/mgmt/rdp
>  Date:          March 2016
>  KernelVersion: 4.7
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
> index 271b57c571aa..743f26619c69 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
> @@ -251,6 +251,12 @@ KernelVersion:     4.4
>  Contact:       Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:   (RO) Holds the cpu number this tracer is affined to.
>
> +What:           /sys/bus/coresight/devices/<memory_map>.[etm|ptm]/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> +
>  What:          /sys/bus/coresight/devices/<memory_map>.[etm|ptm]/mgmt/etmccr
>  Date:          September 2015
>  KernelVersion: 4.4
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> index a0425d70d009..e6a584a4b040 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> @@ -329,6 +329,12 @@ Contact:   Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:   (RW) Access the selected single show PE comparator control
>                 register.
>
> +What:           /sys/bus/coresight/devices/etm<N>/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> +
>  What:          /sys/bus/coresight/devices/etm<N>/mgmt/trcoslsr
>  Date:          April 2015
>  KernelVersion: 4.01
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> index d75acda5e1b3..5578fa5f6f02 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> @@ -10,3 +10,9 @@ Date:         November 2014
>  KernelVersion: 3.19
>  Contact:       Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:   (RW) Defines input port priority order.
> +
> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
> index 53e1f4815d64..c3a81978e30b 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
> @@ -51,3 +51,9 @@ KernelVersion:        4.7
>  Contact:       Mathieu Poirier <mathieu.poirier@linaro.org>
>  Description:   (RW) Holds the trace ID that will appear in the trace stream
>                 coming from this trace entity.
> +
> +What:           /sys/bus/coresight/devices/<memory_map>.stm/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
> index 339cec3b2f1a..9554f4f453a3 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tmc
> @@ -107,3 +107,9 @@ Contact:    Anshuman Khandual <anshuman.khandual@arm.com>
>  Description:   (RW) Current Coresight TMC-ETR buffer mode selected. But user could
>                 only provide a mode which is supported for a given ETR device. This
>                 file is available only for TMC ETR devices.
> +
> +What:           /sys/bus/coresight/devices/<memory_map>.tmc/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index a341b08ae70b..e6d935e83042 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -272,3 +272,9 @@ KernelVersion       6.15
>  Contact:       Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
>  Description:
>                 (RW) Set/Get the enablement of the individual lane.
> +
> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
> index ad3bbc6fa751..2a5868ba3d6b 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-trbe
> @@ -12,3 +12,9 @@ Contact:      Anshuman Khandual <anshuman.khandual@arm.com>
>  Description:   (Read) Shows if TRBE updates in the memory are with access
>                 and dirty flag updates as well. This value is fetched from
>                 the TRBIDR register.
> +
> +What:           /sys/bus/coresight/devices/trbe<cpu>/label
> +Date:           Jul 2025
> +KernelVersion   6.17
> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> +Description:    (Read) Show hardware context information of device.
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index feadaf065b53..f7a0c9056854 100644
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
> @@ -371,17 +372,81 @@ static ssize_t enable_source_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(enable_source);
>
> +static ssize_t label_show(struct device *dev,
> +               struct device_attribute *attr, char *buf)
> +{
> +
> +       const char *str;
> +       int ret;
> +
> +       ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> +       if (ret == 0)
> +               return scnprintf(buf, PAGE_SIZE, "%s\n", str);

sysfs_emit() here.

> +       else
> +               return ret;
> +}
> +static DEVICE_ATTR_RO(label);
> +
> +static umode_t label_is_visible(struct kobject *kobj,
> +                                  struct attribute *attr, int n)
> +{
> +       struct device *dev = kobj_to_dev(kobj);
> +
> +       if (attr == &dev_attr_label.attr) {
> +               if (fwnode_property_present(dev_fwnode(dev), "label"))
> +                       return attr->mode;
> +               else
> +                       return 0;
> +       }
> +
> +       return attr->mode;
> +}
> +
>  static struct attribute *coresight_sink_attrs[] = {
>         &dev_attr_enable_sink.attr,
> +       &dev_attr_label.attr,
>         NULL,
>  };
> -ATTRIBUTE_GROUPS(coresight_sink);
> +
> +static struct attribute_group coresight_sink_group = {
> +       .attrs = coresight_sink_attrs,
> +       .is_visible = label_is_visible,
> +};
> +__ATTRIBUTE_GROUPS(coresight_sink);
>
>  static struct attribute *coresight_source_attrs[] = {
>         &dev_attr_enable_source.attr,
> +       &dev_attr_label.attr,
>         NULL,
>  };
> -ATTRIBUTE_GROUPS(coresight_source);
> +
> +static struct attribute_group coresight_source_group = {
> +       .attrs = coresight_source_attrs,
> +       .is_visible = label_is_visible,
> +};
> +__ATTRIBUTE_GROUPS(coresight_source);
> +
> +static struct attribute *coresight_link_attrs[] = {
> +       &dev_attr_label.attr,
> +       NULL,
> +};
> +
> +static struct attribute_group coresight_link_group = {
> +       .attrs = coresight_link_attrs,
> +       .is_visible = label_is_visible,
> +};
> +__ATTRIBUTE_GROUPS(coresight_link);
> +
> +static struct attribute *coresight_helper_attrs[] = {
> +       &dev_attr_label.attr,
> +       NULL,
> +};
> +
> +static struct attribute_group coresight_helper_group = {
> +       .attrs = coresight_helper_attrs,
> +       .is_visible = label_is_visible,
> +};
> +__ATTRIBUTE_GROUPS(coresight_helper);
>
>  const struct device_type coresight_dev_type[] = {
>         [CORESIGHT_DEV_TYPE_SINK] = {
> @@ -390,6 +455,7 @@ const struct device_type coresight_dev_type[] = {
>         },
>         [CORESIGHT_DEV_TYPE_LINK] = {
>                 .name = "link",
> +               .groups = coresight_link_groups,
>         },
>         [CORESIGHT_DEV_TYPE_LINKSINK] = {
>                 .name = "linksink",
> @@ -401,6 +467,7 @@ const struct device_type coresight_dev_type[] = {
>         },
>         [CORESIGHT_DEV_TYPE_HELPER] = {
>                 .name = "helper",
> +               .groups = coresight_helper_groups,
>         }
>  };
>  /* Ensure the enum matches the names and groups */
> --
> 2.25.1
>

with the above change

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

