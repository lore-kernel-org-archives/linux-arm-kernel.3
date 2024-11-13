Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB09CD637B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 19:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lQpVT555kI9HxWkbuw1QfCobvJUnpBBYDf2BdIAaRY=; b=vVuBSxqXv8HUX+W1LNJwD4M9D+
	P4Pf2Ww+vJ6c7TDWID+kkvTEjWicMwX/IqI4YHz3CePR3QGMhE7AS4Gmf5ALJHkncD4ftYCQ4dyjD
	EWnrOBccaT76ovsa7nkIYwsWSZgxB9Bmnn3xfC6oiCB70Ju95IzyunIfD7597BHNB6cBi57sUyej4
	BDlB0CO0RcseTEzkGjtoPy9MHB8gV9w2uxYORWkjlaotbyJyKhvxlKydS3NOU8tzu+fTKR2RH1vwT
	pkwSmM0jVQCCNKOh+7U3LHqxdazZsk2o4mb5Eurb6e4LT8xr39yOnB7HpEVaJVkmxCsVWH+rAmSJz
	v/J1nsrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJVy-00000007tVQ-3h6p;
	Wed, 13 Nov 2024 19:58:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJQa-00000007smH-1yCP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:53:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so69172375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527602; x=1732132402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lQpVT555kI9HxWkbuw1QfCobvJUnpBBYDf2BdIAaRY=;
        b=hlgFtLmR3ARd892bHEG65wDtD/LjpmiKLgUSE6LvOoyHVN3Vv1cpjLfmTlJgqUKlK3
         HMyyKNZvwfJnMCqD8ABMs+2cnrh0rn1T6qtLi+15w7IAalboI11g3NAE89pG6CE57Pr0
         HlhMaituAVCeUB9Pk9Hj4+V1W3Y8sn0NETrrUa2KwmkbbsCcoGt2sAa8URXWu1t9lFyX
         Cu/mYeU0ojzwzTvk3zOLG6zVae1vkUTKyDvodHt+qCzubyTw9mopOrMqMTDaPx5QiLU7
         ZgKHNpL0aQ0+ct/7Cgt/N44lGWaVbOYM0W0LjM2EnoQSD0YrMkh6cIctg5Sd2pRtEpf0
         PjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527602; x=1732132402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lQpVT555kI9HxWkbuw1QfCobvJUnpBBYDf2BdIAaRY=;
        b=ndDgi9AbQmpwIJZqFsRx+8TGlR7agMO/ExXW5GozE1XnsjyA4nreyAugYW4fA6bdJI
         mf9cYIQst/e3ziEin62WVgfTAUTCG9CRShfJ+fdQQ/TE1Y+r3f1zddK17pdln35PQIck
         9ntQ18jLowIyuDHmTEO4RLWMrVq5eqjldPjCI1/33oMK1O3AQSRVc+jaD+kggG+dq9kQ
         dX7fpGhk+g1iHAZpsHYcE6b4e8A8u3gPxmogXaHM3xq6e+XVbPRGJtarYrIR1EGlru9U
         Lv9yfuwnL3n1FiAYNTtJ89d8mS1VWUqGnKbYUO7AL6euycsqriRN/rowvqtYuonUb0/d
         MdDw==
X-Gm-Message-State: AOJu0YwpN8Txig7FUu6BAGzoMWrSrPNMJsAyE4LtHf1FMdrod4cyMvhr
	kaVmT2o/SSDEpQgEgUX232odfCXHXyejHTcWgbH4puVx+oB7B0Zf
X-Google-Smtp-Source: AGHT+IH2Z2a0/rS9v7IeDir+dpM0VmMRaelsOvWV9gMqaYXP9EFNgflc7dj7yYlfrWcH5bgnnm7i0Q==
X-Received: by 2002:a05:600c:3b9e:b0:431:3927:d1bc with SMTP id 5b1f17b1804b1-432b74fcb02mr189488175e9.2.1731527602016;
        Wed, 13 Nov 2024 11:53:22 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:21 -0800 (PST)
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
Subject: [PATCH v2 2/5] ASoC: dt-bindings: add binding for imx95's CM7 core
Date: Wed, 13 Nov 2024 14:52:37 -0500
Message-Id: <20241113195240.3699-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_115324_551747_2604FE8A 
X-CRM114-Status: GOOD (  13.23  )
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

Add binding for imx95's CM7 core.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..f11e03bbcaba
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP imx95 CM7 core
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: NXP imx95 CM7 core used for audio processing
+
+allOf:
+  - $ref: fsl,sof-cpu.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx95-cm7-sof
+
+  port:
+    description: SAI3 port
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    cm7-cpu@80000000 {
+      compatible = "fsl,imx95-cm7-sof";
+      reg = <0x80000000 0x6100000>;
+      mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+      mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+      memory-region = <&adma_res>;
+      cpu: port {
+        /* SAI3-WM8962 link */
+        cpu_ep: endpoint { remote-endpoint = <&wm8962_ep>; };
+      };
+    };
-- 
2.34.1


