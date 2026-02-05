Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD80ECD997
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IvBuOfpCo0+VIpkSQ9liw7TJLNLW+8V64cAq9/bRrgg=; b=0RYvb96i6J1NgC13ITKJZFfG1D
	fFKSJ0Qzupo5aXlA61Bqc3sUkdOelJ6v/WB5rFYG7QaNjwDGacu6gohyHK5/3zu250WUHAT8Scly7
	fuYDrcI2PPLi8QC9AT/2Vui+2EQthZ8fDYzCpSGxQ+aDvjuvKJuIcZ+tpr4ZcyVMNBlWkNW2CyTnQ
	WJR/vIrMoipI/FngWCEMQRdLv1eTD+DLx2PD2AeYbmquGXYcpZPdPr+A+ZyCs9ddBBKuaC4Nm/+5q
	ZJGgdw47l0qQhvusR7uDweG3YY4uxR/kqP15LOVfh/iojB9TffqdaItX7aqTwSeX1RoO/EQz2S6SV
	8DNYX9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5JA-0000000ARfs-1KtA;
	Thu, 05 Feb 2026 19:46:32 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo5J4-0000000ARdc-2DHH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 19:46:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770320768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IvBuOfpCo0+VIpkSQ9liw7TJLNLW+8V64cAq9/bRrgg=;
	b=H3YWAR/S9RPEGh/7LguThmHCT60hRqQ/k9epVaJRwWzwNo+1WC42aCwr/QOw2ldPhICFSh
	09rScjUbaRIdBTzkgkd3mhueMzIYyHegtXN78H8A1hJjV3l6GvTT/PJ4nuStZtjc+T+Ens
	uAvx/bTRBDgXUPc+tglUvs0D3SCLfmo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] thermal/drivers/brcmstb_thermal: Use max to simplify brcmstb_get_temp
Date: Thu,  5 Feb 2026 20:45:42 +0100
Message-ID: <20260205194542.1013198-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_114626_714597_B992E785 
X-CRM114-Status: GOOD (  10.69  )
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
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


