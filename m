Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87268FD8FFB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ihCtXKGi1aJ7/jPGgagG1iiziFIVSP2pX3HG0KJ2yIY=; b=t+1EStWGOjD87i
	C1GQs+bKG2kp2hahV3bTYDIJzara1wWipDmHtNs/hOxgAkrbxone6vcfp2h041VR7h5r4n+h21DrL
	lk0kDCPkcUIMj5cTjk2D6+z46GdllMSCQItv500H5/fpViwcxp2LJm7D6/5cVxlkfNZqlPOpnvPA4
	7/Y7E1o6GnJWOaQNg+6CgRtnbAy9C5NmgUEV27vdo2ESWhjWZJlYIsgmu8c1aMQN2JxDs8R49xBzg
	L7BrEG6Wu9SlCCyg/gXNS1an9oF1JKu3EuyqAooaMmyEY1mPxAn3pNzDqs7/BUpjQ449syjlvDTNJ
	dTecZVqCVZsow7wsd9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgm1-000000071rz-2lNT;
	Thu, 26 Feb 2026 19:11:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgm0-000000071re-3CIc;
	Thu, 26 Feb 2026 19:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE4B4600AA;
	Thu, 26 Feb 2026 19:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB37C116C6;
	Thu, 26 Feb 2026 19:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772133103;
	bh=Xvc/uex8GcERGA559dxvK49CKwAjLVlFT4RI0I/QFHA=;
	h=From:Subject:Date:To:Cc:From;
	b=lsq1LBNlkafKUl/8E9voZBtBjfkOixZ5Whl3tPt7vQATYnt56l1DDTkQcUOFbyXMJ
	 zJh6A8WCPisgq6noIzUpR2JT/87FazF+cu1UNrIdG26UN59Ybmeg39ZMQf+NYawRjC
	 hHFJuKpW5/xFFRbnKFXIhwG6zrObNUVv7NbB8ezIfSSAYCJLDVe8Rq7uD6k/rH4Hf/
	 ZgQwP1onCjsfZDPjaUX2Cqn++FNylBUlnLqWVucSJw31GgwB5Gr32rPAMS+CG8HNPr
	 UglMOzzjXWpBnDtftBxvS9SBwJzasueXXcJ2iJKVuD47rycwnHtBSDEQiQVfyUayEk
	 3whfnr0oX5RCg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH wireless 0/3] wifi: mt76: Fix possible out-of-bound
 accesses in mt76 driver
Date: Thu, 26 Feb 2026 20:11:13 +0100
Message-Id: <20260226-mt76-addba-req-oob-access-v1-0-b0f6d1ad4850@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QqDMAwAf0XybKAG6ep+ZfhQ27gFpt0S2Qbiv
 6/4eHB3OxirsMG12UH5IyZlrdC1DaRHXO+MkisDOfKOyOOyXTzGnKeIym8sZcKYEpth6AMFN5A
 LXQ+1fynP8jvfN/iK8rNaMB7HHwOzEMp1AAAA
X-Change-ID: 20260226-mt76-addba-req-oob-access-848280920814
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 MeiChia Chiu <meichia.chiu@mediatek.com>, Leon Yen <leon.yen@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, 
 Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hao Zhang <hao.zhang@mediatek.com>, 
 Nelson Yu <nelson.yu@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Check mgmt frame length before accessing header fields in order to avoid
a possible oob access for injected frames.

---
Lorenzo Bianconi (3):
      wifi: mt76: mt7996: Fix possible oob access in mt7996_mac_write_txwi_80211()
      wifi: mt76: mt7925: Fix possible oob access in mt7925_mac_write_txwi_80211()
      wifi: mt76: Fix possible oob access in mt76_connac2_mac_write_txwi_80211()

 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c      | 1 +
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c      | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260226-mt76-addba-req-oob-access-848280920814

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


