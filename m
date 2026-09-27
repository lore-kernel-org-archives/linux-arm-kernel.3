Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387FFC98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6b0gf1HYtLKFke/fEYzMHCoVYjMKyNvdGkgCDilbmEA=; b=CJJptsL8B5+UzpUHXwwe674Hfu
	HLy5T6o3X0iSikpN+0l0NAwHAoruiSQnWkgUw8RSeNzlM3e0b1M0L0satxlJxx9Izadmc+fr0evxm
	IUTjj3NdHOhEmfFuboVu9aE5zAaIU+MBIPuLjNE2SpMTM2ih7Gk+nFbjD224x+5R5iiC6xDgtSWzI
	lJDWgiCvIuSUgq7l5oa3GocZ3GKfkorQxiSpCbCfuSKoKrLevBELrcxHJpixdu+F7zTulOh0YuT/l
	1CAMScZN1xTtTf7kOVfjG4CbZ/Ch1mbf9bjv7gySi5RHm35lJsyHCAv3DFDc6WD10p6wmjXmVY41z
	wc4iWZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjTQ-0000000G6xx-06QH;
	Sun, 27 Sep 2026 07:39:00 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAjTJ-0000000G6w4-2j5T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 07:38:55 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so12097285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494732; x=1791099532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6b0gf1HYtLKFke/fEYzMHCoVYjMKyNvdGkgCDilbmEA=;
        b=oitbD1BdzhWsue+MUlZDhJxtHdoyZT3G0G9haB4EBnw+k9rVkkQMryGnfpo8HPe4Ox
         SDANvdtvshTVEvWjTvnnMUO/KwbamYjZdbF2NcMU+xV57yERnmmD3awKjL97MiJJCKgO
         1cXAc5gttiWjon7V99OTykK5SJUJf+ZWO5m1M+Hkv4cy0DLkCcvy7ON6Nm9oGvc1tZ+1
         +MQD0BjkjpWBmVcwHV03CScNX4Cpv9WXCOJbBhQHOqrWi7qKNMEvmz1RhGIn5TU6YdW5
         8NsM6aN+ZDNgx2yjDHJ9Nt4f8Vw+hCs1rNU6UzQLO43d+FLiXKzeQ1XjbCFTF/YNI1bx
         N+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494732; x=1791099532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6b0gf1HYtLKFke/fEYzMHCoVYjMKyNvdGkgCDilbmEA=;
        b=vEDh2DlI4xwB9P7geH/hd07n7Cjl4mi87xDUzVXTqzpKuo8tnx7nVtBdl9/QANSURW
         EV7Q1LjLcw+L+tk+uoxEsIyUynHArUDhKCm8AMFnmsvyW6mvVPxk8Rbuq42JT5SzEx2e
         GNwbE2IZL/NJO9Z9RY0EHTqPbd9I65QKyFRBRz37GITLeO7urL+rIIvAQ0j09OuYeiji
         rLwuINLXkCK1NYrE4zrdzhJVyaiPpZqssWE++fRfMMBA++skvBdJoepVXwfzo6Zn2jge
         qiUZRzclucBBpeEvDJb3EwecsO/aDgPeB57gpg7Ce7lZmA4XZFJ38MmxMXi2xY/3o3CI
         PtmA==
X-Forwarded-Encrypted: i=1; AKwUvBzR8cyUvbIUj2cHzCrygI4reypjVPj8nqyWzXsohyyCubtO4ld6Viy/ByLvSVehTZllqZ8U9ObNIivDtG6xmYFE@lists.infradead.org
X-Gm-Message-State: AFuF++luJFt70UYj4BGbtywf5cKu4ARYyLQBai+tzSH7lMdbkAZftUad
	uT+7pOOZM9hJL5OSJYSbG+8Cq2Uz6OJGHOXQE/Hb508IP6gVPpqWNXb7
X-Gm-Gg: AYBFou0XuO28biN5Cplvj2mwIvontC5sJGb+CjyC5yFRorm3eFqBdXFLmUpaKEiC4rk
	23V8WKKObGN5mX6c0nGbAwr+wCm4IuRI6mm6vm5bSVjGNpgCJWszI50AYK8u3T79XjY2v3USN9c
	4jWVT2Jy3a8VevTWy+2+tO2WoqWfngtLWYzKenpLdGDodwDMsPFF+fZoIyyIpQL7UBhgEExT5ME
	9wubb0HMdXbWdfeDnM2tQ28mDmm8YRE7/tMxjj22M+vb4Fw4/scVzxMBOPVB6+BkkzxQiZfN3Mb
	qYVOcaPeCTw/vTZrGUKgxlOPbKYmvIPi3Is58UHgUFGwjY70QfqrCb9uPxhL67ebKPMdp/Q2X4s
	ULr0DS8jTgC7aVJuzvAtqPWnM4xo8hchCq3DxXdID83Xw0SlZgcYLaqoGrU4cOl2DorSDgCVwie
	xltHhJcDX7Oa/H4jbI3I/uj1u1lbAJJBsLfNtNbnPukPHETPZiyFNV5bGYuXsxTdKk2rEsxUvQ7
	1h6YwpiAMX2wyZ0KmYcUo0PT0d3lpbgSuRMUXlcQcQJAZ+digw=
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr25725455e9.9.1790494731620;
        Sun, 27 Sep 2026 00:38:51 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm17210652f8f.16.2026.09.27.00.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:38:51 -0700 (PDT)
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
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 2/2] net: axienet: add a MODULE_ALIAS for platform instantiation
Date: Sun, 27 Sep 2026 10:38:43 +0300
Message-ID: <20260927073843.346910-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260927073843.346910-1-maimon.sagi@gmail.com>
References: <20260927073843.346910-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_003853_949688_1B383142 
X-CRM114-Status: GOOD (  19.49  )
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
index cfef8ad75909..ff1837103553 100644
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


