Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED56D109B474
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lc7UcCPwBH5GrTtSp2ENUaDBHqrrasXGZe5o4I9chZw=; b=DQ+Nn4vDkvXY6h
	eq1PhbrmJ8mVNKA/IQjVLZWZ/EjMvAKxJW4VS/kLMEYm1qO31w6GjX5me0L/x0dMgmX+AINsy+YKs
	ESZqYfG7B8GlozyRKDGhcoWyp//bm7B/SwN/NKytFB7E54PEB9Ppo7ewzBw9YXBXPFjGrMxTagb9S
	SG0fFS1kRm8U24dBKcD47c9iMUjf8rofp1JZVwZPtQjWQKycLzC2PV/exi9BrCzy7KTRE3AQ+fhs0
	SP1tRcriKbjBltDtceihb7pX1CyArpvyx4/xYoW3aq1UFYbYxD0JvL2WomYbC0xuikQkUgZ/WUGPO
	hXy3UrkGll6dBXNmCaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1v-0000000D5T6-1oui;
	Tue, 31 Mar 2026 14:25:19 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1l-0000000D5IZ-2voe;
	Tue, 31 Mar 2026 14:25:11 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774967094;
	bh=CgynXGu1MO6wxG8waJ3sxLw9l+fEjVnPCF909MJkxmM=;
	h=From:Subject:Date:To:Cc;
	b=Y/A6lsMRMNCQiG6NSbXIKBnhNkE+2K7BYEgMqvsK6PUjApr6TPKC+LBQpADMq+EE6
	 NEqJgY8B4I/WCWTmoe7Mnc/lXCtOU1VAgHNV24csuOCZxjkYe4EQc8rDH+1zzJ8UcY
	 MpcCA09nWoLdWlCK4khdAJz8iW8N60OT5fcMs9MA=
Subject: [PATCH 0/2] Fix Amlogic T7 null reset ops and DT required property
Date: Tue, 31 Mar 2026 16:24:03 +0200
Message-Id: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0XNQQ6DIBAF0KsQ1p0EkNLKVRoXKGNLIlgBjYnx7
 kVddPl/5r/ZaMLoMFFNNhpxccmNoQR+I7T7mPBGcLZkKphQrKo49G4F4wfIDwjzMEDEhBlEq9g
 T2762RtKy/UYsh6f7aq4ccZoLn6/yr2ty2YKBsRbQ++7AF+clKGO5wloqLnu93A+5NQmhG713W
 ZOAa/l9znlNm33/AcXk+/fQAAAA
X-Change-ID: 20260331-fix-aml-t7-null-reset-2b608ebf9da4
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774967092; l=8028;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=CgynXGu1MO6wxG8waJ3sxLw9l+fEjVnPCF909MJkxmM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLxdeo6b54SKxMMt5VY3wmc7Ec7YHPexa6Xb6P57x3znYj0neoi0bDX3LXjeH/EmyZ53Amjz/IQ
 FBCma+nS3+AE=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072510_059650_10D7BBDE 
X-CRM114-Status: UNSURE (   7.74  )
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

1. As reset is required for MMC DT, this patch series aims to add the currently missing required driver ops.

Whithout this patch the following kernel null error appears:

