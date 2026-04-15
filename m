Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0B0FA0C3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 07:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Dk3GisAOb/rF1zeEfEW8bvXiY1v2Ot9Iqe/g0nVt5c=; b=TC2AtkV3OgmZNDn3Wcq+3uIQwf
	a8n17OS65EM8pYusE4CtwSn5GE6GvZCdP+gVCot/+HpFe1GIFtAUbLNtHRgPeNS5MOf8nBdEpQONo
	dFsAaGxeaB4hxIKeWxXRJXM9uQO+UYqCn+yuK1EAgVPyv/Le865sK8wnJW6PyU6klqz/rkotks5rq
	OYAYeP6Qda6UZ0cAMrETosjMpjSSUZUysBMK++qFF2Y05wWamxkLRy0+7VRaxKkMWc7/3MSvVtifI
	FJZFiuFiS+EBid691zZAIn2tzDOOl+AhCylCTTRX3H0Ej4e8UiDNDwp8FB1xRe1OSTiIGoRCVwXAv
	pEi9IPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCugu-00000000jRq-3ZAQ;
	Wed, 15 Apr 2026 07:29:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCugs-00000000jRU-0tkW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 07:29:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE34049BF;
	Wed, 15 Apr 2026 00:29:29 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED9E33F641;
	Wed, 15 Apr 2026 00:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776238175; bh=/31K8foPrl7GUrN8NgKXk6NjRxdK25IVX3atfBtVP0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oshJfZRgOXDeIzS6DFBD9S9fhQ2SZ6ghoH+F46oxZHHYLJytvMcRVsNYRaCSXKtEe
	 BV5NPsEVsqGCtW7gwpDPCH4hot31UgVdnj7t+n/5JR95EAxFKPjODamGDxf48nKi3J
	 NZb2dckTU43ASUuDmFuvk2LZBGNuXqv/PJf+yi9g=
Date: Wed, 15 Apr 2026 08:29:33 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v4 3/9] coresight: etm4x: fix leaked trace id
Message-ID: <20260415072933.GH356832@e132581.arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
 <20260413142003.3549310-4-yeoreum.yun@arm.com>
 <20260414163221.GG356832@e132581.arm.com>
 <ad5wVVnUw1jnkCdn@e129823.arm.com>
 <81fdef8a-a60e-4d29-948d-c4a07e23dad9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81fdef8a-a60e-4d29-948d-c4a07e23dad9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_002938_371706_166BE3B8 
X-CRM114-Status: GOOD (  17.50  )
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

On Wed, Apr 15, 2026 at 09:21:21AM +0800, Jie Gan wrote:

[...]

> > > > @@ -918,8 +918,10 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
> > > >   	cscfg_config_sysfs_get_active_cfg(&cfg_hash, &preset);
> > > >   	if (cfg_hash) {
> > > >   		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> > > > -		if (ret)
> > > > +		if (ret) {
> > > > +			etm4_release_trace_id(drvdata);
> > > 
> > > If so, even an ID is reserved for failures, and the ID map is big enough
> > > for each CPU, we don't need to worry memory leak or ID used out issue ?
> > 
> > However, in theory, this could lead to an ID leak,
> > so it would be better to release it in error cases.
> 
> What I am thinking is as SoCs continue to grow more complex with an
> increasing number of subsystems, trace IDs may be exhausted in the near
> future. (that's why we have dynamic trace ID allocation/release).

Thanks for the input.

I am wandering if we can use "dev->devt" as the trace ID.  A device's
major/minor number is unique in kernel and dev_t is defined as u32:

  typedef u32 __kernel_dev_t;

And we can consolidate this for both SYSFS and PERF modes.

Thanks,
Leo

