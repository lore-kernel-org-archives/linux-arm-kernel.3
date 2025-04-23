Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D4DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BzRbmbdVH64WkPtUMsoKFbvdXYbRjm6+e5C6pk5/ync=; b=lmdpGPnqAV4hXYpU10SniZTfo4
	FVQ/xB/6CXIz0r//Dfkht4CJuklMnu1IyD24kDtZQFtTBNmyQwwgAYcw/9J936vuOJQ+Tq/00zm1H
	8Qcr/IH7BMJeOsQAQbplS0t1+VwRUDrsXjs4ten6+p7kxd2GLr+ZTPreBizzUOKxGpQ/WxHtdUjqZ
	N0ab0ii1ALFHs06ek3OqsjZ8NkaUFEQ6KwSD8W2mKxN6seEfHITqbG3ev4VNCdQg8m1s97b+/lkvd
	VvxK2OAvywpInj8u90V7z6ynV42pu0DD2PBqMj6m8gurQwApZ8wiz3mZ564n52LlTpI9gNG4jmrzW
	8zDX86mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6A-0000000BJWN-1g2T;
	Wed, 23 Apr 2025 17:41:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bi5-0000000AukZ-1fS1;
	Wed, 23 Apr 2025 15:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=BzRbmbdVH64WkPtUMsoKFbvdXYbRjm6+e5C6pk5/ync=; t=1745420903; x=1746630503; 
	b=UhkEMdVUFOYtZ1jyHCmrTl+0cZv/AbXH1cz0CaMtbecxNTtf8it8q835MxAVK4o0sKKwDfKQhmV
	KlErgQOzAa54BIJsUTTRTDqL8DGcBBl3LnkWqUoX+IvNpVCNn8uaePbdDgqVTdYK86iHaLXQ6pSBi
	6CRjqcvoSd/gcvs2NjJfHVyHf/G5HScXUvSk8D6nXbCwFvVM8DK7jqyD9T4wxYWgtIYjRwaCXWQc1
	90Q2bmAC8ccO2KaN03CaaDMNB36C7eLPFwNyhOxjmjlOdm9Rwe42n6p9dTnwFqr1XNogwaZycKVss
	0AWM8bWiRko5ODKdyIocKbrww0W+FeqRqR6g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1u7bhz-0000000Em2o-10Yf;
	Wed, 23 Apr 2025 17:08:19 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH net-next] net: ethernet: mtk_wed: annotate RCU release in attach()
Date: Wed, 23 Apr 2025 17:08:08 +0200
Message-ID: <20250423150811.456205-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_080825_436275_ED42728A 
X-CRM114-Status: GOOD (  12.42  )
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

From: Johannes Berg <johannes.berg@intel.com>

There are some sparse warnings in wifi, and it seems that
it's actually possible to annotate a function pointer with
__releases(), making the sparse warnings go away. In a way
that also serves as documentation that rcu_read_unlock()
must be called in the attach method, so add that annotation.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 include/linux/soc/mediatek/mtk_wed.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index a476648858a6..d8949a4ed0dc 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -192,7 +192,7 @@ struct mtk_wed_device {
 };
 
 struct mtk_wed_ops {
-	int (*attach)(struct mtk_wed_device *dev);
+	int (*attach)(struct mtk_wed_device *dev) __releases(RCU);
 	int (*tx_ring_setup)(struct mtk_wed_device *dev, int ring,
 			     void __iomem *regs, bool reset);
 	int (*rx_ring_setup)(struct mtk_wed_device *dev, int ring,
-- 
2.49.0


