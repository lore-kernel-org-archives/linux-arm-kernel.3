Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F175CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C6Dgx4PSW53d7cGyuFXrxBnWUw2p9vWZj5GWMum1gdM=; b=o15uNuJDmfoyJU
	0ZqyRi4XGNVRTtjInw326BdZJqZcFtKtBOg1oF0xXcrHx8LYaVum1va9UiR4ZI7yeVTcZ1oUjdZtu
	TJXXDBKqRrQxWoc+IXedWuXsO0qJ79LvQCISWuSqNyvbdT4KMG1J1kjSlCLrTTME+8RO8mYOuPIe5
	Q93XtRTR3+FOIbeeNuqjiJRapO9GbmtdAnQUrGKSb/49xk0JPMuNeOrOiKdfQePK1op6ZmvT5FJnE
	Rulo+nki7lbaDAN4PrJlkZQ3fDtnKXQM191/0eHCzNfcyx+y3+EB4It2fpO+JbRP4f+XcMnTNOr2o
	ChNoHSimcgDHlIA6Y9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WhO-00000004G96-1XCH;
	Wed, 08 Oct 2025 16:07:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WhL-00000004G7I-1nbN;
	Wed, 08 Oct 2025 16:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759939547; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WvgFhNQjFuF2w7vmkBR33tizRowq9p5DChLX8HhxldVQyoKsQkuYzE3pdwHFYTQdGsdchmtK17UD1kygsfd0bCK6whtHz6k2tVnzqk+Uk2lX9xKlJntcMRg/KaX9F9PbaMY/iWjBaA94yyA2V2Q8SnEqvTjB6/cnx2sJwfHp74w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759939547; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C6Dgx4PSW53d7cGyuFXrxBnWUw2p9vWZj5GWMum1gdM=; 
	b=aPXjLwxLRuF1Ai31FkBFBgrdapHSU9DNfeEavQ8deQnSSeG/kwoh/7N8meg0EjxmWFhxK6iFX5CPGLt0s3RZl64ZmzqIIevNEAbnhnLfTas/jBgcJOmT9OkljH7FzhvybEyERehKKqkZv0ZKLaVFNk1vnM9ONpox3xwPfpLzs6w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759939547;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=C6Dgx4PSW53d7cGyuFXrxBnWUw2p9vWZj5GWMum1gdM=;
	b=Gl+StA1H5jP7fNz2zNLRrP4kTVV8+at5FSUtga0KJk4xGBU449nWNrfKz8Ud7hjh
	dFA0fzNiGmI0rVkKpmJfEG8UYQyQ3IBYy1tjxbheiFQh6y8OcEqo/QAigf4HqSren6b
	N2F3xp81jLH0zoFJfdRf5UawBAgEw2bMcp1BtCXM=
Received: by mx.zohomail.com with SMTPS id 1759939544761761.1705555269986;
	Wed, 8 Oct 2025 09:05:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/5] MediaTek PLL Refactors and Fixes
Date: Wed, 08 Oct 2025 18:05:34 +0200
Message-Id: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+L5mgC/22OQQ6CMBBFr0Jm7Zi2AWlZeQ/DosAgjUCxrQRDu
 LsFti7fJO/9WcGTM+ShSFZwNBtv7BhBXBKoOz0+CU0TGQQTGVNC4RBeOPU9umnAqhWSK9E0jN8
 gGpOj1ixH7VGe7Oj9idFwHqHSnrC2w2BCkYy0BNzDnDEJu9AZH6z7Ht/M/DD+Ds8cGaYqS3me5
 zKXzb22fa8r6/Q11qHctu0HXBHsAtsAAAA=
X-Change-ID: 20250929-mtk-pll-rpm-bf28192dd016
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_090727_504589_FD9B6FF1 
X-CRM114-Status: GOOD (  13.44  )
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

This series refactors all users of mtk-pll, just so we can enable
runtime power management for the clock controllers that want it. It's
also generally more useful to have the struct device in the pll code,
rather than the device node.

Also fix up MT8196 mfgpll to declare its parent-child relationship with
mfg_eb, and fix the common clock framework core to take
CLK_OPS_PARENT_ENABLE into account for the recalc_rate op as well.

The reason why this is all in the same series is that it grew out of me
first modelling this as an RPM clock for mfgpll, which Angelo disagreed
with, so I did some investigation and it seems MFG_EB indeed is a parent
clock. However, the earlier refactoring to pass the device pointer down
is still useful.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- Drop bindings patch
- Drop mfgpll RPM patch
- Add patch to also transition pllfh to passing device
- Add fixes patch to make CLK_OPS_PARENT_ENABLE also apply to the
  recalc_rate operation
- Remodel mfgpll's mfg_eb dependency as parent-child with
  CLK_OPS_PARENT_ENABLE
- Link to v1: https://lore.kernel.org/r/20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com

---
Nicolas Frattaroli (5):
      clk: Respect CLK_OPS_PARENT_ENABLE during recalc
      clk: mediatek: Refactor pll registration to pass device
      clk: mediatek: Pass device to clk_hw_register for PLLs
      clk: mediatek: Refactor pllfh registration to pass device
      clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks

 drivers/clk/clk.c                            | 13 +++++++++++++
 drivers/clk/mediatek/clk-mt2701.c            |  2 +-
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  4 ++--
 drivers/clk/mediatek/clk-mt6765.c            |  2 +-
 drivers/clk/mediatek/clk-mt6779.c            |  2 +-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt6797.c            |  2 +-
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt7629.c            |  2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c    |  2 +-
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |  2 +-
 drivers/clk/mediatek/clk-mt7988-apmixed.c    |  2 +-
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  3 ++-
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  3 ++-
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  3 ++-
 drivers/clk/mediatek/clk-mt8196-mcu.c        |  2 +-
 drivers/clk/mediatek/clk-mt8196-mfg.c        |  5 +++--
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c   |  2 +-
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-pll.c               | 19 +++++++++++++------
 drivers/clk/mediatek/clk-pll.h               | 11 +++++++----
 drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
 drivers/clk/mediatek/clk-pllfh.h             |  2 +-
 32 files changed, 81 insertions(+), 51 deletions(-)
---
base-commit: adff43957b0d8b9f6ad0e1b1f6daa7136f9ffbef
change-id: 20250929-mtk-pll-rpm-bf28192dd016

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


