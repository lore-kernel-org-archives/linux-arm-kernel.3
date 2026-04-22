Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5F6F9EDC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ia5JPALuUpf9IZSEziZiDfe5LjShp75SVsZ95G6sQTU=; b=nQDtVsp6RqokbdwZ8+EcA2mM8j
	oA1JdlO9Xy+ayJhdUGkmVaFbmmppd/8IcrIIbRWkMt2NfKHVfFKA1Evh1h/Y8d8uK0zb13aq2hm7m
	WT85lRQqDtbtlmW9XUX3LiW/uBpZ7/uJAvNK7w2Ek39jtNN47Hahz3bNX9W/N0AKuYPTx30tdTuMb
	YbAV1B9Kgwb+07wDf+FQmIuUasszz1AdvJ3/PrEaaNLAKR6ijHinhAVhYem6QT7aicxZJRfbR6KJ6
	bARKFIDEcSC+fU7I/Af2kqczcSx1wwR0WSoOmIpkgusp7STiTqon5taieDeZFN0KypaUYv/e/6GN+
	nSacvSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXWz-0000000AHZt-3pkj;
	Wed, 22 Apr 2026 13:22:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXWt-0000000AHYR-1cVe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:22:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6196122D9;
	Wed, 22 Apr 2026 06:22:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 211D43FD46;
	Wed, 22 Apr 2026 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864129; bh=wCZSP6bzdkq+xz6clDCOnc+i6IRLYQEpU37bVD7+8zQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nSXz866xOke4STux52j+1Vh3jDyp0S2sPET0PX9rOmY1aHROWkbNxm8OwRWReMjmb
	 4Qogt6SbrFZQyER9dv0DjrZrI7ZaGjoaJEj7uaAfs2LU97typ0oJRSa6SjSyMOV/Lm
	 PB4rN/g8u9pFZKZ8fQvzib7CnNo7FGBgz8R81EeI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 01/13] coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
Date: Wed, 22 Apr 2026 14:21:51 +0100
Message-Id: <20260422132203.977549-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422132203.977549-1-yeoreum.yun@arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_062211_460904_BAF95B78 
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

According to Embedded Trace Macrocell Architecture Specification
ETMv4.0 to ETM4.6 [0], TRCSSPCICR<n> is present only if all of
the following are true:

  - TRCIDR4.NUMSSCC > n.
  - TRCIDR4.NUMPC > 0b0000.
  - TRCSSCSR<n>.PC == 0b1.

Comment for etm4x_sspcicrn_present() is align with the specification.
However, the check should use drvdata->nr_pe_cmp to check TRCIDR4.NUMPC
not nr_pe.

Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
Fixes: f6a18f354c58 ("coresight: etm4x: Handle access to TRCSSPCICRn")
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d565a73f0042..74b7063d130e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -89,7 +89,7 @@ static int etm4_probe_cpu(unsigned int cpu);
 static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
 {
 	return (n < drvdata->nr_ss_cmp) &&
-	       drvdata->nr_pe &&
+	       drvdata->nr_pe_cmp &&
 	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
 }
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


