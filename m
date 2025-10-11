Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5C7CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lTFwEmyMqZfLrzMbsAhF9xxGmCF9QY/mmy+KcU1tds=; b=I4yYc8/60LYLIumBdv7cPVfpCz
	pPNl4H4egSM8BEhc7NWNKSRByL/88igXd6Kaqt31jwUC6s4nFXUSrZitGC7TlNVQH+4OQjJi6+jTh
	yNA5Tox6j+8Tgq/4Gtfybfz0JcuM8lQOtd112EKGJ2MgIUss0L3zWqa6xmaH/mo2in5GlEmOhuedL
	+NdnaN3wvrnKcGPrch12k5Q0fk3BLguoinYTfbGMbWKhRQWIUJMFNWZcJCq5P3RLBd89gNvwixNcP
	LodyI0k1LhkHe1pzN6AzPaX+Kn4SW6lBPem9mzrKU02ukflr0V34vosV4IfG7GcX9NtH98hA0onNx
	P5o112oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0f-0000000ANu7-403P;
	Sat, 11 Oct 2025 17:03:57 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0Y-0000000ANg9-2KNE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:03:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ckVLr4clwz9tFL;
	Sat, 11 Oct 2025 19:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lTFwEmyMqZfLrzMbsAhF9xxGmCF9QY/mmy+KcU1tds=;
	b=wEFa2RqSxLq1GUplgHHoq4Zg9l1PUKxaN39C99mlgEd4GRbYJZiJuPgokp+cukj5+d5Rmi
	TC++YSeafLVg1z4NuDcM9F73zJEUXgFHURWtcDh331SvBmwbEvYaHli7XQf8z2C45KmrdD
	vLN2S554GwAFHFsuPgIldIM7HHlZFOGlP0qgrOK5lbYGIQNGJkG/6HqA8Dzb0vWRkjKEnb
	0a/oKt2otxt4lSJ8KgFa4qUNbQqoimrVf6OLRnyqKjdtFkUu3xx8N6cM8683YErF0xOiFV
	0Dw9tTWf0nsya1QClRZayi4BJxrmSv3rg7ZflskG0Pp328ACHQ2yZgRGABYZug==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lTFwEmyMqZfLrzMbsAhF9xxGmCF9QY/mmy+KcU1tds=;
	b=sus4tuur63uGasunqqpxk8HtosOZgl36j4GqYgK7B4uU4NNLBlRj04m8KEz5t85Px7+ngY
	NZBFl32x1qnYJ0qk73U5qSs+xflHXZion0utHv/OPEdCNjX7OQSJ0JIab7XkXiilW5al4O
	e7o/JZVKUUAga7BvSVjeYVCTlxpWxUj6sYuvvh+mjxzEG4F6mWKxwi5k1iuMDihpev7ipX
	ACNu7HaRM/rRgtWiI6fEO2lFVJVYFyuen6svkaMAHr6/bnFYKkApyp51PNGe0BH9b4Q3zC
	LbQpWn0I/V4Qk4wGjgwJByapF4molwfhAFUAv7dT9tlJ5OSQmh0SYd0KI71tNw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 19/39] drm/imx: dc: ic: Use DT node as interrupt controller name
Date: Sat, 11 Oct 2025 18:51:34 +0200
Message-ID: <20251011170213.128907-20-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ntxg5f1bpf6mw9mdz1dowtge6ameta3e
X-MBO-RS-ID: 7f2e8c7ac7db4f74842
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100350_762870_4B80BA9E 
X-CRM114-Status: UNSURE (   8.74  )
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

The DC on i.MX95 contains multiple interrupt controllers,
use DT node name as interrupt controller name to tell them
apart.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-ic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index f327ef0918766..c3d7e5aa4ae23 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -217,7 +217,8 @@ static int dc_ic_probe(struct platform_device *pdev)
 	}
 	irq_domain_set_pm_device(data->domain, dev);
 
-	ret = irq_alloc_domain_generic_chips(data->domain, 32, 1, "DC",
+	ret = irq_alloc_domain_generic_chips(data->domain, 32, 1,
+					     of_node_full_name(dev->of_node),
 					     handle_level_irq, 0, 0, 0);
 	if (ret) {
 		dev_err(dev, "failed to alloc generic IRQ chips: %d\n", ret);
-- 
2.51.0


