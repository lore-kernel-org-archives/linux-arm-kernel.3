Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 01:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA89qf4ISGMYbsVhcaULCxJhr4eNuObggSJrT8RDrw8=; b=2ZfDy2+7FbJ0iF/UYaQVOOOiI8
	arLpMgUf2IWL9++mGOERbE2gJd2c31pgAdKfjZ81osAIpH3k19dqEBRJwjlLLsjdPqrBPzi/BF7G8
	AuGALWEzvVVWgdmrVqZOnJdsUGl5CHU83mpPluVS/jWs+Y9whV28WOVErQ60Gimr9tTZLmiDxbj6c
	as0g4Rsxwqni2B0JIMaGjoXEQzO9FuusARp42xo7+ub6Jt1KQs1xYyZIGnGTAzz1StEr1nyeFla2C
	oHMIcVClPINU421PGM1AG0dCYFndIKPe4FlcyEK0Iy6JHz2e8WGJhctQmHSdU5Kui6FgpVntMivA4
	m1S+Xfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZFo-0000000Aa5u-22HU;
	Wed, 19 Feb 2025 01:52:00 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkZEG-0000000AZtF-139o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 01:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739929818; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=YA89qf4ISGMYbsVhcaULCxJhr4eNuObggSJrT8RDrw8=;
	b=l7pkaMHhKkGUPM2vlaOcOpX6ncbP8mY0gROC0IuJjGR2PUS8PMgIDigqmSMbTrPy3zVsdKEPYQrAZmYpB7Gryrd4yb10ZLvVdssIPkpr5fd5Hmlc1U8Y29xKi2A/FU6XcKLOO7atR2oI7dVnrDvDGEBYeBwUFhH2ApOFwIpqloQ=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WPnKkM2_1739929817 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 19 Feb 2025 09:50:17 +0800
Date: Wed, 19 Feb 2025 09:50:15 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jie.li.linux@linux.alibaba.com, renyu.zj@linux.alibaba.com
Subject: Re: [PATCH] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI
Message-ID: <gfgtxwe3fmh4unleypyrp2qxchrqcz7wqzyoy7om2zjqev6ggf@gnnqnmusecc3>
References: <20250218012111.30068-1-fengwei_yin@linux.alibaba.com_quarantine>
 <d5040b5c-564d-4abf-be22-d2aa1183b633@arm.com>
 <hfip42i45jkumuvgdthxm2bk6qylqyqh6erzaq43yiqygvn6uu@dcui675lwtkm>
 <73af368a-52a9-4922-876b-7a6e2d32a94e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73af368a-52a9-4922-876b-7a6e2d32a94e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_175025_121916_35773AC2 
X-CRM114-Status: GOOD (  40.60  )
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

Add Jing Zhang as we will continue discussion in this thread.

