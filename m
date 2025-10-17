Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmqD6scgRqtJrOUXOiN9GPVUvLwOO+p9YwoRJuwCuwk=; b=FDuH0U+ZQMJUQG9RmBWCqFsEJl
	GHltVXFsGAVXhijK6NbkVqjT/tbBz2g8LCsGDvtTGLWzZ89GDRlQTS1sql6F7TPLoPAeDiLDsltMm
	WPL5mJHiotRyyZ8goCGoFc757MVkjKa8p1Dz8RtTPpCfK8cl1ThA63bgdtP3ncevZvfAXiwb9lmPe
	4ThZ6fFdmq3QdC9lH16W+/Y/uBAGagevsrFKG2aYahZsM8yWYvWZLH9qbNdfCm9YubQmJNKPDqRvx
	fm8O1w/6pQhuoLKZnoNTvb0gH8/4XjU4Epu2qXEqnHAzNP4VF+p8ol8zuVsYBGIWFOLI1UqZHqNFn
	Q8KRFnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pfo-00000008liq-2rBt;
	Fri, 17 Oct 2025 18:59:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pfm-00000008lfc-1xVy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 18:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PmqD6scgRqtJrOUXOiN9GPVUvLwOO+p9YwoRJuwCuwk=; b=Xg/Q61uL+jUmCFai12EWuL+WYP
	oM5RihYAs6+eMujLsAisYEUUzBlkb2nQUHQ12cDD52a2nzFc4rd2ZomnxxhPLwaBMRPom5o5LTQrC
	kSsFPsGC0hJT9pDyg+au3gcWK1pWlxiAMQDVHyyzuDsx18xPAzFvff++qhzGNqQNZGmePykCk2D3l
	zOPmI5D/0AD7/Pojm9LJ1C8oedFPRHELz7qQdZoWXY33e9gPsItPqk/wuwKs0Tw6tAOi40PuAxCdW
	jsFn2Bq/CkdnBIzwQFT6bbz/U0pdUuG5gxrK52IKHPVesPKKST0eIxBzRJU64QdqkwNAoJ8ev78QL
	FcKt/4OQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pfc-00000007shD-3gu1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:59:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 026A81C2B;
	Fri, 17 Oct 2025 11:59:12 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB7A43F66E;
	Fri, 17 Oct 2025 11:59:14 -0700 (PDT)
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
	Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v3 25/29] arm_mpam: Probe for long/lwd mbwu counters
Date: Fri, 17 Oct 2025 18:56:41 +0000
Message-Id: <20251017185645.26604-26-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_195923_470602_4D790A56 
X-CRM114-Status: GOOD (  12.17  )
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
memory bandwidth monitoring. The MPAMF_MBWUMON_IDR register has fields
indicating support for long counters.

Probe these feature bits.

The mpam_feat_msmon_mbwu feature is used to indicate that bandwidth
monitors are supported, instead of muddling this with which size of
bandwidth monitors, add an explicit 31 bit counter feature.

Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
[ morse: Added 31bit counter feature to simplify later logic ]
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes since v2:
 * Added 31 bit counter type feature.
 * Altered commit message.
---
 drivers/resctrl/mpam_devices.c  | 13 +++++++++++--
 drivers/resctrl/mpam_internal.h |  3 +++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index deb1dcc6f6b1..f4d07234ce10 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -777,16 +777,25 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				dev_err_once(dev, "Counters are not usable because not-ready timeout was not provided by firmware.");
 		}
 		if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
-			bool hw_managed;
+			bool has_long, hw_managed;
 			u32 mbwumon_idr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
 
 			props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumon_idr);
-			if (props->num_mbwu_mon)
+			if (props->num_mbwu_mon) {
 				mpam_set_feature(mpam_feat_msmon_mbwu, props);
+				mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
+			}
 
 			if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
 				mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
 
+			has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumon_idr);
+			if (props->num_mbwu_mon && has_long) {
+				mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
+				if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumon_idr))
+					mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
+			}
+
 			/* Is NRDY hardware managed? */
 			hw_managed = mpam_ris_hw_probe_hw_nrdy(ris, MBWU);
 			if (hw_managed)
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 28c475d18d86..ff38b4bbfc2b 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -158,6 +158,9 @@ enum mpam_device_features {
 	mpam_feat_msmon_csu_xcl,
 	mpam_feat_msmon_csu_hw_nrdy,
 	mpam_feat_msmon_mbwu,
+	mpam_feat_msmon_mbwu_31counter,
+	mpam_feat_msmon_mbwu_44counter,
+	mpam_feat_msmon_mbwu_63counter,
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
 	mpam_feat_msmon_mbwu_hw_nrdy,
-- 
2.39.5


