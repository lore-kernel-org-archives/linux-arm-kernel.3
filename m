Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DEDCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8m867RKrQ8xf1hRDhEGkeMilRaM5SosJnBaVVsym4w=; b=tiXZ2b4g7IsaeCxIYeDPQutaux
	esRUTzWjsC2WLpla8k6G0iJ2n2Wjrqfn+CjQjL+uGEbcEy9fHfUJdUuof9Iftb4I4Hvz737x7PIGd
	gr/CpLYwBFyI9YseMBu0x288A0CYd5Z0f646KYqf71hQFYJRMlDq5LWv++Xs0p9E+F8TjpvGzmrqZ
	LNNwSqqFKWlhkWjuYe+xnD9nFhRx4TWvIXtzZhhUMy+92yrYgNIhz5ppv+REFoWyunfNmBieiTE7X
	oPCXxKOkx92O/xizsef81N6xDtmblVRASORmgPH9LZbxPnwIhM9FgY6l6cRLIYc8B/LbERPio7dQN
	q2MbsR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItab-00000007eUy-29MD;
	Tue, 11 Nov 2025 18:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItaT-00000007eLW-1ZrY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Nov 2025 18:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=B8m867RKrQ8xf1hRDhEGkeMilRaM5SosJnBaVVsym4w=; b=alMWXkeBmXO49G5gQ1wnPAcUAP
	OVqVtOrpkUp+biDX446JPI3rPKZFzSHlLohRmYC9eEJiNaNZYdYMxcPHhy0uaB19Sn+LvuqzAqjU2
	iYp7dgIAOyN5TcSwDRd7VLoZbF7ph4kHCHkoovgszf7jn5aXnGvxU/FCepMdwXjKPuMayL5iY31ss
	q4OOB0/qZlfOICFRqlumZeF32ZgudcgbzfElWQnlWno0owIkCzQ4w858zhHPwMS2OJDSrgDhQHZ+6
	fwM1cfGi4m/SA8EY9DYCrQqR3xaFNyFzJ0mjAgjsyd27sQv+hJRvdc1boSHniT/Y/+g9dWsJ+tQng
	1FN/oiqg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsil-0000000E0qf-02ar
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 18:04:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 121A5497;
	Tue, 11 Nov 2025 10:59:18 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 209EF3F63F;
	Tue, 11 Nov 2025 10:59:24 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 11 Nov 2025 18:58:43 +0000
Subject: [PATCH v6 09/11] coresight: etm4x: Add flag to retain single-shot
 status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-arm_coresight_power_management_fix-v6-9-f55553b6c8b3@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762887546; l=2992;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=15T76eavuF39v39pXEBnnq9nwJjNWukkue4ERg/+Ehg=;
 b=pBoH4zO2a/r8GsBUO1b0vnJZix7bkn89bowcYJHiyTQkhOzjtaXbhXHnIZ5Xze4LoTaF+5PKf
 KQaLjBo6dPLCVeLXF5sRkuOJp8Rwrc6E96yLZQUBuyqGDcVu2gdBYV5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_180359_381316_DF4DC2DA 
X-CRM114-Status: GOOD (  15.34  )
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

Add a 'retain_ss_status' flag to the config structure.

By default, the flag is set to zero so that the TRCSSCSRn.STATUS bit
is cleared to restart the single-shot mode.

If the flag is set, the single-shot status will be retained, thus
avoiding restart the single-shot. The retain flag is automatically
cleared to restore the default behavior on the next call.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 ++++++++++++---
 drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 560975b70474c3449aa6799fc1a8e05d5ea93495..8b85a73e29f407a8d5e26a25f4dceaadaeed05ed 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -565,9 +565,18 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
 
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
-		/* always clear status bit on restart if using single-shot */
-		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
-			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		if (!config->retain_ss_status) {
+			/* always clear status bit on restart if using single-shot */
+			if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
+				config->ss_status[i] &= ~TRCSSCSRn_STATUS;
+		} else {
+			/*
+			 * Leave the single-shot status unchanged; clear the
+			 * retain flag to restore the default behavior
+			 * (restart single-shot) for the next call.
+			 */
+			config->retain_ss_status = 0;
+		}
 		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
 		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
 		if (etm4x_sspcicrn_present(drvdata, i))
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 012c52fd19338133129752d35523dc102df24604..d82ec1559b34787dffc7debf4643d948e3850b2a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -802,6 +802,7 @@ enum etm_impdef_type {
  * @ss_ctrl:	Controls the corresponding single-shot comparator resource.
  * @ss_status:	The status of the corresponding single-shot comparator.
  * @ss_pe_cmp:	Selects the PE comparator inputs for Single-shot control.
+ * @retain_ss_status: Retains single-shot status.
  * @addr_idx:	Address comparator index selector.
  * @addr_val:	Value for address comparator.
  * @addr_acc:	Address comparator access type.
@@ -846,6 +847,7 @@ struct etmv4_config {
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
+	u8				retain_ss_status;
 	u8				addr_idx;
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
 	u64				addr_acc[ETM_MAX_SINGLE_ADDR_CMP];

-- 
2.34.1


