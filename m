Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B82FA0C47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hez18+9F9sbgoWSs9e3WIysoA6Um+rEZ1mQckBazkQU=; b=w88wgFQJGhq22DK002gn8qXFCc
	DvzPzqCKdlApSguFH2krC5khF9H5j6d5Ds6mAFLVLfo5vZMNqB57fJZQiDTVw0ZexCDZQE6Z9NkZr
	CL0VwfuzKrW6tE8MEeCWc8+Ofy2cEd9WWJZKZQEf/Kx4WHEXgMD1AYiOhcmLQabWzQbsLYHsK3ty9
	9XioFg9hIrn48x9q0ELkFu2iYCnk6YI+xQDnvgu2idJgKLyQ1r7g3ai9U/i8BUi2yB+8UxsvMNMFS
	d9m1LaGM8QNleoF+9DWaZwUn5pkJIrjETamoW5OLJR+cisQ8pTI/F2TkevkXNlQMln2HtUz7rVk37
	ZNJnVTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvBY-00000000lRv-2gjb;
	Wed, 15 Apr 2026 08:01:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvBW-00000000lRB-141Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:01:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 711CE4FAA;
	Wed, 15 Apr 2026 01:01:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7213F641;
	Wed, 15 Apr 2026 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776240074; bh=bNtpmVdUY7eXlqDgRXn771eFIU2Y0JM4GpZ5sO/yJhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRpE9OItpeLeSnnq4zXep6wsvnxel7JhFtQ//Ye4qwq1pwNUa8NAGVXCBsMdV309d
	 Ez/dM5OHBIJv6VGGs3b+OqOVs4cJTqsSRp8W8IqKNPamfoct8O6GBgT7zbvMvSRfcC
	 GhVedSn3qlVoALxhwtqntBwkxkIMcyoK+e+iXleI=
Date: Wed, 15 Apr 2026 09:01:09 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
Message-ID: <ad9FxS86FTqxu00d@e129823.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
 <20260414163221.GG356832@e132581.arm.com>
 <ad5wVVnUw1jnkCdn@e129823.arm.com>
 <81fdef8a-a60e-4d29-948d-c4a07e23dad9@oss.qualcomm.com>
 <20260415072933.GH356832@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415072933.GH356832@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_010118_351001_8DB6D0DA 
X-CRM114-Status: GOOD (  22.52  )
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
> On Wed, Apr 15, 2026 at 09:21:21AM +0800, Jie Gan wrote:
>
> [...]
>
> > > > > @@ -918,8 +918,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> > > > >   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > > > >   	if (cfg_hash) {
> > > > >   		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > > > > -		if (ret)
> > > > > +		if (ret) {
> > > > > +			etm4_release_trace_id(drvdata);
> > > >
> > > > If so, even an ID is reserved for failures, and the ID map is big enough
> > > > for each CPU, we don't need to worry memory leak or ID used out issue ?
> > >
> > > However, in theory, this could lead to an ID leak,
> > > so it would be better to release it in error cases.
> >
> > What I am thinking is as SoCs continue to grow more complex with an
> > increasing number of subsystems, trace IDs may be exhausted in the near
> > future. (that's why we have dynamic trace ID allocation/release).
>
> Thanks for the input.
>
> I am wandering if we can use "dev->devt" as the trace ID.  A device's
> major/minor number is unique in kernel and dev_t is defined as u32:
>
>   typedef u32 __kernel_dev_t;
>
> And we can consolidate this for both SYSFS and PERF modes.
>

When I see the CORESIGHT_TRACE_ID_MAX:

 /* architecturally we have 128 IDs some of which are reserved */
  #define CORESIGHT_TRACE_IDS_MAX 128

I think this came from the hardware restriction for number of TRACE_IDs.
In this case, clamping the device_id to trace_id seems more complex and
reduce some performance perspective.


--
Sincerely,
Yeoreum Yun

