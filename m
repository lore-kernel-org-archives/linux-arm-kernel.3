Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB922E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NKcydP4sF6z0acZKBFf4Nja0oPp2hZP7BX98n2YEwGQ=; b=PREzyhujhRS251hONxPpM2xejq
	OIT55SaDlT3e/ZD/8EyD7fPkcSK2IPX/ZNvkRxP0ccDGIsMwwv6mFDhtndYly4Z59XTZn4ud1I5gP
	8hbDMg7APXlLfdgLwg2of4Qxb8G1E94o6bZdftLqXD8UbE/vJpaBb3FppDf8PkYhj8BIAbPJrmyVM
	Jwv+2zbxuxFueFtxC99pDv3u52gtTDZHflcZkyvcNn5h6p0fYGC+bQh6qVBkeXCjf8KAuquLstDaK
	F5M7DDWxIFlsa3f6RN+kLUrWNkYZGLkVPkThh0uoJm2ceBQy4QfGrbL36jci2XekA5HMQmlfWeopE
	q9FrT1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjvK-00000000mK2-3CWx;
	Mon, 06 Jan 2025 10:01:26 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUju5-00000000m0h-3foH;
	Mon, 06 Jan 2025 10:00:12 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c05:ad20::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7d57e692;
	Mon, 6 Jan 2025 18:00:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset with old DT
Date: Mon,  6 Jan 2025 18:00:00 +0800
Message-Id: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTx9KVkpOTENMH0saHkxDT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtOQRofSUtBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a943b0eaf1303a2kunm7d57e692
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kz46DBw5EjIQPR8DHgNCHzoJ
	Gk5PCi9VSlVKTEhNSk5MTUtNTkNNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS05BGh9JS0FBSllXWQgBWUFIS0k3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_020010_089900_48D27D0D 
X-CRM114-Status: UNSURE (   5.22  )
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
  Matches the '-ENOENT' error.
  Use devm_reset_control_get_exclusive.

Chukun Pan (1):
  phy: rockchip: naneng-combphy: compatible reset with old DT

 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1


