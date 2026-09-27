Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED06CC98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsHW/jaP3ch5nu6PUwHvRCkR2Fo50ZdQygDYle5rfFg=; b=eYAOw7qmbup9N562wdx8NIjW+6
	Qn+XF++KqOAf0HjAcKe8oc4tamSvCvq0aQPXKwPnIRmrfhlW2dBOO4k5xjNZg/5Ha5BW2PLpf+KWy
	EFtJu8nV4uTefg2LnrvzwEGQz33IlkOWU/sotykcpVntsRUYo8QBbgyyFuX7+iqBch+k+osugK5iJ
	539JYasJDN6aTsnd4rEM0l7kZuLHLJSoks++oWaNuewWQPRNIicfeaOga993QQOeksmj8FAlszpeJ
	HV3EpvQWfT0Z+gLXMQJRry1gaOXKvMS2Q9N/6TR6m+1zLzE/ZwSyNPegZBQ/BHVfN1j//v+oKrLTz
	VsUcXajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAodO-0000000GMlJ-05QP;
	Sun, 27 Sep 2026 13:09:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAodF-0000000GMjC-349h;
	Sun, 27 Sep 2026 13:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC0A34450D;
	Sun, 27 Sep 2026 13:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FFD1C4AF17;
	Sun, 27 Sep 2026 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790514567;
	bh=wrP5f8Z4+HrY7KIFgp5WycR+TSTJDE9xIQ5JyoQB5NQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qmKJYmx2YpqQ2SAh1M9dlt+/jecLfKf/rct9NwRlONamqoBH/A9WXt0iH2l7IVmJg
	 8iLGvotKpXGqDcLytEze3oDID1KTa5JQ/Xmy/1+sctQAHr+obIXXyQokHE4+kfCMkA
	 pVdZMi1Lohej4VLreH1g+EMJTbPUWMWgxOL2+yDcwEWYTm2FmjCzuaebixlyfcOAQ7
	 ftwD3rRwO6PRv7eNdn5DZwlbE8wJIhSL24IOD7W2uuzLpZ+FLVFRxTqBT8aHDfez5Z
	 Mr8wRTPaSZifNkKqiSYH+lPRCqQmLJ4B+Hxh0tVtAkxM3/4VHQUEnlxvEn6dshzYqH
	 MqC+sMLQANkYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66532C9833E;
	Sun, 27 Sep 2026 13:09:27 +0000 (UTC)
From: Daniel Drake via B4 Relay <devnull+dan.reactivated.net@kernel.org>
Date: Sun, 27 Sep 2026 14:09:02 +0100
Subject: [PATCH v7 3/6] dt-bindings: display: brcm,bcm2835-hvs: Document
 iommus property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-bcm2712-iommu-submit-v7-3-dfa2b975cbc9@reactivated.net>
References: <20260927-bcm2712-iommu-submit-v7-0-dfa2b975cbc9@reactivated.net>
In-Reply-To: <20260927-bcm2712-iommu-submit-v7-0-dfa2b975cbc9@reactivated.net>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Daniel Drake <dan@reactivated.net>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, 
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=dan@reactivated.net;
 h=from:subject:message-id;
 bh=jvJtzPewMxeDZpE90O4lOLjfTo2HtXAHbTAGkD5tWH0=;
 b=owEBbQKS/ZANAwAKAcPmj7FTFEe7AcsmYgBquRWEkcJdsNIqcX6vaW1rQNFgVdhf6QsR8c3Sj
 KJCQ6/02dyJAjMEAAEKAB0WIQQ6Rf0sUP1iEhXfVfjD5o+xUxRHuwUCarkVhAAKCRDD5o+xUxRH
 u1/zD/9yzR0tMdVnQFUov9zJvP4J1F0UT7anXVClYkLytUL1oL/htyvpcPApxhQQ/Ai0sN51GQI
 JRpfyCItHz1PypKQGNfrvKWVg39fGGMMJpaYIfiERtaXHYD/rp2XiPPpjfp5N+QDS66UN16TjfL
 9kzNW5Ap51sD3ysqJvYmf/z/1LfLgv2H7z39x5sZy25+l5MPWaGiJjUFEajiovxFQRqeAZZ5UIx
 SSu955o1VwTjbzYgU4oAD5NdvQ9UiyhLIBV8lRSzuezVznLtKhRYO7bQiUVr1oAjf9mfPcWE3t+
 rW8xXN0wrh3PyKG8WFvuO+x7Yg2eYOpr+4pQU+aBD+Q1Vc0wxVS2bOdPg6jEWCdxvYlbWsPQmgL
 3JPjun3puwVAu5ytD/yF1uLgenJswWymM5q7ZjtievXk+W27ETu1AdZ1ZZt96apfuXy4V1juX38
 TN6oddMc28hBa1uw3IoYGqG4F4WaGAwLI23jWDsY8i2BFyjfSlpkB7GW7pVBznq/UP2rCKddAWG
 S3CfOUoIDIXRMBoHq+mVES/JqGC828Z74vsMvU8K+L5eRgQ2wp7XCpsKbxPPYtRak6ju70twY1u
 YENtf0k0qB/D4wt8C15XybD3Ocl0nZ+Tj4f5JEwnBde2CZ2nlZsu3bjwikcUtY+QX4rqinGKb7B
 qZE7pYYsvrVnKvA==
X-Developer-Key: i=dan@reactivated.net; a=openpgp;
 fpr=3A45FD2C50FD621215DF55F8C3E68FB1531447BB
X-Endpoint-Received: by B4 Relay for dan@reactivated.net/default with
 auth_id=1070
X-Original-From: Daniel Drake <dan@reactivated.net>
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
Reply-To: dan@reactivated.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Daniel Drake <dan@reactivated.net>

On BCM2712, the Hardware Video Scaler (HVS) is connected behind an IOMMU.
Add the optional iommus property to allow describing this connection.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 9aca38a58a16..8f8aae9f3788 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -35,6 +35,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0



