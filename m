Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C989CCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23u6c6wAiukBMM/ViQM3jIJQ912/6WtFhRpDoVE10oE=; b=ifGIm5J2QqxR4KQpjvQpG63ejn
	5WBNIeyA3Nea9P3eb7LtSHJuJVv2fQYjO1l0au6+euPP31fpWoIrvvVJIyNjJMY7OOiIaq1KtqUK1
	7S0qErjhqNgwjaUzymDDw5JAfNNB+imbhBar5i76mq49wEcQ4AQIFp4CTthaHfyEMKQLaBoKjKchS
	H2f9U3hQG4tgvqLTrsKAj+XS7HRZiA/IUI7B+0vCTJJKquRkR9ZoxeashxQJ7kwSvFevGTKJCBJ2V
	iiVyJDjA+rgDxpT1JAWD7NMVZCOAMWRIvBGY5s56FkvqKpHFzaIvd5E3Puwf+wQZ7NyWxcdl30+MQ
	7kaBp5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFg-0000000CCB7-0vOn;
	Fri, 02 Oct 2026 17:40:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChFV-0000000CBt9-3Ph0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Oct 2026 17:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=23u6c6wAiukBMM/ViQM3jIJQ912/6WtFhRpDoVE10oE=; b=pR88+oryOcEXXLb9ovdHOhEbEV
	i6DdY0f/YjTlKRie9TQ5kHqC3nI+k5Jr2COW9Oo1OXQENT5+hB0o1MDqAp17A0dZ7/vYxHCI8CWY6
	UoT0wKfiMObAQzYVzz8P0IkR7uVFu7HQRhriLeCuX8t9JhlE7a5pttDotBqVl756QjRxdvX2YYZIb
	gYCYwuj5dDuQ0FUCU0MR9nCZWrZ0bV7truiWPHeSxfG1e3fL5CYWG26JUdYczlqjUSf1xJSsYfiGM
	Qts1ns2LzdgJxx8/OMlrgeLPUl5ABBPqFStGaxCyMg3uGIsqkIoKwiwkRJln+t93yiwdn9EzeMqTb
	Tt9q2HKw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xChFP-00000006BPW-3as6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE78A169C;
	Fri,  2 Oct 2026 10:40:28 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 132E33F85F;
	Fri,  2 Oct 2026 10:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962832; bh=SnUdvfiEjAccc9CGtumN3Zv4XazTi/Tv1JxiKrxUya0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SHb5FPoM3W858NZ3Db4h7GTUwsXRJFkMVuFVZlAgjuj/Fs7SupjJY9HZ2vCkvIAi2
	 ehmIpBeXlkqLRa7mFujq/di7rUdYb0Oq5+8cwjN2hRhxUrwsv8DjUwtZ4FzwN+FgbF
	 XaDnQ6cjTnAewwpFfhlb8vE1Z1RK1Lfuy9PG750g=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 23/27] arm_mpam: propagate MSC access errors in mpam_reset_class_locked()
Date: Fri,  2 Oct 2026 18:39:36 +0100
Message-ID: <20261002173941.292319-24-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_184042_926795_79C1B6C2 
X-CRM114-Status: GOOD (  16.05  )
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

From: Andre Przywara <andre.przywara@arm.com>

The mpam_reset_ris() function can return an error, propagate this up
through mpam_reset_component_locked() to mpam_reset_class_locked(),
which is exported. The external caller is a void function, so cannot
really handle the error at the moment, but at least we report everything
on the MPAM interface side.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++------
 drivers/resctrl/mpam_internal.h |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c0f51d41e7fe..31f4826ab399 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -3040,7 +3040,7 @@ static void mpam_enable_once(void)
 	       mpam_partid_max + 1, mpam_pmg_max + 1);
 }
 
-static void mpam_reset_component_locked(struct mpam_component *comp)
+static int mpam_reset_component_locked(struct mpam_component *comp)
 {
 	struct mpam_vmsc *vmsc;
 
@@ -3054,26 +3054,38 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
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
index 68a6cf2b9cc7..09f8168fb4d2 100644
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
2.53.0


