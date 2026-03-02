Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDF6EA4E23
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljta+m8Hc88D3VPTkEDyBjEDNIW1wMTkbXlf1BJqEbw=; b=XbRPGvu8ZS676i29pdMPJpLBot
	yJh2kT/8wdIhFfj+XpZkEms4McDt7cX+bbdk29hefW/tzB8nbmY6U6giur/Tx01Rx52DuVsADzL5W
	fGGmCeV61pJfC34d1XUv5ar9bxMyk8L9wl+Sos6WmzgzvojOIhH+fY/RofH5IaSYhBTx1caOA6Bfn
	TdozeI1BmddUTXellie6xXkgpVM62Ay5dFZ5KWLuMw6btxZyO7IMQ+3Uk31zQCspFvapf1EE5iNjm
	mVkQ8A1J7VuGfR3ov6VsCD5uRQNjVsbDIoAx/8QRQRcvP+X3OkKE1b1iRCSJBsvgxp6nibY4QMYfL
	+nYHFIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BN-0000000DMTM-0sCL;
	Mon, 02 Mar 2026 15:27:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BK-0000000DMRX-3bih
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27BA9443D4;
	Mon,  2 Mar 2026 15:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC92FC2BCB2;
	Mon,  2 Mar 2026 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465258;
	bh=Nu//A3zrzFksC/EsXtTpm79XAbNP4DoF4asm4g2YQsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGY6ISHqP6autGvIwrh7lC5dnJWsyvVOBrkvvf0trB234KIUoQkc+WUp1EfNuWSMg
	 IJHuinmmrVPGXvZzZSRb/pGFAFYuX2UqCQW7PTRxhLcBpgcHmG4QCgnhutdmXqk2Kd
	 WCmfwP0BoNYeyevSx6qdiMP0BVrnUS2sTUUqM9/vJqCTrx6zgdX6up5WDAyBD4kM4N
	 Pi7E82dWhWMP31xBvBPfpZjiR8RLkNBHCtoll1FSpmdLxW0PSweEzPXytRMrVO9J2z
	 Zlku90JotkkwB/euR4ntsuRioDwBQ7wnYgfqYGFRftgyacB8gI4PCemMaBFhTT6kR4
	 NI0ObqHXS39xA==
Received: by wens.tw (Postfix, from userid 1000)
	id 432445F95F; Mon, 02 Mar 2026 23:27:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
Date: Mon,  2 Mar 2026 23:27:20 +0800
Message-ID: <20260302152724.3197587-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302152724.3197587-1-wens@kernel.org>
References: <20260302152724.3197587-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_072738_918001_6E7029B3 
X-CRM114-Status: UNSURE (   9.99  )
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

The Allwinner A523 SoC family features an identical LED controller as
found on the A100.

Add a SoC-specific compatible for it, with fallback to the A100 one.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
index 760cb336dccb..0b73fe5b662f 100644
--- a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-ledc
               - allwinner,sun50i-r329-ledc
+              - allwinner,sun55i-a523-ledc
           - const: allwinner,sun50i-a100-ledc
 
   reg:
-- 
2.47.3


