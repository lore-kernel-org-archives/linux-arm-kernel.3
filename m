Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3E0CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=393bqsmXwyxm8Vc7XcNKcrpAgydkDTZUDAAf2WZAnOY=; b=SRcZ96UeOax6oCiesvgjubpB6U
	o6Tv0JTEYJWNKEmzVBiEeFTiDadUOlvphLhZW7Yxu5MgjUERUs8PJKUgdm+EmUkgoORY50bCVBCTf
	NR5/gBIo6d/EPWe+Rg9n6wedkbEX1WcB2rshWKdLtQXplA2TDfGyIUb01biAuQeDwI8Bw5YfVcfL4
	gIjnFPgJE6aNYFIne1b3Z89rd9CSnyHdnxg/gtxHpoooZBoaN6Tl0TLG7uldrzf4gqzIUIcR9mbzr
	rPhCywLgXCBOKrv2WVv4P71KJGPDTakumpYoKXkWQGce8vYh0dPuHqxl3zlukh9FhqpWMCyV/LOiV
	NXYZwr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqorw-0000000Az20-2Zfv;
	Tue, 26 Aug 2025 08:17:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqonx-0000000AyRY-14wL;
	Tue, 26 Aug 2025 08:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFC434423B;
	Tue, 26 Aug 2025 08:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9F7C4CEF1;
	Tue, 26 Aug 2025 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756195999;
	bh=s4iG796SpblwfefRkKQPUe+QpyGgGkIMxALCGJUdOGU=;
	h=From:Date:Subject:To:Cc:From;
	b=GkYsF8PnyxOTjyj4LHcO0EpT8UbDDVBN+FMqY6PDbBmVE5YRDpu/mfwQth36T7Bzz
	 oj8GFG46+G/gM6fB4r2h5k2NFkiWug3K4vZ5t8cG7sfzPc3JFg3K2mcSqc1uuw38AB
	 SGysBf3gUGaZuXmGMciMJgZbISxsECkT+Jt2bIxHRH39KurK3xKcLuSOS7YNg6ER1W
	 oI/TabvEzjKjMlGHX6qHwgeVkQs30t9FRLmMmFt09RkwCd2tN6mLJPwNLtgBGNOt/4
	 Xvh/HFbJvEw2USrQ1nA2IRIT/8/5xlo4LDiawAojWbqFvwJCz+Ri+g6wLr1F9gzXaF
	 Nv207cqGce3aw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 26 Aug 2025 10:13:04 +0200
Subject: [PATCH mt76] wifi: mt76: Remove dead code in mt76_scan_work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mt76_scan_work-dead-code-v1-1-ac5234c4d044@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI9srWgC/x3MQQqDMBBA0avIrDsQg46xVykiITPWoTQpidiCe
 HdDl2/x/wFFskqBe3NAll2LpljR3hoIq49PQeVqsMb2xlnC9zbQXIKP8zflF7J4xpBYkL0byS0
 dkemg5p8si/7+68d0nhfkHAqKagAAAA==
X-Change-ID: 20250826-mt76_scan_work-dead-code-da8968f46604
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_011321_403739_F5500DB8 
X-CRM114-Status: UNSURE (   7.21  )
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

Duration can't be equal to 0 in mt76_scan_work routine so get rid of
related if condition.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/scan.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/scan.c b/drivers/net/wireless/mediatek/mt76/scan.c
index 9b20ccbeb8cf19d3c231b82121c1dbeec8ab8a33..458f8cdebc1088c2c52360a2b004cf163b0e7e8c 100644
--- a/drivers/net/wireless/mediatek/mt76/scan.c
+++ b/drivers/net/wireless/mediatek/mt76/scan.c
@@ -112,9 +112,6 @@ void mt76_scan_work(struct work_struct *work)
 	local_bh_enable();
 
 out:
-	if (!duration)
-		return;
-
 	if (dev->scan.chan)
 		duration = max_t(int, duration,
 			         msecs_to_jiffies(req->duration +

---
base-commit: d9104cec3e8fe4b458b74709853231385779001f
change-id: 20250826-mt76_scan_work-dead-code-da8968f46604

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


