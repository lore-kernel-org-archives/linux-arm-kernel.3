Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56266C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrawXtX2euuurLP1VkfYnjK8exURZ1UqRLDXZHKvvIw=; b=iDZzZQB6/0MAkNTcNYS1EXKfOt
	TDJCgmoe3oTXl/ogqQD3G4OFU7xigjD+SXLJtJPwzZI+ZpWEXaB9tHeryZSY68j+eB/hBVBpPQHN1
	kvQ8t9SNV5L72ZhUGEUD0J8Jsd7W5YeoEOiNyW26v2kGajY5yr4qLsYiLSuJc8NtAaj0HWYuc02wq
	NtAaVvs4YBANmoaKfqm8vVG774Z3kn+OOSv2BvZMPwYV5NhFvm5UGvktc9JNN10HRTdv2o3Jgmuue
	JkhBWbnsNb4DRpzP4IGgRRXgnDaD7G4ZhYwS0+wTfmhDO0MnrD8dOdl+19lERrDWB9Yrt6uHuDFXm
	5YE47nDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWO9-00000005vwr-0YUJ;
	Tue, 18 Mar 2025 12:49:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWBs-00000005tfg-2VYS;
	Tue, 18 Mar 2025 12:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742301423;
	bh=fxTM9jWXIqtdXeG5zNaE7jOjW6PrCbSkzsQR1cv6hCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=el73fLUIM4EsSrSxgBxJTwe33XOBY4xUeVSlZZcCqzc/xdcxVCSbYdpijhTFlPE93
	 r8gU0GcVeIKhu4ba0i1k4/+oSSyRoyMtsi+7WabdjcPRBXkFmXo0fd9gVuneiQq0PL
	 lWmanueETJ1llbE3YSFMcTm8OThiMESEa5RTWTqvw0k47ulA3hSAN6YYVHIdrL5ygi
	 News/XqSmKdloNXRcY6RfMqP7qmNW3WuKzlbFz43BfEV2W1nJPegA8EfUa3tOCTxIh
	 yMs3/oqHk/et0Fw1MHw18bpAtRHbCriExBYgiSoIgvHr7md9FqBr5HoHW/Hf8YBPim
	 DBFofWX6imFiw==
Received: from localhost (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1B07B17E105F;
	Tue, 18 Mar 2025 13:37:03 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 18 Mar 2025 14:35:40 +0200
Subject: [PATCH v6 06/14] phy: rockchip: samsung-hdptx: Drop unused phy_cfg
 driver data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-phy-sam-hdptx-bpc-v6-6-8cb1678e7663@collabora.com>
References: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
In-Reply-To: <20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_053704_786876_3437AF0A 
X-CRM114-Status: UNSURE (   8.42  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 70621687b5eb3581a81af20b23d0be53263003bb..c9f79c4e698cef405dd2b6a8c1071e296464c36e 100644
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


