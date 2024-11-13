Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16875D637AF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJohuSDhLv+Ez941jeY7j+hZPem1AM5+WSMU5a11wcU=; b=oWpn9WHvMaFxiyg+LCcPeTLVR0
	oQRDn8/88qio7L9ex5dB/SQc7vXznwn+E4Nqz5MoCkekm+OmSfutyX6qO/IrxskaQJpq8hdFbx0Oo
	qcAI+Yj2cq7ZQHjmTFCeB+Wm+B7tF4m6jwe8X8fjgVZGwMgIq3laSQShCvXg5VaZPpqDvLXN8/TCw
	9pHvKmxo66jvkcA8Wes+GfTOncVMA5TEIdtoeAra9bGOh8q/tTQBuREqWtcKK+EYa+Vjkj/vo0nZK
	0VZ/CFLHtcCB5hWQEwOdCm7lDxQ96J0icrV1a8gX35KXtIzOaMoYwYjpzm6DhxebYs/xl6ipIYDgM
	WcWb29yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJUB-00000007tKr-2xxW;
	Wed, 13 Nov 2024 19:57:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJQY-00000007sm5-3izu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:53:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so61456035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527600; x=1732132400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJohuSDhLv+Ez941jeY7j+hZPem1AM5+WSMU5a11wcU=;
        b=eACqfeZKOyQG+1p6e90eR2MMaTgb0fBm+KQd1rR7aJwSf0JXnFHK7ySMVvBMqKuJ5W
         Kv5CcPVhf+WxZDXzveGaZI7Xtr6JLh7dsdy5oqdpeco4pQCIYZMw5mUgV5z3k/eCOQsc
         w0eJXv9CHK7MM2XYMEew6VvKkhmgojHvvwNZM7F3CM5SIbo/jpQ5ao3PDBaFsMoPOuwF
         MIMozrARWkNtpfK2mYlmZ2xY0eYcMgBf9gn1bDopcpVtuDOthupNpj8dg2mU8xkxmir4
         MwAzzuXAf1Tw6aVfYeXlAfFI61B9R4CaGAxZCNqEdmznZ66oZb7CAioMk+BcvV3KgzlR
         pI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527600; x=1732132400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJohuSDhLv+Ez941jeY7j+hZPem1AM5+WSMU5a11wcU=;
        b=RitQzkxH+eIVa/kouQPxCwXp9tpd1NJeDBA1clrt10P8B1jbMmZi6FFvqgrM8Z6Q9u
         fLZLxcfwjxVE5MGKwMSBA3FyGEFmw7+3PRooM4CpswpqTWTtUummdyqBZ3+oWTe4G2UN
         nqOc28+VUa5x7xsGHyYlAtaiYvXpM7fa4yQOtSpHlUjt+izX6U3Fb9Bj2d6GYAesTJrO
         6sTCeo1zX2NDNYi6f6fwpCIDUExF9Ef2sR9HnU1U+B0e5/S1BKX9WrKcvkGVuA1m8pVl
         icNTNnSkkQXmzo0END5pTUN2mGjGAReED6lm+cv4xWqa+PqCwF77WouOzJQbJJrJrp5+
         9Rqw==
X-Gm-Message-State: AOJu0YxprLtEYi/aiD9jV4BdH1SpydtD31xVeJJknSVVlix01w+ENZVT
	szV1BodP3VN4R5gReY9YaPxtqOLfVn9OlqYbqcifL1qIeOUqcrjD
X-Google-Smtp-Source: AGHT+IHwi2toH/v6RTvp83UH7M2Jmxcw9HOhI3L1kjcyknLKktTX9f30Gh639+d+i9hlq9WYg//Eow==
X-Received: by 2002:a05:600c:5006:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-432d4aae640mr37829535e9.11.1731527600012;
        Wed, 13 Nov 2024 11:53:20 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:18 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] ASoC: dt-bindings: add common binding for NXP CPUs
Date: Wed, 13 Nov 2024 14:52:36 -0500
Message-Id: <20241113195240.3699-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_115322_967894_33E3B2C5 
X-CRM114-Status: GOOD (  12.43  )
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

Add common binding for NXP CPUs sharing the same programming
model (i.e: audio processing with SOF).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..6d63fcd71154
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio CPU common properties
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+properties:
+  reg:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 4
+
+  mbox-names:
+    items:
+      - const: txdb0
+      - const: txdb1
+      - const: rxdb0
+      - const: rxdb1
+
+  memory-region:
+    maxItems: 1
+
+required:
+  - reg
+  - mboxes
+  - mbox-names
+  - memory-region
+
+additionalProperties: true
-- 
2.34.1


