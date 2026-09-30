Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E099CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E6/l5fY/PkriTVyzg/Mt4qX1Qw9DGl3z2a1BNlGbk44=; b=UQq9ceugowPoAHwS6m5+fkSSMe
	85xo5GSSj9prBGZe6rw2qptMKiKA2TkdKyOSgA5n3nalhdP50X4LBLML8LntepEUa1WcA1UpRAxXd
	N693uIVhAPMFAU+1thb2fJXpmegJt0gWOTnKIgUmLJUbAKLnqBLpiz7m124zUwYnk3wsycf0braon
	bixDEL6BEKkFfkAuOp9LuUq1b/jbFh9GZ68386aLPp6sja7AJxhM1rPiieC5FfBG54FZKktK5Zsnw
	HcOsRS/D5l/54a9IJxKiMBESU16d8LscWAjwPI/aGZmeUWq71MFLkEUpBjKTHtTatH17MY3zKVtZM
	AwFF0Rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrKp-00000005hBp-2Ee1;
	Wed, 30 Sep 2026 10:14:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrKo-00000005hB6-38yW;
	Wed, 30 Sep 2026 10:14:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64F96402B3;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DCC7C2BCF4;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790763286;
	bh=EnPC0MkyPeQLIOqxxFuO23cppPFxmbMyC7PlLES2/fA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QSJCnWpEDO3ylHUzYHq5wLmD9Y7twzIpSkW6LDyC9F8B/Csdpqm+znt1QZgzrH257
	 vuHDNrCOgtxkLkdnRyvFeIuMuYhbENsoeO304t9OGjBPOhVA4/y/cFRTVTqZ/KDW/M
	 ZMEBEFe09T2QXLI+Oiw9xUGHV+aHeOLi4Xc3aE5dVM5rnU83Eh2hTkqPsm2SBdxxmj
	 zqG04p4wqRN4GtWjya13dGR5hl8MJwX/wZDIZ3D7BA57hJi/tTGNg0S4ig6lHTL+W3
	 Rg3QXgvpfEQxvViYyZhqtWfZw87efYOM0fisjbotVjE9+VSBNlrkBc2/d0mRgxHAc4
	 V1fCOdYrflIsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A67DCA5FC1;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v5 0/4] nvmem: mtk-efuse: mt6572 support
Date: Wed, 30 Sep 2026 13:14:26 +0300
Message-Id: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23P0U7EIBAF0F/Z8CyGAQYWn/wP4wOlo4uxZQOVa
 Db9d2GNsY37eJM592YurFCOVNjD4cIy1VhimlvAuwMLJz+/Eo9jy0wKaYQFwQ1ayec60cRpcMd
 gvVUKgTVwzvQSP69lT88/uXwMbxSW3tAvTrEsKX9d1yr0u99i3BZX4IK7AGog50Zh7eM5pyXNk
 4/v9yFNrLdXufFS77xsnvA4gvHSGQk3vfrzTridV80HEbQGg0ar215vvISd132/PaABDaLz//y
 6rt84kxgVewEAAA==
X-Change-ID: 20260710-6572-nvmem-eb98c7a73351
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790763284; l=2587;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=EnPC0MkyPeQLIOqxxFuO23cppPFxmbMyC7PlLES2/fA=;
 b=bRlMBM1TZ3bh3rAbS25EkIrZN/j+LuUc4hBKVr6b5eGAWzD/RQ1gs5lpfqORvgTBRytTye5C+
 a5E+PBrdmM9CGkx2Eb6eiNl1Pt10ZCBo8+sl2XqUpPlYHsx63nP7uVJ
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
its efuse controller doesn't work properly with 8-bit reads, leading to
invalid data with current mtk-efuse driver implementation.

This behavior can be observed with devmem (0x10009174 and 0x10009178 are
thermal calibration cells):
~ # devmem 0x10009174 32
0x00CDD4CD
~ # devmem 0x10009178 32
0x0F76865D
~ # devmem 0x10009174 8
0xCD
~ # devmem 0x10009175 8
0x00
~ # devmem 0x10009176 8
0x00
~ # devmem 0x10009177 8
0x00
~ # devmem 0x10009178 8
0x5D
~ # devmem 0x10009179 8
0x00
~ # devmem 0x1000917a 8
0x00
~ # devmem 0x1000917b 8
0x00

Patch 1 adds dt-bindings compatible for the mt6572,
Patch 2 adds platform data option to use aligned 32-bit reads instead
of plain readb().
Patch 3 adds cpu speedbin fixup.
Patch 4 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v5:
- Add new patch for CPU speedbin post-processing
- Set uses_post_processing to true in the mt6572 platform data
- Drop r-b tag on the patch 4 due to uses_post_processing changes
- Link to v4: https://patch.msgid.link/20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com

Changes in v4:
- Pick up Angelo's tags
- Rebase onto nvmem/for-next (2eda8d2a45ca ("Merge branches 'nvmem-fixes' and 'nvmem-for-v7.4' into nvnem-for-next"))
- Link to v3: https://patch.msgid.link/20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com

Changes in v3:
- Pick up Rob's r-b tag for dt-bindings
- Patch 2 and 3 unchanged, for some reason cover letter and patch 1 were
missing on the web mirror...
- Link to v2: https://patch.msgid.link/20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com

Changes in v2:
- dt-bindings: make mediatek,mt6572-efuse standalone compatible
- Driver: add 'mtk_reg_read_aligned' helper instead of modifying 'mtk_reg_read'
- Link to v1: https://patch.msgid.link/20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com

---
Roman Vivchar (4):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add CPU speedbin post-processing
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 +-
 drivers/nvmem/mtk-efuse.c                          | 60 +++++++++++++++++++++-
 2 files changed, 63 insertions(+), 2 deletions(-)
---
base-commit: 2eda8d2a45caa955a5cb1d897bf6024d22041995
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



