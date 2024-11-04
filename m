Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80940D132B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ZppIYcpjMvbWFHPWmn60NKq7ChWrZAjJKj9kLN6SYc=; b=qBiLkghnRdw8wCr4K5iJGPUdnp
	rHuqx6qJ5IHMygBw0ZoROjJVyws1sibNYpvisu1C0MQvv5rSHLQYBecc0mX7P1UiCBwkgBVByoiSo
	5w7kkq4Ef/Ja4EZuHYoQ6MIsks67U9gg1R6tkcCyPY4kjmygMDriOQTjtUfg3LsPfuNAIPy0iH9ni
	Vgc5I60XL8rppZKWL80pCoV1CPmEHR9fsyqT2QP/InBH22f+mB46mw67jaq/R6Pr4R5qIVn8Xyx32
	HEmF4WszaszFIZPV1XAY5f0MmmJGWZB1CHMI2Kzm+QKTwAiuOp9FtwTGMDJh6z+29wSqgMnwgZocM
	pKQeheZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vkn-0000000DcmG-3MAS;
	Mon, 04 Nov 2024 12:00:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vb2-0000000DbBk-2nAB;
	Mon, 04 Nov 2024 11:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730721011;
	bh=NVLDLCUn6vtNrbakwRfGhEiyOqXaZBqsTk7KGrsU+G4=;
	h=From:To:Cc:Subject:Date:From;
	b=Yu8sAZ/YAdECQFEgrNFIRo8ZUsoPMuFnf+BY9tor4FYPgwdsS1gZYuqKhi9Bcqhnb
	 i0bbHP2jinI1ahF9FSi9weQGZ9Zb6jw+R0/ISAGyHR7ve2vLH6WGEZglqhxbP/Jng3
	 IP3dO+bXxt+br6rq4MpXbQ+FeUdGqL26nGK81TA6BnpnpLjcme4QZeyv27T35O9lG6
	 l/Ap/5rD0OhFc49rHyofKU6W5J22AtkI7yTkDdphqhH7r7627ixvJYAYTEDMih/7NS
	 hqZ/qckbUnQfNn1JfHAuCxgCZEegyG6H4EUe2AiACsmyCQlm3uytkHK1ueg1pNeu6f
	 oPNB/Uk2keI3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AD2C17E360A;
	Mon,  4 Nov 2024 12:50:10 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	fshao@chromium.org
Subject: [PATCH v4 0/2] PCI: mediatek-gen3: Support limiting link speed and width
Date: Mon,  4 Nov 2024 12:49:33 +0100
Message-ID: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_035012_872356_F60A100D 
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
 - Addressed comments from Jianjun Wang's review on v3

Changes in v3:
 - Addressed comments from Fei Shao's review on v2

Changes in v2:
 - Rebased on next-20240917

This series adds support for limiting the PCI-Express link speed
(or PCIe gen restriction) and link width (number of lanes) in the
pcie-mediatek-gen3 driver.

The maximum supported pcie gen is read from the controller itself,
so defining a max gen through platform data for each SoC is avoided.

Both are done by adding support for the standard devicetree properties
`max-link-speed` and `num-lanes`.

Please note that changing the bindings is not required, as those do
already allow specifying those properties for this controller.

AngeloGioacchino Del Regno (2):
  PCI: mediatek-gen3: Add support for setting max-link-speed limit
  PCI: mediatek-gen3: Add support for restricting link width

 drivers/pci/controller/pcie-mediatek-gen3.c | 75 ++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

-- 
2.46.1


