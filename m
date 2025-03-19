Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241C2C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrSjhCJ6HHbsHOBTQK/mH+kyhCPLPygv6j3GE2pda8M=; b=IM3j3W4lTmZeEQlMRvBZG0XLgR
	T3MeQzg+atiew/oCR7yuqSkqZqhAYasW08qKNFtGwLRRJ+BNJP4tIfFKb2WtThP9ipDvk9VWnFbWT
	XcuWp+ol1Dg8oIl2ExxUR7vDnvcZAYxVP/5OS4HBD39pksuYQukLlLuzrTvRe2TG0IaW40JJETHJu
	wlMAlrdffqjV12QmLBA1+MpE/qikWxDoBp58j3hZI0Y5G+OV1GbL9CWWetkVR2CrSlTsw5vFamfit
	ULfzgr3/6dx/tvalqSr59LgbDMnCLaRrhR6yP/ch+ZQebJ4skY7xiQ3jNOiNU6qtmJ2lbFQYPHz7x
	gF4vzbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqzQ-00000008hyZ-01P8;
	Wed, 19 Mar 2025 10:49:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqwo-00000008hb9-4C2K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:46:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8156C12FC;
	Wed, 19 Mar 2025 03:47:02 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9061B3F694;
	Wed, 19 Mar 2025 03:46:52 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:46:49 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Miaoqian Lin <linmq006@gmail.com>, Gavin Shan <gshan@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: psci: Fix refcount leak in psci_dt_init
Message-ID: <Z9qgmTbeLh0cCULw@bogus>
References: <20250318151712.28763-1-linmq006@gmail.com>
 <28cb8360-7fb0-46f0-b05f-5114f1974cf3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28cb8360-7fb0-46f0-b05f-5114f1974cf3@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_034655_129935_5AD53C15 
X-CRM114-Status: GOOD (  21.98  )
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

On Wed, Mar 19, 2025 at 08:28:38PM +1000, Gavin Shan wrote:
> Hi Miaoqian,
> 
> On 3/19/25 1:17 AM, Miaoqian Lin wrote:
> > Fix a reference counter leak in psci_dt_init() where of_node_put(np) was
> > missing after of_find_matching_node_and_match() when np is unavailable.
> > 
> > Fixes: bff60792f994 ("arm64: psci: factor invocation code to drivers")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> >   drivers/firmware/psci/psci.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> 
> I'm wandering if the fix tag is correct enough because !of_device_is_available(np)
> wasn't added by bff60792f994.
> 
> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > index a1ebbe9b73b1..38ca190d4a22 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -804,8 +804,10 @@ int __init psci_dt_init(void)
> >   	np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
> > -	if (!np || !of_device_is_available(np))
> > +	if (!np || !of_device_is_available(np)) {
> > +		of_node_put(np);
> >   		return -ENODEV;
> > +	}
> 
> The fix looks good to me. The duplicated of_node_put() can be avoided with
> a 'out' tag added, something like below.
> 
> 	if (!np || !of_device_is_available(np)) {
> 		ret = -ENODEV;
> 		goto out;
> 	}
> 
> 	:
> 
> out:
> 	of_node_put(np);
> 	return ret;
> 
> >   	init_fn = (psci_initcall_t)matched_np->data;
> >   	ret = init_fn(np);
> 

Any reason why we can't move to the new scoped usage like below?

-- 
Regards,
Sudeep

-->8

diff --git i/drivers/firmware/psci/psci.c w/drivers/firmware/psci/psci.c
index a1ebbe9b73b1..a4269078b2a2 100644
--- i/drivers/firmware/psci/psci.c
+++ w/drivers/firmware/psci/psci.c
@@ -797,12 +797,11 @@ static const struct of_device_id psci_of_match[] __initconst = {

 int __init psci_dt_init(void)
 {
-       struct device_node *np;
        const struct of_device_id *matched_np;
        psci_initcall_t init_fn;
        int ret;
-
-       np = of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);
+       struct device_node *np __free(device_node) =
+               of_find_matching_node_and_match(NULL, psci_of_match, &matched_np);

        if (!np || !of_device_is_available(np))
                return -ENODEV;
@@ -810,7 +809,6 @@ int __init psci_dt_init(void)
        init_fn = (psci_initcall_t)matched_np->data;
        ret = init_fn(np);

-       of_node_put(np);
        return ret;
 }


