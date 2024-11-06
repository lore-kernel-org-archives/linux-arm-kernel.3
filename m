Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB71D3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tS5coFjCL1GpMVLn+Jt4VDJfqi7WRWtEsSocGUBw08=; b=27QVcrDlc5LHSLbruvf4EI2dGz
	aCmbasfYN5Ugd4QNPSupWNPJ1dQrwwUZUDpzOhy45j4Y/JTusZyXyRIeKl+HPQ+ox/TQmd2agac+A
	tmTSuzWOuGFIbvBSltrV+Ck3Js3b8pbqPGbOzV8yj2YhGAMMuu7Z52SJnNLGtkLDaZtGySydgZYfk
	5+S2Aba4BBPlZUV7D6MHLmtyS8745rxzhEZ5dmrbt/dU9lHJSUM5XoqhEeOIuRDkJHpDMEEG+xseP
	9a0jQZh0fjd1DoaS+1rtqkrP7UpoFWjLJIKiEUxtGARdHQBFzFWPfCSgOPnfdBh0ihnfeUVmcZ82O
	7AzP7QHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cGA-00000002VrK-3N1V;
	Wed, 06 Nov 2024 09:23:30 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bx1-00000002OTw-2GTn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:03:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06823C0011;
	Wed,  6 Nov 2024 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tS5coFjCL1GpMVLn+Jt4VDJfqi7WRWtEsSocGUBw08=;
	b=QSZdGVv3ycCS5kk4vrRroi+FE3i7NJdyKHC9j0KU6LTlVP+FToYYrp6RlSu4WylUgNfVqN
	sNwVLKIPIZ2E6wIFjZUKv/zKjRY3MdR4SYvFlK1MB4pwPWcnkgg2q5NvxRuj/Ih6tRpvnV
	JSyQFFjdckBWVY1F496Gh278MnqbIhxweZ+m48A4W/yvvzhwyQ/gN5+9L+FxWZroWSsrpL
	vIL+28Ve0Amya4LMns9oMXdq4oBO04NDVit+lqtjbXJKTxU9LMOH6rkPTG7c6upxBHl2FP
	ResMKZzz1cL4lAmvXPeIQFMON2mopaJjqA2irerfsB0mgnx5QspMgrdMbzil1w==
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
Subject: [PATCH net-next v3 7/9] net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
Date: Wed,  6 Nov 2024 10:03:28 +0100
Message-ID: <20241106090331.56519-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010343_746690_0ABDA220 
X-CRM114-Status: UNSURE (   8.73  )
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


