Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA522C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MkO/9X+VjCYKaz5toI02hL625tEKcVF2KKPURzcR3Uw=; b=QT2O+RBsEYdtv5sT13Vz2Bc2lJ
	imRVO6KGWsVEfy8U+wJYZp3yA4ILYDfhNEuN6bnWQ9UyRHxzNgWrwU4gDEGfMk/cK1xqO4XbVrvdg
	TuaS7eHptH0E+PRq4pqlbPwaYueX5JiJvXOzjrBbuROUOvrSa1897FVy6oyaAsICNuqmPAfdJ//SG
	J7wHLHWHfzQxYH1sTIMMGcZVojJHNFLG+NiBullBK7K/FUrq4Buu2vmoySi1466tPW7VA35npP1ll
	z88QbBd5hfv2uhtotK4cUMUNhK3wH9EQzxQCK7YanWLDWyHxV0K45p7MZsIdyjiIrY+AG7ntq56K0
	fwhJTm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSIb-0000000HJ4E-45Iz;
	Mon, 10 Feb 2025 11:50:01 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thS5o-0000000HFfO-3Mbr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=MkO/9X+VjCYKaz
	5toI02hL625tEKcVF2KKPURzcR3Uw=; b=kqLakCI/vazAQP60hgBOMCYkV1X9GM
	VpS+fio/jjQ23yV4Xq/skLL8A+xExNLdXwecBQolqUZBhlFwVyaA/AVu3Bv6T/2D
	sKEwlJaOfLmRix+Su9eNnLC0hP+SF/dsNHQA2fPFVLxtf3DllZNpiWzp/nEYNBYS
	m7s3VAJyPbuKjqeMIwlSKuhPb4w+REdMGo8mV5RfAZAAsL4InkFP3aiRoTv3K+Ul
	NtQgWNP6eM3cGCfJmSXrVqrsMdd21ZG9Rlw61cD7H5acuBNWSvNANSRJq5ACsEYg
	lO7yVmYb5IEMYNx91sy9ZJxzJ2BXDolxLUd/5SWgEjfhFShAgIXRva2g==
Received: (qmail 802320 invoked from network); 10 Feb 2025 12:36:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2025 12:36:43 +0100
X-UD-Smtp-Session: l3s3148p1@XHFjH8gteL1ehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] coresight: etm4x: don't include '<linux/pm_wakeup.h>' directly
Date: Mon, 10 Feb 2025 12:36:36 +0100
Message-ID: <20250210113635.51935-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_033649_112839_C5A82ADF 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

The header clearly states that it does not want to be included directly,
only via '<linux/(platform_)?device.h>'. Which is already present, so
delete the superfluous include.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2c1a60577728..bdb9262798cc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -24,7 +24,6 @@
 #include <linux/cpu_pm.h>
 #include <linux/coresight.h>
 #include <linux/coresight-pmu.h>
-#include <linux/pm_wakeup.h>
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
-- 
2.45.2


