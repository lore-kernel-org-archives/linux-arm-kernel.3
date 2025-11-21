Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D664CFA475
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=; b=Frahb4tld3mUu0QoXR3cloNbRG
	azSAFso0XKEp+VGgRhFl/vP6QfLD8al42qutrLyRU6AIlNAkOsbiDb2EQoJw0kMqWwqBvyWerwaK4
	A9DrAtF+6AYzKasncJCX+d/fnC2kdEgvwCShESH8VV6vu+RcxiZ8a8QJ5zUaDxxEHB6U3AvlaJ2ML
	AC02NKExFBHOgH568pKwgcEYX8/Rx4cVxnlc+FtGCy54hdjABN+3nWdo/SBfThqYCYirnD6wRtgn9
	crMWit2e0qDhRjy7b9mF4SS18Eu3EJRPpQq3KkvTG8vtAsBzeZLxkk3a4lZOWNeKVbBCzCwzupRJG
	57iPLEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJy1-00000007rTT-0ULf;
	Fri, 21 Nov 2025 05:45:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJxw-00000007rPV-0xLE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:45:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b566859ecso1454030f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 21:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763703950; x=1764308750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=Ja99Hja/RGn/VXK1d5W4aMFTGD/gY+1qFJa1CB0nwfNN88MWgy8gA7pSjt4EnS8cuy
         Kbe7EY72lBS1qcZWSOpaB6gmESzXs7pg6aTJIsiUfYz+1AdRc/zJKR57fW6VrE/9WUHf
         tclsC/dwZ1UxwCaL1IBcEh0C6Jb65Tf2XYF31/uVinhzhsMRjRupiVqHtv1qRtLODKFv
         pmBroH5c/j0fyCVSvIOSk5xy2GU5KrjNiVn6j/SqBhE5Pwva1m66PDzYKIQ+xILFd0Gs
         EZgOC2hWl7TLYbY1l17Ksv3s4AZoZmpDi5bsCfQhVFIvX8pRqDoLy+xfOMMWa/vAyX17
         G2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763703950; x=1764308750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4mYsgMrDgS5hUvuSlIrRJpIGUfBKBPSurplnTSPjF4A=;
        b=VZj3tv9jbwAz+n9Vu58M7k2zKNnmxQwvHyQaSLReW+u+scos9FOJKuHh29rR80ChpY
         8WWF1y83zcnjKOivDZsfFqkxxxp23gz4ddZMqEkdqgzEDCh86elkJ45JjEK13GoEQ++V
         hWDRuFcGrVuMJzKmAyW9tACl1hYY+HBszLglPTg/9YjDfSqbKv439LzJJABlOD5p7gmu
         KYetiV+z8WymE2PJNQAOJARvw/yfbE4FmM//ZlDAXN53n0u71oGDjRdAPCes66pcUdHw
         8jd2/07RPiReYkceFAUmSkKwttO5l/aBR6/r8s9oFNvIFFQtGhnWj3n6/YLLJzwWjd41
         5KvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXemtfmZI6mjZA9v49fNEO9Y+QoDI5YVCESjHD+2hS6Md1H1pfipegL5oKYy5n87egbjFGHyOqziNEZ97/ujV7L@lists.infradead.org
X-Gm-Message-State: AOJu0YwD48iiVpZD6xWw+1a42u9rNzo8I7UARv+6qEhtaa2SX9dvHugn
	8a8gcJOuJOvvz2c8zN0ElY3pXprRHPriDEyL+F+vHugH1frkpP8WIrLZ
X-Gm-Gg: ASbGncvrrhoHrkXC0F9OqjJY5a1w8JCmjTCMxXeYhujr4ImigmSPQR2Ea7S9fmUV5ni
	TpjLjKD9TbuobzDWfLi5Lb5wT9GTequt1usSDVSxf8E3a/sbk1AeE7J46Y0C9Jk4icL01c3bn0n
	CNffed8oi4uCtLhLlG7APCdCmR/hKjoZfPUys99eyFsWqD9A/rE7SUc6H4CsE+huKRu7niR00su
	JVErM9jMg7BJ06i+2F/ooOlESS/sDdicqKxfjz2W/mowVaD/tVo9v7g/ZZ/RnQ2/z9xy/UGCOmx
	tCZd1fHOIervYxm0u5RcuU2tQ5x9C3EWAWGyAC1IZtTEvx5kRipCo5jcHdp/stQVqP/aZOrxmcq
	+4kckpsGqnNgbEz6b812P1WFuVYhp5bQHmoXgka8lVO/NVyS3ONmctZXasK/XRakTJpjaQY6jdx
	AraIdHL4wNOj/JCN+SZBNb7pACtsZoia9FYLlsYDai
X-Google-Smtp-Source: AGHT+IFoDuD8ce0kyVu8f/bxfusUDj1z/44aLM0o3OmyBUjncNPkP8Va3UpOnWv9eDckk3QJdEc/AA==
X-Received: by 2002:a5d:64c3:0:b0:429:ccd7:9d94 with SMTP id ffacd0b85a97d-42cc1d217demr750615f8f.51.1763703950227;
        Thu, 20 Nov 2025 21:45:50 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm9239273f8f.33.2025.11.20.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 21:45:49 -0800 (PST)
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
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
Date: Fri, 21 Nov 2025 06:44:59 +0100
Message-ID: <20251121054537.25796-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121054537.25796-1-ansuelsmth@gmail.com>
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_214552_275991_BEE034AF 
X-CRM114-Status: GOOD (  14.17  )
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

Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
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
2.51.0


