Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519CDE677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=169hA00Pja97h8hm6emVe3dB6p5nrMbDMRco0sdU1HI=; b=pzYtkaWea3D9XQGOOwrX8Bddwp
	juSd8+cUNtOKMne8cMxkxqaesml31cCUa37Y44SBIsKpw21D73wHIK5cbRBOTn+BN+pgoPNpUmE4u
	+ZolQF3q7z2hcCLltsn06AQkv0xNxEN8SdwwMpNmIGM92+q9vnEczknY8qPCIPuiv+4CLO1cIlL+A
	CU+HlM9fwTtwrHGiMc4cw01DSZc8JUXeHw2KQwTn4JyNEWunrMUVZ7vaAEKtcq3fWsQwzfYWCtO2m
	8PcBMEALAGDn/0tcK5LKq2cXGT+gqx+HND4vXGgxELgBIlSvYCF9uoqUIP/xHr5HPnOpsIdB2FbnI
	dG85vnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Cby-00000009cH7-3a34;
	Sat, 02 Nov 2024 11:48:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CVX-00000009bJh-10lJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:41:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a99f9fa66fdso53817566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730547689; x=1731152489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=169hA00Pja97h8hm6emVe3dB6p5nrMbDMRco0sdU1HI=;
        b=g8shm98riLPC73DS0i+fE02cwxqF9YcFltvivAtmjZ2ljA6slO/CycXbWckZxCFbNE
         a/rj/MnjQjdJCAY9ehh3RpBxgxfVr+HtqTdrmiFl2ncZ1QD4HdrHxugjsjB3RzFj7K16
         aWGq2PPtsYPRi/KS9uNICTaRl9TaPHwobPy+cwz9kzuFcyckzV3W78Le7D5iWXo4HSTs
         xysfjRRW13AnwhtD607vl3LYiDfasZ13Pn2+6/rbRNJewOXvAlomjZIGGhBhE/94hO63
         WiGPDsVg9HMNhHcs3dfeVruYZ5n6KppIjFlLi1nbpgTHI5HuVnQVMJhOICfqcAf/LsEr
         pBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730547689; x=1731152489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=169hA00Pja97h8hm6emVe3dB6p5nrMbDMRco0sdU1HI=;
        b=eDlFU/pM80SC7KcvXeX3lT4J5SafUbt8bopWl1tsvvGCekEN9tlvlBy0Hj6aeq3WkW
         W+E6A7eaXpVqC+u6/7wwyM1NsZoWqF9uNZ+NVujzOHw9q10rRO7o56fod/aP9+QV1nka
         YxQVmOlAzfC0CxNCGLGVR7340em6cKLk8XKW1XX5lYaTWU1Y/z/Q1CP5IS5I5mGhmAYI
         u4VoDnPPvfis5RxegI/0YNKRyuDmySI0lN5B+SqBg6DZlMFKSzfnptP6Ythssu8kWaGC
         fjAL4QyFizJ54eqhZlcExvnn+J70G7waqI+7W0IoMbwYuJ1b4I9fZKqmuViiqShIWPjm
         Nndw==
X-Forwarded-Encrypted: i=1; AJvYcCU6mp0eC74Uvynpsuv2QldmkV7qP/pawx6SvSMuVkBVmvNTd8Nts14jsv/gr17uBpToVgX+mmSEdmLr415Xia0L@lists.infradead.org
X-Gm-Message-State: AOJu0YwB3UnTOygbRA9d+lIc0j1V2ZjjpBjiXHJtKIdD29cP3hukTo7F
	jxCzEAayEejPhlAjswydOLo8NSfnDohj2oL80g//sU8L0buzvVGJSbuslFvN
X-Google-Smtp-Source: AGHT+IEt4AjndCEebm/9RILvfW4GXYybZJT+5m7LenNVoAJdiLHQQZg3Dh2A1hqqQqIhTQOPSDbaYQ==
X-Received: by 2002:a05:6402:34c9:b0:5ce:cfed:624 with SMTP id 4fb4d7f45d1cf-5cecfed3330mr136549a12.0.1730547689088;
        Sat, 02 Nov 2024 04:41:29 -0700 (PDT)
Received: from 1bb4c87f881f.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceb11a7aaasm2224918a12.83.2024.11.02.04.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:41:28 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	kuba@kernel.org
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peppe.cavallaro@st.com,
	devicetree@vger.kernel.org,
	l.rubusch@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] net: stmmac: add support for dwmac 3.72a
Date: Sat,  2 Nov 2024 11:41:21 +0000
Message-Id: <20241102114122.4631-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241102114122.4631-1-l.rubusch@gmail.com>
References: <20241102114122.4631-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_044131_303093_DA6F5A62 
X-CRM114-Status: GOOD (  13.29  )
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

The dwmac 3.72a is an ip version that can be found on Intel/Altera Arria10
SoCs. Going by the hardware features "snps,multicast-filter-bins" and
"snps,perfect-filter-entries" shall be supported. Thus add a
compatibility flag, and extend coverage of the driver for the 3.72a.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index 598eff926..b9218c07e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -56,6 +56,7 @@ static const struct of_device_id dwmac_generic_match[] = {
 	{ .compatible = "snps,dwmac-3.610"},
 	{ .compatible = "snps,dwmac-3.70a"},
 	{ .compatible = "snps,dwmac-3.710"},
+	{ .compatible = "snps,dwmac-3.72a"},
 	{ .compatible = "snps,dwmac-4.00"},
 	{ .compatible = "snps,dwmac-4.10a"},
 	{ .compatible = "snps,dwmac"},
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 54797edc9..e7e2d6c20 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -522,6 +522,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (of_device_is_compatible(np, "st,spear600-gmac") ||
 		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
 		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
+		of_device_is_compatible(np, "snps,dwmac-3.72a") ||
 		of_device_is_compatible(np, "snps,dwmac")) {
 		/* Note that the max-frame-size parameter as defined in the
 		 * ePAPR v1.1 spec is defined as max-frame-size, it's
-- 
2.39.2


