Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EE1CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv2yW5Ut+dRvq5ypcIv2TWrPDgRz9lOXs4Gg0oXkRqk=; b=HR7KFvVmCF1KAqJNhlk3O0wRFs
	1J+BATjSwvmUHiZ0SxmDNEY6Wj/z8tXWYIRimj/d70nP0BE8QrscxPfRbo6DPw3WQ6Mt0GcwfYFY1
	ZP3N0/h2qYALr8me0Fqja5qCwSoHcQs/oIKJ1MiDmiIrWjrE07sxuOgGLEIfe96ARdYKHt6JsiCNU
	AHM3A1qqR9WkDSnmP4lxx9HXJUQfLO1DsPeJ5zEICH4U5ky5f3ArVs+4apYFiarcBT0hey1pVWuqH
	uFb8C1BZlyDNmq/0TC7VcEn4CoA1IqAdIlpF0nShlA728E9C1qgbCR4enRQmLVlVOuv867ug2nvzP
	w61euCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ii6-0000000ATLN-0tj4;
	Thu, 02 Oct 2025 12:47:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ii4-0000000ATKj-0xcp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:47:01 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3304a57d842so980137a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759409219; x=1760014019; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv2yW5Ut+dRvq5ypcIv2TWrPDgRz9lOXs4Gg0oXkRqk=;
        b=xsGb7oeJMfHRH8KHopsDOxq1WEGd2i1A6+qSWvOyabBoQzJZOmOGeSgMc57IbbKZSC
         f/9amWnSoY8WOkVLk7CRq9v1BxWRHV3GDepb7sElZO1c+F5ZVNVzR8Fa3A+oQdKWXi5j
         qYImLcu+3iHk3lqtPnMcVM3PYbKlpniQJN93Wtv8NUWDfcrc7W3iey2wqqMtr1V3IP8g
         jIt00gee7RfUz4Q0P4BRJTFT9bcEYVnokXZho4OK5VRdcZN5fWVSBnxAcCxXkwqOjJZ4
         8MPySAX8WSMkbA/5apoYW6JYNot1yVhd34C/pIdP09sf/SwgpzVenIyLo2/NTpKo7nwd
         wr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409219; x=1760014019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv2yW5Ut+dRvq5ypcIv2TWrPDgRz9lOXs4Gg0oXkRqk=;
        b=TBweNVdjDKLLAI/K+H+OBL4dAeTJH5GhWaQ/vGZwuKTgmSnZu93zfmpxTXzy6iL2dX
         ST64bYKDysLSniBgRLEvBuvQXUWkjqQKZ4pgzXXtckjfhFeFUNC4tYhMvM4wzMouKJww
         j+81sOW2ZHHjkghZHbd9kxE/ZwQZpzSFZpJKbXk7rglzMW9+nf70nHfHNmGlpjUVb+hh
         tkBAd0Q8FXQwdUpxbSsykBuGDvvs8ekHEFeu8WAWefVsQTbMS6jKZ1nlJI6oXp8vr/0m
         JEn+y+R8xOBdlcsq4o/Yc2rukPKaduu/HqQkNgw+gaMdB2oNaLAKgxbSDewKkfx+9+I8
         M64w==
X-Forwarded-Encrypted: i=1; AJvYcCWbCq1xEtd2haTRfUZA2FBp/Mn36VcF+ogimY7RWM65HK1zRN/4mNU3IztKpRGEHM5qTwbDHkXpwVaa6FOiDC+k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ftKCzHOHLQmdRYpM2Yq9Xh7zlXipffAN2Xa6t5HHcBBz8WYK
	cFqCNiERNSX7QUABNfKhBl6/p97Izbk2xEsYEh6nK7QUrIQmMUR1zhvpwwGl8tjO0HlyhQh/wIx
	5IEbsp4prxNQURJM+jwLUVIaYhyWKk+zgD26IjDSYww==
X-Gm-Gg: ASbGncsib/F68RuSIV7WmRwEw0HSqLLUkn0/V5kTFjDZWfEIwV+53hT5tVxwtMqGr3Z
	nbi7QNNT5l81TmSWpchjFII1B3afyTPpPH97s6LDlIkn5IRv1WFRAgd4XQWcW0K81n2ULXC/kir
	zMMD2cWgoA9vObmP3OdNFoOoAO/Vy5GM9d5OYKmgTblNGAzGBtwHmYJGOs8qPM9JJdwZZAhafsG
	7SVwOGcfSvOw994DPVDEwsdCOfbZP7XRikm
X-Google-Smtp-Source: AGHT+IF/fMi7EbVLK/pq3OtGG7h2+0N0HRIoxTnVEjQQl74GhpbHqc7uPCa9FjL9fT4gWs7AOVllRhS5qkmGoXskJQo=
X-Received: by 2002:a17:90b:3ec2:b0:32e:5646:d448 with SMTP id
 98e67ed59e1d1-339a6f2eacdmr8885776a91.21.1759409219385; Thu, 02 Oct 2025
 05:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-13-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-13-ea49e91124ec@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 2 Oct 2025 13:46:47 +0100
X-Gm-Features: AS18NWAmNw92k7KyJdFEggLRL7y29D-hy_NArFY8x4yLCzex-qep7R16SVJvt2g
Message-ID: <CAJ9a7VhMe+ZgRjeorTBW0KngKkGbOfntY4J-NtZAMuEig+nNCg@mail.gmail.com>
Subject: Re: [PATCH v3 13/31] coresight: Set per CPU source pointer
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_054700_280364_5CBC4674 
X-CRM114-Status: GOOD (  19.70  )
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

On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
>
> Introduce coresight_set_percpu_source() for setting CPU source device. The
> sources are maintained in a per CPU structure 'csdev_source'.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index db325dff884d21cc8d93f32bfe3be5c0491ffc8d..25a530cde8938b366bbb144fdcc107271ebae276 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -34,6 +34,7 @@
>   */
>  DEFINE_MUTEX(coresight_mutex);
>  static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
> +static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
>
>  /**
>   * struct coresight_node - elements of a path, from source to sink
> @@ -79,6 +80,11 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>
> +static void coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
> +{
> +       per_cpu(csdev_source, cpu) = csdev;
> +}
> +
>  static struct coresight_device *coresight_get_source(struct coresight_path *path)
>  {
>         struct coresight_device *csdev;
> @@ -1393,6 +1399,10 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>                         goto out_unlock;
>                 }
>         }
> +
> +       if (coresight_is_percpu_source(csdev))
> +               coresight_set_percpu_source(csdev->cpu, csdev);
> +
>         /* Device is now registered */
>         registered = true;
>
> @@ -1424,6 +1434,8 @@ EXPORT_SYMBOL_GPL(coresight_register);
>
>  void coresight_unregister(struct coresight_device *csdev)
>  {
> +       if (coresight_is_percpu_source(csdev))
> +               coresight_set_percpu_source(csdev->cpu, NULL);
>         etm_perf_del_symlink_sink(csdev);
>         /* Remove references of that device in the topology */
>         if (cti_assoc_ops && cti_assoc_ops->remove)
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

