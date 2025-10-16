Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E400CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iSbmPltaf8nXUgjSVn1JxOwtC0g2uzGgFRJ7cAgNInQ=; b=dz/cmH9wvy7b8qeE7gp2/nvpYw
	IKQey+7Q5O4fSt5iIx46p+jJYJm0Z6Ms1blY1LH7mVOQ2fDiOy4MU4cUiRoKbMa+hniRkFMcpUDtM
	KK5ZTKJKJpQV9loosFMz0JHTvct0BLiIMp0CP0uHTVgtps/5XDYCXoBHmXEJhKFT/ThasfytWB8/A
	ArFIW7fDAuB4XC8GZWEReFLoCCDNxax1maJmamM4S8QSRQwJG69hk074wn0oBeCJRQb3Zi/ehKOfW
	fRJ9Pn07MG4ShGW/S73jwMEnOz9gW10DlkqhwtASo1RbecMwbyynnPPnDgWRmzGL8o/RONqRwvACZ
	vM0hE1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KSq-00000004F1H-1hKb;
	Thu, 16 Oct 2025 09:40:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KSo-00000004Ezg-0R70;
	Thu, 16 Oct 2025 09:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760607599;
	bh=v6Ocrtosc6c0YJwqmFvARUqAbo+TYf5sq0Vgbnyd4hg=;
	h=From:To:Cc:Subject:Date:From;
	b=WJPr3Vjdw+HdWcDIFPdO/syP44mZ1IaUzB+ayKkHlsTWZJKh8XfkxXS7o+7OqZyRe
	 nB/6NV7lFPvnYLJ67Ynfuui7Z9G5bQFsz2mxcyPAHdmlNs1Tl53vz3rYqrH6ihWuA7
	 4tONx1T8b/c05bmRqqxeE0aXkmjRrycoOryipiRotc883PsZKgLC8khY6TY6t6LgZ2
	 xWLAKh50t/OFs13RpkcQEb1Hl7hlHrTbUVE6PKy3l0DEr4BJAtMzeRb0zwiDS4yBD/
	 vAEkIETPtO1TfEAkHTcu9EF0AgehKrgB0xU2PP7UF/r936xLldidjORhcbvYTPfIj2
	 l1Y4yBMr+vCew==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16D1317E10C8;
	Thu, 16 Oct 2025 11:39:59 +0200 (CEST)
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
Subject: [PATCH v3 0/5] SPMI: MediaTek: Add support for multi-bus
Date: Thu, 16 Oct 2025 11:39:44 +0200
Message-ID: <20251016093949.127326-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_024002_315964_0741AACF 
X-CRM114-Status: UNSURE (   8.46  )
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
 drivers/spmi/spmi-mtk-pmif.c                  | 471 +++++++++++++++---
 2 files changed, 530 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mediatek,mt8196-spmi.yaml

-- 
2.51.0


