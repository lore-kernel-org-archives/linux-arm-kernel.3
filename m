Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6727E67497
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 18:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ay6xXTFii1p+icO+7nohIqHQs7dMgk+nkWsA97U4Zfc=; b=uOqFtbtlZZoyYLYe8D6GzG5Q+/
	F6lzzGf4HipIauZUz7+wYCHgYqPKwsNq/NuymKUOARg4nHmzLEqBfHGroi60EAM58sWTXx3KR2zWb
	CaaouGgYWm/hv6n0AM/6boZ6W4BlTAoBf/N48nr5mH8WrcL+kebHEccFtx+24ybFEPRzFnI4odeLJ
	u/FwYUixf5aS4FQ9TswB17lPrM+doj8wgvCf0Uws/HtloxJoOEyYifVzxjJQ0aFrhvizqUG+V6LKs
	I1pjnGO5qKD3qlmRARlaxn1MlHNWyTIxbyMXdZzsZgH3w60PPZ7b6g312spHnpm1S6iczn9+Qd+mh
	YO1N6hkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkI0-0000000E2ol-3N8L;
	Mon, 22 Dec 2025 18:05:48 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkHx-0000000E2o0-3WwF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 18:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766426740; x=1766685940;
	bh=ay6xXTFii1p+icO+7nohIqHQs7dMgk+nkWsA97U4Zfc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VNH9f739vztBhMb7jnrfDS066IK5I5749HghCFdaG+MCuAavq2Y8YrwToODxw3uhi
	 Q29dimA79e49sA4ZHSY7FeJZ3FdMZqrPRX0fGSCah2as4spcUbEOrRfLvbhQVxixq6
	 atNGuhIutkp3jguJunfEgkk4coe4RxrC133aGSW671r2YB5A013tm1FUxFBADcFxJO
	 EILVwb9lFM24o4Lqj9/VwjvNxlyJHI98OVgWJ1ECMUrhGGdCAislIiK2jYMnqNrp8c
	 WSyKUll0PypUX9h+9edoxfm5AjU2C63GUqfPCA3PAYo/IuN+gzn8V+O3Xq4oUl+g1x
	 hT9P2TyLsIrrQ==
Date: Mon, 22 Dec 2025 18:05:33 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH] wifi: mt76: fix buffer overflow bug
Message-ID: <20251222180437.1938-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: cb661200901071ea47144025303f1bc8e90deb0c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100546_033596_BBC2F0D4 
X-CRM114-Status: UNSURE (   8.75  )
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

Prevents attempting to read an extra byte from the origin string.
Example stacktrace:

------------[ cut here ]------------
strnlen: detected buffer overflow: 17 byte read of buffer size 16
WARNING: lib/string_helpers.c:1036 at __fortify_report+0x2d/0x50, CPU#0: kw=
orker/0:0/9
Modules linked in:
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.19.0-rc2+ #13 PREEMPT(=
full)
Hardware name: Micro-Star International Co., Ltd. MS-7E24/B650M GAMING PLUS=
 WIFI (MS-7E24), BIOS 1.C2 08/06/2025
