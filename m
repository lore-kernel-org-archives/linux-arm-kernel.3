Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D9C5AC9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=; b=TTuxZa5WeS+90FvGHzt1uGBs9a
	ma1uLjRqdzHod8MWtxeWRrr2nfKfIylU7yQA5NsE9Y4c3UodRP6X5jtXY6qaDgiv4i970/TxpYC4N
	wiIoTt7NaxZox+if+r6/u8HdO4dsCoUPIZfWxU2/kSI/pKma+sovCjcGrBTkmh7UmaBwPRS6So7wA
	S5FSglwhywxmm6SfPA4YtUyqyQZSGkXhoRtv/iPEnep4qklvCMdn2XD0WtopLCM4LYmTyDj5xWQUs
	/5b/UWxsZQUhBbbnsgiZ2zM93A2P6mglNG0eWYW4YNJmc9LaHGMNdVMPYyJgYXHTBHxAcuRVC8T4o
	Btyzh6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt6-00000008hK1-30rN;
	Fri, 07 Aug 2026 20:09:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt1-00000008hH1-49eM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 20:09:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so44281415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133386; x=1786738186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=BQrKOCASNwRnW/NYkzM4VxT1RWHYEe45pFZdtAUBoaCA5nVkdedr8h2R7DwuTMlKRP
         py+dLLG4C6lAvR6G8rWM8k7ftQYgpIHHkjmKm+wohISn+yCJgojDdsmF09MUJ7JVAb+d
         aS3qVZQhWqaoUJQFLn4BAo7N5Yvitnd5Pw9QGMAnGuGRqaYjETXtqWWPoNvuj37dY24z
         Jvauz3nqsPz86EE6v/pyNl8vlkQ77YOIu2iFkQNH11YjDDbL8adwQn+x2y1OSL1lhF+C
         MqjqkFzhQUeESxzu9fSK2OW44tGqaBDa6j/9T8jJUA6k3onAQEBMbniQUzT4vNkKe9wC
         GjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133386; x=1786738186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=MQnh4S8WKKi8javujBEjDh9k9D8SDaW1s+cao0AbIcrr8qXJk1zSuV3ndxsRqpXwDA
         ooZm2tu44mcTg8kaQfVzDHWbhra0QoGBb/hBb57HFBKrhxsi0mz/ZjWJX+5pcMcgMXir
         sQfq74VxZDyqSkwCVotgrg6+ZZlbV+m/6W/V7T84vherCjZFhBJRY3DU6GS2HAp1bt87
         Q2Rv5RF+3ABhXF5jMwG2nn+sq4b5gIGmoOAoLdBgp2ZVTIxtwbOxTyKWAtE2eUQo7fZy
         kr8grWFkIPrfdelRUzGIp6eIzcp3vy61oOpSitq9V7+KfIG10dWeGQvE2lohjZyv/SxN
         ic/A==
X-Forwarded-Encrypted: i=1; AHgh+RoDA+sDzLR2cBAOBS6wntlEmTITUqs9z+x6IKMTDPAEgRZO7n9CbUfbHhP+Mf0Jc4QGcDawy58hPmQYgKhs8B/3@lists.infradead.org
X-Gm-Message-State: AOJu0YwXxuSx8Ec+kCHkfqIYN4AmRf0ATQ5MLo/vBQC5L4zXuNyuW7pX
	IxjINoSWOm8xZFV0lkDbwV5NgvYkj0zHyptnGxR7IWfeLyOEYj3n84mV
X-Gm-Gg: AR+sD11K6qr8yRlt2HczlA+eHYoUxBxMQXhco5zuxljHvIoVV7HZ/JJGU5tmfTNKOlv
	Wk5Wt/duEAimQPPOWQKE15VUB0WAqqVqgUuPx53dYwfmBpjSJroJsuTrcgY5J93yB+3bR4D3jMz
	V7Zsg7d/MuDcv+1yV6MLrOSKTM+g+VRLiv2GkoRoyrrvFDDYomOj7C2AT022tI2S2JSv5lrwjBt
	eMmzgE4UHQgKOUk7liWlN+zdb3VZvr5uX72ZhiL7BpFUghK9MIdaD9mxK8NohhWJRRI0LQOkMrx
	VyC21nAbU7+5geo/QdGiASU2/PjU3QM/TE2DGmzB6Gj6uma3ixzMB7LmV2iSUlquNeAjwHMS0nR
	Mc4Aizbgy7ihOODtTH2EurBwHnuhASBR+9yrkREXN/BTatmjE+JcbnKFz/hp3yiL4yj10q9SKwd
	bH/ajbscPXI/U4GTheLfCEF+/bTlSH+6N+lbwvP3zZJLTikPqkBaiP1uMQNHiAQ+Svy1pGUwlPP
	6D3MD6r9yIeWx6dgPPFgcVFiLzAjjgyUS4OjrgQzzfWUKvY0KGOW/7CFywZC9H5
X-Received: by 2002:a05:600c:5791:b0:498:11b5:3ff7 with SMTP id 5b1f17b1804b1-4994e7d8a85mr280779925e9.18.1786133386236;
        Fri, 07 Aug 2026 13:09:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 1/4] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Fri,  7 Aug 2026 22:09:31 +0200
Message-ID: <20260807200936.201827-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_130948_040644_D44463FB 
X-CRM114-Status: GOOD (  13.98  )
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

Add YAML schema for Airoha AN7581 AFE SoC sound card.

The AFE handling on this SoC is very basic with clock always enabled
and all the power saving feature not available.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0


