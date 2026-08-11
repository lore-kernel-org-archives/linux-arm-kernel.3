Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A4C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yMX9Ga21dhbHVGb63bhwbGgT/8JNJkt/RiU0YZQ5d4=; b=pCtGi304oqwIAbQx1N0NjnhzH7
	VtOSpfVMUnDqwtyEZo4ppqOFWkRLIdY8+OtKrKSRR5FvlxIDuyqU8HiSM+33GPrdCopoiLRChATJZ
	Ct4O49NNLuxUG+jVJNXu9i7PSWWePncK2TxaBKPISm1XFsdO0uxp/k0CklAnsKQbMcntYc/yD5KnY
	E1x6k+HXth0MwmSWSQX1xsLEyji8FgfBjnJznR8ghyLeoJBVQuDNWhb+d/wYlB9y4zF8vJotL3cNi
	WDBaguhPXNF4lsHGX/Osa1Ex/OlOIDQAMXT3t2sKaXwp4DoBpLVK7AX2TnHTjXs5Z615kuizxnIcP
	i3bxBmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofb-0000000ENGg-0tuC;
	Tue, 11 Aug 2026 15:45:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtofL-0000000EMvx-1by1;
	Tue, 11 Aug 2026 15:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786463118;
	bh=16hcllHC3JtA3OuUp1DzFQApTbivlJhaMajDvCcbRYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R9TM2j2TvZgyCycTm4WXvlshccjdWi8+QLIweW9jYsjKtOHyW27r7dUBvm39JHVBA
	 vVK5au6oHF1UEUYGSVSPOelTgnC+M+D57E2vrjDs1Z1McOHT8EZkAMpAo7NB/ZBgoT
	 LY2kEkiACTf0C9OyfJoNOpbfrbImeSzBNqku8JMy40PCDlf98EM+axmYs077b97B1/
	 DvXEM/JI4PS/ZTV9qZjvsFiHaNz9X65BTdUAh/Ej8E2pCVy3mzvCsAed2/g98vLU7n
	 z2n9hpPiHIbXZ+htpWXXZfpZaVsb+sNvZXhv8WJhQ/oL6vQDy5csBqz9as44SQ4BXu
	 UCiBjgBrtoNZQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B71117E0F85;
	Tue, 11 Aug 2026 17:45:18 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 11 Aug 2026 18:44:48 +0300
Subject: [PATCH v6 07/10] phy: rockchip: samsung-hdptx: Consolidate
 consumer_put on error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-hdptx-clk-fixes-v6-7-75bca0ee5753@collabora.com>
References: <20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com>
In-Reply-To: <20260811-hdptx-clk-fixes-v6-0-75bca0ee5753@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084523_597795_E3478EC7 
X-CRM114-Status: GOOD (  10.60  )
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

rk_hdptx_phy_consumer_put() is invoked in both branches of the mode
check conditional in rk_hdptx_phy_power_on() on the error path.

Simplify the code by moving the single call to the end of the
function.

No functional change intended.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 6941dac9deb4..294484da7085 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1685,8 +1685,6 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 		rk_hdptx_dp_pll_init(hdptx);
 
 		ret = rk_hdptx_dp_aux_init(hdptx);
-		if (ret)
-			rk_hdptx_phy_consumer_put(hdptx, true);
 	} else {
 		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
 			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
@@ -1703,11 +1701,11 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
 			else
 				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
 		}
-
-		if (ret)
-			rk_hdptx_phy_consumer_put(hdptx, true);
 	}
 
+	if (ret)
+		rk_hdptx_phy_consumer_put(hdptx, true);
+
 	return ret;
 }
 

-- 
2.55.0


