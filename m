Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DECCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tk5In9WOdDzBGaOwzPZDE/Y3R8pkdOs1eruRG/llWAI=; b=skAGDpTirQSXgX41MYr/sdEghR
	uHhHZX5JDcIqKaAm7nebPouqarsTnsFUOBSNPGP6A0MpsXTwAAh7vdclhJ6H+uVEPhrqdN/ia+fNS
	dHB/nUb4dl/Ah/MSyZ5PN30P0U+ql+gOnyXMak/UAagIRkLte8Juu9ecb1Ti2d1sTSdjKip7hTJKh
	FX/1bsbZu5iB0pEygO0WLiETTM3L2rkogrmggKwZ0JGeHwVR3zmOPOm5FCbJJLuEHNYZvchBGzA30
	vtUjBP/fUYtQoWW4FQ1bUm7PhU/rosuvHb+j3odbdqSSFjSTfHtSu6kxl7PZfdbMEzxDGWR3vZGqB
	uk91JfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDX-00000003TvX-3yGo;
	Fri, 16 Oct 2026 16:55:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDL-00000003TkQ-1S9F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D7C41477;
	Fri, 16 Oct 2026 09:55:23 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23E1D3F7B4;
	Fri, 16 Oct 2026 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169726; bh=+jqZzyhV5ag+2Smp2FCcR5UxrniIfKBgwDp/ueibgVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aV+SESzmbE/EsF0WcbUyJvly90WShwFBCZ69ahJfPSSB/Q6v/o/zA41RlOA+nHK1T
	 ISqHvKJbn1NzzJOxtO3yGsPpp9IhryVX0WfBq2rsC9MnZBKCTsrThQmhMYX7g00mjs
	 SqjNQUDg9DF55wHEUuccRpKv3TxM9UOHRUvHZDoI=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:06 +0100
Subject: [PATCH v2 08/23] coresight: trbe: Clear stale external abort
 status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1173;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=+jqZzyhV5ag+2Smp2FCcR5UxrniIfKBgwDp/ueibgVI=;
 b=SrX2DqNJ7y//tJqyorcceEhD0AK2v8h4Q9zCYwAk5s4OOEYUpVshUNaW+45Ge7zDM4V3sg/hb
 gIggxSN99ryDt9wds6AQL+1NiIWh6YK/32Iue2BavwXCfH9IilR3Wzm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095527_438072_F298845E 
X-CRM114-Status: UNSURE (   8.52  )
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

clr_trbe_status() clears the buffer status and syndrome fields, but
leaves TRBSR_EL1.EA unchanged. After an external abort, this indication
can survive into a later perf session on the same CPU.

Clear EA along with the other status fields while TRBE is disabled.
The status captured for the current fault remains available for
classification, so external aborts are still handled as fatal.

Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c..26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -608,6 +608,7 @@ static void clr_trbe_status(void)
 	trbsr &= ~TRBSR_EL1_IRQ;
 	trbsr &= ~TRBSR_EL1_TRG;
 	trbsr &= ~TRBSR_EL1_WRAP;
+	trbsr &= ~TRBSR_EL1_EA;
 	trbsr &= ~TRBSR_EL1_EC_MASK;
 	trbsr &= ~TRBSR_EL1_BSC_MASK;
 	trbsr &= ~TRBSR_EL1_S;

-- 
2.34.1


