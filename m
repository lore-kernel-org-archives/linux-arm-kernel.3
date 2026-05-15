Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605D9CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N/2Q/+hDnHMkFnxQQrnEIwh3Lhr71rTHDivWVOjWQnU=; b=QMCT8l0SY3IT4WwztjmwQnAVuK
	IawWjNlD4XyfI/yKG5iTaoPP4zGEd1Hjf4aBO0d2qv7wG6nVHp1Bovo1rAMHT56DcyyxOWEB/bz58
	4Xc9/rL3qrXY8zauiaM7tNcDU6PSD/elyxT7HGn9C1l9VKomdPOaqqsG2tTnoQdqIpnFL0QfuT6ZS
	8iCFtWa5OOY9/0Pl/MX2P2CdNz2Np05r3OmYRoZdjCM4YCMsx5qjeW5lZ3Yrja29+tTJKgXgGLr+M
	9utpS7ztRtPliRv39sH28HPdJ+shmHWd4k37G9Qe1NwIZn5PvlUO2rxZeK1LAxxBI00BO8ars00g2
	T3akcZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoNZ-00000007o40-0a5z;
	Fri, 15 May 2026 08:58:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoNW-00000007o1p-1gfy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 08:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=N/2Q/+hDnHMkFnxQQrnEIwh3Lhr71rTHDivWVOjWQnU=; b=UBlyoaZ/lNA3c8Q6a+bGpqH168
	yxbkOCqxww2KpTGEdYzuA8Li7IN7An5IA+ygJSV9H925UrusqV8ANw/HEBkSWbsuTd0yxiC9uqFrC
	Dyx+F7NvZO2dJomuTWPOCNWT05yqbUT7fTvguD53XkE1/sd19m9HErfdbmno4HxlT0Q600+EQlO39
	B5OSzp4P2xfn7CjdsLUivL1OTXX+Iz0pADBuuiCwhQoRZgvGRxMUGUNLlPI4DbLT1tHejRWmz6OW0
	DDlRhNFT6OscDiwC6DAMtUpo2fIIU0tefOV++u8IwGPszuAol5+Zgh3rjBiCNEfk+KUdnlBgtvGCn
	8wExzhTQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoNS-00000004gZM-3H6k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:58:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91E1D26A4;
	Fri, 15 May 2026 01:58:31 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C16B3FAF5;
	Fri, 15 May 2026 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778835516; bh=Xf1MKewX1qHIoEYl7yF7sCbi2Zzhjv/ESbywRaQiUYw=;
	h=From:To:Cc:Subject:Date:From;
	b=PicMm3+eRwPFO1YojcuvsED2Q2H66VvtbZEw0e4P8BxfibmSmAXfMRYdmPuFiDHET
	 dz107WYMOKzfN+x554qVUwCMR3UEonMX0gWc58O8a4WGoZLMNJyL87+kRA6TvoUjx4
	 BfRG1sEGGJnKkYri08g6HHPtYrvSacLDe3bf3fZw=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm_mpam: Fix software reset values of MPAMCFG_PRI
Date: Fri, 15 May 2026 09:58:25 +0100
Message-ID: <20260515085825.1157812-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_095839_624248_06C1A396 
X-CRM114-Status: GOOD (  12.74  )
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

Priority partitioning is not supported other than to set the per-PARTID
defaults in MPAMCFG_PRI, INTPRI and DSPRI, to the highest priority. When 0
is the lowest priority, all ones is the highest priority. However, these
values are calculated with an extra higher bit set.

Luckily, there is still no chance of setting functional bits incorrectly.
When the priority widths are maximal, this is ensured as the fields have
width 16 and a u16 holds the value for each field. When the widths are
smaller, the higher order bits beyond the advertised widths,
MPAMF_PRI_IDR.DSPRI_WD and MPAMF_PRI_IDR.INTPRI_WD, in the priority fields
INTPRI and DSPRI are not used to calculate the priority.  It is not
specified whether these higher order bits are RAZ/WI or Res0 and so it is
desirable not to set them to avoid the chance of misleading reads.

Correct the priority reset values.

Fixes: 880df85d8673 ("arm_mpam: Probe and reset the rest of the features")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 41b14344b16f..a627dc2c53de 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1539,12 +1539,9 @@ static u16 mpam_wa_t241_calc_min_from_max(struct mpam_props *props,
 static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 				      struct mpam_config *cfg)
 {
-	u32 pri_val = 0;
 	u16 cmax = MPAMCFG_CMAX_CMAX;
 	struct mpam_msc *msc = ris->vmsc->msc;
 	struct mpam_props *rprops = &ris->props;
-	u16 dspri = GENMASK(rprops->dspri_wd, 0);
-	u16 intpri = GENMASK(rprops->intpri_wd, 0);
 
 	mutex_lock(&msc->part_sel_lock);
 	__mpam_part_sel(ris->ris_idx, partid, msc);
@@ -1609,16 +1606,25 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 
 	if (mpam_has_feature(mpam_feat_intpri_part, rprops) ||
 	    mpam_has_feature(mpam_feat_dspri_part, rprops)) {
-		/* aces high? */
-		if (!mpam_has_feature(mpam_feat_intpri_part_0_low, rprops))
-			intpri = 0;
-		if (!mpam_has_feature(mpam_feat_dspri_part_0_low, rprops))
-			dspri = 0;
+		u32 pri_val = 0;
+
+		if (mpam_has_feature(mpam_feat_intpri_part, rprops)) {
+			u16 intpri = GENMASK(rprops->intpri_wd - 1, 0);
+
+			/* aces high? */
+			if (!mpam_has_feature(mpam_feat_intpri_part_0_low, rprops))
+				intpri = 0;
 
-		if (mpam_has_feature(mpam_feat_intpri_part, rprops))
 			pri_val |= FIELD_PREP(MPAMCFG_PRI_INTPRI, intpri);
-		if (mpam_has_feature(mpam_feat_dspri_part, rprops))
+		}
+		if (mpam_has_feature(mpam_feat_dspri_part, rprops)) {
+			u16 dspri = GENMASK(rprops->dspri_wd - 1, 0);
+
+			if (!mpam_has_feature(mpam_feat_dspri_part_0_low, rprops))
+				dspri = 0;
+
 			pri_val |= FIELD_PREP(MPAMCFG_PRI_DSPRI, dspri);
+		}
 
 		mpam_write_partsel_reg(msc, PRI, pri_val);
 	}
-- 
2.43.0


