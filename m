Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C8DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1rqUZmbeIGtXPgCTodsmKk6y+OMHLTQEiTCHhSgzVo=; b=NqmQvCZCVtIeUAbKHS0oHC8+hc
	BJnQcka7A/qsTLqz+T5ll79yVbyAu01mInBN+CPDtlshRhjc0zWWMu5741J2aHsLVXhYm83Cd6ciJ
	JgBDfI6kS/75M8gE0tl+7EMTJZpdpwzT+WKs9r50oeuUasIzBd0cDthBtEyMMKcM4Uxk4sFgd0GZt
	C2LRCcZNuA2QH6/XrplK2C+qdoSBuGeLnVOaLKnWCVXoY7erwvf3x5QmrT64kSC+tFv3324vN076H
	abHwBqodwwhQfbhQUtNOlNyj66RmpRquwT/vF1fC82UbtdCbkvmbYei8nc+JPMvEFymagCVcOf9N2
	KVKP0IRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKbS-00000004aKd-3cdW;
	Wed, 26 Feb 2025 16:49:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKYR-00000004Zp9-2Lvh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:46:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4397dff185fso221465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588398; x=1741193198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1rqUZmbeIGtXPgCTodsmKk6y+OMHLTQEiTCHhSgzVo=;
        b=cdk5wjnfZvp9l2+ewwH7p6bBaIzl/WtifdrPiJp1GCbgdmI01461Ox5eD0ZFES0TTQ
         2fvITISMiIG2CbhiBCjzJml9VMvQK/3kgy815AKRIPlgd3D6yvntXyy+MUR3D4rLMgVL
         vYr8gXpgAalTiq6Cr7m9+XV1Y5NRYhlpjc7lqe3W2qUvIRdHPxLe0RDUiD3YVpkRKXYO
         cjsodS8ZpRGVTbEGKuIcKvA4KX4ti90H+gksMtvh05DaPxUHRUotmDu6rmB/lRAZ0rKy
         MgbWqrFf3uQoZvjOVqa42YTeYB+IpV70W8Kvh4WW+hXiXTch4Wvhv6j1OstXImHU/DHV
         XNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588398; x=1741193198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1rqUZmbeIGtXPgCTodsmKk6y+OMHLTQEiTCHhSgzVo=;
        b=VNWr2Yslgw0zbvEKEXXJNhmkvNC5K4/krWUuJtY/cESRDLhLK8Ik/XYehll4+bGl+8
         ZYCUkOYFFxWko/G7GxxEeL3ZMD9Vgtf3EYXKmSRW1fR6u9qCRSrYm1RdJmNlf549zGR3
         Yuac6ho9hI6k01NUsZ4gLUsLw1a096mq2wfz8z6c9ZcnLt0oUGxWtOkR9rruAJPrUTEN
         NQOCGvjhjRb9bIWugX157tqiPEUqZyIH5my6hOH3rm2r3FAt3Xh0s3v2CkPI8ZtrvhHV
         j9wJab+wsWJmQFJN0bT9qcHEOwJAZoCoDSYNHczrDfNp7mbzqnCzA9vXuuMkir/virBN
         FQVg==
X-Forwarded-Encrypted: i=1; AJvYcCX7T7PTQp50WM4EY21Ad7pCXwA0dQZgAqu87mGFd9L3VTmVbjL5n0N+bGgY1bt+OECc4HDo4tUBDw2PqngCASAU@lists.infradead.org
X-Gm-Message-State: AOJu0YymJubiJCjsGo6Mz1PZhVlIjS15oC2JTcZquS4fTE7o+1uvjLcb
	YSmbe/Qa9rT4U01t+FBEF41x+Ztbe38p9UX3K7H2oRlCqXnPfiLk
X-Gm-Gg: ASbGncvlTMPm2geDtyePmmwBeYaVEgTjM1NC1ezUs3ykPHrmA2wjR0ggc4Ime5xO5lq
	OzsWEr5Xrv7kikzyp1DdC9dSqzCAsp7T8Jo+JahHXQZpZ9xNJYRmWZYfFjXR3IcWKXQzCNxFvJs
	4gUifcsgTqAsutTlTcZ985qZKewgyeOeTvDEgDAuOR+fi0uNOXZkyH/41BU4QcfU2MpuU1gFIN+
	2ColhYlVhjKO/HreBtAWNbMqk5eu8Xr9v4UlHCsdeDF5A6SJSzZGq4IouvwzEhnThPguKO/47CH
	2cR06lQhGwoLzwI3Hx+WmaZineVTjYLB2GH6y4IFGWINy6HrfpB3tGP4UzBs35R0
X-Google-Smtp-Source: AGHT+IGNO74QcjfvqSxSeJoVAhbgQPoU9My5GWhE+D/oKsm5H8jpS40BGbgcOjeGiCnhRrebp+SqTQ==
X-Received: by 2002:a05:600c:5114:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-43ab903f62emr35202715e9.31.1740588397807;
        Wed, 26 Feb 2025 08:46:37 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:37 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: clock: imx8mp: add axi clock
Date: Wed, 26 Feb 2025 11:45:10 -0500
Message-Id: <20250226164513.33822-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_084639_598996_D78C7017 
X-CRM114-Status: GOOD (  10.83  )
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

Some components of AUDIOMIX (i.e: DSP, OCRAM_A) are clocked by
AUDIO_AXI_CLK_ROOT. Since the AUDIOMIX block control manages the clock
gates for those components, include their root clock in the list of clocks
consumed by the IP.

Fixes: 95a0aa7bb10e ("dt-bindings: clock: imx8mp: Add audiomix block control")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml     | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
index 6588a17a7d9a..0272c9527037 100644
--- a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
@@ -24,8 +24,8 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 7
-    maxItems: 7
+    minItems: 8
+    maxItems: 8
 
   clock-names:
     items:
@@ -36,6 +36,7 @@ properties:
       - const: sai5
       - const: sai6
       - const: sai7
+      - const: axi
 
   '#clock-cells':
     const: 1
@@ -72,10 +73,11 @@ examples:
                  <&clk IMX8MP_CLK_SAI3>,
                  <&clk IMX8MP_CLK_SAI5>,
                  <&clk IMX8MP_CLK_SAI6>,
-                 <&clk IMX8MP_CLK_SAI7>;
+                 <&clk IMX8MP_CLK_SAI7>,
+                 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
         clock-names = "ahb",
                       "sai1", "sai2", "sai3",
-                      "sai5", "sai6", "sai7";
+                      "sai5", "sai6", "sai7", "axi";
         power-domains = <&pgc_audio>;
     };
 
-- 
2.34.1


