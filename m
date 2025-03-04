Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F354C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXJfhiiJL183mL5DsjfdiGOw/4WR9YrncD+7r8HkcwY=; b=lR0RGrHbyqU3uOEbP3ZQMmiy9O
	C/fsbco7ne1/EzVBUYowdBB4CO4LQ2rWSlu/Q16ZN58FzoRtYjIaL/LTmZ4CwTljfRTSNFjCm/ArF
	wICt9kvUtQaM3v4JKWTeRs/mi78ZDefznxNT8hPTEQZaTW5GCD8m5SCtP7ue1s4YzveGa9h/VC4gp
	jd0UL9ELqEeOBFlsUQfLIXrHyWLdULgTzxfSSL6YcxvBEetyE6z98CUGGSWedPg8oxbgfQfsJ9TJQ
	Xql+BMJJvuJNj7lNWdxJ6S7gzrCW4NUQ5JIBh/R5PAzAvrJPfBYvxwcGsWtVDsU2KqkBwZh8JoGPK
	QSDtUrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHkv-00000002rwm-1IpA;
	Tue, 04 Mar 2025 02:11:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHKa-00000002o4h-1QeF;
	Tue, 04 Mar 2025 01:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741052661;
	bh=H52on9OF9VHErJX/F0Xzfni4+/Tw4ZDeMorcaCchiac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QYmfu+AWVA0I9gARdMIhIblPwsKGPekxWE6sUE2o+lgcdl2KQogWTJ1tvMLNaeQ7X
	 DHl6a2mwQvMTZYbUNkzHOhGlLaleNp1IZqn5XW8HFOufkMDa0JcH3LaXh42Z2rYX/D
	 TfAndEAQ1hDyM4WSNJcSOK0M+qoIH7Bnky5dgRouAm3fl3ufaztanDXwKro1Yoo8ps
	 4QzDqkICQsCzaB57g5m1TP4HBC9iYJkbcxmTF5xWteYZYaRfPFQ1RnnDZBH/qcpqeD
	 gwqq9pBlBgxteMnpQCJTaZc+7XYwuStUdimhOka6R7RfCWYBBu+ReqUjrroKdbDt6T
	 SOedM8N5yrYcQ==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 9552E17E1010;
	Tue,  4 Mar 2025 02:44:21 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 04 Mar 2025 03:44:04 +0200
Subject: [PATCH v4 05/12] phy: rockchip: samsung-hdptx: Drop unused phy_cfg
 driver data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-phy-sam-hdptx-bpc-v4-5-8657847c13f7@collabora.com>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_174424_555548_0C0BED78 
X-CRM114-Status: UNSURE (   8.83  )
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

There is no usage of phy_cfg in the upstream driver data, nor in the
downstream one, hence remove it.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index f9b5c96d6c789e435657e224032d35b5a6950945..06644c3d98d3f8b697fc704704df5acdd3c85bad 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -397,7 +397,6 @@ struct rk_hdptx_phy {
 	int phy_id;
 
 	struct phy *phy;
-	struct phy_config *phy_cfg;
 	struct clk_bulk_data *clks;
 	int nr_clks;
 	struct reset_control_bulk_data rsts[RST_MAX];

-- 
2.48.1


