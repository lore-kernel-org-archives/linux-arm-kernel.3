Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B811C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3DKk2xDUzeUmFFmNxdPi9mwOk8bJdhgglGbWq7L3yOw=; b=LPhnwd4AXcS3jauZLVN+L0TI4O
	Bw5IAnFdOYUmDIi/hbrRq7PqMdW0ht003w9bleSV56ysFlFP6Mt5bhw84qC6sN01mR5nLgidSzpVz
	gbUlzAux9q1pqlw/qNZrufIcZjCsLw2DnCmw1hGmHaixB9GaJS9Y401PWKHQ86D0n7370yDwp/RZX
	tU9nT1AHWkYQb0h/VNYCPgsTAfa91V7XOl4ABGQk2WlGZ2VvqOja50NPvTDbOwgpydBAuYkbNk9HM
	ACXncL0W64XE0DIgxtzDa2dxBUBOvMhc6nMvfQMlJ1OLpi7wIvwNgrv7tCh6VxYwlyNaxFhd0Hpkl
	vAhhyHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfemm-00000003GTJ-3CHB;
	Wed, 05 Feb 2025 12:45:44 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfek2-00000003Fe0-1L4U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:42:56 +0000
X-CSE-ConnectionGUID: ZYBSvqR2SPypyda14ZjJqg==
X-CSE-MsgGUID: iVy0GdVoTqan1oKXy0U8xA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:42:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 268DD41F8497;
	Wed,  5 Feb 2025 21:42:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v2 0/7] Add of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:20 +0000
Message-ID: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044254_547339_D7D1A5BB 
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

There are lot of net drivers using of_get_child_by_name() followed by
of_device_is_available() to find the available child node by name for a
given parent. Provide a helper for these users to simplify the code.

v1->v2:
 * Make it as a series as per [1] to cover the dependency.
 * Added Rb tag from Rob for patch#1 and this patch can be merged through
   net as it is the main user.
 * Updated all the patches with patch suffix net-next
 * Dropped _free() usage.
 
[1]
https://lore.kernel.org/all/CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com/

 
Biju Das (7):
  of: base: Add of_get_available_child_by_name()
  net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()
  net: dsa: sja1105: Use of_get_available_child_by_name()
  net: ethernet: mtk-star-emac: Use of_get_available_child_by_name()
  net: ethernet: mtk_eth_soc: Use of_get_available_child_by_name()
  net: ethernet: actions: Use of_get_available_child_by_name()
  net: ibm: emac: Use of_get_available_child_by_name()

 drivers/net/dsa/rzn1_a5psw.c                  |  8 +++---
 drivers/net/dsa/sja1105/sja1105_mdio.c        |  6 +----
 drivers/net/ethernet/actions/owl-emac.c       |  7 +----
 drivers/net/ethernet/ibm/emac/core.c          |  7 +----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  7 +----
 drivers/net/ethernet/mediatek/mtk_star_emac.c |  7 +----
 drivers/of/base.c                             | 27 +++++++++++++++++++
 include/linux/of.h                            |  9 +++++++
 8 files changed, 44 insertions(+), 34 deletions(-)

-- 
2.43.0


