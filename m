Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ABCCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 23:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mg4r6tqzHUH80N6S4z7Ye3MQyAcaZEeUKqyv8uKPNHI=; b=mCiHPMI/dqy1oleUl7CDFAjwNv
	8vgaXRZiU/ovx8wgi10nV4L+C/5Wj96lIw+XBmNpMZaSRzTv7TdYk127i5625wNWGGThHTSiw76ld
	XWSfprsIWrYVf7xqIe8hqOaDSpRowacmb2RzMrWdebyMv0DcLnvly0mUWZs+GULwTV5IlYXCrJj52
	oHYNtc9sxEBUsQvbaCNNGZ9TqqKqrSrpYvOQCGotJttjy9keLm57q3rkPv9ZLqWzbAGrLQ9unMRp6
	NunlP3W2nZABT/whVpxQkygaDdNDENn6hTmz7DcAwQ2O0D/ZGaNpdYdqZMrzi5xMwRfpG5KER8gmY
	IvXPNSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUKM-0000000HJoh-1olK;
	Wed, 10 Sep 2025 23:34:14 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUKK-0000000HJns-09dP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 23:34:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-772301f8a4cso179076b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 16:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757547251; x=1758152051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg4r6tqzHUH80N6S4z7Ye3MQyAcaZEeUKqyv8uKPNHI=;
        b=I1CPkPUMuU3DIKeggtt47cx7+eWSKikyL6oH1wHPvAbL6EnlFnhGeJAkX1zpfsVOrh
         dIntb4dagoZXDBZefCNbauHxY7aDeuS1G47Z70Kj/QIOiowDAR4nWtyaMAq68x7t/Fw1
         TtSD6SDhuYmfjiTXGqZwfHbUC6UCXPGswrg+EX+RN5GhHaBw8Bsiax0lPMHlv/Ix+Qe2
         pTJWThjsNNme5LBgHa8hXJXeVJX19tyGz2NoogTzHmf3ra1U3M50us8QXrsAacd0xdC9
         a0gRLmtC+t/uSaLMtR1btqpmrbqQx0ah4jY9Ve1opkhEZb1XMju/pKaOIenc6QT2+kZq
         gDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757547251; x=1758152051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mg4r6tqzHUH80N6S4z7Ye3MQyAcaZEeUKqyv8uKPNHI=;
        b=rI21Tj3duROHmnZt59sFsdCU+o8Iqo5pkypHB83RZmbaHYVys0DTXOnNozlNk0gobD
         LMSJDticggkN7+DRhqEdudOsuoJh7Rc9wMCVH1pzYa8Q7T52arjerilbr08akZAzaFFf
         FZ3MUNDcDwvQaAl9dMy7Tk/YZfewc15Q+7QO9Jeu9bXgwrjojHXjSRaClo2ApIVGmRlB
         1KwNAE98mSZ/qu0BeEno0XTGQc1DvI3LBSvvciNF6Ny5NOKfOEtMFJALoKtmrBdcjwyZ
         nfw/TAuRCZgHyaJ8rp3HK2m6jyulcQx8zGuboNYEz0sojKMdrJnYA9CEsRcG6VxeO/HV
         k0sw==
X-Forwarded-Encrypted: i=1; AJvYcCXwWKXj9gLsDvIY4hvlD+xb2x+ZmpEKxICu9qIkw2oJTkScd0GZvZFQPs+f7t5LPg2tX59BbF1uczD2BHtCCoxG@lists.infradead.org
X-Gm-Message-State: AOJu0YyJbNrCkOcJ05klz3h+0MCnWklCx7TdcLUWi/sBZMgl0VNRK2IW
	yetbrCYsdRE7bXdf7BGMLSydcbPxNfvGhIqjrMOubpRzeEsNoNCeQKG9UfQTpw==
X-Gm-Gg: ASbGncu+Ki6EYmEYsJxDATTy46ynL6nPV/hhXP3sFBsN5cEK0MzhuxhkPiDXUakShp4
	7gBH530eawfectYTFWsOrwldN6NPKACiAc+Tq4O0i29U2uCbDnOgIfY1kx/Zvx4DiZJCmtWkmUv
	ypA49Q43auQTDu2L1U7twmscQGt7LgNp7ENkqTwyfzQSyuf/Hd8bU7dJCEVe7YiBhA0/A/J6MdB
	8+W9O1QHbnuS9qeDnmyeS9+w3xjwHmq8fF7dx7OLxygM54aWGpTU5kRQDuAIwr68FnXlTavyxQ0
	VqR1sE38n1gPVjXAwcl/8g/9Pq/RRBgPnn7Tijl8DwOFzhzgHbofOiEvgYgIMlR12cpfoFYNyuZ
	RKPFocpdhMUeJZyy2dgoy/kr9TKKgCIYncaXwVkbRtMaAmbI=
X-Google-Smtp-Source: AGHT+IFyFjSxsyaF2RJnC90z3QvBijSexO6xHZxytRiU9jodFdMt2l4JVc9tzY8yfXcH4+xcKOaQMw==
X-Received: by 2002:a05:6a00:7094:b0:776:2e3:a95b with SMTP id d2e1a72fcca58-77602e3ab24mr1427978b3a.1.1757547251235;
        Wed, 10 Sep 2025 16:34:11 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d19c:8c03:e9d7:2ba6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662d2395sm6299114b3a.88.2025.09.10.16.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 16:34:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	frank.li@nxp.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Date: Wed, 10 Sep 2025 20:34:02 -0300
Message-Id: <20250910233402.567245-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_163412_081264_AAE31812 
X-CRM114-Status: GOOD (  10.41  )
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

On i.MX6Q/6DL the following subnodes exist to describe the CSI port muxing:

- ipu1_csi0_mux
- ipu1_csi1_mux
- ipu2_csi0_mux
- ipu2_csi1_mux

As they were not documented, dt-schema emits warnings like:

  'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes:
  '^pinctrl-[0-9]+$'

Add a top-level patternProperties entry for these CSI mux subnodes
and restrict it to i.MX6Q.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Restrict it to i.MX6Q (Frank).

 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
index 8451cb4dd87c..719de0489002 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
@@ -50,6 +50,22 @@ properties:
     type: object
     $ref: /schemas/mux/reg-mux.yaml
 
+patternProperties:
+  "^ipu[12]_csi[01]_mux$":
+    type: object
+    $ref: /schemas/media/video-mux.yaml
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: fsl,imx6q-iomuxc-gpr
+    then:
+      patternProperties:
+        '^ipu[12]_csi[01]_mux$': false
+
 additionalProperties: false
 
 required:
-- 
2.34.1


