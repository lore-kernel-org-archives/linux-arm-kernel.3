Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B16E8306B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM+Jc/f54ziinASL269j+aHrU0OKs5LpSdevI2aHl9A=; b=BCj+rBiapuBkew0yzadUyqw0x6
	5tvdbjJ6Zx0MIWZt5IV10HdEB3YmjBPqykUv3QF3xU0FljzRKXHozNO7iKzjBG1LraPM8AM7kAMKN
	gHtUX3IaLnPWKX3gB0ncRUFtwrdXkyZmWJKdpqqfJ1rjXA5k+gyYv5bi9al8MVxTa6zO8v9luOPFK
	z0MctKWFskcI4YlD+6HM7HAu8dAqHAXPKeFUdz/cvRNb6I3lFtZvbs4QltGLHle9jdlXJUSFuu2AA
	hzjeMrbgdyOMgXD38ErIIfqm6p3qm2R8b53UG6OW1vfTe1bGl7fjE6mxGJdUHydfyJ0l5iPN0CWOi
	bULG4sGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD7N-00000006QLA-49bV;
	Tue, 03 Feb 2026 09:54:45 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD7K-00000006QHS-012A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:54:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VM+Jc/f54ziinASL269j+aHrU0OKs5LpSdevI2aHl9A=;
	b=dVKyQtsPcBOH1jDEa2vplD0/9GqUSyeB1DMZ6wQeQQrK/BMh1df+EcRhOvJ/piVpsYIcGXhpd
	KBSZAfY9aCTzT6Jniqgitq0MV1wamgg4xNuIUoHBdAJWlQCw1YP/hlwGlXBC9WWzTLfcW9etF7J
	I+r9smEKzTLsA10FjspqF9U=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f4zMl6jJFz1BGB2
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 17:53:55 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VM+Jc/f54ziinASL269j+aHrU0OKs5LpSdevI2aHl9A=;
	b=dVKyQtsPcBOH1jDEa2vplD0/9GqUSyeB1DMZ6wQeQQrK/BMh1df+EcRhOvJ/piVpsYIcGXhpd
	KBSZAfY9aCTzT6Jniqgitq0MV1wamgg4xNuIUoHBdAJWlQCw1YP/hlwGlXBC9WWzTLfcW9etF7J
	I+r9smEKzTLsA10FjspqF9U=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f4zHG4G8kz1T4FV;
	Tue,  3 Feb 2026 17:50:02 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F62F404AD;
	Tue,  3 Feb 2026 17:54:23 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 3 Feb
 2026 17:54:22 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <xry111@xry111.site>, <catalin.marinas@arm.com>, <maz@kernel.org>,
	<ardb@kernel.org>, <yang@os.amperecomputing.com>, <ryan.roberts@arm.com>,
	<kevin.brodsky@arm.com>, <reinette.chatre@intel.com>,
	<miko.lenczewski@arm.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<thuth@redhat.com>, <ben.horgan@arm.com>, <james.clark@linaro.org>,
	<james.morse@arm.com>, <lpieralisi@kernel.org>, <broonie@kernel.org>,
	<oupton@kernel.org>, <anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>,
	<leo.yan@arm.com>, <mrigendra.chaubey@gmail.com>, <fenghuay@nvidia.com>,
	<ahmed.genidi@arm.com>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<wangkefeng.wang@huawei.com>
Subject: [PATCH v2 2/2] arm_mpam: Update architecture version check for MPAM MSC
Date: Tue, 3 Feb 2026 17:54:06 +0800
Message-ID: <20260203095406.6437-3-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260203095406.6437-1-zengheng4@huawei.com>
References: <20260203095406.6437-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_015442_439457_BA0ABD59 
X-CRM114-Status: GOOD (  14.89  )
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

In addition to updating the CPU MPAM version check, the MPAM MSC version
check also need to be updated. mpam_msc_check_aidr() is added to check
the MSC AIDR register, ensuring that both the major and minor version
numbers fall within the supported range of the MPAM architecture version.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/resctrl/mpam_devices.c  | 16 +++++++++++++---
 drivers/resctrl/mpam_internal.h |  5 ++++-
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 744df3a6a078..a58031f0a280 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -202,6 +202,17 @@ static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val
 
 #define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
 
+static bool mpam_msc_check_aidr(struct mpam_msc *msc)
+{
+	u32 rev;
+
+	rev = __mpam_read_reg(msc, MPAMF_AIDR) & MPAMF_AIDR_ARCH_REV;
+
+	return rev == MPAM_ARCHITECTURE_V0_1 ||
+	       rev == MPAM_ARCHITECTURE_V1_0 ||
+	       rev == MPAM_ARCHITECTURE_V1_1;
+}
+
 static u64 mpam_msc_read_idr(struct mpam_msc *msc)
 {
 	u64 idr_high = 0, idr_low;
@@ -842,9 +853,8 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 	lockdep_assert_held(&msc->probe_lock);
 
-	idr = __mpam_read_reg(msc, MPAMF_AIDR);
-	if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
-		dev_err_once(dev, "MSC does not match MPAM architecture v1.x\n");
+	if (!mpam_msc_check_aidr(msc)) {
+		dev_err_once(dev, "MSC does not match MPAM architecture\n");
 		return -EIO;
 	}
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e79c3c47259c..7c6431405d5a 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -394,7 +394,9 @@ int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
  * Component Specification.
  * https://developer.arm.com/documentation/ihi0099/aa/
  */
-#define MPAM_ARCHITECTURE_V1    0x10
+#define MPAM_ARCHITECTURE_V0_1  0x01
+#define MPAM_ARCHITECTURE_V1_0  0x10
+#define MPAM_ARCHITECTURE_V1_1  0x11
 
 /* Memory mapped control pages */
 /* ID Register offsets in the memory mapped page */
@@ -518,6 +520,7 @@ int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
 /* MPAMF_AIDR - MPAM architecture ID register */
 #define MPAMF_AIDR_ARCH_MINOR_REV	GENMASK(3, 0)
 #define MPAMF_AIDR_ARCH_MAJOR_REV	GENMASK(7, 4)
+#define MPAMF_AIDR_ARCH_REV		(MPAMF_AIDR_ARCH_MAJOR_REV | MPAMF_AIDR_ARCH_MINOR_REV)
 
 /* MPAMCFG_PART_SEL - MPAM partition configuration selection register */
 #define MPAMCFG_PART_SEL_PARTID_SEL	GENMASK(15, 0)
-- 
2.25.1


