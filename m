Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD35ACA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHyDQQWPZ3TZvTlC9dTIPV3kle3RIdYvEEb2q/nOwb8=; b=PSDCVyeObgXcSaR6A7f/6Hzqhu
	kFfmOIwANfMf0/krdKhH0azPM8AgDVniDg7aIfA7CyHU/Ry9PiAhemj8wKqH7cbiRE3Tzy1Ycy3Lu
	Bn6PwT5mRImgJV06fFh3oJpdsFAvP7ifDxv9gVovDSYfW71wXKQTdJqw9IxHFD7t0CvtfaXkoz6tv
	j3LRktXHxdY6uaLBA25Cy9is3L+fJ8ldhEbLIIyujKTsxMPwRU/xNB2V5D+sjRae89Tp0eSxpk8re
	blBBU9A8yO01nNiujYlkHm5CReLpOILFB4pGbhEKpDSG354Mt0k6+nugUjlq6o5Qi9Jw/bzlP2wAk
	PAQyVZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIoo-00000009Y4G-0wUx;
	Thu, 01 Oct 2026 15:35:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCIoj-00000009Xuq-2deu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:35:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BD711476;
	Thu,  1 Oct 2026 08:35:24 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 434893F86F;
	Thu,  1 Oct 2026 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790868927; bh=NiJDzWveMIkvZw75izO1egz+aEAX6DONLRpNMItQL9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qiFpuaU6XiMQ/kXy6XnLO1cQ21VwhMnggQN+3/Klf8I7I/iyY0aWnPkle5ioYDWWr
	 DRRFc6Kg7YCDjGGtbnFYPW8ODA13o3fVpqiaQMOar87bo0Wgo05IOPt3U0DhKRcVjP
	 eqalrYWAfmAuz85YwJhFaciSz42D1Pw344pD7PhI=
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
	Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-acpi@vger.kernel.org--cc,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 09/13] arm_mpam: propagate MSC access errors in mpam_reset_class_locked()
Date: Thu,  1 Oct 2026 17:34:34 +0200
Message-ID: <20261001153439.3295416-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001153439.3295416-1-andre.przywara@arm.com>
References: <20261001153439.3295416-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_083529_777193_AD260FBD 
X-CRM114-Status: GOOD (  14.23  )
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

The mpam_reset_ris() function can return an error, propagate this up
through mpam_reset_component_locked() to mpam_reset_class_locked(),
which is exported. The external caller is a void function, so cannot
really handle the error at the moment, but at least we report everything
on the MPAM interface side.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++------
 drivers/resctrl/mpam_internal.h |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 60f6a39176ea1..c639aaa5f38e1 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -3007,7 +3007,7 @@ static void mpam_enable_once(void)
 	       mpam_partid_max + 1, mpam_pmg_max + 1);
 }
 
-static void mpam_reset_component_locked(struct mpam_component *comp)
+static int mpam_reset_component_locked(struct mpam_component *comp)
 {
 	struct mpam_vmsc *vmsc;
 
@@ -3021,26 +3021,38 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
 				 srcu_read_lock_held(&mpam_srcu)) {
 		struct mpam_msc *msc = vmsc->msc;
 		struct mpam_msc_ris *ris;
+		int ret;
 
 		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
 					 srcu_read_lock_held(&mpam_srcu)) {
-			if (!ris->in_reset_state)
-				mpam_touch_msc(msc, mpam_reset_ris, ris);
+			if (!ris->in_reset_state) {
+				ret = mpam_touch_msc(msc, mpam_reset_ris, ris);
+				if (ret)
+					return ret;
+			}
 			ris->in_reset_state = true;
 		}
 	}
+
+	return 0;
 }
 
-void mpam_reset_class_locked(struct mpam_class *class)
+int mpam_reset_class_locked(struct mpam_class *class)
 {
 	struct mpam_component *comp;
+	int ret;
 
 	lockdep_assert_cpus_held();
 
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(comp, &class->components, class_list,
-				 srcu_read_lock_held(&mpam_srcu))
-		mpam_reset_component_locked(comp);
+				 srcu_read_lock_held(&mpam_srcu)) {
+		ret = mpam_reset_component_locked(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static void mpam_reset_class(struct mpam_class *class)
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 68a6cf2b9cc73..09f8168fb4d2c 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -465,7 +465,7 @@ void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
 
 /* Reset all the RIS in a class under cpus_read_lock() */
-void mpam_reset_class_locked(struct mpam_class *class);
+int mpam_reset_class_locked(struct mpam_class *class);
 
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg);
-- 
2.43.0


