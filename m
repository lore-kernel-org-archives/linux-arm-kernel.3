Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9904AD20683
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0LHCCdnddYjx/7QEARYvl0k8iwfuy+IgXvCmYkI98VA=; b=vLnD/PhRRq4fJ5
	de44Vg2JzSif6K2mA/OYC4J2QLma7FyTUWk6RQwzv4q2nky6PFTYNPFNWp4pK+bQVi3JaX40XnUO2
	cn958X54uf/VRleIcZAxpUKNySzADudxo7WLfuEdP8hlKhNnsvDHyz6/GEwFbp7tQ71EIZ/Ge1mUA
	6YyRwY1J2IJn27Xe8IezkpHkdWLpJyTRpzPaWmE8zlRcu0uB06bN2cmQga058YLHki+xMcAftyW0Z
	/PsV2E2D5IIY9wf7p0L3X1XzYe0jYpifpz5IjA6Uld4Az3EebXgQtn5JaqR6l5ambu2mCziIi8H0R
	h3COPM9IL+wu46UO2Xbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99a-00000008202-3ef6;
	Thu, 04 Dec 2025 13:13:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR99Y-000000081ze-0nao;
	Thu, 04 Dec 2025 13:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D17B741502;
	Thu,  4 Dec 2025 13:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CF0C4CEFB;
	Thu,  4 Dec 2025 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764854027;
	bh=LX5m6gmwF2s+hTAWnWC6SZ5hgbfLK8EmTlC3zSOFwfA=;
	h=From:Subject:Date:To:Cc:From;
	b=E/aDWsxu6fzANFFFSSV7NbiDgPUyieLItRp5Zo+HplFWE3rwdBZpTGZdQUoU/ftrd
	 yGYNniyAzs1b0SCzXgPKJyECpfKy5sFMiYyE62KCbzdtQ80vszsNW3kikIyvQoQK/v
	 dZnkExaXSThnrIkRFzT8Hv9uuxhVdCXB/G7TqSkb+/v7njZScPECqeu7liw/7J/YvR
	 GKdTXIQkGlJ21yLQlkr0PsBlteJzupaZgnRrRyIMLbRWVcNEoYrqB+fdYh8NS5a3eU
	 vUEK7fvZpyebiWixNJCe7QB5DQPv6KoGug9iy+gZeG48UIcP7kLt/Byf2Zr9qqPAE0
	 AsWn91dxxhUKg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH mt76 0/3] wifi: mt76: mt7996: Some MLO link management
 fixes
Date: Thu, 04 Dec 2025 14:13:27 +0100
Message-Id: <20251204-mt76-txq-wicd-fix-v1-0-1f4b2f2b3b2c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7biEXM+or0SFyqz1kpVGC9Pek4
 wzMJAjshQN0RQLPtwTZXQZVFjCto1sYxWYGqqhWVGncrsbgFU98ZLI4S0QyzahbrQwRQ+4Oz1n
 /z3543w+C1aQ2YwAAAA==
X-Change-ID: 20251204-mt76-txq-wicd-fix-267a4941622e
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_051348_250481_84B6BA78 
X-CRM114-Status: UNSURE (   5.79  )
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
Lorenzo Bianconi (3):
      wifi: mt76: mt7996: Set mtxq->wcid just for primary link
      wifi: mt76: mt7996: Reset mtxq->idx if primary link is removed in mt7996_vif_link_remove()
      wifi: mt76: mt7996: Switch to the secondary link if the default one is removed

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 84 ++++++++++++++++--------
 1 file changed, 58 insertions(+), 26 deletions(-)
---
base-commit: 53d1548612670aa8b5d89745116cc33d9d172863
change-id: 20251204-mt76-txq-wicd-fix-267a4941622e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


