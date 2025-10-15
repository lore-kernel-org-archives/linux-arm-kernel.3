Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6556FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ewAMK6QiIR1vlmYBlWRUzuYq9rLgpC1SJlcCofQcWwM=; b=L9baS3OAmeXqq/+W0OBQxofWfQ
	Sv1sz/Lbhh4gYw+kzlMF/9PWMvF8b1K4juuUJAADVULzoj6OcgBs/LRgF6YmZnavzNPkuUVeOG1Ct
	r1A9YYmkQRcBncbUgpG3y8SN+jvNpbCTeb90OEz5axeZE23TzKgNDuJf4AxzZXJ7irpcXOMrr3rYu
	Pm1NS8wmAd02MktV0RjSMWv7xk7C/yIavn5rIswP7r4A3oW9WxaNC7oMdXSGFTxlCfR9JFAqYobXj
	tyrDl7KZelc/N8VfEey9r6c2iuJDFkT63Mr9jkTb9vp8P37vE+drUrvx6Hi5X5+5NHP8qKGAcRIQE
	k5PzoYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Pu-00000001WXU-45Hy;
	Wed, 15 Oct 2025 12:15:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Ps-00000001WWt-2JZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D053D43E5C;
	Wed, 15 Oct 2025 12:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9DFC4CEFE;
	Wed, 15 Oct 2025 12:15:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.18-rc1
Date: Wed, 15 Oct 2025 14:15:34 +0200
Message-ID: <d0fcc82fb294021bf96f8a490234165e15aadb43.1760530468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_051540_626041_23261974 
X-CRM114-Status: GOOD (  11.19  )
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

Refresh the defconfig for Renesas ARM systems:
  - Drop CONFIG_SCHED_MC=y (auto-enabled since commit 7bd291abe2da09f5
    ("sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig")),
  - Disable CONFIG_SCHED_SMT (auto-enabled since commit 7bd291abe2da09f5
    ("sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig")),
  - Restore CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1 (default changed to
    zero (auto-detect) in commit 1c4b87c921fb158d
    ("clocksource/drivers/arm_global_timer: Add auto-detection for
    initial prescaler values")),
  - Disable CONFIG_RPCSEC_GSS_KRB5 (auto-enabled since commit
    d8e97cc476e33037 ("SUNRPC: Make RPCSEC_GSS_KRB5 select CRYPTO
    instead of depending on it")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.19.
---
 arch/arm/configs/shmobile_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index e4cb33b2bcee2215..c1fd469e20718120 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -10,7 +10,6 @@ CONFIG_KEXEC=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_PL310_ERRATA_588369=y
 CONFIG_SMP=y
-CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
@@ -24,6 +23,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_VFP=y
 CONFIG_NEON=y
+# CONFIG_SCHED_SMT is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_SLAB_FREELIST_HARDENED=y
 CONFIG_CMA=y
@@ -200,6 +200,7 @@ CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
+CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
 CONFIG_AK8975=y
@@ -218,6 +219,7 @@ CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_ROOT_NFS=y
+# CONFIG_RPCSEC_GSS_KRB5 is not set
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_DMA_CMA=y
-- 
2.43.0


