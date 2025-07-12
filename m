Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CFAC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 21:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejYbSlwrvFkbrHBW6bffd77Xp+VgExQz5WmoZWm5X3A=; b=Ar4a38ECeaSDxg56Xcqj1fkI+N
	mVFMVG63u/WiKkLeJRGLX7gpn87frklHrBd26ZZ7hBDDktx16aI8sQ7ybLIVoUBJ/8eJq7OIjBKt3
	U+lJUSqFGiPVGq/4nzRjspI0aGytEopCfsnZax009aZh31a7nCuAux0+3VZG/LjsgDgS9WdA9Odwx
	Kr4SmZx36uw/2Ct0IT4ZkD5NC+KHahKy2yqKfnR5cfZjkEdEOB5mS17pv1C3iqynzP0oSgNsuzt8F
	BFr7/PlWx9PLAJ9EsXYGYVBr0WrqZbhDukA32ampdzRcFtwBwOkbZfNGQiNsm06pYdsdJmXoRLIbT
	6H9Ei92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahhz-0000000H2hn-2lZ9;
	Sat, 12 Jul 2025 21:24:35 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahP1-0000000H1G2-2Z0v;
	Sat, 12 Jul 2025 21:05:00 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74b54af901bso2035937b3a.2;
        Sat, 12 Jul 2025 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354299; x=1752959099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejYbSlwrvFkbrHBW6bffd77Xp+VgExQz5WmoZWm5X3A=;
        b=g1VqA+now3oFFROIoDAXTmgUJ7wLWBmQI09ygYkziN5eQ7xFmv+tbbkRs4bRAZNJyY
         i5t8TeAt4YG0GRbmMrdJXcINQ219xTI9BFsfJa8yay28MiF85OQKurERL2r8JSUc4JL3
         60CGnqvOxp4UX3n97HRUS/+bqnWaQM0fRxTiCdsXsH1hBOwayq41LeY30t7ExjezXNhX
         Fb4FihyHpLtoBMyQdZRfW313mNWqFsCDyEMVIy6VPTb90slL8ZI/sDh4RO4+npyb2IUl
         LRntXkgXBnTJMeGzM7Ek+/Z0q9PSEL6ySbvHUSxhO/7yBsOn1o20ipk3NuZnPJ/qJK/A
         dI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354299; x=1752959099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejYbSlwrvFkbrHBW6bffd77Xp+VgExQz5WmoZWm5X3A=;
        b=sqdLraU4UyyMiSI7YJVqSTb++YpAj1qwpb8CNYA13ZS4/mF0r9uu+Z626089mMD3um
         VMJZTGRcF7PD2enOjlqBE8RWZhw1u5Wc6XVkGCLtoodwpfGYNvM9hJ7w3QsCWxxpopuw
         kdMgH7uaQbq1a1E3LA4WFf6lhlIg4W5b+RIMepp7qElML/GrG+dSQpboPHpyYzLeDDSd
         w0vWGNVboBiQTZu/ThQNR5Z4Xtorh9pFAg5bkRz0LhmlBV/D00/8wTmHXAlSUsfynqkT
         WcCn2nBaHUvUz/rJprB2YDbqo3P7jcEgBOyKSKQt8K7WuqzBtXj9vHMkZi2bm/Q8jVeY
         QyUw==
X-Forwarded-Encrypted: i=1; AJvYcCUwJ8DxzDqoZv/c0SA8qQLEIbu+oY/KmkD8tFPTjDb4/gaoJ1z1IlZYxNRpOk/F5pTVekAY4DjZKqTbYdbaBfY=@lists.infradead.org, AJvYcCWU2UHTuKatvKB7hWqXVl6skEXrSVHzCID6rJheXipHx2LzBy1me44hflrRVb9qnjyN3w8w/RF5bzZZ+o7Jvtnn@lists.infradead.org
X-Gm-Message-State: AOJu0YxXxYK9GB0Zsf2Y5IJTa5LGBNlO8Jwyg270wjwDK0IoMPi8Fr8Q
	PDTudjMZ44FodhsoNQ0fw9g82P9nn+GhVfrv6fwpRGHk0UBXCcWlklp6
X-Gm-Gg: ASbGncutNxbZL9qhuhEPMwc4sutBuRWWzEtbZdWnHEv58UD9ngZm1v3YKbjPh32cXs7
	k66kIBPGXNo+ETxEnOaqbCOOaOBq600ARNISXymMBydCiza0HEOuGrAU525PNtZ7+NZukFarTsP
	kTU6TSn6o/tCBa7pjsFRp2j8mvW1Yp9bkm/lrEnrFWgcxL+motKj1WxscmsdBvyUv8cwfKZh+LW
	dUaG95tsIn66Uvu/wUKFGIREsmydkhD5LsGTESB+PHHUk/nzgnS3ksjfcZwmPAcuq/J+Ira6uAh
	htA1mbi/lEjfJ9Uyknfi6f+qae9n2xglJeydSOlKqaHt6z8Y1G30XJpUeU/85jVx0xsYc8exdoY
	NkbI=
X-Google-Smtp-Source: AGHT+IH+1if3RW5zQDx5NFLjOzn1Iy9WzIcJAUTGZjLlAWikIuAA6K+2n56KMZrocse6CCNK9iTVig==
X-Received: by 2002:a05:6a20:c709:b0:215:efed:acfc with SMTP id adf61e73a8af0-2311dd59489mr17727971637.7.1752354299008;
        Sat, 12 Jul 2025 14:04:59 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm7988645b3a.5.2025.07.12.14.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:04:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv4 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add
Date: Sat, 12 Jul 2025 14:04:48 -0700
Message-ID: <20250712210448.429318-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250712210448.429318-1-rosenp@gmail.com>
References: <20250712210448.429318-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_140459_651497_610103F7 
X-CRM114-Status: GOOD (  12.86  )
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

Add device-tree bindings for the RT2800 SOC wifi device found in older
Ralink/Mediatek devices.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/net/wireless/ralink,rt2880.yaml  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
new file mode 100644
index 000000000000..a92aedf6ba01
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/ralink,rt2880.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT2880 wireless device
+
+maintainers:
+  - Stanislaw Gruszka <stf_xl@wp.pl>
+
+description: |
+  This node provides properties for configuring RT2880 SOC wifi devices.
+  The node is expected to be specified as a root node of the device.
+
+allOf:
+  - $ref: ieee80211.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ralink,rt2880-wifi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    wifi@110180000 {
+      compatible = "ralink,rt2880-wifi";
+      reg = <0x10180000 0x40000>;
+      clocks = <&sysc 16>;
+      interrupt-parent = <&cpuintc>;
+      interrupts = <6>;
+    };
-- 
2.50.0


