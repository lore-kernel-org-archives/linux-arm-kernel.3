Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C82C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GJRKzWtNxV535SlaYdTAa1u3Gqxfa3Iv6VjdNY+1QrE=; b=n6q6XcLW8BT+NheHfpEBSleBjD
	aqYa0IXYJo9+Nt+5+SMGALt/aUXBLIA3I3uiKSS2Bi19Nem6s7vBBmRJgfZZPweXDovm1D8VWlKYJ
	0gTC/eqMWO/zBqjlzZqBaai3t3AB6m31fu96oRqmOEUCMJeNn+iHygfweYOalKchX6HqVyl9JlRqx
	C0+eOc3ZBuPnDNMFstzfBrlPe6WZyT3v/PLhFvMDrF1MLpYhxu2kSCTmErx18j65v9Xqn20qlzKDA
	BbFmC+Caf66TWYC2i9DNvzqQodzbbLxVfLFIL+cuKGT7VhZp7walmfp74gvZRAG6TygUWDPLgF8HM
	pnHgwVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlut2-00000007tMq-3yvn;
	Mon, 20 Jul 2026 20:46:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlut1-00000007tMC-0iSi;
	Mon, 20 Jul 2026 20:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A7B360A85;
	Mon, 20 Jul 2026 20:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD272C2BCF6;
	Mon, 20 Jul 2026 20:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784580409;
	bh=v+gyiP3F5En4Mzp5K0FZ5ZTCbmOS6wGQ+d/V1cnkflY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bz33iz0PZwUg92faQOMbeOWANCIQw34JkZCLs1cgYUo+G2ef6iiII/9xLJf4990uN
	 mlqxSQ863zIUNG2pd6YeBcStKOsniHwRazJfa3dWKQZvRcv2zYybpELSedAkMokQMK
	 kRKG5bKsvr3Hy8kfmdXtrjNqKfJXXmxaM3kYKJUV7iaA+fg8pUiPdiwiUo2sfnvSY4
	 rTu2ni70vREw8WuOOF+/7yDbhAVxcS/6isrss2h7/cTazyztj1Rk2pFbfEZchsyI4v
	 WatfM5Jj++Sagv9f0NIu63j3nBlNqgOYJl0ucFCe5L5k/yS69KMfnxWWy2LFHoBnOx
	 DXe9MRlEinIsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5620C44520;
	Mon, 20 Jul 2026 20:46:49 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Subject: [PATCH v3 0/3] pmdomain: mediatek: Add MT6858 support
Date: Mon, 20 Jul 2026 23:46:45 +0300
Message-Id: <20260720-mt6858-pmdomain-v3-0-8966d8de93c8@jolla.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADWJXmoC/2WN0QqDIABFfyV8nkMtTfe0/xh7SLNlzAxtshH9+
 7QxCHo8cM+5CwjaGx3ApViA19EE48YE5akAqm/Gh4amTQwIIgzVmEA7M045nGzrbGNGKLGsKFO
 CsZqCZE1ed+a9FW/3H4eXHLSacyYvehNm5z/bZcR5969Xh3rEEMGqQ0JKyQnR6Dq457M5K2dBr
 key9+nRJ8lnRJSa151Cotz767p+AVdnEVgAAQAA
X-Change-ID: 20260712-mt6858-pmdomain-b1b456c96675
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nikolai Burov <nikolai.burov@jolla.com>, 
 Nikolai Burov <nikolai.burov+review@abscue.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784580408; l=2706;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=v+gyiP3F5En4Mzp5K0FZ5ZTCbmOS6wGQ+d/V1cnkflY=;
 b=us8g3ckdvk3t87RuXqPirheNWUBIN2a3SyiS4ZM13IU1iIzPELzMCVooL0FeU/86E2JqlpDvj
 3bcHU8tKQD6BYYg61dC1QFG66x/70B3cMmmoYQbdaosUKVBbfJxCmA+
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
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
Reply-To: nikolai.burov@jolla.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add power domain driver support for the MediaTek Dimensity 7100 (MT6858)
SoC. On this SoC, there are some new subsystem-specific bus protection
blocks, which are listed here in ascending address order:

- IMG_SUB0 at 0x1502f000
- CAM_SUB1 at 0x1a00c000
- CAM_SUB0 at 0x1a00d000
- IPE_SUB0 at 0x1b00e000

The VLPCFG bus configuration registers at 0x1c00c000 are also new.

Additionally, implement the SMC-based power sequence required for
enabling the modem power domain on this SoC.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
Changes in v3:
- Fix error path to also skip sram_pdn for MODEM_SECURE_PWRSEQ
  (discovered in Sashiko report)
- Link to v2: https://patch.msgid.link/20260715-mt6858-pmdomain-v2-0-6293e87fc093@jolla.com

Changes in v2:
- Rebase
- MTK_SCPD_MODEM_SECURE -> MTK_SCPD_MODEM_SECURE_PWRSEQ
- Convert SMC command enum to defines
- Based on the new SIMPLE_PWRSEQ changes, skip the sram_pdn stage for
  MODEM_SECURE_PWRSEQ too since it wasn't intended to have an effect
- Clarify that the SMC call also handles bus protection
- Simply if/else code based on the assumption *_PWRSEQ are mutually
  exclusive
- Add comment explaining that PWR_STA_2ND is skipped for modem
  (mentioned in Sashiko report)
- Link to v1: https://patch.msgid.link/20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-pm@vger.kernel.org

---
Nikolai Burov (3):
      dt-bindings: power: Add MediaTek MT6858 power domain controller
      pmdomain: mediatek: Add support for secure modem power domain control
      pmdomain: mediatek: Add support for MT6858 SoC

 .../bindings/power/mediatek,power-controller.yaml  |  21 +-
 drivers/pmdomain/mediatek/mt6858-pm-domains.h      | 466 +++++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  55 ++-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   6 +
 include/dt-bindings/power/mediatek,mt6858-power.h  |  23 +
 include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
 6 files changed, 568 insertions(+), 6 deletions(-)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260712-mt6858-pmdomain-b1b456c96675

Best regards,
--  
Nikolai Burov <nikolai.burov@jolla.com>



