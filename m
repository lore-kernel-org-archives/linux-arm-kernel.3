Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BECC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc6jrEFIMyVc1LpbuPo4nJL9lqy17Ko9LczQR9HDXps=; b=mUmirUGxGSANW2VvUYV+B4CHEe
	sl50pX/UmRs5lpP6qJtILP+oBIywicAJhhRl5iTCWCCHInOlJq7wbQm0jI/3Q5tZMUsQ7Xm14elhe
	tICvJq6cfBd9y0afY+QhB66Cs0xHfO3eJ7LgQApvRm9l7mWhN0gDcwHnWQ5OJFIhBGv8x3gzZ5bZk
	rRyXjc09BmLe1tpOQCbHsIO53TcXLgkpl/eYuiXTK6NfX2MIUyNy7Cn50rMaZHw2cBjIo0Wf+rdMX
	Xhjne3VxlwOk793k2FSUNLmGjEtWY2ZZkoDU0llqc/IqWt3nTFCfCO2YvtngT1hasITHbB1ym0a5h
	jQEGJQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56NB-0000000ANw8-1ft1;
	Wed, 16 Apr 2025 17:16:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55sa-0000000AJCE-1y3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DF3344EC2;
	Wed, 16 Apr 2025 16:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8BEC4CEE4;
	Wed, 16 Apr 2025 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821892;
	bh=VylpoJr/xCnl8WcBXr2d8cdXmdql2CE4ZK2UhVwVCpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FYTb/0PUk8ojmN7UBIxKHfkRSeMEwg/0hUpAiEDvb0zobjPvLYKXP1UYT/FK+pmnf
	 Y0TfMWE/fCWME4nMJEB8KEc8SN09++vKcmgsztDEOkQ2+iqSWaePeSzhGbJxB6xA14
	 Gh3FPo2jopKKvJG1vAsP4mIFk3Qy7e1AcpgsFpR+awci4na/nE3YcNcxUPr+8Ik4U6
	 FIojIt+lijROedTs4jPsDFDtUzuqcsYD6HXqjaIOYcL3cJgrx96dKivmrWnjjxTFkN
	 ObF5qD9Rc32Wi9S7wecLwzKdiTnspJHg77XIyP1sufOGbSm+OLUcXLWY5ALJv55erA
	 niIsPcRdjxHVQ==
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
Subject: [PATCH 4/8] net: ethernet: natsemi: Use pure PCI devres API
Date: Wed, 16 Apr 2025 18:44:04 +0200
Message-ID: <20250416164407.127261-6-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416164407.127261-2-phasta@kernel.org>
References: <20250416164407.127261-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094452_523962_0932529A 
X-CRM114-Status: GOOD (  13.11  )
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

The currently used function pci_request_regions() is one of the
problematic "hybrid devres" PCI functions, which are sometimes managed
through devres, and sometimes not (depending on whether
pci_enable_device() or pcim_enable_device() has been called before).

The PCI subsystem wants to remove this behavior and, therefore, needs to
port all users to functions that don't have this problem.

Replace pci_request_regions() with pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/net/ethernet/natsemi/natsemi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index 05606692e631..dd279788cf9e 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -846,7 +846,7 @@ static int natsemi_probe1(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENOMEM;
 	SET_NETDEV_DEV(dev, &pdev->dev);
 
-	i = pci_request_regions(pdev, DRV_NAME);
+	i = pcim_request_all_regions(pdev, DRV_NAME);
 	if (i)
 		goto err_pci_request_regions;
 
-- 
2.48.1


