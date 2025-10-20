Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38141CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BAHlA1S+8ohXIryRWQBG42cPVTS0nNUw7iiTjZgF2U=; b=mYCLWEgEq/vahZXsjomw35vu9n
	zunnhwGKH/fsunjBqtjPxTNXV2lszbimJK4zBgHrN1Zb/ujDkChGJHF63xFpBdec7qd4EF+yEe7hQ
	E3U3NT2YH/SsPKDNS0qxXzIn0epdIjtdSbGgSG1sbiTrIgvMoybQgtzeGEIsQwbOzPaNy8l/GfTHN
	j0rvU/Ic+YXwClGay9dQI9bvzH+1eWFz6C/VTulSsskMlHG20lw7lQTIvfLbjRm6QXCGjmzjAdrsY
	sUZ0UkfYvYdoPfqa/hEIzEWTcZl6dzFdR/H6i3fkGNgyZBGx75+YWUNqhaiCBmznfzQxQ6EoTPKEg
	yGO4SrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ6-0000000EQqn-2F8q;
	Mon, 20 Oct 2025 17:11:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtQ5-0000000EQp1-0CZM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5BAHlA1S+8ohXIryRWQBG42cPVTS0nNUw7iiTjZgF2U=; b=f9AboOYJPHJDiBNSM9hyio1/xQ
	QIK+mInysQRkfn/onPafpxp8kFpmYQSV4NOAEzjxB2C67oTz4RneWWTXuNJF6jlABoEH+HSq1jvBy
	/jLUn1BKtZGb9ZOCeeAAs5AKDOgu0kc3QA6B3NEIpPMg7AGLoytcIaxSQsgK7zaXj4k9AnT6iMhbA
	JTvzaL/JxLbyo49ISruYw176m1yieWxJZTo6M6cFBtCAp5tjY9DdaJr8u0+ZAzFPxmnc3DZs6XlhK
	j9UDIRDq/5K0nkxrmQz9ZMst+Cf7arX0sjdFcikMnc8RddIRgfvvXlJ5kiCDRWBwqTzzYKUUIXlrg
	OQAU3Tyg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYL-0000000025K-3Y3o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA1D848DEA;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B660C19423;
	Mon, 20 Oct 2025 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980280;
	bh=YIPTcjtisaZ5yPU39cB2poEgXiC9oxSbvqACMF7guZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2j2ylcRsPrmU7y/m750/X9+1N5xr2bBqx9A+QSEXxwY+9gtT7A7NnP65B/pv7Gn2
	 u32eHV6WYAZBxdpfKfLs35SfOdk3Wv9F8TsqxGm9fH+BLPjt+p1s5DsWYNAgGV0oA9
	 H/pbvK/CWheUeHx85405QQn3q74qyJnxQ53LmlTERDER2xQPN8QL+gwM02SYpOGo7o
	 qejrhZmMP2FvP/q1BoHm0e8Gl8vcyBeCn1B36empLQOoaTzT3RKdaYIcTj47HG1Qg9
	 xKps1E7fosHAK1eIRSRdvqPkQzp+JGquO8hVdjmbmO6pxwbW90dZBx5kpfTNYW/dYP
	 mQ2aiX9+YFJ4A==
Received: by wens.tw (Postfix, from userid 1000)
	id 2A8285F952; Tue, 21 Oct 2025 01:11:18 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A523
Date: Tue, 21 Oct 2025 01:10:47 +0800
Message-ID: <20251020171059.2786070-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020171059.2786070-1-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171610_106313_9AA7C059 
X-CRM114-Status: GOOD (  15.20  )
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

From: Chen-Yu Tsai <wens@csie.org>

There are two DMA controllers on the A523, one in the main system area
and the other for the MCU. These are the same as the one found on the
A100. The only difference is the DMA endpoint (DRQ) layout.

Since the number of channels and endpoints are described with additional
generic properties, just add new A523-specific compatible strings and
fallback to the A100 one.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
I could probably take this through the soc tree if Vinod gives an ack.

 .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
index 0f2501f72cca..c3e14eb6cfff 100644
--- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
@@ -29,7 +29,10 @@ properties:
           - const: allwinner,sun8i-r40-dma
           - const: allwinner,sun50i-a64-dma
       - items:
-          - const: allwinner,sun50i-h616-dma
+          - enum:
+              - allwinner,sun50i-h616-dma
+              - allwinner,sun55i-a523-dma
+              - allwinner,sun55i-a523-mcu-dma
           - const: allwinner,sun50i-a100-dma
 
   reg:
-- 
2.47.3


