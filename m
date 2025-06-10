Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425BEC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LJUUJ5PPmn37618cQcBVsiRRAH+aMQPrJ71knlOxcs=; b=Cvk8XcBt+Kp6+FUAIwYs7+pGza
	QIh474dj4ut6cOe4powhcAGc8+YC8ihLssbwuKEkgppB8UoWoqS5f1wH/+I/hHAKNYhHCjuUvtod5
	9Npad+l0laQzeJuH5rcEb0JrJUg/4aVXtfEQaYYA7qqcZ+Q3uMy/W1ixtGBN6UJtlU4isWzqoqE8N
	S7SNWfBToCoBkQJEAKsDJH6JJY621gJHL+fS0rFMP9DU/reygY57Tfk+nSJN77N/J3jab44bFvJpE
	9V96OLe2eWibfwXvwwCT4/Rn4XSOBVY6EKeKyJM853FaBbnZxpihTHNtcFCusFAubXcxF68nnvOM8
	zUsMYchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lH-00000008ElA-2Q8J;
	Tue, 10 Jun 2025 22:48:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2bW-00000007bKw-24az
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51A9C5C57C6;
	Tue, 10 Jun 2025 17:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D14EC4CEED;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749575861;
	bh=B8ef7NKPQf8MeJRbWQzc5+78gOTS5XigM7aRKiQ2pMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bv/pgGgtwyhBRUEEPXJWy9emq7OrC/BQpCtIn+9AVHIWi95dl5eNelFaz3gRmOwz9
	 VFBhN9eDBiEVYK6A1UjT1+IGJV3icki+5Z+fxT0uXb2pTjvDIeANElQdyRrUaTlbVv
	 tJzeRjD5Nx+8MzyRE34DztV4XfxA7b59xSK0hG0/OBc81SrJLQ1YLSr1hYN+ujWwTx
	 3ratqSOl0QmNW3BvdpmSSM/efEux0M6rP7NpyJv6E/zyaj+l+oAnJd7+IVuerasYe+
	 RK4tzvW5m0cVv1QTBGMeH3X7d9xpZ0p6dxhxbJLe76FG9m6zLMO64vSnL01ljb9Di+
	 HlCMOZOSOABlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C7AC677C4;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 17:17:34 +0000
Subject: [PATCH 1/2] dt-bindings: nvmem: fixed-layout: Allow optional bit
 positions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-nvmem-bit-pattern-v1-1-55ed5c1b369c@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
In-Reply-To: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=B8ef7NKPQf8MeJRbWQzc5+78gOTS5XigM7aRKiQ2pMM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZHxoZ/okfto2eHbj4+w1y7M+nftQ55e03LZo58+ZYOa
 VtWs/yOUhYGMQ4GWTFFlu377U2fPHwjuHTTpfcwc1iZQIYwcHEKwERqZzMyHNZTTllZe/qq9eNF
 V90ZKxaz5WRMCbz97ILp6RIbMYZSUYZ/dtkLODTnn3v1hG0qX/uVlw5W3HfZlqV96O/tOOllu6G
 aEQA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_101742_622734_1822F3B3 
X-CRM114-Status: GOOD (  11.02  )
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

NVMEM nodes can optionally include the bits property to specify the bit
position of the cell within a byte.
Extend patternProperties to allow adding the bit offset to the node
address to be able to distinguish nodes with the same address but
different bit positions, e.g.

   trim@54,4 {
        reg = <0x54 1>;
        bits = <4 2>;
    };
    trim@54,0 {
        reg = <0x54 1>;
        bits = <0 4>;
    };

Before the conversion to NVMEM layouts in commit bd912c991d2e
("dt-bindings: nvmem: layouts: add fixed-layout") this extension was
originally added with commit 4b2545dd19ed ("dt-bindings: nvmem: Extend
patternProperties to optionally indicate bit position") to the now
deprecated layout.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
index 9bd34bd5af30d83ae03d48b10f3b2c5be2ee9586..b01567f9928443fd0f6d4f252cf2632dbec0de9a 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -27,7 +27,7 @@ properties:
     const: 1
 
 patternProperties:
-  "@[a-f0-9]+$":
+  "@[a-f0-9]+(,[0-7])?$":
     type: object
     $ref: fixed-cell.yaml
     unevaluatedProperties: false

-- 
2.34.1



