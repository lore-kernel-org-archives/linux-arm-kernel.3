Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16A2E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D27zsP+xnLWGVrxLHgK+E6loU9nNNR60aUGojpIfAP0=; b=vWHv7YWvpPRVZkRySg2nw/ZzSR
	DVylPXl6BO62PJHmnrjM0t4lZkoFPDh6Lhh+dsYjGcYO13JbELE9cYQKUEdJIdz7zQJUjYbcGfqGZ
	HkSTdHc3PfmVDAtsgwMoMTC/L2/3xM5KM2BVlQg3s24ARPchnYQhi/tpUJ60s4U6snjwV4A09/WJx
	DPuyDi6+4MKH1PG5+XGAixUPYKq/ws1X63u4gN2rXSA1t5zDX7p2IW6Kdy3+fTuyABsMU94Otyktk
	dC4O19KyuvlTa+Z6iGGGezUBda5nf2Ux7q0zFSmVbV32D8n9DID3at8jmU7M8devA8D8R9XTl0+2y
	8mVJXeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPi8-00000008acC-0PuD;
	Sun, 22 Dec 2024 17:25:48 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPP6-00000008Xvb-03gz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:06:09 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d7e527becaso5443382a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887166; x=1735491966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D27zsP+xnLWGVrxLHgK+E6loU9nNNR60aUGojpIfAP0=;
        b=MWzOkfkytopeqaKUmeRBnoFNQUfxgIw/dJSPKmOdukfPyUymLtn/9AzXTpDWOZmiRV
         k/dCPR11hz/AdRNWpjYzneLhDREDx8cJQkQ4Ia5CUbHShvGMt2FbEpgj4IBOj10NUkGY
         Q+UpMpMDQbSKUm9/cEpKydIhK4KxVOdoZQ8PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887166; x=1735491966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D27zsP+xnLWGVrxLHgK+E6loU9nNNR60aUGojpIfAP0=;
        b=TfIxu+p+ShPqXH83lljVd6YAyrw+Inrrza9ZyvtN+y1YoR5qoH8Aj+lNkqiPi4/iqa
         Db3QQfeKwKF9AS4zwIaKQoTkFiKMD7ACu6kXO3vZxiXXvk5gFNIuNfIdeY1mBEN/kMk+
         OBt1fKHoz9ABBhohL2/ek0JK2gZaqy75EDdu53Z0I4MWgkYIMrQ9U/2xJ+gIRwOQEbkI
         fty7NKG2JBv93ov6ofDDtvaO5hxLsSJ1XrDDUtay6GrEKXIwLuP4aRF75QNUSwBditGS
         UsvdThvTj7AWXAzQPYs2FZuCp50jxulVJOrrkdhkZx72d8t+znvw4TtZ3wteO/ZUGnBu
         cKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkupqyD7CDQbAE5CwSHnDGQ6vTIilOU4g1f8RtmLAaDnLvUbEy1X77zQQ/OdCcEP+vPAHsxzt9hFvhxGq/PEY5@lists.infradead.org
X-Gm-Message-State: AOJu0YxgRQFQa0hLBoI1VnskYRoeKEjEsfI92RwIFwstmQXmKjc3dxV6
	I0LYAbChgX33o4/I+DD6Hd5Bu+/soq1nwQ79cZ9lPAMOLwhrNvIQt5+taP0LRhw=
X-Gm-Gg: ASbGnctjGma91h1JGGR2Q60bmtqYWIW0PIot00rnpebTvx4RWURlXdZZyjmmGg6FO7g
	vDvUva6Ro7h1ermYSDg9MlkX76C7hSlOr5sgTx+6YL/MPBWUAFvAAj5qH6AlvwG3scOjnVQihDs
	+mimNltZZN5XXMbomO4/LLL3XI/LWWhQbLUHklQRojaCgnDJTvDNRRduX+NrWje09GMz9ooK9LW
	iA4/RLTak1SV26wqC40J84ipBoZSmECHv3P7UNQKM8uWUjV/cDYNl+sCJTveIS/RR81Snfvnp25
	DQkRJiPNnPgQxTAFaarvmclMUGlVNHNxEYp6wWzZuz59LA==
X-Google-Smtp-Source: AGHT+IGcYyO/2OQzc2CMhKzJEpw1eb8IeHSQcUz4cGsgJFNDVKrwWV2cnf1BfIdXqT/0W4OuaXsQKA==
X-Received: by 2002:a05:6402:348d:b0:5d4:55e:f99e with SMTP id 4fb4d7f45d1cf-5d81ddc09abmr22317161a12.18.1734887166231;
        Sun, 22 Dec 2024 09:06:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:05 -0800 (PST)
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
Subject: [PATCH v6 16/18] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Sun, 22 Dec 2024 18:04:31 +0100
Message-ID: <20241222170534.3621453-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090608_054051_5B56773F 
X-CRM114-Status: GOOD (  15.17  )
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation can be applied specifically to the PLLs.

The "" value for the fsl,ssc-method property is specifically intended to
specify a "no SSC" case, as in the example, when you don't want to
configure spread spectrum for one of the PLLs, thus avoiding the use of
a method that would only make sense if SSC were being set.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Improve the commit message
- change minItems from 7 to 1 for all the ssc properties added
- change maxItems from 10 to 4 for alle the ssc properties added
- update the DTS example

Changes in v4:
- Drop "fsl,ssc-clocks" property. The other added properties now refer
  to the clock list.
- Updated minItems and maxItems of
  - clocks
  - clock-names
  - fsl,ssc-modfreq-hz
  - fsl,ssc-modrate-percent
  - fsl,ssc-modmethod
- Updated the dts examples

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 .../bindings/clock/imx8m-clock.yaml           | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 05bc01960045..37cc6a6e89d4 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,37 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
+      dram_pll and video_pll).
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
+      dram_pll and video_pll).
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      The modulation techniques for each clock supporting spread
+      spectrum (i. e. audio_pll1, audio_pll2, dram_pll and
+      video_pll).
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - ""
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -76,6 +107,10 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -124,6 +159,9 @@ examples:
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
                       "dram_pll", "video_pll";
+        fsl,ssc-modfreq-hz = <6818>, <0>, <0>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <0>, <0>, <7>;
+        fsl,ssc-modmethod = "down-spread", "", "", "center-spread";
     };
 
   - |
-- 
2.43.0


