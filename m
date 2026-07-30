Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC35AC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hk7IjvGBx0G3te+yrI2952KvcpKggpobzApHFmpwAiI=; b=wdmwshcogzCv9K39JRvYJdv3+O
	7ci1AgrXsZpndCf60HtsFXoyTSGJWrIIFogV2+ZQUN0npvH5yf35X3xA+lXuzZneMBp9K6CZjQGM2
	rOJGuJiNgDwX3FRYbn5rH40Q77vDkb0Agdo+SEzisYddEOrqgdpGw3LwrhMX+cRQqiB7A1uI2n+3p
	LOwORtjli54+GC7R5AEFK17m2/J18Zj/wCg/7V7tsRJa0ozzQo7PUv7WJwyrfpU612Nn40HXv+F1k
	n1KWysKU0JC9ika8XH0xLiwsO1AK7+HAklPpiyVL/sfWQutU0yg2e9kiHSbAvqc+f9AidQD586aK+
	XFhth13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjQ-0000000B0dT-0FiU;
	Thu, 30 Jul 2026 16:35:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTj9-0000000B0X1-1y9w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:35:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f707e5d75so1697507f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429321; x=1786034121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hk7IjvGBx0G3te+yrI2952KvcpKggpobzApHFmpwAiI=;
        b=ihoh42pIPG6opBlpuwpe1s6yzwXP24IRMENfs7BjyCb+MA0bst5K4XcTE2Y823DFqD
         3g2ek+ou8/vb6HEaVDPjrTnefO3Rn8nqd4lwGcIIy7agxcytPfcplwaPrD2HrB7bvXge
         3Pvk2jWHvTLHiCb59QGDJfp1tKhy7Lj2aw5GoitMX1EFg1jAX0U/T8QUj7I2kBetxovo
         2OORuRnQ5lslC85HuBljOtcG22MSAE5CWlLji9yq7Xtn6qkRHabY8K/5HmQ939bHmE2V
         gO5G72ov6cH+naugsyx2SFinSW9eLtLbgf2jDbdSmsyYN84t11lbOsr0qZsbz80p4Ec0
         tETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429321; x=1786034121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hk7IjvGBx0G3te+yrI2952KvcpKggpobzApHFmpwAiI=;
        b=eM/pXKq4gB6x3a/StchuRUxLiR0nkv8wwQZdGdYdtzBiOumpPCHE9234rKoORhUPg9
         wcLE18+6a77m2CekaTfhliwMhVQX0Fv6QEfbj8tLLJpfFL8yiUocfmIEj91n0D6oMXdP
         KiUjZD0mcjtCNxp7gqNxK5IWj5qb1f4IUUqk0vgFQ9TqtW8sC761cK+USiWthlvSe3xQ
         USkB8hEu9WnP8nksFLJQGq1MGNX/kgKt5++oLyL9yIsdlo97DqKUN63qSdolLJHwQlnT
         Az11bhh3E3dZCLb3onPVGLFpGeNBJFmeQkkVctvyL/ZgEf7WLS2Xi8sGypZrnJBORNNw
         mPsg==
X-Forwarded-Encrypted: i=1; AHgh+RqR1PHJxb27TafbeVAQPRIajDwl1IQDmljWriQmv0i0zHnrJxA4H/J7lhpgKvbE7Hlwn3QWd30eGh0KD0sVx0SH@lists.infradead.org
X-Gm-Message-State: AOJu0YxZvEK7mGubOjdUtq/jrSC0fT/BWdkkk3Gv90GYlLq8G8lL7I/8
	FpkFKBrNS0kih0y+s978IedMENYLbeX0A3s4aLSpnisxhKhkH9APK4Wk
X-Gm-Gg: AR+sD12CYPJMcONy4dvqJvxPOuAQGKS4vNogqjbGleBTS7MgVK3JQMUhZ6MIJAIhFBX
	b25ZktGSxBYdvpQWAI+MVDgfC4t4oNYUv1nNhHd2Tgqdpu4DmH/N+4TiXMrb7VC4dXm9YErpT6d
	yHTW6lAB3cx584Nh08Q48tZxJZsS3SwW3iqw0y3reCxo5VjRFLRqlSBroJja9pBU5oOY6Zmm0tL
	Se1d3uauwXJGheDCZmONt/KQwJoOhG43SCSexuc8dSbXn/3cNo8mFDKiUmCpxaghC12TtAOM4H0
	NOnOa/cl6lw3IJTDHViW8Airyxuc+UJ5KDHCTWGmFwJf1fwrcKsdeyCKFOc3lSpXtSv+E6nHAzp
	6rS/DWM8ASs4XFOCDr4U3nBIbktPT4WOGeVpknTBf3pvgOROs0tQPK3vrAeH7I/h96VEFJZn/k8
	pK+1RRUyARzOPPr3/5YLf+Fz7ORpU5pcs37QkHZ09wVd2e1NpOT0KX7WDQ0sbjBTVY4jwSgLehK
	CaTxtq/GKfRKw==
X-Received: by 2002:a05:6000:1acb:b0:47f:8b2c:3d98 with SMTP id ffacd0b85a97d-47fc822eacfmr4812060f8f.4.1785429321557;
        Thu, 30 Jul 2026 09:35:21 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:21 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Thu, 30 Jul 2026 09:34:09 -0700
Message-ID: <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093524_473564_3CFC47CA 
X-CRM114-Status: GOOD (  11.12  )
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

The carveout region names are derived based on the DT node names. Because
of this, the DT node names are ABI, which is not supposed to happen.

Fix this by documenting an additional, optional property:
"memory-region-names". This way, the software will have a way to build the
carveout region names without relying on the DT node names.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..8e3e6676a95e 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,10 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.53.0


