Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E11CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksGpgyBSOY6krVRLLbP0F0NC4KXp/RG/saaAZ0uBhZk=; b=p1KLUHustK2/zXgTQ4YeyuE/BQ
	17biusB8W4wIx4Qydvx5QBBsuxcz/o6UFpSg5hq333nEfELAljQUCuaoPsLaZwGRuuNH4bhVh5FDR
	rvNSi4np787MLu7TuRn5MRL6A2AFZAEFlLoV21/dfRxFI5v+IGdUgwznZIa3ZxIe8YJJTuL8/1UiV
	ydPw0OBu7n5zg9eS93lJCB/NyaJicEl9es+Ct1v6lpqv/JIKDapz5XQh/c2GabZvkpP4/6h7gVXpM
	sbYGGdf2SZt2xo4sgekk/G3pt+j47hECIRxuIdKJ3c5w6GpA/K8ld+F6z0cLsl/Tk3r72PRnCHBIb
	kfQQJoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZF-00000007lzs-4BGx;
	Fri, 29 May 2026 15:56:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZA-00000007lv9-0ZUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so69712285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070166; x=1780674966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksGpgyBSOY6krVRLLbP0F0NC4KXp/RG/saaAZ0uBhZk=;
        b=gnx8ibq2qYh9ReoBs0xSWEvVaopbyPosIIg5TbEFW+v3fHKHNqh0R4hjVaBcYmOGxf
         XVjSkaQc/4oxAsehdoonGHH1jHfW90Bt/nVbmMtG5K1V5eAlI+gJD0+dGbUlvHx6JDd5
         32VUXnhJB+os3IFZ/ofWbHfg+Kjh2Tg+SBMI9Tz2ATKv/piYWp8l5a1K9Ng3zNihpRsC
         hN3wXbEfq34nfQPzRuTlffz+3qO+ZP+GBJ6E7VvWBQQxGPPU6EaBks5mR9SimJj5S/6R
         YMugDLSARm6DseFEAoGTQY9ri8RnhWIzuRT/zNsiBXcfsHVUTdMx7yxJ5O8PXOqUH7AP
         pAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070166; x=1780674966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksGpgyBSOY6krVRLLbP0F0NC4KXp/RG/saaAZ0uBhZk=;
        b=WOXIxHOewq0KQWmbm07JYKzw2Jx7N0MIScBPyAevfAcvefbUyS35TYO7c4wdmgjwtE
         egtRhdRB25FRfpUE41VfBeY5ndQYN4m2FaF+7xRWhgLzakPwjaEPMiXXjHNw5rQ4uzql
         5Eyx/0iAJpMW3xh91XIgnfFGZjRViC0WcWY1cDjVXa67vV4IJ7oa18Pvj1Ffal95wQ1F
         cSz2mwnPQLUCy6v4qMC5jMVZQPqQlJsMUXyACVWiLpF34gwPMfiyhdgRl8hw7ut3rJjz
         70egQpovcGRRKW5wrg1K2ZVCgS0VCtHNqRnEohyoDqXBEMBrDbTxsoj0wdn+YX/7k5xL
         MFdg==
X-Forwarded-Encrypted: i=1; AFNElJ8fg5CnLSAQSE4n4GzKYZpTOftKIVz92bePTd4ICXjy3Z1QMzKIqTPd5jxhlCCDfO/eUOoOyrNTzENA8sialGDE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8veq5O2niQWWNoiIQnzwXNQbV6lsqR1dyDZPmWP/yrOtbhlQG
	F5uOe8bTggf8fr59hzHrmosUvzCSQeqt5WeIWHDH9zWH4deIeGxYS0Af
X-Gm-Gg: Acq92OHpUXqXEVM4bK0KtjsV980/lYF7ETcBpleoZQVeDLtLnmQkCOdbVk4oMAs5T/h
	/nYkF2EDDAfg8f9hX+Apv0nkJ52rpKKxWu1jZ4XRO59lB5TvLMSaFzsssXo/1sTyqOdhFjvcuCH
	S2y4rLGBy7m5VDXug9iMmpWNSXa3vyu98vYtSbLVmX5OLW2j/eGV0YqODaSfbG/qsiSrgafKG1y
	cWzrn+LKI5iZQrZECDfSyWWz91fd47niBrKQnOSS/ajvpxnpNAgdSthaNhYltUMiWCD3+p1oHG3
	FQA5vpMdC2RBXa9/+nAd2/PwQovPcE8GFdziWTMZLKah3IHOry0doNmSbM9xHBHwJBhuAGElAe6
	k+0KVAAfKbvWvmPJyDGoz1lAi+Y68DxJlwcVgDCuJLg6qzD0CaEGssc96nLTI7jPitYKLSKLcKf
	xCUnSVfEdRx/tVXdYuAVoX+ROYBPqkeq/xPO5hTW0FQfKwhONg/E5VhAMP4TUmN5EWp3NLVym2o
	Mg5XRX/P7ZlJTCXxOMWtPGnu8j2xhfzJZBAVf6W
X-Received: by 2002:a05:600c:1988:b0:490:9d1b:201f with SMTP id 5b1f17b1804b1-490a294d4b0mr2703635e9.32.1780070165977;
        Fri, 29 May 2026 08:56:05 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:56:05 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568 support
Date: Fri, 29 May 2026 17:58:22 +0200
Message-Id: <20260529155824.3099831-3-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529155824.3099831-1-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085608_862461_B34B66D1 
X-CRM114-Status: GOOD (  11.40  )
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

From: Midgy BALON <midgy971@gmail.com>

Add rockchip,rk3568-rknn-core to the compatible enum, document the
new rockchip,pmu phandle that RK3568 needs for the NPU NOC bus de-idle
sequence, and make sram-supply only required on RK3588 (RK3568 has no
NPU SRAM rail).

The driver supports both RK3568 and RK3588 RKNN cores; the binding now
documents both. The rockchip,pmu phandle is consumed by the driver to
issue PMU register writes (BUS_IDLE_SFTCON0, NOC_AUTO_CON0,
PWR_GATE_SFTCON, BUS_IDLE_ST) on RK3568 only.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a490..6582a0c5c 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3568-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -50,6 +51,13 @@ properties:
 
   npu-supply: true
 
+  rockchip,pmu:
+    : /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Rockchip PMU syscon node.  Required on RK3568 to
+      perform the NPU NOC bus de-idle sequence via PMU registers before
+      the hardware can be accessed.
+
   power-domains:
     maxItems: 1
 
@@ -75,7 +83,15 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: rockchip,rk3588-rknn-core
+then:
+  required:
+    - sram-supply
 
 additionalProperties: false
 
-- 
2.39.5


