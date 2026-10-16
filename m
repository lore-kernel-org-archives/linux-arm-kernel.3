Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5275CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFBrAtmcn9VtZg6Tc4SlogA5940OYVtbkSv6X+LwxEY=; b=PoNr/aQ7VcmN3ROHXLEyU6wB8I
	HqRBeNCiv10LlPZTgky1hjyy52wVYFjA2ShAl0mUXpu4gXG01Wj0RPq8XpFrfQcRRjhecNzdy8daE
	sRgOY32wtIc0WHtMCoUNEaNTrkm3OscE3DgnQaUylThmXjEy24+w7xhgmv590pi8CRkvi7Qb5Of/E
	7jeHl/HvsWT+g9pKtAR6CJxebWgzy6DpWBey2m+XC4PA21QiB+vqBXpMx5ZPdTPYUmDsFxqnKKz8u
	hu7t48HsMwSLli3fs9TPhfldf159ipCTz2dO0Eq1ZOy9x+AhbdJvw4GXIqvpepShw7NvE80e/2gAv
	hnt16+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfLg-00000002fc8-0am7;
	Fri, 16 Oct 2026 10:39:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfLe-00000002fb2-1Pse;
	Fri, 16 Oct 2026 10:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mFBrAtmcn9VtZg6Tc4SlogA5940OYVtbkSv6X+LwxEY=; b=AQYKkz0UpsxVJPjnE03UFpDOdT
	Ts5/zownrfvQBCvmx5yb0E4SaY/P2PyDzyknjwatHNoKID6SKHSvoS15NSezOi8V6YsU8PyNA8OQc
	5aLzecrshbxLEgj72lXZdOTRBwa3szSu2HUE7JHH8x/1tji8T1/5kQtp1ZcjwZAcHs8h9RmUgloXz
	YXUSH1nocRXdTr9/HlPMyBH2irZj+0nWqmRiWUfGZsdKjyekJnoww0LP+IOeHqhgzaCc/l25s3Dw9
	xR/hJqwSAOtodMbjydF5HiU03Od2asVvB8vlNuo86U77uBQLIaOpfkDXlkyrc9lKtafpckf7H4VeC
	Q2fQuYeA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfLZ-00000001OW1-0Vjx;
	Fri, 16 Oct 2026 10:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792147173; x=1823683173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1m8TfpAordahvGweBMHxBLczxZN/hAYq4RiqsECh8pg=;
  b=Yj0oLYREWfkWvbps7j7at3RzZvM/nkWi2l3yMvqVum6ZDUpcFHbwreT3
   ZXdYhuV8HvgJXbR95i1C64fj2StR1GH535FsMMbZrDjP5K+y5c9QLnqze
   ecdchl+X905y2BRe9nDOYbc0H/qyMGQM3mfJ+Qje8oSq1cqPNhPJCOYMQ
   2oUZyuWdMx/hflPmB6iglYgcyWHd965kJsvrMJ3Mu8p/KFCrHPZlh+6uY
   mXLa09m6w7iVFvdNWxd2RuprUhjJbem9UX/zuvFVcydjV7w/kJzZ/PbG8
   SxZ/3NYiwrRwrWekiAuux/0HUTW8p5rNyRhRYVPebBhZtAv+uspq/8Phc
   w==;
X-CSE-ConnectionGUID: ZuX1AaxIT82Eu3ye1DUdUQ==
X-CSE-MsgGUID: lGZ1v2CjQb2vxMNkPFhVsg==
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="65140395"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2026 03:39:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Oct 2026 03:39:26 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Oct 2026 03:39:17 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v9 3/8] nvmem: core: take a reference on dev.of_node in nvmem_register()
Date: Fri, 16 Oct 2026 16:08:31 +0530
Message-ID: <d86398370f0593e4fdcfd60c4678563df995404e.1792145382.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_113933_753051_2EEC1936 
X-CRM114-Status: GOOD (  11.23  )
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

nvmem_register() stores config->of_node (or config->dev->of_node)
into nvmem->dev.of_node without taking its own reference. Callers
that get the node via of_get_compatible_child() etc. and drop their
reference right after registering leave nvmem->dev.of_node backed by
no reference at all.

Take an of_node_get() when assigning nvmem->dev.of_node and release
it in nvmem_release(). Existing callers that hold their own get/put
pair around the registration call need no changes, since get/put on
a device_node is per-holder and independent of core now also holding
one.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/nvmem/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..98192597b935 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -541,6 +541,7 @@ static void nvmem_release(struct device *dev)
 
 	ida_free(&nvmem_ida, nvmem->id);
 	gpiod_put(nvmem->wp_gpio);
+	of_node_put(nvmem->dev.of_node);
 	kfree(nvmem->ops);
 	kfree(nvmem);
 }
@@ -950,9 +951,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
 	if (config->of_node)
-		nvmem->dev.of_node = config->of_node;
+		nvmem->dev.of_node = of_node_get(config->of_node);
 	else
-		nvmem->dev.of_node = config->dev->of_node;
+		nvmem->dev.of_node = of_node_get(config->dev->of_node);
 
 	switch (config->id) {
 	case NVMEM_DEVID_NONE:
-- 
2.43.0


