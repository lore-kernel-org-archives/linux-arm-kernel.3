Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2661CFA45E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgC15d/pQkY9/ZdNYZmW9U8JEuWcaoADNmU9EGiwgmk=; b=bDz8P2b3C3Vp/WOP3G6xr7h93k
	Cot/akY8e9ECdINXLozv0nAjYw88W8srxbzaXWiv7eY3uvqjZJAko3SdLt2GgtzBKqHJkcuLHrJRV
	bv55K+JLjqUeR7tzWU44QaWdmXjw4I1QJP3cRm6r3nFZwo6I5cic4G1mQ05QGss4Y8/moy+XXzHm3
	M/8V4DXU4BrhO2eqiNrRDLiEXJpbFGvwzzb7qNRk+zv5VRoA/WZ3Cwd1gQxO6NxEx0YEHsz5fymC8
	1ZIOe+9R9I06lD31Cr/9nNxjOovEVojeBJBK3I991tZg2aoYf/MfBZuLaNgmmomnfiC+x4BD0zwP0
	qzn9Uw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fPs-0000000FPgz-3KjL;
	Wed, 23 Oct 2024 17:45:04 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7N-0000000F7dQ-3XtN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:22:00 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso68354571fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700511; x=1730305311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgC15d/pQkY9/ZdNYZmW9U8JEuWcaoADNmU9EGiwgmk=;
        b=JE5Vg/TmDlyH4itky0U+yqOXMa8swoIw8ku8GlUYbT3gVFVA+4BibigV4eTmP6Cnhl
         PU3wfizdO2bufo/2Wb7Un7C29AmomPvRZyWsH+cc+oh5nVRohV4PkdYHXIk7bkAzeBK5
         KpFDC8VfsMWSy376oNxksHHW04n4hldVjSrM4jl03bU1qoYXtoczUZ0hM0U5+YBRV6YW
         zUeydasyvQ6S5Qke1K2iB0EHP4sgLJ5nFNubF2015XuBI83xaJn0Zwvw0bk0CjUIfAS1
         bM3W3SVdUPA/aQJRmlpfZcxSM9hwim9MZRH7bjHz9cAmCariI0qvukCBKYXcyraU8H5o
         nSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700511; x=1730305311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgC15d/pQkY9/ZdNYZmW9U8JEuWcaoADNmU9EGiwgmk=;
        b=KIWbax25ZXjsAF5IriBzlYtyFZRAuw3Uk8MGUbY30qzdMUmUHEKyLs8w2FmOSUjG/s
         qkEvj2XAlc91HKwNgYiFChsP30WcO0j418coE7q8TwqGG4JAN1B1g7IJ4ZwoepRuO1bS
         jOVQmO1NoIxk0ycXnPUMg/UCMtlWL+y/I/vy8aAq/CKWndgIT5rnY6FCenDi6idE7ekl
         IsMPPMj1EZ7jt69igyMtGIhVfD0US7KocGvQ0z5DcZ0VMry1DfgExlzMCYdwg+N/JL9D
         vwLriyNcBv0sEZlNc8dw/RUlwsYWeJm3pRok0EZJFyaqZZJAwP8Z6cWBTUD28eMj/+tr
         Vwng==
X-Forwarded-Encrypted: i=1; AJvYcCVdA00rMt6SB+I4bqKig3+hLUcinUYmqFvVnZJ56wYUcB3t48SXlACJWVYIOsOLipvjBZoSawmjlrdpZ4RG6hvW@lists.infradead.org
X-Gm-Message-State: AOJu0YzVUXdRXVg1fh0g0yGq1LO4eCmt1hQQHSrvHRJCT35WGZwR3u+M
	TEnxJ2X1weVKlBvEqGADscjucMeWXDvgniOxZyGguaBGxg9loVee
X-Google-Smtp-Source: AGHT+IH6A0+R1gxcuSRH5wO+QbdVBb6hBn6+S5OLqazKgIRlUbTwpM/jY7yy8fE+80bw1Otx1SyW+w==
X-Received: by 2002:a2e:be09:0:b0:2fa:e52f:4470 with SMTP id 38308e7fff4ca-2fc9d2ddc23mr14523171fa.9.1729700511046;
        Wed, 23 Oct 2024 09:21:51 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:50 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new compatible
Date: Wed, 23 Oct 2024 12:21:11 -0400
Message-Id: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_092154_502678_854C524F 
X-CRM114-Status: GOOD (  11.21  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add new compatible for imx95's CM7 with SOF.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..ab0d8e017965 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,15 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx95-cm7-sof
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dram
+      - const: mailbox
 
   clocks:
     maxItems: 1
@@ -38,10 +47,8 @@ properties:
       Phandle to syscon block which provide access to System Reset Controller
 
   mbox-names:
-    items:
-      - const: tx
-      - const: rx
-      - const: rxdb
+    minItems: 1
+    maxItems: 4
 
   mboxes:
     description:
@@ -49,7 +56,7 @@ properties:
       List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
       (see mailbox/fsl,mu.yaml)
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   memory-region:
     description:
@@ -84,6 +91,10 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
 
@@ -114,6 +125,43 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-cm7-sof
+    then:
+      properties:
+        mboxes:
+          minItems: 4
+        mbox-names:
+          items:
+            - const: txdb0
+            - const: txdb1
+            - const: rxdb0
+            - const: rxdb1
+        memory-region:
+          maxItems: 1
+      required:
+        - reg
+        - reg-names
+        - mboxes
+        - mbox-names
+        - memory-region
+        - port
+    else:
+      properties:
+        reg: false
+        reg-names: false
+        mboxes:
+          maxItems: 3
+        mbox-names:
+          items:
+            - const: tx
+            - const: rx
+            - const: rxdb
+        port: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


