Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD149CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKZgH6g7K7uwE9DnT9otts8Qlk73gAFEdnSMLGrcJD8=; b=yvciZUpjU0c/K0UTLFjcPZZCfG
	NzXroJpgdLG8KfDEmX/mWcWY1EuH8fv1ZsxfSfgSVZZMcWx7mYrX2NcPcmqo0aZ7LIWqIZ5J0cp1B
	IrTd/uUk8cl+dSkM6De0OLcST4JGyVgUJVIVDzYXKxOnmizuRc31kDj2njGD57KoFC97RXpa0aaXq
	NvKes4MPzAlqkaoMTvIbL1vsEAlbwgsi8at+QKzb6amUdpkkHS7rWfg2Uunp2UPIxXcf9he6i3voM
	JWyzLn+N/IUUXLEygFF20i3eghlBvF9Y5xyPIGitZi2FF3W/12vXYLa6z/uZtuqvn8Q3y6mCKe5Mx
	0Zs6eX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VO-00000008jVn-1QwI;
	Wed, 12 Nov 2025 11:59:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VI-00000008jQl-1LxC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:59:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27D1C1515;
	Wed, 12 Nov 2025 03:59:04 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 360183F5A1;
	Wed, 12 Nov 2025 03:59:10 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 11:58:43 +0000
Subject: [PATCH v7 07/11] coresight: etm4x: Remove the redundant DSB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-arm_coresight_power_management_fix-v7-7-33e0b6f995f7@arm.com>
References: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
In-Reply-To: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762948736; l=3152;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=8BqBijaD3RnbKHOP1Qmg/j6KZK9r54uPJ0LpIrWurqs=;
 b=+xBU+oc5xz5Vt0KEiW92iIHS6l72LIn+0dOuSS5C5A7TvCP356LDF+wbRruuGX6fQFFFSoxrO
 WEKBfwlN0JYDEYePI8HdGFpkqNq5gOylz8U9Vc5SdkmL/C9lNI9yNPQ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_035912_494953_97CBE205 
X-CRM114-Status: GOOD (  12.37  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
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


