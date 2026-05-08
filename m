Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA124CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QLrtFfS6iBV8fjK2czxWY3t3zP6lLjgUrK5+8NxTys=; b=nv860IK34rlYEosfpgnqqktavR
	0nXQ0o7pvjoOZ3obVzfLgzyK9f21q3aUuTgAL0xa1L2+yGSLnrCCwZznEHPNqUSzcM+pkerNmmAn9
	RGgljqGAKM2QaVpdzYUEaEsGETnlX790qCzpsGbo0kjmNMG0hGYNKwyOdkbYoyRYUHXFurbIodWPo
	d7gEPt+XJRxTgZjAPKSjQey6AAMrfzSoAtxaThv/4BnQXmS9CtGhhOEaiFLJi/BURKUYci+ohXFzj
	NiM2bl6dEuZisv/Wu/VeGza7nn13u8rtVkqYx/dFQN/ukp0f+EHSWAQtohJbQshGoyc6EoRA8c/Ei
	yIe41NTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzo-00000006z8s-40Y0;
	Fri, 08 May 2026 16:24:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNzk-00000006z5o-0t1V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:24:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26B131F37;
	Fri,  8 May 2026 09:24:02 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CF9B3F763;
	Fri,  8 May 2026 09:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778257447; bh=AgpT/PMm24zQgK02qmUXppicDWFKDhpG8UBcLe6yHcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jRktqLQ0RzSZ06IKl42v3GvjvG8HmCguoX5mye4xi8qzEim/pxZCy+CtQsUff4F/A
	 uF+6H7W+LRxJLDdD2uF6vtrKYhZovh58XhJEz8LnKB+98UyaSRQTW2uAGSM1mqSeTP
	 XDIgQF+TD21hcmcQbuNC4gdI5DRnyFuZ1vS5u4y0=
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	zengheng4@huawei.com
Cc: wangkefeng.wang@huawei.com,
	xry111@xry111.site,
	catalin.marinas@arm.com,
	yang@os.amperecomputing.com,
	reinette.chatre@intel.com,
	will@kernel.org,
	thuth@redhat.com,
	ben.horgan@arm.com,
	mrigendra.chaubey@gmail.com,
	fenghuay@nvidia.com,
	ahmed.genidi@arm.com
Subject: [PATCH v3 4/4] arm_mpam: Update architecture version check for MPAM MSC
Date: Fri,  8 May 2026 17:23:41 +0100
Message-ID: <20260508162341.3762549-5-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508162341.3762549-1-james.morse@arm.com>
References: <20260508162341.3762549-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_092408_308043_27B4BEDE 
X-CRM114-Status: GOOD (  13.08  )
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

From: Zeng Heng <zengheng4@huawei.com>

In addition to updating the CPU MPAM version check, the MPAM MSC version
check also need to be updated. mpam_msc_check_aidr() is added to check
the MSC AIDR register, ensuring that both the major and minor version
numbers fall within the supported range of the MPAM architecture version.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
[ morse: changed mpam_msc_check_aidr() to accept versions like v1.2 ]
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 916d8fd45ed5..1771e9712ca2 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -224,6 +224,24 @@ static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val
 
 #define mpam_write_monsel_reg(msc, reg, val)   _mpam_write_monsel_reg(msc, MSMON_##reg, val)
 
+static bool mpam_msc_check_aidr(struct mpam_msc *msc)
+{
+	u32 aidr = __mpam_read_reg(msc, MPAMF_AIDR);
+	u32 major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
+	u32 minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);
+
+	/*
+	 * v0.0 and >v2.x aren't supported, but anything else should be backward
+	 * compatible to v0.1 or v1.0.
+	 */
+	if (!major && !minor)
+		return false;
+	if (major > 1)
+		return false;
+
+	return true;
+}
+
 static u64 mpam_msc_read_idr(struct mpam_msc *msc)
 {
 	u64 idr_high = 0, idr_low;
@@ -951,9 +969,8 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 
 	lockdep_assert_held(&msc->probe_lock);
 
-	idr = __mpam_read_reg(msc, MPAMF_AIDR);
-	if ((idr & MPAMF_AIDR_ARCH_MAJOR_REV) != MPAM_ARCHITECTURE_V1) {
-		dev_err_once(dev, "MSC does not match MPAM architecture v1.x\n");
+	if (!mpam_msc_check_aidr(msc)) {
+		dev_err_once(dev, "MSC does not match architecture v1.x\n");
 		return -EIO;
 	}
 
-- 
2.53.0


