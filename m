Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44F0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 20:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qif5EcVLg6WdPZOgwwmN+cGbgPvTYXMg6rg8yQFUfLo=; b=kmlHlIxY4xJNFj
	BGW0cBv4JrSbXRNnrH6pxrDlAFs+cp8bvlwTIJujigeJOku7qZsm3t4XBIsafIk6+Jv/TWad+ITNA
	Ehhe/pp3lFYrN37VjVxJfH/q06U3ohKT7Ccian6AZtWVmXaVDqUxcvWghZofDY2KrOeyBkXn0RjYl
	L3hZ8ROZcPvilU7hhmdZdq01tqra5+aEWL2I6kvpURpTwMRzYxDnlw/zlW/Ss+a0rFFtZo7Di038A
	b1sSCx7S0PpYy6zAFtsh6LkVtuQPLYRQovgSil84ZfkC3QU/lZdVkwUbEtsui1HTxBkeCPt6R6Q9h
	PtTLXPanbV2Yrk9n+rKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6y6x-000000057x7-0zOr;
	Mon, 21 Apr 2025 20:51:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6y54-000000057cd-1h1L;
	Mon, 21 Apr 2025 20:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745268567;
	bh=ZxOqVHlDEVfTiLyrrefIfTOsNiW0JRs2HVHhpijxbyw=;
	h=From:Subject:Date:To:Cc:From;
	b=PU5fYWackXwqBFQlGat6jTpSiWH61hepmTzwZeeM/bQQCBaSpHrdjIPXGt6NsuqTX
	 +Rogx+VghK9rQbYNJ9DIpdFTgziwF+UsLgYE/T7rI4E6uoxbkoPoivvre57aHy9VNj
	 SdIHurnQWax0tBKXxvFAy1UnVO8TkYDqHz8e13FRacQVNrxnQxINuU4Z3CiJh9xySj
	 xKP1md+LAgDTs5RECH58wWmpceTX9QMiQx42R8SHKAxhvsOs7BotIHaTFJDpDns3m+
	 vBWTDW1+3gqSVOeN1fqeimahcbbTO+ZtMhwpLSEGPt/agK0kEd/hj65YmdXOTf7Ohf
	 4Z3cGTfYk3ZTw==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C667E17E00FC;
	Mon, 21 Apr 2025 22:49:24 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 0/5] Describe MT8188's SCP as dual-core
Date: Mon, 21 Apr 2025 16:49:03 -0400
Message-Id: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAD+vBmgC/4WNQQqDMBBFryKz7pRkQlG76j3ERRzHGlAjiQ0t4
 t2beoEu34P//g5RgpMI92KHIMlF55cMdCmAR7s8BV2fGUjRTRldYeQV+5edkH0QnLfK1AorGXS
 naKC+JsjTNcjg3me2aTOPLm4+fM6XpH/2TzBpzNXSGNE1MZfmwX6abOeDvbKfoT2O4wvWvCUov
 AAAAA==
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
X-CRM114-CacheID: sfid-20250421_134930_631979_24ABF93D 
X-CRM114-Status: UNSURE (   8.73  )
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
its usage. Patch 4 updates the MT8188 DT to describe the SCP as a dual
core cluster and patch 5 adds the firmware-name property so the firmware
can be loaded. Patches 1 through 3 are dt-binding fixes for the SCP.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v2:
- Added patch 3 removing redundant reg maxItems
- Clarified commit message for patch 1
- Rebased now that MDP3 series dependency has been merged
- Link to v1: https://lore.kernel.org/r/20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com

---
Nícolas F. R. A. Prado (5):
      dt-bindings: remoteproc: mediatek: Add missing minItems for 8192/8195
      dt-bindings: remoteproc: mediatek: Remove l1tcm for dual-core MT8188 SCP
      dt-bindings: remoteproc: mediatek: Drop redundant maxItems for mt8192/95
      arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
      arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    | 21 ++++++++++---
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts        |  6 +++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 36 ++++++++++++++++------
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  7 ++++-
 4 files changed, 55 insertions(+), 15 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250318-scp-dual-core-mt8390-8ef1b02f2d92

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


