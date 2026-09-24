Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4806C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDejXxFYplkrm1qmH8idxqD8+B6OvWCuXvNwo/WXNMU=; b=slyjts/4g+TOg8JIPVPR+xGzz+
	0CzwugTA/w0jeAlMz6hYzxFZP6m0CoYKfe64UpBHA36AO5OuDMUJbLeZ6UsPFtemENxe/9xbFZOuN
	h+4rDOIXomRuFzhnv6S320FBbHCIKRnzfBH3F/ZNGGj4E5D2MBwqj+IKgWwbAN9lOJ29ued7XjPUg
	NZZwpicm1puuQgg7VOlqshe2DTsNhp02SFT8A8sjWWSmbW19JLets5l9CH+iSaywmRJKD42tcg/2D
	PhlyX3RjnmSelxNZX5tQwzi2ULTzBlia/iccwdWCn+Hpf2rN5MbPUFB11CYL9v++EQuGTR054ERhl
	QDsdPR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNr-0000000BPNK-1v26;
	Thu, 24 Sep 2026 15:29:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNf-0000000BPEJ-1JFY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 927311D6F;
	Thu, 24 Sep 2026 08:28:58 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.8.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5BB33F86F;
	Thu, 24 Sep 2026 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790263742; bh=ednoOePGVW1sykn3VGIVtNz9LP2Jute7Y1pUUhwMwWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WWcfxLP5NuofZdrVkv4ILVBZg8S9mc2XZE5NyvZYhLfRnUsjY5cNWg8rjINAS+xn3
	 vAlsZfusC0wjQ98GFF2/0oXMqPnNsr4w+Qt5LbzNQ/ltRVucVpljPeCawWLbt5LoEh
	 LW2VY0QF4Y+XSX4PA1BmyyKbJCpzCqf7zX2usDl8=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 09/13] arm_mpam: propagate MSC access errors in mpam_reset_class_locked()
Date: Thu, 24 Sep 2026 17:27:35 +0200
Message-ID: <20260924152739.2865510-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924152739.2865510-1-andre.przywara@arm.com>
References: <20260924152739.2865510-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082903_481546_4121EBD6 
X-CRM114-Status: GOOD (  14.49  )
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
---
 drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++------
 drivers/resctrl/mpam_internal.h |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index eb26c25b9f970..6d1fda949a05c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2994,7 +2994,7 @@ static void mpam_enable_once(void)
 	       mpam_partid_max + 1, mpam_pmg_max + 1);
 }
 
-static void mpam_reset_component_locked(struct mpam_component *comp)
+static int mpam_reset_component_locked(struct mpam_component *comp)
 {
 	struct mpam_vmsc *vmsc;
 
@@ -3008,26 +3008,38 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
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


