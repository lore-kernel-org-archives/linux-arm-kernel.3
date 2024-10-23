Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC26CFA461
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBEb4NtHom1Amm5GRaVl+XE8JAU+fJmnCcHkJE8TtL4=; b=qPxgV/BAZ1QaUIVX5go4+3dtFP
	PcTvt9/djHp8SgoJ8sbL3cv556e10/FYwIHT5nNVMs3igzWrnjP56WB1Efk487f1LVfd/6NOcDlPG
	BeOjKhkr0JjxsPr6+IyqeYZVnBqAEAah5g0sAt6aBbrsgZ33pZzok0PeWFIz++cs+gyNL/UPxSK4s
	jldc0n3TSRDvxv+CoRJLPnlNg1jqj/E6/aDKrbJF9Qvwni49u8uVJslzsBiDnxM2bsyeH5khmAejo
	VTZn6YNcN6uyO4LxlNSJIlOIigx/KpL+FP/AHIIURfeFK9fbgtHctivDdhLpWpqQ9c7sE2cuDxt36
	Gq7DRLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gw5-0000000Feqt-0PGd;
	Wed, 23 Oct 2024 19:22:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fBd-0000000FNgF-3w0H;
	Wed, 23 Oct 2024 17:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729704617;
	bh=jldwutBZphTyZk0A97ZTFnQDd2dt3KyWgWlWpUn/IUc=;
	h=From:Date:Subject:To:Cc:From;
	b=WXXer3mxLwPsYMZxNw9mWDbOAg3QNt38De98+ntsBMfnBefHqWHfLAXK7zW/14la6
	 MrHjtgwdSHVqBUo0NddBvx/r+ywiPZr7RYTK2Em55dHjJddihCgqBOiboJpkOev4Bh
	 ayH+RFgwRxaCCvddEBgublFj9w2gvaNFdxHn61/w/jfnbBbpUNaMiTaMtNscUcsZf0
	 RsStV0BFm48EZt4JYZz33YHtJJN4KyWh8/6iWEaquYVUmwdLVrKC1pkrcSyKPkwsjg
	 52pztVODxNSYYudtf+EdKHn/zxQEhA+yKovARBGmZLYPteZrRNDkRhu6Fz877pyCxJ
	 Sgx3LHmqYN/WA==
Received: from localhost (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98EB517E36A7;
	Wed, 23 Oct 2024 19:30:17 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 23 Oct 2024 20:29:54 +0300
Subject: [PATCH] phy: rockchip: samsung-hdptx: Set drvdata before enabling
 runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-phy-sam-hdptx-rpm-fix-v1-1-87f4c994e346@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJEyGWcC/x2MSQqAMBDAviJzdqCLuH1FPLiMdg5qaUUqpX+3e
 EwgieDJMXnoiwiOHvZ8nRlkWcBipnMn5DUzKKEqKZRGa17004FmtXdAZw/cOOCsatFVWuhGtpB
 b6yjr/zuMKX3FircFZwAAAA==
X-Change-ID: 20241023-phy-sam-hdptx-rpm-fix-b26094303718
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_103022_198554_6F4F4FEE 
X-CRM114-Status: UNSURE (   9.34  )
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

In some cases, rk_hdptx_phy_runtime_resume() may be invoked before
platform_set_drvdata() is executed in ->probe(), leading to a NULL
pointer dereference when using the return of dev_get_drvdata().

Ensure platform_set_drvdata() is called before devm_pm_runtime_enable().

Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index ceab9c71d3b53ae0b746a10c081fcfaa7d5c5ae7..0965b9d4f9cf1926ba2aaa54c3d1b105ecd1a5a2 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1101,6 +1101,8 @@ static int rk_hdptx_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdptx->grf),
 				     "Could not get GRF syscon\n");
 
+	platform_set_drvdata(pdev, hdptx);
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
@@ -1110,7 +1112,6 @@ static int rk_hdptx_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdptx->phy),
 				     "Failed to create HDMI PHY\n");
 
-	platform_set_drvdata(pdev, hdptx);
 	phy_set_drvdata(hdptx->phy, hdptx);
 	phy_set_bus_width(hdptx->phy, 8);
 

---
base-commit: ceab669fdf7b7510b4e4997b33d6f66e433a96db
change-id: 20241023-phy-sam-hdptx-rpm-fix-b26094303718


