Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXccO+5Jxyd1LezVbx+SScF46BFjQSgckyZrNTm24Jw=; b=UEwP35M9qWwDsVzTmzFNS8nx1U
	BDKiT26GLbm4avAqXVJlrICa/vYFgJ8sRLFUBVOxhdY04gBnpEjs9spEQ0EXKgsCK+aJRV8rlDDzb
	193ZlVM6YoCk1OBI5PesmJ++PaBlnnfsGBvXaj8tsg+OruzM6S6WI2nOhH8qy1SwwcwPoHmA1DTPm
	YyVAPdek0+hi43e3T0hBLOKPwGptK4ewzbPmJuyYlJShomD8Z5WvpNNbW4szGDKXsomEc9z0OROwS
	aZ6/4s81p7k9I4NI6WiKLE3h/ZK1gZcrEW50twL6KgOEnyQ5HFiwjUUmqyHYDqfRvS6ixmZZYyKPf
	cj2Qwe3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxkd-0000000AIg6-2RZ0;
	Mon, 03 Nov 2025 16:49:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxka-0000000AIdG-2j4d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:49:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5DE62BCB;
	Mon,  3 Nov 2025 08:49:39 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D88AF3F694;
	Mon,  3 Nov 2025 08:49:45 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 03 Nov 2025 16:49:28 +0000
Subject: [PATCH v5 07/11] coresight: etm4x: Remove the redundant DSB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-arm_coresight_power_management_fix-v5-7-f803c19aa153@arm.com>
References: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
In-Reply-To: <20251103-arm_coresight_power_management_fix-v5-0-f803c19aa153@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762188572; l=3006;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=MhGTvkgNXzSsyPEuPah4/hh9zrW0TXKbY5/4yXiyAP8=;
 b=Nold4GXvLqGUkzz7SsWK+5VRXnc/YPzfwVdZhKFyiXzojdydaBZs9DSLnyq+C7xkyhlwBA45v
 Ud3cr6DE91RCjxRBH9Lbn5v66JgyzFDqc8b3gISsTvf561ZglXAEpL1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_084948_984378_B3B26DBE 
X-CRM114-Status: GOOD (  12.54  )
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

As recommended in section 4.3.7 "Synchronization when using the
memory-mapped interface" of ARM IHI0064H.b:

  When using the memory-mapped interface to program the trace unit, the
  trace analyzer must ensure that writes have completed, to ensure that
  the trace unit is fully programmed and either enabled or disabled.

  To ensure writes have completed, the trace analyzer can do ...

  If the memory marked is as Device-nGnRE or stronger, read back the
  value of any register in the trace unit. This relies on peripheral
  coherence order defined in the Arm architecture.

Polling TRCSTATR ensures the previous write has completed. Therefore,
removes the redundant DSB barrier in the enabling flow.

Update the comment in the disable flow for consistency.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index fdda924a2c7117a6828e5325d78586b09e75febd..bdf5ab85b2213dfd601391fdcf50960667fa7cea 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -475,10 +475,16 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 	}
 
 	/*
-	 * As recommended by section 4.3.7 ("Synchronization when using the
-	 * memory-mapped interface") of ARM IHI 0064D
+	 * As recommended in section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 *
+	 * For the memory-mapped interface, the registers are mapped as Device
+	 * type (Device-nGnRE). Reading back the value of any register in the
+	 * trace unit ensures that all writes have completed. Therefore, polling
+	 * on TRCSTATR guarantees that the writing TRCPRGCTLR is complete, and
+	 * no explicit dsb() is required at here.
 	 */
-	dsb(sy);
 	isb();
 
 	return 0;
@@ -974,8 +980,15 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 		dev_err(etm_dev,
 			"timeout while waiting for PM stable Trace Status\n");
 	/*
-	 * As recommended by section 4.3.7 (Synchronization of register updates)
-	 * of ARM IHI 0064H.b.
+	 * As recommended in section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 *
+	 * For the memory-mapped interface, the registers are mapped as Device
+	 * type (Device-nGnRE). Reading back the value of any register in the
+	 * trace unit ensures that all writes have completed. Therefore, polling
+	 * on TRCSTATR guarantees that the writing TRCPRGCTLR is complete, and
+	 * no explicit dsb() is required at here.
 	 */
 	isb();
 }

-- 
2.34.1


