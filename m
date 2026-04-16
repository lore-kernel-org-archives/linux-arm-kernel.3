Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399C2F8D761
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdIaDR8TFqJVx6JmWp9cch/8JaroEjZWgR4/ZRvb+m4=; b=P9HEcAtgK4SczzfeRv60t/nE/X
	YVWv7nQRAKS0twcDHN7mFTyrHSiL0/HBgZOASDTUpuSg1SyRysWSRGz78BH0+8TwtiU1N9npw/h2T
	X52sWh5KWVfFMDVbaGiLie/xHSk33uWoMP8sxgHptd3w2AWKSRAPHZXK3k1wxfFJI9OQNJIW4/5pT
	Tk17bkjIeepO6u7owtNeHiHr/+aAJAE7Ll1mab7E5EFW3zXP+HneYtJ6IViPER9+riYiD+PS+kIyA
	XcCQoHldNj/yXglIkbo0PpdISAJKCYlNH7ZKYbxFgQnJqwWVutFAzWfo09bqzoZF7mzi0yP82BswV
	Rr2udDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQ0O-00000002ghk-0URg;
	Thu, 16 Apr 2026 16:55:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQ0L-00000002ghK-0obI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 16:55:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4434724C0;
	Thu, 16 Apr 2026 09:55:38 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 794013F7D8;
	Thu, 16 Apr 2026 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776358543; bh=/hViHlF5ifQBVvKwNQRn66elzsDuXATBenpBXrMug7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpYSzGdWtiIGuSx503F6Zo22Vb9nAWEtPUGJjRP/JYajnWV6jp/UPXgpctrxCkO86
	 XZtTL5G8T/f0JWC0Rj+3IScB8AEJSxXorlPxC+W5SoFYYc91jVCXNwNEBGoFz146UH
	 AFbdDHoK83Ii3VH8OwQv+HSKA+sRKQLCfhOWx0Xo=
Date: Thu, 16 Apr 2026 17:55:41 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
Message-ID: <20260416165541.GN356832@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-7-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415165528.3369607-7-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_095549_294722_2598C0F6 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Apr 15, 2026 at 05:55:22PM +0100, Yeoreum Yun wrote:
> If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
> the trace ID may be leaked because it is not released.
> 
> To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
> fails in cscfg_csdev_enable_active_config().
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index f55338a4989d..b199aebbdb60 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -920,8 +920,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
>  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
>  	if (cfg_hash) {
>  		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -		if (ret)
> +		if (ret) {
> +			etm4_release_trace_id(drvdata);
>  			return ret;
> +		}

LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

Just recording a bit thoughts.  As Suzuki mentioned, it would be better
to allocate trace IDs within a session.  We might consider maintaining
the trace ID map in the sink driver data, since the sink driver is
unique within a session so it is a central place to allocate trace ID.

We should use paired way for allocation and release. For example:

  coresight_enable_sysfs()
  {
      ...
      coresight_path_assign_trace_id(path);

  failed:
      coresight_path_unassign_trace_id(path);
  }

  coresight_disable_sysfs()
  {
      coresight_path_unassign_trace_id(path);
  }

But this requires broader refactoring.  E.g., the STM driver currently
allocates system trace IDs statically during probe, we might need to
consolidate for all modules to use dynamic allocation.

Thanks,
Leo

