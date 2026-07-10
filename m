Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhmNAVrxp+kpbKZAXQVKvw87Cci9yx7Yw4rGJNy9KTk=; b=Z1pmX/KiN9lT3VqMd+t11UELAf
	WXchbl3nIkuAdX5UM0Y3O7Vq4BUXM7VIKiJ4ecClkRFGC/e/XlptrJR3AM0XK5zxCZE8GCIy6zsAn
	4KGqdWRclB4ma5P4eCuj+4r5u1zFOZuSIy0eEJOQva4/g1IO/MrCJhejdASKdhkexoNdQIlCl6M+X
	tH61dqCmWcdqIZ9B2n+I9tWcS7A2s0lArMVRdVe9xEImgzPdfD3+Tko3GEE98AOjfOs3sJAqmq4VO
	FFYvm1VUod1nVd7XP1flsUrcmgCpO7gXviCxPAsH041qDULjNDBOB+z0U/m0wuYd+2RFMHIP24Cnl
	eDpwKhCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUL-000000056rE-0Qp0;
	Fri, 10 Jul 2026 14:46:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCUI-000000056pd-2Elo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:45:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 035571E7D;
	Fri, 10 Jul 2026 07:45:52 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A57A3F7B4;
	Fri, 10 Jul 2026 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694756; bh=LtzgxM6qOWpziK1YO1CIa7BsMHy549pWpqPWc8ykDbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BCzW7xgswr7TO5SXyFGV8R5x6zC6Q8mWHK9UpTDCmU1+aD70CWYDzA6eiKV9hMHDt
	 P7N3ec9IKfuqZSd6BGOPJokMFoAgUvBj7ZAxxyvurQmnfNpWd2IgkRlL4nAf12Z22q
	 +ZaIrK/xEB6BgMHLmC+LQ2+xJ5lxARfAzKkPFkQU=
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
Subject: [PATCH v3 06/16] arm_mpam: propagate MSC read errors for __ris_msmon_read()
Date: Fri, 10 Jul 2026 16:45:10 +0200
Message-ID: <20260710144520.917375-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710144520.917375-1-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074558_649652_7B658BC7 
X-CRM114-Status: GOOD (  14.83  )
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

Allow the function for RIS accesses to return an error, and propagate
read errors from the lower level up.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 041fca018e68..84a8715464be 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1297,6 +1297,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
 	return overflow_val;
 }
 
+/*
+ * This function might be called via smp_call_function_any(), so propagate
+ * errors inside the arg struct.
+ */
 static void __ris_msmon_read(void *arg)
 {
 	u64 now;
@@ -1339,7 +1343,9 @@ static void __ris_msmon_read(void *arg)
 	 * Read the existing configuration to avoid re-writing the same values.
 	 * This saves waiting for 'nrdy' on subsequent reads.
 	 */
-	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	ret = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
+	if (ret)
+		goto out_unlock;
 
 	if (mpam_feat_msmon_mbwu_31counter == m->type)
 		overflow = cur_ctl & MSMON_CFG_x_CTL_OFLOW_STATUS;
@@ -1364,7 +1370,9 @@ static void __ris_msmon_read(void *arg)
 
 	switch (m->type) {
 	case mpam_feat_msmon_csu:
-		mpam_read_monsel_reg(msc, CSU, &now32);
+		ret = mpam_read_monsel_reg(msc, CSU, &now32);
+		if (ret)
+			goto out_unlock;
 		nrdy = now32 & MSMON___NRDY;
 		now = FIELD_GET(MSMON___VALUE, now32);
 
@@ -1385,7 +1393,9 @@ static void __ris_msmon_read(void *arg)
 			else
 				now = FIELD_GET(MSMON___L_VALUE, now);
 		} else {
-			mpam_read_monsel_reg(msc, MBWU, &now32);
+			ret = mpam_read_monsel_reg(msc, MBWU, &now32);
+			if (ret)
+				goto out_unlock;
 			nrdy = now32 & MSMON___NRDY;
 			now = FIELD_GET(MSMON___VALUE, now32);
 		}
@@ -1748,6 +1758,7 @@ static int mpam_restore_mbwu_state(void *_ris)
 {
 	int i;
 	u64 val;
+	int ret = 0;
 	struct mon_read mwbu_arg;
 	struct mpam_msc_ris *ris = _ris;
 	struct mpam_class *class = ris->vmsc->comp->class;
@@ -1760,10 +1771,14 @@ static int mpam_restore_mbwu_state(void *_ris)
 			mwbu_arg.val = &val;
 
 			__ris_msmon_read(&mwbu_arg);
+			if (mwbu_arg.err) {
+				ret = mwbu_arg.err;
+				break;
+			}
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 /* Call with MSC cfg_lock held */
-- 
2.43.0


