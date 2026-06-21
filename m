Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577BFCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FA1iBggbrT8LtjvILqVYWNQjXH5A8BjeFWRRbEVadXk=; b=vWXgCQsxQTiHF9
	aWrxOB9nrZ5iSYd4z0oY1fGXTd/r95C/5Flis9M0d84whKxQuCPN/1MBEXO5JllogTKGA78/0NRO9
	WarjHVwZX7zpybiF8QjYLHqd0Tk9gNvjNQ5Nvvq+bImB/yc7s93Na90RksJZgPeNTT+wOg0derDli
	BjPgN8hVdxpKfXVn7Tz1/LAQZZNN46zVAWga46W0168qFokqGsZZiqgBsS1BCHDFARK49MlKS4Wrn
	Qp+QaNU1WpBXXyJGr0l0X5O0vTdWUpa5UNGw112Zx4CtKdIZF7ZUvHDKLFb5N8EhGJuZOu6E5Vcfx
	9VJ+rEoAUmidyhn8vndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIB7-00000003xPm-35D7;
	Sun, 21 Jun 2026 13:25:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbIB7-00000003xPc-0Nlc;
	Sun, 21 Jun 2026 13:25:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 297EA60051;
	Sun, 21 Jun 2026 13:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291C81F000E9;
	Sun, 21 Jun 2026 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782048335;
	bh=FA1iBggbrT8LtjvILqVYWNQjXH5A8BjeFWRRbEVadXk=;
	h=From:Subject:Date:To:Cc;
	b=nhldWQSLZHRj8Isy56hp+wAMAG6/5QOFTcB6NEfCjvYz7Ib0pniMgIVNtVxj9utHd
	 kfPxkP0v4ArYPQmPtAW0kjp1a8JKGMYZMulESaSbUBQl723oQEFxHHa4ZxL7Di4snd
	 nVwBqNfdPrhsD2+J59gCqtgNJtdtGtFEBzTquP6E04Q8jDE9lvVSJg3tfJGtZJlzXr
	 CwHrBI/mDjpqE9dFknfdHf83ga+B6sqiYduMWnimt8kIOa+kLPstr+gCkwhmasDzQ9
	 q/uRagMV5xOi2s0wuCGRRMxycyOM45epArv5iASGFIqDgwvH4p+Szwi4jhkicOXm32
	 DY8ggP7r+2a/w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/4] wifi: mt76: fix some possible NULL-pointer
 dereferences
Date: Sun, 21 Jun 2026 15:24:58 +0200
Message-Id: <20260621-mt76_connac_get_he_phy_cap-fix-v1-0-ed4ccf7a0363@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqEIBQAfyXeOcHcsOhXIh6mb/MdMlGJlujfk
 z3OHGZuyJSYMkzNDYlOznyECl3bgPUmbCTYVQYllZZadWIvg0Z7hGAsblTQE0b/Q2ui+PIl1Pq
 RenS9k0MPNRITVf0fzMvzvBe5kT1wAAAA
X-Change-ID: 20260621-mt76_connac_get_he_phy_cap-fix-2b3068d4d074
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Leon Yen <leon.yen@mediatek.com>, Hao Zhang <hao.zhang@mediatek.com>, 
 Nelson Yu <nelson.yu@mediatek.com>, Rong Yan <rong.yan@mediatek.com>, 
 Money Wang <Money.Wang@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
 Howard Hsu <howard-yh.hsu@mediatek.com>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Quan Zhou <quan.zhou@mediatek.com>, 
 Deren Wu <deren.wu@mediatek.com>, MeiChia Chiu <meichia.chiu@mediatek.com>
X-Mailer: b4 0.14.3
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


---
Lorenzo Bianconi (4):
      wifi: mt76: connac: fix possible NULL-pointer deref in mt76_connac_mcu_uni_bss_he_tlv()
      wifi: mt76: mt7925: fix possible NULL-pointer deref in mt7925_mcu_bss_he_tlv()
      wifi: mt76: mt7996: check pointer returned by mt76_connac_get_he_phy_cap()
      wifi: mt76: mt7996: fix possible NULL-pointer deref in mt7996_mcu_sta_bfer_eht()

 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c |  2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c      |  2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c      | 18 +++++++++++++-----
 3 files changed, 17 insertions(+), 5 deletions(-)
---
base-commit: 50a7f9f9d48eb50c0e95bef53358acb5af5cb3c6
change-id: 20260621-mt76_connac_get_he_phy_cap-fix-2b3068d4d074

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


