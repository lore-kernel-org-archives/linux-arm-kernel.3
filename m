Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051E1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+V6QEUIHY3H4LYLoN9ksV9q/HdlHWPmrs84t06OUvMo=; b=g66JcOmY6SiYnGbrDMuK6Q4hKI
	VfICn21EttKiQLjT6Ht4qYh2l+aX9Z09de6mn5jM6hwR/6cB5g560oT5ponp3s7qiKn5BEr4xZdBu
	fXH/JKHmFchdMDb4LlgL6wrFpRGf1SkHEo2svh2yWjcnfzZUlUDyEhsdLa0oCf0TwKDSnurp0sAw0
	qO+Ha3Mj5QPdMMGmsfDSjRhVFiR5RTFj9G3wl2pEB21WzTIthmF80d1Z8HCpbD7RIudxd7lhHaU5M
	Cd8JKFjZuwhkzCJkUvAx0WUYjJyVR+MXMryBwVa9qrhwjeKBuJ3sf8F7N4f/Go1ZX7o5hD1DyShLt
	vXLFe6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f85-00000002PtB-1CH9;
	Mon, 21 Sep 2026 14:36:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f7s-00000002Pki-0a98;
	Mon, 21 Sep 2026 14:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AE20600C8;
	Mon, 21 Sep 2026 14:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4E7DC2BCB3;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790001370;
	bh=RvNYpNJD6NyJrCYRsRpzmKmx/fUslzMvGYBsiOGsetM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=j1iPfMKCWlWIGcXvepMXwgjmgCXm/s557eIVYdYxyk/qal/7I+oJjjd9oopqguIyp
	 DeDcpGRQNA5BL8b2uShBrs4XOd3e85wnSw75zFYN5aV1MPgWQW7ActKnAY6t26OmCF
	 foV2BRmZDdqRt8h0zWYnfFTmz/ogIpn63rH2aohld8+3avs48WKtCtVS0bfASBZsNV
	 pBocxXRRwL7qaqhBRaYmnjLCSh3+58dcZfDsFziBUBf2BVP7f/uUmVjYPtmW/eh3eg
	 5fQR4BMBbwmU9VPb2MzMPY68mTfyQZdaRPyZGyT7zjcZN2sWJYdWrDsUVOAzEd0K7u
	 ivRTlU7kMRuKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D76C982ED;
	Mon, 21 Sep 2026 14:36:10 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v4 0/3] nvmem: mtk-efuse: mt6572 support
Date: Mon, 21 Sep 2026 17:35:46 +0300
Message-Id: <20260921-6572-nvmem-v4-0-e9c14156559a@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auYrq3pf60r72FcQBm1RihpsdEQ7
 m7BGCG6/JJ53ulRhOAgot2qRwGSi843eYj1CtlL0ZwBuypvxAhTRFOCldQMN6mGGkNptlYXmnN
 JUQZtgJN7TLHD8b3jvbyC7cbCeHFxsfPhOX1LdLz7hOU8nCgm2FjKSzCmIlrv2+A739SFu22sr
 9FYT2zmmVh4lj3IbUVVwYxi9K/nX2+IWXievSVWCKqkEvzXD8PwArUp+b07AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790001369; l=2204;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=RvNYpNJD6NyJrCYRsRpzmKmx/fUslzMvGYBsiOGsetM=;
 b=DuQJTi1dwL/mEHrRKENqtYQHisOv1XvYQM0JbZPjNZUMMbW20rFYplNUypxDL1Y/C7pCqVlYn
 ZvYHMNQykITCd+jpjAz1IVo8EGMu5O6MAuc5LPXYC3pmFXVwj4e42ih
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
Patch 3 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
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
Roman Vivchar (3):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
 drivers/nvmem/mtk-efuse.c                          | 41 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 2 deletions(-)
---
base-commit: 2eda8d2a45caa955a5cb1d897bf6024d22041995
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



