Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=; b=H04Ev28hEqs7MdLo9I9M72wueW
	D2Az6ab7woDblUgv6sNdSy0HCE2kPFBGfhmndLIiljHp9IcW5EpP8il2U4XqH3oydxZlmbeoxSuxG
	vyEUbBY8iLL2/we/yodZzvQPc/CIXkeH68B/B6xffKTbESxCkgiezVUK9xzbn+9XBe4+1wyE8wOGq
	xzMhcbT38kXD4Dgz/lTALPfvAnWZs7BwadQkZpTY+Iqi+/llf/6ePY3plIqPAaBZAtzxFNNT49yGx
	X6wi94E+rtUimZD1Jp0V/7TW+GVx79apuWRx/7MTAQNiCeAGaSK9TkXsh31dT/o/nsG2bLNNdJUGP
	70i0YC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgt-0000000C1sR-25Xf;
	Mon, 06 Jul 2026 09:32:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgm-0000000C1pa-2Smq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso19239855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330351; x=1783935151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=aB+qK2IttH46GunXoUDWFBDB2LvJgDpdVPj5W0q1+OyIu/y+i6+t2gXzA1CW7d4Q79
         g54pw0a+Cz/17PvVyOHlknV/2QGG2mKpzHJaWnq+t+mNePak3J+yXjFekj79I24/ABFm
         EbkeNQsEV7NyORtEV0iiIMHj+p8umZyBYshIWUdtkud2TM5X/unaQ0ZkpHZ5Sn+d+tvO
         506I408Mcvoh03hYEd6c9N6ArYj1Gf1j4iVw3RChiL0ozhc0EX5RSKnLHkRKX69LQb/n
         JPTWsUwhbRXworSQqLJuOgv8vEe5c6xVhY80Gv0tCRLAa66j+1Wyvl/ggAX3fF2A+vhv
         xDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330351; x=1783935151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHNoM5YOqmuEFsBCD4vOioHygdVjHI2mw0dlIWWfPx0=;
        b=H+ffEKWq6KogqDaEyJv7gfVdZVqdka6y6A5dR8MwzowA6dpIl5Fsi/08RrG6etkVPj
         0r/yNCyKwwkX14vSJ1nUEoDKNMnLs+yR8qW0HHNFnfzkwyc0rWBi4dh2/UiEAhPZMhFP
         BQzm2fIMpT2sSr3sbaS+5tTQY8TOIennknNrgduVPTJhRHWmZzg9EzLS6UuspMDjrh4R
         7hwGZfNh9KZoOrxqeyRjP925rCDXriR3G7PSKRpWakZP3gMerQ3ujxo1SZOsRblF+G57
         oXJMF76LLxr+7yLcailNUAJIu5r9GzrS+VvuDgxTz7ABB4v/f6/kdWi/zG5urHyAfYzb
         UP/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr17G+gxXc8xeQA5QknGT21/cxlrnIwavhkQtMZWskn4HKVXrX5ulZplGtAv2uR8JqA83gcxczVsmiYkHWFyizt@lists.infradead.org
X-Gm-Message-State: AOJu0YyqQ35DtRSEazBblNZauIIZTzHzRa1Fi8Fb0r3PH33Ff7Df6CVW
	AvZvyflybf74CSqL6RKTNFEPamq1DjuwNasltqZJB4nirzpQovTs0Gljm++DWLyJIL0=
X-Gm-Gg: AfdE7cnsksm+zNNW9z1226F2rb6QlbfoEoosQ9vWN5FHLShpUqVMj7Rj1DvC0ZW3VKw
	htXCE4rWuAe1Pw33MxpdLzrsN5nJ36AnH0UhBRL4a72bLPkF0p6RqEns8bbYDgtHXj98XfeXKoa
	pFNyr2q7PUbsTqxIWvRXyyAF2vqtrOi1fuodINElkYfBs7MoLE25XdSp6fJTMojQnQ2wD7apZ4l
	G4LBg1pfgw5TeNcxNgImx1IUR0NpDvJVyCS/dijpaGyLtbmZkXgYUgI67ELB8jfdWWcrbHZ00nm
	AFGio8uQ275tIRpUhPDN2c+mo+un3V/lXRpZddG4NvcDQqluiaAWG3y4K1U7sR49OOW4dX/LbqM
	hyS/JaKipocgD29ijYDCIxcXs+gAgum6KurxRl8fEDLVue2aJPpKWtxMCZaVxSWeCxvlwjJ0bSn
	Ybt+TI2g2CMQc=
X-Received: by 2002:a05:600c:524a:b0:493:bcba:3d5f with SMTP id 5b1f17b1804b1-493d11d7fecmr118661335e9.13.1783330348753;
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm20505835f8f.34.2026.07.06.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:09 +0200
Subject: [PATCH v4 1/9] dt-bindings: rtc: sun6i: no clock-output-names on
 h616/r329
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-1-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=WTrYWpPBbp5/IQCt79i6cOc1+cJ+5cUXj7Xxnm4AgUM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YgZ1kmVhbAFJg++nhyvscPyVSYf6qHpsfzf
 Q5jILv6M+OJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IAAKCRDm/A8cN/La
 hS2yD/9JC6LOTzoSad/DXBsiHV19K0GF3iopYtiTD2yka1JwfFAt56fW4Ql6js+tCDHjIR/8dNl
 ZCcQ37QX7+/ncxfGw35t5noFVL4eEv+HD0mAHkuiruSHXdtTQcc3TtTCtFdxRdg0WfjEIPUjCVl
 ecRZ3eMUxmbWUPEsSh6keNgpfZbmb+fow923az1r05IuTJZPvHCrp+h7kMHfAUfQv3jBW+Jitn2
 z1mXPL3Gp3GYRKAlruc7+fiwvN2dTZyzAH3v1Yzz+fLxz37C+XyK0djx/bbXdr1fLifB5rkCDSB
 14rD40d8cmUaKNROMLYfXMRTclaPfpxDyXldQLSn+0monEBssPO/tacKg32NUKJZ60Pc6oEKfYc
 tYxLDc0BE6z5jWxIC77CfkVuWwZULNDFT2BJPAKuj71gyThxusvr9rMIHlRu80ZFQY1xnZnOv52
 PBXVB9zZvmQkdbA7vZPwVVF7Rokh16UAHovkwZe+qOU99rQlDp+VaJSqXqYYqvxZTl4YE9Yf3N2
 AHiykcCHHT5HwgOsR/UlVThdLgH3dAvBJVF+7dnb+/e6T46AhEnI8WmeR66G8k+XgfXFh2ot6Lz
 wxebV68uC56VToYtAcrpAYtv9FpCPDy3HxCM8xErN232vbr9iAZPYICXQbCYACoOJTgIwdI/WY5
 /pSukiBC+wiN44Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023232_648778_44D5AFD3 
X-CRM114-Status: GOOD (  10.07  )
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

On h616 and r329 chips, clock output names are never defined through DT and
are not meant to be. Just disallow the property for those chips.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.org
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 9df5cdb6f63f..959a012c626f 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -175,6 +175,18 @@ allOf:
         interrupts:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-rtc
+              - allwinner,sun50i-r329-rtc
+
+    then:
+      properties:
+        clock-output-names: false
+
 required:
   - "#clock-cells"
   - compatible

-- 
2.47.3


