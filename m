Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55468C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFloaJNjPj6YhrScgdec72uo0x940nsOWxld7fstQWg=; b=Ms7oAhwGC+gHUufeDcOD6TsH+u
	RfbXBmnQE06mxmJ7BEp1kdSck1UsWyyhshrLGTbFzZi1L3iEQvl5+az7/OlaHXNUd2/6/+jjk74Z2
	s5N+Dt4xliulwVZESjsUReFyYlFOUrQUtISwl+CJyOe+it2i7sOqO5mH3OqIvpzwTNlb7abL7CAop
	AlyHjNBYU4Lgi8bGCOXIdrP3AUYOnq4aK8CHSLG7eK62Bygklnc/55c21VK/UNyoncbbLpFY+JunZ
	rLKy5YHRB7ipO1DCw4nZEVhHb+zi8HkH83AprCZ4n7wH1rPrYDzX3P+twbFA5Zc+yM2ptU2/6VAhM
	HgRDFnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGhh-0000000FIjL-2qCW;
	Fri, 11 Jul 2025 16:34:29 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtd-0000000FB0a-3HaS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:42:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-748e81d37a7so1481476b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752248565; x=1752853365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFloaJNjPj6YhrScgdec72uo0x940nsOWxld7fstQWg=;
        b=ZOZz5xFBATy5UVgvqOaUsbdewReY6XITJ2pOQOtKAGAADR50WTUzeGb7rkRW1LhES8
         pChIkgAK3LqY0vma0DFXuBit5MDHX6FuhZ5dF/IQANFQ/qFTyPTw32Y4OtcerDHGvI5I
         AbQ27IOGUwYZOpRX/JChxUWeXYLylu7YdJsfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248565; x=1752853365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFloaJNjPj6YhrScgdec72uo0x940nsOWxld7fstQWg=;
        b=o+y3qkcn44v3pTthlLrpL3BDK1bAmypamIE9YiuGw2X/L7uteFM4z15Al4vsp6F4e5
         P7BCzeGgsyIPE7NQ8Qn1Kb9p40sxlYDR+z4GXIX9eILLii8HEles68wrXLCJy3WLxRq5
         fbRomQDEPnJM7KX2PbGTJ8HsUoDblgymAzPUXyPh00+Jjv2hq6KAkUY8YLx920VU5j5L
         iaR7CHsxLY30Y/TvUw8ejs527x/M0u9oklvrmKbR5mnqJYQL5cdes0JbsyVhfBQY0T9y
         97oZYAf4qWBI/m84rj/ZblRfO2VpRkti0V6tsGwXCRhwb0KgWTGpyQ/2l8SVoaJuxahy
         v9wg==
X-Forwarded-Encrypted: i=1; AJvYcCWz0MT6b/nTArsXVP3JRvpsyLn6c/QN1OE1PBHoKBcCGc/BOndHBI5vG3fR4SwnzXBwFaJ3A7hqCSk63edR6jQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YxkzvWPf+cRDIgR73hcDeJO/S9VAJ8PvPGHmrYOnLVxc7eajHtI
	jqPpMrqBFXcMaKq78i08CB8QUZnRInzsuIXa3G7hUUgDBWQ2p1vnw+N0taUM5ci8tA==
X-Gm-Gg: ASbGncuL1Ds6tMZbsOOQOouo1rNzkmrO4z5NannLOphUbl3IcFbDLbFORjr3Z4IqVBF
	gduqXR2esyY/8W9j9vWj84uGy/AhCikda85ytVNSisPJF50IaqdenQSfWFkjO+40XnBtjVO4X4/
	0FAKpOpHnJHN+zKWtvBlDF3ZG+L7k7VD+146I50IvUF65Nvsyp7D35gPlh5E5tQcWqdCoKhGJzC
	s2a1b7URM5J1Y39dIHvRIKhC/bXZzrPP/iFxyxDsjcRlHYUS6qlO17lLtxF/2W8/JKRiQv4OeXy
	yHDml+DmhOZ3HiBD4HL61n9XmyyV25a37No4Rw7eaYNogwaOMibImuR9kJHfezjx/9BhVH5LcBM
	ALNuRQORiWquJR3Ju/aDlEKCqDbhNrArsGNuVzh9DLtoEW7uLfu9mB6A30JV3RAOHIFrt
X-Google-Smtp-Source: AGHT+IHvtMPekpyU5nnmLW/gd6y9CDTVw2Qycx1EF3HESUhtgnvWQRje7hCswHHVti/titoD0QxbHQ==
X-Received: by 2002:a05:6a20:6f88:b0:222:c8c4:efae with SMTP id adf61e73a8af0-2311fcfce03mr5992549637.27.1752248565104;
        Fri, 11 Jul 2025 08:42:45 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm5762420b3a.27.2025.07.11.08.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:42:44 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH 3/4] dt-bindings: mmc: add brcmstb share register and hwlocks reference
Date: Fri, 11 Jul 2025 11:42:20 -0400
Message-Id: <20250711154221.928164-5-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154221.928164-1-kamal.dasu@broadcom.com>
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_084245_827074_446A8D33 
X-CRM114-Status: GOOD (  11.70  )
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

From: Kamal Dasu <kdasu@broadcom.com>

Adding optional controller share registers and hwspinlock reference fields
to be used by sdhci-brcmstb driver.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
index eee6be7a7867..fe9be7a7eca5 100644
--- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
+++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
@@ -27,15 +27,20 @@ properties:
           - const: brcm,sdhci-brcmstb
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
 
   reg-names:
+    minItems: 2
     items:
       - const: host
       - const: cfg
+      - const: share       # Optional reg
+      - const: flshr_ipis0 # Optional reg
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   clocks:
     minItems: 1
@@ -60,6 +65,9 @@ properties:
     type: boolean
     description: Specifies that controller should use auto CMD12
 
+  hwlocks:
+    maxItems: 1
+
 allOf:
   - $ref: mmc-controller.yaml#
   - if:
@@ -115,3 +123,20 @@ examples:
       clocks = <&scmi_clk 245>;
       clock-names = "sw_sdio";
     };
+  - |
+    mmc@84b1000 {
+      mmc-ddr-1_8v;
+      mmc-hs200-1_8v;
+      mmc-hs400-1_8v;
+      no-sd;
+      no-sdio;
+      non-removable;
+      bus-width = <0x8>;
+      compatible = "brcm,bcm74165b0-sdhci", "brcm,sdhci-brcmstb";
+      reg = <0x84b1000 0x260>, <0x84b1300 0x200>,  <0x84b1600 0x10>, <0x84a5404 0x4>;
+      reg-names = "host", "cfg", "share", "flshr_ipis0";
+      hwlocks = <&hw_lock 0x0>;
+      interrupts = <0x1 0x0 0x1f 0x4 0x1b 0x11>;
+      clocks = <&scmi_clk 245>;
+      clock-names = "sw_sdio";
+    };
-- 
2.34.1


