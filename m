Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CA7C53209
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjTuAMXIx/AHC4Os+ngJ7F3QfEWsSRVfN1l1GDaEkKw=; b=1NnPUE6woMJVlQHSuLOcO7yLi8
	erglhz0kE7Xxh3boUxIUzjNtgCQfAyCPo/kEuytq75HwfPw3jEBTLa/VhiS5+Jn9JUM6S2X8xt1Y3
	XZMeWD09YL1/uZ2cvavn2axXo5GefveRx1XK/qOJgX6Xom1eDR+tiGsEpJcF4ecmIWUw9Fnf/ecJ1
	68d7kNQAhJr2XGV6XWOkig6vtrYS0pM3STVEzzePVz7bGi/i3iGC6O/ImKSJDy/qNxXp8ooIVRan3
	1IopN1SPHz0jGRCC7UEoODB0F1wrV86JKauqibbMWI7xTyHL7xVIMDlFkxuj7d2gL0FLHW7/lW5Tf
	XG8CkHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagm-00000000IDr-0tPi;
	Sat, 25 Jul 2026 11:37:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagd-00000000IBI-09vY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9318F1477;
	Sat, 25 Jul 2026 04:36:52 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 21E993F86F;
	Sat, 25 Jul 2026 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979416; bh=yuWjaIMKIf5i6x1/uorLgf8zTF2UyYw+ckJ94QtfUbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TO3L5pawvg9Vvc9NJifoCh8zjUQ9cS+uBgsWkhbGbMcmfclm4X1D2X77KoGvu9Tlo
	 f0Kj363qnVigw5Y7jYmyQfbk+DAcWW9WKPuuC2WBW5Kdm3PdP5FIOSSinHsYDKYlCC
	 iJtTTEULwz/OQ9kRuSTItQCex+SpWelwt+7drOpc=
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
Subject: [PATCH v9 01/13] coresight: etm4x: fix wrong check of etm4x_sspcicrn_present()
Date: Sat, 25 Jul 2026 12:36:33 +0100
Message-ID: <20260725113645.57519-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043659_224200_4266DBE3 
X-CRM114-Status: GOOD (  11.03  )
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
index 14bb31bd6a0b..1e3b0344dc00 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -93,7 +93,7 @@ static int etm4_probe_cpu(unsigned int cpu);
 static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
 {
 	return (n < drvdata->nr_ss_cmp) &&
-	       drvdata->nr_pe &&
+	       drvdata->nr_pe_cmp &&
 	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
 }
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


