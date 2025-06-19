Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7249AC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRDzz0jrxSEhcW0WVW7g4mRFOY0FKs5n+7nUlgeAAW0=; b=dSRhrZCjKYeYhtfN7ojkzTlKL/
	eg341M+K4tWHjxZ7w85BE4UmQpvx5aEZt9Ae8Z6hPRMaCPTMSClm6jiXVitRqi59rnoJLbijCGGin
	6UBCMV/pcQnYNePxSgw2hmLQu1NQ3zg7OzJXAqpUOeIj3kbXY0sR3luZfW7JYUA9vDeqlmneQVD+W
	MjBz988th1oSBO+PL/iOYWcLc9VJ+304wCezJ6teR0ODZ9gni+aNqB5+sWZCnuAB7SWRw5SsP97MO
	nFgyrUVJTMcq8oALldBu7dgPtIhOhBFtWSMPFuzNXwzVwY9vZ+Gt2fpU7VINjRdCFCvT+j85e6dHh
	/fRMc5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHVw-0000000DYGt-09KI;
	Thu, 19 Jun 2025 15:49:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSF4N-0000000D8Bt-1tmO;
	Thu, 19 Jun 2025 13:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750338760;
	bh=Z78NWR7QyeVMigQFDY67KY2IgrDEq55C5grWjS25FAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U4RKiBhmILzi/KWLUQ19nHOBAApZDOYBl6lHwlG5+xdPFC2UQ4P0zxHWKYcm/qb/D
	 amWo8qkqi2ukixzW9BsNWdCVOsTX6AFiNaBRHTu/MRMME99Mw1tEIqfDNoL9Vj0Xv/
	 Q/TorqS+WIeoakla64ukAiBC0LD1IXWS7bAFTm0aFllGy9MvIl+bo7nHP3+0U3JyAw
	 Sn4Xm6pQyPCJFja5K0Nz6cNnDZnJ25PF308/fmaQNanSlTrQHkg1+2aAoJtwR+wj/k
	 sbdWHAOyajtsQxbTXobic73Jf/ydhEiosLFOIhFvuJvzSaRkHK4Z6FEJUQiMzJUizB
	 66vyVfwvuRe9Q==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ba4e:a6e2:6d63:7f02])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F38B217E0CF6;
	Thu, 19 Jun 2025 15:12:39 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 5/5] arm64: defconfig: enable Verisilicon IOMMU
Date: Thu, 19 Jun 2025 15:12:26 +0200
Message-ID: <20250619131232.69208-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_061243_644231_69BDE271 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

Enable Verisilicon IOMMU used by RK3588 AV1 hardware codec.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in version 3:
- Set CONFIG_VSI_IOMMU as module in defconfig

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..a5122990ecfa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1451,6 +1451,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


