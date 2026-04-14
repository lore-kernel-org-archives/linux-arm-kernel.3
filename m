Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B4F9D0E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gy9EJ4yDrBvcghRHqbFcA8UM610tTKTLHWJMXO1gIdM=; b=RvpJGb4eQTLXuwMtJq/ETViP7W
	W1vuZde7Zk8W3FHg7NzOPoSeCio72VczIwEhw72nFgm1+PlELqtKT8rsla1GnGFb3aL2gZAqXoxVX
	lB1cg080z71zqyaQunJHXnr9ZChe+UqWjHnFrqudXi4pTft3vku8JVvd7OZrTcPHoMDh98kQqITy5
	coPrP/Cjudj3MhH5t9fy7gR1ZadfT5crt98LN8zq9iBQpYAIZOYXyC5D8zFMoxnGVeisGKGwGY9hH
	ET+TdxgcHzdb5eDfa45uK1ISReW+zZB9AYBHIGpBuvLZQjoLURd9ekN4E4bpHg1c5uR6Nk9GfnZ6C
	FjjAAJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgyD-000000002Ih-0CKV;
	Tue, 14 Apr 2026 16:50:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgyA-000000002Ho-2a92
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 16:50:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70FD4519;
	Tue, 14 Apr 2026 09:50:27 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24F03F641;
	Tue, 14 Apr 2026 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776185433; bh=I0IRdQWChhwRN6t2vsCKAaqrPRW/S9ofOt/f00Ppi+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSg60PCo+IhSK7QVHCR5b+Bd0TWonb6s/g5qmtXEN1hv9Wy2Vu9fdzNnLxPUhDm/Y
	 wqcBaveiz4zGdDc9Kb5iIxBbKveKPouA6we7TkZbeLxmrae332y/J6SpEkddHRPbT6
	 0svmouJRuFBC1gcsPTAshcydvqju9Ut5ZZuLMcRY=
Date: Tue, 14 Apr 2026 17:50:29 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
Message-ID: <ad5wVVnUw1jnkCdn@e129823.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
 <20260414163221.GG356832@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414163221.GG356832@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_095034_696772_E5B33190 
X-CRM114-Status: GOOD (  22.80  )
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

> On Mon, Apr 13, 2026 at 03:19:56PM +0100, Yeoreum Yun wrote:
> > If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
> > the trace ID may be leaked because it is not released.
> >
> > To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
> > fails in cscfg_csdev_enable_active_config().
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 8ebfd3924143..1bc9f13e33f7 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -918,8 +918,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> >  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> >  	if (cfg_hash) {
> >  		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > -		if (ret)
> > +		if (ret) {
> > +			etm4_release_trace_id(drvdata);
>
> I am not familiar with the trace ID, seems to me, it just allocate a ID
> for each tracer from the ID map and then always use this cached ID for
> the tracers.
>
> If so, even an ID is reserved for failures, and the ID map is big enough
> for each CPU, we don't need to worry memory leak or ID used out issue ?
>

Agree. Practically, this is not a big issue and I don't think
because of this new id couldn't be allocated in 128
although the one id is occupied by cpu while source is disabled.

However, in theory, this could lead to an ID leak,
so it would be better to release it in error cases.

[...]

--
Sincerely,
Yeoreum Yun

