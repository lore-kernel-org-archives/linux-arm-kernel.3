Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853EEE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEcBR6l6UHxeka28jkp0UZiIrR1TObruGMZ44Ym9TOY=; b=lN/sjRxvGk0A0n22lT1/myB9mL
	La2QjfgJczsQ7idqLcxE/+E9mzENOP1j01QCVWYkYqUpfX0eE+Ur0Sz04W6AlbCZtfQ2mrClz0A02
	emYVlHOFOChQNeGJ5A+LetsJfoj6YX8hjwfDI3LLoqkWePfE/mIJUfFLm6SYbJNCYXwQ83deGM982
	3hJYrCn1B3ojTFpI5ZGaHTLcgcNkAZdOX2p9nsAnqkX/8Kndcm7d7kFNF8nArPhnfo7TztX9xoZ9X
	FL4tm0QxAIFr3NxYmMMsVQNrnzxDxgx8n/QpTH2kfh4JEVOC+X5335iyvgV34Xl5ezkzl82fJTpUI
	RSD6nlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCXX-00000000Yjv-16WQ;
	Fri, 27 Dec 2024 15:46:15 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCU4-00000000YCq-2e7F;
	Fri, 27 Dec 2024 15:42:42 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735314159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEcBR6l6UHxeka28jkp0UZiIrR1TObruGMZ44Ym9TOY=;
	b=Hzek+HOkJN6awql/zr3rwIK5vauxfOdCwUiq71REymTIdas9uTUCZv/nQC4fKvoMBc3ksC
	oYmBuEnqv/ZbPK6irBg1nux6LBzfxruPknzCMTNaMq9JiRYE3xwbCLncqFNbW1jjJbSj+r
	2xfITBVgS/gU5DxjRN4gjTQWOk2ECd1fr0rZxPy7b68irXuH8iUCgJHCTQKNqbW4O/EJzH
	CUjcEC/44EZAoLOGqsX2ZfZDX92E8ELjdqxpkVymD77NXLRm2ihVXTaVldSeJCFuDsgm5F
	cf48A1+f2/iBZKLelZ6SBckIkakAPu393tiz7l4ASqoLz1NwkBykgDpPS5UzaQ==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	maz@kernel.org,
	tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 2/2] irqchip/gic-v3-its: Make "dma-noncoherent" preferred for RK358x errata
Date: Fri, 27 Dec 2024 16:42:24 +0100
Message-Id: <1382cd99ec213b5fb6f3b23d4e895f078f587b8f.1735313870.git.dsimic@manjaro.org>
In-Reply-To: <cover.1735313870.git.dsimic@manjaro.org>
References: <cover.1735313870.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_074240_820221_316896EA 
X-CRM114-Status: UNSURE (   9.22  )
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

The preferred way to denote hardware with non-coherent DMA is to use the
"dma-noncoherent" DT property, [1] instead of relying on the compatibles. [2]
Alas, older versions of the Rockchip RK3588 and RK3588S SoC dts(i) files
failed to specify this DT property, which means that checking the compatibles
remains required for backward SoC dts(i) compatibility.

Let's have the Rockchip 3588001 hardware errata handled the preferred way,
with newer versions of the Rockchip RK3588, RK3588S and RK3582 SoC dts(i)
files that properly specify the "dma-noncoherent" DT properties at both the
GIC redistributor and the GIC ITS levels, while falling back to checking the
compatibles for backward RK3588 and RK3588S SoC dts(i) compatibility.

[1] Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
[2] https://lore.kernel.org/linux-rockchip/86msgoozqa.wl-maz@kernel.org/

Cc: Marc Zyngier <maz@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/irqchip/irq-gic-v3-its.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index fdec478ba5e7..982dcbb30f39 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4747,6 +4747,18 @@ static bool __maybe_unused its_enable_rk3588001(void *data)
 {
 	struct its_node *its = data;
 
+	/*
+	 * The preferred way to denote hardware with non-coherent DMA is to use
+	 * the "dma-noncoherent" DT property, which the older RK3588 SoC dts(i)
+	 * files failed to specify, relying on the compatibles instead.
+	 *
+	 * Thus, check for the presence of "dma-noncoherent" DT property first,
+	 * to let the hardware quirk be handled the preferred way, and fall back
+	 * to checking the compatibles for backward dts(i) compatibility.
+	 */
+	if (!of_dma_is_coherent(to_of_node(its->fwnode_handle)))
+		return false;
+
 	if (!of_machine_is_compatible("rockchip,rk3588") &&
 	    !of_machine_is_compatible("rockchip,rk3588s"))
 		return false;

