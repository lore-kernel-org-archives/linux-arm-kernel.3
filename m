Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68538F588DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kXfna3gP5AfciMruQugI5ioj0FW75jCa/1p7NaG8w4=; b=vjK63EhSzH35/mAbxaBLXhKQna
	VygjUcixwNRI0OXDcVLTej3JcCYIvmhcmShIfktiQkKIa26BK+G3vcWDqsvg2dLtC31wgX96fmjhb
	vdolFpnFe/6oobc9/8NSY++ex/7n7/u0NKu1Ahi3iK82J9xwOHfmZwRJxh933N1LsdohnEijv63Zy
	61gz51HGM6FmEjxmTkigB1o04s0lR85u/YEJf5/mzQMOr6aXdKgdePuDMvhW8jVwiCnQHvFA+g9iZ
	dKmhYifHtTvR/3Z1s0ANiCYFgtuC31gQF4BhUV7enc/F46a0f8VcpRDdgqhh2c0yooswgAkhblkxm
	uMSwSyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFh-000000078Fg-1AWY;
	Mon, 20 Apr 2026 14:05:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFf-000000078Em-0sE3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:05:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2422C16F2;
	Mon, 20 Apr 2026 07:05:20 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0BA23F7B4;
	Mon, 20 Apr 2026 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776693925; bh=HCcI2sI44ikPYJxQe93y6NpvxPr8pMI3eV30lGQgYZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TVBXzN0X+Xhxzp6e/ZSSFtUnzRQcXILyqEYL1ums0+05Fk8pXf24n7XtJyMPTNZWj
	 eCOrK+rUd91imeIxmjKPsuCBXSPvU8Qn1i3ligFhN+EGqU5Uu45aLpEIL5FFL/Yu52
	 t+JSrFeh4gaBJgzHJmnFxSeHTuFWe9Jfa3806bSo=
From: James Morse <james.morse@arm.com>
To: catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	will@kernel.org,
	Ben Horgan <ben.horgan@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [RESEND PATCH 1/3] arm_mpam: resctrl: Fix MBA CDP alloc_capable handling on unmount
Date: Mon, 20 Apr 2026 15:05:14 +0100
Message-ID: <20260420140516.3892820-2-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420140516.3892820-1-james.morse@arm.com>
References: <20260420140516.3892820-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_070527_284648_584670CA 
X-CRM114-Status: GOOD (  11.99  )
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

The code to set MBA's alloc_capable to true appears to be trying to
restore alloc_capable on unmount. This can never work because
resctrl_arch_set_cdp_enabled() is never invoked with RDT_RESOURCE_MBA
as the rid parameter. Consequently,
mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled always remains false.

The alloc_capable setting in resctrl_arch_set_cdp_enabled() is to
re-enable MBA if the caller opts in to separate control values using
CDP for this resource. This doesn't happen today.

Add a comment to describe this.

However a bug remains where MBA allocation is permanently disabled after
the mount with CDP option. Remounting without CDP cannot restore the MBA
partition capability.

Add a check to re-enable MBA when CDP is disabled, which happens on
unmount.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
[ morse: Added comment for existing code, added hunk to fix this bug from
  Ben H ]
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a9938006d0e6..4205fb2ee312 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -220,10 +220,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
 
+	/*
+	 * If resctrl has attempted to enable CDP on MBA, re-enable MBA as two
+	 * configurations will be provided so there is no aliasing problem.
+	 */
 	if (mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled &&
 	    mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
 
+	/* On unmount when CDP is disabled, re-enable MBA */
+	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
+		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
+
 	if (enable) {
 		if (mpam_partid_max < 1)
 			return -EINVAL;
-- 
2.53.0


