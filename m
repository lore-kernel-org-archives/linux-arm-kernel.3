Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE46C369C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P4psDtOadHLoiWZyAP0BdmAfhckSsoSIAGxjOxy4N28=; b=xVraI+eTvAAhB7vgkd8U9pv50V
	Ibdw51OiU+4Q0vbmDcDHWdAXpjNGYrCeC1pIRIvEykV8dYW+mc+YIjYPE+YpIu4hTq6vof7x35CBJ
	b3BvaRBMBEIan/iV+J+ej3gORFfv5i+w6fR/pfE1eyJvlruks6znE6maPX7xfe8qlPOLlxXolWSuq
	4zmWRBm52xrcoOTC822r5nFB7p5QqJE9i3rXe/qTShGZ3s5z8kOsiaspHc+WNygyL6bO8PrkoB0dd
	iajdR1tV9xRo0FLKhBZQAKc79Q+iLd3x4Ge0uXr6rc9KR4f88NqT7ls5iBfHe+rFRkcCK+QLm3W8k
	pbluHsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56Ft-0000000AMnP-2LHE;
	Wed, 16 Apr 2025 17:08:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sD-0000000AJ4g-0t8M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C856A49DD2;
	Wed, 16 Apr 2025 16:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA187C4CEE2;
	Wed, 16 Apr 2025 16:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821867;
	bh=iqPra9prVNMgodRRIcMCpxQAVaTQdicXu+5CN0hR31c=;
	h=From:To:Cc:Subject:Date:From;
	b=SpqKoQdOC+Fzgwl+wMhWLB7uh0/azwveEtf4Y3rQcBKPzr7DUUoncxexeiqi8hI3e
	 Hig6yo+Ev4QS0ps3fOhQC4bna5yzv1xljWW35iwz0g8F3fRXxpcXnt44tZz2zZ1P4s
	 IPG8LqZE2h9m7zHKXdbjBhVh3C12f8MagiFp7SO4EgY3HTIhcvZzKOiLa+LNRuQxux
	 TbS6h2mGWy0JSACTOYT/pfItaFtShDOEWTClzvzmfBTI6ZZHYIC3ckCyz2gZ4GB8Qw
	 RkdvJJFSI+IyzO72thV42V8tD8CCpktgyeFS4bmGX8CnW0oHFI/zeXGRw1M7UWv5cy
	 5Kjps87p3lyHg==
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
	Thomas Gleixner <tglx@linutronix.de>,
	Philipp Stanner <phasta@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: [PATCH 0/8] net: Phase out hybrid PCI devres API
Date: Wed, 16 Apr 2025 18:44:00 +0200
Message-ID: <20250416164407.127261-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094429_313048_ACF9F9EE 
X-CRM114-Status: UNSURE (   8.53  )
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
 drivers/net/ethernet/marvell/octeontx2/nic/rep.c   |  4 +---
 .../net/ethernet/marvell/prestera/prestera_pci.c   |  6 ++----
 drivers/net/ethernet/natsemi/natsemi.c             |  2 +-
 drivers/net/ethernet/sis/sis900.c                  |  2 +-
 drivers/net/mdio/mdio-thunder.c                    | 10 +++-------
 10 files changed, 22 insertions(+), 47 deletions(-)

-- 
2.48.1


