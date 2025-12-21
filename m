Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA35FE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFOikY9o36gvsPAMhtc9DtXREspO4Xxm21xH4vlh1IU=; b=AbKb8PePoS4yXkJoujEm6SkfmE
	3p80zI4/4zLsAr92cMvEAJ1+9hV4vTWeUZ9H+zOXWwpqmMUs4mC+1KhPojlwRJhNot5zpY1Idnl5y
	3HPH8rQavRA+HC3rk+wUEWexERwpb/cY8v9I7DlrMlOppd40bGYoYQUh3uttxAxzgGTZrI3UiIfIb
	cdCo88QUanRv3ACRnZL27EM13mCT1jabeBwRJKkNjXF42O5FlisUMDh53K61sMq0EH1InMlYmTg1f
	RMwUSwDQahcYwG9QZHbmbPm2vKJbRbDMgFniKNXI9S1wWOH6UtYMdFdwBy9LPUseiR+iADQxqDpay
	gBq4B/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFri-0000000CHrf-2emK;
	Sun, 21 Dec 2025 09:36:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFrf-0000000CHqv-3fHP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:36:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a1022dda33so25293255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309795; x=1766914595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFOikY9o36gvsPAMhtc9DtXREspO4Xxm21xH4vlh1IU=;
        b=hgnBYa0TrvCGwAoPtNghbvCcP9Hxdy6Oa0Us6T0V25nbtfVKiufizHdUc7B8GllJh0
         xkM2ObdzYOr3LDH0wq6YA71XsH2q7+9l16kOr4KQWBHgQhPsE6rwOTpkJWD/uvqaKOok
         K8HxadE1LxuuZNbVmP9Sdc+03w8xr5I83XsFw19RbEpMnJIcNpcandclv3gRaa6J0Tiu
         HoR51yRg6WRFERTLfEC91D/iF1wuQNodQtujaIPtjNZ1qiyRH2mctLh5bx6Lyyto79ys
         plFG8nlakUnqs6hdDc24pqmiqR/erOqvbuxWJFgGqEZ2eLOogz2Iz6gakDpQp4eGu1AM
         E3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309795; x=1766914595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFOikY9o36gvsPAMhtc9DtXREspO4Xxm21xH4vlh1IU=;
        b=Kb3Y2ogZ275zsB+9mePTG0+SYGWxj3TOLwJ/Ym2RexRHrEEW1IEXcCOlmAGu5Vn9T/
         KPPj6pee0MgHlONzwdYwl7P2ce/XiNKtNlnHeDONhOZ8avgsiK92qeDxYosjno2ClfOg
         09N7TMOu/2EdVkhBCn7hC5bA1NU30cDbtQZ6bS/A8NPxm1MqHCqwp3npmBT/yNoB6mqH
         Dj05VUaR8IRW23fa3+ep96SBNQE+eUxSzMg5pi+gi+EfGawXcwBIp4ndaqTvExaioFFs
         AeWpdkftosaGsKpEFWCWxfoOOp3PHHFMVmPpRrZGQRLTtelDSS5aKDUF9eVQfNRZQ1rF
         4YPA==
X-Forwarded-Encrypted: i=1; AJvYcCV/XK4f2goxe8i4bIS9B3sXntrebL/6GDZFo63X6s+IF84B7jJcEsSJGwrB0QQwNA4aOdIYv9Kn1kuvKgEGS5kT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0yXSHd2qYPu+++f5MMTI3FCros2OVx/gcsGvIawYYApedqRoS
	jQO3rH+wnZFFrBcJ7Odz/lUBGaX9LNL9cYkRyOtuzaY7EPyEFtTRCMuh
X-Gm-Gg: AY/fxX7RS0lt8jdBAkcYuKOEZAJPZh72NsWIAWn/dRv5e2xad2OtB0MhLmNk65Pbhdb
	TKqA5Z5Guow/1InN9gTATHyBp0vhbXyY3+CSQyxUNHqlksopOCF31HkYAWrm661OmQbZzuSvtZ9
	EZXsFeKiMDpH9RQu93IGnBpnEyMmFKaP986eOaVpH7ED2l4B2EZujHZ6LtMCSJNGVHVUm0ATaxN
	2AnNf/gf04iPpXCSVopbah7ESvRsYu0tsNJjpI4sXa/+RKKiSA58rCDMaPx83x3/kprh21bL6aF
	M/vCAZM32oCA9XcnCa1YZRNKKyPsAhzWbNmUb1Drzq/vyGqY/+VN9FHDEjWOMoVuzhRHrgbyxBF
	jtRFyRuWw8odqzMPgd5aM3+VR2WuDq6p3y0zi+kQQWj10GwietxCABy3C4sUE5BazDEixU3U8kp
	IOcISZLJttO0fxmhnNLOnH0N4vxoN5sy+retVIkL1RH0PGbLsmO5M+VOU0+DPK0v76ZinoCbMiW
	qQh8bjLdOR/52aUWyy8pqkZeGasj+mzjRNezXuNPt+H1/QKWYh8OFZgMQzAf9xhIU/0gKa2tcCP
	RRJWW9CQfV8n3LXZmeX3PmyauygH1YHjeDivuXDOAObP7mQDebY=
X-Google-Smtp-Source: AGHT+IFs8ZLMfIE3d3XHgVfBBRp9N/Xz/7Q3Yciu4Zx1KzdlptYhBCkrmMcDSDnGkifXqXR+tynCEQ==
X-Received: by 2002:a17:902:d2c4:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a2f1f789ffmr84830365ad.0.1766309794882;
        Sun, 21 Dec 2025 01:36:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:34 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:57 +1000
Subject: [PATCH v2 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-1-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=wLNKDK1Ksa8IvBF9PuBpNgl2cqbJ5Zaav5WKCmNUHgQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+ycZpng++NQindbr/C9KSs30ZOAJX/aXPs5dTfV8S
 bnH2e91TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApjqiieEn4xTv9YWv4p0dmxtFL/Bt7eC45cV1atOedhmG6OuVur9jGBlO7/aRtj8
 5tYbbamVp7TlGR8O5y6pl6xu5+yY5LPznK8MHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013635_928604_26D6C1F8 
X-CRM114-Status: GOOD (  13.17  )
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
 .../bindings/sound/tdm-slot.txt          | 29 ---------------
 .../bindings/sound/tdm-slot.yaml         | 49 +++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 29 deletions(-)

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
index 000000000000..5bc46048d689
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,49 @@
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
+$defs:
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
+
+properties:
+  dai-tdm-slot-num:
+    $ref: "#/$defs/dai-tdm-slot-num"
+
+  dai-tdm-slot-width:
+    $ref: "#/$defs/dai-tdm-slot-width"
+
+  dai-tdm-slot-tx-mask:
+    $ref: "#/$defs/dai-tdm-slot-tx-mask"
+
+  dai-tdm-slot-rx-mask:
+    $ref: "#/$defs/dai-tdm-slot-rx-mask"
+
+additionalProperties: true

-- 
2.52.0


