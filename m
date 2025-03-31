Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DB0C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BzRbmbdVH64WkPtUMsoKFbvdXYbRjm6+e5C6pk5/ync=; b=JkgcXzrb+kUxwzLrmzWYMKhwkY
	V3/suR5da+dlFIbg1XJNGTC1GastOSSFWpxKjbnivXO3e7OEe6rDx+UVY/+gjenEejsTQadLBhDT/
	yeEz294N5IbSNruSW3CmXXgKIZ5TqoOfggJIxaOm9JukIQSwuh/OZiAuzXU3Wbwoi33W2/Wr6b38w
	9WezNI3mbo97AFALtKe87NjVAtZLS20te0JjzhntO5N1REguYO2adhKENwTOlNKOL7tGH4x/FVjte
	0DaDz8rlNJRJnUFZTsfFVXn6LXDYIDeCBJnfgjDRlFAX9h5oMszEm/Xp/P4lW1NthkAMYSJG9Kakc
	IW/FWxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC6w-000000001wK-21zP;
	Mon, 31 Mar 2025 10:11:18 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC3N-000000001Cv-0uZa;
	Mon, 31 Mar 2025 10:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=BzRbmbdVH64WkPtUMsoKFbvdXYbRjm6+e5C6pk5/ync=; t=1743415656; x=1744625256; 
	b=q6RhXIMWRvU+mDixzHfvx2SgbhlTiHEHWPTWwC+3EYj9p0OgfzOnB152Qw5Dkmhv6Z+17KlJi/N
	fDMi5pGsIJeqz8sDIgcJiTEuJYsbFwqep4KzhZVXbC8NQ5sedNeBSKXN0hxLHuWqVxbwql6jNtY/X
	gC7q/XEyPGI+HdV2yhGpLiVo2DtDzK1e9PDuc2/V+tIRo59G/g2uYDuzLm1BCsBN7P7hxZ4scKnPb
	3h3dXBX3Tb643WaVekiWDTGfGbdNa2af7BaSuMsHidfnbBXTOrODsb5grMImpJRHVkxSTRsHzoeSA
	O1VB+zu6t0MnQZlAy4jsWl2V8sX4InMHcB9A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tzC3K-0000000B8h4-0OPy;
	Mon, 31 Mar 2025 12:07:34 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-mediatek@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>
Subject: [RFC] net: ethernet: mtk_wed: annotate RCU release in attach()
Date: Mon, 31 Mar 2025 12:07:32 +0200
Message-ID: <20250331120731.ac482033a33a.I550c501b29788714dad469cf99e2a81ed06d0565@changeid>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_030737_286633_B4AF0D9D 
X-CRM114-Status: GOOD (  12.90  )
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


