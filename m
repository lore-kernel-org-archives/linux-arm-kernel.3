Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A620CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tvUe9bk3P9laRwdg5hlzaH+TGA88Jse6i/MxwlL5CuE=; b=ENpYX7JeSJ4JN5
	GXJ4IiCvvqnVCSRPi+tpK73Hi6gQV35f5B8VL/qOEUKaPO4dkjLhyJpel6yBaLMwCAKyLgAKXa5lI
	1ntSWO0J3uKXB4QSz6QVkr4v6kO67oLInoAFGMPAroOqg2knH7aUWXwxFX6CGJxdCcYQcgrjN1IGG
	hsH3m3OxwYf8m7f0CcYQVI5BtRAPWSjyPerAjQd64gnXteaHukfujKbYmv+IPI0Mk97OZR0989Pr3
	eKEUhz5OV5FHJDO53NoU26CcCjiq3Z02BSDLhBy8R8vzcfF7+rDAcm3pZYR7Efj8J+T720fYalVMv
	b8/OZc1CHl3C015YKL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5He-0000000ADZ8-0egC;
	Thu, 04 Sep 2025 08:25:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4qH-0000000A2k5-2yd6;
	Thu, 04 Sep 2025 07:57:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C17442B1D;
	Thu,  4 Sep 2025 07:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FD7C4CEF0;
	Thu,  4 Sep 2025 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756972632;
	bh=PrHRyzcSKzKMyEeBhSvkydnyJ262xjKrBuA8xcLVjq8=;
	h=From:Subject:Date:To:Cc:From;
	b=UPne19rhYUcLZyR6q5sKNVyxPvwYs7xivNv7T+ELHs7UfCy51CAldtOxdRGxYUKEX
	 viFwu7fFUO5iufbUXQqwTgffDQ014izUNdufRZhFmx9AF0OFIe0v70IuvV3CqPAlPm
	 0WErKPbiJqi1BmZyKcohz+818odTr6VsaPvl2E3pVwerfY5amS33O45CmpXKAbCcfY
	 zldI0LKkj31/5xbcM9CX6c6Qmkua7xP8WgHS7Sdok/HXmxo4jY8qAeC6/yjZOi0Zb5
	 hu4b1x7M9U4KHowGqXWyuTBLOedifg4vWmLMJfZQ5hQkoKozMKfnPcdfqKIcCovgpN
	 p7plIUK6ItpZQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/4] wifi: mt76: Some more MLO fixes for MT7996 driver
Date: Thu, 04 Sep 2025 09:56:38 +0200
Message-Id: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZGuWgC/x3LQQqAIBBA0avErBuwgVK7SrSQGmsgMzQiiO6et
 Hx8/gOZk3CGvnog8SVZ4l7Q1BVMq9sXRpmLgRS1yirCcGprOwxbxBATo5ebM2oyqjHkvO4Yyns
 k/kNZh/F9P5y9gnBnAAAA
X-Change-ID: 20250902-mt7996-mlo-more-fixes-7280182af76e
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_005713_772754_CFE4B7A9 
X-CRM114-Status: UNSURE (   6.65  )
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

Add some missing fixes for MLO in MT7996 driver.

---
Benjamin Lin (1):
      wifi: mt76: mt7996: Temporarily disable EPCS

Lorenzo Bianconi (1):
      wifi: mt76: mt7996: Add all active links to poll list in mt7996_mac_tx_free()

Shayne Chen (2):
      wifi: mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO
      wifi: mt76: mt7996: Implement MLD address translation for EAPOL

 drivers/net/wireless/mediatek/mt76/mt7996/init.c |  1 -
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 62 ++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 6 deletions(-)
---
base-commit: 12cce7624371dc68245356ae390bde93f84aed3a
change-id: 20250902-mt7996-mlo-more-fixes-7280182af76e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


