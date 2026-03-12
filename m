Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF1106705A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=; b=xXnyumwItEEY/5z3tjOTXWJpbB
	9iVwuZO4K8UXTB/VySATVcxNsiznSDvWffn2iM6NjWoLOKqQ8f4whJ+rq01hjUTdgcADT3cA/EJIK
	KdB0FGProyiNcNKUDjmxkN4xtONA8LJmfrz90HOP1I6vJw333hInN6x69bU4UQsK2MlEiN2ybA2ae
	QLoReQGmiP6+RmxXNteNIuTKRH8JzghpekAUHpoWOk1Aqtyq3T5vXGG9InwZ1haqSRLoTZS73sueh
	8xfRdlF/cncA1IQ2m+wza/Rdx73QMokZ3eQWuQFNClpORzSu9DRtpZh4QLytSXUzhuIyBrqCR8g8o
	GgKIadMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIe-0000000ERUZ-1P8Q;
	Thu, 12 Mar 2026 15:50:12 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIc-0000000ERT9-0g2k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso1258760f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330608; x=1773935408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=fpfRVuFthZYL15rl3f/EAhL1j31wrXsmS6/EFt/9yTrHqR+Vtb7BZbMc7DalRo9b0g
         K4kKUXHTqvx0OH2syrUsLFEdn4x2gVq61R3DwxTE+Yx4YFP+oOQlmpZzMtC2IbIFrjwK
         S11V2GSzMuZ79fM4Wn8VewNlpzHAC5XYnwgtwRLOL8lP3Ky9GsKWDiTI+25j1kFo1hXr
         qBrh0NQ5wZfoeq4Os8u2I+lYBy6V6uMMPcd+/F+5p9rKQc/DeMpwAG6Qhtljanuf04ND
         b8Zxg8ml7mJcRkM7M/EOTaMriWdgfhE1E63n/12QviWQkFq62QZmojq9nBpvJIoGq1NV
         5Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330608; x=1773935408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=VfktXsNC77xJ1JLgBmxwP/54SZxtGKO+7mDTu1nuUMrQfXooYa2vVwFQS+gEnpHF+0
         YjQ85qSN8rqHtV4v1scgn070QJVU5NmvqziKwpzjsT+E/3Al7GCJmrDMIe1Fv30+zGjv
         rQx5qlL/odHLHgFGyjsBnGHg/K4DyDQPNk9ftfJJf/mK20BDu8DhBvP2Aqrlyd6U3s1R
         WIdiHWxJ37ju2iGSYLMHncXJoVuzyyN3m4LAht5QIM8Po9YUn3VbHQWMeB3MtKQrmba8
         +VaeaHcE68p4wMx7xTbtSa1YC3Rd684KbIPUjo5SrqgymWUAKr7vQxhOr8yLksOAPiXk
         nQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCWRwSjs7BUJYQg4lXWpDoVXi9Waoc2A3EeBunctGd/Ftm6xev2X+K49ELi4PziJ6W3lcj5ftYy1BI2gqtUTJsxl@lists.infradead.org
X-Gm-Message-State: AOJu0YxH+LYPpBG2vGeQLDO4js+m6GMY4+D7QVZC8mBKt6fPcOcH7peO
	VZgfgiLzdlyvIvKW6z+CwO2kcNitAlrQcgtZfqQNwB64Pw3i5oekcDCKSMVLkdySiiY=
X-Gm-Gg: ATEYQzz7d5uVIdSgZfLwM/EgBcA9U8hKTf2i5KcME0XC22O00jtLsJMaVys40N8LoP/
	yG7UE87Yy3HwdYqoPOBBK7g/tAR0BvSgfDlHTQTe8UiT96Q60GejxQuImkUmG17/CgmDB8sS4yh
	oc75I2u5GzOE3Z9YSLlUB/mhjkrHZwYoSoX1vk8eLtMeNPT7QCxyyK1G0TLv3fRmqWOVsKxuK3x
	Ww4l2ovj7r0d3ZnNiKBqTc3O1wVzjE7VWmY0YV+SkQQhA0DVq+sUCxAeqiye7Pb1TnTgyEFUDl6
	yqBjHYs+K386OVPUaQymZsV1MGE0RMOSyi/yE0zwUcANPaCght/D4+1Je4zpvZ8gefOCAbx41Pa
	hGZUS3euMPNJdTRJrvhwlkJapa1zMJu/MoSXUH9+QR5NMH/PL68w/Dhhft828j3AtOhyX0bKD3R
	uDov+q1xTGUDARM7S5FrEgTp6wrSBeebE=
X-Received: by 2002:a5d:5a02:0:b0:439:c4f9:31f5 with SMTP id ffacd0b85a97d-43a04dbbd96mr248779f8f.28.1773330608031;
        Thu, 12 Mar 2026 08:50:08 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm8306626f8f.10.2026.03.12.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:07 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:55 +0100
Subject: [PATCH v2 1/8] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-1-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817; i=msp@baylibre.com;
 h=from:subject:message-id; bh=lmYPucQZDJWxhd4ULKfj2Y/9tl9apl6fEaECLmkHdew=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxNDwoj4g7LHZth9f3NhJNH/E6+qJgpq/HppcgM4Qud8
 5RqwiqSO0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiGRMY/op23Prz2qslMKom
 uemGOl+N8vZbk5h+C/ZNdP5u/I6hII+R4Xk7p9cuN2Orn3mHsiZYVvBVfWycP7lc/tc0E19PjvW
 tXAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085010_232113_E3F34F62 
X-CRM114-Status: GOOD (  11.93  )
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

Split up the region reserved for the firmware image in more specific
sections to expose the full fixed layout. Especially the LPM metadata
section is important for bootloaders as it contains information about
how to exit IO+DDR. This is read by the bootloader but is written by the
firmware.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 29 ++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index a927551356e69d3961b3c5c6b72d027fabe83d3c..15e0286e4926865d88b693998e5aa64543ae125d 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -154,17 +154,26 @@ patternProperties:
       memory-region:
         description: |
           phandle to the reserved memory nodes to be associated with the
-          remoteproc device. There should be at least two reserved memory nodes
-          defined. The reserved memory nodes should be carveout nodes, and
-          should be defined with a "no-map" property as per the bindings in
+          remoteproc device. There should be two reserved memory nodes defined
+          for the basic layout or 6 partitions for a detailed layout. The
+          reserved memory nodes should be carveout nodes, and should be defined
+          with a "no-map" property as per the bindings in
           Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-        minItems: 2
-        maxItems: 8
-        items:
-          - description: region used for dynamic DMA allocations like vrings and
-                         vring buffers
-          - description: region reserved for firmware image sections
-        additionalItems: true
+        oneOf:
+          - description: Basic layout
+            items:
+              - description: region used for dynamic DMA allocations like vrings and
+                             vring buffers
+              - description: region reserved for firmware image sections
+          - description: Detailed layout
+            items:
+              - description: region used for dynamic DMA allocations like vrings and
+                             vring buffers
+              - description: region reserved for IPC resources
+              - description: LPM FS stub binary
+              - description: LPM metadata
+              - description: LPM FS context data and reserved sections
+              - description: DM RM/PM trace and firmware code/data
 
 # Optional properties:
 # --------------------

-- 
2.53.0


