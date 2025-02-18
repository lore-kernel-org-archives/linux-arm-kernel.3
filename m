Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C90C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NAxMiATQ8LZrAb8v9xhHjtPlZqc6/HzlLdhP76SDgU=; b=xJpMt83j4oQzmQdwzvVJLG22fe
	GqbbR8YTiNI/lLRru+G1OcXMVlR6y4VDQmrrXGQr9wt4iSoSDM9262/OlZRakHVJNVt0B74IotI6d
	N1yQQDAape/4+QTPUjHxk1bJmAd6Edq9Iy+s4H1H/tRbzAmJ+8ZyAo1RVc96yXuTmWHwtMH0YUv0b
	y4ynUKWz//Toa+2dtYXEN2UFxOXic3CyUJAsk7ji6rMTDFrdKyfRwkzZoktHKDxxwixuv1EnxDIKw
	cG6nXFu4TId3YBNSXx5f6GjYSCp3hvVxY4e8JaokZKv5LwIWdnwVz4HotnskEd6z/PboFE3ri3tUC
	8ogfsq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL12-00000007nxy-2LXx;
	Tue, 18 Feb 2025 10:39:48 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKwx-00000007myO-0FMp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739874931; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=5NAxMiATQ8LZrAb8v9xhHjtPlZqc6/HzlLdhP76SDgU=;
	b=IctaxFc7U28wlFifSGELnvwMI/YkbppROenPu6Sq4NhSZgX6INFCkykbAXM0Uj4Bh+mJwzplGRWuIhNPY7DpyUkGC/mDF6C9iejCobBoApZXwSnOzlvtA1f/XSpYPsxCnMOF66sn9KvsPjuP2CHNKro7x4MAsqwe0VU2kU+Lv2M=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WPldaSl_1739874930 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 18:35:30 +0800
Date: Tue, 18 Feb 2025 18:35:29 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jie.li.linux@linux.alibaba.com
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
Message-ID: <cji4nqc6etzggg7hannvdg5jos4dr4mhujetviuhs3sl36bh6g@xde5izlywsei>
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
 <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_023535_631572_24BF9FC3 
X-CRM114-Status: GOOD (  23.53  )
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

On Tue, Feb 18, 2025 at 10:31:42AM +0800, Robin Murphy wrote:
> On 2025-02-18 1:21 am, Yin Fengwei wrote:
> > Currently, arm-cmn PMU driver assumes ACPI claim resource
> > for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
> > failed because of resource claim failes when ioremap() is
> > called:
> > [   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
> > [   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
> > [   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
> > [   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16
> > 
> > Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
> > work in ACPI env.
> 
> No, the CMN-600 routine is a special case for CMN-600 having two nested
> memory resources of its own. CMN-700 and everything else only have one
> memory resource, so that is not appropriate. What else is claiming the
> region to cause a conflict?
You are right. I just saw the discussion after I sent this patch. :(.
I proposed new fix in that thread which align with the spec.

Could you please take a look? Thanks.


Regards
Yin, Fengwei

> 
> Thanks,
> Robin.
> 
> > Signed-off-by: Yin Fengwei <fengwei_yin@linux.alibaba.com>
> > ---
> > I am also wondering whether we could just drop the CMN600 part id
> > check here if ACPI companion device claimed the resource?
> > 
> >   drivers/perf/arm-cmn.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> > index ef959e66db7c..8b5322a2aa6e 100644
> > --- a/drivers/perf/arm-cmn.c
> > +++ b/drivers/perf/arm-cmn.c
> > @@ -2559,7 +2559,8 @@ static int arm_cmn_probe(struct platform_device *pdev)
> >   	cmn->part = (unsigned long)device_get_match_data(cmn->dev);
> >   	platform_set_drvdata(pdev, cmn);
> > -	if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
> > +	if (((cmn->part == PART_CMN600) || (cmn->part == PART_CMN700)) &&
> > +			has_acpi_companion(cmn->dev)) {
> >   		rootnode = arm_cmn600_acpi_probe(pdev, cmn);
> >   	} else {
> >   		rootnode = 0;
> > @@ -2649,7 +2650,7 @@ MODULE_DEVICE_TABLE(of, arm_cmn_of_match);
> >   static const struct acpi_device_id arm_cmn_acpi_match[] = {
> >   	{ "ARMHC600", PART_CMN600 },
> >   	{ "ARMHC650" },
> > -	{ "ARMHC700" },
> > +	{ "ARMHC700", PART_CMN700 },
> >   	{}
> >   };
> >   MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);

