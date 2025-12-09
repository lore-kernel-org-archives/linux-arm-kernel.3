Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584EFD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/uimxPOVZnzKfBrHV18SDw/9y+UsMeBXkZvH5M2DDo=; b=wAOYZHmC/wyuyUtojY3CGoz3jR
	BNB5uTdILgLtmDvki2lu8ZNFtCq17lALc1rimdCjUy6C4VkqH9eKc6vdacPoqyMNy9U3wZFmWgFIc
	WKI4ShHmfUEToXNIYrxuM1L0jzleEy6kaXiIru1gJAsywtrfPK0PSB86907iy9Mfs8N98WcxwGpVl
	Bvz8Beuxj3G2XtCfimGlZWieqScgIgGr0lEYhqAOXuTicIE6nN6EtIYNURfV/Z5pgdimxZqcR6AX1
	dIB+gvJM1+mZKm3XceZaoE2mZ2DXedQgOTzdJ0+H8REc48/M+8TDSvhsPmT5vOYfO0jMmNmbu5A3j
	r5XuLn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4M-0000000E2tG-2SsL;
	Tue, 09 Dec 2025 09:31:42 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4J-0000000E2sF-3BZd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:31:41 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34a4079cfaeso978605a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272699; x=1765877499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/uimxPOVZnzKfBrHV18SDw/9y+UsMeBXkZvH5M2DDo=;
        b=ICmxg5TIP56prCfF8/hKwigk+lz4tRg1yPP8Lc3eIIuc8d3V4aP0KW/MdeSn/jWltr
         KMLkuZzgap2bieFiv9Cfh/q0UbuwDLE8SwsyCFkjRgMO8pJFdY9r9iAL//QnlSJMPwbv
         LjhJZRWW/rCxjcYQr51CgV3I+txqZtR5itGWIZv3Ut0c6Ll7iqEpYS1VmcwVOOG/PTly
         ZDasqz2Ulu1CNg/3lAIzFztizNAX35fltv94j6OWilO/AIaMldeIzkyP4ZNUhw6r9+Nw
         z1WCNEx+ceprOWHcmxg2G0cKWzoBNdwlw8oC72ejN+h6ii/N7Les6gOlJsTxyXIoupyB
         ndBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272699; x=1765877499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B/uimxPOVZnzKfBrHV18SDw/9y+UsMeBXkZvH5M2DDo=;
        b=OnNHR9HlrYXY9zufxgxzib4vKONOF5NrBeU6kpocBJ1dGFL1DbzNdBg9gbwWJ1SEj9
         dqYSi5QKUe9yn1+E6EeEtwOY4nIaOMkUbl1LRpkLcojxZoR4TZaiiIQ1vjCTtUqb4p5A
         rnzfH++7xDQA1jNciTy803FXLT7nhVhOtvVkJtXDOrhu3eWMwtDNQax2F8QhNa2uWZq6
         5Mg/qoc9B34Ke6UxvfqBd11PeYibNFOeaDD4LRUbxFL2/eUHfhryJEZw+ipETXPxaaTy
         CTvn06z/Yv7q04/kQgsKwstKNg4eZyxtiVkSXeKpbKl/PnO+PYEPB/VLjANkBVvu+gmQ
         Oa/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvQrZrw2ij9Yi6+HuiEj6RQL5ROtZLSxTW8jPJMA6IFCA1Zke+GIBaoOYkvUaA0aeYW+D/VqSHRTzMkRzcVmJR@lists.infradead.org
X-Gm-Message-State: AOJu0YyFc0DUrdaM/DOQ69xmBlwNFNg81TiL9YVRP+GFUTDFAXNgttDp
	/Fg3JfWmVwIpjl9T4zLvgNorquwhRJPJ+CeMhINV/xLlGSViNF6TW2//
