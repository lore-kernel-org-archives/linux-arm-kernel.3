Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B573CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLa6G9UJgSbNRh8eQcPfSgL2TnZnQf2rjdNm5ck8/Kg=; b=c1bSED4zhAM48B4qNdgy89FK33
	kslhuMHYtjiJKhSJls96K68DPfwedTisy6ct9ewvnleLiJJTsiPwrxt4vBwqOHZYFYlj/3q3uT3ow
	33m6OlhBNYYNPylOKx8iluOAWsApri5/jFD+nQ0i/gjbalSCSwBMsTZHj2q+c7twjm7I1u2dMMWaH
	8Eb4PKlgwaIPsunK+YMzhuxni9oyyqA97nTeDM9D+mneScnTxc3T330vgVxSCArDGHStHvvE2ryaW
	kvt7N0IS3BqXSF6Edf38UECNjANPtDttM2vsFHzW2wiRRWx45yeB9eMkxDNP2ybLcKnXyvtDUEsrG
	jnjARKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywAT-0000000Dg3I-07ne;
	Wed, 17 Sep 2025 17:42:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywAR-0000000Dg0R-0lTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:42:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3DE426B9;
	Wed, 17 Sep 2025 10:41:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5608A3F694;
	Wed, 17 Sep 2025 10:42:03 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 17 Sep 2025 18:41:38 +0100
Subject: [PATCH 1/2] coresight: trbe: Prevent overflow in PERF_IDX2OFF()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-fix_aux_trace_index-v1-1-e36a76ac6292@arm.com>
References: <20250917-fix_aux_trace_index-v1-0-e36a76ac6292@arm.com>
In-Reply-To: <20250917-fix_aux_trace_index-v1-0-e36a76ac6292@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758130921; l=966;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xznId6KLEjexVhy44PArHFtKkaLQrxQlKITeJniEfMw=;
 b=xm7EqYkG+5d5BnteZZCaYjnZng4eknZZdmbDF+4qbTnRmbX8O0oYWWZNZ524Yz6+MGMQaq42R
 A8hgQsIIvpdCneK9sYCcTau5oHci7VEb13RVQmcwjMCjNofM/d119GP
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_104207_262549_ABA14076 
X-CRM114-Status: UNSURE (   8.17  )
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

Cast nr_pages to unsigned long to avoid overflow when handling large
AUX buffer sizes (>= 2 GiB).

Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8267dd1a2130d37d9507791620ea7bc8cbcd675c..8f426f94e32a15fd26e6c4e42385a5d93a7b7c1a 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -23,7 +23,8 @@
 #include "coresight-self-hosted-trace.h"
 #include "coresight-trbe.h"
 
-#define PERF_IDX2OFF(idx, buf) ((idx) % ((buf)->nr_pages << PAGE_SHIFT))
+#define PERF_IDX2OFF(idx, buf) \
+	((idx) % ((unsigned long)(buf)->nr_pages << PAGE_SHIFT))
 
 /*
  * A padding packet that will help the user space tools

-- 
2.34.1


