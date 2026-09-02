Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FFEC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShO4JYZJ+1aLNBZYNMX2bjCToGhnt4wrcMV90zcSc3Y=; b=EQ90V/8MjOxokA+v8PQOYz06qV
	Z7yilf6IwSc2Ga0ncR+VC+OzVDejVeh0YLRGLLIYBKTkRV1r7sXJ2hmxSH+bfjzj1Ebeff5Anq11r
	lrj7EfhpaaisW5llN3V9fp0C67p5GNxKDu97A8uNtx9wo+KxR7K2MToZomM5ajF8OA8F9E7uUiDuP
	7ORYuHwCqSO4P1K1vpSQC4mqefoaIItmRRz1U/1Jh2yFOXcIy1n3RiSCQDDtro9bQhajCbN8gGTf0
	F79ptENEHoH5ZiAYxtCmE7p7+9/9iB50+/Kq0u9Xt5Gpkqf2CYJRXSaOfCXffMGXy8CHHe1qtmgeX
	2wfvs4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gEa-0000000E4gK-1Ioy;
	Wed, 02 Sep 2026 08:22:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gEX-0000000E4fv-1tY2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:22:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC5AD1596;
	Wed,  2 Sep 2026 01:22:07 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 369533F882;
	Wed,  2 Sep 2026 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788337331; bh=9MiN3QzSmXdgia/8lob+j+XbhRoK1g+B5kT5g2UcUDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MY9adDtbW4ftsbCzeffHGw/chFqsRsH/bdfRl5u/oH4RUpqQZ+4hgrm/IiEBBZSrF
	 E5GQBPgqwpE6IuGYWaKOLl8D7bHtA0fdF5kh9Cv84JpdQa83ojInkvE086Dbyszcu5
	 DaI0XHjZ1URfBBPk69G6d0uB+/QYnRaIv5VrbBDQ=
Date: Wed, 2 Sep 2026 09:22:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Richard Cheng <icheng@nvidia.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
Message-ID: <20260902082209.GT8904@e132581.arm.com>
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_012213_634633_32FC0993 
X-CRM114-Status: GOOD (  17.56  )
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

Hi Jie,

On Mon, Aug 17, 2026 at 04:50:15PM +0800, Jie Gan wrote:

[...]

> @@ -953,8 +953,12 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
>  		/* Assign a trace ID to the path for the first device that wants to do it */
>  		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
>  
> -		/* 0 means the device has no ID assignment, so keep searching */
> -		if (trace_id == 0)
> +		/*
> +		 * 0 means the device has no ID assignment, and -EOPNOTSUPP
> +		 * means the device explicitly declines to assign one (e.g. a
> +		 * pass-through NoC) - in both cases keep searching downstream.
> +		 */
> +		if (trace_id == 0 || trace_id == -EOPNOTSUPP)
>  			continue;

Based on IS_VALID_CS_TRACE_ID(), I see 0 is for no ID assignment,
could you improve a bit tnoc.c instead?

If so, We don't need to add a new error for the same purpose.

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..bf221c1e5c48 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
        u32 val;

-       /* No valid ATID, simply enable the unit */
-       if (drvdata->atid == -EOPNOTSUPP) {
+       /* 0 means no ID assignment, simply enable the unit */
+       if (!drvdata->atid) {
                writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
                return;
        }
@@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
        int atid;

-       if (!dev_is_amba(drvdata->dev)) {
-               drvdata->atid = -EOPNOTSUPP;
+       if (!dev_is_amba(drvdata->dev))
                return 0;
-       }

        atid = coresight_trace_id_get_system_id();
        if (atid < 0)

