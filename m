Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9303C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4Q6Ad+YbWNAFT1S/eagIuareTvI4szF4zzV0Tuqr8s=; b=bnPCRBKreI7F5ZfnubMfuvDAGD
	BqqRVbDD+G8IkBeSMMq0yZntPNOJhEt6cQGYmgaFWAnKWQb5S2mJGcjRPFC4pTC2863nfArLNuTJG
	GQezpS0Xq7W5US+gsqyun1thw2qIE0d6LgFnBDm+EzwR00QP30vy0PgO0TeSy/Jpf/T7uG3vDxE7L
	gZh3Pq74PUMVOSd4ZorBJkLfakspfePMdj1IwgKekAZlPZR97KAUEdG3t+ixf2jn/i3eCuFFAPGc3
	QoyxVAhPDTHSm2sb2lpX47YD7tVzbHxiLI+RvEVnBCkkcSC0SI/gTctctWQPsXq9z492Gn8RI/I2E
	jE86wpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hwi-0000000CLqo-2I1g;
	Thu, 17 Sep 2026 19:39:00 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hwf-0000000CLqQ-3rtx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 19:38:59 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91058dd77a2so425996d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789673936; x=1790278736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Q6Ad+YbWNAFT1S/eagIuareTvI4szF4zzV0Tuqr8s=;
        b=TC/f2dEQf0WXV7qimJfiqRAiirkmkzMSn225K4O76n1izq904BJxjy6ZnOcckk0HH+
         VPy16FnvOn23jjUPXmaSwWpmDBmZZPrvi+x8oA9JZVqlHOVG1ZRnoeBCeRcT3+DzYgyV
         DTgMoOtg6INuFyMb/bC/AyXpH5W4l4n5wGN0o9zNwb3bIm/bowfYrsjwipOkJ6ctM3k/
         z6z2z6wXSC05bTfXdQfDm6UklWJW6iDUxwpWOhOWGKlZ6X5LnWZ/xak+naQxioPzZzdt
         A8v2Tgu3RVidg3VW17OX3iAb+0KhhqoL2eUuFlAjuH535eBVRhjhyhZP1r9zdeUm+y+o
         4r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789673936; x=1790278736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Q6Ad+YbWNAFT1S/eagIuareTvI4szF4zzV0Tuqr8s=;
        b=dt9QLiwQ7Xz4SdgurdKTbBq7oE7CbO3RbJT9uXwUFD8JicGI3opuFGCtE/E3tuvjMY
         dqgqDMWRnaVxQlOlHQxQ4F2BDoj0EQmZF1agg3OLdNKkXzvjYVfB7xdyuJSVoOwSg2tw
         E2zstRD0i/gucoECsSQThVHZEcRPs+bYxjDcD+tVDB/rWnDYIk2AeO6LsuH50cer4Xvd
         rHx7jVu9YoQ+ix+dlMZPSh6zhGPmlPCe9IqQr+JdOWLPo1DHtsWWVoqNCkounNTRN6VU
         GbqT4D6U6/Np9uo8qL34mOtspLx5ZRhnOGXDSvam/f9V9DnnkEWkmqcJUwQMNOStQEFI
         lsCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZu7PQRCubyk/4EM/6jWB/PNtabT8KdMt7toL1u7gQeWWCqQRpXXbAmcbWvBheS0jIDDF8niYODZ7pohxuodPH@lists.infradead.org
X-Gm-Message-State: AFuF++nuFiq7vCaz04astZCftjBEitACv+zDaZxL8o7yvVunm5kYZkXh
	zrNyLS6x90nTxKeDaLWhLkWSOO/vgYWJrnX+OMwehjMAE3KI170y2/s=
