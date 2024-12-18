Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3711BE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVHcm9pauC3GhK5+Y9PUhjKsCgNwGsAmTgrtAcTlGQE=; b=UT3+yXvjE/k2qITwCqIx41KhH/
	n0DLXM82v2naRBbSrhVs6rEvQTIxfjYbxt6rFjRT571G5X1IKU3ceRLTO4T3XbAA1zPOnxiF15y4Q
	9hOy4zQ4hytcPp8HiyvakDgGgPf70WS++neMOwyhPb7eOygIMiu6nEjwHhgVzInVrwjQ3XIc8dKn8
	eezAW8OyO5hW1i6rnpAYRZslNrru25zPSOreG66AufM71ZT1f4XtnoulDuAFk0bU61m1OdEEKG6Z2
	cfhYZdXZP/8c/XX4rzghetLXDfFyAIMxxBNNR0MWef1yKrFqgsU+4WSbGk9qCjD0Kt/gz020XtWqu
	MwOK/0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr4R-0000000GDVt-1RCg;
	Wed, 18 Dec 2024 10:14:23 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr2W-0000000GDH2-30X6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:12:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso4356676a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734516744; x=1735121544; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVHcm9pauC3GhK5+Y9PUhjKsCgNwGsAmTgrtAcTlGQE=;
        b=UdnFZJPmPd4rOer4qNBlAp8wnmbJCFr9b4tIy0TIKihIpVXbDVKwd5RaKt8gRKNr67
         cMK++DGocHRa6i7Vy8JZIj+bosoYx8eJ5FzbnPbCPAIdD0Y5vhjwVazmk078N1Q+k+5D
         yES1YnQiIaH8PD0Twt0NcgnzWb4nmtkwzY6JVTCJae/mO+UWuHFURVC7FkIlFTp8W7gU
         /SU8FPw4QXxqQTzrO5C4uiBfgnh0Uo4y1Fp6saBx99Pa61vUA1uBESBE6Lnc8QapZVsa
         XyZ/bQ4P5NfnhdUO8ngETyCMDsyw8Xm1qdl9liRkzCw3wg8jCPGwMmpVMDaEDXS1ksJS
         hDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516744; x=1735121544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVHcm9pauC3GhK5+Y9PUhjKsCgNwGsAmTgrtAcTlGQE=;
        b=uaqskwiwTlUGNFMpmgInGFejDoBw43a4Na9zRgTRmIHsSmcOZuaMQk7zrtsHQg7yx3
         5qrMiNzBEcVhWXOufHIvdJkbPdhM8tixQZCSJBIOVL5gRbtduqivMhiYlG/oxcWVhSmO
         D2WLm8eIMtPpKMTFdhz7YP57/O8Yc2ZE3hVFD4uNDPpOPTiB9wUv9YtUj0RJsnhQs1qw
         r91bilZGMJkwTdnOrkhBvDuxA+qIIfCar7b2+FOTDUhCzXHi8/SCj0CZ3/tG1OEVIEGk
         nuNJL2IfxR5vVqS1gQEiXo0BgEORkZKM3OI7mDcKQdbNDgy7wkCx3rNbOLaCtx0bvXut
         epdw==
X-Forwarded-Encrypted: i=1; AJvYcCVfriEGvDscQmgpUvyAhUrIrJ8Ngm/vT7xuYZctiq/oUEjcw5L5UA991Ms1FHVtodhs/LtHTrtvXhwoQ1RIhC70@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0xPu0Ihy8pc3zffxFoYChAUfuAsX+fIa6jiwlbz3OjssxNa1Z
	BV3e7VBb9tyIzVgNea+O47TpqlqL08+NenE617ip1q7SD6Q5Qw/lDQc5zUv7JJhHlLKl5kbq+Qo
	C88t5BtkbgU0EHEu1H9XHIg56NmDZG2VTFNqCFg==
X-Gm-Gg: ASbGncv9GZjXVMSpF6GynPBB91SbY//n9eyjg5BCdd1+0nE0aHiUp8RZp4UkacLh3nG
	Vgzq82XFLVHNaE7Kby9lxWE3nDhsejxs6cB0ulsA=
X-Google-Smtp-Source: AGHT+IGCS/12iXVQImv5VzwIKtHSK1STA1CqvbkzaVeJurm2ZhL/a0FzlOc63mIq8E3wtYzMzC2DjfMhljG616CLMWI=
X-Received: by 2002:a17:90b:4c0e:b0:2ee:49c4:4a7c with SMTP id
 98e67ed59e1d1-2f2e91feea3mr3241058a91.18.1734516743666; Wed, 18 Dec 2024
 02:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-3-quic_jinlmao@quicinc.com> <985d234c-e088-469d-b9dc-7904fcf5a91c@arm.com>
 <f1c6da16-fbfd-40aa-a158-36ab713ce541@quicinc.com>
In-Reply-To: <f1c6da16-fbfd-40aa-a158-36ab713ce541@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 18 Dec 2024 10:12:12 +0000
Message-ID: <CAJ9a7Vh6EZij9ZTMOj4601QbUZ3S6mqh7USod=uXMrJsXawkkQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] coresight: Add label sysfs node support
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_021224_768788_27FA6B90 
X-CRM114-Status: GOOD (  29.31  )
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

