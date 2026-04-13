Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2CBEBFD1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4UyPVTRcZ3XGIKT+x6CF9L5buHORlMCnapP9Kds0+s=; b=g80Dl6P2A7K1kYTZjv0Cx4b3JZ
	7W25ItwhvI4SueuS+We4YNYr54wHW8XsnXfYjklhhXpYRWWEq/oync/owCz+G909mJixE30lmjUPU
	1q7tkOQbBZmAXaJOyMVDzHEcJkcNc+VX37Q+ggaRHfcsYkRzanp8okgnx8jacIQZmZ/nkxm32rNGg
	LzWFqCSFt0z3X07lPuMzDAJnoYITmwOK7+LGArrKWQ2zj87kQIw5wsHYRgWJ8hcxxvWGnavUW84hI
	skVn28hNB6Do7amtduTbicdf8io5yX4ZxIfPWcqK07bj5S1JSzeVt/f5U3gZcU6kXZr2i24f2bA6M
	eSmzISjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4h-0000000FJM4-0612;
	Mon, 13 Apr 2026 08:55:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD4e-0000000FJK2-1rIq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l4UyPVTRcZ3XGIKT+x6CF9L5buHORlMCnapP9Kds0+s=; b=iwBXDI+pzDimtZhpNKNJLoFTL5
	z02wxUzVNh7V67xliFE71718de5EkTuqoT+meCBp7f+di7JMKaqlDP7bYMyR74o/aoIoiLe1STO8v
	A6XgtiQNQ09i1GvEGUhe88IEuVOlBUHjVsLdk94WGoeMhn4HWON/0BNZ81MVl8k1pUJ5pW4amZ0Xp
	Fc6fVD9kjrvJs96JEkgaJbn8oxuBx66XxqBS5yuJaHr3EWYqxgXfBF2fLWOOi3IY6qXpxILChauY4
	kSdJ+QJQCIN7fdSNV7PWEXIgm3NlrfBZ2nyqkfStEei/JCzP2h/qdWiwLpYTPMwPxVFEe+Rg+3xrS
	OOGkqavQ==;
Received: from [113.46.200.217] (helo=canpmsgout02.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD47-0000000GR5O-1G6e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=l4UyPVTRcZ3XGIKT+x6CF9L5buHORlMCnapP9Kds0+s=;
	b=cXDJeFcNmlh9tCWenmToLebL6axovKN79nys0U3QaeT8+1QS7kWxxWEp2aKPWYWOglE9Bc+yj
	jW/sRq5uagDutz2jf5HSqamvJvQNYJdJXqKz13NugWch7wDdp7VgpOVTIU+xaX+qmr1IBOlkjD5
	rQTTeUkkrt4JFtb8X9C97QI=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fvLdh0VBkzcZyv;
	Mon, 13 Apr 2026 16:47:52 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 71BA340576;
	Mon, 13 Apr 2026 16:54:18 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:17 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 05/10] arm_mpam: Propagate control group config to sub-monitoring groups
Date: Mon, 13 Apr 2026 16:54:00 +0800
Message-ID: <20260413085405.1166412-6-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260413085405.1166412-1-zengheng4@huawei.com>
References: <20260413085405.1166412-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095444_157582_85B668CB 
X-CRM114-Status: GOOD (  14.36  )
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

With the Narrow-PARTID feature, each control group is assigned multiple
(req)PARTIDs to expand monitoring capacity. When a control group's
configuration is updated, all associated sub-monitoring groups (each
identified by a unique reqPARTID) should be synchronized.

In __write_config(), iterate over all reqPARTIDs belonging to the
control group and propagate the configuration to each sub-monitoring
group:

  * For MSCs supporting Narrow-PARTID, establish the reqPARTID to
    intPARTID mapping.
  * For MSCs without Narrow-PARTID support, synchronize the configuration
    to new PARTIDs directly.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index cf067bf5092e..8fbc8f9f9688 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1547,6 +1547,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 {
 	u32 pri_val = 0;
 	u16 cmax = MPAMCFG_CMAX_CMAX;
+	u16 intpartid = req2intpartid(partid);
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_props *rprops = &ris->props;
 	u16 dspri = GENMASK(rprops->dspri_wd, 0);
@@ -1556,15 +1557,17 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	__mpam_part_sel(ris->ris_idx, partid, msc);
 
 	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
-		/* Update the intpartid mapping */
 		mpam_write_partsel_reg(msc, INTPARTID,
-				       MPAMCFG_INTPARTID_INTERNAL | partid);
+				       MPAMCFG_INTPARTID_INTERNAL | intpartid);
 
 		/*
-		 * Then switch to the 'internal' partid to update the
-		 * configuration.
+		 * Mapping from reqpartid to intpartid already established.
+		 * Sub-monitoring groups share the parent's configuration.
 		 */
-		__mpam_intpart_sel(ris->ris_idx, partid, msc);
+		if (partid != intpartid)
+			goto out;
+
+		__mpam_intpart_sel(ris->ris_idx, intpartid, msc);
 	}
 
 	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
@@ -1631,6 +1634,7 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	mpam_quirk_post_config_change(ris, partid, cfg);
 
+out:
 	mutex_unlock(&msc->part_sel_lock);
 }
 
@@ -1755,11 +1759,28 @@ struct mpam_write_config_arg {
 	u16 partid;
 };
 
+static u32 get_num_reqpartid_per_intpartid(void)
+{
+	return (mpam_partid_max + 1) / (mpam_intpartid_max + 1);
+}
+
 static int __write_config(void *arg)
 {
+	int closid_num = resctrl_arch_get_num_closid(NULL);
 	struct mpam_write_config_arg *c = arg;
+	u32 reqpartid, req_idx;
 
-	mpam_reprogram_ris_partid(c->ris, c->partid, &c->comp->cfg[c->partid]);
+	/* c->partid should be within the range of intPARTIDs */
+	WARN_ON_ONCE(c->partid >= closid_num);
+
+	/* Synchronize the configuration to each sub-monitoring group. */
+	for (req_idx = 0; req_idx < get_num_reqpartid_per_intpartid();
+	     req_idx++) {
+		reqpartid = req_idx * closid_num + c->partid;
+
+		mpam_reprogram_ris_partid(c->ris, reqpartid,
+					 &c->comp->cfg[c->partid]);
+	}
 
 	return 0;
 }
-- 
2.25.1


