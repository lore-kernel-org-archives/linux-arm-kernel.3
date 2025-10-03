Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D4ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YkUunsZeStErDwlaVJ5vCG0q6Kupz5X97VVmYTs+q0=; b=pfcJhUJEjlWH1bkiBrhuKwPTEg
	vcMz72KDj7MRm1Usi/M11mo18mEgg+avf0ZVQD5BOubZGKcSXiJI2Vxb014XZ5pz5XKwIWnqe7b44
	+sf0rNRGpgzTqpoI2QpXKITxtkj6Zp86CXNGY9VTNPt04G3PwrVg1ZvSBhtbCmNYBOrN3DMS2zJtS
	V3o4XqeJ9OkeeQcLW7Qz+Wd/Aaw9A67ZidkAixfXwvovTf7NpPQJwBN4UHD9lpyKbhVQXpn7Om6d/
	yAy9NbRdLvBi0wHanH/MDW5WJEyXdVmez4VeUmzA8NjEvqLFYrC2Fc7QF7oiMdE9A8dhLzo5UEPVB
	qZrev/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ios-0000000Ckkk-0JWq;
	Fri, 03 Oct 2025 16:39:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4iop-0000000CkkO-2k6k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 16:39:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71CD424E9;
	Fri,  3 Oct 2025 09:39:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 096DE3F5A1;
	Fri,  3 Oct 2025 09:39:41 -0700 (PDT)
Date: Fri, 3 Oct 2025 17:39:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 24/31] coresight: Add per-CPU path pointer
Message-ID: <20251003163940.GB7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-24-ea49e91124ec@arm.com>
 <CAJ9a7VjxqwDmKKtBvTqgu=CxnYZkASydkX1C9-xT+1gB7DzLPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjxqwDmKKtBvTqgu=CxnYZkASydkX1C9-xT+1gB7DzLPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_093943_729062_C1B16ED9 
X-CRM114-Status: GOOD (  16.82  )
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

On Thu, Oct 02, 2025 at 03:22:17PM +0100, Mike Leach wrote:

[...]

> > +static DEFINE_PER_CPU(struct coresight_path *, csdev_cpu_path);
> 
> This replicates the per-cpu tracer_path variable in coresight-sysfs.c
> - seems there should be a way to combine them.
> This is also set / unset on enable / disable

Good question.

I considered this and piloted change, but I gave up. The main reason is
that coresight-sysfs.c not only maintains paths for CPU bound sources;
it also needs to retrieve the path pointer for uncore sources.
Consolidating all of this would make this series complex.

In next spin, I will try to export a helper, like
coresight_get_path(csdev), to retrieve path pointer for per-CPU source.

[...]

> > +int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> > +                         void *sink_data)
> > +{
> > +       int ret;
> > +       struct coresight_device *source;
> > +
> > +       ret = _coresight_enable_path(path, mode, sink_data);
> > +       if (ret)
> > +               return ret;
> > +
> > +       source = coresight_get_source(path);
> > +       if (coresight_is_percpu_source(source))
> > +               per_cpu(csdev_cpu_path, source->cpu) = path;
> 
> 
> why is this in a refactored function for enable() but not disable().
> Seems that the original coresight_enable_path() creates a 'source'
> variable, so just the two lines
> 
> if (coresight_is_percpu_source(source))
>               per_cpu(csdev_cpu_path, source->cpu) = path;

It would be (checking for only success case):

    if (!ret && coresight_is_percpu_source(source))
            per_cpu(csdev_cpu_path, source->cpu) = path;

> added to the original function acheives the same thing with less churn

Okay, will do.

Thanks,
Leo

