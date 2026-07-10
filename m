Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81159C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDFJDbM9P4+6AfnSrb6JsQgLn1+yZcj94St0flizZFI=; b=rTQGIcSbQlY6ESb+sWUB4gs3zp
	i6gzCvxuBBEwqYMpP3IMH4VaG1GqIwzVojvwV+C6B5Jy9zbj3J/bPpaHfbiCbG0EzRKJW3h4+1v4I
	Dt5cTGzvR0LMQ1DIo0E8hvbLob+p6FBs5eIjzm4gEv5J7+ZkLomS9WPUuPmXjHqHK304MtkKLEDrs
	GadrhCzZQiNoNLP0q9e0DtGkvO5KovImdjzY0Er+AaOH6uUNORSqM3WyeiBS6fhKRSjM5fMqvkePQ
	v75uTDuq6REHCbbApPfWyRhxG6gNXHkjdtFIZEYVVLQcf3+6NjAK0oHSjvzGtdOnAYLYhWqfq7Sok
	FaGCSK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUT-000000056yU-1XEg;
	Fri, 10 Jul 2026 14:46:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUP-000000056uW-2Yrc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:46:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A78FE1E7D;
	Fri, 10 Jul 2026 07:46:00 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B18A3F7B4;
	Fri, 10 Jul 2026 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694764; bh=/+6R3eFkL7zhJ6QLHEoIuYVLxaDoPmOxKrviB6wcBEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwWAIFNn0Az1oWoOcksfvvZSTncWJV5eYZVyx1tZ1mkVDbYrk7hoHk3mDYdnCaZ/x
	 FKiRdFYq5Sc8qQriVhimJ7A6bX/PwMXZqYfgmTxAQut4j+RVX8876yJiYlJXmizabv
	 x2+bJ27u3V4vH1iXU+5eg1xF8jcaBpF+83pAe2+s=
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
Subject: [PATCH v3 08/16] arm_mpam: propagate MSC read errors for state saving functions
Date: Fri, 10 Jul 2026 16:45:12 +0200
Message-ID: <20260710144520.917375-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710144520.917375-1-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074605_727884_3BD83310 
X-CRM114-Status: GOOD (  12.47  )
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

Allow the mpam_save_mbwu_state() function to return an error, and
propagate read errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 530ac0fe97b5..b2ecaba29fcc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1782,7 +1782,7 @@ static int mpam_save_mbwu_state(void *arg)
 {
 	int i;
 	u64 val;
-	int ret = 0;
+	int ret;
 	struct mon_cfg *cfg;
 	u32 cur_flt, cur_ctl, mon_sel;
 	struct mpam_msc_ris *ris = arg;
@@ -1799,8 +1799,12 @@ static int mpam_save_mbwu_state(void *arg)
 		mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, i) |
 			  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
 		mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
-		mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
-		mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
+		ret = mpam_read_monsel_reg(msc, CFG_MBWU_FLT, &cur_flt);
+		if (ret)
+			goto out_unlock;
+		ret = mpam_read_monsel_reg(msc, CFG_MBWU_CTL, &cur_ctl);
+		if (ret)
+			goto out_unlock;
 		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
 
 		if (mpam_ris_has_mbwu_long_counter(ris)) {
@@ -1811,20 +1815,24 @@ static int mpam_save_mbwu_state(void *arg)
 		} else {
 			u32 val32;
 
-			mpam_read_monsel_reg(msc, MBWU, &val32);
+			ret = mpam_read_monsel_reg(msc, MBWU, &val32);
+			if (ret)
+				goto out_unlock;
+
 			val = val32;
 			mpam_write_monsel_reg(msc, MBWU, 0);
 		}
 
-		cfg->mon = i;
-		cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
-		cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
-		cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
-		mbwu_state->correction += val;
-		mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
+		if (val != MSMON___L_NRDY) {
+			cfg->mon = i;
+			cfg->pmg = FIELD_GET(MSMON_CFG_x_FLT_PMG, cur_flt);
+			cfg->match_pmg = FIELD_GET(MSMON_CFG_x_CTL_MATCH_PMG, cur_ctl);
+			cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
+			mbwu_state->correction += val;
+			mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
+		}
 		mpam_mon_sel_unlock(msc);
 	}
-
 	return 0;
 
 out_unlock:
-- 
2.43.0


