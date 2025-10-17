Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42982CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OQQRlKEU7VVm5HYBQTjT7ZZ8vVMImSl8I2PGd8GAARk=; b=o1h4XVM/QYgTiQTM75soldhc0K
	VtKamCKiIyRT3JABiJaZFejTNUjE2llOPmpLouAp0YhakaIcNQiC0Wb2aF3r8XA7UPp/SWEPPwtTN
	7GA/guupoh1F05S3rpyJ2M5pucnyvX0oEN2bumYvoOykSbeo29CDCsHXo4YLqTX3XSM97rTX4G88/
	cQbEdk4PAJ3C8CFPG6QqxcBKS0U0l5JuHgP/z7LB+znp+h+7dEdgLjO79HG8e/xrPfTwFOwG8jj/E
	blE0KCl8lhV8Q+IF7O+ajjkEIhSGwrHh7gillZ1/jU/0KlYxKOCWlRBSfhVdvgstmtjsFWrGqdwGD
	08hEmgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iFI-00000007cLH-3ule;
	Fri, 17 Oct 2025 11:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iFH-00000007cL4-3SIj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 11:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OQQRlKEU7VVm5HYBQTjT7ZZ8vVMImSl8I2PGd8GAARk=; b=dsLiTgqIYDRraQPPqotQB7I02K
	G5W1fuyDctTvzS460Ra5NFCKocLxDFqL3vGs6shO5gCyMvRGYBFuymjOHgH9Jh600UjoLfal4BqQ2
	9apVMn7lrbRgeCy1pkFdaHXaEc3Mq5LB70IhYhkgsY/Z4sVbcJcrGgz+Uqm5xQgz323yl2DDWWI4E
	pjlkMRZ5G9P4ycGazluRLerNruMkeIIgw0wLaT5BhMyXbvlkbkY9AMXvJy6xoh8Lb9TbtK7rtFNre
	MTdRNylz+Ijv4ROTKQEJhafkW4mt7sGy6tLrqGYeNMJuSdxNPxoxi+H3kk1zLGMSx5Qb2NaC+t6bJ
	ff9Bkr0w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iFC-00000007Vbo-0dsh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:03:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81CCF1595;
	Fri, 17 Oct 2025 04:03:21 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 68D8A3F66E;
	Fri, 17 Oct 2025 04:03:28 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] pmdomain: arm: scmi: Fix genpd leak on provider registration failure
Date: Fri, 17 Oct 2025 12:03:20 +0100
Message-Id: <20251017110320.1186555-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_120336_411150_93D7FF82 
X-CRM114-Status: GOOD (  11.44  )
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

If of_genpd_add_provider_onecell() fails during probe, the previously
created generic power domains are not removed, leading to a memory leak
and potential kernel crash later in genpd_debug_add().

Add proper error handling to unwind the initialized domains before
returning from probe to ensure all resources are correctly released on
failure.

Example crash trace observed without this fix:

  | Unable to handle kernel paging request at virtual address fffffffffffffc70
  | CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1 #405 PREEMPT
  | Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform
  | pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  | pc : genpd_debug_add+0x2c/0x160
  | lr : genpd_debug_init+0x74/0x98
  | Call trace:
  |  genpd_debug_add+0x2c/0x160 (P)
  |  genpd_debug_init+0x74/0x98
  |  do_one_initcall+0xd0/0x2d8
  |  do_initcall_level+0xa0/0x140
  |  do_initcalls+0x60/0xa8
  |  do_basic_setup+0x28/0x40
  |  kernel_init_freeable+0xe8/0x170
  |  kernel_init+0x2c/0x140
  |  ret_from_fork+0x10/0x20

Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 8fe1c0a501c9..b5e2ffd5ea64 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -41,7 +41,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
 
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
 {
-	int num_domains, i;
+	int num_domains, i, ret;
 	struct device *dev = &sdev->dev;
 	struct device_node *np = dev->of_node;
 	struct scmi_pm_domain *scmi_pd;
@@ -108,9 +108,18 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	scmi_pd_data->domains = domains;
 	scmi_pd_data->num_domains = num_domains;
 
+	ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
+	if (ret)
+		goto err_rm_genpds;
+
 	dev_set_drvdata(dev, scmi_pd_data);
 
-	return of_genpd_add_provider_onecell(np, scmi_pd_data);
+	return 0;
+err_rm_genpds:
+	for (i = num_domains - 1; i >= 0; i--)
+		pm_genpd_remove(domains[i]);
+
+	return ret;
 }
 
 static void scmi_pm_domain_remove(struct scmi_device *sdev)
-- 
2.34.1


