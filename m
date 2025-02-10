Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F56C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=494rfdwwd6IBY7XfNPGyhs9jzJ
	FVWEM06D7VyIRwFW9/bxCSdjT5APEHN1GvaoKrj0cGqdnNfYBBYDlICAxjp723+EcylX8O47kA+Da
	UohzWjOhhqn1WZGe1yO2EQj1ZU7npiTAM467nb+d9deUATzz3NRieXE9/2RxljA9RvzRomLcT+/Pg
	5R+yfjJAkm40zSxH1r9KVDbDPzW7V3AX/tSD1iCWJWUC8tv4u2RmRDdZeXpiERVzBPQWPKjur8XLe
	5kJeRHz9FEFGtYn2oFsSXUofhY3BD2+V8/4N2SQRnc9GtS/QcxT5yBQFAe+R4GmAzBKqA3LBO+E+U
	Xtb+FvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcrh-00000001mon-0IDG;
	Mon, 10 Feb 2025 23:06:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWy-00000001iXL-0vRk;
	Mon, 10 Feb 2025 22:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=b7ALNXLpwCSlYsXtGBFNnXMX0E
	q7z5Hf4pGiAFURPj10BXnr8171Tx+UerRtsIigJ6JcPhrBeKA90QkOCU+tCnHweFr4FZifYIxfgTt
	TbAuoeTbXeIU4lypLO3In2xNZsPBaKOv5e6zdwt6HBQipbvvICjIMLYfiBVSCtNeApfDXuW4rZ3b1
	8sO8n3Akw1gocUEiTezioCU+H5aNuc1ILqwazYxxAVQB7nitvo3nJkJVD6PBfF5WXk4izpnUtqEVF
	fnUjp5chTRzExoQodtFXa2L7m3zfffN94L+Pr+G2VY5+9LSDvpbXqfbjUKvZZ9sUV7U0WU79dPzWP
	tBHFbqpQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWq-00000000L3P-1vdI;
	Mon, 10 Feb 2025 22:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=OGU+K4gXc4OYnHKaCeOf6ysMgf
	Q87X0X2NqmHUBWPIFyTVk7vRZ0/bvMO9BvnRqUku4PeXIKWB9R5w/GotaxosFd1ALBlHvXPUdLt3K
	yhfYkUokK311vI0MWiS9f2TMnOE5KRrjgJTP0ez2np1cxuzQqruU1Ufvd1WGubRT4qQX3iqv4chTo
	x//pfL+BrW41oQLCLtNU9sXTybqAeGSrutZlikkfKgAGVMQdHGGC10Bjtjf86x6FSI4F7Y+c7AfyU
	x1qaDdMErFccNXBcxzQxEhtehsPXTY+O5VPrKN8SQqwrHqMIOGplHEr5wQmNZSG9q4V8sz17ePWwg
	0PYVYFiw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWp-0008Re-TU; Mon, 10 Feb 2025 23:45:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH RESEND v2 3/6] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
Date: Mon, 10 Feb 2025 23:45:07 +0100
Message-ID: <20250210224510.1194963-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224524_538462_F1C720FF 
X-CRM114-Status: GOOD (  10.35  )
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

The clocks property correctly declares minItems and maxItems for its
variants, but clock-names does not. Both properties are always used
together, so should declare the same limits.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..3201ff8f9334 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -62,6 +62,8 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          maxItems: 3
         resets:
           maxItems: 1
         reset-names:
@@ -78,6 +80,8 @@ allOf:
       properties:
         clocks:
           minItems: 4
+        clock-names:
+          minItems: 4
         resets:
           minItems: 3
         reset-names:
-- 
2.47.2


