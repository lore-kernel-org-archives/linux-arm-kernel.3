Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126A2CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6qJnkbNyLzH+38jmsRO/6bT+lrdGBzJDU7SmU7vox8=; b=t88ibBfbmsRlpjnVSAbQHz2/ec
	FlKG87ZgINiP6SNBLKBW+v6pHZLBRvRLlor+GMggz46kPcox0JfF/K8qLaNdJAQMky7RY2pRPOzKb
	iJIjNsg3jsWYbi6XmuiKhbIK/AoGZ7+j0i9u7MUotCjxShqmIfLQuF0Lku5E8CK6u5NNCdO5+b0TB
	1Z4JaCkzfngXJnGANdFmhHhv6Kw9eWlY17GB1zWGCQgMS+JD77AnvB+flwmEp50oJaw9ZPhLdYESd
	NdgAFJQ5k3fxapGTuPCNkrGGyatyYeFTbyYZy/UpkdeYQrJfPMnjF4Cy2qA4bVXBH6bihZqjTIuwZ
	aFiuz0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KCW-0000000Ab0H-24mB;
	Thu, 02 Oct 2025 14:22:32 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KCU-0000000Aazr-0Gpm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:22:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-782023ca359so1194520b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759414949; x=1760019749; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6qJnkbNyLzH+38jmsRO/6bT+lrdGBzJDU7SmU7vox8=;
        b=wZcF72gfosRHUxXTpywLvepgBCOTtLn1hDHf9nZ2JN4GIwWT7V6Kgcpv65SZkKkN4A
         ulMgIKHvzNYRhYj2f4sKL872QL8ll8bkV9EwhP2gxmDT2fiGzezxIkdULqiFg/Bxk3Qy
         qUYQCdsmUT7wAOoQZJgqKup494eXfNugzPc2EVf5gf/2mxrO4URGu0CdXetV3y3+GwFW
         SEpmaTCkGwpj3IJ35PazZdA9DU7WQ/xm/0/GC7iwqtatng14w2ym8hDM0NoSHSWNzcmE
         yeJUHvVsHoRQVf2KGypPGLqwnickKid8ZIrFgQaQRk0WUnMyRvmi8XLkWPGBX6yrpTWi
         ebOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759414949; x=1760019749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6qJnkbNyLzH+38jmsRO/6bT+lrdGBzJDU7SmU7vox8=;
        b=GNphx46LQ1QE5jGci3k4ft9ASM3jdiAvaQW8IT4e61hcmtH7EzTZD+LDpoLVNWl2cF
         y8u7mgpuvMExywHMfN+jXuiVjFVowXIOZGRsfpn1U0e3ys56+M0LZVReVR8AfDRO6bTS
         2YERQDm6t7ejuyqgeLcxEtcJemt4yuLaegTrTSR1KJIwubDqI3iXblMEl9k4nPOn/iv4
         uv2h2E06D45Ly2QK01k2mDVT3gCcoaEunlWr3MksAo35fM75qIAZJpHd/3t6BqUqmFAj
         X508+VAR5RV8O/EgLWbUei9K2Ml4QYvhJKq2yRRq0Zv42WXC4p+jQYSVWxdllS+fanAk
         jgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjmKXwtwxRZDlCiuHXboDxeModOYE5gsxLVXkGNrtIQlJi+0i9MW/YzCiZZlRVGQW25PoWBGbvyxH9yXsdlJfr@lists.infradead.org
X-Gm-Message-State: AOJu0YyhOVghhe4JN3rwNdvo/k/yRqg7UbFJKO5BzwlBPIpEyiXK9lng
	eIEv6NkSSUrkiv8SelAEi4T98LKFWLqE/NIBYeWi0nMa4eSCQVbfv1O8SICsrZWMMvk2S20uoGi
	d5Qzl2LBuKRz/wKQq1h8C+RObA+6A8X5xmpmlA2qekg==
X-Gm-Gg: ASbGncvEhvpMk4wZgOa3mmcQ0azyYh9DPVpc18bg6pu/+puw1/yzEDbjGj18bpUoZF2
	qB9ipDq6aZG1hBEsWHddX442LpvUvxCoZvPfXMoTOCA5J74igBarZeWWkwbZzVT8QnuoRkY97OB
	0zH+yw4FdTAIJixsxIB49zLBmzVjsEga1DnVE3RzbV5fsqqcbX0KZ/KvW6T57C50yablmVIzdnx
	suf8qhRO4Qotk7JQ8gYoRRueIwLW4fwtzMN
