Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2575DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ04wEbM6CmyRDfEo+0SOez5cw5lb8TDbjbJF6ZF5oI=; b=HHq7MgPylMVFJrEh2zFNb/zbfR
	j+AELfy61Lr/XAlUA6NajJzFG/9OdfQqI1Jcxpzz2p2oLp087/kTfSIImrtSAiOqu12fKmvI8rIPq
	mF5l+/oHYGerXvFKvb+fXTXordqk7lAfcshaJCZBe+qBipqCUXkc3Dy28/5kYsiFgfXX4cLM+t79Q
	nnFeq9fIHwtyop53gnT3nhKlKU1HlUWqD5+DMefmXp9J7ZwOLxwhe08/fZOcg4aYWkL+EmMOLKcj5
	x2ItxQvfjjjyVIdNbS9hzX1lWE1iCM2c9958VI8xtb6Ge5Rcc9ws2xSGs9NB7OJDtqVKr2GuV7Pf/
	TfWynlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCU2-000000056fk-2eTg;
	Fri, 10 Jul 2026 14:45:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCU0-000000056fM-1Mv2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:45:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D04E176A;
	Fri, 10 Jul 2026 07:45:34 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 011403F7B4;
	Fri, 10 Jul 2026 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694738; bh=Glz8LzX3zk2vWrmjd7S5X4lLU9dPz4aZD0bvZAMR3Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=APLYNibS8Zs4tA8iXFqrZ3XUJQBnJXuG4Fkgyy3FbLQbzL0YwEzf6xEL6tI8VggFd
	 fVK1rdwiTG+TX86kdFFtpk8kRWSvEaXal8kes89YaTRKOuSFpyK6wCx0f2mg+ZS5Y6
	 qaLNPDBh0+5dABPt2heuS0j9kO/xOS3KMNRusE3M=
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
Subject: [PATCH v3 02/16] arm_mpam: propagate MSC read errors for wrapper functions
Date: Fri, 10 Jul 2026 16:45:06 +0200
Message-ID: <20260710144520.917375-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710144520.917375-1-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074540_455905_5AC4A1F7 
X-CRM114-Status: GOOD (  13.48  )
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

Allow the wrapper functions for IDR and ESR accesses to return an
error, and propagate read errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 53 ++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index df14b4513382..8fd2c38c821c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -247,27 +247,38 @@ static bool mpam_msc_check_aidr(struct mpam_msc *msc)
 	return true;
 }
 
-static u64 mpam_msc_read_idr(struct mpam_msc *msc)
+static int mpam_msc_read_idr(struct mpam_msc *msc, u64 *res)
 {
 	u32 idr_high = 0, idr_low;
+	int ret;
 
 	lockdep_assert_held(&msc->part_sel_lock);
 
-	mpam_read_partsel_reg(msc, IDR, &idr_low);
+	ret = mpam_read_partsel_reg(msc, IDR, &idr_low);
+	if (ret)
+		return ret;
+
 	if (FIELD_GET(MPAMF_IDR_EXT, idr_low))
-		mpam_read_partsel_reg(msc, IDR + 4, &idr_high);
+		ret = mpam_read_partsel_reg(msc, IDR + 4, &idr_high);
+	if (ret)
+		return ret;
+
+	*res = ((u64)idr_high << 32) | idr_low;
 
-	return ((u64)idr_high << 32) | idr_low;
+	return 0;
 }
 
-static void mpam_msc_clear_esr(struct mpam_msc *msc)
+static int mpam_msc_clear_esr(struct mpam_msc *msc)
 {
 	u32 esr_low;
+	int ret;
 
-	__mpam_read_reg(msc, MPAMF_ESR, &esr_low);
+	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
+	if (ret)
+		return ret;
 
 	if (!esr_low)
-		return;
+		return 0;
 
 	/*
 	 * Clearing the high/low bits of MPAMF_ESR can not be atomic.
@@ -277,18 +288,30 @@ static void mpam_msc_clear_esr(struct mpam_msc *msc)
 	 */
 	if (msc->has_extd_esr)
 		__mpam_write_reg(msc, MPAMF_ESR + 4, 0);
+
 	__mpam_write_reg(msc, MPAMF_ESR, 0);
+
+	return 0;
 }
 
-static u64 mpam_msc_read_esr(struct mpam_msc *msc)
+static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
 {
 	u32 esr_high = 0, esr_low;
+	int ret;
 
-	__mpam_read_reg(msc, MPAMF_ESR, &esr_low);
-	if (msc->has_extd_esr)
-		__mpam_read_reg(msc, MPAMF_ESR + 4, &esr_high);
+	ret = __mpam_read_reg(msc, MPAMF_ESR, &esr_low);
+	if (ret)
+		return ret;
+
+	if (msc->has_extd_esr) {
+		ret = __mpam_read_reg(msc, MPAMF_ESR + 4, &esr_high);
+		if (ret)
+			return ret;
+	}
+
+	*res = ((u64)esr_high << 32) | esr_low;
 
-	return ((u64)esr_high << 32) | esr_low;
+	return 0;
 }
 
 static void __mpam_part_sel_raw(u32 partsel, struct mpam_msc *msc)
@@ -993,7 +1016,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 	/* Grab an IDR value to find out how many RIS there are */
 	mutex_lock(&msc->part_sel_lock);
-	idr = mpam_msc_read_idr(msc);
+	mpam_msc_read_idr(msc, &idr);
 	mpam_read_partsel_reg(msc, IIDR, &msc->iidr);
 
 	mutex_unlock(&msc->part_sel_lock);
@@ -1009,7 +1032,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 	for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
 		mutex_lock(&msc->part_sel_lock);
 		__mpam_part_sel(ris_idx, 0, msc);
-		idr = mpam_msc_read_idr(msc);
+		mpam_msc_read_idr(msc, &idr);
 		mutex_unlock(&msc->part_sel_lock);
 
 		partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
@@ -2492,7 +2515,7 @@ static irqreturn_t __mpam_irq_handler(int irq, struct mpam_msc *msc)
 					   &msc->accessibility)))
 		return IRQ_NONE;
 
-	reg = mpam_msc_read_esr(msc);
+	mpam_msc_read_esr(msc, &reg);
 
 	errcode = FIELD_GET(MPAMF_ESR_ERRCODE, reg);
 	if (!errcode)
-- 
2.43.0


