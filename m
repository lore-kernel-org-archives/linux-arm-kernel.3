Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCD3CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMPrUUfRKXturU87RCqJl0CyJvvG1IcefsCFZ2qoDMo=; b=yeQf/1BURea0KwdtoV6/65bSdt
	X2HitI5LKwlevKcEjU4qgbqq9ObYL1P2PshABEJ9QF0+nfzxzECDKM9RqBD41L6AotGlMuZecmkFw
	ytmq4+GbMzLOoBgcrhJeo0Iz4xXYLehQ1lhvCBMpoS99PWFk0TFqwnI3BIwBSRvDpRhD5t4poO+85
	/n1WpKiK8HlQih1ooc4oHYRMZDJH4kd+j/t7yqVMzI7Dedzixt/XRhx//j3GnBVae5/ykI2YrkgaO
	qCPt6xhkYNZYORTWPHxvHflpkTiKhEieCMGSNk1IxoxaUT+ZIg2R+fc3igWVnvwtrX3MuroDrniL9
	Y0sffPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmf-0000000Dx2E-03tT;
	Mon, 27 Oct 2025 12:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmY-0000000Dwy9-1tMy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SMPrUUfRKXturU87RCqJl0CyJvvG1IcefsCFZ2qoDMo=; b=Ls1bf9xQsvoADBbgEoXnvodj/q
	mqMz+flES4M48EmqK6fqKIkRnvpzbAsDkZ+AO+XAY/d4aF5E3DhIp6Avw+VW+AakL7m8YlEYaLhQS
	e+PTqo3xhQW2NDXlRdKbf+VDLbtDxaTmSVzwClvTMoLQAH6sAc7fsD1RCj3jdBXZhlNVAQSSskiyI
	J6Vpl5TOMPitWJNFkuh4jjxSBzlTmGjfC2S83yfWDUmsz08+SCg6XaEQEVNDMw/zzDcKsH0M+8onE
	M90UReWZBNWaXOHEXwttcJfVcWB153eFSH/PS1y+MeiR5YsKE+LJvF7asiWOudZKdRWsTv0sjG4xn
	9lpmqSLg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLul-0000000270Q-17CS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF260452C2;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDA8C4CEFF;
	Mon, 27 Oct 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569819;
	bh=fHOStHU8iPV24HUnkdIweLHy8WakycAIf7e5q0yhXig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oxxn+ju1l1rZrihiBgso9u9BBjSAS/FhnaJRzZdarxEuKtSpRtSf5fqjjOwMBbivl
	 NI9k+q3LmooVQs9qeRPxH8wcIKn0UodDzTuDdwdVmBw/bS9qVuDbnW/knnCpPB0gQB
	 jiaQaV7yxOpf0ZN2//uUpAAVFI/089gonDn85pLiRkEGehvBcqhNRKBSpt2yKDUFZg
	 OotIs24M7QPN+q+r3e448MpqaJAE4xmEZJroe62ZLaLRSUtt0y/rMr4VGyGv2Gu8w3
	 Ac59jKopBQ5ui77x9xnBdyuS6bNDte0R8wAcodmw+d6eejMpcVJ1eWgRZGHubKuu0m
	 kzj6eg9OOJcXw==
Received: by wens.tw (Postfix, from userid 1000)
	id 6CF805FCB3; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/10] dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A523
Date: Mon, 27 Oct 2025 20:56:42 +0800
Message-ID: <20251027125655.793277-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120131_508260_8D225CB0 
X-CRM114-Status: GOOD (  13.39  )
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

There are two DMA controllers on the A523, one in the main system area
and the other for the MCU. These are the same as the one found on the
A100. The only difference is the DMA endpoint (DRQ) layout.

Since the number of channels and endpoints are described with additional
generic properties, just add new A523-specific compatible strings and
fallback to the A100 one.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
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


