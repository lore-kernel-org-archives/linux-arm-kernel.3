Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CC9C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dEj5v7dm6ltMlbxpUVJFd0IqvlQNf25lGrkWUdekOWc=; b=ZCs2DIq8Q+a0DBqBGCs7evc6+e
	93r89gCNJd3NgY9jNvmKYw/x2xSobMP9O731pbl1awW5PqKSlPaBfpY1oTLp91fFsqgtNToOPm5gg
	JZmE/7qYPTSN9Tj3KshD0tf7oyL7VNJ3aCMepQVi/yBlHImI292BTRp8rLVi0FcI2hLas59Vo7N+J
	JIyZOAH8h1j6Gah8sOC0JfaXVuZysMhIYvUNAEpw2GEoaBZaYZYEcwJXK+yUDnIgQ47ZKolLNz5Q1
	aX6kNOHKKv93DwXEiTsROw/qIHB4ggZhz47tUjiQFNCFGhsWN6/IisOOUpWmoMTS96Xi8FbKPf1oY
	p/sjzYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQoyB-00000002ag0-08jw;
	Sun, 15 Jun 2025 15:08:29 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQoti-00000002aDq-3YOb;
	Sun, 15 Jun 2025 15:03:52 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id A183F1005F6;
	Sun, 15 Jun 2025 15:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1749999828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dEj5v7dm6ltMlbxpUVJFd0IqvlQNf25lGrkWUdekOWc=;
	b=rD/4WxGJjG8Nxlm6Abii5nf4oHv828cFU2QyXiqmgQ/hN95IXcTjdthUNVp/LAF1jf2PCT
	/YVSeRpsfzGAAitOCJ0QDewA4ILE1uzqo45jI53r0tSv3wXU7E4iAnCtOT+Gdet9sg+fOG
	DCkY6FZFf68MckDhqCivbmhYjGW/rEg=
Received: from frank-u24.. (fttx-pool-217.61.157.124.bambit.de [217.61.157.124])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 57EDA1226A7;
	Sun, 15 Jun 2025 15:03:48 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Simon Horman <horms@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [net-next v3 0/3] rework IRQ handling in mtk_eth_soc
Date: Sun, 15 Jun 2025 17:03:15 +0200
Message-ID: <20250615150333.166202-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_080351_045427_5BCCFE08 
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

From: Frank Wunderlich <frank-w@public-files.de>

This series introduces named IRQs while keeping the index based way
for older dts.
Further it makes some cleanup like adding consts for index access and
avoids loading first IRQ which was not used on non SHARED_INT SoCs.

Frank Wunderlich (3):
  net: ethernet: mtk_eth_soc: support named IRQs
  net: ethernet: mtk_eth_soc: add consts for irq index
  net: ethernet: mtk_eth_soc: change code to skip first IRQ completely

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 56 ++++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  5 ++
 2 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.43.0


