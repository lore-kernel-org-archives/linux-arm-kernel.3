Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013CAC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfaT2WGBuF061yHSG9c1TIbt6nQOkqvYePlAs9M5CcM=; b=LkkyysBfLoGpKb1EqKftYCoipi
	fiWT55RSyeMhcXBxL9FEr6jnh/PUWxU6SEHlHTATonUIJwyVXEio4X4pzVjAV1lyFEY5nwVfpIpHB
	Wq1LSMVyFA2/4P9QGrxQG5AdX0lz+F6EVTmfZW1z9k38GaiP9+Ma+F96ZLg7JmcoibHzM7IJR6LKJ
	DMhSC4k2PN1LeslGikH2DBneN3hcv+wV6erxU4VK/gKjkUfLZ2quMuy+mOC0BlT1Rji9M3vgpnI24
	FGPE1JNgAsL+eIWYwfxq6MglSuTV8XKsDiQaLrEzm+OhtgWGpNRrq6bLoiAfkgAZBh8jjQEBKnzQQ
	hIYzkKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turti-00000008sWO-20Br;
	Wed, 19 Mar 2025 11:47:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turlg-00000008rAD-1dvH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:39:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CC4E113E;
	Wed, 19 Mar 2025 04:39:35 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8329F3F673;
	Wed, 19 Mar 2025 04:39:25 -0700 (PDT)
Date: Wed, 19 Mar 2025 11:39:22 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Miaoqian Lin <linmq006@gmail.com>, Gavin Shan <gshan@redhat.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: psci: Fix refcount leak in psci_dt_init
Message-ID: <Z9qs6r_eaQ0qLx9B@bogus>
References: <20250318151712.28763-1-linmq006@gmail.com>
 <28cb8360-7fb0-46f0-b05f-5114f1974cf3@redhat.com>
 <Z9qgmTbeLh0cCULw@bogus>
 <Z9qmglbXw0xILaet@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9qmglbXw0xILaet@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_043928_475763_5125AAA8 
X-CRM114-Status: GOOD (  15.16  )
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

On Wed, Mar 19, 2025 at 11:12:02AM +0000, Mark Rutland wrote:
> On Wed, Mar 19, 2025 at 10:46:49AM +0000, Sudeep Holla wrote:
> > On Wed, Mar 19, 2025 at 08:28:38PM +1000, Gavin Shan wrote:
> 
> > Any reason why we can't move to the new scoped usage like below?
> 
> > diff --git i/drivers/firmware/psci/psci.c w/drivers/firmware/psci/psci.c
> > index a1ebbe9b73b1..a4269078b2a2 100644
> > --- i/drivers/firmware/psci/psci.c
> > +++ w/drivers/firmware/psci/psci.c
> > @@ -797,12 +797,11 @@ static const struct of_device_id psci_of_match[] __initconst = {
> > 
> >  int __init psci_dt_init(void)
> >  {
> > -       struct device_node *np;
> >         const struct of_device_id *matched_np;
> >         psci_initcall_t init_fn;
> >         int ret;
> > -
> > -       np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
> > +       struct device_node *np __free(device_node) =
> > +               of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
> > 
> >         if (!np || !of_device_is_available(np))
> >                 return -ENODEV;
> > @@ -810,7 +809,6 @@ int __init psci_dt_init(void)
> >         init_fn = (psci_initcall_t)matched_np->data;
> >         ret = init_fn(np);
> > 
> > -       of_node_put(np);
> >         return ret;
> >  }
> 
> IIUC the bug has existed since before the scoped helpers were
> introduced, so for the sake of keeping the backport simple I reckon we
> should take Miaoqian Lin's patch as-is, and we can consider moving to
> the scoped helpers as a later cleanup.
> 

Agreed.

-- 
Regards,
Sudeep

