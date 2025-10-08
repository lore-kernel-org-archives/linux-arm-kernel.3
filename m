Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C628CCD186
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pk7nHUBWvA9ZREgKoGd5GOoA7FY8vaVx9s+22NRuRdw=; b=jTUM7dChzM0BKw
	uEwGvFx5S/+7c73W48UyXxKhcMy6oNQKB5EcfSkoicyXfYDAggzbvtQRVtmsfJOpa7sVekcYtAPXf
	CDONfxpquwxMBkd0RA5/hnGhGTEKa4Io4ykwxDmr7o3Yj/gis+cUJtEDkxvuerKzvJnt+8e6VlHfd
	8z3od1yXwsg3sgVhWKRWGseN2lG5XoDsqk61XgrrSKwgwDGzwpVxj70FCtdr/y6CgF3E3FUJmTnJQ
	9Fl+/wz1hpBbASyBEX2ZONpqeYcrLfCoDA3jcW8zxrLfNoQen7v1pjDtxCB3a05Mk3WK7ap+AcjOv
	2pYO4SPxC16duMsqJZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Rci-00000003exQ-1Jbm;
	Wed, 08 Oct 2025 10:42:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Rcf-00000003ewe-3rru;
	Wed, 08 Oct 2025 10:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46FF7458D3;
	Wed,  8 Oct 2025 10:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57E9C4CEF4;
	Wed,  8 Oct 2025 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759920137;
	bh=zCzqtx8PrsUZlytdxWSC6x4RVhvhP271Uny0qjitfKY=;
	h=From:Subject:Date:To:Cc:From;
	b=eRUEUgzi0Dr5Y0l1F7iAybam94bhUKuISp8kWW/pJ3NCfJldHz7OKyJgMHN+kZkmO
	 /2dgjotT4IdRmz4P0gWmd39g5Daj16IfGkbHYHN62+HihzdVaxBdxOGUZKZtCSAskm
	 jJN8LrFXE/0n2eFLWxBn2Mg+9GgjJBHfyj6VlqgNFY32r5F/r6VW8aB4PtpxSCHfGG
	 6ftFh34BF09ifEcXSiZwoYav0mMkF1axA2ZKMxrvrH+O0UVJCyEeoDfU+TgFKE1+Un
	 DZKAmRZe9TepJIY2emlFi3a5aIuK88XtxWXSLyHSR9ZU/S5id37xcuqvsiIPj8JdNe
	 O4m9zpvBJnKng==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/2] wifi: mt76: Some WED fixes
Date: Wed, 08 Oct 2025 12:41:47 +0200
Message-Id: <20251008-wed-fixes-v1-0-8f7678583385@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOs/5mgC/x3KQQqAIBBA0avIrBN0yIyuEi0ix5qNhUIF4t0bW
 j7+r1AoMxWYVIVMNxc+k8B2CrZjTTtpDmJAg84a4/VDQUd+qejYD6NHJLTOgfxXpj/IPi+tfdN
 plUdbAAAA
X-Change-ID: 20251007-wed-fixes-f468722e2155
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Daniel Pawlik <pawlik.dan@gmail.com>, 
 Matteo Croce <teknoraver@meta.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_034217_988102_7C66A444 
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

- use GFP_DMA32 for page_pool buffer allocation
- fix wed crash on 6GHz band

---
Lorenzo Bianconi (1):
      wifi: mt76: wed: use proper wed reference in mt76 wed driver callabacks

Peter Chiu (1):
      wifi: mt76: use GFP_DMA32 for page_pool buffer allocation

 drivers/net/wireless/mediatek/mt76/mt76.h        | 12 +++++++++++-
 drivers/net/wireless/mediatek/mt76/mt7996/mmio.c |  1 +
 drivers/net/wireless/mediatek/mt76/wed.c         | 10 +++++-----
 include/linux/soc/mediatek/mtk_wed.h             |  1 +
 4 files changed, 18 insertions(+), 6 deletions(-)
---
base-commit: f4c70f6e7bdbffce882bed0fb8c78d135458a029
change-id: 20251007-wed-fixes-f468722e2155

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


