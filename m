Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0F8CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UP0YTUy7zkrIojybqq6QMy6i41tG54VrVzfjKAt98ek=; b=ZhPkzejUFOnmY/yNzH41VR+pp4
	oHfCq/i7IB0mGRhObPuGce8d55TBZYOehZORJHZLAmzNfgmxDOQz5EYuZhbyYKbLqhhv7xpDWqf3S
	PffRcfgluVrheU3oQr3jEz9w5OFkTRqJQKtZPE3VB/H0Mxhr3q2QC93bSj98uRbyjfdofBcCJ6qvy
	7y3qfFVZ1dLXR+PZQ2pyUDx3pBXdzwUgvPCiNlFqtC//wN0Kif4mDgs/Jv+s6wLhsDdJVVbocj1sb
	og4mNkUkStDV7hyHE5FW4gqxrsMDYYF8olej0dqbDs7IkP4Sfrv30LgWnLpfQKd4e+K54828p3xGI
	Dvri/nmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeJ-0000000Cnzb-2zh9;
	Tue, 02 Jun 2026 10:47:07 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMeH-0000000Cnsl-1fLS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780397223; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=UP0YTUy7zkrIojybqq6QMy6i41tG54VrVzfjKAt98ek=;
	b=XCUkcrQBt+b1LKpc4JzVt9Jy2ALSHyw7F370U5NRi8+Fre4NTVkjMMoQWvE6WpHzbjCMytCP1E+Z4DB3wuqsrtSB2SCbaHqOxFi8uAJSrZ+gmOqQ7qTsU3G6Cmd3Wrn772EuNXRyweMawWFGdKP26IZCgHm24OZUa+id0rERlCE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X44E952_1780397220;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X44E952_1780397220 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 02 Jun 2026 18:47:00 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oliver.yang@linux.alibaba.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com,
	suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de,
	wei.guo.simon@linux.alibaba.com,
	will@kernel.org,
	xlpang@linux.alibaba.com
Cc: alikernel-developer@linux.alibaba.com
Subject: [PATCH v2 13/30] iommu/fsl_pamu: implement iova_to_phys_length
Date: Tue,  2 Jun 2026 18:46:20 +0800
Message-ID: <20260602104637.1219810-14-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_034705_636185_A6E46C47 
X-CRM114-Status: GOOD (  10.60  )
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

Implement iova_to_phys_length for FSL PAMU IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/fsl_pamu_domain.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 9664ef9840d2..643984ac6ae1 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -169,12 +169,32 @@ static void attach_device(struct fsl_dma_domain *dma_domain, int liodn, struct d
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 }
 
-static phys_addr_t fsl_pamu_iova_to_phys(struct iommu_domain *domain,
-					 dma_addr_t iova)
+static phys_addr_t fsl_pamu_iova_to_phys_length(struct iommu_domain *domain,
+						dma_addr_t iova,
+						size_t *mapped_length)
 {
+	if (mapped_length)
+		*mapped_length = 0;
+
 	if (iova < domain->geometry.aperture_start ||
 	    iova > domain->geometry.aperture_end)
-		return 0;
+		return PHYS_ADDR_MAX;
+
+	/*
+	 * PAMU configures exactly one Primary PAACE entry per LIODN with the
+	 * Multi-Window (MW) bit cleared and ATM = PAACE_ATM_WINDOW_XLATE,
+	 * WBAL/TWBAL = 0. That is, every LIODN is backed by a single hardware
+	 * mapping window of fixed size (1ULL << 36, i.e. 64GB, see
+	 * pamu_config_ppaace()) performing an identity translation. The driver
+	 * does not split this window into SPAACE sub-windows, so the entire
+	 * aperture is one PAACE "PTE" entry. Return that single entry's size
+	 * as mapped_length, matching the iova_to_phys_length contract that
+	 * mapped_length reports the full size of the mapping entry which
+	 * covers iova (not the remaining bytes from iova to its end).
+	 */
+	if (mapped_length)
+		*mapped_length = 1ULL << 36;
+
 	return iova;
 }
 
@@ -435,7 +455,7 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.device_group   = fsl_pamu_device_group,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= fsl_pamu_attach_device,
-		.iova_to_phys	= fsl_pamu_iova_to_phys,
+		.iova_to_phys_length	= fsl_pamu_iova_to_phys_length,
 		.free		= fsl_pamu_domain_free,
 	}
 };
-- 
2.43.7


