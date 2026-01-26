Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AF1D13C27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a8Ed9B2Mg4RdZUumF2drNSJLLH5FmhhUmHLfuibnFg=; b=cIduoDzr6asa0qfy8YCU91uVyw
	7FslOQHxXcUHL3LeM5eOY7CIKO+w4nJ02dQLwCw553gDYhWhuKxZYE4C75p1++giKvrZmEaZbPIbV
	ATokvZUe/PaqOYx2HPDTL5Vk/jQvF2esv5GgZZ8XMWISsYVswudBtWxinwqV6xMy/RF1PyACLS/Rn
	ixxL5McO4VaAvmMXtrH9VHp+31z2aImMwKHiIkvpAuGcYhDgLf5vdD2Kaoksbqu9tNe2UAnAVdsPc
	OEFPNFwNDclnbYvhKFi29whIjkr9M+t7j2mIDrPXRaXhB73ju4OtSLzi/cJYURV5tYZaqLh58Uf6v
	FITh4Jzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO18-0000000CjLJ-0Xhx;
	Mon, 26 Jan 2026 14:56:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkO13-0000000CjJJ-1njO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 14:56:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so48463355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 06:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439391; x=1770044191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a8Ed9B2Mg4RdZUumF2drNSJLLH5FmhhUmHLfuibnFg=;
        b=gW8Rr7/SzaZbCLPYqh3hiGHuOA6cjaf6+TrHTAIiV7yzxjHQt2LJQT2EBbSGKwm3ma
         7FPSkVZZaDk/1TLbpwlUi3YuqWHSA3SpsUm+Wptjt07xBZNOT7bV1L6Fn8EzaJ/HquTw
         F7V704GjneLebcPRHO5+hmuTT1Bxi4bCx8Ie4JbjEMkg5xj/DGItfP0UuV/Hbz1PxLIR
         3d46w+CEFniRf3XNgBc/J7mXP6AhFyoO2w0GQjjqojpXiKUTiu8hxBggRhF3y6a9am8J
         /VTqrJoWbawEtL8yFhmfzQQWpcdMhLWvUwmqtniBxXMZrVkb2wc/zeF4RNFlk3zs4Tsa
         QlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439391; x=1770044191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2a8Ed9B2Mg4RdZUumF2drNSJLLH5FmhhUmHLfuibnFg=;
        b=uzDCTiNh9KKRjl0aJkKtcoL7ZbVLeW0EWm4fU81VM7u1NdKOu3Vj0zM/ylqB6EUID+
         QFCk125oA18pxqIK7/aaY0qxHurgWqfLpAA7I1WqRXczxkVNeV+z0ammdIjiLu6sauKn
         iXcY0KQ/KQJCRZqo8N1iJBuWUVcE3XweOnjQhWsufRacKc39Sw8VGJ9XlGIaba55hC9t
         JZ770wNFsj2a8uxPena5mGLKW/jw7ZI+kBl7m3ELy83GleBBhpTZCTBQP3NSrue4k4tr
         2BtaTISnWYluRCCQIRxV1rheLgL8RtCf/bFiBOLR3p5ncn79PhToVup5NqjKTIM3b20U
         2QXw==
X-Forwarded-Encrypted: i=1; AJvYcCUMKtUkashfkdlU/EEXO+eUiRKVh+JjzZ+NsZezhvQlvXJ63nuc8OhRVCu8Thq3XIQxkFU/UVBLXVLxrg8zZ3Fg@lists.infradead.org
X-Gm-Message-State: AOJu0YxgCbB6X41HiOYApICpiAkz25LhlzVm3qw7j0Qg6LUvMXmdDvOW
	M10MQYpL0tWiZOTU3TC6Mk6vwAWvcHeOwaDyyviq76qtODZtG7yAbRNE
X-Gm-Gg: AZuq6aKsGAh8ML4TTdIsGgg7qpXGI+73Ti3AkLr0PY/kJGVO+8y7JsxrdHsyofZg09X
	omNgcjYigUMnP1R1boVFj2rSxiUuIxv7onslNPqMp6vE7p/e9b4/qlGqAd3K2y0rpoy9CkbR5F5
	FufWTD+sMREDncru9C0+wxsyh736srHIQTEae85BhaV5Jdo27eQNkezIfwz/4wdd9nrHSXcCdgJ
	LXOTBYk95DrvCn/kj8XtMVzAYTqTyAtqfYVS2wUn/Uc8Bh+yV5IA8wA7fqTwDBNbyvwX840bHGH
	PQ8/By8YciQl8VXpqkpE0h0vDnPJjA483VTgdJqjeTFtbgkEI/vEMNKp7v8yg6b2Na7m4lbvJw+
	gYu3dpIsxOMH8sJiPc36jkapTwVNliitfdA2Al6l9m5Du2Hf4Qr9H2ZyRS5++x80zxnTdZ5sPZp
	reO0hqu5LHrgH3ZYWasV1vcBTvBk9ZYuml3bICR+enTsu2zRy4
X-Received: by 2002:a05:600c:3113:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-480650f2933mr20236615e9.10.1769439391388;
        Mon, 26 Jan 2026 06:56:31 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:31 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
Date: Mon, 26 Jan 2026 06:55:36 -0800
Message-ID: <20260126145537.2301-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_065633_487345_E3EDD591 
X-CRM114-Status: GOOD (  11.83  )
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

For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
the SM coprocessor. Thus, GPR is transparent to the software and does not
need to be described in the devicetree. Make it optional.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 1415247c92c8..bcc265a742c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -63,6 +63,16 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6sx-mqs
+              - fsl,imx93-mqs
+    then:
+      required:
+        - gpr
   - if:
       properties:
         compatible:
@@ -91,8 +101,6 @@ allOf:
         clock-names:
           items:
             - const: mclk
-      required:
-        - gpr
 
 unevaluatedProperties: false
 
-- 
2.43.0


