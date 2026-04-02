Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23A2D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+fL9n2jTiYjb2TnUsQWtFMCRrAem7LSQMh+WmdC022k=; b=45odbhceoESv/xUNvbUykp99c4
	xSBYk+Rc1Mmvbl9na8Ykwy2+iiWnKKz9bAd22q1yTNqioP6lNtgoQJ74NMFO7M9JDgTPPn6H08LKb
	4HzevlWaXj4xgL4Xx3jXxHMKj25bH8h5iPRvAYZI1VdW9r0vhSvw3k4RXD5koc74EsTrOPACbp/Dv
	ZXwtFlv5lZ3MKLKpr1o8QGXybsPbH6PfM0qzJTD7pdy53a2DlAuk8rgCqEdYr/yizS9kWqWKb28Pb
	PhMNhJC7hBTxf+0sB//27Mtw6/nloFl6EXMlnqVfpzFQYdYVbtLzj7qbli8ho4sK9ASNKZk3cAM7l
	4crFaPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LM0-00000000Ync-2lXi;
	Thu, 02 Apr 2026 16:57:12 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LLw-00000000Yma-301Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:57:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775149013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+fL9n2jTiYjb2TnUsQWtFMCRrAem7LSQMh+WmdC022k=;
	b=vJftdmQic4VWzUsKGPrT8T6QYMBvkODNU+rNMbuogX5DPj3NIo7hKk8HN1F4WR2AiAX3Pa
	9zOfobf+ZYRQhUTIhrGTFrSH+ghye6DlMNXYTbnr7iL3nCiGYmREfXCXpRwaPvFIvX7bbe
	ErZPAj/irahI+yAytr7RFbakCeYVx4k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] thermal/drivers/brcmstb_thermal: Use max to simplify brcmstb_get_temp
Date: Thu,  2 Apr 2026 18:56:18 +0200
Message-ID: <20260402165616.895305-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=thorsten.blum@linux.dev; h=from:subject; bh=TE1aEBQME/LPSM0BPcXb8Dh4e+xxL84n+t5+RDaQR7g=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnn5m/Q8ehU3rBYxPVh5VwtY+XNXw/vlzi2LWyeAz/D4 R/LP4rndpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBETJYwMiw0mSDkfE1Vp3LV QrHPEk0Cj2Q6nJ/+8K5q5Lnzfu2+3A8M/5SrBA7MNFh033XXi8Luyu6vgqa7NNd/ureg5YVAYGH FJGYA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095709_973334_D0355561 
X-CRM114-Status: GOOD (  10.38  )
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

Use max() to simplify brcmstb_get_temp() and improve its readability.
Since avs_tmon_code_to_temp() returns an int, change the data type of
the local variable 't' from long to int.  No functional changes.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/thermal/broadcom/brcmstb_thermal.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index f46f2ddc174e..a9ffa596f7c0 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -16,6 +16,7 @@
 #include <linux/irqreturn.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -154,7 +155,7 @@ static int brcmstb_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct brcmstb_thermal_priv *priv = thermal_zone_device_priv(tz);
 	u32 val;
-	long t;
+	int t;
 
 	val = __raw_readl(priv->tmon_base + AVS_TMON_STATUS);
 
@@ -164,10 +165,7 @@ static int brcmstb_get_temp(struct thermal_zone_device *tz, int *temp)
 	val = (val & AVS_TMON_STATUS_data_msk) >> AVS_TMON_STATUS_data_shift;
 
 	t = avs_tmon_code_to_temp(priv, val);
-	if (t < 0)
-		*temp = 0;
-	else
-		*temp = t;
+	*temp = max(0, t);
 
 	return 0;
 }

