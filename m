Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7EACEB2CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gxY8J6G7lmjdcfHur1gCZcyZXuJ9NaUx4zdI8oKmyxM=; b=aEdiYJZORACWiSg5cK1Pi7JgiF
	GoijCQDgpAUmSI5sknCMWj18TvcYFOwOdYi0qC2DKoHI8mioPhWZRbjGZxbpdlVmiZlCAh38aR6+q
	N6cLCvxFonHrp8+61lR/vwSOkSezKvijo3ZThtG8BBLB5YeszLnq9d6P5xz2CcI58ltEAkZUui6ux
	ZZG+FlUkfcmn6tXXWhuJJoc6d9tzMY5jpm/mzf505wEyVhLk7yZYhSVzLaoHZux/8ksJFVX1WckPo
	+EQ6+DpBx1Q75CbA0mgyDvUh4eJ/7QhFsrSEvK2ZsR8j3/1dul2R/cWVFrSYS9VJ5rKgITQNpGWtp
	d4LRg1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKDid-0000000Diky-3SLT;
	Sat, 15 Nov 2025 10:41:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKDic-0000000Diko-2Mwc;
	Sat, 15 Nov 2025 10:41:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF7C660137;
	Sat, 15 Nov 2025 10:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C07C4CEF8;
	Sat, 15 Nov 2025 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763203281;
	bh=C+X3st+8UpjihqtDRvUD3bqrMNbKj7L/DBIKr77EdFw=;
	h=From:Date:Subject:To:Cc:From;
	b=ULlhYEKdVCEU1NuJQmExRtCxT35mtj22m9dqoYA2O5M1IjBETPa5DabjWBJgq54Ou
	 7K95OGh9evYSt1V97uBCkS1nN3RGA4GMBJeMRQoNz6dGJutJKVpcDo1q5YyocjXfdn
	 LwmlJtBO1NuSYhXzFQRAnLEKE7At94o4dQaJMEiHY/6ep+UtXafGEQ80JUq0dR4O2d
	 9lm3OYheAhIU2wXqKNt5keCqMDtoi7zQQAee0wDvoCbo0m+FO3LD3HvX7ur58KPFAV
	 ByWc9DM3D7nB0FjNZ37n1LaoSBUrXaeojJUUrKdpzYz+8VP1X/CCnnHEsZ43niiwAs
	 s0XqxOy8ypYjw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 15 Nov 2025 11:41:00 +0100
Subject: [PATCH mt76] wifi: mt76: mt7996: Do not run ieee80211_iter_keys()
 for scanning links in mt7996_vif_link_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-mt7996-key-iter-link-remove-fix-v1-1-4f3f4e1eaa78@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDMBAFf0X23AUTTCX9ldJDiE+7WGPZiCjiv
 xs8zhxmDspQQaZXdZBilSxzKmAeFcVvSANYusJka+uMMY6npfX+ySN2lgXKP0kjK6Z5BfeycRv
 7pnPWRxdqKpW/ouj78P6c5wWvWat3cQAAAA==
X-Change-ID: 20251115-mt7996-key-iter-link-remove-fix-7cf4d529c5a0
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

mt7996_vif_link_remove routine is executed by mt76_scan_complete()
without holding the wiphy mutex triggering the following lockdep warning.

 WARNING: CPU: 0 PID: 72 at net/mac80211/key.c:1029 ieee80211_iter_keys+0xe4/0x1a0 [mac80211]
 CPU: 0 UID: 0 PID: 72 Comm: kworker/u32:2 Tainted: G S                  6.18.0-rc5+ #27 PREEMPT(full)
 Tainted: [S]=CPU_OUT_OF_SPEC
 Hardware name: Default string Default string/SKYBAY, BIOS 5.12 02/15/2023
 Workqueue: phy3 mt76_scan_work [mt76]
 RIP: 0010:ieee80211_iter_keys+0xe4/0x1a0 [mac80211]
 Code: 4c 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 48 8b 47 48 be ff ff ff ff 48 8d 78 68 e8 b4 eb 1e e1 85 c0 0f 85 49
ff ff ff 4c 8b ab 90 1a 00 00 48 8d 83 90
 RSP: 0018:ffffc900002f7cb0 EFLAGS: 00010246
 RAX: 0000000000000000 RBX: ffff888127e00ee0 RCX: 0000000000000000
 RDX: 0000000000000000 RSI: ffff888127e00788 RDI: ffff88811132b5c8
 RBP: ffffffffa0ddf400 R08: 0000000000000001 R09: 000000009dcc1dac
 R10: 0000000000000001 R11: ffff88811132b5a0 R12: ffffc900002f7d00
 R13: ffff8882581e6a80 R14: ffff888127e0afc8 R15: ffff888158832038
 FS:  0000000000000000(0000) GS:ffff8884da486000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000030a0fd90 CR3: 0000000002c52004 CR4: 00000000003706f0
 Call Trace:
  <TASK>
  ? lock_acquire+0xc2/0x2c0
  mt7996_vif_link_remove+0x64/0x2b0 [mt7996e]
  mt76_put_vif_phy_link+0x41/0x50 [mt76]
  mt76_scan_complete+0x77/0x100 [mt76]
  mt76_scan_work+0x2eb/0x3f0 [mt76]
  ? process_one_work+0x1e5/0x6d0
  process_one_work+0x221/0x6d0
  worker_thread+0x19a/0x340
  ? rescuer_thread+0x450/0x450
  kthread+0x108/0x220
  ? kthreads_online_cpu+0x110/0x110
  ret_from_fork+0x1c6/0x220
  ? kthreads_online_cpu+0x110/0x110
  ret_from_fork_asm+0x11/0x20
  </TASK>
 irq event stamp: 45471
 hardirqs last  enabled at (45477): [<ffffffff813d446e>] __up_console_sem+0x5e/0x70
 hardirqs last disabled at (45482): [<ffffffff813d4453>] __up_console_sem+0x43/0x70
 softirqs last  enabled at (44500): [<ffffffff81f2ae0c>] napi_pp_put_page+0xac/0xd0
 softirqs last disabled at (44498): [<ffffffff81fa32a0>] page_pool_put_unrefed_netmem+0x290/0x3d0
 ---[ end trace 0000000000000000 ]---

Fix the issue skipping ieee80211_iter_keys() for scanning links in
mt7996_vif_link_remove routine since we have not uploaded any hw keys
for these links.

Fixes: 04414d7bba78 ("wifi: mt76: mt7996: delete vif keys when requested")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 2a45db398fd597180c0b2bfc12e019b514f24fd6..beed795edb24c67e1b7b44fe87fd5de125a21d94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -392,7 +392,8 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	};
 	int idx = msta_link->wcid.idx;
 
-	ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
+	if (!mlink->wcid->offchannel)
+		ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
 	mt7996_mcu_add_sta(dev, link_conf, NULL, link, NULL,
 			   CONN_STATE_DISCONNECT, false);

---
base-commit: 09600421ffe2acc1a00ec466b25485f11b6bb957
change-id: 20251115-mt7996-key-iter-link-remove-fix-7cf4d529c5a0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


