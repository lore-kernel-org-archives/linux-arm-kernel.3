Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 18:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K4L6S9AIfcJmSktpYUDEepH8hgI/JaLBu8Gt3usbxsU=; b=EMkACuIQuD3iEIf+9bUnXjIrz9
	hZ0XM/H9rLLUuA5m8kM6bnYI6gaL48uszOB46kE4MSZDXmYbYTIN0kAo+q51OPcmfcfldFGx2wlZA
	ESbHIR+mW6t03usbQQQSNjtNyORNiOifaEDGdXhGK7iXG8IivbACsr3Em8oQyzKovcTdVsP9BMS0F
	qqT501w1JTeI/ZF7V6d3WxEj35FMsF5rIXZ1Qei+pM+/rw9GLtnJfIQZb3IJZVhHnHFxCfKYIdLzF
	ECVRKqVaj1nLicFVq0o6xTl0wJ3MhJrq30Ok+1aDI1A+zfklEzhbkE9678KLv7G1ksV7QMVo16Wkq
	OkwIhyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBWa-00000002CRb-27hm;
	Wed, 30 Jul 2025 18:27:36 +0000
Received: from smtp-77.smtpout.orange.fr ([80.12.242.77] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBU5-00000002CIW-0BjL;
	Wed, 30 Jul 2025 18:25:04 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id hBU1uXDqxjmWBhBU1uNSd5; Wed, 30 Jul 2025 20:24:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753899898;
	bh=K4L6S9AIfcJmSktpYUDEepH8hgI/JaLBu8Gt3usbxsU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SM8TWMmvKS/4qkzNc44dLKl7l3TO+THTVs7zsKsSAV6n1jAeZk4X3jiDrlQecbk2d
	 dIVqKLjbxjqYtRhKiZIIeaB2JOM3X1Z1yGFTOFn9p2Z0MaBsMkB9/d0ZfZlkCa+WTh
	 wrb8IDi4uASeiAazw44XGtPOfzjpDpw9b0LXD0izdP4+THJDLBwcbZkf+wUHcyB+GJ
	 hKXGgOnkPpn9lpDzoSokLTbkAnoBzdbpThTV572lBjBfXPYi5Fp13LgGZ+urmaoKC7
	 BvNhOnBvcWSE2uMo6hsaK/C/8BJO7Jw7uWqBckVVN6QkC1iUOikNI0U7Bm7iS6lu5l
	 LyJpKexqVM5SA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 30 Jul 2025 20:24:58 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: rkvdec: Fix an error handling path in rkvdec_probe()
Date: Wed, 30 Jul 2025 20:24:44 +0200
Message-ID: <00b13063525c2aee6a60a7f6810f69c12bf2a866.1753899866.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_112501_485956_35D723C9 
X-CRM114-Status: GOOD (  13.35  )
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

If an error occurs after a successful iommu_paging_domain_alloc() call, it
should be undone by a corresponding iommu_domain_free() call, as already
done in the remove function.

In order to fix the issue, move the corresponding call at the end of the
function, because it is safe to allocate 'empty_domain' later.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Compile tested only.

Changes in v2:
  - Move code instead of handling errors   [Nicolas Dufresne]
  - Add R-b tag

v1: https://lore.kernel.org/all/b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr/
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d707088ec0dc..6eae10e16c73 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1159,13 +1159,6 @@ static int rkvdec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (iommu_get_domain_for_dev(&pdev->dev)) {
-		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
-
-		if (!rkvdec->empty_domain)
-			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
-	}
-
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
@@ -1188,6 +1181,13 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_runtime_pm;
 
+	if (iommu_get_domain_for_dev(&pdev->dev)) {
+		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
+
+		if (!rkvdec->empty_domain)
+			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
+	}
+
 	return 0;
 
 err_disable_runtime_pm:
-- 
2.50.1


