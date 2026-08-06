Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19FDC56207
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xP0ZjN3j0b0RXMHf4/XkxCb2BJnfu4yMfracx3JpeFA=; b=JPgmNdJ7MwQtv5l/ne1eL5RIKO
	tlCcVTs1Wb5H1YgSRjMAjLFuwKDCKpL7/sC13GhJGCI+8TqXLPxN7ZgFUOaOkwPkJwhf7uN2Qt5n8
	UQFT0sRKfI71VEStkAOMXB51cbG6teiUzaymrb9iAvUhnSo82L74o568CnBBfleU2l4dszBGhVVBs
	GJj9aI9uz1TPL0mhRQNABfRsEivdKucLKBW7eaFF/ZpV0goLgyg7YVs9sLoSVMq2PZKd3PXo/c+cU
	8Odu4n7mnMI9F87hztPR1IZLExO9CmqYEXDhwDttOEmzwZD02B7C8bsFmGSEtiPSCCzu50+TKKYvZ
	Lqj8AI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzMy-000000061cz-3nuD;
	Thu, 06 Aug 2026 14:46:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzMu-000000061ac-2eUf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 14:46:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AE4B1A25;
	Thu,  6 Aug 2026 07:46:43 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 704183F9A2;
	Thu,  6 Aug 2026 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786027607; bh=KpzBNNdjie/RT5x1nlv2BU0lhNMLTEMSa3pYVPX9Ksg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RmRxN+14Fh8+XZre+iNVDUkx6Ja/a4Z57JnwfU82wpvaYX+kwQP34IAFqhvSjmYZi
	 Hxf0AWMhIfnxm2S3pBzqS0/+/XjtH4LS1JzzJlbFIf8PzMhfS3kS0oUG4yuo+vDuWz
	 Tu1mdld5OK150e7TPFhxJF4kjwVm7YjeqVQoCWzI=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com,
	andre.przywara@arm.com,
	will@kernel.org,
	catalin.marinas@kernel.org
Subject: [PATCH v1 2/2] arm_mpam: Disable driver unbind to avoid UAF
Date: Thu,  6 Aug 2026 15:46:31 +0100
Message-ID: <20260806144631.2502918-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806144631.2502918-1-ben.horgan@arm.com>
References: <20260806144631.2502918-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_074648_814465_D289D270 
X-CRM114-Status: GOOD (  13.32  )
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

When a user unbinds an MSC and that MSC is the only MSC left for a
component then the corresponding mpam_component will be freed. If the user
then goes on to read the schemata file in the resctrl filesystem then the
mpam_component will be accessed from resctrl_arch_get_config() leading to a
use after free.

As the MPAM driver is not a module the unbind sysfs interface is the only
way to trigger the remove. Instead of dealing with the complexity of
allowing some unused MSC to unbind just remove the unbind sysfs interface.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bc6cc0b5c96b..e888de8d4896 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2141,6 +2141,7 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
+		.suppress_bind_attrs = true,
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
-- 
2.43.0


