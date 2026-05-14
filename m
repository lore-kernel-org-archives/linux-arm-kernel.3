Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37ACCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=; b=3tVCTD+2zhtxDo59q+MiGqz9ba
	BkDCMawpxeKMG0qohPym7ixTcKydpr57SpGK3r3TDDmPwTOwPjZXw4/yzHQmc/Jnc23Jc4b4ibgCP
	AxNbaign6Dzpdzr2ISoD3dJat5EcQZEJl1oVz8B/uZzRznZfaRsfbCkpjZOvfIFiq7iXSnfg8PlFM
	te8nfrI4SELD+pPt75SavDJLV3DDkrglKxGvulEpLz2VDLb3YX2sByZ8TqMtmE2wQhDGB3MsZJU2B
	JqlxGHblW20chQJAfGfmmcl5wOsZsCxNQtlBERPDxF3a2BFxas4o0t6WqVJVYpBuZtXVemAr109SJ
	4eH5bdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAZ-000000051n5-3dO6;
	Thu, 14 May 2026 09:15:51 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAT-000000051iB-01fC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:15:46 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3274425a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750144; x=1779354944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=;
        b=OD6vzB/UvDjEl6okVaWxOLIW8FG9dE33F9JK2hSLFlY9fCJfOsWo3SX+eGAm/ZH7vu
         FDHHrbaJ242b3l+04k5l4dWLrhyZVXSjGS5c4ru2OSUUxS3qNiUPHb94e9xczvE8O+Ha
         eZX4paMprKN4Ds0PwPjz+4KyObdT5flcJjSXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750144; x=1779354944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKKjqJ4FNen/2IxMjocGJwSBRhkQlcYeBL/RLTZpyhY=;
        b=GP5ZrASuhSOh8bk6/sSnarjuu2Wog4PPPEvczCIaw0TwT9WkDT3UQagMg0vxej1hvt
         2otagyuNkCMO4smakxqVjtDWmGAg+AqC/cjvRlUecZp+nvzWAJe2yp8F41A9fHEEUbRz
         FI7XdpQ6gDx9XnABpExG8HV8BglqM7ADi5Zxfy4AVXga8GTA2POTDBNOEsiWN45+7j0W
         PLH98YcwTYbl7ydeGysqpVBN7ac/DfO8pKOyHslH+rKztTRHSB7heO+GwmtmYq1ujgtX
         4jbRD/KVB+A+5Z1pN/wA3OUlMPinbrHKy9dpQD7NBXQH/kZKMgGORz2ZLtpfrlrjxVuI
         1gpA==
X-Forwarded-Encrypted: i=1; AFNElJ8zlBtJr/5z+Du/F8ItKWK7M9qQ6KUOONfGpH0ILJV0dVPlWnk6NwlWLpjOcuFqQSSAbBbJkUC3Lm9c0Mpy6edE@lists.infradead.org
X-Gm-Message-State: AOJu0YwDjjGhLJsHI4Jtl4Jb+iC76YTMKdnzugQecMCky53Gun2WqK52
	sP7iRlpgpU0E8xe/WROgdOqdGi+1ykC0dAgOvdX5M38gH7T+F8prRNBNckBpEmFMtA==
X-Gm-Gg: Acq92OGe3X6FERDxuVD9xoZyI6k0fLmi+r4H5IQGs086gsfdDk9Rbcozu3o6UWxJAe2
	WuImolK0pbgt3I+nliAwoPVnHPZDLjdW4hzZVSLwuLlxXFSCNKzvwrNwV4/V7BPdR1I454lbBbE
	V2UGl/yMTHXDgkMMTGdYASKOlLhpfyw9iJCbOcme47p6bd8Q8RdNHtnJwxTxsXiCQy05KPoM0i8
	5zc9CDwfNqHgEOBvFVl8BYn2klhVrYyFuvjt817E97i7ng8+I9wHYmeXa5+tiB5fxuUYgCAgKH1
	og9gNKCQpqRXUn9fFhYFb0pNli/k30D7cCDy9WqC+armNOQBDWG4qrMiPPXNkdJ+Tf8DBZlDgdG
	78gnfTW2dupexSSE7Mpazuqp1/5RAepvHa3TgRSuy4Qu/IOuqE98v9ZU68PSmWfuZkvJpnSIp3S
	c33mNfyPNjD/1mDa5Exg/P8DWUcqItK3E10Z/GkjVtJ0yf6IuyKI5f29xTD2tF2mCaUDQKOo4w9
	8QPRxaDAIfrsPjNo5o=
X-Received: by 2002:a05:6a20:6a26:b0:39c:4b84:d90f with SMTP id adf61e73a8af0-3afaea365e8mr7445174637.8.1778750144405;
        Thu, 14 May 2026 02:15:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Thu, 14 May 2026 17:15:16 +0800
Message-ID: <20260514091520.2718987-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021545_057244_CA1F7863 
X-CRM114-Status: GOOD (  13.00  )
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

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v3:
- Added ending match to regex for deprecated vcn33_[12]_(bt|wifi) (Sashiko)
- Updated example to use proper vcn33_[12] nodes (Sashiko)
---
 .../bindings/regulator/mt6359-regulator.yaml  | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..e3c20412c8a7 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
@@ -203,13 +212,8 @@ examples:
           regulator-min-microvolt = <900000>;
           regulator-max-microvolt = <1300000>;
         };
-        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
-          regulator-name = "vcn33_1_bt";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
-        mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-          regulator-name = "vcn33_1_wifi";
+        mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1 {
+          regulator-name = "vcn33_1";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
@@ -270,13 +274,8 @@ examples:
           regulator-min-microvolt = <2500000>;
           regulator-max-microvolt = <3300000>;
         };
-        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
-          regulator-name = "vcn33_2_bt";
-          regulator-min-microvolt = <2800000>;
-          regulator-max-microvolt = <3500000>;
-        };
-        mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-          regulator-name = "vcn33_2_wifi";
+        mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2 {
+          regulator-name = "vcn33_2";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <3500000>;
         };
-- 
2.54.0.563.g4f69b47b94-goog


