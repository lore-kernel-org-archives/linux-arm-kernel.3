Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wEzV5bNf;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=o9xzZVg0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=blji6EsncC02jabiZ6XFQjZLweyuE5ilKCRUIDmsUIk=; b=wEzV5bNfFd8tCEsI4IbLPnfENp
	J5gFMsq/aWRnaUj+U+aRRB04+MNcniChNquae/HEfZfGAMhJ62lq/PA4tn0OljSG0EfPQzDZVB8hH
	FOj261Nsq5aJ13GrF2eV5fIPxaBml1tj6vQVR1QAhd5UMwOd5hXEjIaG/9R38UKpWVrfS1PYxxzou
	NFPP016OEsWwO8Oo2SynPUPs9GTd54iBkzE6XKh2P310InwukGRjhIyIVuZANEnU3BL/TVqj55Lt8
	FCalMEbCADSmHHhpHNcj9KZ80p/6XIe7r+PIcG4Rv0yTstpLVHvvs594b6dKjWwgFTjsofO86WYVu
	42F+YEqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY2N-00000004yII-1eVv;
	Wed, 04 Nov 2026 10:16:11 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY2J-00000004yH6-40NT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:16:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=blji6EsncC02jabiZ6XFQjZLweyuE5ilKCRUIDmsUIk=;
	b=o9xzZVg0fOxBJlAD+nBxyvw2tTHS6Skeo/45Cxe4pA078r/AihD17TRdj6Qm1Xax7H+bOedeq
	vWcbeQY6bJTonQ5DHgg0oC47ip6VNJHqtEERD3jnRCd73gi3uFh1JHm1CXXRtdBp77xJXFDbY1i
	AeePRK3miMx68nksgLj8ZGs=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jKLtX1ymmzLlXh;
	Wed,  4 Nov 2026 18:15:48 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 240724055B;
	Wed,  4 Nov 2026 18:15:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 18:15:58 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <andre.przywara@arm.com>,
	<jonathan.cameron@oss.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] arm_mpam: Restore the cached configuration when a write to an MSC fails
Date: Wed, 4 Nov 2026 18:15:41 +0800
Message-ID: <20261104101541.563113-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_021608_486909_25AE511E 
X-CRM114-Status: GOOD (  13.01  )
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

mpam_apply_config() caches the new configuration before writing it to
the RISes. When mpam_touch_msc() fails, the cache keeps the new values,
so a retry with the same schemata is skipped as a no-op and never
reaches the hardware.

Restore the cached configuration on failure so the retry writes it to
the RISes again.

Only arm64 MPAM systems are affected; x86 does not support MPAM.

Fixes: 60e33a1864fd ("arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.4.x
---
 drivers/resctrl/mpam_devices.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..bb667a416660 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -3412,6 +3412,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg)
 {
+	struct mpam_config old_cfg = comp->cfg[partid];
 	struct mpam_write_config_arg arg;
 	struct mpam_msc_ris *ris;
 	struct mpam_vmsc *vmsc;
@@ -3439,8 +3440,10 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 					 srcu_read_lock_held(&mpam_srcu)) {
 			arg.ris = ris;
 			ret = mpam_touch_msc(msc, __write_config, &arg);
-			if (ret)
+			if (ret) {
+				comp->cfg[partid] = old_cfg;
 				return ret;
+			}
 			ris->in_reset_state = false;
 		}
 	}
-- 
2.34.1


