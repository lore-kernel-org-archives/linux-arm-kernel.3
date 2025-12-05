Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4791D374B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KMJft9SbFwbA9TqChFsUJqYWAl8y/B6e9lXHJUgwuk=; b=whJ1vtPO44zAM2E63cZ4xOGysW
	tXWH9lc9GgwnNLCefMIybAUDYoADt+2UNgoUpmyBkuoGS6agpaPuHjbSMYTTtsNX4fqf3Drj8Cwwf
	Ft2FBAZiL+UhFnuzBolznbQLYIFwKFMqOnbWMZdLoak6IZVgLaUSZqLtcIUGAg4jSCcIo3L8wx+/n
	DpoytrGII2CIO2Lz0IOYwQQkmogH3CHkf4efEKahtGntByb4KO9XZsppsyxKPvoQDBgQZV4Sjb2ic
	cjnYrylG9fQttwx7gwOVyouNrRAHT7okgTcocSRatLX+hLA5CREO0WrqJaA10blT8M+xeP/2tF2WB
	P6Kg3+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrq-0000000A6sx-2356;
	Fri, 05 Dec 2025 22:01:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdrq-0000000A6rD-07Ig
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 22:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5KMJft9SbFwbA9TqChFsUJqYWAl8y/B6e9lXHJUgwuk=; b=KQW4+AI8sEhVNWPwPCktxXCvVE
	9ZdRi6pin8+2WU1dCyIXpXJz7+Tu+DO+nhhl/REoTpHT5oKEufoS6PFjdyrPCjep9rc79pRKFKO5v
	phEJbKsHv5ObAbIefeFgtV7TPH03QQ8qxVQRWFl1JBsaB3ZwYKVs6Mx0pDx/1/xXo7erVgvGzVJeN
	pJ9Iu3H1acLq3PUv3kuvOQAjI396iWcR8bEowr8XU/YantYQzmpA4QoagSGFM81YmKwO7v4t5ritc
	iVmXqgGf1vQ9AAVf3aDYu4ndWuYlXH8+24m6cX3XyC5p2PHLSxhSNect6/a7YetK/nFyF90Vw3Te5
	7opu5dOw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRd04-00000006sf9-1mFK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:06:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D95C81BCA;
	Fri,  5 Dec 2025 14:01:10 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75DCF3F740;
	Fri,  5 Dec 2025 14:01:14 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 27/38] arm_mpam: resctrl: Add empty definitions for assorted resctrl functions
Date: Fri,  5 Dec 2025 21:58:50 +0000
Message-Id: <20251205215901.17772-28-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_210608_849172_35FAE1E9 
X-CRM114-Status: GOOD (  11.31  )
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

A few resctrl features and hooks need to be provided, but aren't needed
or supported on MPAM platforms.

resctrl has individual hooks to separately enable and disable the
closid/partid and rmid/pmg context switching code. For MPAM this is all
the same thing, as the value in struct task_struct is used to cache the
value that should be written to hardware. arm64's context switching code
is enabled once MPAM is usable, but doesn't touch the hardware unless
the value has changed.

For now event configuration is not supported, and can be turned off
by returning 'false' from resctrl_arch_is_evt_configurable().

Add this, and empty definitions for the other hooks.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 17 +++++++++++++++++
 include/linux/arm_mpam.h       |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 1333dc40714a..00455de3efe9 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -85,6 +85,23 @@ bool resctrl_arch_mon_capable(void)
 	return exposed_mon_capable;
 }
 
+bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt)
+{
+	return false;
+}
+
+void resctrl_arch_mon_event_config_read(void *info)
+{
+}
+
+void resctrl_arch_mon_event_config_write(void *info)
+{
+}
+
+void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
+{
+}
+
 bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
 {
 	switch (rid) {
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index 86d5e326d2bd..f92a36187a52 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -67,6 +67,15 @@ struct rdt_resource;
 void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
 void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid, void *ctx);
 
+/*
+ * The CPU configuration for MPAM is cheap to write, and is only written if it
+ * has changed. No need for fine grained enables.
+ */
+static inline void resctrl_arch_enable_mon(void) { }
+static inline void resctrl_arch_disable_mon(void) { }
+static inline void resctrl_arch_enable_alloc(void) { }
+static inline void resctrl_arch_disable_alloc(void) { }
+
 static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
 {
 	return val;
-- 
2.39.5


