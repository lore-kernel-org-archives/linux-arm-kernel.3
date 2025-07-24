Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A337DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cb0rNYXXcc2eHZ9hzARKN3xqFUjTVby79Ond82Ur4k=; b=Dvz+jQBEkHQJCq4Nxzg/+6Xmq5
	3p0XsoTlTfMqKovlgzzvNVJ0KXfEGTdW2da/HpOfHNVQXT8D95BANsZwK+GqAFUKF8nGdY86NX8AB
	e9EY9tqFzJz1VEfW2+tWB8cJdZ+n7bo2dquFaXe4dv0Zy/YP/auD42sntJd0Tn83hCNEiXwoHR6xv
	w85MONZRoABTJA4Fi1FOQbgEW5QhMXWHAec2lwW7vJYGVidQLHStDYmjBAwjf++JQr6SXlrCu5v0L
	OWZ+BNrQohF8c03/mn8/G+HV4YfWixiWZfCMWcpFnIyFz0vU21qzazREv09m2aPAUfEXcVwz9YDQh
	RlFH7jdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejt2-00000006FPv-3pqs;
	Thu, 24 Jul 2025 00:32:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZj-00000006DLU-1rn9;
	Thu, 24 Jul 2025 00:12:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2352400344aso3200615ad.2;
        Wed, 23 Jul 2025 17:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315963; x=1753920763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cb0rNYXXcc2eHZ9hzARKN3xqFUjTVby79Ond82Ur4k=;
        b=VIQNENimALIl+jjQgn4911ZqSjWEQ4wXeqv6YRu6scfezCwgBSuRYx2pJ4P7L06zWe
         K1fmNwM9TGiELCZtDcE/hB1Ly9J+LrFFURxsh/AKUBad2o6m958HZaYNwaoSIFEayWb5
         wZ9HEW/akqlFpkg8m+d/m0Wf4QFvUucqSThSPDMy+9s8s28X72GAr7AU4JaCfionFgA9
         gJklWUM6EisN5UY5jJrhvEToU0FcC2xPO3nX2KlLfJiYgmmiHiqkM/bn6/X6gF25TY5s
         B7OrGi7vHvBhnfpXq6tDRQLMEFtxkQKTFubk+s3aJqRaHcJ9NpXOsNOhGxHpcm4GT4Fq
         pdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315963; x=1753920763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cb0rNYXXcc2eHZ9hzARKN3xqFUjTVby79Ond82Ur4k=;
        b=ck8MGMOjlcLV/yUzfNpuv5D0CDUv565/J1QaghVmObRPisGbcC19BKVMIfjgWXK6Ov
         uPtrkAF1e8PbDcMZ/flfJlgTSLzYDkH1Ngrf5UWYhq6x8qFRa6YikuZKf99mzhvrj3EC
         8VsEhEiLluB1p+jAKp5Cp6HRvAbgBh3jydYMXw+TQL42cHtQNlR+RaELjjiTiFCYy95b
         eQDt7KN2dx1QW483npWkwl+1efEFmFTBpFGF5Oq3/ktXHoNRapys9blnHBhUEjoG3Fls
         puEAklzK4a9pMjrN7vykLwjnihsKJ6PqSmVhZ474RRU8Q2o6iU6nuoGtB5RK7l5Ihyph
         EQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKmFWHBzrK8kTRS2gY15ZNUjHnPWujLxVw31CvmR9DPoc5wHT50947xUCi2/8GoIcV3qQ4Hh2uWXW4b51MT0E=@lists.infradead.org, AJvYcCWpLgeGPNInuH2MzW7q4s9sI+zUY0IKNtExKuavDfQfoF+dpwSI3TA+tzrWoAvHkCY2VSe3BZbpK8xZYJynmi+6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7tZ2WFtC29LTyzssrcQLVBz39JlJI/X7nWcpwxdFcZpWeJosZ
	docrKTVcJK+P7FNf358OS357RA8MIlYOe0/1l68bJeXyQaBgPTEs3uAe
X-Gm-Gg: ASbGncu06ubKGgOmPxGzJtuG+hkdVzTO2nMOKUd86qXu69RhUDY4Hn9yqNw0KwmnoM6
	sqcXtRbnPKYjQq8I1+e+LFk/DDU0Fva3SrHaT5OyhNJe53hG93PPFyg5iDvFYzvTteUKB1Djoxs
	ID4fRycac1KLodw+1s/dPeiH3sCFNK2p/XrvPOZh/Qfr1YhsrVE/DepKYundLuZIEOvZokSFLZ7
	PIXlR2lXo6vE1UHruake3k3b3Zt/T+c395FTpw341HOzIVC6cloZyT64japL+hszOMixItjcilS
	PBm4ArIO257t43+S07o3dm2wotdc4gny/YesIs6BGyuGvxcXTO23F1ImuhbbNYK/FFjECCgBEej
	VsSI=
X-Google-Smtp-Source: AGHT+IHhWQ6WIKyamNhx/uy+Z5hdXGcvTdyE4+cWZb0JiB8Ozp37ZNowpoaP/wDcsnqUdaF9o9X4ZQ==
X-Received: by 2002:a17:902:e54e:b0:225:abd2:5e4b with SMTP id d9443c01a7336-23f98176ad5mr63109095ad.16.1753315962904;
        Wed, 23 Jul 2025 17:12:42 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:42 -0700 (PDT)
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
Subject: [PATCHv6 wireless-next 7/7] dt-bindings: net: wireless: rt2800: add SOC Wifi
Date: Wed, 23 Jul 2025 17:12:32 -0700
Message-ID: <20250724001232.2275-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724001232.2275-1-rosenp@gmail.com>
References: <20250724001232.2275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171243_480849_86D08EB9 
X-CRM114-Status: GOOD (  12.68  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/wireless/ralink,rt2880.yaml  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
new file mode 100644
index 000000000000..04dc5bb2edcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/ralink,rt2880.yaml
@@ -0,0 +1,49 @@
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
+  - clocks
+  - interrupts
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
2.50.1


