Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9F5D2F7D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T7e2Hcul9HfyPfeSApSfmdRkW4WBHd/VfKe5KKth8xk=; b=gDeraLvGXh9L4f
	fz/qOZXCrqPO609eLTg6atw6bE6IlISaFlpshY4fALg1GBvvzHsDZlNnbDPkQofTGh9UUZ6WmtwEh
	KpeFI6wXUZ/Cep5XEGDjisexYsIdAsVS5OeFadv+c35etby6dfxcL8kkxpqglGbceDOlftFfIAanq
	olcacMk3HmRpPv3mzv6n8MMAxSifoIkflXrvUf8yc0sAvlvdepHhr4pvW5+wDMAJdz4KREJep9W8c
	6LVrGDxsGvrCGVh0ris+8yRVNL4TI+1IG1ePW3MUFHSkah4aI2T8OUyxYCY5z+QV6vTXupW4VhyMI
	mmQ92qYNV3qFwDVy8iXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzj-00000009NiK-4AhG;
	Fri, 05 Dec 2025 10:24:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzh-00000009Nhi-1g0B;
	Fri, 05 Dec 2025 10:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D519E437CE;
	Fri,  5 Dec 2025 10:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65067C4CEF1;
	Fri,  5 Dec 2025 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764930295;
	bh=QoqGL3t+IzslFi3fJoCRUrQYkQAMnqJUdwxlYp3/A1Q=;
	h=From:Subject:Date:To:Cc:From;
	b=BxB4ml/q+mWTTucdlAEc5griRYi/lhxVKbDHjTV7kc40RhwuqhY6M5usV9eqocvDl
	 3fwH7b4JyVjB0GnFpnk2aiOXkU/qk1ccwRv8B8Csi50xMieZ+gY2qcYj9tqJ+XNfR1
	 hSGzlp+psnWFURyxH4G7P3OM8S7YRaEUp72I+Fp6nco5o7ayAL255UuPdGPnrcXKrG
	 Mylx1BSXxBuRqbOjdsIIJtaFg6qJz14fkNKKoZmolws56kt/JrHmLQUQsoIA4o8I3u
	 4rJ0nfV7aIy2xJECsC55Axg+l83+KPHf2Ts+8CLpGDaYssGzEGA/njHXwOtNUmkNOA
	 EUw+SmcUBO0YQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 v2 0/4] wifi: mt76: mt7996: Some MLO link management
 fixes
Date: Fri, 05 Dec 2025 11:24:35 +0100
Message-Id: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Rg6VoiuvIdhQWEKE7XVllQM4
 e5WDuDyveS/v0DkIBzhXCwQOEkU7zLQroBubN3AKH1moJKOikqNj6mucJpf+JauRyszUlW3+qR
 VRcSQd8/AWW/Na5N5lDj58NkukvrZf7WksERltSFL5mCou9w4OL7vfRigWdf1C1bQePuzAAAA
X-Change-ID: 20251204-mt76-txq-wicd-fix-267a4941622e
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_022457_486222_9B138476 
X-CRM114-Status: UNSURE (   7.47  )
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


---
Changes in v2:
- Add missing changes in mt7996_mac_reset_sta_iter() for patch 3/4
- Add patch 4/4 to the series
- Link to v1: https://lore.kernel.org/r/20251204-mt76-txq-wicd-fix-v1-0-1f4b2f2b3b2c@kernel.org

---
Lorenzo Bianconi (4):
      wifi: mt76: mt7996: Set mtxq->wcid just for primary link
      wifi: mt76: mt7996: Reset mtxq->idx if primary link is removed in mt7996_vif_link_remove()
      wifi: mt76: mt7996: Switch to the secondary link if the default one is removed
      wifi: mt76: mt7996: Clear wcid pointer in mt7996_mac_sta_deinit_link()

 drivers/net/wireless/mediatek/mt76/mt7996/mac.c  | 12 ++--
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 85 ++++++++++++++++--------
 2 files changed, 64 insertions(+), 33 deletions(-)
---
base-commit: 53d1548612670aa8b5d89745116cc33d9d172863
change-id: 20251204-mt76-txq-wicd-fix-267a4941622e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


