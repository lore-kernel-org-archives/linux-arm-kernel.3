Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DF7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmDZr8RzS+flLxV3A4zL7q/WNhMN3Hm30taNoOceehA=; b=jDZFkp2WjezyQaLmAAAnRHIhey
	y05066PbFPcX+wfpRtmitO90MSdTBNhwUTvX35c4clOwUMZfmiIo6fWqIr7v4qbcVjU+wrqkyxqPo
	ffQ78ccMyrtdBgW3Sq/nUGu66I7GtfJUgyL6vxQQq3dJBJk8adnCJ3u8fYNEFU8qQOudyz7RzlVdK
	afdI7h4+UBkESLSOu6ogCcvv+KeMJhiguFZr97WG5tBup4CGJDJN1wKwaFjvykvEVKh9md8M3m+LO
	G5KPirxBdeV4uH3eUQQeVsE/NZnCbEwGXFnyTuAM89xVVHvkQlzrLxIRD2bqkj5Do9gifdgEcpjoT
	dPOQmyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLKn-00000007r90-0xFG;
	Tue, 18 Feb 2025 11:00:13 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLJI-00000007qwk-3kkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739876316; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=pmDZr8RzS+flLxV3A4zL7q/WNhMN3Hm30taNoOceehA=;
	b=jgQtIp4xwWu0qU8lErXjeIxV9wS0//97X+SHQ5ty5usCJtfuoqNYt3ij8rluMndhYqJWtykaIvnWYOGoVKPScQQJE693dGwyrt0GaMZ6GcoEYLmwWbFlWQWJOuH76rkRuIlEB2xwCBPEtYXWkMeEwPMcfCdZw03VPcvcKV0Q0z8=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WPlh.8b_1739876313 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 18 Feb 2025 18:58:34 +0800
Date: Tue, 18 Feb 2025 18:58:32 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jie.li.linux@linux.alibaba.com
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
Message-ID: <hfip42i45jkumuvgdthxm2bk6qylqyqh6erzaq43yiqygvn6uu@dcui675lwtkm>
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
 <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_025841_466988_06A044F1 
X-CRM114-Status: GOOD (  12.69  )
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
Sorry. Forgot the link for the new proposed fix:
https://lore.kernel.org/all/Z7QYlUP6nfBNMXsv@U-V2QX163P-2032.local/

My understanding is that there are two problems here:
1. ACPI claim the memory range and that's why we see this -EBUSY error
   with correct code path for CMN700 + ACPI table.

2. It's not correct to apply CMN600 probe method to CMN700 because
   CMN600 has two nested memory resouces while CMN700 should only have
   one memory resource. And you don't want to introduce trick to handle
   incorect ACPI DSDT.

Regards
Yin, Fengwei

> 
> Thanks,
> Robin.

