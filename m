Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB2FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsmY4hMcFsJpcYAN9QZ6o9kXVqrF0S21vy1h71KURM4=; b=H+T1Q73WkhE+XXZIEaBykb40rd
	NuD7MGpYzMvg+wg5ln2N7UoZG7CpiQqMbtbA6vg2O2PQQnN9pfp4EclJuMkxXhLw+Xlxmwxx3oLz3
	S0oiK9a75kTd8CQYtza5k/XCiJudcIPdtPzwJRbB2ElicRFuWqUxdez/+8szc24Kj9OhJ3Z1KsU/x
	8qs5bp80gFjYeBYfwhYoY3S/elwpYXMXZhAILbNztROqrlU+nf5hOYcsy+qEX3ZNJuGakiegBhPcV
	/yjXcLxNXLwr/EgJSm41jAwkuHkf7TuCJRrxefjV/8IJRKxD9YsxL/ApGsusNVJ15jG03vqZqU8Sg
	1Zz87w1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kro-00000007zT0-0g6z;
	Fri, 17 Oct 2025 13:51:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9krk-00000007zRa-3sf7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DB01442A6;
	Fri, 17 Oct 2025 13:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23288C4CEF9;
	Fri, 17 Oct 2025 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760709092;
	bh=6myU0+1onkLfNmV3H8649E5ZMb5R2wUxNQQxI69BaDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKwdSTyL9aA6LVmPqqXt9W2DnIBqluHMaZXaqS9Hh43UXXecbkyISZp3rfb6cIgGn
	 T3FiUOTLh3eMaQVHT7nm/nLyzBtDGTVYl3SmCHvx6Q46OpR2cI6X1i3pLegjr0Kykp
	 pEJDqkkBiAKrXAbjQrIkRkVAPUySaJicVNf7nCw7urVxEMZg9tpLX67rIJLN0PzW33
	 iPKlx2bnVUA/KlxAy2PbKgXdnnu8U6t3zFXUaFChTowmJ7Ph+Sh6K2ybQ0CJ/p6dIv
	 6inc9LK3lqYUQ2Pj96Zfi1BErZJXJZKh1HjWm6fdkp2DwDzHz//hLIRqAJhelZYCao
	 IeGNkmzFpSuVg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
Date: Fri, 17 Oct 2025 15:50:44 +0200
Message-ID: <20251017135116.548236-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017135116.548236-1-mwalle@kernel.org>
References: <20251017135116.548236-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_065132_982104_529F4EB0 
X-CRM114-Status: UNSURE (   8.08  )
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

Add devicetree bindings for the AM67 based Kontron SMARC-sAM67
module.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 0105dcda6e04..2e15029dbc67 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -194,6 +194,7 @@ properties:
         items:
           - enum:
               - beagle,am67a-beagley-ai
+              - kontron,sa67             # Kontron SMARC-sAM67 board
               - ti,j722s-evm
           - const: ti,j722s
 
-- 
2.47.3


