Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5df2dEGoVDrXi0MrbqhBR2r+mtCoif7G/5zEmqIUks=; b=kOdLh6ImXx85e/5nU3+LE4mw+P
	JxltMHtnbAMkEOItlNrL5qPNrxWJGhd6Pk45C9YlIoVvHPj39D52yGwpjuXDkQMonES6OUfdYXwOJ
	+OsUmb+Ute9s+a413vRg02VWY9g+s81+i5xiJ646EOYoTJkY7CR5f2i+VdbM3/xyaaGwlH2uOaJ37
	1OaD5PGL6+Tn58NRAL8wMiFn+P4I3gajHPtAiTgdOEaNx9KtDLS45BySwspJVLRyr2/nEBLTl80Ul
	rkIMyieGMg8uQfKx3tXGUYwedxa15rcJe/QCZCEWE/QnBpCSJMWlF7U/KtTDt+/q51zPVdYnNAGab
	B4VMkq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUb-0000000574y-2LQV;
	Fri, 10 Jul 2026 14:46:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUY-0000000572a-1zjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:46:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AF671E7D;
	Fri, 10 Jul 2026 07:46:09 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B238D3F7B4;
	Fri, 10 Jul 2026 07:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694773; bh=ogl0fMh5WU6VJSws2gIeOWaSXLclkidHw1Ey9bZ1MlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m78dra9NtYDCz3Pc8dqfPXL1nq02ONMHAzrEYB0LhGwj7ofWsi8YUfWMj2nLyTFtL
	 9GSYUo4qzJ3c/W/sqafPp7mgLoiRRqwIsicmbUl25fNZsttlHQlLoRI+IZtCGuWNyE
	 AydYSQH+X3fD0iderBLIt/0ubxLkl1PV30X8EsLs=
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
Subject: [PATCH v3 10/16] arm_mpam: propagate MSC write errors for ESR and part_sel wrappers
Date: Fri, 10 Jul 2026 16:45:14 +0200
Message-ID: <20260710144520.917375-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710144520.917375-1-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074614_606435_53DDA9A4 
X-CRM114-Status: GOOD (  10.46  )
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
index f1e40ce24f5a..5a9760372666 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -288,12 +288,13 @@ static int mpam_msc_clear_esr(struct mpam_msc *msc)
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
@@ -316,28 +317,28 @@ static int mpam_msc_read_esr(struct mpam_msc *msc, u64 *res)
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


