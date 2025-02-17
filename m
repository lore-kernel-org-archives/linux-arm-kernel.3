Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15E0C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrtKLikUl3VDuLA5KThNUpjO2Vam386mSG/zowIweFg=; b=Dh06hjmerEiQjVIABwBmkDFEad
	AazlLD7L6Ep6fgN3cgX5tePd7MgoSaL7Vfzd4sWrv9J7nEgB0mRVk6sKHhd5qehShHQo/WzCnnWT3
	f0WocRJ0p1u+SwDleE1VLdoFg1gIHE/mI15X0O6MFakjJA7Y+V3L6Zd1T1yBF/lnS209Lindptgn/
	fIWPXT6Vt/drGgTgpkjCo9YY6H2VbbmeiTmonzN4GHTYlPc7d0WOw1KgqnuqupCF7gyAZOvdgKGxN
	OTKh0MDCepzF3Dc7TQKpk4keiLGeAg3wYTJscnPICpyGaQJXxfTL1qoP8DvMvMbzG/AYn3lVdugl7
	hZTsP4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5cc-00000005Zfq-2GF4;
	Mon, 17 Feb 2025 18:13:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4UB-00000005NNN-1A5W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 17:00:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so922598466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811645; x=1740416445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrtKLikUl3VDuLA5KThNUpjO2Vam386mSG/zowIweFg=;
        b=h+XSWhyEmAsTNd9fH1E0mz5nn3JBiO9fsBPtALouwKUSBHWYcduiDThZ7qVqcBYU+8
         PFTxkjMDkgN7t41jZvxrYSdaMlz3Psl54c254vNrE3lIWGafJqeVahvVGhgoADg4YJp6
         03SohTXoc+CoskChvHNWRcRuwnkLVGG0AjpBnjk7nqtgNq6PvOaFPU1CQgI47jQJ7ZNH
         S7yyV/CXvCeDDDAtsBlWm7X94H0DonDLppDQTIdWygyr8B7pBP4zHJSMgdxKOLvxmjep
         07ufWA4c5Gw6XhC7B2MEUoeGCY59GjEJTUhkgTZ7bdWZ83tsta+PONiRqYlRMaYmKl9U
         qZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811645; x=1740416445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrtKLikUl3VDuLA5KThNUpjO2Vam386mSG/zowIweFg=;
        b=k3WmDE9cc0hnu3WpjbKPtTKlvm2sxs9AS2qt6g0606Bp0A4384VPu2Kq5/hLNyfvX9
         LydNfB0M0zpFt4nn8h2uTpZhx+Lwcgpa0EUXjxB9omKVmwOpRLD9H7jxc+iF+7a1jgbv
         fy1E3AN7dcJel0CDf5VzK9iVh4i3jjxGGZ1x5JtDOk5jREYW1LsGx5Wv0jds5LzIBanu
         hz4azXhdkAypwRtU/RXLRBmSxVVuCnWwvuVKFQGp6sxNpywqmPAXQeGaslwbKityDNe4
         TJONRPhWwuOIojnaIf++e85KMYdS7g6qM3zkitSud4n6R5e2NvclR6Xpnkq1eRePNJTK
         RRTg==
X-Forwarded-Encrypted: i=1; AJvYcCXMFFwrfXjv8Z85Jnva6jhFW7Jqw8U3GsyHCQznJrJiGuHm6VB8GWvq7Uw9BG5aw0HTmTuH+tWZdcEJt1ZLYyM8@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ7SXnB+0oxxgQ8NeceNsKoQo/5Lk86sYSmwvJJRzT0B3PqQ3H
	pD+DyDgIJhetcX/pCf9wM9Oflg8sc4JArLIilQPBjStEM87dGI+U
X-Gm-Gg: ASbGncs4VxQIs4SQRTjIVftSzI71Tb7YBRAtqpF+agDiMQ/2R1jZfFYx498MyyJIxAu
	a3F5G4FyQ7WArmvVsBSrS9mfWhIL9r/BU2JMRMDalTxLoRYjDjpwuackzKN5p7cYF4MzlOd6gKs
	8FQPj6Dj18xsKBYtatmtVrx4dpOxg5RlIrFyIaXiP2JY/rUKgaC5vjQfpP4XauaLNUI9aSj1AHn
	0rWzn3kOJl0lAGw34GEqgbgJceioNDZRcCHyfVn9gvD/lwzwDDa3Px/iY8QPR0UjqjktlKWupRL
	Pr2yq4gZkpahJo/n1fRfz0o8c8yBWAx9kYrAuNmOM5dpO8y/ph0y5A==
X-Google-Smtp-Source: AGHT+IEy3WVBYS5bkjMmOdhylnIW18miMxAnn6ezvqexWBHLNRb3AIqDu2C8ZCsKXA+RyQX3qUnCaQ==
X-Received: by 2002:a17:906:379a:b0:abb:aef3:6052 with SMTP id a640c23a62f3a-abbaef36608mr148178766b.55.1739811645248;
        Mon, 17 Feb 2025 09:00:45 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:44 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: imx8mp: add axi clock
Date: Mon, 17 Feb 2025 11:57:15 -0500
Message-Id: <20250217165718.74619-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_090047_313285_3AB676A9 
X-CRM114-Status: GOOD (  10.18  )
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

The AUDIOMIX clock provider takes an additional clock: AUDIO_AXI_CLK_ROOT.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
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


