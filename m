Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3152CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uSo9U4DTwr8H4+CvM5wFR0QeHrhMr3XNv/i+edhvSQ=; b=lCESiUeT19QFDcCyDvXNyY5iar
	XIKSzn4oCj0chSUDKrAn2rTYVRJsk7YC1NuRXHiDAvKEEbf0P4gJO83bQAOUHhkAMTyYD11hcJFuy
	i73l26/o1gM1HJR/Ibhf2WVKBqlPsxUBFprcZ93AaimzXFmcu07QZkr2kwYv97ejWB0GjqUW2y4ZX
	kJBilK8WC99hNa93fiIHcgrE2YLHpvfHpphia+Pu1cuPeZyeAv2PRYTd71PRXz5luLPymKVGtXL/u
	z+a9S0wGLLT3soIgfB1T4jBQjuViD2lG+JFVE5PSONku/oXqvkTFz3OiuT+UKlbEMhwUjEGbIExg6
	NYI+AvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRhI-0000000Gepd-1AIm;
	Wed, 10 Sep 2025 20:45:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRhB-0000000Geht-0PSl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:45:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21488153B;
	Wed, 10 Sep 2025 13:45:28 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6F4E3F63F;
	Wed, 10 Sep 2025 13:45:31 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 25/29] arm_mpam: Probe for long/lwd mbwu counters
Date: Wed, 10 Sep 2025 20:43:05 +0000
Message-Id: <20250910204309.20751-26-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250910204309.20751-1-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_134537_292372_FE353CC1 
X-CRM114-Status: GOOD (  15.36  )
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

From: Rohit Mathew <rohit.mathew@arm.com>

mpam v0.1 and versions above v1.0 support optional long counter for
memory bandwidth monitoring. The MPAMF_MBWUMON_IDR register have fields
indicating support for long counters. As of now, a 44 bit counter
represented by HAS_LONG field (bit 30) and a 63 bit counter represented
by LWD (bit 29) can be optionally integrated. Probe for these counters
and set corresponding feature bits if any of these counters are present.

Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 23 ++++++++++++++++++++++-
 drivers/resctrl/mpam_internal.h |  9 +++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index eeb62ed94520..bae9fa9441dc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -795,7 +795,7 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
 		}
 		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
-			bool hw_managed;
+			bool has_long, hw_managed;
 			u32 mbwumon_idr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
 
 			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
@@ -805,6 +805,27 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
 				mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
 
+			/*
+			 * Treat long counter and its extension, lwd as mutually
+			 * exclusive feature bits. Though these are dependent
+			 * fields at the implementation level, there would never
+			 * be a need for mpam_feat_msmon_mbwu_44counter (long
+			 * counter) and mpam_feat_msmon_mbwu_63counter (lwd)
+			 * bits to be set together.
+			 *
+			 * mpam_feat_msmon_mbwu isn't treated as an exclusive
+			 * bit as this feature bit would be used as the "front
+			 * facing feature bit" for any checks related to mbwu
+			 * monitors.
+			 */
+			has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumon_idr);
+			if (props->num_mbwu_mon && has_long) {
+				if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumon_idr))
+					mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
+				else
+					mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
+			}
+
 			/* Is NRDY hardware managed? */
 			hw_managed = mpam_ris_hw_probe_hw_nrdy(ris, MBWU);
 			if (hw_managed)
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 725c2aefa8a2..c190826dfbda 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -158,7 +158,16 @@ enum mpam_device_features {
 	mpam_feat_msmon_csu_capture,
 	mpam_feat_msmon_csu_xcl,
 	mpam_feat_msmon_csu_hw_nrdy,
+
+	/*
+	 * Having mpam_feat_msmon_mbwu set doesn't mean the regular 31 bit MBWU
+	 * counter would be used. The exact counter used is decided based on the
+	 * status of mpam_feat_msmon_mbwu_44counter/mpam_feat_msmon_mbwu_63counter
+	 * as well.
+	 */
 	mpam_feat_msmon_mbwu,
+	mpam_feat_msmon_mbwu_44counter,
+	mpam_feat_msmon_mbwu_63counter,
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
 	mpam_feat_msmon_mbwu_hw_nrdy,
-- 
2.39.5


