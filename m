Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2ACC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV6rjVkdV8po9Dp/dCHrAzM9klDaDnlQ+eyIrMYpl+Y=; b=LPte4kdI0sEe8J81LeKSERIUdq
	rwMHglEjDHNmErx6yJ177/0sr8NL8dxz1saJtpCCy84+CjY3VpN4odtTuGVsx2ZYsf96krjJqN32A
	0PSUO5/9LBGpEQPeku9GsarSNsVfEIbBryYWnMVS0WWTMMyl7HOiJaPFetZ5+zrp8i//HcZ3KWxaf
	jxC+mx/Y73F9GnyqaKbApZ0n1xwWXUk4QDyV3b8MRuBNqwX7qkxVJ9i3p83FXC3wVPib9Esafoohp
	mD31SsCjU9o8uHPbRVD48Grbuk+i/th3rnvli/A/IOcHrsWricFXGnVoEUPLvdwSmNZEsq6/wLK5F
	SnewCY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8BO-0000000C5tO-0eCL;
	Thu, 20 Aug 2026 19:12:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8BN-0000000C5sZ-1RXB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F513438AE;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E8FDC2BCC7;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787253128;
	bh=ksXb9ni7G9dqEx6LwsW4bBnhqCsne0tIy7naRonbgIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jwqXTZF3KIEQx7y1BPdHwHBcL8P6vtg0jNNIRwLI78V6e6PlRCCWte/vIsoSQAywr
	 hhh9hzwPWcCmBQFAP4sjUF9ZtSQUuvbG/OQEc4fEFV3aRqmDt6nlDPugBshQw6saKf
	 MYf1ZXKGTHwDUR+qxV+WoKq7E8ixwzU5czvH2SoKyR461HqSl0Sa2J/BCQ9PlBSm9Y
	 0Uoc+46mH9SC82te0MM7ZyOVoBT7cOfvlNnF3IZo8QSFBNc+DPLo5A/3utjSR4iRUs
	 c9TcbL2qUBLHO8OGdrQfwKMDd1i4cuOTZPJ5DQAo21bA71tmQcHz9+KTfYlGVeSO6W
	 78LL86kt51O6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAA6C5DF86;
	Thu, 20 Aug 2026 19:12:08 +0000 (UTC)
From: Markuss Broks via B4 Relay <devnull+markuss.broks.gmail.com@kernel.org>
Date: Thu, 20 Aug 2026 22:12:05 +0300
Subject: [PATCH 1/4] iommu/exynos: detect SysMMUs without BLOCK mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-exynos-iommu-fixes-v1-1-6bbcd673bb15@gmail.com>
References: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
In-Reply-To: <20260820-exynos-iommu-fixes-v1-0-6bbcd673bb15@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787253126; l=1479;
 i=markuss.broks@gmail.com; s=20260803; h=from:subject:message-id;
 bh=mOr89jBc1c/3DemuQ56Wmn7lSeAvv7DoZx+sJdo6D2U=;
 b=6nEHQ0bpJYt2EXU7sB+pTrh8uM4qqZlYciy0rMZ3uIIw056/blzZCqnEYUw/BlDczramgZk8s
 D+ueRGcYxxyB9FQi32Q0zQlCTS+8SQDf1EHZSuOANkujC0hVsTMRojF
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=oKzGUTm30BCDqinRMpiHQqByOx1mp2mwmhg80Mv7Zg4=
X-Endpoint-Received: by B4 Relay for markuss.broks@gmail.com/20260803 with
 auth_id=911
X-Original-From: Markuss Broks <markuss.broks@gmail.com>
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
Reply-To: markuss.broks@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Markuss Broks <markuss.broks@gmail.com>

Newer SysMMU instances may not implement BLOCK mode: writing CTRL_BLOCK
does not stop translation, and MMU_STATUS never reports a blocked
state.  The hardware advertises this in CAPA1 bit 15, which the vendor
driver reads as MMU_CAPA1_NO_BLOCK_MODE; the SysMMUs on Exynos8835
are such instances.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 874d05f4b396..0319da9fd831 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -143,6 +143,7 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
 #define CTRL_VM_FAULT_MODE_STALL	BIT(3)
 #define CAPA0_CAPA1_EXIST		BIT(11)
 #define CAPA1_VCR_ENABLED		BIT(14)
+#define CAPA1_NO_BLOCK_MODE		BIT(15)
 
 /* common registers */
 #define REG_MMU_CTRL		0x000
@@ -306,6 +307,7 @@ struct sysmmu_drvdata {
 
 	/* v7 fields */
 	bool has_vcr;			/* virtual machine control register */
+	bool no_block;			/* BLOCK mode not implemented */
 };
 
 #define SYSMMU_REG(data, reg) ((data)->sfrbase + (data)->variant->reg)
@@ -511,6 +513,7 @@ static void __sysmmu_get_vcr(struct sysmmu_drvdata *data)
 	u32 capa1 = readl(data->sfrbase + REG_V7_CAPA1);
 
 	data->has_vcr = capa1 & CAPA1_VCR_ENABLED;
+	data->no_block = capa1 & CAPA1_NO_BLOCK_MODE;
 }
 
 static void __sysmmu_get_version(struct sysmmu_drvdata *data)

-- 
2.55.0



