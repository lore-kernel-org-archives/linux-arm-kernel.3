Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849BBC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1+Nsxfs2vMDdToQssZ4VVGAM/rI1XzNuxJWZ5yj5Ck=; b=zTnyAzKuthT7Q+tTFoPYCJuJnR
	d2PKUL/7cb+heEkqHLGUzEI1ZBU59EXhR3DXp+DCvv17mEJQMYkJ24KvisfCWvMZ0mdU8+J+Jz8U6
	UpWefQNCcDk6nIsYzWYA1nNBrjoWLOB0/THsVW5n6AXmFBu0yMN1/YqM2tLspRTsgFY5vDgaRJOuj
	gdAvXe5pBFUohInrlQAi6ORmrI0Oz+lsaSasTo72d/kfGukqqTvoJPzxTDaYFa7Tbj7aT4Kt0v2dB
	tIxeTr37huTURYCq/SMrVrFd+0yCTaFwwcFBEP+l6Xtn2z+p28zM0+RQA2VJxJ9U8o+WmULMPn3kJ
	GrX0ll1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiC1-000000033YZ-1X15;
	Mon, 23 Jun 2025 14:30:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfri-00000002awX-25GG;
	Mon, 23 Jun 2025 12:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680093;
	bh=idTHQ9r0uHXKoBT2gS5ef4ZVLvkWzlt1nNUSitiLNnA=;
	h=From:To:Cc:Subject:Date:From;
	b=WV76i7QsO9pCUj/sfcs8ZgX4CDIigFMX+qv5Rjay0gUKpAhWXaFjdewtd3TUAxUXS
	 0aPWN3WjlgXOvQZ/wod7fVCPLGZN2sGbOTt8UN701lbtKIf7gRiEwoe1jNWAP/NI6q
	 iGchEboXxjlMbm8O6O6xpoE8iQ3oYNKh9pTe4/Tl8DcLW/LkIBWj8UFZ7c3DNOXvWh
	 H/H5JL+4uwkrc7pEdKv18CHQ6o6WdV0ZN6UC7koOddRAkHgNyWdUxE+QtP8Zf8n9Er
	 XWmAmv1rzZWcOIpHwUbNjnQpo1onm1nOuZ6U6QpJFGNBNa/jmo2lKchFkvM9eGwFAy
	 uD3QG5GVi+ZmA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92D2D17E090E;
	Mon, 23 Jun 2025 14:01:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] mailbox: Add MediaTek TinySYS Mailbox
Date: Mon, 23 Jun 2025 14:01:25 +0200
Message-ID: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050134_679933_63DA12D2 
X-CRM114-Status: GOOD (  10.60  )
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

This series adds support for the MediaTek TinySYS Mailbox, used for
message passing on ARM SCMI and for both the standard 0x10 SCMI and
the MediaTek TinySYS SCMI protocol.

This mailbox is similar to the standard MHU Mailbox, but with some
critical differences that are MediaTek-specific; for more information,
check the description for the commits in this series.

This mailbox is found in the new MT8196 Chromebook SoC and in the
MT6991 Dimensity 9400 SoC, other than slightly older chips like
MT6898 Dimensity 9300, the MT6985 Dimensity 9200 and similar.

Support for all of the mentioned SoCs is present in this series.

AngeloGioacchino Del Regno (2):
  dt-bindings: mailbox: Add MediaTek TinySYS MHU mailbox
  mailbox: Add MediaTek TinySYS MHU-like Mailbox

 .../mediatek,mt6985-tinysys-mhu-mbox.yaml     |  52 +++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-tinysys-mailbox.c         | 196 ++++++++++++++++++
 4 files changed, 259 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-tinysys-mailbox.c

-- 
2.49.0


