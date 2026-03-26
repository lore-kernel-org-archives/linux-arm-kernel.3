Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD937109E52B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UhCjsi5+ofLBuGUIP+SSxmAzaNLxCqzxK3xs/vwAG+M=; b=QQvJTUzeVNXM9lruixVwZl7KPc
	j9inxlwAeTm3UnJYU6f0I5ZzJKQ0cEs3Jbg+UzqSYGt203TchWQmvJUNCgiA6QbUS06ElAEDi7VBR
	fgyWr48ItkeFDGyGl/cVMeWv0KnBi8ybslg1g/eMl5oT7FE6ET/YbCdxWPnQEnO7bGnGmdIjVEty5
	ZKrfagQYGSk2uOkD5Url2HwZc2/NKVSgHnlXbdH28bVq8Oc/kSf7FANScDYqcGmRUARfeHw8K9iss
	j8Yot0FDEeXp7uOZWOqnxy67eagtqhIiKOccrTFke88DylOD0iZdrJf8viZbMc3Czuu8QXx9DsC8O
	MmE6iYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5aJw-00000004ZQr-0Vjh;
	Thu, 26 Mar 2026 02:19:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5aJt-00000004ZQ8-1mZe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 02:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D17A442BD;
	Thu, 26 Mar 2026 02:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63037C4CEF7;
	Thu, 26 Mar 2026 02:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774491575;
	bh=wdQ5OAKNDtYk+nI8mmrz94DUBWcTxmQRzCeugry/HTw=;
	h=From:Date:Subject:To:Cc:From;
	b=trNh3E+M3EZEDmKFspTPGDVZOD5GffWvEVPc0yZwY+cwzWBDy1jNxDZNrVZVHSqXX
	 G8ddTG57cPANTd6PoBfR5iW4r4rpHChT8hy9DEwFzIKMmkAe4Kwqwd/KFkDJoQb1d7
	 JKuT+hoScC11I58vVIEEZpWBpv/oNiG3GS+ahkMksN054zYHSC2DXSgzDxNj6knniG
	 UONkU5Ya2865vpNVFEh8+S1KRTjIHhm4UKwqqr3A+FOmtlr+vzKqpb2SIyFAjrFqyI
	 q7zFYI9rUBaMqgDjAF7D+7bzquetqMA1ERAfuzHC+jqQMYBrzf/XTr6AHOSVuATj6e
	 WNqR16vd/HsmQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 25 Mar 2026 19:19:26 -0700
Subject: [PATCH] perf/arm-cmn: Fix resource_size_t printk specifier in
 arm_cmn_init_dtc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-perf-arm-cmn-fix-resource_size_t-format-v1-1-e84d52ee3e81@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTbQbayiryIyuppqhLYj6YY49
 u5Wvfzg8J8NlIRJ4dxsILSyck4V7aEB/3DpTsi3auhMZ03fDTiTBHQS0ceEgV8opHkRT6Pym8a
 CIUt0BSfTHk8D9ZasgVqbher693S5/q3L9CRfvnnY9w/Y7uijiwAAAA==
X-Change-ID: 20260325-perf-arm-cmn-fix-resource_size_t-format-b01795e36e60
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; i=nathan@kernel.org;
 h=from:subject:message-id; bh=wdQ5OAKNDtYk+nI8mmrz94DUBWcTxmQRzCeugry/HTw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlHpm+dYHRTaMfKAys51LrvbbF/u8Xw2cVD1u1ywfvrd
 v7Xv/jpb0cpC4MYF4OsmCJL9WPV44aGc84y3jg1CWYOKxPIEAYuTgGYyOv7DP/D9udPLzm89XL6
 w+frswLD1rPHGd3f/j838pKL/YdugYePGf6KPkhVuz9p6orPvds8ep6INLIoyp9iPqe9ry1//sE
 JXSGsAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_191937_527483_6B987013 
X-CRM114-Status: GOOD (  11.41  )
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

When building for 32-bit ARM, there is a warning when using the %llx
specifier to print a resource_size_t variable:

  drivers/perf/arm-cmn.c: In function 'arm_cmn_init_dtc':
  drivers/perf/arm-cmn.c:2149:73: error: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Werror=format=]
   2149 |                                      "Failed to request DTC region 0x%llx\n", base);
        |                                                                      ~~~^     ~~~~
        |                                                                         |     |
        |                                                                         |     resource_size_t {aka unsigned int}
        |                                                                         long long unsigned int
        |                                                                      %x

Use the %pa specifier to handle the possible sizes of phys_addr_t
properly. This requires passing the variable by reference.

Fixes: 5394396ff548 ("perf/arm-cmn: Stop claiming entire iomem region")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/perf/arm-cmn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 1ac91cda6780..5c727c2abaf0 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2146,7 +2146,7 @@ static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *dn, int id
 	size = cmn->part == PART_CMN600 ? SZ_16K : SZ_64K;
 	if (!devm_request_mem_region(cmn->dev, base, size, dev_name(cmn->dev)))
 		return dev_err_probe(cmn->dev, -EBUSY,
-				     "Failed to request DTC region 0x%llx\n", base);
+				     "Failed to request DTC region 0x%pa\n", &base);
 
 	writel_relaxed(CMN_DT_DTC_CTL_DT_EN, dtc->base + CMN_DT_DTC_CTL);
 	writel_relaxed(CMN_DT_PMCR_PMU_EN | CMN_DT_PMCR_OVFL_INTR_EN, CMN_DT_PMCR(dtc));

---
base-commit: 2f89b7f78c50ca973ca035ceb30426f78d9e0996
change-id: 20260325-perf-arm-cmn-fix-resource_size_t-format-b01795e36e60

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