On Tue, Feb 18, 2025 at 12:31:10PM +0800, Robin Murphy wrote:
> On 2025-02-18 10:58 am, YinFengwei wrote:
> > On Tue, Feb 18, 2025 at 10:31:42AM +0800, Robin Murphy wrote:
> > > On 2025-02-18 1:21 am, Yin Fengwei wrote:
> > > > Currently, arm-cmn PMU driver assumes ACPI claim resource
> > > > for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
> > > > failed because of resource claim failes when ioremap() is
> > > > called:
> > > > [   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
> > > > [   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
> > > > [   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
> > > > [   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16
> > > > 
> > > > Let CMN700 + ACPI do same as CMN600 + ACPI to allow CMN700
> > > > work in ACPI env.
> > > 
> > > No, the CMN-600 routine is a special case for CMN-600 having two nested
> > > memory resources of its own. CMN-700 and everything else only have one
> > > memory resource, so that is not appropriate. What else is claiming the
> > > region to cause a conflict?
> > Sorry. Forgot the link for the new proposed fix:
> > https://lore.kernel.org/all/Z7QYlUP6nfBNMXsv@U-V2QX163P-2032.local/
> 
> Yes, I saw that. It's a broken diff that won't even compile, with no
> explanation of what it's supposed to be trying to achieve or why. I'm not
> sure what you're asking me to comment on.
My bad. I will attatch the full patch at the end of this mail.

> 
> > My understanding is that there are two problems here:
> > 1. ACPI claim the memory range and that's why we see this -EBUSY error
> >     with correct code path for CMN700 + ACPI table.
> 
> No, it's fine to claim the exact *same* range that the ACPI companion owns;
> the identical requests just nest inside each other. I don't have a CMN-700
> to hand but here's a selection of other drivers doing just that from
> /proc/iomem on my system:
> 
> 12600000-12600fff : ARMH0011:00
>   12600000-12600fff : ARMH0011:00 ARMH0011:00
> 12610000-12610fff : ARMH0011:01
>   12610000-12610fff : ARMH0011:01 ARMH0011:01
> 126b0000-126b0fff : APMC0D0F:00
>   126b0000-126b0fff : APMC0D0F:00 APMC0D0F:00
> 126f0000-126f0fff : APMC0D81:00
>   126f0000-126f0fff : APMC0D81:00 APMC0D81:00
I believe this works only for parents/children resource node. Otherwise,
there will be conflict.

> 
> And I know people are using the CMN-700 PMU on other ACPI systems without
> issue, so there's nothing wrong with the binding or the driver in general.
> 
> The resource conflict only arises when a request overlaps an existing region
> inexactly. Either your firmware is describing the CMN incorrectly, or some
> other driver is claiming conflicting iomem regions for some reason.
No. It's not ACPI table problem. The problem is mentioned in comments of
function arm_cmn600_acpi_probe():
        /*
         * Note that devm_ioremap_resource() is dumb and won't let the platform
         * device claim cfg when the ACPI companion device has already claimed
         * root within it. But since they *are* already both claimed in the
         * appropriate name, we don't really need to do it again here anyway.
         */

So I suppose for ACPI env, we should use devm_ioremap() as cmn600 does.
And make CMN700 handling follow spec exactly.
> 
> Thanks,
> Robin.

Regards
Yin, Fengwei

Full patch here (base commit is: 2408a807bfc3f738850ef5ad5e3fd59d66168996):

From a542d42626ec1c92cbe546b3012b1a913df35360 Mon Sep 17 00:00:00 2001
From: Yin Fengwei <fengwei_yin@linux.alibaba.com>
Date: Mon, 17 Feb 2025 15:48:24 +0800
Subject: [PATCH 1/2] perf/arm-cmn: don't claim resource during ioremap() for
 CMN700 with ACPI

Currently, arm-cmn PMU driver assumes ACPI claim resource
for CMN600 + ACPI. But with CMN700 + ACPI, the device probe
failed because of resource claim failes when function
devm_platform_ioremap_resource(pdev, 0) is called:

[   10.837300] arm-cmn ARMHC700:00: error -EBUSY: can't request region for resource [mem 0x40000000-0x4fffffff]
[   10.847310] arm-cmn ARMHC700:00: probe with driver arm-cmn failed with error -16
[   10.854726] arm-cmn ARMHC700:02: error -EBUSY: can't request region for resource [mem 0x40040000000-0x4004fffffff]
[   10.865085] arm-cmn ARMHC700:02: probe with driver arm-cmn failed with error -16

Let all ACPI cases call devm_ioremap(cmn->dev, cfg) just
like current CMN600 does.

Signed-off-by: Yin Fengwei <fengwei_yin@linux.alibaba.com>
---
 drivers/perf/arm-cmn.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index ef959e66db7c..5993a46c5560 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2510,20 +2510,26 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	return 0;
 }
 
-static int arm_cmn600_acpi_probe(struct platform_device *pdev, struct arm_cmn *cmn)
+static int arm_acpi_probe(struct platform_device *pdev, struct arm_cmn *cmn)
 {
-	struct resource *cfg, *root;
+	struct resource *cfg, *root = NULL;
 
 	cfg = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!cfg)
 		return -EINVAL;
 
-	root = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!root)
-		return -EINVAL;
+	if (cmn->part == PART_CMN600) {
+		/* Per "ACPI for Arm Components" Table 16, CMN600 has
+		 * nested root node memory range.
+		 */
+		root = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		if (!root)
+			return -EINVAL;
+
+		if (!resource_contains(cfg, root))
+			swap(cfg, root);
+	}
 
-	if (!resource_contains(cfg, root))
-		swap(cfg, root);
 	/*
 	 * Note that devm_ioremap_resource() is dumb and won't let the platform
 	 * device claim cfg when the ACPI companion device has already claimed
@@ -2534,7 +2540,7 @@ static int arm_cmn600_acpi_probe(struct platform_device *pdev, struct arm_cmn *c
 	if (!cmn->base)
 		return -ENOMEM;
 
-	return root->start - cfg->start;
+	return root ? (root->start - cfg->start) : 0;
 }
 
 static int arm_cmn600_of_probe(struct device_node *np)
@@ -2559,9 +2565,9 @@ static int arm_cmn_probe(struct platform_device *pdev)
 	cmn->part = (unsigned long)device_get_match_data(cmn->dev);
 	platform_set_drvdata(pdev, cmn);
 
-	if (cmn->part == PART_CMN600 && has_acpi_companion(cmn->dev)) {
-		rootnode = arm_cmn600_acpi_probe(pdev, cmn);
-	} else {
+	if (has_acpi_companion(cmn->dev))
+		rootnode = arm_acpi_probe(pdev, cmn);
+	else {
 		rootnode = 0;
 		cmn->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(cmn->base))
-- 
2.43.5