[    0.459197] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    0.459978] Mem abort info:
[    0.460324]   ESR = 0x0000000096000004
[    0.460791]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.461471]   SET = 0, FnV = 0
[    0.461830]   EA = 0, S1PTW = 0
[    0.462220]   FSC = 0x04: level 0 translation fault
[    0.462722] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    0.462826] Data abort info:
[    0.462829]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    0.462842] Mem abort info:
[    0.462849]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.462859]   ESR = 0x0000000096000004
[    0.462865]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.462874]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.462882] [0000000000000000] user address but active_mm is swapper
[    0.462890]   SET = 0, FnV = 0
[    0.462901] Internal error: Oops: 0000000096000004 [#1]  SMP
[    0.462909]   EA = 0, S1PTW = 0
[    0.462917] Modules linked in:
[    0.462925]   FSC = 0x04: level 0 translation fault
[    0.462932] 
[    0.462939] Data abort info:
[    0.462951] CPU: 4 UID: 0 PID: 90 Comm: kworker/u34:3 Not tainted 7.0.0-rc4-next-20260319 #41 PREEMPT 
[    0.463920]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    0.463927] Hardware name: Khadas VIM4 (DT)
[    0.463940]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.463951] Workqueue: async async_run_entry_fn
[    0.464277]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.464286] 
[    0.464294] [0000000000000000] user address but active_mm is swapper
[    0.464304] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.465935] pc : reset_control_reset+0x48/0x1d0
[    0.466409] lr : reset_control_reset+0x38/0x1d0
[    0.479907] sp : ffff800083943b60
[    0.479911] x29: ffff800083943b60 x28: 0000000000000000 x27: 0000000000000000
[    0.479926] x26: ffff80008310a9c0 x25: 0000000000000000 x24: ffff000100372005
[    0.481212] x23: ffff0001003a4000 x22: ffff000100fee988 x21: 0000000000000000
[    0.482976] x20: ffff00023f00a788 x19: ffff000100fee980 x18: 0000000000000006
[    0.483865] x17: 64656c62616e655f x16: 7469647561206465 x15: ffff800083943530
[    0.484753] x14: 0000000000000000 x13: 000000000000022d x12: 0000000000002000
[    0.485642] x11: ffff00023efdc754 x10: ffff00023efdc740 x9 : 0000000000000000
[    0.486530] x8 : ffff00023efd8a40 x7 : fffffffffffffe70 x6 : ffff00023efd89e0
[    0.487418] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000001
[    0.488307] x2 : ffff000102002488 x1 : ffff8000822248c0 x0 : 0000000000000000
[    0.489196] Call trace:
[    0.489500]  reset_control_reset+0x48/0x1d0 (P)
[    0.490062]  __device_reset+0xc8/0xfc
[    0.490517]  meson_mmc_probe+0xe8/0x3d4
[    0.490994]  platform_probe+0x5c/0x98
[    0.491448]  really_probe+0xbc/0x298
[    0.491892]  __driver_probe_device+0x78/0x12c
[    0.492434]  driver_probe_device+0xd4/0x164
[    0.492954]  __device_attach_driver+0xb8/0x140
[    0.493507]  bus_for_each_drv+0x84/0xe0
[    0.493983]  __device_attach_async_helper+0xac/0xd0
[    0.494590]  async_run_entry_fn+0x34/0xe0
[    0.495089]  process_one_work+0x158/0x29c
[    0.495587]  worker_thread+0x18c/0x308
[    0.496053]  kthread+0x11c/0x128
[    0.496453]  ret_from_fork+0x10/0x20
[    0.496904] Code: f9400262 2a0003f5 b4000902 f9400040 (f9400003) 
[    0.497661] ---[ end trace 0000000000000000 ]---
[    0.498234] Internal error: Oops: 0000000096000004 [#2]  SMP
[    0.498935] Modules linked in:
[    0.499319] CPU: 1 UID: 0 PID: 88 Comm: kworker/u34:1 Tainted: G      D             7.0.0-rc4-next-20260319 #41 PREEMPT 
[    0.500669] Tainted: [D]=DIE
[    0.501025] Hardware name: Khadas VIM4 (DT)
[    0.501547] Workqueue: async async_run_entry_fn
[    0.502109] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.502975] pc : reset_control_reset+0x48/0x1d0
[    0.503538] lr : reset_control_reset+0x38/0x1d0
[    0.504102] sp : ffff800083903b60
[    0.504513] x29: ffff800083903b60 x28: 0000000000000000 x27: 0000000000000000
[    0.505402] x26: ffff000100059028 x25: 0000000000000000 x24: ffff000100372005
[    0.506290] x23: ffff000100ec9400 x22: ffff0001003f6e08 x21: 0000000000000000
[    0.507178] x20: ffff00023f00b440 x19: ffff0001003f6e00 x18: 00000000ffffffff
[    0.508067] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000839037e0
[    0.508955] x14: 0000000000000000 x13: 0000000000000290 x12: 0000000000002000
[    0.509843] x11: ffff00023efdc754 x10: ffff00023efdc740 x9 : 0000000000000000
[    0.510732] x8 : ffff00023efd8bc0 x7 : fffffffffffffe70 x6 : ffff00023efd8b60
[    0.511620] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000001
[    0.512508] x2 : ffff000102002488 x1 : ffff800082224a40 x0 : 0000000000000000
[    0.513397] Call trace:
[    0.513700]  reset_control_reset+0x48/0x1d0 (P)
[    0.514263]  __device_reset+0xc8/0xfc
[    0.514718]  meson_mmc_probe+0xe8/0x3d4
[    0.515195]  platform_probe+0x5c/0x98
[    0.515650]  really_probe+0xbc/0x298
[    0.516094]  __driver_probe_device+0x78/0x12c
[    0.516636]  driver_probe_device+0xd4/0x164
[    0.517156]  __device_attach_driver+0xb8/0x140
[    0.517709]  bus_for_each_drv+0x84/0xe0
[    0.518185]  __device_attach_async_helper+0xac/0xd0
[    0.518792]  async_run_entry_fn+0x34/0xe0
[    0.519290]  process_one_work+0x158/0x29c
[    0.519788]  worker_thread+0x18c/0x308
[    0.520254]  kthread+0x11c/0x128
[    0.520655]  ret_from_fork+0x10/0x20
[    0.521103] Code: f9400262 2a0003f5 b4000902 f9400040 (f9400003) 
[    0.521860] ---[ end trace 0000000000000000 ]---

2. The following patch yet to merge reports a missing required property with CHECK_DTBS=y

https://lore.kernel.org/r/20260326-add-emmc-t7-vim4-v5-3-d3f182b48e9d@aliel.fr/

/home/rony/project/khadas/fenix/build/linux/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: mmc@88000 (amlogic,t7-mmc): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml
/home/rony/project/khadas/fenix/build/linux/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: mmc@8a000 (amlogic,t7-mmc): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml
/home/rony/project/khadas/fenix/build/linux/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: mmc@8c000 (amlogic,t7-mmc): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (2):
      reset: amlogic: t7: Fix null reset ops
      arm64: dts: amlogic: t7: Fix missing required reset property

 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 3 +++
 drivers/reset/amlogic/reset-meson.c         | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: f6eb9ae8b9fc13c3971e4a6d1e8442f253001f36
change-id: 20260331-fix-aml-t7-null-reset-2b608ebf9da4
prerequisite-change-id: 20260320-add-emmc-t7-vim4-6ad16e94614f:v5
prerequisite-patch-id: 5b5de77af11747ce964404fb827d2ee2bff47ea5
prerequisite-patch-id: 1e37fc75fed1e533adee0f3e7e6ead1f8ff3c55c
prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
prerequisite-patch-id: 2daf583fb5e7449a02bd217d8aca330171b598aa
prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
prerequisite-patch-id: d1ddf9b7710e91f8062de83bd7ba55afb2c4c112
prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>


