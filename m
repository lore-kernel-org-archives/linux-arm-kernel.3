Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A086D1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkO1POXX6QJMBWryIQ5Nked+++Y4eOh+hwdKXFwqivE=; b=jhbaMasE7E/ObO7mLfayomzw1j
	uQqgpxtRLYPVDFCaE6BPnT3cGBymW6chCjWDwqq0Fm+bG40w/bJdezFAemD+cNVU4/zjr7WpOTmBr
	H4izKjdNvWzHDm234xbW7JjrWfPVRbZ5fSAj9SkonQaUWdelE737D1L39CJcxZ4ykydgiImRw+ByB
	iXct+VvtTP13fVGGMCDqUVahGVlRg0/RCM7LHdzaIPpEKkY46Aty1qqkazcZ5g6Fvbp6DWgoVIt8B
	Cl6KegKbiKihnnFiGqHf0QLO+9inIUaOEJx5mgDPKSJ+8fEN1Ii5nxvb/spunekBYkn+3Xw0lsY9i
	ht3sNOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8136-0000000EYvl-1MML;
	Mon, 04 Nov 2024 17:39:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Tr-0000000ES4a-2AyY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 04 Nov 2024 17:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OkO1POXX6QJMBWryIQ5Nked+++Y4eOh+hwdKXFwqivE=; b=ndMJG6G7Tf/UNvA7aQsiRVa5P5
	VWorsHNZ+XPmJA0pgPA++h1QnGygXl2AyLrm9ybzXigiNm7g9yJcx+JIIPnfkyU/tGQN/U3zJl9u/
	tLhE3B3wkHOAsXd+6bMcnshM/Q/iusAlT6gG1E9XhmBEZK1iYyBMSDGTA71+RPNNnbz0QmpnCYzZ0
	BOgxx/w0YUG2/dnwTvh40E3w0ofKqZ+yfmXY0Qs694n2crUaAyOWk6jRnsCdY0dewJFSX95K9AfTo
	tjsQPCxQnh5laPVTIuGhbAI+LxrRCdmS2qIFY9m9HiVSeyFXdJh6iIsK0Bcwl0/ZFcHJUAOSutoaT
	z1be8/mg==;
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Tn-0000000BOC3-3vw0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:03:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07D286000F;
	Mon,  4 Nov 2024 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730739781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkO1POXX6QJMBWryIQ5Nked+++Y4eOh+hwdKXFwqivE=;
	b=dmkVavHtsJHHquw13b+tInggEp3vFcIPTe/P4Zu28rz+dP5Z6MqAgxx7F9d/N7iqDXUmjT
	tkGWlU7UUoEiOkPQ2A5VRJrmX4uI7XpZ5XvA4XN4c7nzW2UCSZKZTMiZ8ihFLWhbWAtJm3
	4gm6AtGc0QCTspcni2MmBL6JVMRgrxqY9tsbYUIHjsNI+APqD3fP7gP6MqG5o8wgejwS0M
	wORiWBvpJAjeCBG1z7gY+Wb49CJo0Wy+EX51M/7qRK/Ai9It1eNkqey3YQ89VFUnP0jHJz
	jCWeS4uoOlIOK/5Oxia0F5J0vre17T8oj9yn3RdkXmxqVPkfO0hWnpBp+h2O5g==
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
Subject: [PATCH net-next v2 7/9] net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
Date: Mon,  4 Nov 2024 18:02:47 +0100
Message-ID: <20241104170251.2202270-8-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_170304_137286_47AE7E87 
X-CRM114-Status: UNSURE (   8.49  )
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
V2: No changes

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


