Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ABEF54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FY7+Kc7Tgm5Rzu5LYlEUz/cWxC04CnVo0qvF6m2rn0=; b=SleAChC35Zx324e/cvc9ioxXe5
	Zapi+n+xJlPnubx9OUhHI6AigC7l6c6KB7QyJ/usHV/391VxYjrwhfe4XkwZ6nisC3fyXuu/IWma8
	fqnwkRB+7eNRQwmrDrf1ApBcU9PSMrbquBroaNUSkR0bNDYgmMh7fNQGWuS5NU3SXbM2oydCPEm5L
	8fAn7YRFnwzPZ0YBvk9GHjnp5VhK3Tj5zGLCPOCDWVQBE2EzYHaJvyWOr8bFIHlPGc4SWVMyfQi8H
	Sup6RnvlmO9CtCz570QnWwWynQXe8IayYo7eZeTeOQYVJL+ZFecNeai+KiMHY55UBfqefr4wMfL4n
	+uh2WjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54To-00000001sa6-2sS4;
	Tue, 24 Mar 2026 16:19:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Th-00000001sXW-3wpO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC28343EB9;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2D5C2BC87;
	Tue, 24 Mar 2026 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774369176;
	bh=U0PWUj5062qmvlDAU2epmm8GpkD59Wxm5HsjIIPSxV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uvA1HOhIBtBO7Yv650j/0h/keBcN/53WmUpxl1IbKtHIEr87KOQqE1D/qrJ2mxaeE
	 3lnezfXcpXRvflK+pQaH6MGxhmrxcdI7lX4Mv5GVBJItwETf24VvK+hkI4WK6W9e70
	 T6i7Ao0QzIvk/udX0vy27OxoH5KgdUJJHXskswL9bsB70E34/1Li09efTCJxQL1LnG
	 vYI3s16rtCau89257hZBOlxkeYE1Y/ex5rFsyLy1YnwKfKnj1qbSOBa01qcNkTdU5O
	 eIdxU730QjKiCI3s1G4YYf+dRpildUV8tGPY6Nss8TiwOoK/FHILC+PfuHrorFZXXQ
	 MhtEFUtB/ldCw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0ACB05F941; Wed, 25 Mar 2026 00:19:33 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: allwinner: sun50i-h6: add UART DMA channels
Date: Wed, 25 Mar 2026 00:19:29 +0800
Message-ID: <20260324161930.1602083-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324161930.1602083-1-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_091938_009182_2A3A3745 
X-CRM114-Status: GOOD (  10.72  )
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

All the UARTs support DMA and are hooked up to the DMA controller.

Add the DMA channels for the UARTs

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 73e8604315c5..72ce1a75647b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -540,6 +540,8 @@ uart0: serial@5000000 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART0>;
 			resets = <&ccu RST_BUS_UART0>;
+			dmas = <&dma 14>, <&dma 14>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -551,6 +553,8 @@ uart1: serial@5000400 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART1>;
 			resets = <&ccu RST_BUS_UART1>;
+			dmas = <&dma 15>, <&dma 15>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -562,6 +566,8 @@ uart2: serial@5000800 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART2>;
 			resets = <&ccu RST_BUS_UART2>;
+			dmas = <&dma 16>, <&dma 16>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -573,6 +579,8 @@ uart3: serial@5000c00 {
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART3>;
 			resets = <&ccu RST_BUS_UART3>;
+			dmas = <&dma 17>, <&dma 17>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.47.3


