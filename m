Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810DFE77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZR22IhRUpX/Fq7KGPdPODk7QFLwb+WURrRAPPoxEH0=; b=JJ4EOwodZT98F7JBz2L07ySLKd
	9Vy8COTsBnsAV/CeFRNN66rxEGYUep5F2J8CiNVvaBNQqfMERwKPimFidq77ivYikAaFhecTxpEUi
	t8WUMYf5GG2JRzt+tBPTc1qX2+v1Ku4ICidOSzzrz0cDZ1iN3KoycIv6/gCRh9zABgAA669oqQa1E
	sqHZyZv9mKR4MxkGRrIGPrAQV7qfTmH7XeQVptyhr3JGRuMT5t+GqjNSJ8dxrH9Y/XfxjQIKvDxqk
	E+dF0amFeN1+oh0FEiDx4KHQqNrmZ0ACHcr51NTpGn0EhT1lvEWleFUSjLhHidQeTgMyIXk/BTPUj
	h+ANw/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCTQ-0000000AJTr-02vW;
	Mon, 16 Dec 2024 14:53:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRM-0000000AJ6r-3uTg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 14:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FZR22IhRUpX/Fq7KGPdPODk7QFLwb+WURrRAPPoxEH0=; b=DnAjFDpJJo6svgaYugpVKKL0Hj
	KPvKDJu5mvHwjentKQant6w3o51f/gqpZHcP8U2Jh+dnw1e8YCzoTw1NSscLKV4PrE9k5O3OIAMf3
	wvw/gvnRgMAhwubejIOIzkP+++GYU6t9h3Zjvie/GajnQWibJkRqBJJS0wRa3qt9m3HQ9e6IXx50B
	+SFFP5Wrfh1BAJ/k4QWHRgPfO9Kj+fbSIkHjhKjlFVMXPbRSMygDIQH54zwtL02E4JB4Gk9bPfcoI
	iPTzWhgii3A8KHsO7Xd7pE27wH3b/ODMKq47Bs/4jcFaucoZTEpTnB7KTpyRUyfj0JQTANn5XosBy
	FLODlkZQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRJ-00000004sEI-34tn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:51:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38634c35129so3306644f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360675; x=1734965475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZR22IhRUpX/Fq7KGPdPODk7QFLwb+WURrRAPPoxEH0=;
        b=CtaLSTCbIFjBnb44eoXlq4xPGVzL4rsMZQXH8GoxgFGGLuNsaJwYLGWnP7YeJTBbhR
         W6mx24o22kCHz4HwrvXLHfMVKoxPAx5vvU68/MQHzh+q9BJjgSiwdYU7/wZGFJn0qloK
         x3TpOQaOUHuTUOyPMEqGBJNVOwbojlCab0/2pvYalY+QBCr0pQwyxuFft2jYNfWFf9x1
         zfANuTx3mFu0zdVyD2Js6icBKojloaPqwyOhfE0E638UusqNZ++/pwGcQBTdDc9WeRfp
         lx/i06PsQemDKAepl2NU9QFpXJGQ814fOq/eTAQfDPdylX0a7b4b7ZMlFEWPeLt/o3jw
         Nd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360675; x=1734965475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZR22IhRUpX/Fq7KGPdPODk7QFLwb+WURrRAPPoxEH0=;
        b=ssh8hTjAj1uiqUMYTo1mW1ZVTYFp0HRcpy9sQpOdQJAYN+AFAEv3vsAvwY+Hq9X207
         CvOMl4qKclLAzlfUZiO6TpYvY6I/i1wT1LhX1ftgVO4QvwxgO22aV5XKgAUnDvuCxYS9
         MABHBQZOB4juITd+XMxEhPojZYmDv7RYmEdyLf0k5oRmLKbICObFLAlkFvqj9m6xU8Jj
         L/SJ/1qAnjwzIwgf38KfFrE8UiJrYinakaa7HSsQq/3k6Yasp6Nsvq+LqeIbqhVzWIFT
         ByeuJNlB6S3pekdWQoQeNl335TDZwbpSZQSk8DfhNtJkm5TXjI5ak6XycUIsHFEMW0lE
         lVVA==
X-Gm-Message-State: AOJu0Yw+xrybLBeKAK1cQnO3R5Tpzr1j2+pvFkS1KaogBGTq+GLaIL0f
	4nkAcfHYIxhUC2iDML0MchpnfEXiFlvcbYjQjGz1UEE8QRQY4zXH
X-Gm-Gg: ASbGncs1ETugqvkZ+ER/26CeU737TvzPRxyO/1tkb3MRBBftEIM79J8lIm1aD/cfHmZ
	OKG94HkAWG6c6sCiSGmgbPL0shoYbqQ6s3h3yYSM2ih/e8QBhQ1Vwv+oJ1fz6OamwGy3WvXp++X
	GSUdvnXou9TFs2FpszLlwhP62aq4b4lMweB45UlyEU2ta2oJQYH1RAkhGJhfHaEtzgfEXQti6IM
	AW3x+hdExNxXK+YJQ29ekq+XKu3Q5yqH0smhEg/m/lQo/fAuLH7feicxEHvv0XB7/sbWGBjXAhk
	JE/mW1rakCqx+3eS
X-Google-Smtp-Source: AGHT+IHzN/5NhLTul0WIKF2FfViCsMY2uCJdEVicfsfHV8smpoFeZ1z55RS+AV0S1OCL0ZcqZxbh/A==
X-Received: by 2002:a5d:6c6c:0:b0:385:e1f5:476f with SMTP id ffacd0b85a97d-3888e0b9bcbmr8246013f8f.39.1734360674752;
        Mon, 16 Dec 2024 06:51:14 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:14 -0800 (PST)
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
Subject: [PATCH v3 1/5] ASoC: dt-bindings: add common binding for NXP audio processors
Date: Mon, 16 Dec 2024 09:50:35 -0500
Message-Id: <20241216145039.3074-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_145117_881313_9AD62539 
X-CRM114-Status: GOOD (  12.15  )
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

Add common binding for NXP audio processors with Sound Open Firmware
(SOF) support.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..1958afceba75
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio processor common properties
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