On Wed, 18 Dec 2024 at 09:57, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 2024/12/18 17:38, Suzuki K Poulose wrote:
> > On 17/12/2024 06:33, Mao Jinlong wrote:
> >> For some coresight components like CTI and TPDM, there could be
> >> numerous of them. From the node name, we can only get the type and
> >> register address of the component. We can't identify the HW or the
> >> system the component belongs to. Add label sysfs node support for
> >> showing the intuitive name of the device.
> >>
> >> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> >> ---
> >>   .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
> >>   .../sysfs-bus-coresight-devices-funnel        |  6 ++++
> >>   .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
> >>   drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
> >>   4 files changed, 50 insertions(+)
> >
> > Do you think we need to name the devices using the label ? Or is this
> > enough ?
> >
> > Suzuki
> Hi Suzuki,
>
> In my opinion, we should use label as the device name.
>
> It will be easier to identify the component with the folder name in
> /sys/bus/coresight/devices/
>
>

Please see the my comments from v4 of this patchset that explains why
this should not be done- re uniqueness and allowing scripting to
work:-

https://lists.linaro.org/archives/list/coresight@lists.linaro.org/message/Y65RKVUJUQGNARMWCOLSD636K7LROLYA/

Mike


> Thanks
> Jinlong Mao
>
> >
> >
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> index bf2869c413e7..909670e0451a 100644
> >> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> >> @@ -239,3 +239,9 @@ Date:        March 2020
> >>   KernelVersion    5.7
> >>   Contact:    Mike Leach or Mathieu Poirier
> >>   Description:    (Write) Clear all channel / trigger programming.
> >> +
> >> +What:           /sys/bus/coresight/devices/<cti-name>/label
> >> +Date:           Dec 2024
> >> +KernelVersion   6.14
> >> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> >> +Description:    (Read) Show hardware context information of device.
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-
> >> funnel b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> >> index d75acda5e1b3..944aad879aeb 100644
> >> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> >> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-funnel
> >> @@ -10,3 +10,9 @@ Date:        November 2014
> >>   KernelVersion:    3.19
> >>   Contact:    Mathieu Poirier <mathieu.poirier@linaro.org>
> >>   Description:    (RW) Defines input port priority order.
> >> +
> >> +What:           /sys/bus/coresight/devices/<memory_map>.funnel/label
> >> +Date:           Dec 2024
> >> +KernelVersion   6.14
> >> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> >> +Description:    (Read) Show hardware context information of device.
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-
> >> tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> >> index bf710ea6e0ef..309802246398 100644
> >> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> >> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> >> @@ -257,3 +257,9 @@ Contact:    Jinlong Mao (QUIC)
> >> <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_t
> >>   Description:
> >>           (RW) Set/Get the MSR(mux select register) for the CMB subunit
> >>           TPDM.
> >> +
> >> +What:           /sys/bus/coresight/devices/<tpdm-name>/label
> >> +Date:           Dec 2024
> >> +KernelVersion   6.14
> >> +Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
> >> +Description:    (Read) Show hardware context information of device.
> >> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/
> >> hwtracing/coresight/coresight-sysfs.c
> >> index a01c9e54e2ed..4af40cd7d75a 100644
> >> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> >> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> >> @@ -7,6 +7,7 @@
> >>   #include <linux/device.h>
> >>   #include <linux/idr.h>
> >>   #include <linux/kernel.h>
> >> +#include <linux/property.h>
> >>   #include "coresight-priv.h"
> >>   #include "coresight-trace-id.h"
> >> @@ -366,18 +367,47 @@ static ssize_t enable_source_store(struct device
> >> *dev,
> >>   }
> >>   static DEVICE_ATTR_RW(enable_source);
> >> +static ssize_t label_show(struct device *dev,
> >> +        struct device_attribute *attr, char *buf)
> >> +{
> >> +
> >> +    const char *str;
> >> +    int ret = 0;
> >> +
> >> +    ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> >> +    if (ret == 0)
> >> +        return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> >> +    else
> >> +        return ret;
> >> +}
> >> +static DEVICE_ATTR_RO(label);
> >> +
> >>   static struct attribute *coresight_sink_attrs[] = {
> >>       &dev_attr_enable_sink.attr,
> >> +    &dev_attr_label.attr,
> >>       NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(coresight_sink);
> >>   static struct attribute *coresight_source_attrs[] = {
> >>       &dev_attr_enable_source.attr,
> >> +    &dev_attr_label.attr,
> >>       NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(coresight_source);
> >> +static struct attribute *coresight_link_attrs[] = {
> >> +    &dev_attr_label.attr,
> >> +    NULL,
> >> +};
> >> +ATTRIBUTE_GROUPS(coresight_link);
> >> +
> >> +static struct attribute *coresight_helper_attrs[] = {
> >> +    &dev_attr_label.attr,
> >> +    NULL,
> >> +};
> >> +ATTRIBUTE_GROUPS(coresight_helper);
> >> +
> >>   const struct device_type coresight_dev_type[] = {
> >>       [CORESIGHT_DEV_TYPE_SINK] = {
> >>           .name = "sink",
> >> @@ -385,6 +415,7 @@ const struct device_type coresight_dev_type[] = {
> >>       },
> >>       [CORESIGHT_DEV_TYPE_LINK] = {
> >>           .name = "link",
> >> +        .groups = coresight_link_groups,
> >>       },
> >>       [CORESIGHT_DEV_TYPE_LINKSINK] = {
> >>           .name = "linksink",
> >> @@ -396,6 +427,7 @@ const struct device_type coresight_dev_type[] = {
> >>       },
> >>       [CORESIGHT_DEV_TYPE_HELPER] = {
> >>           .name = "helper",
> >> +        .groups = coresight_helper_groups,
> >>       }
> >>   };
> >>   /* Ensure the enum matches the names and groups */
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

