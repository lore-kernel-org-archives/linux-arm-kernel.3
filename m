Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D38C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35wI65bXi7usegfngiS/8LqChGBFAKrB4P6DBTBHW3E=; b=FkU1pFkKUOHLTdNKhBEvoQFMf3
	u5pzLy4PEDqOJIzm0DZMkZxypqsIntTDiAAUgphYsgyR3o3FFdF98+20GBUXNBnLEf1NMReFGhdv2
	4ztL30ONVRLyAKdmy2AzI3YTxDtShkDKism1g76MuU82FuseSWQIZbhBtRWEfIhIJbau2RXyVQqPm
	NI+9BjK1bFiR5QgsuD5UkSOwULLJ3+/OLcy+1zEhR8g5LodFws8NdMXj+9QpS64eBp2tD/BYlC1mW
	BP74slA9qaC3k2cHnp8aj0Ak8p5eptV3IKj19yyNl4f3Uva2SzctcLl+Omyi1+tSomiUlI//OHcSj
	1oOVeXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKC8-00000004zgY-3wka;
	Thu, 02 Jul 2026 16:23:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKC6-00000004zcp-0Mmp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:23:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71F7B1570;
	Thu,  2 Jul 2026 09:23:12 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 176763F673;
	Thu,  2 Jul 2026 09:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783009396; bh=dZiEdTB3o3jmleqxpeAia+GhpwalEnJMVJVBkq1ZCrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWcqo4cxGEbVuGYj7aD8wtSREfr+jF4ESUoTevZGei2zVKlcJk56SQGWqC+XG/qVp
	 fCrBzDe0ArxDGnxLZpZRtSlHBC+oMrShCTWuryS6HH/HF1aRgKU/3cyb25Y45R1M5q
	 DsNO/f/tJ2AvwzOphAio891wbvXS1a3KbUEgoiGg=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/15] arm_mpam: propagate MSC write errors for ESR and part_sel wrappers
Date: Thu,  2 Jul 2026 18:22:23 +0200
Message-ID: <20260702162229.4008659-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702162229.4008659-1-andre.przywara@arm.com>
References: <20260702162229.4008659-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_092318_199713_8E5B0359 
X-CRM114-Status: GOOD (  11.14  )
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

Allow the wrapper functions for part_sel and ESR accesses to return an
error, and propagate write errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index a7adc75a079c..23a5deb290b3 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -284,12 +284,13 @@ static int mpam_msc_clear_esr(struct mpam_msc *msc)
 	 * lower half prevent hardware from updating either half of the
 	 * register.
 	 */
-	if (msc->has_extd_esr)
-		__mpam_write_reg(msc, MPAMF_ESR + 4, 0);
-
-	__mpam_write_reg(msc, MPAMF_ESR, 0);
+	if (msc->has_extd_esr) {
+		ret = __mpam_write_reg(msc, MPAMF_ESR + 4, 0);
+		if (ret)
+			return ret;
+	}
 
-	return 0;
+	return __mpam_write_reg(msc, MPAMF_ESR, 0);
 }
 
 static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
@@ -312,28 +313,28 @@ static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
 	return 0;
 }
 
-static void __mpam_part_sel_raw(u32 partsel, struct mpam_msc *msc)
+static int __mpam_part_sel_raw(u32 partsel, struct mpam_msc *msc)
 {
 	lockdep_assert_held(&msc->part_sel_lock);
 
-	mpam_write_partsel_reg(msc, PART_SEL, partsel);
+	return mpam_write_partsel_reg(msc, PART_SEL, partsel);
 }
 
-static void __mpam_part_sel(u8 ris_idx, u16 partid, struct mpam_msc *msc)
+static int __mpam_part_sel(u8 ris_idx, u16 partid, struct mpam_msc *msc)
 {
 	u32 partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
 		      FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, partid);
 
-	__mpam_part_sel_raw(partsel, msc);
+	return __mpam_part_sel_raw(partsel, msc);
 }
 
-static void __mpam_intpart_sel(u8 ris_idx, u16 intpartid, struct mpam_msc *msc)
+static int __mpam_intpart_sel(u8 ris_idx, u16 intpartid, struct mpam_msc *msc)
 {
 	u32 partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
 		      FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, intpartid) |
 		      MPAMCFG_PART_SEL_INTERNAL;
 
-	__mpam_part_sel_raw(partsel, msc);
+	return __mpam_part_sel_raw(partsel, msc);
 }
 
 int mpam_register_requestor(u16 partid_max, u8 pmg_max)
-- 
2.43.0


