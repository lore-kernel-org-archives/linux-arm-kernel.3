Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605DFCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PkmQWVy4pD1jQTxElQwxxBYPb4Zvp1jMmXz2mMkRMsA=; b=O+uHuxNmh+nk/rjqHXuAe+Wwmi
	Ewrw7m8YRg5Tiz0cOLMGYv1QUR2ZfAgiRdvkva2WJpzWoR3fiM1E7Q1ziv3sMEGJJ9luN7aTYC03k
	pZlq+oKrFYOhMBcuu1oBDRbwzhTOhZ9kbkN11mOjzvem575uSQAp1o8fFxNImjMaGYWUKTm40iLch
	RDQ8P1I+NBBoVMpX/QbThZV8yKEraD1Tj3HT3vVOXuN6XfDGd6010au1N2M/NO1m4iz5i5OphjNdy
	xEt9vADn9KnHVoQamKhq+hW0Dr4+gi081aA8eyJmxKBoCThMJdGX5MPmu0Ibw7RpTfk7THWzJDG8d
	eY7slj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEV-00000008goR-0gDC;
	Fri, 24 Oct 2025 08:33:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEF-00000008gUN-3RJL;
	Fri, 24 Oct 2025 08:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294773;
	bh=/xXfoyNB40eXSe6uoEs0dSEKGlQMCkc++6Fih/1zXNw=;
	h=From:To:Cc:Subject:Date:From;
	b=mdwKhxVxD+EOB87gibbxJjRuCjqFqdwgNTZAxM5gQ/k/WXAyvQVQ9+YrpiIO9Lwik
	 MghNzhsZlb5NRsIT4p9cj8ukFNBMoFIhxoqcfv9ym5/u+KrE7XDPthBxrOHW+JSVzk
	 g7OAhhZC4W7NvozjSfaQx1/Q616Jv06IDd3BN4WtsF7RW6cQUat0n7ipFUfJwXCDeW
	 l/sTI324NV2YSjX92rYFePzhgZdgP8cZi1gOIxH4tteDMzxqy19/Rz7yu7MXNjfuSZ
	 J0j9adJ2vL1aplbtohwAGnOZ72Uc0/GxOoar3Xg980zzBYN8lpMKFuy4NyT7nDk24F
	 ANeV4USrsBxJw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3654917E00A6;
	Fri, 24 Oct 2025 10:32:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 0/5] SPMI: MediaTek: Add support for multi-bus
Date: Fri, 24 Oct 2025 10:32:42 +0200
Message-ID: <20251024083247.25814-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013256_015822_234F30E2 
X-CRM114-Status: UNSURE (   8.76  )
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

Changes in v4:
 - Refactored IRQ domain handling due to deprecation of function
   irq_domain_add_tree() to use the new irq_domain_create_tree()
 - Added .irq_eoi() callback for rcs_irq as that better reflects
   the actual functionality of this interrupt controller (as its
   SLV_x_y_EINT registers are really signaling "EOI", not "ACK")
 - Fixed to use generic_handle_domain_irq_safe() to avoid races
 - Tested again on MT8196 Chromebook

Changes in v3:
 - Added Fixes tag to commit 3, collected R-b tag from wenst

Changes in v2:
 - Fixed indentation error in dt-bindings

This series adds basic support for multi-bus (multi-master) SPMI
controllers, as found in the MediaTek MT8196 Chromebook SoC and
the MediaTek MT6991 Dimensity 9400 Smartphone SoC, including RCS
interrupt handling and per-bus registration.

AngeloGioacchino Del Regno (5):
  dt-bindings: spmi: Add MediaTek MT8196 SPMI 2 Arbiter/Controllers
  spmi: mtk-pmif: Add multi-bus support for SPMI 2.0
  spmi: mtk-pmif: Keep spinlock until read is fully done
  spmi: mtk-pmif: Implement Request Capable Slave (RCS) interrupt
  spmi: mtk-pmif: Add support for MT8196 SPMI Controller

 .../bindings/spmi/mediatek,mt8196-spmi.yaml   | 138 +++++
 drivers/spmi/spmi-mtk-pmif.c                  | 472 +++++++++++++++---
 2 files changed, 530 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml

-- 
2.51.1


