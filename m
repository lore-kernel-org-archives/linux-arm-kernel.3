Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA3ACD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDrPk/j2cjEuIoBm+xk+5sCMUSDGXUZKWizL+qN3lAg=; b=SDiSNoJ6SVigreU5Rkpc/uI+uB
	aOzDBX55Avrr9hi6COoKI9AEoviaSXzVjsXdOD0YYf8SPqgqZHZlBGeUvLm/2aQ/uYBp8xDAoMLSZ
	6SR+1ymVk848Vxk/Rhv++uCjfEuPgXx6TiECB9SRritoWX2oMWH7RedE4rPXT1jwkc+uxjgwufeYG
	NcJZnqP3jWmY/cl78sezNE4pZMJNrCYzBPMTrN67cyfGjrHSl//6IZvsxIyB+YjmQzteHehVEDttQ
	cWaTYlmvqauNm2bZUlRvLZQU4NdpuiCOjN7uTgxinojDeo5xXHh4yG7Z4VMQ804nZwMJQPlKeJ9k+
	G/fUYKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaU-00000007eMb-0RdE;
	Tue, 11 Nov 2025 18:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaP-00000007eJL-2cPf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Nov 2025 18:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lDrPk/j2cjEuIoBm+xk+5sCMUSDGXUZKWizL+qN3lAg=; b=cHDSCyul1hacu4KRaqIYKZKWIR
	ArT2tG4X00IpEfKmnMySPAJdQCOZHWOCkOFAkamEr1bsPH3S9gGVdLU2qsgulhTFLlzwdl40lAyQs
	NbRAK0a59Z996035RViom4yFzd6FdrkDwqT4WBEKDn5p09KZpGgaepNF2sPnyesz9qJK+5ee7HGcA
	9lKbfgRCsks8UNYL4MQNU1vULmqOwreW3sFVfHvs4FBTnoqNpWDGqTSEvglVhAcpxCGX4PCPPISrN
	YEckGS5VQBHPeX3IT1b0TfjCsOjtLXLfqHCpgpEgU1x0E8OHhzdvWszsgZfKSDgF7Lhq/PZD4oQVv
	ej6vL94w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsih-0000000E0pc-16P6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:03:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E243497;
	Tue, 11 Nov 2025 10:59:14 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C6E73F63F;
	Tue, 11 Nov 2025 10:59:20 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 11 Nov 2025 18:58:41 +0000
Subject: [PATCH v6 07/11] coresight: etm4x: Remove the redundant DSB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-arm_coresight_power_management_fix-v6-7-f55553b6c8b3@arm.com>
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
In-Reply-To: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762887546; l=3054;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TswMo4s/6KtbMqi32UHSDaWDvbeXaMrPjrKDXO0zwLE=;
 b=Ctd4zVAwS2GDBz2m1pfbPPX0hvRoRbbJpC/lNfR7wIcF1+4eR6LqG7aeULzOvKXdCRiRuLM6f
 nNuoLzhjQWjCZ1fXEEg2j+okPvfYiJx6+86xbHGDLIu6Q4FpElQ6vlK
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_180355_666837_BCB01F39 
X-CRM114-Status: GOOD (  12.51  )
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


