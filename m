Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA81CF34AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hp0UfG7QOKCvZuMIBFq30GFWWtwB3VYwKuKxJdo7x0s=; b=awvdHQZYuVhXBp7NoGawCEfIYQ
	6zTZl3VmujQXw9OkjYNPAr+xcY6xbfulmhznpEBxHr2u/5OAzOsNUSmRJVkeETcm5ip2MHloF9zWo
	TsEr9gL7XiZZyrMiAX55gjPW0LQngLm6YlZ5vsBoieh2C4FMCZRCfO2s2mirQQ+DXwMVnvY8eiH+e
	zNMrr1nU70vQGTd/cIQy37VHxKCyiIiRLuwr4YA88VuWTezR+JIF4MBmL7Z621al4LXvo2Mer1Pyy
	BDuBu5QzpGY8jfYEZadJA2x+sEGn08ElUd78n14wpssZGs/wPAntIvqmJMBSDyK6ThMnMNW9r0rPC
	oIRJRrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi5m-00000003GqT-2xah;
	Wed, 19 Nov 2025 13:19:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLi5j-00000003Gpm-1oDm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:19:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E679419D4;
	Wed, 19 Nov 2025 13:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D46C2BCB3;
	Wed, 19 Nov 2025 13:19:17 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of/irq: Handle explicit interrupt parent
Date: Wed, 19 Nov 2025 14:19:11 +0100
Message-ID: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_051923_492900_A4FF20B0 
X-CRM114-Status: GOOD (  12.38  )
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

If an interrupt controller is used as a proxy, it may have an
"interrupt-parent" property, but lack "interrupts" and
"interrupts-extended" properties.  In that case, the "interrupt-parent"
property in the interrupt controller node is ignored, causing the
interrupt controller to fail to probe, and leading to system boot
failures or crashes.

Fix this by also considering an explicit "interrupt-parent" property in
the interrupt controller node itself.

Fixes: 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt parent for nodes without interrupts")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/20251118115037.1866871-1-m.szyprowski@samsung.com
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index a68272db9879bedf..f374d8b212b8669c 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
 		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
 		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
 			desc->interrupt_parent = of_irq_find_parent(np);
+		else if (!desc->interrupt_parent)
+			desc->interrupt_parent = of_parse_phandle(np, "interrupt-parent", 0);
 		if (desc->interrupt_parent == np) {
 			of_node_put(desc->interrupt_parent);
 			desc->interrupt_parent = NULL;
-- 
2.43.0


