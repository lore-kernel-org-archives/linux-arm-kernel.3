Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F9CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=; b=z1A7FDX+MEmjCCmSwxt0SuTWmh
	c6ek63Q3sAJcJ08KZuD+boN6UevK5oVlnC7X4/9YGHcbDoeXNo71DvCf6j/WVkBWrcGIpmblsNFOK
	Kqc9L3oUpDDA0CNJhPnguhKCM36tSzkaj3Ma1Px1UA9wvxxrHSgM9GsIpwxgXVDYSsEeVdTSoK5J9
	FO1P3+Quo7y7vWs7U27tvQsnTBLORNEl2ohxa8QFBdwUF2l7XqjvCpkcGLg4kXf9VchTsShv2CzLx
	90T4Qauu8DzBYTO9H91K4a4bE2n6lJ0Dr4qFflXtlPX1dXNAVMylws6ZCx974WB0kDjJRze5qQ3fI
	4rMA40rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyT-0000000AAX7-2sv6;
	Mon, 12 Oct 2026 10:09:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCyN-0000000AAUO-2NDO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:09:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a16c399641so17499205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799774; x=1792404574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=BTML7tg4Kavq1nYaaspoYIeglXuwT1AgdnwbFEClG3uY/1hgWwK0UqElfeMkLjvTPZ
         STNjp8S2rJ/iwOUensYOH1hqSAGNgNG3kgCir2K+gVfsoGI13LpNvTy60yGMM3ZmmOFT
         dzen4rgOH2vYMh1mTB9LP/omq3IGqcs1IMAi/I0IuhROBJbvGE0bxAIMPHbUpusUN0V3
         7M5Px87/XPirMT44XvHz2xJ3xiyCx61LXyPPJrMsQhy4gTUudJTgh2g2BRY7hjod+lJg
         zjYVTuIfExVQYlNCsdMuTnJ1SQoghj/x9wlJ+GD0pe2Q5ihIZ6hcvoOYyPG+LnBBl9Qw
         2RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799774; x=1792404574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=X7E3/PMnH0d4rKkDFama1qhFIttqnBvMkFcUKfEmiMmzJyHdtdT5wfz7LKDsBogngK
         sIX8hhS8ZM4XJ7+POrj7vOJ60RJaPC5vBwED3YcYRr7vxqxKG0qtSg06lUd9Xjfwf0tm
         Gp0l3MPwIHljSv+m5ADS5Tq/mpnYUblc62Xj2E56dCa88qMI9ibg7FW5kjKIt+2roy5y
         3ZsY/wC0bSoXNWDkQVW3J+ppqpcDi5wgX1Te1u73l2VIYizLmdkVXNEmYy22eNQUHzYG
         VtEAHuYYnR/TKt00f1obclj7SR0L2uNduXUqnxt6y/SZN+plFnf/TtgQGd479JI0xCQC
         yeZg==
X-Forwarded-Encrypted: i=1; AKwUvBwmFYDL9ODBzg38Hw4ooycR13h4oeNebfUvtUed9+2uEbb7x6CAZF4eGW4WFwlT9KVeggx/wnFuwo1WT9lsF/h4@lists.infradead.org
X-Gm-Message-State: AFq9FYKyQXr9WVbAmDb/eOSPF7fPSmdYZki7EixgQANN861STeLjOl6f
	VA0lngZSzARJ1xkG1XsTtQKjfWYhGy/oyysHI4knGNk0fY5mQYRUYiPC
X-Gm-Gg: AYBFou0UDKCIa63XRvr7be35aJyNFx1e0msKQ4sGVj2UWKfkcjnfvFsiTbeZrbTcD13
	K/i+Jdhl1a5/z8BQryWBBlLPaVn74a2BtVXldoB4EDR5p13K77on0Li7Crt1K20DuCbBrzlNagE
	XOcSl7IzdnReTIdvCFGzSVSnm8tla8SnYTvMAiTCTzQWi9QmnDjDtXoo5b6cDQYMd4SUh5XNmU3
	ZJppYuTKV/c9y/SeMjXq2D4sHuJExH2ZbwwxEOnr74ZDF4vc82q/RJnoX58LIiwoLORYvKAI9Td
	lyKXyfib1ImSQr4nS63I74WWUw+BI/Iz7L1xq7L0pz55yhj8DF4NXW23Oxvc5ha106rWFp4kaRQ
	EsMsWCvhsW0sCKmTxg+zQvPpQsEgupHIDnvzvxmUqNvtXZarr2T76f4fTiklzq0gb7jiye3hqAv
	dM8t29gYxq38+YSEQ3ur9wmLn7AzDVECyXGA6BbskgZxMUWgWaIWYzK5Y6VgO8U08dhuXtsB+so
	MsYs5qUutHV37Hw3zJs7qSJUVBbLBOY
X-Received: by 2002:a05:600c:5397:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a18e4a7cacmr168741805e9.25.1791799773645;
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:08 +0100
Message-ID: <20261012100816.331033-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030935_683181_A81008A9 
X-CRM114-Status: GOOD (  12.74  )
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

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0


