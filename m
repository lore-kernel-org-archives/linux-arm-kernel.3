Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF2C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iNe/0RWbQacivjz70zQH+VnaP0nkNic13oVHlfxMdAk=; b=kX8gNrMimn/00D
	eENMrEAqWKDpgsuHaPUdb4eBM8dsNKfq5YsecKsqHj24C5wn3rqHAMlZtsPHtJBjyWzKRuR1YAP4g
	ztr+k9A4oGopKL9/4Ix7ezHSbvHK127IC6qGyx7EF3Ppcl5eqPOxK7OBN0OnXiETLZrGt4nwjSyHQ
	5ROyIT7VFs3OidvCEcWs6qEC2cghB16BeFj06dAyVOR3TRb+EVJoHdYjxUtEKYb+QkI/aT3VdWrRi
	JzJF9iJVVajTNtpITx8RV3fIlpPYOEdMdA+zY6u4qJMCArVrQN87Msh2IdP5eRvjFibWrkUVjxMyk
	DKG+E2SKu4bLTrSqmncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVQz-00000005mGi-0ssR;
	Tue, 18 Mar 2025 11:48:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVOh-00000005lma-1WcU;
	Tue, 18 Mar 2025 11:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1829EA48E7A;
	Tue, 18 Mar 2025 11:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1F5C4CEEF;
	Tue, 18 Mar 2025 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742298374;
	bh=Wbt+cMfNuda8a8GObInFe/jXMq6FMLgwE5BGIkGdW8w=;
	h=From:Subject:Date:To:Cc:From;
	b=FyRRBtiy3eE2pXRRsGVl2QciJzEzUqLf77qlVZGsB6PS5eu2gTI+cmjziqBaBW75A
	 9x6Z7ZlmUYcNaBSvTwRyWMu145OWD03vb77HTd0z0pzSpeFs8iyM1LQeaTxmFQJ7Bp
	 VtReMp70OIErmAC5XUueVATCgOFx1Fg/WxOrCmmI248/4H/PgfE3XAjsVZFz/o6GmW
	 qtuX3GFdPRBU7ZJuh7YmUlo44G5z/IqBrp74u3Ssa6hqsReW4kPbvs/kaeoJeRYN3f
	 NhJXRNrY93/UAhAzDXGAXkcBm153I7ThToQZcF9oZoLUbziJxfV+lU/SCVVP9ShRyt
	 rc041qQICrxoQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/7] net: xdp: Add missing metadata support for
 some xdp drvs
Date: Tue, 18 Mar 2025 12:46:04 +0100
Message-Id: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxc2WcC/2WNyw7CIBREf6W5azE8qhZX/ofpgsClJVpooCE1D
 f8ubeLK3ZxJ5swGCaPDBPdmg4jZJRd8BX5qQI/KD0icqQyc8gsVjJIpe1wUWc1Mpj0IpEZ1aNt
 WdlBXc0Tr1sP47CuPLi0hfo6DzPb252J/rswIJeKqLdNS3iTFxwujx/c5xAH6UsoXJkY/La8AA
 AA=
X-Change-ID: 20250310-mvneta-xdp-meta-3e0da8ef4498
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Masahisa Kojima <kojima.masahisa@socionext.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
 Michal Kubiak <michal.kubiak@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_044615_536502_2E058CA4 
X-CRM114-Status: UNSURE (   8.95  )
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

Introduce missing metadata support for some xdp drivers setting metadata
size building the skb from xdp_buff.
Please note most of the drivers are just compile tested.

---
Changes in v2:
- Improve commit logs for each patch specifying xdp headroom size for
  each modified driver.
- Link to v1: https://lore.kernel.org/r/20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org

---
Lorenzo Bianconi (7):
      net: mvneta: Add metadata support for xdp mode
      net: mvpp2: Add metadata support for xdp mode
      net: netsec: Add metadata support for xdp mode
      net: octeontx2: Add metadata support for xdp mode
      net: ethernet: mediatek: Add metadata support for xdp mode
      net: mana: Add metadata support for xdp mode
      net: ti: cpsw: Add metadata support for xdp mode

 drivers/net/ethernet/marvell/mvneta.c                  |  5 ++++-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c        |  8 ++++++--
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c | 13 +++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c            |  7 +++++--
 drivers/net/ethernet/microsoft/mana/mana_bpf.c         |  2 +-
 drivers/net/ethernet/microsoft/mana/mana_en.c          |  4 ++++
 drivers/net/ethernet/socionext/netsec.c                |  7 +++++--
 drivers/net/ethernet/ti/cpsw.c                         |  6 +++++-
 drivers/net/ethernet/ti/cpsw_new.c                     |  6 +++++-
 9 files changed, 44 insertions(+), 14 deletions(-)
---
base-commit: aedfbe251e1c56034cb6ffd87eabe5895b31ae5d
change-id: 20250310-mvneta-xdp-meta-3e0da8ef4498

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


