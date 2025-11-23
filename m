Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C90CFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JqYwVJsOmJQrYDzv7VVBTN9ed/Ah2x9hPbpQxaco2SE=; b=ABOAFF3iLdd2N8V1+ThrczXlyM
	+zii0kYtVrQtLORuBgvP9f22wI3fQX7VSdZJSELj/DyMMKuweZuMipvIbF4vbPyuEo2tqXBLF2SzY
	TDREc6xNcDOZTTVNZ/TY/bRsOpgX4IylaKHUCtyapsE9RGz2L2w47PxVnK5XhJp34SjwcmGPCQZTY
	iaZD4Yw422bsD4JIK/vuvE/EI6kOmnXMzFigU34rwtb6fczE3O9Ri+Jgv506rQA61gufZfnhZ5vmb
	eVOibf8Llic0pOG9hJ0FYK9tBj72cQMFL7dG5OhQhke44q0zl1fEMDzk7OiOwYzp1T/f90Wwvh+Cl
	4ukzrWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN9rm-0000000ARSD-360E;
	Sun, 23 Nov 2025 13:10:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN9rj-0000000ARR8-2fxY;
	Sun, 23 Nov 2025 13:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F87E40D5A;
	Sun, 23 Nov 2025 13:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32731C113D0;
	Sun, 23 Nov 2025 13:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763903452;
	bh=tCzm5CbDo44gclV/TPOEMHiNBz2jMCaxD/51uIQiEW0=;
	h=From:Date:Subject:To:Cc:From;
	b=GLeyOcOWF0ZHq3xl+eCV/n05OIndaqtkPT2r1BcrCQO//I8pF4m9Fo1ZHXZ6XYr0i
	 69Idg6APhyYjty9vA4G7Pi/rssut9SU7ptbCDVZkogC/yIy7UoBFQJwg6SxoogH3vN
	 CFa59vABmbEqf3ziqH9htlJk/dt7vv/RExayhWJY+Pz4c9Bga0prrrLufEy5J5W6NM
	 ImLznhygM1+4H1+HiLPbenkoXyzc/OpRTgz9mrUpxrekbMAN4+OaDHc1OkESjuUWw+
	 45BGNBsrvP5akGjuZ41iTlqQP8RHwjokbSsoJoM41GKlQFF8/FhHg50u/V03M7/3Aq
	 WlEXU6i90IrOQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 23 Nov 2025 14:10:16 +0100
Subject: [PATCH mt76] wifi: mt76: dma: Initialize return value in Q_READ()
 for NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251123-mt76-npu-fix-warning-v1-1-455856b1e99d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX23EIaKfQr0UF0qz20hfaC8N+Tj
 sMw80KiyJSgr16IdHHiTQqougK/OJkJORQG3ehOKd3ieliDsp848YO3i8Iyo3MmBO+J7OShpHu
 kov/tMOb8AXrg4wxmAAAA
X-Change-ID: 20251123-mt76-npu-fix-warning-aa6ddccee7fc
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_051055_729509_E58F0303 
X-CRM114-Status: GOOD (  10.30  )
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

Even if this is just a theoretical issue since NPU queues are
initialized just if npu pointer is not NULL, fix the sparse warning
initializing return value in Q_READ macro if CONFIG_MT76_NPU is enabled.

Fixes: 62f1347fa5bf6 ("wifi: mt76: Introduce the NPU generic layer")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511231550.NHSRTxxd-lkp@intel.com/
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 4fd779e1aa0f8f9c7a465b948e8bcce5f52711cf..4a63de6c5bf5a34cb76f10a427649bc04ebe78b2 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -74,7 +74,7 @@
 
 #define Q_READ(_q, _field) ({						\
 	u32 _offset = offsetof(struct mt76_queue_regs, _field);		\
-	u32 _val;							\
+	u32 _val = 0;							\
 	if ((_q)->flags & MT_QFLAG_NPU) {				\
 		struct airoha_npu *npu;					\
 									\

---
base-commit: e1ed98b1836e2bf0aba98f9790be4f3c6bca9d0d
change-id: 20251123-mt76-npu-fix-warning-aa6ddccee7fc

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


