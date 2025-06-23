Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB019C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6QFCiWa5Zy6iUa6OtPjlcTMOCRib9xDreqjyCmWWOc=; b=4/9zzc/6n3r8Q9TUFfU04qWv8n
	QyhTVB2p8P7S7qtWk5Y5e9MmInW1R7NJ/nLJgf/PvIHXDjbIoYApIl7IaI2UpBzECMPrLHJ8Xr+Dq
	RtRE7f/cKvGsbI1gC4Bg8+LUhngIWr9DldV4wg8jPryc8n6f9iZwDUqysDGASDRQTvvjcvYIpU/E8
	8l7A8k5rJpUGl6MlFdhMtMzQwSBagySRB8RtLcpC/gSghjA88Epk1+hdwtH0eRRsCdDoDyJHxbx+t
	i3cNVECChycE/ykzrPNPo3TuwZj89ABncG0voD/iwZcKbKkRG4PEFMxaI7WLJpF9AN5aWVu18tkNa
	uEJAQvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTizO-00000003D8d-3j5B;
	Mon, 23 Jun 2025 15:21:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTftP-00000002bV4-41Cx;
	Mon, 23 Jun 2025 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680198;
	bh=3nnjzdKDL/XFZioXMgbkMzk/XvnybYXfQac1elnYKk0=;
	h=From:To:Cc:Subject:Date:From;
	b=k6RSQSAOKKvHMpOXyLsoGT1dnJCjdRQDwxSGY61BzZUTS3VjCE9JIOoTBFekGL6yc
	 ++vTE/zycKImJfVDxqPfw5ryZW6DihXBZz1oW+mu1EIZWwWlSOJWM0ZgUzTAssA2yo
	 KnlkSFu9hrXjLSIYOIDxwLxfNNuU8dlzcV5ZyJJxBf6OTrUAI/VfqdEGLxSiDLV74v
	 Da/0QpbaaUlsfVjDRq52ei26DLRVx/+AMQ1Wn8s0Qbk5JP0joqszyp2GuAYy1WszFe
	 qJgdZ41doiknFjDhDbe565XiGgN4b5VfbyOsTIJbOOALl5jY1cbcrf2Bnwx7PrODJw
	 wCKNzizFDh2NQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE7BB17E090E;
	Mon, 23 Jun 2025 14:03:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] MediaTek TPHY Cleanups
Date: Mon, 23 Jun 2025 14:03:13 +0200
Message-ID: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050320_147092_25BB3655 
X-CRM114-Status: UNSURE (   4.71  )
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

While doing my usual round of cleanups, I've found some room for
improvement in the MediaTek T-PHY driver. This series performs some
cleanups on that.

AngeloGioacchino Del Regno (2):
  phy: mediatek: tphy: Clarify and add kerneldoc to mtk_phy_pdata
  phy: mediatek: tphy: Cleanup and document slew calibration

 drivers/phy/mediatek/phy-mtk-tphy.c | 65 ++++++++++++++++-------------
 1 file changed, 37 insertions(+), 28 deletions(-)

-- 
2.49.0


