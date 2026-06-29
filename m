Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JO1fCQG5PwkKtjMsyUkbYJB7JtjMw8bGs1lH/7GPTdc=; b=SfVBOP1n8IBu+3g+JwxfFzrhse
	OUcHtwjdhL4nMuZLfiUtmawZCL4GnLwJBO5x0O3fldEHYRz7pKWbGlMV6SNfQLmAK0zDi8Ir0LBUB
	B4r28k5FmldfVW0fwbQYB60fqExHkXdDscGTtzXc3y92qeN2fFeJorU+Bi2Xt7L1L7jS2wIpz5LhS
	iJwv3hXl3dmtaFJc2TNnVzcwEdJaFuv9FKaGpo3X/lnJH3KdA1qkrLYkrOnXM8OSEIUotBE7jOPba
	Hfb+B++fCmgbfngU1Ia2UjAjd7nBdCRidWNKC++m+V6uB0CIVMjfa7YsyTEwd1V0p+gfzWmKq8Ajh
	MiXGltpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDT3-0000000EzaP-2ZhG;
	Mon, 29 Jun 2026 15:00:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDSz-0000000EzUK-3Ig7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:00:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-845b733e82cso2179094b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782745209; x=1783350009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JO1fCQG5PwkKtjMsyUkbYJB7JtjMw8bGs1lH/7GPTdc=;
        b=arW2NJ9ioGFXzw7epm2V8J6YfmoekNewsZyGoV5bOq8KBcUqcLvWJtaqyKvOif6XAu
         Wy9JR5BoyrCIhgOsMQP2uQVndIeNxYO11OgXVnTVQjYV+B+8nnsa4dr7HSufGA+OdOeY
         CV2WEAkyCGEYAU21sDmjyiVhjom8vzyIFBycHVpYQu/w5JybFIt7fqivu32MqQPAStsG
         DGM6TfY6THtyej2qhSPmb3Hln0KHQ1zN4u9BS/YqkbrPm7LboZMUWvjhzXxIbiv2u/1/
         y0jNIHB5AlbxAhDHbhagZfVPC17Ja0IjDmLTLfJ7baYfYiY5j87FlDxg8bgG9KIvGlhz
         w76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745209; x=1783350009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JO1fCQG5PwkKtjMsyUkbYJB7JtjMw8bGs1lH/7GPTdc=;
        b=LOEpgbAwc3VDJlOxgEYgT7RGOdU/AQWmwWrj7X9Zun53D1yI0hwGDOFVKaF5Y0ciqN
         7ecFNrU2rFZir5nlnlaRLC6umukfxhK0SrtlYfrDZ8qRXa/OPD3TYVvnyI7rl3p1BAfg
         MgBU6MxCsWyAQuG1FosAxG6Pp9MNa8GoQxS3/sJvmz65sSRCqHl4cZKO3EhY5Nrb+V7T
         EJwB0+E4ZkfePRSKULq0paSsb8Yy50NwHevqVz49AABTpf9yjMJNAHYPERY7PCxuJVsJ
         wV6Ugk6wdU10W4o79sEjlYMmpCJfwuo40LjQOwKdKGeTeUEzj4pDnhLaZne+ytjKkNkp
         099Q==
X-Forwarded-Encrypted: i=1; AHgh+Ror2uT3m7LaZh1A7SaEDU66pUsLDZoMKi9CVlYxpqRZIQsYMTRclLT53D9L0qon1LtbG6zSD4ZeEoa6jk9AaOyT@lists.infradead.org
X-Gm-Message-State: AOJu0YwWFTnY4OZXBrolDAiCmvPMmNSjXCOB+djb34MX+DOHb9QpTDnm
	MDguCdYNXuK0XnJWiSku+uEbVvGDO3VR+3h2eQBnQE4vBjGqKjJNl78Q
X-Gm-Gg: AfdE7clgAv3ho9O9pR65JxpyxFanNsht3kxgeklnTMqzUx7AzCavO3/8hpXvgun3+5O
	DCL1Yivzcq47yZH5YBO3mU7FcSH2SR5jizyept8uZ6o14lv4SCUZv1rdJYsl4UHnlWu1bGHCUOX
	4BEJteTmeG8geO7ME5g5l1QFQ4FFAkZYyfZvmTdvO3GnM27gi1zHkQ7HME2uMgBbqcfth6cke8l
	nqR4gqGzF5S4r5YF15RcURXjynFF4uFIZgwfLg6YK2OH1SBX4XrAI4+uBbYx4xK7bGb9HJJ3Cfu
	LAoHIcaQjQ+IrJOxyV/n7qILaWd+CSL1qB7Uh8Uz7CwrqqgszZL8X5yWwqgch496jCn166cArBV
	QtNX36w24um1UaXRVO0eYLmLTvDyb+27kdfsVNeZQ7hbCkrtZPJndn7QRwRQFDxlwH3zbBm9Q1L
	e8BNcZdU/DfrFFqDVjgPBrKaiCC2bVjPRrQtM/uGhLNipD
X-Received: by 2002:aa7:888f:0:b0:847:8971:87bb with SMTP id d2e1a72fcca58-8479ae75cf7mr678238b3a.21.1782745208912;
        Mon, 29 Jun 2026 08:00:08 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845e9fa4601sm3572368b3a.6.2026.06.29.08.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:00:08 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Joerg Roedel <jroedel@suse.de>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	iommu@lists.linux.dev (open list:MEDIATEK IOMMU DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] iommu/mediatek-v1: Fix off-by-one in MT2701_LARB_NR_MAX
Date: Mon, 29 Jun 2026 23:59:44 +0900
Message-ID: <20260629145946.312819-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080009_896301_91DBDBE1 
X-CRM114-Status: GOOD (  13.12  )
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

The mt2701_m4u_in_larb[] array contains 4 (for LARB0 to LARB3)
elements, meaning mt2701_m4u_to_larb() can legitimately return 3.
The current check `if (larbid >= MT2701_LARB_NR_MAX)` incorrectly
rejects valid LARB3 with -EINVAL.

Fix this off-by-one error by updating MT2701_LARB_NR_MAX to 4.

Note that this does not cause immediate issues with the current
mt2701.dtsi and mt7623n.dtsi because it only defines 3 LARBs:
    mediatek,larbs = <&larb0 &larb1 &larb2>;
Thus, larbid never reaches 3 in the existing upstream device tree.

Fixes: de78657e16f4 ("iommu/mediatek: Fix NULL pointer dereference when printing dev_name")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/iommu/mtk_iommu_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index ac97dd2868d4..e907c9953142 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -88,7 +88,7 @@ struct dma_iommu_mapping {
 /* MTK generation one iommu HW only support 4K size mapping */
 #define MT2701_IOMMU_PAGE_SHIFT			12
 #define MT2701_IOMMU_PAGE_SIZE			(1UL << MT2701_IOMMU_PAGE_SHIFT)
-#define MT2701_LARB_NR_MAX			3
+#define MT2701_LARB_NR_MAX			4
 
 /*
  * MTK m4u support 4GB iova address space, and only support 4K page
-- 
2.54.0


