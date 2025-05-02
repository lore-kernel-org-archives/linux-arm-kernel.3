Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07856C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b4dRyLITD3ZNldMLbxccuIX06eutvWB/4F2iRfnhyvI=; b=ehF64CJuCunxVM5eCJKBLb0irZ
	8+ujzwhf8g89H8Te60OgddQxTI52lgGTDCEKCLVvtMYRQ1sul+cODd5YBT/YAkFlskigNufHpd/D3
	eguhTQ49z04FfiYtOd0ga6JTFD1SG0uxoGzm8F1bHKTKRdq2XTse5IEv3958NOk5hAI9JIYjR5kaO
	DyuLDQC7xjUya8RglIIvYyOQMmZbPBtld69nRHpEUxExbtvq8lNEDFZ2Lrh6dClxLIbWgDNrc1ag+
	V2Eyz7uafL4MCvyMZCR+ZSG4YUlf3Sf1HDTW5eaAQ5G1Xi0Kz1oCSPe6V9hWFPNdVJEzpkOHOc9f6
	DbMdDguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAocH-00000001mut-2Tu8;
	Fri, 02 May 2025 11:31:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoIb-00000001k3n-2umu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 May 2025 11:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=b4dRyLITD3ZNldMLbxccuIX06eutvWB/4F2iRfnhyvI=; b=mt3SsahqTL+DzKSMkc8f5em5ZO
	WmMC2rEOQcSUH0KKhaFva6etVe0xttxEnXfdLxlT1rTxOkyYzu6b4gEWfo43Po27X+F7rnLwsEJY7
	r28jHOhHzZl3wbaILojx9MNPHp6bSDffYjZG5TkzZmOC578ZqEqndzs/L5jBeV7RJnt7PgTZkoMVf
	iGQ0H/aNLaITcNN79fzk3bDhHZ3tUYvmQa5gVs978GxSEeuxrDKifqeJhCXdUI4vUKx0zx0H8yGc6
	z/ssscGEh5FMLOb1+1Xtd2JvWglw91iC7T+zL3uwlqytxrCIAlidzgq3wA3x1LctLm53dRPDziZ3Z
	3D8sD8eQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAoIY-0000000Ens5-0EqH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 11:11:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E65E1688;
	Fri,  2 May 2025 04:11:07 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA2913F66E;
	Fri,  2 May 2025 04:11:13 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] coresight: replicator: Fix panic for clearing claim tag
Date: Fri,  2 May 2025 12:11:08 +0100
Message-Id: <20250502111108.2726217-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_121118_451059_B3A64BBD 
X-CRM114-Status: GOOD (  10.83  )
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

On platforms with a static replicator, a kernel panic occurs during boot:

  [    4.999406]  replicator_probe+0x1f8/0x360
  [    5.003455]  replicator_platform_probe+0x64/0xd8
  [    5.008115]  platform_probe+0x70/0xf0
  [    5.011812]  really_probe+0xc4/0x2a8
  [    5.015417]  __driver_probe_device+0x80/0x140
  [    5.019813]  driver_probe_device+0xe4/0x170
  [    5.024032]  __driver_attach+0x9c/0x1b0
  [    5.027900]  bus_for_each_dev+0x7c/0xe8
  [    5.031769]  driver_attach+0x2c/0x40
  [    5.035373]  bus_add_driver+0xec/0x218
  [    5.039154]  driver_register+0x68/0x138
  [    5.043023]  __platform_driver_register+0x2c/0x40
  [    5.047771]  coresight_init_driver+0x4c/0xe0
  [    5.052079]  replicator_init+0x30/0x48
  [    5.055865]  do_one_initcall+0x4c/0x280
  [    5.059736]  kernel_init_freeable+0x1ec/0x3c8
  [    5.064134]  kernel_init+0x28/0x1f0
  [    5.067655]  ret_from_fork+0x10/0x20

A static replicator doesn't have registers, so accessing the claim
register results in a NULL pointer deference.  Fixes the issue by
accessing the claim registers only after the I/O resource has been
successfully mapped.

Fixes: 6f4c6f70575f ("coresight: Clear self hosted claim tag on probe")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index f1d2f764e898..06efd2b01a0f 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -262,6 +262,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->base = base;
 		desc.groups = replicator_groups;
 		desc.access = CSDEV_ACCESS_IOMEM(base);
+		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	if (fwnode_property_present(dev_fwnode(dev),
@@ -284,7 +285,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	desc.pdata = dev->platform_data;
 	desc.dev = dev;
 
-	coresight_clear_self_claim_tag(&desc.access);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev)) {
 		ret = PTR_ERR(drvdata->csdev);
-- 
2.34.1