X-Google-Smtp-Source: AGHT+IHcLCKyXTtX9Km6xXcBzCN367EpM+P7UXCyKng4cXdW272ufjM3KPwvzwTsGrB4S7Iv4+OH15ppn0aUl3+Lkmk=
X-Received: by 2002:a05:6a20:6a1d:b0:2e9:d6ce:e125 with SMTP id
 adf61e73a8af0-321d8452b3emr11154200637.5.1759414949144; Thu, 02 Oct 2025
 07:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-24-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-24-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 15:22:17 +0100
X-Gm-Features: AS18NWD-5cr9XrWDYonMr6BTAA2Bh--1XlTiSNRcgDeLDJ6oecWzBIsTAAAsKbc
Message-ID: <CAJ9a7VjxqwDmKKtBvTqgu=CxnYZkASydkX1C9-xT+1gB7DzLPQ@mail.gmail.com>
Subject: Re: [PATCH v3 24/31] coresight: Add per-CPU path pointer
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_072230_116873_F1A2AA5A 
X-CRM114-Status: GOOD (  34.30  )
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

Hi Leo

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Introduce per-CPU path pointers, save activated paths into the
> structure. This will be used by later changes for controlling the path
> during CPU idle.
>
> The path pointer is assigned before setting the source device mode to
> active, and it is cleared after the device is changed to an inactive
> mode. So safe access to path pointers is guaranteed when the device is
> in an active mode.
>
> The path enabling has been refactored: a new _coresight_enable_path()
> function is introduced to enable components in the path. The existing
> coresight_enable_path() function now calls this new helper and updates
> the per-CPU pointers accordingly.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 94803cacf1a374ae8a3b9513d7d029d5c77d5925..904123279ee70531787feea98e5f9fc502470f88 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -37,6 +37,27 @@ DEFINE_MUTEX(coresight_mutex);
>  static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
>  static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
>
> +/*
> + * Activated path pointer for a per-CPU source device. When enabling a path,
> + * the path pointer is first assigned, followed by a synchronous SMP call on
> + * the target CPU to transition the device mode from DISABLED to an enabled
> + * state. Conversely, during the disable flow, an SMP call on the target CPU
> + * transitions the device mode to DISABLED, after which the path pointer is
> + * cleared.
> + *
> + *  per_cpu(csdev_cpu_path, csdev->cpu) = path
> + *  coresight_take_mode(csdev, CS_MODE_SYSFS or CS_MODE_PERF)
> + *
> + *  // Safe to access per_cpu(csdev_cpu_path, cpu);
> + *
> + *  coresight_set_mode(csdev, CS_MODE_DISABLED)
> + *  per_cpu(csdev_cpu_path, csdev->cpu) = NULL
> + *
> + * As a result, the device mode is used to determine whether it is safe
> + * to access the path pointer.
> + */
> +static DEFINE_PER_CPU(struct coresight_path *, csdev_cpu_path);

This replicates the per-cpu tracer_path variable in coresight-sysfs.c
- seems there should be a way to combine them.
This is also set / unset on enable / disable

> +
>  /**
>   * struct coresight_node - elements of a path, from source to sink
>   * @csdev:     Address of an element.
> @@ -510,6 +531,12 @@ static void coresight_disable_path_from(struct coresight_path *path,
>
>  void coresight_disable_path(struct coresight_path *path)
>  {
> +       struct coresight_device *source;
> +
> +       source = coresight_get_source(path);
> +       if (coresight_is_percpu_source(source))
> +               per_cpu(csdev_cpu_path, source->cpu) = NULL;
> +
>         coresight_disable_path_from(path, NULL);
>  }
>  EXPORT_SYMBOL_GPL(coresight_disable_path);
> @@ -533,8 +560,8 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
>         return 0;
>  }
>
> -int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> -                         void *sink_data)
> +static int _coresight_enable_path(struct coresight_path *path,
> +                                 enum cs_mode mode, void *sink_data)
>  {
>         int ret = 0;
>         u32 type;
> @@ -601,6 +628,23 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>         goto out;
>  }
>
> +int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> +                         void *sink_data)
> +{
> +       int ret;
> +       struct coresight_device *source;
> +
> +       ret = _coresight_enable_path(path, mode, sink_data);
> +       if (ret)
> +               return ret;
> +
> +       source = coresight_get_source(path);
> +       if (coresight_is_percpu_source(source))
> +               per_cpu(csdev_cpu_path, source->cpu) = path;


why is this in a refactored function for enable() but not disable().
Seems that the original coresight_enable_path() creates a 'source'
variable, so just the two lines

if (coresight_is_percpu_source(source))
              per_cpu(csdev_cpu_path, source->cpu) = path;

added to the original function acheives the same thing with less churn

Regards

Mike


> +
> +       return 0;
> +}
> +
>  struct coresight_device *coresight_get_sink(struct coresight_path *path)
>  {
>         struct coresight_device *csdev;
>
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