X-Gm-Gg: AYBFou1+NwlZzuefgWCb0CCXcJTErU75IXTfbT/YHQAQajN5+3fCCjJhjqZfiqNZ06x
	lgL4wahfFAdy7HxsWNyXAaQOgYnOWvwNsef6uNgdLqH2sjFO0rj1Th7vuU2lBBNQbdpGNjR+J3G
	9Ezo1eWmijmZLVxt2sBj6ikKFmtv0ClqMBzfk1ZqX2qw6LvWGdEoRHxGmOsSqGo+LUi9rtNcApC
	rFT3z4jpkluP+hJgaCsEUcUntgsZ3dA+7COOX/P9yETD9gGybKnhbrwNi2z8rb+Gc+J6mg9KB28
	VRSoCHfxVTFtHUdC9yukQXi8B9xrPlXjXq/C6s7+6X4xyxhWn7UB4QBRA2KG0lVmOjMxOufGf/Q
	DbbkNM1kmJ2xa4aDt8xXHoaajB/zf2C1a9lmLpH9y+wsgtmUHOG50HdC+MD54HxNawSRonawObZ
	2MoC9fBf7KhvP9/NULKRT9317hc34Nyf452PyetOja34JcrEh64F+ygjDMJ3hEWYvqblm83HElq
	NFt3Ob3Fes7/OQj0p1Tg354V8wQAN1fbP/Y/ATOqa55TA+lpUpy9HoRWQgoK+DA/ZjVIEfppW0j
	ZOag5pDKi0EuiVPIkuG2WgIkGzhGNO+tvJoF
X-Received: by 2002:a05:6214:d06:b0:912:517b:912 with SMTP id 6a1803df08f44-91254cd0594mr3693816d6.49.1789673936433;
        Thu, 17 Sep 2026 12:38:56 -0700 (PDT)
Received: from localhost.localdomain ([104.39.169.225])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252ce6d54sm5254416d6.39.2026.09.17.12.38.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 12:38:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diogo Ivo <diogo.ivo@siemens.com>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: ti: icss-iep: Cancel compare work before releasing device resources
Date: Thu, 17 Sep 2026 15:38:47 -0400
Message-ID: <20260917193847.63849-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_123857_990097_6CE16B05 
X-CRM114-Status: GOOD (  16.01  )
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

The compare interrupt can queue work that accesses the IEP state and
registers. The managed IRQ is released when the driver is detached, but
pending or running work is not drained before the IEP resources are freed.

Initialize the work with devm_work_autocancel() after its resources are
ready and before requesting the IRQ. This makes devres release the IRQ,
cancel the work synchronously, and then release the resources used by the
handler and worker. Moving the IRQ request also ensures the handler cannot
run before the platform data and register mapping are initialized.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: f18ad402cd8b ("net: ti: icss-iep: Enable compare events")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Validated with static source review, apply checks and strict checkpatch.
No build or runtime testing was performed.

 drivers/net/ethernet/ti/icssg/icss_iep.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index ec085897edf090e816b05880286a3f43c69225c8..fa45538f1faa6c8b44e7dd9a4ebb7269843b60bb 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -857,18 +858,6 @@ static int icss_iep_probe(struct platform_device *pdev)
 	if (irq == -EPROBE_DEFER)
 		return irq;
 
-	if (irq > 0) {
-		ret = devm_request_irq(dev, irq, icss_iep_cap_cmp_irq,
-				       IRQF_TRIGGER_HIGH, "iep_cap_cmp", iep);
-		if (ret) {
-			dev_info(iep->dev, "cap_cmp irq request failed: %x\n",
-				 ret);
-		} else {
-			iep->cap_cmp_irq = irq;
-			INIT_WORK(&iep->work, icss_iep_cap_cmp_work);
-		}
-	}
-
 	iep_clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(iep_clk))
 		return PTR_ERR(iep_clk);
@@ -895,9 +884,24 @@ static int icss_iep_probe(struct platform_device *pdev)
 
 	iep->ptp_info = icss_iep_ptp_info;
 	mutex_init(&iep->ptp_clk_mutex);
-	dev_set_drvdata(dev, iep);
 	icss_iep_disable(iep);
 
+	if (irq > 0) {
+		ret = devm_work_autocancel(dev, &iep->work, icss_iep_cap_cmp_work);
+		if (ret)
+			return ret;
+
+		ret = devm_request_irq(dev, irq, icss_iep_cap_cmp_irq,
+				       IRQF_TRIGGER_HIGH, "iep_cap_cmp", iep);
+		if (ret)
+			dev_info(iep->dev, "cap_cmp irq request failed: %x\n",
+				 ret);
+		else
+			iep->cap_cmp_irq = irq;
+	}
+
+	dev_set_drvdata(dev, iep);
+
 	return 0;
 }
 
-- 
2.47.1

