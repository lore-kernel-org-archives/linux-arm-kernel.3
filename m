Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D83FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=; b=ZOXcZTinbBlX9USo7esTUmxDkF
	nTvAV5kH66yfxeojWxd8jnN2I7TZI/fnJJUAIIahRvZ+EhNoU/WarujKLY1E4tcBgOSIiPVZJwJdq
	TijGkOBsOTETLxOb2tFRw4NSBCYkePAWj6GdUIQiGaBaHrnGxuY0DDYvJflN0JLqNNyowzmj+LvkJ
	aWAT/KVPSbqL3kD/rLsh3vHX2uZVmvOP29eNaAFtoLf86QzTlwp3Wu3ay8p7xHN0uTmbw9N/XoVJd
	puIsFqGuN2O0hqS0wewYeI/cFEq4mhtc/9LZDgwHOLcjZpZKZB22KooU8XZ8024nrxvHs5GdrQYV/
	AE2jBKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRus3-00000003YBY-2xve;
	Sun, 29 Dec 2024 15:06:23 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRud3-00000003W0Z-1QAw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:54 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so12077652a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483851; x=1736088651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=DqrDudkdm2O61ktsLPAd6PpwKXLchV6H3rjHkRmR7Au9k1UV7KSWcDP4k1cCxJKgOm
         a1OcumzCc9E51DD8QtPQiY0Yu281+lgdxYVJt3OgQ8jMurXfbMlWwq4IpPN2hVZztgsB
         ydrR20vA0BlLGHRMM3ZQJcHtRf85wPM7fu0vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483851; x=1736088651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjwlhaAOkrwwhyUyrS6nha6mqO5aPDlQoHWfonPTSAw=;
        b=ow24XlJRta8dP6vwp00neJfd9a0Dm6ZtbhUDv6dL5RVvHybjF9dATD+n44h0SfndBy
         usPxYOxCjtKNk73JbVejUsWb28DB5b67j168mEUNQvOmfKjjgetNylFLdkriHhtNSjze
         uVe4KXNgCEHL3rkEbdu/SrnBZ2E7VnAB7BPVSPb+bAOLvhG4/ngY1MLxlJUSDzIZY92W
         +WUEO9dOa24v7ZkeEBIdNWMiKp60RD6L033VL+jqObafvMOPjZ8MQdjqADhQf7MObNL2
         +8uGQXlbo2u0pHejOxLHqG6iKu5OjSUn/qFKR8bFQa3DUUHLWpn1gzhAe1fRGnWgYfb5
         6PyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXavZaem2rFK7y8Xosip7vxs0oTV7EShZukLMApev7vvBJLDUtGsxLTguu6o15ijmvbIJe4engjfxT71Ne5/dlB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1hcIWqbkv00ehsRyGU+phQ+BNVMyyg40HF0tQP+OsZESvDC9g
	9bZPH6kIoxJXNOgPykjch8oUovaWDOgu8jiYsg5UwCj5I41coaNf/ibMukooEn0=
X-Gm-Gg: ASbGncuc8NfNcPhn92rFRrJk0MkCrQVg4TE3HaJlTqk+PC2gp6nohWQ+fL4dmXhxT1I
	c5TRa7hVnNDQrsNkEPKrvqsuzOdH0vz4px9owuMYeuUjgmCGAWRBdZVQw6amXyF3TQyul2VEiav
	371u4z640RIhaEZWLdunWFD5IkTbI6+SCQfNTa4LCDc4tuwZV4V59pAWgsAlajGUiPzVJD6GuDK
	ar1pCZl9jLRlC0/4C/a73MqvpgTGUOdK885dnOawHzdAUm7A5E42erHZRm0sq1GYWExynW1jvVV
	FYCUYyvtzAnhA4ZOzACsGQ==
X-Google-Smtp-Source: AGHT+IFxgItt54HHYH/8mA88WaD38CQ9mOKSbKko/RvuXIeFzD1DAkYznBzK7j3ZQqQYmVzmFb1k8A==
X-Received: by 2002:a17:906:6a15:b0:aab:d8e4:2062 with SMTP id a640c23a62f3a-aac3366b549mr2566530166b.56.1735483851580;
        Sun, 29 Dec 2024 06:50:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v8 12/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sun, 29 Dec 2024 15:49:36 +0100
Message-ID: <20241229145027.3984542-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065053_387927_46897E08 
X-CRM114-Status: UNSURE (   9.21  )
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

Though adding the PLLs to clocks and clock-names properties will break
the ABI, it is required to accurately describe the hardware. Indeed,
the Clock Control Module (CCM) receives clocks from the PLLs and
oscillators and generates clocks for on-chip peripherals.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..d96570bf60dc 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -29,12 +29,12 @@ properties:
     maxItems: 2
 
   clocks:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   clock-names:
-    minItems: 6
-    maxItems: 7
+    minItems: 7
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -86,6 +86,10 @@ allOf:
             - description: ext2 clock input
             - description: ext3 clock input
             - description: ext4 clock input
+            - description: audio1 PLL input
+            - description: audio2 PLL input
+            - description: dram PLL input
+            - description: video PLL input
 
         clock-names:
           items:
@@ -95,20 +99,31 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+            - const: audio_pll1
+            - const: audio_pll2
+            - const: dram_pll
+            - const: video_pll
 
 additionalProperties: false
 
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
         #clock-cells = <1>;
         clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-                 <&clk_ext3>, <&clk_ext4>;
+                 <&clk_ext3>, <&clk_ext4>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+                 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+                 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-                      "clk_ext3", "clk_ext4";
+                      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+                      "dram_pll", "video_pll";
     };
 
   - |
-- 
2.43.0


