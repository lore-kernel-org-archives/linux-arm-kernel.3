Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpV42nhPDLLjIKTd09rqBsZ8QlSA/XLOo7fuRinuWc8=; b=mKRl4gnb+UfQipoYuJm+tizI2n
	Sgax82NkvNVHJBs9eBp6gnZBE4DDvelNMyxvXtCpTH6MO5S8r7LwSqu1hnc1bSPgghjgxT/o9VGA6
	ihhTADfrdGGwfF9/wMmYU78DTJUwwf2+IZm6yt5dJvjgH+g8AhoCedcrncFWXzYWMpWDVo9DbZoo3
	PLycRnIeKqykBQWukESyPToEhK52aiFvAVHAqTdPsOwlYn75kcpW/knP44TOuE4veYpOaazSw0qhr
	xgz/K4zAa1WOsnf5dzKwAEiIzFER+cFSnWAjLj40nnIWUxgSoWuejnTEAOtlHyJ2NvcpL+xAjywVB
	tdJvfWnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUf-00000005796-2kSx;
	Fri, 10 Jul 2026 14:46:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUc-0000000575y-2Fp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:46:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEFAE1E7D;
	Fri, 10 Jul 2026 07:46:13 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11FF53F7B4;
	Fri, 10 Jul 2026 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694778; bh=2pHrFU7Umm9rnuCJmAgPuvEEJfJwWU858g8qZRQOwOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aCjfS0rwh6IRGf8I0ZliHfcrLOJz066V3ot8I1UprKJXeEy4t3F4KnXlUnEBLw0QJ
	 kdmy2Yj0ea5pJNOnD7Dnp3ReAaY6Pf9jaP52jeSzdHFJY+OpJ21rj6Ic2WaVlpsHsU
	 KA7RL1gOjIhkwOyBpvcYug5a8QtAfTVtJeQbGiRs=
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
Subject: [PATCH v3 11/16] arm_mpam: propagate MSC write errors for hardware probe functions
Date: Fri, 10 Jul 2026 16:45:15 +0200
Message-ID: <20260710144520.917375-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710144520.917375-1-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074618_657530_9051CE3B 
X-CRM114-Status: GOOD (  12.01  )
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

Allow the MSC write accesses in the hardware probe functions to return an
error, and propagate write errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 5a9760372666..222515a01b35 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -796,24 +796,30 @@ static bool mpam_ris_hw_probe_csu_nrdy(struct mpam_msc_ris *ris)
 
 	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, 0) |
 		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
-	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
+	if (mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel))
+		goto out_unlock;
 
 	/* Hardware might ignore nrdy if it's not enabled */
 	ctl_val = MSMON_CFG_CSU_CTL_TYPE_CSU;
 	ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
 	ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
 	ctl_val |= MSMON_CFG_x_CTL_EN;
-	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0);
-	mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val);
+	if (mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0))
+		goto out_unlock;
+	if (mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val))
+		goto out_unlock;
 
-	_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY);
+	if (_mpam_write_monsel_reg(msc, MSMON_CSU, MSMON___NRDY))
+		goto out_unlock;
 	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
 		goto out_unlock;
 	can_set = now & MSMON___NRDY;
 
-	_mpam_write_monsel_reg(msc, MSMON_CSU, 0);
+	if (_mpam_write_monsel_reg(msc, MSMON_CSU, 0))
+		goto out_unlock;
 	/* Configuration change to try and coax hardware into setting nrdy */
-	mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1);
+	if (mpam_write_monsel_reg(msc, CFG_CSU_FLT, 0x1))
+		goto out_unlock;
 	if (_mpam_read_monsel_reg(msc, MSMON_CSU, &now))
 		goto out_unlock;
 	can_clear = !(now & MSMON___NRDY);
@@ -1060,8 +1066,9 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 	for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
 		mutex_lock(&msc->part_sel_lock);
-		__mpam_part_sel(ris_idx, 0, msc);
-		ret = mpam_msc_read_idr(msc, &idr);
+		ret = __mpam_part_sel(ris_idx, 0, msc);
+		if (!ret)
+			ret = mpam_msc_read_idr(msc, &idr);
 		mutex_unlock(&msc->part_sel_lock);
 		if (ret)
 			return ret;
@@ -1080,9 +1087,11 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 		ris->idr = idr;
 
 		mutex_lock(&msc->part_sel_lock);
-		__mpam_part_sel(ris_idx, 0, msc);
-		ret = mpam_ris_hw_probe(ris);
+		ret = __mpam_part_sel(ris_idx, 0, msc);
+		if (!ret)
+			ret = mpam_ris_hw_probe(ris);
 		mutex_unlock(&msc->part_sel_lock);
+
 		if (ret)
 			return ret;
 	}
-- 
2.43.0


