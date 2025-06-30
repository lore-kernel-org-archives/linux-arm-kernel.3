Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E35C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fO1wJyjrg6quMBG+VeM90z2dGJYWGzPRsE2LAqLBFmY=; b=thZIvEnADUr934jOhlDlo/Cac3
	U3+8pid+q2p1HrR3MfweO1QNoIudSq6ThfVaXQ7JfoKmn2EQVhtJzSC3KqynHX9zmGrUSkOPrM5ot
	wZ6NjduY6e6dWz1mhCSC0DklaHEyPaGN4BSIo1EE81BwQs+NcosktR7wKA2GLHX3YOsbPWx3cTte3
	o2TQqbxaESOy/8CRxu6JpPJAY7dYwUgUlu4C3v6V0MxtW7uCcRvxKL2sDwh9HqP7zttmnUIgwpKLp
	sVA/JGb3cubytM6b8SMO9ubmv7losMAMu1rkNEOnuLhRyAniDx/shTw0YMAd2kPRuQhqTUKeAQyyk
	cI4sjY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWFCP-00000002UeQ-0RHa;
	Mon, 30 Jun 2025 14:09:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWF7k-00000002TkP-1pe9;
	Mon, 30 Jun 2025 14:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751292282;
	bh=lJo4k2xVeiDebpwc+lYdH4ZwZHtPsq3pOUWr892pgog=;
	h=From:Date:Subject:To:Cc:From;
	b=Y5fPjOcofU4G1ItuixmiIZQ7ZR3mTg9aTWlF2wqf9c25xRK4agkwggxNZ+s3uqH2Q
	 Ee+0qRSB1BSSP1dH/gZWfNEzDfc35PKIN5UnBJCIlCvHR0VsPKOXrMbAT9J2g5auXL
	 K+PRPbF9CzNQ03ZgDfmPHsleV6/tZlT8Xy1LCWG4Y/hcQqBGV9bUXsf8Rt0wLRspMN
	 r+aEJi37BW8SNko2suUgtG6jliHSzqFMqnfdfsEzHXEjbT+EhVrLhIUMKduQoH81oe
	 eenEeyGGs3R99mZXgL7cwGDOarDA1OVad4yKD+eL83vt2WkIzKY+J3d/PpSOgiLEpc
	 JzaTTg3OhiA5Q==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA1B417E07F2;
	Mon, 30 Jun 2025 16:04:41 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 30 Jun 2025 16:03:44 +0200
Subject: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when no
 compatible data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
X-B4-Tracking: v=1; b=H4sIAD+ZYmgC/zWNwQrCMBBEfyXs2YUYjUh/RXpI48YuJWnNRqmU/
 ntDi8c3w8xbQCgzCTRqgUxfFh5ThfNJge9dehHyszIYbay+XTTGMuAU2eNAP8HAM/rspMer6ax
 1wdw1BajrKVMt9+dHe3Cm96cKyhFC54TQjzFyaVSiueBfAu26bnCUhzmaAAAA
X-Change-ID: 20250630-mtk-pmic-keys-fix-crash-42b55af280ef
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751292281; l=3806;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=lJo4k2xVeiDebpwc+lYdH4ZwZHtPsq3pOUWr892pgog=;
 b=4hOq21N8D5aFlEKW2DcSULezu6veN9g5798DGmTfklmb5u7sWpNRKE7KpYYGunYkHmoo6aZQW
 qz9saAYUu5mCtAHnUIH7z8d/6nfLeardHGP1xhvfpOSAjUxiCQIHQbz
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_070444_663068_5EFF838D 
X-CRM114-Status: GOOD (  14.92  )
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

In mtk_pmic_keys_probe function, the of_match_device function is
called to retrieve the compatible platform device info but its return
data pointer is not checked. It can lead to a null pointer deference
later when accessing the data field, if of_match_device returned a null
pointer. So, add a pointer check after calling of_match_device function
and return an EINVAL error in null case.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
This patch fixes a NULL pointer dereference that occurs during the
mtk_pmic_keys driver probe and observed at least on Mediatek Genio
1200-EVK board with a kernel based on linux-next (tag: 20250630),
when it is configured to have mtk_pmic_keys driver as builtin
(CONFIG_KEYBOARD_MTK_PMIC=y):
```
Unable to handle kernel NULL pointer dereference at virtual address
  00000000000000c0
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[00000000000000c0] user address but active_mm is swapper
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
  6.16.0-rc4-next-20250630-00001-gea99c662a089 #145 PREEMPT 
Hardware name: MediaTek Genio 1200 EVK-P1V2-EMMC (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : mtk_pmic_keys_probe+0x94/0x500
lr : mtk_pmic_keys_probe+0x78/0x500
sp : ffff80008275bb30
x29: ffff80008275bb70 x28: ffff80008202bbb0 x27: ffff800081df00b0
x26: ffff800081ef9060 x25: ffff0000c6fcf400 x24: 0000000000000000
x23: 0000000000000000 x22: ffff0000c6fcf410 x21: ffff0000c09f8480
x20: ffff0000c09f4b80 x19: 0000000000000000 x18: 00000000ffffffff
x17: ffff8000824cb228 x16: 00000000d7fcbc9e x15: ffff0000c0a2b274
x14: ffff80008275bad0 x13: ffff0000c0a2ba1c x12: 786d692d696d6373
x11: 0000000000000040 x10: 0000000000000001 x9 : 0000000000000000
x8 : ffff0000c09f8500 x7 : 0000000000000000 x6 : 000000000000003f
x5 : 0000000000000040 x4 : ffff0000c6fcf410 x3 : ffff0000c6fcf6c0
x2 : ffff0000c09f8400 x1 : ffff0000c36da000 x0 : ffff0000c6fcf410
Call trace:
 mtk_pmic_keys_probe+0x94/0x500 (P)
 platform_probe+0x68/0xdc
 really_probe+0xbc/0x2c0
 __driver_probe_device+0x78/0x120
 driver_probe_device+0x3c/0x154
 __driver_attach+0x90/0x1a0
 bus_for_each_dev+0x7c/0xdc
 driver_attach+0x24/0x30
 bus_add_driver+0xe4/0x208
 driver_register+0x68/0x130
 __platform_driver_register+0x24/0x30
 pmic_keys_pdrv_init+0x1c/0x28
 do_one_initcall+0x60/0x1d4
 kernel_init_freeable+0x24c/0x2b4
 kernel_init+0x20/0x140
 ret_from_fork+0x10/0x20
Code: aa1603e0 f90006b6 f9400681 f9000aa1 (f9406261) 
---[ end trace 0000000000000000 ]---
```
---
 drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 061d48350df661dd26832b307e1460ee8b8fd535..42fb93086db308ad87a276be4b53e9725a3a701b 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -316,6 +316,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	const struct of_device_id *of_id =
 		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
+	if (!of_id)
+		return -EINVAL;
+
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
 		return -ENOMEM;

---
base-commit: c6a68d8f7b81a6ce8962885408cc2d0c1f8b9470
change-id: 20250630-mtk-pmic-keys-fix-crash-42b55af280ef

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


