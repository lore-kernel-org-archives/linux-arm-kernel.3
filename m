Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF90C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hbLD2VXalF1wUUtZML2VeW0x2VSrybCYxHUW2Z4UM7I=; b=uar2yXYgoGMrPeJjyRzc+PGMXn
	y5jEZvGF5EHgPzsu3ugUTQAgBmeGv/Y82hElo6/zXQ8IL+LjDrVHbxcbebIqAuedC3zBD9zVz6tVo
	rf8mhEk1RL4fjb2zHlEJjVyrKJJD7NspjZLLI67JuSbqW3kYdpVoyIYX8bkv880YD/33iT4lsTSDD
	aZOeVGv6FG7YqZYfgujkWoMno8YfavPQBr/TFX+KmC9Gl2pe/e8lh7hBmbzG6Ea4src2vT9q0hGoc
	eN+Jv5zxZnrFdHvaXGKW23ihcROdKC1KUz3MII9byw559cjmPDlyYEhM9F1dlHcLe7uussVwXNfVk
	dGnzYKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FG0-0000000GWPN-1zqn;
	Fri, 25 Apr 2025 09:22:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Esc-0000000GRkL-1ffi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 08:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 458155C2777;
	Fri, 25 Apr 2025 08:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C630C4CEE4;
	Fri, 25 Apr 2025 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745571473;
	bh=SEMgzMn37zNgwDTilpI6l6F226AcCY0igc/LqqVT8B8=;
	h=From:To:Cc:Subject:Date:From;
	b=TgntEEmkOE0f9Gz3cIAv2HmvxIvjnoHLlmmga4WEYlLMYki8EMBwFBGkCTCww9ZrR
	 MQZSRTWvULMXvvTG+VVKlpvHKaiYHTaJfk7GKrydhk1ptGVk994fSGvkeD9x7E2/G5
	 5L4CchERkjeC5mW1xYnv9lOeK/m4pOFyNsB7MMNLLHJlttVapdZVZSPBjMpXYIDxtu
	 8abDeZkxln7pQey+52lQb+tI0Sjy5ysO3lt2lkDoFZMgNuFnFthMaosVHOEqmYQzY7
	 l0Ire9TOwhBHfo44Gw8p+zTlguDQIOcfh3niR8q3V25PBnKShuzB5mxpRtU1uEIuD7
	 m7x2kdQLgvppA==
From: Philipp Stanner <phasta@kernel.org>
To: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Daniele Venzano <venza@brownhat.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Stanner <phasta@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH v2 0/8] Phase out hybrid PCI devres API
Date: Fri, 25 Apr 2025 10:57:33 +0200
Message-ID: <20250425085740.65304-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015754_476297_79888D51 
X-CRM114-Status: UNSURE (   9.82  )
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
  - Rename error path. (Jakub)
  - Apply some RBs

Fixes a number of minor issues with the usage of the PCI API in net.
Notbaly, it replaces calls to the sometimes-managed
pci_request_regions() to the always-managed pcim_request_all_regions(),
enabling us to remove that hybrid functionality from PCI.
Philipp Stanner (8):
  net: prestera: Use pure PCI devres API
  net: octeontx2: Use pure PCI devres API
  net: tulip: Use pure PCI devres API
  net: ethernet: natsemi: Use pure PCI devres API
  net: ethernet: sis900: Use pure PCI devres API
  net: mdio: thunder: Use pure PCI devres API
  net: thunder_bgx: Use pure PCI devres API
  net: thunder_bgx: Don't disable PCI device manually

 drivers/net/ethernet/cavium/thunder/thunder_bgx.c  | 13 ++++---------
 drivers/net/ethernet/dec/tulip/tulip_core.c        |  2 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c       |  2 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c   | 14 ++++----------
 .../net/ethernet/marvell/octeontx2/nic/otx2_vf.c   | 14 ++++----------
 drivers/net/ethernet/marvell/octeontx2/nic/rep.c   | 12 +++++-------
 .../net/ethernet/marvell/prestera/prestera_pci.c   |  6 ++----
 drivers/net/ethernet/natsemi/natsemi.c             |  2 +-
 drivers/net/ethernet/sis/sis900.c                  |  2 +-
 drivers/net/mdio/mdio-thunder.c                    | 10 +++-------
 10 files changed, 26 insertions(+), 51 deletions(-)

-- 
2.48.1


