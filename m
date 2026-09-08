Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C898EC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=; b=Mr2Sn93gAFUEtvLmxV3ATyVM/p
	iIJRyUGXAZDjVXTCQDkdoCCfPqVSZIpIr0g6QrA4Az4XagvAENb0NfDkmQkxFecrnffXHF8pIXISb
	p/wWCpQrLQpcqirkjDArQ5KBdDjlW+SCF/1YOX96zZHJc+uqHzwcLD2vcBnAxTLb4pV2KWRFJdRgL
	CW+vpZTLVGB85iiHPFoTVxktAvOq6mka0nmASA7eM4fjZKHeRbQscaeMwvIesw7zV+DlEkc/yRlxU
	2inqmxExwb0sGwSSReiIBhX8TBNjGwhU7fSwcQAbYTQcXWLJbAcc5Lc54v8QDvDTwJe26rmZJ6a3u
	ggYGz53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vWK-0000000963V-1rzm;
	Tue, 08 Sep 2026 13:05:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vWF-000000095y6-0GGq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:05:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so54903845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872745; x=1789477545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=RhO/GjNPtAvHbZyWVmiAyx8WGh+lKvcMnso0b2AuhwAvLinmg2NNDZdTSjN13cZkTy
         Oi7A4ii1yZpmWl32EUK+NZ5MQtEbyRyqwYKtN48Rp6ZObS24aIuR4VgYRbX5w1Z0hmgd
         NZTylI9855Fnb/YjzGvfLdkUOm2oI0PUZkvis1cZsdmOQVS6jq3pKIkNDzv98ndOQZ1F
         UtehiDXaY+ocrwPHVVdsFAzddFGmcVu/lGcy92C83YaeljrTIivwWjCaRVydNVmpOcf/
         h9bWDnw8NyWH4mcS6DyK95APYtG2HrD/IKHWdmo/gveQkuWiQA7FA8JRyHsgfEtKu6A8
         x3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872745; x=1789477545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=ed89ZgeDNSG6ZXsqFJDk42OZAvYGykHlZJozKgDBJsBes7625qyJIn9IwFbk6hh/uO
         QSTZEJ8J+dEgmLcXfCsEzEMBkKHtnpmSzNNSj6Juw6/n7CxVujqWBfQPdxtMgDiL1fem
         MeEcnv/fG6JY22xvlqcH58PWVjMcbC1mF3DVRuduGF9nMVbyagh2mk1x65SrImvMw31O
         S/z7vVY4Ng3Go8HDdMvTxzJEGk5g12wkIpskd8qJQSMHE0bSeHmvrIjOovHc6lsFsAzs
         dTcKS4PiN2EyIHJF0yPUwfSu+LKprYjni5MP7LO4qbPj7MBlfo41Max9uMhEJ+xKx3sr
         ki+A==
X-Forwarded-Encrypted: i=1; AKwUvBwwgLDP369hDMJ5M7z0xMY7xJQsyuTQX4r0WXJUHDW31zEtxRqCsQMIu9cP674cOU1i6TJiQeXWe3tmHkgYsSn/@lists.infradead.org
X-Gm-Message-State: AFuF++nh+m8qGVPX9Ds0Yn8yguwg+D/BY/23YZzUvDtiJwv00mSokX3B
	6Wg0/SL/Ab4Z8LA0WOU/c8gbaV8NAju9OvYf+gTrZoaPwQzTvYvRcCbDmi4Or8EZ5gI=
X-Gm-Gg: AYBFou0t9gdUA66EzV+d9Uqgrk//IL/Ray44IxNR2LAKe/1sQelCD33JIDRgLCflQ45
	k8hqE4HO7rt2y9GVw/5Yq6lEqLpkZf62vO1c6n5JnAJd9K6bhUjBXUcAmhwH3vbCL7WBftgRzPJ
	l8jPcy3yPlJUm/e1F1Dhde158/mvCuEvDVSjsiFspnzCKpofDCzyUtPn0KaBf7rWNuAdnfRxcSo
	j52RSQ3Bcp6JXkr3u8gDsNZiuY45IdwNiD3yfdkULZkdAE0+snrR2u72orRtmII5YmchDXH1qcn
	fFsJzGLWqYtA4Q7xeokt6m7wQf9O2nNcL0Zp0ZpduhdzNpxgHfvqNz1EEeSVWa5ESj71m9egTVm
	IpZnJTfiIumUyypL/WdJEV9Jwd69fSLnt9Mk50FNmbCx/pbhS73nOhHAjv3spBttCJ2uquEMI9Z
	uayWeuHlhIWRbAXsDIq+oOhmaKrM7yWx/ubwG8L3/DxilXmuhV9j8De8gfRg==
X-Received: by 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr280303225e9.13.1788872744932;
        Tue, 08 Sep 2026 06:05:44 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm335275315e9.3.2026.09.08.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:05:43 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Tue,  8 Sep 2026 15:09:12 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1788872294.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1788872294.git.andrea.porta@suse.com>
References: <cover.1788872294.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_060547_107548_FD6FBEE9 
X-CRM114-Status: GOOD (  16.25  )
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..be020583fd0ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3


