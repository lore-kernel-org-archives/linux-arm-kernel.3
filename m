Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD12E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5m5kN2c/9wWpkcrILoC2ZFZNTUAnB55ZbrER3I9Ujk=; b=sOkju8HDVuLzEyEjQTgCazKr6r
	vQ2+VfmVNqLXC1BU4EuoLtLZy1n4Mvg+rzKJ64gZ0GekugbHbfZfXhbjgFZwvDXpiDylQvMzPxkSz
	9bsFwJPMg7dnO/qJbJGgsZ0vfJDaJ5ZbhrTuXRCGYwMIXiPWtkLN/AOAmk+xPq+nxfgXafNomjbnj
	IAlsM0DOX0/uUVQkdnOyYexS6c66nPiLYjDZ2M92OSP424FuHX0jtN0NLgKV8t7l27mnjbV76FwB8
	SeLSdTugTP1dGSmxtIZCVv3lhRPcfmRi09sjBE8Ib6idnsO6pcRcgsxTeEt1Zu4QAgFYwr0DCM6vC
	MJdz2ojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPdY-00000008a4M-0fSf;
	Sun, 22 Dec 2024 17:21:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOy-00000008Xt1-3P1P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:06:02 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso5142401a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887159; x=1735491959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5m5kN2c/9wWpkcrILoC2ZFZNTUAnB55ZbrER3I9Ujk=;
        b=fKin8YskDG+5KpLq5+Jm/oI9RHxt9EWw4WUIbje7NTG715YfjTT19+a8pl8I2DG/a+
         pb5+Bgb5MnBCPO1qUqekdaFO+Sdgnj1UUN/B2X5EJP4rlNmHHfinG8X9WOHDS3AzMPcx
         TQAp0FxfMEu4CJxYpoCChvcevay0Doc7kFFOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887159; x=1735491959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5m5kN2c/9wWpkcrILoC2ZFZNTUAnB55ZbrER3I9Ujk=;
        b=o5VrDSYJsWtqQgGIZG0bLHBlCZzGTn9c8LHxtEgn0nx/73iaVWzxbSBIc4yd2jltRU
         ysfdMlqsPa1dwZRyCya62BwWf7DcptTVt6PI49FsVbOO3CPh1P52GG+dtbmSfRmDRAUs
         vednFzO0p5cW8XzMtECACTW6OJ4D/naOqKD6It8XBenJDz95jQ1PFEojHxivGUGFoBYR
         X/p4p+bpmTBi2EdHuUtGxep+lt8zL3pZUth4NFdfwV60kzwYGxbI2C2uu2zOLPifLoui
         cumEz3Rtd+CTXLWHgB/IZiYMS537+aZTaKlYBWedKA2ZFuctcfoAfYfBGkOV+WW6B/Ui
         hRxw==
X-Forwarded-Encrypted: i=1; AJvYcCVYzjQUdFRsvr2yy4B+uV6zq13BwHCZ7dcTmkR32uz9nptzS3ZLdsu4wNVWd5kZbrgKDOm5+e7BtpNijaxVE32j@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy/+d+zLCpisOY/A7DeJWpc8DiIKlENQamgnJR0o2ZewWba38b
	1rltKlzjhq6XKxroenrtIxCMB9leYd9sKNxv3Qg7RiPL5P7VBXXzoxoiKLg+eGU=
X-Gm-Gg: ASbGncsFjpp42DgL5IMqCDAbimaxh+lXuHs7jiDlORrfUCjLSownH9rZg6aOxYJeuXM
	QyEz7zaJV9xqLL3R1MjJxrpnLsDUqNj/XDBpBY/kGamt9mahZwnjFjnpcqnG5f9qbgNF8xjvIy8
	wkw7wULrCn6amWn6IS37iYAQDbq93cKv8AWL+0oCdDiRyYRQCImBNO1cJanSYGJc2KV+RSYfgE2
	0d3Bn+fsTILJkn3Tq2UKGa+hg0zUhT68CEoQowP8PveQZNu/X28xNYHoLBk3ISoxhv2ZLTYJud+
	/hWsbYt83zgVfcxxNXApnyPj+ens4S0yYATRDB21uaBwTg==
X-Google-Smtp-Source: AGHT+IGQ5PR82cMFXIsPEja5Rl1PnbvtKofbUp3RjtQReEYEa0n9aDLlqkOdSSEf7LtARguXmUTwww==
X-Received: by 2002:a05:6402:3714:b0:5d3:f6cb:73e4 with SMTP id 4fb4d7f45d1cf-5d81de1c236mr8514264a12.34.1734887159497;
        Sun, 22 Dec 2024 09:05:59 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v6 12/18] dt-bindings: clock: imx8m-clock: add PLLs
Date: Sun, 22 Dec 2024 18:04:27 +0100
Message-ID: <20241222170534.3621453-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090600_857535_5CCC7E23 
X-CRM114-Status: UNSURE (   9.26  )
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

---

Changes in v6:
- New

 .../bindings/clock/imx8m-clock.yaml           | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..05bc01960045 100644
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
+                 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
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


