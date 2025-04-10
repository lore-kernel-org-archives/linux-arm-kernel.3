Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B9BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z42B21KEPFqr0yfnrtJ5Puij+WZLSGwRZ2mD2yRwGsA=; b=Vi1ekFwJhoEH/X5uUVu0NBM9hp
	OdWwDdTPsJ7ckFolh/Hl5qqNKXh1O881uTXaov50RsmaZY/c9nFcjKP6wlNAVts2GOylqwvldHQHX
	i/wF7aO21FA9+FifGzEb4kaPSTzcc1BfR6Agil3NgFheVwUY6DpOmCZYQf/nChxVLDpEVFHP5nn+E
	8jxdY0PJb/xEsgMY3UamHTSbBkp3g+CrZY55NGbepePDQ9tbkyJs034G1T5OVmJIo1WjTowmE+j5X
	6DbX7geFIxqOpjd0dpIcvakyO1o+Ygr/5HTCn0unh8CzgL/PR+jJ9KnlSjCqyUVM+AYdqksgEx0vA
	1nbBOdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tE0-0000000Au9i-1SGQ;
	Thu, 10 Apr 2025 14:49:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4W-0000000AsM5-0L67;
	Thu, 10 Apr 2025 14:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296002;
	bh=88N8hc6MaDmCB2E+c9BN0cKVbLYbqOereIkJ5ciR0Mk=;
	h=From:To:Cc:Subject:Date:From;
	b=KbHfDuCRZIADQ6itxCf6zf34AonLoaUiKxevLMmuXUe2Pyun+fAyAXXSIEmcg7x8l
	 de/BwQ6iL+l1wSRr+7IVbGgq7jjW9Xhap2YgI5+HfOdygI8XM1x2ydbgB+GvGNsRQD
	 0zxR3cEPUFwDXxixueqXBYhUOSi1jEiC7PPeStVVpzSBBn4VwipcXewmP5LtESsmdw
	 DbNr1uwSRO6e66BN6IyTh5cwMJvQZU2t0noSBwzCJ2P8C2oZeStnRiQCZXvYC+f4sq
	 XxF0k7ywOOwCVBh6eyg7i1d1CUU+j5PfaytBSMtvRTZZMNJrHxIfP/lef8FdNGQd+K
	 v8vuWpEcD0C3g==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 491C217E10F7;
	Thu, 10 Apr 2025 16:40:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add SMI support
Date: Thu, 10 Apr 2025 16:39:56 +0200
Message-ID: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074004_265663_C105CF45 
X-CRM114-Status: UNSURE (   7.56  )
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

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the Smart Multimedia
Interface and Local Arbiters of the MediaTek Dimensity 1200 (MT6893) SoC.

AngeloGioacchino Del Regno (2):
  dt-bindings: memory: mtk-smi: Add support for MT6893
  memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI

 .../mediatek,smi-common.yaml                  |  1 +
 .../memory-controllers/mediatek,smi-larb.yaml |  1 +
 drivers/memory/mtk-smi.c                      | 52 +++++++++++++++++++
 3 files changed, 54 insertions(+)

-- 
2.49.0


