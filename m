Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98208F8D761
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5kZZSWorK2+il37Ds5C4+HqSwxhUI9AMJx+pw9+Vx8=; b=CLQrcO41OQmWA1HPykleIhmrll
	jxE58b6W6NZuZ+00+6PQ/RyehRwi/oaVzKg8afzwMR1zm5wwr9aHhsMAw4ZlphtlRKSCXAMne+qop
	Kvmyj05mkw5ytLOLOIXlfd4bjyucV475gJyyXBeggzXHuzJY8CoV6HKLJydS2VJWczZ1Ckw4fLs7D
	mIFCmNLfDYVKJnSqKPYJfcsf2Pl9+VlvVNdBWl5sTYKZbLJenM8sJ7NETZbx986oKAGGWglJLkRCU
	n1HD9al4p6NSvn254X7bMcWv9kSoz1EcoyxG0U//W66gVPZbLCDl1S9mufsNFzxQxupye/NUtfdmn
	m1t/WvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQB1-00000002hWc-0e3t;
	Thu, 16 Apr 2026 17:06:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQAy-00000002hWC-3uhd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 17:06:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9B8F1595;
	Thu, 16 Apr 2026 10:06:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 216963F7B4;
	Thu, 16 Apr 2026 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776359205; bh=OVIVQW1n1YOcsaC+g5g3s5sYNcQ0zELCPBG91eZ3tcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kb+opqh/hXrIthfZigkAdV6+zEx2TIjfvm8H6kvph757YZ6BYUvRPmhx/IuWayLb0
	 3E0/3iAOCvaPHPt9sLKEojEp1lfbZb4i5KAFBmnQ/Hsxz3+5nE5W9SlC0Hm6iqdFk8
	 BQNC63f+D7Hx6R3hqVMuhOtzc/VFk68nFr6EMsD0=
Date: Thu, 16 Apr 2026 18:06:41 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 06/12] coresight: etm4x: fix leaked trace id
Message-ID: <aeEXIfEA5NpqhGX1@e129823.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-7-yeoreum.yun@arm.com>
 <20260416165541.GN356832@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416165541.GN356832@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_100649_099314_B02AF12B 
X-CRM114-Status: GOOD (  26.20  )
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

Hi Leo,
> On Wed, Apr 15, 2026 at 05:55:22PM +0100, Yeoreum Yun wrote:
> > If etm4_enable_sysfs() fails in cscfg_csdev_enable_active_config(),
> > the trace ID may be leaked because it is not released.
> >
> > To address this, call etm4_release_trace_id() when etm4_enable_sysfs()
> > fails in cscfg_csdev_enable_active_config().
> >
> > Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index f55338a4989d..b199aebbdb60 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -920,8 +920,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> >  	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> >  	if (cfg_hash) {
> >  		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > -		if (ret)
> > +		if (ret) {
> > +			etm4_release_trace_id(drvdata);
> >  			return ret;
> > +		}
>
> LGTM:
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks.

>
> Just recording a bit thoughts.  As Suzuki mentioned, it would be better
> to allocate trace IDs within a session.  We might consider maintaining
> the trace ID map in the sink driver data, since the sink driver is
> unique within a session so it is a central place to allocate trace ID.
>
> We should use paired way for allocation and release. For example:
>
>   coresight_enable_sysfs()
>   {
>       ...
>       coresight_path_assign_trace_id(path);
>
>   failed:
>       coresight_path_unassign_trace_id(path);
>   }
>
>   coresight_disable_sysfs()
>   {
>       coresight_path_unassign_trace_id(path);
>   }
>
> But this requires broader refactoring.  E.g., the STM driver currently
> allocates system trace IDs statically during probe, we might need to
> consolidate for all modules to use dynamic allocation.

So IIUC, Do we want to "map" per "session" and save this map information
in the "sink" driver? or just use "global" map but locate it in sink
driver?

I totally agree for above suggestion -- unsigned trace id
in the coresight_XXX function -- (but we need to add another callback
for this) but I think we don't need to sustain map per session
and it seems enough to use current storage for trace_id not move to
sink driver.

Anyway It would be better to refactorying wiht another patchset...

Thanks.

--
Sincerely,
Yeoreum Yun

