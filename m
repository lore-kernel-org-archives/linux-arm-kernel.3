Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238CC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iXh7oBuE;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=A2JKsc/p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VfH9B+E9dqXOIB2s/gv1jCxzMLtqQkhz9uQML4pHmeg=; b=iXh7oBuElleYtKM0Jbu/B6a4gi
	pRkJeX1Qb6K46evRCrVklRUcES6OGOkI0IDEDcvsiLkONEVHNSQY4pVLOjgYo4JAyOZ16kRomPdBY
	7UxUUpyM7mrwzotc0Qo6H8VAoJoMXbY7ut1ku90lJCk07S18VIiCZqFlVG0KG9dyCVxC2zlSFsHwV
	PyPIZN6ez1pDxl2rSFTYAlY3eQpQkq9CRXP51SSm9rApFXWj0Ye7ZNPLLEy2WibrTeqWK0jI8oKzU
	2xaW+C+7+2+MqStwtu0jmG8shqRcdiS4+ZiNqvqYg6vKcCPSousAvx/OyQAoBnHwVvb4KW3STYGR0
	jlZCy9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPOF-00000009CAF-2vHR;
	Thu, 29 Oct 2026 12:37:55 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPNG-00000009AYH-2rC2;
	Thu, 29 Oct 2026 12:36:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VfH9B+E9dqXOIB2s/gv1jCxzMLtqQkhz9uQML4pHmeg=;
	b=A2JKsc/p2rsqvUX25OEKjQiwuKAh+SoR+qkwpyrmJrxqO7Lx0/+jmAEae84XT/TjUUjti0k8z
	DtvVhPH0yav8KQ21rO1HHbzyo+gFbQjZc11fx2w3Qy4+LP7AMpsjRqny85TQ1pfXhcchOLAToV+
	LX+kc9XXvjc76GNAeCrvvpY=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHt2pT4zKm61;
	Thu, 29 Oct 2026 20:36:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 25CFD40572;
	Thu, 29 Oct 2026 20:36:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 18/19] arm_mpam: resctrl: Expose the L2 monitor events
Date: Thu, 29 Oct 2026 20:36:10 +0800
Message-ID: <20261029123611.1108424-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_053655_045922_27374A36 
X-CRM114-Status: GOOD (  11.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allow an L2 cache class to supply the CSU counters for l2c_occupancy and
the MBWU counters for mbm_core_bytes.

The L2 bandwidth event is a normal MBM event, so resctrl gives it a
counter for the life of the monitoring group. MBWU needs that: rewriting
the PARTID/PMG filter restarts the byte count, so the filter must stay
in place while traffic is counted. CSU occupancy is only a snapshot and
can still borrow a monitor for each read.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index b9487f3c648d..62214557b673 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1123,9 +1123,10 @@ static void mpam_resctrl_pick_counters(void)
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
-		/* The name of the resource is L3... */
-		if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
-			pr_debug("class %u is a cache but not the L3", class->level);
+		if (class->type == MPAM_CLASS_CACHE && class->level != 2 &&
+		    class->level != 3) {
+			pr_debug("class %u is a cache but not L2 or L3",
+				 class->level);
 			continue;
 		}
 
@@ -1145,7 +1146,10 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(RDT_RESOURCE_L3, QOS_OCCUP_EVENT_ID, class);
+				counter_update_class(class->level == 2 ?
+						     RDT_RESOURCE_L2 :
+						     RDT_RESOURCE_L3,
+						     QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
@@ -1169,6 +1173,14 @@ static void mpam_resctrl_pick_counters(void)
 			 */
 			counter_update_class(RDT_RESOURCE_L3, QOS_MBM_TOTAL_EVENT_ID, class);
 		}
+
+		if (class->type == MPAM_CLASS_CACHE && class->level == 2 &&
+		    class_has_usable_mbwu(class)) {
+			pr_debug("class %u has usable MBWU for the L2 resource\n",
+				 class->level);
+			counter_update_class(RDT_RESOURCE_L2,
+					     QOS_MBM_TOTAL_EVENT_ID, class);
+		}
 	}
 }
 
-- 
2.34.1


