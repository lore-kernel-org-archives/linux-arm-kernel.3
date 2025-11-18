Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F938CEBF93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=klXOwzVfCdFv6kE/oztVwPMZyi2Nita0y4UqhyV+Vs0=; b=YCqgq50LNMKwNVDk94tVJHB4ek
	84Vx3OMWIATQ+HbWi31RLQ2mzNjCgheBZNqory/DVdZPpzQvLZfXH5GaGHqtY1WH01BOm0QemWn7v
	gD3bsBZ2Tu8uQB19xWS18QYRMG0Lbcdj6s+GLHzxQg7aasyBDAL6SvcpcPx3qMJmawJGCmiIrx+kn
	b/Yr0j/RB2MRvblZTIOzYFYEZelYok36pceh2XesT8GFxgNisMs8rEdEaD7o1EzW1NJwEFgtYUpL5
	o5LZdp1tpkIVyAQHs+9+wPMXST9hQss8DqmTxNPLyg6xWQ/oqWQXyNUPly/UNaOWKL30QxyNS/ckp
	nN0Jzf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLI2t-00000000A4x-2mdp;
	Tue, 18 Nov 2025 09:30:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLI2r-00000000A4X-4AD4;
	Tue, 18 Nov 2025 09:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2958D408DC;
	Tue, 18 Nov 2025 09:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2CEC2BCB7;
	Tue, 18 Nov 2025 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763458238;
	bh=tOu+3QhGuuDUjW3b2MoMTda+xPJWsWqfa+W+4ERtsYo=;
	h=From:Date:Subject:To:Cc:From;
	b=Dqu85j1kAi1yXDgIocm6rrIfGa/E8aUG68YauY1J+/qeqeozh+BQ+22MOVE6xIwk8
	 lMPYTxYUNktodSqZ2RsfqQ0JMVumXgkMGCHeY8H1ZjHJWx3IlzHd+nvgT+SSyVaICr
	 +VQSaigDUJY3sO079M7GgWzaLG1UYA3hHcno123UucUXh69la8k89ofEWmDYYNO5lf
	 Tb/U+2qCsW5ESS6TpSZfXP9hRa/988QxBx+zh5tQgkETBQey94Z9picqO1ZDN7fI61
	 kmQlwxvQ5RiIEXl/w/Zyh9hY/wgd2UEicpUDLJy1suko1lMw1/Dtm4ZwR0/F9Hx/io
	 KheBrdgYJZsuA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 18 Nov 2025 10:30:26 +0100
Subject: [PATCH mt76] wifi: mt76: mt7996: Add missing mutex_{lock,unlock}
 in mt7996_mac_sta_rc_work()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mt7996-rc-work-missing-mtx-v1-1-0739c493a6cb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBA0avIrDtgxGjSqxQXMZ3YoRjLjKgg3
 t3Q5fuLf4KSMCk8qxOENlZecoF5VBA/IU+E/C6Gpm6sMcbhvPbedygR90W+OLMq56nkA8NI0bo
 22S4kKIOfUOLjP38N13UDm8pZb2wAAAA=
X-Change-ID: 20251118-mt7996-rc-work-missing-mtx-abec584f56af
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_013042_057934_5B99F56D 
X-CRM114-Status: UNSURE (   6.98  )
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

Grab the mt76 mutex running mt7996_mac_sta_rc_work() since it is
required by mt7996_mcu_add_rate_ctrl routine.

Fixes: 28d519d0d493a ("wifi: mt76: Move RCU section in mt7996_mcu_add_rate_ctrl_fixed()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 8ddb6d69f0da2c49b72bd516dd380fad959eb063..2560e2f46e89a4bc46e21d796fca80b7decefa5c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2890,6 +2890,8 @@ void mt7996_mac_sta_rc_work(struct work_struct *work)
 	LIST_HEAD(list);
 	u32 changed;
 
+	mutex_lock(&dev->mt76.mutex);
+
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	list_splice_init(&dev->sta_rc_list, &list);
 
@@ -2922,6 +2924,8 @@ void mt7996_mac_sta_rc_work(struct work_struct *work)
 	}
 
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 void mt7996_mac_work(struct work_struct *work)

---
base-commit: 09600421ffe2acc1a00ec466b25485f11b6bb957
change-id: 20251118-mt7996-rc-work-missing-mtx-abec584f56af

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


