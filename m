Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E4CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 23:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EoZDhtfm71sAnkdIMsrhIwN0V38S6E+liZUy03iXuLI=; b=xH2TIb2NQgyiZrk84n7JO/O3Pp
	pCy85Jk8HxdRz4WVMJ1uv5lW4cFjZ4qOnUxIJJn567f8b/7MEiFRTvbBZDpdaKbPALKkN3R0eNu4u
	5zkASM6ram6DWe+BDnyhJ9jDumK6KBjFtnd8Gh4K20pd1EmQ0ffwDyhffsn/Y9HhbKJB+Sf5Jjjmx
	rXrXfnJeLWRtEdTpHS2kQiAIbhPAGpJcnS0ZX9r71zZFEDno+CcnCOhpw5j+h/M9qCGbQnFaEbfm4
	WH0dY6cP7MEGZCChFQrwFg0rqBNU2I4IQs1eNRyfqbk71I2v5vZHlVe2f53+nByrmaT1ZQTVXjpQB
	IEARfAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX6zw-00000009oeG-0VbW;
	Wed, 02 Jul 2025 23:36:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5uI-00000009hZ0-29wr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 22:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCB23A52066;
	Wed,  2 Jul 2025 22:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68341C4CEE7;
	Wed,  2 Jul 2025 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751495181;
	bh=fSCI8CmVMhipQyZ9gUu71NyTMXRDajaGD5rwkmpXu/U=;
	h=From:To:Cc:Subject:Date:From;
	b=Q1seghUAxo2zOZJF500mviQmK5ujL+a/MGf7UlBHv06cmBli3SlCPebUNtCmI3w21
	 N2bvzma3pd2TUfJUUhh5lzzPjYY+drfbbGuHawwYpLDZrfPUdas7RW0xWrEzwPI22s
	 5k9jfw056blo1UIMtfM5fi08W2jsh6njR9oqdd34OCiYBcYFQAFWYZ5qpiJN71uFi9
	 wyyvt2sM0Kq3cIPVc86udx9yzbwqugFyyvVbDyBTyzwN5XopO6l3lq9qRn6gHu8G1C
	 nveEFzdoRy2chG80b9To3CTPdwv1TIGlpTNpp/DWV059vIahfHB4lOAimu9mRRcB3R
	 GcuLRbE2W0tew==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: Convert brcm,iproc-sba to DT schema
Date: Wed,  2 Jul 2025 17:26:15 -0500
Message-ID: <20250702222616.2760974-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_152622_683163_F69CC63C 
X-CRM114-Status: GOOD (  13.41  )
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

Convert the Broadcom SBA RAID engine binding to schema. It is a straight
forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/dma/brcm,iproc-sba.txt           | 29 -------------
 .../bindings/dma/brcm,iproc-sba.yaml          | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/brcm,iproc-sba.txt
 create mode 100644 Documentation/devicetree/bindings/dma/brcm,iproc-sba.yaml

diff --git a/Documentation/devicetree/bindings/dma/brcm,iproc-sba.txt b/Documentation/devicetree/bindings/dma/brcm,iproc-sba.txt
deleted file mode 100644
index 092913a28457..000000000000
--- a/Documentation/devicetree/bindings/dma/brcm,iproc-sba.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Broadcom SBA RAID engine
-
-Required properties:
-- compatible: Should be one of the following
-	      "brcm,iproc-sba"
-	      "brcm,iproc-sba-v2"
-  The "brcm,iproc-sba" has support for only 6 PQ coefficients
-  The "brcm,iproc-sba-v2" has support for only 30 PQ coefficients
-- mboxes: List of phandle and mailbox channel specifiers
-
-Example:
-
-raid_mbox: mbox@67400000 {
-	...
-	#mbox-cells = <3>;
-	...
-};
-
-raid0 {
-	compatible = "brcm,iproc-sba-v2";
-	mboxes = <&raid_mbox 0 0x1 0xffff>,
-		 <&raid_mbox 1 0x1 0xffff>,
-		 <&raid_mbox 2 0x1 0xffff>,
-		 <&raid_mbox 3 0x1 0xffff>,
-		 <&raid_mbox 4 0x1 0xffff>,
-		 <&raid_mbox 5 0x1 0xffff>,
-		 <&raid_mbox 6 0x1 0xffff>,
-		 <&raid_mbox 7 0x1 0xffff>;
-};
diff --git a/Documentation/devicetree/bindings/dma/brcm,iproc-sba.yaml b/Documentation/devicetree/bindings/dma/brcm,iproc-sba.yaml
new file mode 100644
index 000000000000..f3fed576cacf
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/brcm,iproc-sba.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/brcm,iproc-sba.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom SBA RAID engine
+
+maintainers:
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+properties:
+  compatible:
+    enum:
+      - brcm,iproc-sba
+      - brcm,iproc-sba-v2
+
+  mboxes:
+    minItems: 1
+    maxItems: 8
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    raid0 {
+      compatible = "brcm,iproc-sba-v2";
+      mboxes = <&raid_mbox 0 0x1 0xffff>,
+               <&raid_mbox 1 0x1 0xffff>,
+               <&raid_mbox 2 0x1 0xffff>,
+               <&raid_mbox 3 0x1 0xffff>,
+               <&raid_mbox 4 0x1 0xffff>,
+               <&raid_mbox 5 0x1 0xffff>,
+               <&raid_mbox 6 0x1 0xffff>,
+               <&raid_mbox 7 0x1 0xffff>;
+    };
-- 
2.47.2


