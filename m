Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD1ECA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 02:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MwahjYlmNg5Sb7TImh0bCwCphihNsrlCradydgL/hSk=; b=aUGnZYxll1vAK40EfFaZHoNgY/
	RwWQG9OobOHHX1zuB+vjQ5Z8FYRwVBuZbf8KI7hQ2dt3+YcHNH2DhSFFoRXBQ15UGVHcjT6q3CZ4t
	vtlSiadWMa9318A+rm4nfvAZyL2Pml2ZalcBY4ixBide6ErsqZ+cx0kidTVxrqquQiI+KKXlY10oY
	UpsLWVL8PwZk2yFcoVtJQjuWQbSEW/4rneficHbZxbAiWXTVA6guT1T8wKPuELcuI/bRxUv34F5YK
	C2nbcJcuGy4N56Z87OZghNxYrT26XUjjzsC+6gXY6rOUmaUj5pXvHsGRHWlxUAQe+pYXOgXkPrbnU
	i0I88NRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdsG-00000003OTW-1JAo;
	Thu, 08 Oct 2026 02:28:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEdsA-00000003OSe-0xLS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 02:28:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2db710396ffso1239815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 19:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426521; x=1792031321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwahjYlmNg5Sb7TImh0bCwCphihNsrlCradydgL/hSk=;
        b=YG9nC32C0ON5AmRE2gtwvL+/jlxsj5LkLI4mFH3UWlcCxzDe0413L5M57D0Nd5x/wT
         bC3mXh5CwB1Y2c+cOO0GZyndER20J7+JexV1GbgFf2fOTlE6u7vWZ0dnVwTfAgnd2YeR
         arCXkhMquc8PUtyCsm+6xXMhuiOQdLjJOk7ehiuw0rvEVg1ZpXjPPGELJAs1kVXYOZ8i
         fTDTebpZqBWPpLaEd/HDTSGp1SwrZcjhxFeyfKy5PIAvddesQ/oLt/cVliAMhx/7wXn8
         KzPmQwmKSxbpxn1Sn+3Ojpp96bF1Is3CcGJAkXW3WUJi9CByiNIGiFsXq+LkbN3NUA0C
         SRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426521; x=1792031321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwahjYlmNg5Sb7TImh0bCwCphihNsrlCradydgL/hSk=;
        b=nE1KUOJdf9noAIMeB2SgRT2xrl1RFrcb7FhmNCCKLiJYc+KpIHJXm8PWU8ftSpfKsb
         68BPc5b7UQlokjxvJrvUoSY047fbLJoz+376Kz6qf/q5VL1yzmU/grKD3VrssN+MboYu
         Pw2ZFDh7fh3tZG7oacc91bG4RI+u4NuXvEGeE1LOa6KXWPtYdfoq825vn+4lF8xDWupn
         H69wt6qxyIuQIBEpDyimNL+4OFIHWvPi0KJzXSGTmLGh+eH6iG4MFzbikKTYyIXbWKp8
         XzcE4SUyypaDkOCTANLJYWcVlgMc7ErIfRRsRemu/SfOi/KEV3Quk4jof9gOJaiiZrG5
         Qmiw==
X-Forwarded-Encrypted: i=1; AKwUvBzIPSbX7ltMpg4t/cKajWnDV/4x5H+z93hjSE76wXKah3B9bZkxfGKOE5y9Yim+SaJJuy8bBNb1tKAFNqkKIg9D@lists.infradead.org
X-Gm-Message-State: AFq9FYIe+IiF2XGygrC8FiGNve7iQF9mDIpo8QWM2wUxKpKg1LSlV23u
	QwLu/0gu4c/BowkNkPln1EfER2duQPfIgd8c23e44zmsKPNZY+OzQPkx
