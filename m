Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37481C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XwPufE1hM49CXf5WKQ1mjRy9ZZ+xzBB/3MH7ag9qT44=; b=O1J3YtM5vAunESdSY6wqcnHT5m
	SN2RgGGiwZ4hFjz9DKB7H42rzwYly7TSHDFURmTBaniVPJ6glVyi4Ao/R4brAZs2Ol/GN6buLO5M1
	NekPlCmi2U/7qILYSY+nxI8/O4H+qqKu0DomH2vF/M2F+SQyPfTCVUuDfyyMgGgCBvbqUgSewhl44
	7poJ5zlz9+mTdQgupKRjQmz0L9XUe0wA3XJRBlu4lWtHIWhEyXt7qWgFAwWuKIy9YaFcnf4Jb2O2G
	QAJfcBsYnBMUOvhecNhQIxtfuJ0wcvI+C9Xnf+jwLZ5fL14za/xViwb/kGdjuEZf7nwz2xnWeeYuo
	+cZBeacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiIy-000000034yM-1EI2;
	Mon, 23 Jun 2025 14:37:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrq-00000002b41-1plb;
	Mon, 23 Jun 2025 12:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680101;
	bh=TuuRJJOjVAMtrQ8x6GoCVUnFQqeVYjXrluDun4jAFyo=;
	h=From:To:Cc:Subject:Date:From;
	b=M8sQQpH0vNNWDlN39Wt4Sw+b1spNqYJhM6c42ylTEvRGKUXN23xyGauMzzNBFyvwg
	 /2WMZLRElF1ByNPuunVK0YP55eDxJs/5Oq5ibRqtFid1jPsf/9DwmQl8ZDiUGmgiyQ
	 3Du31xQumhSsRti7HzptTUCoMGFmhFL1RQpl8QKGbNje+TsqlceQnTlwXoaYLdaMDo
	 MwqkRlNNoUUtIkzI4LCP24xINhUoT5gL3/uM7psNXQLscOeBblJRsMlhJ6dsrU1bYq
	 OLWorQdGCMH4CrkKJEnGIkot6/B2KmX2lzgAuV/EqX7gLQx8nIjsfNoAe7O1B3vEs5
	 SGCNbSnKWNW3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71B1517E090E;
	Mon, 23 Jun 2025 14:01:40 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
Date: Mon, 23 Jun 2025 14:01:34 +0200
Message-ID: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050142_623243_8A7069A5 
X-CRM114-Status: UNSURE (   9.67  )
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

This series adds basic support for the MediaTek TinySYS SCMI Protocol,
found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
MT8196 Chromebook SoC.

This is used to communicate with the CM_MGR and other MCUs for power
management purposes.

AngeloGioacchino Del Regno (2):
  dt-bindings: firmware: Add MediaTek TinySYS SCMI Extension protocol
  firmware: arm_scmi: Add MediaTek TinySYS SCMI Protocol support

 .../firmware/mediatek,mt6895-scmi.yaml        |  22 ++
 drivers/firmware/arm_scmi/Kconfig             |   1 +
 drivers/firmware/arm_scmi/Makefile            |   1 +
 .../arm_scmi/vendors/mediatek/Kconfig         |  16 +
 .../arm_scmi/vendors/mediatek/Makefile        |   2 +
 .../arm_scmi/vendors/mediatek/mtk-tinysys.c   | 344 ++++++++++++++++++
 include/linux/scmi_mtk_protocol.h             |  62 ++++
 7 files changed, 448 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Makefile
 create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
 create mode 100644 include/linux/scmi_mtk_protocol.h

-- 
2.49.0


