Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92609D2F7D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWofNQaDyYt398seRN716BHuIjx6Be+S6Tk80s3q5n4=; b=lU6fYh2nSf/IDOpgSekZ27pnoz
	LePG0I+qeqxpIUdZ+Rt6zIUAyfftvDiB7Y8COMGAdwT+7mETo3lZ2mAm/zenB2F1lJJMA+zJB6l7S
	9OxGVd0kYPXniBbOrBm4jzjE7YZ8n6M8Xfvr62JIXL3bH0e4QePMw7I9ECBu5JFhvttkJuPPI2v3g
	s7rtoxFzOZtKfWk8e7mu6iMtSxbIGyz3J60F4t7X4ZN2xFdo7UHYNB0ZnPVzCMAzR5/N8P15SVWxN
	krmv5M854nlO5d+/bG8SzCKlO1B+d70296NVOIC+LIoGBB8+xkHR/DqTxTi4YKX9dpbPeoM66LDaZ
	R8/oNCfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzt-00000009Noe-1wUY;
	Fri, 05 Dec 2025 10:25:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSzq-00000009Nme-49lD;
	Fri, 05 Dec 2025 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B5B9442C0;
	Fri,  5 Dec 2025 10:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274BEC113D0;
	Fri,  5 Dec 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764930306;
	bh=xVy6mYUJY3M3YBXRdoJaYabe4kSYexCVeSPnndn/gEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bmU4VHN0JTGck/+aXil0P9YXvN2aCQOOMt9WL2epaufp/OQUcWSxh3uwVcReG+OGT
	 l6iIHJ08RPh23wfXYEggWrTWCkU73D0dHUlDwrQ1wBbw4fI7myYWjcknVIed7/h65Y
	 m3QQObZgoRbT6QYYZQEUx72csenXHUbbB9qfvJpwNI/ts8ljuZ9yWBc0ZsYNiT7Ala
	 bzjLqlG8Kn6o/lIGuAYXRQlgjO5Dcb2+A/C8ttLH3kHpwq2AcPpPv+hHHgLkHkkwc1
	 tOYiusms6dVqqJ/jK42XvivjG7rtkDE0I6o0gHDlT3uOHhsZjP4Q0ac4Ja5y5c/lQq
	 ihSdgY0MiAxWA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 05 Dec 2025 11:24:39 +0100
Subject: [PATCH mt76 v2 4/4] wifi: mt76: mt7996: Clear wcid pointer in
 mt7996_mac_sta_deinit_link()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-mt76-txq-wicd-fix-v2-4-f19ba48af7c1@kernel.org>
References: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
In-Reply-To: <20251205-mt76-txq-wicd-fix-v2-0-f19ba48af7c1@kernel.org>
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
X-CRM114-CacheID: sfid-20251205_022507_076523_AF145E7C 
X-CRM114-Status: UNSURE (   7.29  )
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

Clear WCID pointer removing the sta link in mt7996_mac_sta_deinit_link
routine.

Fixes: dd82a9e02c054 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 1baace971ec3511dba3e8a64c236a2b55f9dbd36..78151197feccb0197e44f3f73c0f01c4589314ae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1027,6 +1027,7 @@ void mt7996_mac_sta_deinit_link(struct mt7996_dev *dev,
 		list_del_init(&msta_link->rc_list);
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
+	rcu_assign_pointer(dev->mt76.wcid[msta_link->wcid.idx], NULL);
 	mt76_wcid_cleanup(&dev->mt76, &msta_link->wcid);
 	mt76_wcid_mask_clear(dev->mt76.wcid_mask, msta_link->wcid.idx);
 }

-- 
2.52.0


