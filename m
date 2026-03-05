Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A384EFCE5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoyJS43DjogCNIlYUyLOl9RH46vOQLUOd3a+06hfz+Q=; b=mMDYf55R8Z1YdrtceOLmi3RGZk
	+AG8uV7wVMuu4keCij10kN1E2GCY9dI1xITjPd48Gxk8fqIjQ1cM/fXQS7EEIpdpBDU1xYCuIE8mq
	Skf9FIfZI0dFTAL+nUvGkKmMRb0Fmb/d3gL4A9UuzKyVOL1DBZqvi5y40opDOzZT7sOcm0HJvmiYF
	kOWI2silVq1CjmnXfHvzgI0ZeublIzsiSj+f7WHBiIJahklq0CyXro8JYSH2BW0rPU23cWD+nAgGs
	pCWan1G00UOfujznc0LWejf/sQBy2iMFZw2Rf/e+MWmP8/FRVPv7tmFUXiKJ0Sflr6jswZcdxrgIN
	n8tGFkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzTc-00000000r5k-1oxv;
	Thu, 05 Mar 2026 03:34:16 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzTZ-00000000r4V-43IE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:34:15 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-506bad34f51so65344001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772681652; x=1773286452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoyJS43DjogCNIlYUyLOl9RH46vOQLUOd3a+06hfz+Q=;
        b=DrJp/BtXA7wI7Gl5FYaFP84kV/LHgkHUu0XQy5UN+XMBxAPdxAUFndmamf4Kg3KFi0
         CoBurt+vjmcs5FxAoQqitjBkj6Jc1xgHGCRW6UxXu4q81+5gIJnUxwzRRp4kP/ljaSg2
         cGsO6tK4VJgTB8r+z6gojrXGthrKHhde7k1AHEeBk4A+3sx6E2JIz6CmjCUNne0U6n2R
         /Fwcwno6Z9+Ei/QIvfH3PB20F5XlIUCpLta06IeqPLTCEDpAW/ISvTkDoLYvgnXw6F/m
         EPrlAAn1Vx/+rOfnBwZv6n8uohFxIAcf0+YfyvqXNk1k/KSG6eaKHOnFbBA1k+yq1h/G
         nzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681652; x=1773286452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GoyJS43DjogCNIlYUyLOl9RH46vOQLUOd3a+06hfz+Q=;
        b=HspiuTAec7z7U9f6xW3YKKmuUr5dgHWeqFOjgVYo74sBilFJ+lNByat+fp36Q6tTE7
         6cwdbkzZpi4J1XWnZsvrNFKuNc2PY54Cyy2B+GcuPfJfAVC5I23qDSM00t2sQoaMsD1Q
         uGrEgjq1vWZ9qhAV513yh9dkC+C0Cst8cneYHNjPY+9o/UuDkH314XgyM9h7NRk26KPt
         nv4V9nyapqQ+I2jKPXPiVhp42geaCe7ICGZ0bI2kksZfxYWMRmqisG95me2SbsbbQI5x
         /3Wa9M0gcS2eb+lMooKygDl36rMutNXnkTxhBZGbEI8UcA+CH87zkPYNpPkTtQG36MLL
         eG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoJfaUtB1lTX+ojhoiB1PvDn3XkAxnUkir4NWkejOe+G8a2VLB0i2qyqHP7TmE/Wxe5I1/R193CjQsEA2kceWS@lists.infradead.org
X-Gm-Message-State: AOJu0YzVse4e1rq7YcMkbZ+nvMlpxVWn9mFEuws6UePqLSHMmpu4Qgmw
	1hg63nsHahBb6M3t9GoPjFYCjxASsdSXyWrfH3ewnVXWjM1CiEnv+q4i
X-Gm-Gg: ATEYQzwvV5Zk1Bw/mRf8bhngfWzVayO3KP26SEGe6JiZJMSYbs+qOCrAvIHONb5u3MF
	z2Ifq52D3kPBzxCB6N50Yp4swLnFcxcTFSryZQwfAuZ4CihwHqZRVen5in7cGEuSSR6Xrf5Hxfo
	/7RJEbn/pKpYEGWek1SreyFfipL1uRjK+GF/+GPM1IJ5npX3byzJRJ/IhV9lihhGRCIbWm6hixL
	vb4ooKgKSray+mM8o7cv6p9WTH+wtme/Zbcj+TDDlNFDypQnIy+YeASs2wagKKXrNNd5twFmiKj
	lx8uXjjnW3ZalmT95opmEIeLwpcQsFow8Bs4e/Qk0ldlZj4tfXwMkBDu6SYRes1/v/+u+TFy9qC
	Q13A3b3BOBkj/wWU7q0Mb+CUplfi3fHCfhFgZVXEstO6ic9KUeaoGt3IK2Uz327wmRhv2ngbTIH
	StZF2Yw1/lYvrJLQykJdrK+4iUGPc=
X-Received: by 2002:ac8:5a82:0:b0:502:9e93:617d with SMTP id d75a77b69052e-508db36395dmr51002631cf.46.1772681652477;
        Wed, 04 Mar 2026 19:34:12 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630b6sm190667601cf.7.2026.03.04.19.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:34:12 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Thu, 05 Mar 2026 03:34:07 +0000
Subject: [PATCH v2 1/2] dt-bindings: power: Add Support for Allwinner A733
 PCK600 Power Domain Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-b4-pck600-a733-v2-1-ba6bbed7d253@gmail.com>
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
In-Reply-To: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193414_022076_7A318ACB 
X-CRM114-Status: GOOD (  13.28  )
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

The A733 PCK600, similar to A523 PCK600, is likely a customized version
of ARM PCK-600 power controller. They share the same BSP drivers in the
package provided by Radxa, with the only difference being the lack of
resets.

Therefore, document A733 compatible and make resets required only for
the other models, as well as prepare the PD definitions for future
device trees.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml        | 17 ++++++++++++++++-
 .../dt-bindings/power/allwinner,sun60i-a733-pck-600.h  | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
index a28e75a9cb6a..b97361ce2a00 100644
--- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
+++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
@@ -20,6 +20,7 @@ properties:
       - allwinner,sun20i-d1-ppu
       - allwinner,sun55i-a523-pck-600
       - allwinner,sun55i-a523-ppu
+      - allwinner,sun60i-a733-pck-600
 
   reg:
     maxItems: 1
@@ -38,9 +39,23 @@ required:
   - compatible
   - reg
   - clocks
-  - resets
   - '#power-domain-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-v853-ppu
+              - allwinner,sun20i-d1-ppu
+              - allwinner,sun55i-a523-pck-600
+              - allwinner,sun55i-a523-ppu
+
+    then:
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h b/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h
new file mode 100644
index 000000000000..cf476a005b55
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_
+#define _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_
+
+#define PD_VI			0
+#define PD_DE_SYS		1
+#define PD_VE_DEC		2
+#define PD_VE_ENC		3
+#define PD_NPU			4
+#define PD_GPU_TOP		5
+#define PD_GPU_CORE		6
+#define PD_PCIE			7
+#define PD_USB2			8
+#define PD_VO			9
+#define PD_VO1			10
+
+#endif /* _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_ */

-- 
2.53.0


