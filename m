Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC07C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJq5gFzVTFUWlmbt2NgEmxQM8OU1I61N3ajtm+j2rDg=; b=Hm7/yFRbEE3MPFpyE7NSiTnkWh
	NUb0cr9B9yUIm/vzKaeXn6spiWlbCeS/CiPjrHooBjQ2eZDHfoYdLOMGREXU5WqxyXzuL3Ztbt08a
	lEpIMcJ0dMhaL2MDqK7cvCZZiUd+n1iauyQTYLce1wmxViRYyG/jgBjCtLVDHtWV+X/5g1qGAk3I8
	pQT2ww4r8VtSiMgpN55zyDQWEqsEqYu1gw3/LlZI4aeNoR6Ubbd487kH2bKM2IqbvWjdPgLjhdYfi
	E0E8LfpVb63+F+CTiUG+VDnIq/loGDCbnb6ps7YcB8oQeHioyVCC8PgK18pNq81F4BzPlhp6oEDZ0
	niFW2TOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJwM-0000000FklF-0Env;
	Fri, 11 Jul 2025 20:01:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIe1-0000000FXfv-1U3Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:38:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6678A16F8;
	Fri, 11 Jul 2025 11:38:38 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBCA93F694;
	Fri, 11 Jul 2025 11:38:45 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
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
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 32/36] arm_mpam: Probe for long/lwd mbwu counters
Date: Fri, 11 Jul 2025 18:36:44 +0000
Message-Id: <20250711183648.30766-33-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113849_524261_9B502F83 
X-CRM114-Status: GOOD (  14.53  )
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
---
 drivers/platform/arm64/mpam/mpam_devices.c  | 23 ++++++++++++++++++++-
 drivers/platform/arm64/mpam/mpam_internal.h |  8 +++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 5da2666e9ee1..774137a124f8 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -860,7 +860,7 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				pr_err_once("Counters are not usable because not-ready timeout was not provided by firmware.");
 		}
 		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
-			bool hw_managed;
+			bool has_long, hw_managed;
 			u32 mbwumonidr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
 
 			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumonidr);
@@ -870,6 +870,27 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumonidr))
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
+			has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumonidr);
+			if (props->num_mbwu_mon && has_long) {
+				if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumonidr))
+					mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
+				else
+					mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
+			}
+
 			/* Is NRDY hardware managed? */
 			mpam_mon_sel_outer_lock(msc);
 			mpam_ris_hw_probe_hw_nrdy(ris, MBWU, hw_managed);
diff --git a/drivers/platform/arm64/mpam/mpam_internal.h b/drivers/platform/arm64/mpam/mpam_internal.h
index fc71afce3180..fc705801c1b6 100644
--- a/drivers/platform/arm64/mpam/mpam_internal.h
+++ b/drivers/platform/arm64/mpam/mpam_internal.h
@@ -178,7 +178,15 @@ enum mpam_device_features {
 	mpam_feat_msmon_csu,
 	mpam_feat_msmon_csu_capture,
 	mpam_feat_msmon_csu_hw_nrdy,
+
+	/*
+	 * Having mpam_feat_msmon_mbwu set doesn't mean the regular 31 bit MBWU
+	 * counter would be used. The exact counter used is decided based on the
+	 * status of mpam_feat_msmon_mbwu_l/mpam_feat_msmon_mbwu_lwd as well.
+	 */
 	mpam_feat_msmon_mbwu,
+	mpam_feat_msmon_mbwu_44counter,
+	mpam_feat_msmon_mbwu_63counter,
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
 	mpam_feat_msmon_mbwu_hw_nrdy,
-- 
2.39.5