X-Gm-Gg: ASbGncv8JcmxjTmMR/9OsFlBkL+c75kJrVyIL/EH4a6goH8fSoNkhwwBoaoCmol/TPI
	IXCC7pyjWjZOOIpmf+tXhRZx5jvJ/yowYi+E921GnG2o8rUvZ9eH0bCZCuiu87Y5k9tMzDgjSF4
	M3BeakgtFBD3GP1hN4THYLvwnM4xtdnvB6bKEI37VO1DAXm/DRtSLXX3LwMk9Xf2U/NClLHpav7
	3if/suFrXoht8C4ixBunCdvJeGGvK0CapKQcMtn68lhUHYazOMR8wdI8DQtplyWmSfjuc97zKUO
	NNbWwmiDU8YKzSgJ3r2dY+p/i7m4GDBaaD+kAWrBrGlZquu3OEVgHdvE6eJ5HV8dRuK08twauwe
	VcrL7NQka84dr3Ng4uz/wuD/Lkx5Xtw4EeRpNbCX1vvgaDj7u+KY/16AmDejHUp0Od6Yg8wjzMb
	qbfraNT/Rdsam0jUgVEthhKS/MokENAuoOqRQvwFq5Ot7SwJmQT77DWTT+6It/nMjxA13+SX7Hm
	Q6GCieV83QNxHRmycGe/UKxxSV4cohwuhpWZJBltRaZNHYSOyaDvFbUQYzho/EHRyOw2brsGpuI
	9GecfZSH7adpKeyAyjWEZASIDElVmRzSeddKYPDCwfdYLX+Tu+X+7umwqdwQzw==
X-Google-Smtp-Source: AGHT+IHEi2mCBtg0iCmcmf1gH4uYiFRGoKIeFa7PXJa21FQTMXXvhgplPXzOltuWl1u4iFR2Sxk4JA==
X-Received: by 2002:a17:90b:554b:b0:32d:dc3e:5575 with SMTP id 98e67ed59e1d1-349a24cb7f3mr7136131a91.5.1765272698893;
        Tue, 09 Dec 2025 01:31:38 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:38 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:14 +1000
Subject: [PATCH 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3318;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=jnORVtQ7uwoxce9j3Ho2s0Rrsem8arYyTUJQLMiHu/E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7LYrpxfsZcrSnJ+7Q6bp+oLO14/uMazNz1yzc370
 77GbUmN7ZjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEx1whpGhndnbxZPurXd8IHCzimiC5Y+WdvpG2i34hrX7NZu/+B4cS6GvyJca+L
 KH6gmqgcn75+y/fuBnXNuqSw9F1fS7j3x7C12R0YA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013139_809652_CB8ED90A 
X-CRM114-Status: GOOD (  13.71  )
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

This schema was still in plaintext form. Convert to YAML format.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.txt          | 29 ---------------------
 .../bindings/sound/tdm-slot.yaml         | 34 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
deleted file mode 100644
index 4bb513ae62fc..000000000000
--- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-TDM slot:
-
-This specifies audio DAI's TDM slot.
-
-TDM slot properties:
-dai-tdm-slot-num : Number of slots in use.
-dai-tdm-slot-width : Width in bits for each slot.
-dai-tdm-slot-tx-mask : Transmit direction slot mask, optional
-dai-tdm-slot-rx-mask : Receive direction slot mask, optional
-
-For instance:
-	dai-tdm-slot-num = <2>;
-	dai-tdm-slot-width = <8>;
-	dai-tdm-slot-tx-mask = <0 1>;
-	dai-tdm-slot-rx-mask = <1 0>;
-
-And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
-to specify an explicit mapping of the channels and the slots. If it's absent
-the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
-tx and rx masks.
-
-For snd_soc_of_xlate_tdm_slot_mask(), the tx and rx masks will use a 1 bit
-for an active slot as default, and the default active bits are at the LSB of
-the masks.
-
-The explicit masks are given as array of integers, where the first
-number presents bit-0 (LSB), second presents bit-1, etc. Any non zero
-number is considered 1 and 0 is 0. snd_soc_of_xlate_tdm_slot_mask()
-does not do anything, if either mask is set non zero value.
diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
new file mode 100644
index 000000000000..b67844e1dfd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tdm-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Time Division Multiplexing (TDM) Slot Parameters
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+
+select: false
+
+definitions:
+  dai-tdm-slot-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of slots in use
+
+  dai-tdm-slot-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width, in bits, of each slot
+
+  dai-tdm-slot-tx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Transmit direction slot mask. Optional. Drivers may specify an
+      .xlate_tdm_slot_mask() to generate a slot mask dynamically. If neither
+      this property nor a driver-specific function are specified, the default
+      snd_soc_xlate_tdm_slot_mask() function will be used to generate a mask.
+      The first element of the array is slot 0 (LSB). Any nonzero value will be
+      treated as 1.
+
+  dai-tdm-slot-rx-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Receive direction slot mask. Optional. Identical to TX mask.

-- 
2.52.0