Workqueue: events mt7921_init_work
RIP: 0010:__fortify_report+0x3f/0x50
Code: b6 c1 48 c7 c1 93 60 c0 95 48 8b 34 c5 50 9c 2a 95 48 8d 05 03 1f ee =
01 40 f6 c7 01 48 c7 c7 3c 66 c4 95 48 0f 44 cf 48 89 c7 <67> 48 0f b9 3a c=
3 cc cc cc cc cc cc cc cc cc cc cc ba 2f 00 00 00
RSP: 0018:ffff9f370019fcd0 EFLAGS: 00010246
RAX: ffffffff9636a210 RBX: ffff9420525b1ea0 RCX: ffffffff95c4663c
RDX: 0000000000000011 RSI: ffffffff95cf5242 RDI: ffffffff9636a210
RBP: ffff9f370019fd70 R08: 0000000000000010 R09: ffff9f370019fbf1
R10: 0000000000000004 R11: 0000000000000000 R12: ffffffff95bb3ca3
R13: ffff9420525bb101 R14: 0000000000000000 R15: 00000000ffffffea
FS:  0000000000000000(0000) GS:ffff9427c79ae000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff942526a01000 CR3: 00000005e5a2c000 CR4: 0000000000750ef0
PKRU: 55555554
Call Trace:
 <TASK>
 __fortify_panic+0x5/0x10
 mt76_connac2_load_patch+0x34f/0x360
 ? update_load_avg+0x1f1/0x840
 mt792x_load_firmware+0x35/0x150
 mt7921_run_firmware+0x28/0x4c0
 ? _raw_spin_unlock+0x12/0x30
 ? ____mt76_poll_msec+0x53/0xa0
 mt7921e_mcu_init+0xba/0x100
 mt7921_init_work+0x70/0x1c0
 process_scheduled_works+0x1f0/0x420
 worker_thread+0x296/0x370
 ? pr_cont_work+0x1c0/0x1c0
 kthread+0x213/0x240
 ? kthread_blkcg+0x40/0x40
 ret_from_fork+0xfa/0x1c0
 ? kthread_blkcg+0x40/0x40
 ret_from_fork_asm+0x11/0x20
 </TASK>
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
kernel BUG at lib/string_helpers.c:1043!
Oops: invalid opcode: 0000 [#1] SMP NOPTI
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Tainted: G        W           6.19.0=
-rc2+ #13 PREEMPT(full)
Tainted: [W]=3DWARN
Hardware name: Micro-Star International Co., Ltd. MS-7E24/B650M GAMING PLUS=
 WIFI (MS-7E24), BIOS 1.C2 08/06/2025
Workqueue: events mt7921_init_work
RIP: 0010:__fortify_panic+0x5/0x10
Code: 1d 00 00 00 48 89 df 48 c7 c6 72 68 c8 95 5b 41 5e 41 5f e9 dd c2 4a =
00 cc cc cc cc cc cc cc cc cc cc cc cc cc e8 bb b3 87 00 <0f> 0b cc cc cc c=
c cc cc cc cc cc 0f 1f 44 00 00 55 48 89 e5 41 56
RSP: 0018:ffff9f370019fcd8 EFLAGS: 00010246
RAX: ffffffff9636a210 RBX: ffff9420525b1ea0 RCX: ffffffff95c4663c
RDX: 0000000000000011 RSI: ffffffff95cf5242 RDI: ffffffff9636a210
RBP: ffff9f370019fd70 R08: 0000000000000010 R09: ffff9f370019fbf1
R10: 0000000000000004 R11: 0000000000000000 R12: ffffffff95bb3ca3
R13: ffff9420525bb101 R14: 0000000000000000 R15: 00000000ffffffea
FS:  0000000000000000(0000) GS:ffff9427c79ae000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff942526a01000 CR3: 00000005e5a2c000 CR4: 0000000000750ef0
PKRU: 55555554
Call Trace:
 <TASK>
 mt76_connac2_load_patch+0x34f/0x360
 ? update_load_avg+0x1f1/0x840
 mt792x_load_firmware+0x35/0x150
 mt7921_run_firmware+0x28/0x4c0
 ? _raw_spin_unlock+0x12/0x30
 ? ____mt76_poll_msec+0x53/0xa0
 mt7921e_mcu_init+0xba/0x100
 mt7921_init_work+0x70/0x1c0
 process_scheduled_works+0x1f0/0x420
 worker_thread+0x296/0x370
 ? pr_cont_work+0x1c0/0x1c0
 kthread+0x213/0x240
 ? kthread_blkcg+0x40/0x40
 ret_from_fork+0xfa/0x1c0
 ? kthread_blkcg+0x40/0x40
 ret_from_fork_asm+0x11/0x20
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__fortify_panic+0x5/0x10
Code: 1d 00 00 00 48 89 df 48 c7 c6 72 68 c8 95 5b 41 5e 41 5f e9 dd c2 4a =
00 cc cc cc cc cc cc cc cc cc cc cc cc cc e8 bb b3 87 00 <0f> 0b cc cc cc c=
c cc cc cc cc cc 0f 1f 44 00 00 55 48 89 e5 41 56
RSP: 0018:ffff9f370019fcd8 EFLAGS: 00010246
RAX: ffffffff9636a210 RBX: ffff9420525b1ea0 RCX: ffffffff95c4663c
RDX: 0000000000000011 RSI: ffffffff95cf5242 RDI: ffffffff9636a210
RBP: ffff9f370019fd70 R08: 0000000000000010 R09: ffff9f370019fbf1
R10: 0000000000000004 R11: 0000000000000000 R12: ffffffff95bb3ca3
R13: ffff9420525bb101 R14: 0000000000000000 R15: 00000000ffffffea
FS:  0000000000000000(0000) GS:ffff9427c79ae000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff942526a01000 CR3: 00000005e5a2c000 CR4: 0000000000750ef0
PKRU: 55555554

Fixes: f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers=
/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ea99167765b0c..b735b3671fab5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3101,7 +3101,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, con=
st char *fw_name)
 =09int i, ret, sem, max_len =3D mt76_is_sdio(dev) ? 2048 : 4096;
 =09const struct mt76_connac2_patch_hdr *hdr;
 =09const struct firmware *fw =3D NULL;
-=09char build_date[17];
+=09char build_date[sizeof(hdr->build_date) + 1];
=20
 =09sem =3D mt76_connac_mcu_patch_sem_ctrl(dev, true);
 =09switch (sem) {
@@ -3125,8 +3125,8 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, con=
st char *fw_name)
 =09}
=20
 =09hdr =3D (const void *)fw->data;
-=09strscpy(build_date, hdr->build_date, sizeof(build_date));
-=09build_date[16] =3D '\0';
+=09strscpy(build_date, hdr->build_date, sizeof(hdr->build_date));
+=09build_date[sizeof(hdr->build_date)] =3D '\0';
 =09strim(build_date);
 =09dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
 =09=09 be32_to_cpu(hdr->hw_sw_ver), build_date);
--=20
2.52.0



