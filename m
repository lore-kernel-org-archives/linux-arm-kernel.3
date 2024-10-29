Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E113D2AB37
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tS5coFjCL1GpMVLn+Jt4VDJfqi7WRWtEsSocGUBw08=; b=gr82+cCVZ8Ry2LRpD6S/6xv8MA
	ZVqnbR6JFkoSxnIX2/7CPGb40P5d2Z5TdhPJlsDXz2WrSexe3wqCTeSqHa4zr7s+Td+UWN62wp0SR
	buZHQ56EH8+ZsfGck/k74rPbZ0VMGo8KVA9x+Cb5q79kPnH5OEE+wehKvNbvmu18DTqQ0PSHxrcT+
	Tj4PymN06y0jb8hqSqMqiCzICW085rIUVeNYVYWk4J9q1VWmNoV2q3vDW9TQWXmjdFOgAphVcP7LY
	XZ1gZZ/Lztr3lj/1EovzQaAGNblwpNInFFMpIo46YZigTxABX56/naYQjJWBUtPG7cb46CC+Hfybx
	U8Biq//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lNq-0000000EPcL-156o;
	Tue, 29 Oct 2024 12:31:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5knu-0000000EIqG-44gE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 11:54:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABEE71C000F;
	Tue, 29 Oct 2024 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730202869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tS5coFjCL1GpMVLn+Jt4VDJfqi7WRWtEsSocGUBw08=;
	b=huzUNewiNqRNpYVxzTQz2brPQBEvqJ336v2olcaL11JZm6/5Fv4aL5763Yhrc8kFLuC/TV
	ZPwh6Ha646K5kOCSinR1GdTqimRx6oiEr+rvXtFIDx0vr8XNq9B106KDfjbbAoEsb4ZBv/
	Vdr9j9WDpHWWFT7FO+QrHOZsGomBO5uurm5r50HLfeBlny1ATcMK6MEyecw8dqVBQJ6ZbJ
	CcS8SoHfGm0/j51F26uWN9Naou2W4aPojedCDaVyyEYOy/NWvnoRvbA4CrVq2H3OoUG4Qm
	BNKCsvWzLUJfhr+bIAQbybLsE96hJaOUrPQ9Y+8pAEmcJ9ECWPS+1mUaktiutA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 7/7] net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
Date: Tue, 29 Oct 2024 12:54:15 +0100
Message-ID: <20241029115419.1160201-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_045431_170204_06FC48AB 
X-CRM114-Status: UNSURE (   8.53  )
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

The stmmac_ptp code doesn't need the dwmac4 register definitions, remove
the inclusion.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 430905f591b2..429b2d357813 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -9,7 +9,6 @@
 *******************************************************************************/
 #include "stmmac.h"
 #include "stmmac_ptp.h"
-#include "dwmac4.h"
 
 /**
  * stmmac_adjust_freq
-- 
2.47.0


