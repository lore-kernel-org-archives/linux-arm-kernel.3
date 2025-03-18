Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66787C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tf0/vZLjh7FjVCyT4EWNS/OB+9B51n+WNUMmmRk3LBw=; b=cJhb4s1xdWDZjY
	sQX4TdZ9GPDwf8JhV6vnE17YR5MBFKl0te2fTWrD972Un+xLmcar7DxaiDsw35GKThmU75ctlWBO7
	scTLlp06jwloquOBPa82gNwe/kx+sLXgSW6VhH113ob4bEDtl6x7LsuKXG95S9l98mg0b5CiqBGaH
	qkqrSh1S/iNyR19h4RtZfcLg6JGCAzEtGgdz9RjAUxDq2izhND3+j5vAoxs3w3yZb3BC4uCse1DvA
	PI07BzUWG4cKOKi0Hi7Lidyuom/NlLTM9h/cwtD5JgtpHYLjgiGxedSMMUSV7o4kq/PhSaT64Y5EA
	Kv3vaLvMJpjgfB8Jjr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufOA-00000007FS3-0dFm;
	Tue, 18 Mar 2025 22:26:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufMS-00000007F9l-1IDD;
	Tue, 18 Mar 2025 22:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336674;
	bh=1kIVihgqc8aluSZgJJicYxOEEtfe4zDvBWptMZBFkrw=;
	h=From:Subject:Date:To:Cc:From;
	b=IJP6drnCoopWboiMcMsU0/pSrwjl5jDWiMPDTwCCSAztV1dm9AZwIUdn+wp3OOC22
	 kynMnvERfpExm96Z+lsQW8xW2ZuNyhs0Lv1qaEE5oPPaMavV+yrIxJn5iQAx8Qcub4
	 uvkXIa4mfWTtzaYtUB6wJnhZrLGjDgaEsOHT60gt6DXl5/yxFnQdCI04SEpeVYf38Z
	 AeKgfQFVDVAgVH4cGTEmmMLBgpMstzUgh1OKiDHx0yQ+ql3jq74ujqDUFLuKsi9UCi
	 S7ozqFtqHZ305Z+kIBRkRnrPzuO9nrF23hJYSCfpheoNKE+h7AV0H2vSLQznZq7Xj4
	 o/upThrAyY3kg==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CEA517E0B25;
	Tue, 18 Mar 2025 23:24:31 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/4] Describe MT8188's SCP as dual-core
Date: Tue, 18 Mar 2025 18:22:14 -0400
Message-Id: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABby2WcC/x3MTQqAIBBA4avErBvQkcC6SrQoHWugP7QiiO6et
 PwW7z2QOAonaIoHIl+SZFszdFmAm/p1ZBSfDaSoUkZbTG5Hf/Yzui0yLoc1tULLQQ+KAvmaIKd
 75CD3v2279/0AsBdsE2YAAAA=
X-Change-ID: 20250318-scp-dual-core-mt8390-8ef1b02f2d92
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_152436_498138_E649C75F 
X-CRM114-Status: UNSURE (   8.29  )
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

This series updates the MT8188 SCP description to dual-core and prepares
its usage. Patch 3 updates the MT8188 DT to describe the SCP as a dual
core cluster and patch 4 adds the firmware-name property so the firmware
can be loaded. Patches 1 and 2 are dt-binding fixes for the SCP.

Depends on the "MediaTek MT8188 MDP3 Enablement" series [1].

[1] https://lore.kernel.org/all/20241218105320.38980-1-angelogioacchino.delregno@collabora.com

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (4):
      dt-bindings: remoteproc: mediatek: Add missing minItems for 8192/8195
      dt-bindings: remoteproc: mediatek: Remove l1tcm for dual-core MT8188 SCP
      arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
      arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    | 20 ++++++++++--
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts        |  6 +++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 36 ++++++++++++++++------
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  7 ++++-
 4 files changed, 55 insertions(+), 14 deletions(-)
---
base-commit: 04b0d54949f9660384ceefc6f707e40daba6bf3e
change-id: 20250318-scp-dual-core-mt8390-8ef1b02f2d92

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


