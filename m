Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CDAC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eioEqa0EfbR9P1WbS2T3eTOcuAkt21ry9OhBqgEUxnY=; b=SA8V3UqcsldLL3xxSa/waZiizt
	tIB+Rfqh1XWx8aY5bOTRhVFji1Jit7ADfS4eWTtIkPJUHyY4DikCgB+CPWbx/wDlEgdTtxnym0Fpd
	yyBo1l8HCX00LbzOu19Tesag6U4XCZiKYsycKD5be9JqC7iTaurs2371X3/xdXJZ7b9qYX+Kl112k
	WJ0SeTChKsGpdyx/LBQQYxfLvvaeBgoE8++uBKLaVzs9KaU9jqcXm+V/+z8RCxwNDl3hQTaGEc9fM
	dS3t0qMyltgpOO7bHoIuEIXdGmp9uJAekrjZ0UN8YWvDWXcNky6SWQFT1aE2B44QnG/RezYoHpX2M
	bQbvc1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnSi-00000003tkW-3YqI;
	Mon, 23 Jun 2025 20:08:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqa-00000002aZA-28gX;
	Mon, 23 Jun 2025 12:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680022;
	bh=tV8ORaIQbQLMSY8zkLMfrpms34GMlXjixrFwRo6YJy0=;
	h=From:To:Cc:Subject:Date:From;
	b=k3HVXr6+R+bc3cfY7iW8UOHT9TSS8Vlud6/ZIcCmlV6xnYcJHYeDFHI/V4ErPX5Qv
	 RkTbBul6wzC8wYZe/6z9tddgzYyfdzWMW9GO1RjJgfsrqQilqJwKFYpaZbtr01ZpIh
	 EhgKrh+5FGjVBdaevhaG+5phpNGK1Mmcnm5y7n2cW7J2WqlsFDEpRFqxdPhd2uZmk8
	 f0aS6ZrODg5OdK+hF9jgCpbY0Hn6jpy0nbk9sRN09U3lMKbVsORfK21Rm4BUslC+1E
	 QGhEji+CfdF8BD6KuMa1BLlWcP792Q63wu5UA1QNpNksTiaqoFpjpI4/IdWDLwGD8F
	 xu7xhY31NhxrA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3A0517E0202;
	Mon, 23 Jun 2025 14:00:21 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/6] regulator: Add support for MediaTek MT6316/6363/6373 PMICs
Date: Mon, 23 Jun 2025 14:00:10 +0200
Message-ID: <20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050024_738743_1522FA7D 
X-CRM114-Status: UNSURE (   8.33  )
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

This series adds support for three new MediaTek PMICs: MT6316, MT6363
and MT6373 and their variants - used in board designs featuring the
MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400 Smartphone
SoC.

AngeloGioacchino Del Regno (6):
  dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
  regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
  dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
  regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
  dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
  regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators

 .../regulator/mediatek,mt6316-regulator.yaml  |   81 ++
 .../regulator/mediatek,mt6363-regulator.yaml  |  123 ++
 .../regulator/mediatek,mt6373-regulator.yaml  |  119 ++
 drivers/regulator/Kconfig                     |   27 +
 drivers/regulator/Makefile                    |    3 +
 drivers/regulator/mt6316-regulator.c          |  343 ++++++
 drivers/regulator/mt6363-regulator.c          | 1060 +++++++++++++++++
 drivers/regulator/mt6373-regulator.c          |  729 ++++++++++++
 include/linux/regulator/mt6363-regulator.h    |  326 +++++
 include/linux/regulator/mt6373-regulator.h    |  154 +++
 10 files changed, 2965 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
 create mode 100644 drivers/regulator/mt6316-regulator.c
 create mode 100644 drivers/regulator/mt6363-regulator.c
 create mode 100644 drivers/regulator/mt6373-regulator.c
 create mode 100644 include/linux/regulator/mt6363-regulator.h
 create mode 100644 include/linux/regulator/mt6373-regulator.h

-- 
2.49.0


