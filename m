Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B215FD2ED0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2G3cP9X4cNiCp8YAHg4IjVGgRKZxQbDkjOgRFSfK7s=; b=MtqSY93KvO7cHXvT7Lp52Dby5g
	k3hn2qpmJRwoXGPd9PSK4EHg3l/x4pUjA1aJAH2jtQZ+TIbJLT5BmnWwetF0xLfrVmY/wu7F9AmYR
	IvDXVPc683+RzNBJYll+uHdMCc/ketVmORmiyGq6kKGt0beufAwCreAi4WbE5jB23NW0cLo/A+p2R
	64jPokBbVYKnjr2uK23KKIwBh9YJk1BF30lfQ5OTECfHNg5Xfj3t4JCy2y6XQNnLAShzWQIvryvQi
	TzlIwJeeFAbLdtj0M2DPSHXgoicNC8VDHdvnTjgW3m5u6MJ7tDsB/HTx87+C/Fs9qRjc+c1MAwhg1
	l/ti1EqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7upi-0000000FCYx-3BoO;
	Wed, 01 Apr 2026 12:38:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ueA-0000000F3o3-22wq;
	Wed, 01 Apr 2026 12:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E2G3cP9X4cNiCp8YAHg4IjVGgRKZxQbDkjOgRFSfK7s=; b=lxU386sE9EDZnbnyqkBMBFC9q3
	LjoXGlPXmzvsS0ItERM6+4R8hyD5F7B+4iZ5inOlfjhDyvMplvtrrWZMD7yurU2GaJvdnYUcuQ8bq
	rqFjSKgHI5iG8IBeVPvkoNCjxmHKIFl1LZG5hlHbv4G9O/BMghYzgQKpLeJaK3LUYqqlZxZQ4w2Hu
	KsajjwzSP20sSBv/4Y5abS27eELl9MHOlVPqlPwAjt+6EZIi4X/OjYss6ekuu3LDGIvQDztNKd+nK
	LUtVl9rcrqEWOKZk8ljbtX0MRUWqnrfHuyDzyDiiWv2waL4a5LOAPtoVd/mfuHURgcuRtoeN/Ando
	Mz1gSqoA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ue7-00000000Ktp-1Nau;
	Wed, 01 Apr 2026 12:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=E2G3cP9X4cNiCp8YAHg4IjVGgRKZxQbDkjOgRFSfK7s=; b=qUPqjwtj78zGf4p2xh8VKaEQ+Q
	nXh0ts7fQKRqRNCbcMe+P/Qdiy6M/f2n/Gkt+xCOOKyQSjQAVmiVAsngP00UMTqqrNikSusWRdnyJ
	HoAOnGFoKlFfEWH+8ewMciN9PotAn5dqkZuL5zQbxgSz+r7SPxXXi1AfOk0u3DUJuj9zE4HxWSclL
	Wxr41qgXd//s/IAhl9wvXLV+9vWEWF3NytCTUTN7M9548MRofsfaMaCtjzwh0qzQA3bgMJGqo9ExM
	hl/fGl4BPN3TATHfh8JfCQLqCLmTz+Iso5CHa0lnTN2KXpe7xM2cNxBsWPbnoqe37oLgDZG+CGlaY
	5u0no4Uw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue3-000IQk-26;
	Wed, 01 Apr 2026 14:26:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue3-00089b-0X;
	Wed, 01 Apr 2026 14:26:02 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v3 2/5] dt-bindings: phy: ti: phy-gmii-sel: Add ti,j722s-phy-gmii-sel compatible
Date: Wed,  1 Apr 2026 14:25:22 +0200
Message-ID: <5ac1c52827a1a246584dddb62335f9ce4715eceb.1775045279.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
References: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_132607_505414_70579611 
X-CRM114-Status: UNSURE (   8.20  )
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

The J722S gmii-sel is mostly identical to the AM64's, but additionally
supports SGMII. The AM64 compatible ti,am654-phy-gmii-sel is used as a
fallback.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 .../bindings/phy/ti,phy-gmii-sel.yaml         | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
index be41b4547ec6d..6e12a75100eb8 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
@@ -47,15 +47,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - ti,am3352-phy-gmii-sel
-      - ti,dra7xx-phy-gmii-sel
-      - ti,am43xx-phy-gmii-sel
-      - ti,dm814-phy-gmii-sel
-      - ti,am654-phy-gmii-sel
-      - ti,j7200-cpsw5g-phy-gmii-sel
-      - ti,j721e-cpsw9g-phy-gmii-sel
-      - ti,j784s4-cpsw9g-phy-gmii-sel
+    oneOf:
+      - items:
+          - enum:
+              - ti,am3352-phy-gmii-sel
+              - ti,dra7xx-phy-gmii-sel
+              - ti,am43xx-phy-gmii-sel
+              - ti,dm814-phy-gmii-sel
+              - ti,am654-phy-gmii-sel
+              - ti,j7200-cpsw5g-phy-gmii-sel
+              - ti,j721e-cpsw9g-phy-gmii-sel
+              - ti,j784s4-cpsw9g-phy-gmii-sel
+      - items:
+          - enum:
+              - ti,j722s-phy-gmii-sel
+          - const: ti,am654-phy-gmii-sel
 
   reg:
     maxItems: 1
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


