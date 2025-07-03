Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616CAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B99JdE3mFfH46FWqhHISke8uf2hAU5ATI2Ix/a9C0vI=; b=UziuXSDpyDiWY7ssY1kW7+w1lf
	+PfV9Fo8W6K6aElkVOdhY+bnQHZeI1WsWNmJTpZPMDZfU5zJTce61YsrfC9NnXGx1ZMyeiEZ2cb6X
	hgT5tvQf4T5GEfmWVXc9hXQmrfGZCafyyzeOe7xzSJ/lw759pOC7wqv/mgEDcaIsTVB0T69essORd
	d+3BlIOuOTrBRLInXToiBV8dR9ha7K2avUPWswp5SQ9QWpURRuSraLP28sAMQYw3WdpxWqYU39EA4
	eb4gcS06bnGIaFMXWq3mAg3gKGGdvqRL/uRiDQ6JD0bpYBaWSv3EjpEXFWi7GoidFQ7sivLA8zgtc
	GWMUg0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJMf-0000000BNpu-3gxB;
	Thu, 03 Jul 2025 12:48:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIO3-0000000BCea-2E8g;
	Thu, 03 Jul 2025 11:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543153;
	bh=lwXnV0Dls981nC3awFV3EN6ST4p2FmmmeT+dvm3TjM8=;
	h=From:To:Cc:Subject:Date:From;
	b=bvtA0vFkRLDelS8s1Bd6clYxb9AKPZER8aKMMHVPqVe9ekguTjgeBtga2TSPxUnIf
	 iysyoRhek8oSr9rDPAmpo/436ahNBPuK/dbvBFRKLAnpzqrqXCMYjXd0K68DmeOwiO
	 bvUrpu7UvmyTkXZdRlk1LvPbuJZoo0rsTCV2L2GWor69Uxm2bdEI7mxvQircdBqmec
	 IQ0b0pfcKm+9wBrNQ8Ko3N/lRbPZn/irXveBHdEXaK37kMJUB2QNrGBHP/j/HzGEo+
	 iEa5IE41YM6LAcuUTEoVDKtKXR5UzJLN4QhVupHI06vnTMxExRNE+pHNJ1v0TR2+Nu
	 9hhhgFZnvIzkA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A818817E0456;
	Thu,  3 Jul 2025 13:45:52 +0200 (CEST)
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
Subject: [PATCH v2 0/2] mailbox: Add MediaTek TinySYS Mailbox
Date: Thu,  3 Jul 2025 13:45:47 +0200
Message-ID: <20250703114549.114313-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_044555_719363_ED7B4ECF 
X-CRM114-Status: GOOD (  11.63  )
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

Changes in v2:
 - Changed IRQ_TRIGGER_NONE to IRQF_NO_AUTOEN and removed the
   useless irq_set_flags() call to set the same.

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
 drivers/mailbox/mtk-tinysys-mailbox.c         | 195 ++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-tinysys-mailbox.c

-- 
2.49.0


