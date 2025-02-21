Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3F6C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=567O03TXl1K2zaFaElzh+NHx2wBNM9WmJYIw4dMoWLI=; b=mynI6EYcDl4V6UTT9T5WnS155D
	0NJtdrQFCZFwNdylMhU+An9TI+ucBsDx85RFCE7zOj2+/gUcSuHtEudTgY2ZeHlRztMVDx6P5vG1L
	vo+VaL5Xu1Vn+5kXR7ntTeUILX3yOVCjt3jHS+GK9URgOfkTEBlTzB65oQnXvtqm2RG0LNKUyhmxr
	F9LJsAki+fzxqs1bLcclheoz9X1k/lyaSFZkaR7vSqIxoSOp7Jkd3ryl6+Rq9EGhXLBgNt/ClgnCW
	dvV2QkpptypbO0sGpSVzfd/767Zg4IoXKeb0qLFANj0L62YX7re8GLr752UAevJ0gv9Cg9Jo3kLYv
	rLKM2r7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYST-00000006cCe-3AP4;
	Fri, 21 Feb 2025 19:13:09 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYPc-00000006bVi-23nV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:10:13 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so3352099a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165011; x=1740769811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=567O03TXl1K2zaFaElzh+NHx2wBNM9WmJYIw4dMoWLI=;
        b=GI/meNPNgU9vTRuQhVDAzYp73oMD5iEba0bVZW6zCjzKNec/0mhAlvHqa57qUYnNIO
         cfydAFS7nzWN1x3P8UVr99goGmDpCDlPdGBiUgmj2Oz3VAJaxmiR3/eLjtkmwOjmXbOE
         Zw17GfrDoIoocljByZ7yheRgg1NuiPAPoN2Hjm3Lby3uYiBNp0mlYLtC041Dwp6lrhgO
         fD2bkf587VIXtj1EF26M7hZPe9+xjHwSffgG3zTm8IbMux2cDicdWl9Na8LJ+boIKKEB
         wfAfR2l6ns02z/myADrI0PikAJHqRdxefvMIJqkaRxTyCH2Z7Ik0gjVlX/Ga02yaijeQ
         LyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165011; x=1740769811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=567O03TXl1K2zaFaElzh+NHx2wBNM9WmJYIw4dMoWLI=;
        b=EJb3shY8BLVbf3/RzX1RjEx4KpBo5Lyn+n2ZonEDD/prOUArwD3i0c3vCBn2mNqgx3
         9fikcHkGDTc3stkgMnBREkFS4FQRwdjhKvBr7ks77sJXEPEYqD6ja+A7+LGfZGf/JSHr
         F8CqMnxveZbi313Gs53QtcIJCV7eR+hg3z3gXapAVpTaRGrm7TiMKgAHS7FnTuUzz+p9
         /B1Az2PmcwXy25j8Cv0wQ9hB0u54oWVJxg6qSGpTpyoWxP3mTzjxVaEm6HkM5c35roMs
         vTFivtkUWYwGO59XCJLDQ5zs3T7+kZZmbGCsZssvF/B61uSAIEprQx7w6mOZfHBdKA91
         XLiA==
X-Forwarded-Encrypted: i=1; AJvYcCXUKrjxcAfed7qm5wJCSst77N+XJG4VtIxxKsLNm7UB86XkraIEuKn8grAW3mGEnNCs0K6xk+g67WjrSlZvdHkT@lists.infradead.org
X-Gm-Message-State: AOJu0YwGIfYyZ1miE3VcyPJxKFL+njWF4jgLTC8cmqVcs12aM+JnLLCq
	4+qyFP7XNNmhjPhqvJrvPyXadYyNUdhP20XQP9IUJZ2/3iz1/h72
X-Gm-Gg: ASbGncsZltKS66UyBcgs3qcF7GZpVzR71FBMASLb3ASp9NTNswmrhUmw122hHAmVc19
	+e9IA3wlruzEmWd/5wftNRM13IlNY62PINDtAnHnINgsiX9YtGD/Y2/XnMryLS15nNTttfBqyai
	dVckdc8ihRMN/hJo1r8FOfeejQ56A+B/E0Oma8Q2Vf4HRN1PQbFH8ykhjvgtc1+WG/BwP8Xuuov
	fb8D6iNru5wfJh/cCNiIiBLIL8+d+DXI4qrtPEl+EhUzGr9ww4ABAm5QCoA/rpkM8FgfHayYPRW
	tqIoNglBJnn7ycESDw6N1DAIJTJIymkSUni+GoND69e+OWenfaB798qSl7c=
X-Google-Smtp-Source: AGHT+IEmPiejRQxTssIcrN88SLF0un2Lky5fZZJX36APFTjfjcJGDZ+uQm2T3CrIR28xRbfsva9TAw==
X-Received: by 2002:a17:906:314c:b0:ab7:ec8b:c642 with SMTP id a640c23a62f3a-abc099e9473mr411947166b.5.1740165010510;
        Fri, 21 Feb 2025 11:10:10 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:10 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: clock: imx8mp: add axi clock
Date: Fri, 21 Feb 2025 14:09:26 -0500
Message-Id: <20250221190929.31469-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111012_530210_D5ED5B94 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AUDIOMIX clock provider takes an additional clock: AUDIO_AXI_CLK_ROOT.

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


