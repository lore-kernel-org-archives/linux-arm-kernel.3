Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25199E6ADFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/Y+t7R02LJWG7XTAOk6+QTMggkhTH+0gpcoJOIca9w=; b=KJt9+vo8S1cinIAnNmaZe2SmU8
	z4OmGCIvGLCUhjQzh5IIvt99XWx6vbj0B+s+9rm0zAzzD1EEuRjySUXoW6V8WcUlZGaax0POgZEq/
	/7jB64t/FguOZi32rhHvYPFKf7F7uXPhybUhdQnlCeWxCqGWhATsKSBe3Olcz4Q5KbigvDVbxSDNc
	rkC2//iDh7bWlCdAWNL0n9j1ViJr0B0b3Wve0hq41EHQSbs9CenQOv8G8go61833jR4YF6TxVlCvd
	PMIUr06WmexfzOuFacglHd2E0mH+2xGSHeJql+00B09ZGHGUsz3SQ7+1kXF6NWpCMTMQG53jMiEOK
	qL6MEMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpVa-00000004KXE-3Or1;
	Sat, 23 Nov 2024 12:45:06 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEpTN-00000004K7l-2KWF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 12:42:50 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 42326A0365;
	Sat, 23 Nov 2024 13:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=U/Y+t7R02LJWG7XTAOk6
	+QTMggkhTH+0gpcoJOIca9w=; b=h12pQO2AdYrnZ/T7VjfZR9dtTHaxO/Wt4/EG
	giM9cHkDgmVpFgzehA+bnTf+knFPbrbIRAYaVc/YugA/sGt/Dkh0foxBlOa8MaRW
	YYy1Vt7K9K4PFqY8vgNJziKEaCUYjyuxEd15h3uGkMYZk9MfC5Gi/2ITpRM/XdTD
	wnvhaBB5urrY8gidElkI7Llvct74JlFf48PkBMrgzhxwdVj9rTQaQzr9WGnngD3L
	++YdpFulycQVuvXfRVcv4g6vo0xETexS12Q0pTdVMtUD5GveHgEF7E8RGLMowwz+
	4rDD40oS1TH36/XSV0dCApL9rgllqmqxgQPW2nEPtua8/XoCAUk363IpCWH+M41N
	2BZQoK4AxQRV/oWyN62PFROmconlhyMxl29izNqxUFCmv3J8yDF8pMNDHmcL/GT+
	tD65bSfPoX8KPVXXHKB6NcV7clAhiIFV/fDMpFwM2xj6cIEEoFlwRFt/1oXSjosf
	YivzEyWjJfdAd8hsY8ilH2Arda1kdvUG6ed95GXtUj2JbHteAgiQmkJNVOrrzDO/
	gIFDHUMJhOJd33wXfFPJqgrSkN5z0S3QyGdTuJ6dl5AGrWnS29lAQB07/bntKeno
	jx2fRqRRCmcAVERS0kbe886sbtG53qYUrYJ4iEypUdvCaDSyFlj6RRyk7Q+NmZHp
	MThHGGQ=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>
Subject: [PATCH v6 2/5] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
Date: Sat, 23 Nov 2024 13:39:00 +0100
Message-ID: <20241123123900.2656837-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241123123900.2656837-1-csokas.bence@prolan.hu>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732365767;VERSION=7980;MC=747292532;ID=80952;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485560726B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_044249_748164_4870EC7A 
X-CRM114-Status: UNSURE (   7.73  )
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

Add compatible string for Allwinner suniv F1C100s audio codec.

[ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index ebc9097f936a..ccae64ce3071 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -23,6 +23,7 @@ properties:
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
       - allwinner,sun50i-h616-codec
+      - allwinner,suniv-f1c100s-codec
 
   reg:
     maxItems: 1
@@ -77,6 +78,7 @@ properties:
         - MIC1
         - MIC2
         - MIC3
+        - MIC
 
         # Microphone Biases from the SoC
         - HBIAS
@@ -87,6 +89,8 @@ properties:
         - Headset Mic
         - Line In
         - Line Out
+        - Right FM In
+        - Left FM In
         - Mic
         - Speaker
 
@@ -270,6 +274,33 @@ allOf:
             - const: rx
             - const: tx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,suniv-f1c100s-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - HPCOM
+              - LINEIN
+              - LINEOUT
+              - MIC
+              - HBIAS
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Right FM In
+              - Left FM In
+              - Mic
+              - Speaker
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1



