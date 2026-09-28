Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06546C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evTcyLTV/DIVnWXmZiMlgrVrf4ZyYkEgFr0T8VwAZ/U=; b=wjsd7FyiaOqWFxWg4bBXvc16y9
	a+9xlDZQTkCXeCA1AC1SFy8c96+qOW+q0Xp5MD6wgREdosUFLo+PwuxAKAbQZLeUsh/tN0sZIN/Cw
	iBLhzTk+/THGj/UfLI4jf03g1TVZlk2I5KQTkAbLNdOmAz5PtV//3oj5gHEMh19w0UMxfo/hwKteU
	K2hbsstjmL1i8njHMPO+lV9U8Cq8ASRP6ZELlSAFovwYm9QgyNLooWjoqL0gzSkpJFgQq/aycjqXz
	nNZSChHC3gjBcTY4HL/KTr1b+D8oXxGTXPASyaH9WU2/8xlSNx35vzx4aMOmKgy5YeoBjtyIA8y5g
	MpsutGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB613-0000000HZRR-1Wqx;
	Mon, 28 Sep 2026 07:43:13 +0000
Received: from mail-ej2-x18.google.com ([2a00:1450:4864:34::18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB60w-0000000HZOd-0cW1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:43:07 +0000
Received: by mail-ej2-x18.google.com with SMTP id a640c23a62f3a-c293c683202so376903566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581384; x=1791186184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evTcyLTV/DIVnWXmZiMlgrVrf4ZyYkEgFr0T8VwAZ/U=;
        b=nZzs6ErvI025oOB6Ux9zUT4hdPQQKBdHvikbmdTZOogJ5v12aaCTjU7VqV+GSjtboO
         OhOmCgehyhIGQMFaGwwKVkmdy9O0ZSa6Y/QAsaOMn9fMcVYWJUE1iSF2fAch0yaZEWzs
         iZCRFo3lA3kBIzvyKYTuNb2sv+IAGWvGpS/6VlgKFD4kvs6CGnCoDs2FSsG+34DY2JAD
         8IkkwE8tPawoT/Rcw40tD3+CIYWfozAI9AFtekm1Os7U5omoRhhXzA3LTDaPpoKBTeN0
         riCjoUuuBenRwUovJ5nR15ao+F3O0V0UijyfEIKEfXSFcNCa2l+GF+QyLtEluVXH0FpY
         CItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581384; x=1791186184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evTcyLTV/DIVnWXmZiMlgrVrf4ZyYkEgFr0T8VwAZ/U=;
        b=BXPAEmQWrK8JUcaWW9eYI0GxvQNa95aWKCmt4fbWtaRCcZfnQMf3M3vgpsslPEvCCe
         IKCFB+VSThm4chC2CE8OAOllmR1XQMMsf7ftwXiTR/WTo3PN3aixFyASzO22apT2qrLm
         a37tt4/i0xk7ela6BubAjNl0nDAXAb/i/5ctqaYYmy43K5nZVE2z/Jlc8H0vV6nWBG63
         /ZX2z3J/NNFGh1DgvkoJCknvdSfwE4meMhelPAefPtTXViMH6FgtS9TZxdFOvFr2+Me1
         n607zo12HvvjBVZpNGxlgd0PtI5UmOArgOqKBpcUavHBn8eYVu6x5xI0DIR8iHquhX5v
         K46w==
X-Forwarded-Encrypted: i=1; AKwUvBxz9v5jJIxlS3NIkgYDC+XiXcNuKKjR0Wo4Fd2MayBd+RoKPMQI6P/XVlsDf1OrrZWl+VhP9wKyFpqTu3gvzczB@lists.infradead.org
X-Gm-Message-State: AFuF++k2nsfhXKPWF6htH+UFrwW6W0NjpOCka6evsKORLaM3F/4kZIr3
	oW6nLAsW0kRvjrmkWgcikqeIPHrBmykgO8avMuk56ZUB0+Xm8CvI1z5B
X-Gm-Gg: AYBFou1k8aKn78m4ZKthRMA29k658Gj2xz2OshBHBBEE5o6eICjA2II+YFHOTw8TW7i
	EeZp6gKfawaQkDvD+xq6UdTUpOlaFEt7AsVAykv/LCFs9w1xLW0Y2Ao7wpOwRk+AFwCmGDQCtCu
	YwePbY1FL2lsuQcytb+Qzk1NgSAfahLq7C3jzH/CLogQl/gALIkfdLf9Y18PC859ekT5xaTHG2P
	1l6VM/Zsj0f/fABJM/hNbpl2MBhlIiqNFSMSiIKs+H47hRa4h0UHSVuhxxBYxIuHIebi6iPz6te
	tpi7rOsqpzOp5TUBQ9q/MinwhZEjPVYdk/L4Ja5Sk5VS3lMVfNNVXttvJQyQ364hdgLLyUWHj/L
	uYzypdKYpYkqe+Kr/CweInFWkz05wEE8deaHgPoZuJ5/cWl/pWZC35QgUdNsl1jmq+BXtyUWVB3
	+n32maLRnNSW+/UuO2rokNsU25gZwGlNthPcWayl52uI1ZGh6x5I7E4Uo6HfmddVoxXGhSkxRaK
	lIxW6HAnS3vSw40s9PMdXQYu68dv00Xd05YmSZS
X-Received: by 2002:a17:907:db02:b0:c26:19de:9acd with SMTP id a640c23a62f3a-c2aea0622b1mr662289866b.37.1790581384140;
        Mon, 28 Sep 2026 00:43:04 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76ac760sm419415166b.39.2026.09.28.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:43:03 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v2 2/2] net: axienet: add a MODULE_ALIAS for platform instantiation
Date: Mon, 28 Sep 2026 10:42:56 +0300
Message-ID: <20260928074256.462345-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260928074256.462345-1-maimon.sagi@gmail.com>
References: <20260928074256.462345-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_004306_225126_3AB399BD 
X-CRM114-Status: GOOD (  20.03  )
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

The module is built as xilinx_emac.ko while the platform driver it
registers is named xilinx_axienet.  For a device tree instantiation that
mismatch does not matter, because the OF match table supplies the
modalias udev uses to load the module.

A device registered by name from another driver has no OF node and so no
OF modalias.  It advertises platform:xilinx_axienet, which matches
nothing, and the device is created but never bound.  ptp_ocp is going to
register the AXI Ethernet MAC of the ADVA TimeCard X2 this way, as a
child platform device described by a software node.

Add the corresponding MODULE_ALIAS so name-based instantiation can
autoload the driver, and give the name a define now that it is used in
more than one place.

Tested on the X2 with a local ptp_ocp change: with this patch the module
is loaded and binds when ptp_ocp registers the device; without it the
device stays unbound until xilinx_emac is loaded by hand.

Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0f2170af9b10..ae8ed4495ea0 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -48,6 +48,7 @@
 #include "xilinx_axienet.h"
 
 /* Descriptors defines for Tx and Rx DMA */
+#define AXIENET_DRIVER_NAME		"xilinx_axienet"
 #define TX_BD_NUM_DEFAULT		128
 #define RX_BD_NUM_DEFAULT		1024
 #define TX_BD_NUM_MIN			(MAX_SKB_FRAGS + 1)
@@ -3223,7 +3224,7 @@ static struct platform_driver axienet_driver = {
 	.remove = axienet_remove,
 	.shutdown = axienet_shutdown,
 	.driver = {
-		 .name = "xilinx_axienet",
+		 .name = AXIENET_DRIVER_NAME,
 		 .pm = &axienet_pm_ops,
 		 .of_match_table = axienet_of_match,
 	},
@@ -3231,6 +3232,13 @@ static struct platform_driver axienet_driver = {
 
 module_platform_driver(axienet_driver);
 
+/* The module is named xilinx_emac, the platform driver xilinx_axienet.  A
+ * device registered by name rather than from firmware advertises a
+ * platform:xilinx_axienet modalias, which without this matches no module:
+ * udev cannot autoload the driver and the device stays unbound.
+ */
+MODULE_ALIAS("platform:" AXIENET_DRIVER_NAME);
+
 MODULE_DESCRIPTION("Xilinx Axi Ethernet driver");
 MODULE_AUTHOR("Xilinx");
 MODULE_LICENSE("GPL");
-- 
2.47.0