X-Gm-Gg: AYBFou0sJh/8iR5NgI0cfxi7vBOCF2D1Vyus83M8tQ+GJAurKr18Arlwnr1luSoy0aB
	rpDmG1B9Jutok2+PaPAJnNJkvw74eLHWj6zXV/GJSSvX/tLOchyLrZWjhklI3WailzQJ3jc6tzm
	+tbwnK8M8eitfn/K915qKCT/5qrlH3+8es79pUZFfmhOF5H8gspTk0MA6fQSwv7CD1rq615N30r
	SQlAOIeutG1c+vqF40/zTfBWljGxwhA6MKEf6sPO+DxqSpVbJsUGmnB8JVVhZ2mb/IHZd8Exr4T
	3H4TeRG5jo25kZX5yBuvwAoBzgYHxKo9XGBwHFDOCQ/26IqwHrS/MtUXW7cZaxuhuu4qCYb/RMn
	xAFfCQj+ERdh9yO31hcNLTCxXfVzlO2NZHvqyBpqz1ptiMspOzjqY+aZi45Btnw0zjvOPUCECNf
	l5v0qr5UrjmZkoLk9uKoHMeH6XgxEVvfPFuSNZrTOcO6pg5Psl2YcKx/DujSBTokCF2CYhuHV3h
	/JE/KDOJNVgtQb498dUQPbzSA==
X-Received: by 2002:a17:902:eb8d:b0:2df:375f:b7ee with SMTP id d9443c01a7336-2e7ffde9b3dmr5405065ad.18.1791426520826;
        Wed, 07 Oct 2026 19:28:40 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:28:40 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Ciprian Regus <ciprian.regus@analog.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 00/10] net: Move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:42 +0800
Message-ID: <20261008022656.3592191-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_192842_341624_B643F946 
X-CRM114-Status: UNSURE (   9.80  )
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

Commit ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev()
locking assertion") put a netdev_need_ops_lock() check on the
phy_attach_direct() path, in phy_link_topo_add_phy(). With
CONFIG_NET_SHAPER enabled netdev_need_ops_lock() reads
dev->netdev_ops->net_shaper_ops, so any driver that connects a PHY
before assigning ndev->netdev_ops now dies with a NULL pointer
dereference at probe time. The breakage showed up in v7.3-rc1.

ibm/emac was hit first and fixed by commit 7c9f391ec89c ("net: emac:
move setting of netops to fix crash"). These ten patches apply the
same one-line move to the remaining in-tree drivers whose probe path
attaches a PHY before filling in netdev_ops:

  1. hisilicon/hisi_femac   (crash reproduced on hardware)
  2. hisilicon/hip04
  3. actions/owl-emac
  4. adi/adin1140
  5. marvell/mv643xx_eth
  6. amd/au1000_eth
  7. ethoc
  8. aeroflex/greth
  9. ti/icssm-prueth
 10. microchip/lan865x      (attach happens inside oa_tc6_init())

Only patch 1 was reproduced and verified on hardware; patches 2-10
were found by source inspection and are neither build nor boot
tested.

Note that ti/netcp_ethss and cavium/thunder_bgx attach a PHY to
netdevs that never get a netdev_ops at all (dummy netdevs), so they
cannot be fixed by reordering and are not addressed here.

David Yang (10):
  net: hisilicon: hisi_femac: Move setting of netops to fix crash
  net: hisilicon: hip04_eth: Move setting of netops to fix crash
  net: ethernet: actions: Move setting of netops to fix crash
  net: ethernet: adi: Move setting of netops to fix crash
  net: mv643xx: move setting of netops to fix crash
  net: au1000: move setting of netops to fix crash
  net: ethoc: move setting of netops to fix crash
  net: ethernet: aeroflex: move setting of netops to fix crash
  net: ti: icssm-prueth: Move setting of netops to fix crash
  microchip: lan865x: move setting of netops to fix crash

 drivers/net/ethernet/actions/owl-emac.c          | 3 ++-
 drivers/net/ethernet/adi/adin1140.c              | 3 ++-
 drivers/net/ethernet/aeroflex/greth.c            | 3 ++-
 drivers/net/ethernet/amd/au1000_eth.c            | 3 ++-
 drivers/net/ethernet/ethoc.c                     | 3 ++-
 drivers/net/ethernet/hisilicon/hip04_eth.c       | 3 ++-
 drivers/net/ethernet/hisilicon/hisi_femac.c      | 3 ++-
 drivers/net/ethernet/marvell/mv643xx_eth.c       | 4 ++--
 drivers/net/ethernet/microchip/lan865x/lan865x.c | 3 ++-
 drivers/net/ethernet/ti/icssm/icssm_prueth.c     | 3 ++-
 10 files changed, 20 insertions(+), 11 deletions(-)

-- 
2.53.0


