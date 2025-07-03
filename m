Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653DFC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=777ZsQSRU6ufKvhSmqh8VDF8tGh0fwaT0sjE29pSmfU=; b=P4X9wiZCylopjiKTtx1N/lKM++
	vXz7HkZXpaVJIGoo2ij+bukMrCS0sFXINiKAI5HXPGiyUHuShnvbkScygdkQHlBvwZol/pzivnhpf
	usG+n7/1Iq+wvGh6KbCJpk9EdLyMDChud2l1JwF4EFEvSDCigYnsrD/211aCyuoK9X0jag59xQoVq
	AGfGmL+cmkJfzKJjfxZedGNBZkcE3rICMsvJfxqSe8Nzx/r7+M+CoI0xzMJDf5rihdqsuNpEd1PFR
	L8LLc7Ef8FuT3i9vrheh1n1PMi3PjMLdIBbo7eBQwkxtV4eFAI8aB6STj/LUL6mbgTp1gS55EydxT
	iYIkU+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJYK-0000000BQDJ-0zYJ;
	Thu, 03 Jul 2025 13:00:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIaS-0000000BEuH-47lF;
	Thu, 03 Jul 2025 11:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543923;
	bh=Cb+Jkon26DDgxH0Srzbbx+G+MR1ZIz7hkXTs9ISJRxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=K5i1ue2LdkZrKfkSYj5k/qzAqfkQzdGrxa5+VOXp5ui+yxoFUnzjCynxyXUJ98DSz
	 NV1JcO2t/QvjHTdOAxVdJ1y6bjv3E3VVg4jzrqSTck2cGq1frI5wnoG04tRQBVGXhR
	 pkUNIE408rYm/k3bvBSBRYkTJAzWsEd6eKpVVh3L6oItUvuKGJ72XgMj15vihAhIq5
	 oYrE32W75XGbsd5YKREBqVVy62tHfb8D9nWy42jjZKGLs6dpavhDrTq5rQbiV4FfGF
	 pBrzXBaLdQwK+ml/TiUEdDJo8hItfk9JmtEFZw0MfUf1U6SnrFlkCx3zt1kALgTUWw
	 0eQUsC1Po2LIg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDF7017E0071;
	Thu,  3 Jul 2025 13:58:42 +0200 (CEST)
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
Subject: [PATCH v2 0/5] SPMI: MediaTek: Add support for multi-bus
Date: Thu,  3 Jul 2025 13:58:23 +0200
Message-ID: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_045845_192947_0CEDCFBA 
X-CRM114-Status: UNSURE (   8.11  )
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
2.49.0


