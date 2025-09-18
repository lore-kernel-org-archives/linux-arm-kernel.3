Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548F6CAC5A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVU5tGHmqG4x9iEcm9yxe9Fmkvi5HlHhHBrkCZ7w1SQ=; b=SgrDGkQc4ZoacSAoeRYGNSG3Sy
	c+sVGFvMejxxKLx660gP53HAH4sfLuNlkN+NKMn13yKEwWgzOPfSWRiTbY6nAR0JUe1IUINg10TZK
	hzk3XsPjePsbE7gJKuNIjqlcfj2MIfs5fZOZJnlBW6WUbZ415YUHJvTCsMQjYq7LZVcGPi+3Jsj89
	xm1Hk7YB3xKpq9a6ECl5XzaVGSgSb9Synpc3EqsCLWHg+R4QKwhy1S7XqbHylHF4HiPB7gIOGEFWT
	IVYQfkykaOKnyh2zD7fmIuNm12aNGIXoi9W/636tS6NXCmwtyeexQnich6ZBnj9ZkQtkFmvvhl5jQ
	eH+VyCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzB0l-0000000GtDs-40qJ;
	Thu, 18 Sep 2025 09:33:07 +0000
Received: from mail1.nippynetworks.com ([91.220.24.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzB0g-0000000Gt9V-34kO;
	Thu, 18 Sep 2025 09:33:03 +0000
Received: from grunt.nippynetworks.lan (unknown [94.228.36.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lists@wildgooses.com)
	by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4cS9RJ4jR4zkd2x;
	Thu, 18 Sep 2025 10:33:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
	s=dkim; t=1758187980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PVU5tGHmqG4x9iEcm9yxe9Fmkvi5HlHhHBrkCZ7w1SQ=;
	b=klIMJ9qLJs52WqW0Fi9hfKFB/aHJfZRnLeN/UBB8NfrpEbu610iFaYqdFpgpqXtnF1QTp6
	YVKHv1maBMPStFALL3IvsMBh1QEosSzwUfxrOy7/YJlkn1ov3CAAO4jI5nDQbCifUt9351
	TN2V/TjbwHAcg0eT+5+PdCMRvFvfTX4=
From: Ed Wildgoose <lists@wildgooses.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ed Wildgoose <lists@wildgooses.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rockchip: dts: Enable UART DMA by adding default dma-names property
Date: Thu, 18 Sep 2025 09:32:46 +0000
Message-ID: <20250918093246.15623-3-lists@wildgooses.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250918093246.15623-1-lists@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250918093246.15623-1-lists@wildgooses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_023302_907229_E77A89FC 
X-CRM114-Status: GOOD (  10.06  )
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

Kernel appears to need a dma-names set for DMA to actually enable. Set a
default dma-names property for all UARTs defined in the board
definition: rk3566-radxa-zero-3.dtsi

This is tested on a Radxa Zero 3W (which has 5x UARTs) and removes the
warnings and enables DMA on this platform

Signed-off-by: Ed Wildgoose <lists@wildgooses.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
index e644bfc9c..fc26a4a52 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi
@@ -488,21 +488,29 @@ &tsadc {
 	status = "okay";
 };
 
+&uart1 {
+	dma-names = "tx", "rx";
+};
+
 &uart2 {
+	dma-names = "tx", "rx";
 	status = "okay";
 };
 
 &uart4{
+	dma-names = "tx", "rx";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4m1_xfer>;
 };
 
 &uart5 {
+	dma-names = "tx", "rx";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart5m1_xfer>;
 };
 
 &uart9 {
+	dma-names = "tx", "rx";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart9m1_xfer>;
 };
-- 
2.49.0


