Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1946EE95A98
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AbV86VKicUS9//iTdeImRvdKhU2mPJAy0Der0dsHoTA=; b=Ml0kuK5wtTJmJvDA1CH8h+P5jd
	aGDerY6LgKMpGDAmXeGaamJn0PEAcOzBtNCDQzDvLf6mPOb3crsoT3TkPsbM71EIwCLd7l7gGNXwU
	CY0EJ+X/q5xlhs759bUyiOl7TzVCjpwLAWoY0oPbupWr4VO5AloRkb34siWh3c7ooVr5ISDqXsVJf
	VqlyufqCkjaWfSBTL/QCayA9IzoHwsSsbfPBXAQ+mMSYYTQKqO58CPVSYJPdCea/vS6eSX4nTabk9
	ccder5gjH0GVnq6orIboB39ppYwnL8vISKfTl9Xlz9YHwOmG+ruSSoSJlhLdgukHkyeYtl1SW3DwU
	xdieofvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaMa-00000004uYK-3ucx;
	Tue, 30 Dec 2025 14:06:16 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaMX-00000004uWd-1nRv;
	Tue, 30 Dec 2025 14:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AbV86VKicUS9//iTdeImRvdKhU2mPJAy0Der0dsHoTA=;
  b=iWLh48L3popN33eiPWyexJoY3eO9vex7t18Gz7EA09y1F0eqPQWLiVZe
   y5FGzCP1lCU6oNZpy3TxBcWQDtnAtl4wL7i411YFbehelWDXR36k1LIyc
   ndxFUzybFB1TzHSxTJP6kf1o+B2EIt/Y3dRf5cvyg0mXC/a8hv92qplz/
   Y=;
X-CSE-ConnectionGUID: 9BZ1V8NeQqierSOzCQU7Fw==
X-CSE-MsgGUID: Hyu3A/waSgOi6u4ADRBthw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,189,1763420400"; 
   d="scan'208";a="256347549"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.102.196])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:06:05 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Daniel Golle <daniel@makrotopia.org>
Cc: yunbolyu@smu.edu.sg,
	kexinsun@smail.nju.edu.cn,
	ratnadiraw@smu.edu.sg,
	xutong.ma@inria.fr,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: adjust function name reference
Date: Tue, 30 Dec 2025 15:06:01 +0100
Message-Id: <20251230140601.93474-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_060613_749656_3E12B59D 
X-CRM114-Status: UNSURE (   9.46  )
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

There is no function clk_bulk_prepare_disable.  Refer instead to
clk_bulk_disable_unprepare, which is called in the function
defined just below.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xfi-tphy.c b/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
index 1a0b7484f525..100a50d0e861 100644
--- a/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xfi-tphy.c
@@ -353,7 +353,7 @@ static int mtk_xfi_tphy_power_on(struct phy *phy)
  * Disable and unprepare all clocks previously enabled.
  *
  * Return:
- * See clk_bulk_prepare_disable().
+ * See clk_bulk_disable_unprepare().
  */
 static int mtk_xfi_tphy_power_off(struct phy *phy)
 {


