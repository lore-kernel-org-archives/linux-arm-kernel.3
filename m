Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEB3103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=; b=zRUY9HC65qH3nC+qq7Nt85m6/f
	GCURBOhKiOLUZecPzNOhOUXVISB9zSFSwpIY3uw05eAD8Mwi6rNp4K643lEGQoPd81cUafa4ON1tC
	+1210ti/44r6PS4bcaOErraOWqQ4MboMRw1sPe2Z8ZBBYY6m/tXuu3j3bU1wpvADO9tIJk2PXQfKV
	wLVFQsH8hNDPf73oachH9I2+UJ4laOiw838+dDBLgfOc7fQl/Ds41ZngaqX1s+E3P0UiwoaGhELQE
	UmpbXACLxa1nGvOaLjdEKDowNAqN8lRxsNkTae4jAyh6vFuurN/LwcESNv/FEfddMBgwXfD57vSxv
	hGUBzp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbD-00000008fJD-1mUk;
	Wed, 18 Mar 2026 15:14:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbA-00000008fHw-2YDo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48534237460so74551025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846855; x=1774451655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=viKwbmJDLO4j0ry8a5otTiZ/PXaQcq92pwMizTKzXxDVLQI6XcKqnxHTdOS8NuCs4q
         Bpw15ohd88V/nV3vcHHCUN5fmANJAs5VoV1mHBkRUbHLreZ+lFQdsj5r5Nn+R+Tu5DW0
         qdC7+GL5Cn5700sgtE6eYqVsx9H+Krn8tQQ98hg7138OqzYvEV1I2Ecv8hZ+JVq3T5VF
         uo0p4TnkxWlY+aTNZOqUgtGc5ugPwLKV0jbnMxbW18Ia3LowssQuf898nvxEplV/xsie
         ufsAAqO47VhzLKDNNkkluwR9/0qNfPzbrFTgozu8SUx/1elw2zTkGMIF1VLT2oYUzylS
         CCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846855; x=1774451655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ImC7JYktkxok0GopAWiBnlLjndy630gvC7bm52DQqA=;
        b=BdfsJXOnIWzmWxCf0KX/qs2UUJwJnJb4l/OTAWBDKygumcPXP9pUUYW3dNGapcrt4E
         7aY+jE65edv70D4NNeUD9i70RhXfSiAuUNipHKj3R0OIUXoyDOu7ZzKTqMDDPUQOLF/q
         ifYwiFYnINc0pKjSZlmGsNTx1WTgIt36LHXZmdTCBPhEGmgtuWBKpg7RGMWC699tbaR+
         cUxe6VhZshoEFET6D7nnwvMNk/qoG2Obv+He/9iL4LHTUENzpz5D2S1i1vr/tpEkPwhY
         9fWpH2Dw01mKDTG4+D/WwDUS+uJ6Qefkr9/zZ6PW83qQ8wEXOsx9JhY7iI3uhGzC+4wh
         Qs8w==
X-Forwarded-Encrypted: i=1; AJvYcCWHLzCQdPq6PI6kMCtU/xCTMlT6zYdl7CcfZ5Bj9xJXtd4Iv/8KqAxo//sZKSQBhePAlFw8X73WaHc1FchqHz4c@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl2acmR6cltW6zqNNaTxZJ5+fXhrjYDJURYZSGDJvlApryGQka
	D7SUFWzww/b9ZcuAnkRYm+aINM8xcvP34hiUZqE/5R+kIq0aC3mjAz/ksBRfjTOtzJ0=
X-Gm-Gg: ATEYQzxbU9BezXd4t+o+yZKtCXRbijU8QWmRrdUKn8x9AHeGgs/KpIc0XsCYNQNoZDE
	RifCotLCgM858/J4pJgIOzO3fr5ZoKCc3hynX/17AFIPoSXCaRq2L5m6n4oJZ1dg+Rn9FpB4HEB
	YgL9vK7r89bgFrEpQ2yZ8FJGNwUIfetYtU0lkTitlOkmVYkFmPeuXodzRsecLVK4GjvyZgonddw
	2pTuNvopKFbShRd6DnD8ur+/o73Z4keg6Vu1cn7Z2YaM1RAO8XMDq/HoTgGsOWFin3A7XJo8hsd
	pjHDZENyt+026LXnrpQvde95QJHLGOItawgnWhSzQBNWT/83ngMJi1dI3ps7ZB7ZgJHiBHCgKQC
	Py8jNloyKbDBLNloH9/vD8g7bNWpwUSfMhE8FGge2pDro7Gjy5Y2W03sSWOGFLVL2ld/ir1bvQo
	Pp9wZxbYuDrfAIEzp5Xy2n
X-Received: by 2002:a05:600c:4ed4:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-486f4444050mr65455555e9.22.1773846854673;
        Wed, 18 Mar 2026 08:14:14 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm20352005e9.24.2026.03.18.08.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:14 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:07 +0100
Subject: [PATCH v3 1/7] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-1-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdBwUNnHfFW5ryz8nee5vlorcu+/MYWZ3wJTs+bb4ge
 vCW2wH/jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZiISQ3DP70akWNfjFSfG503
 qEt9X9gpYfWIwyFUTa6hlj1PY9c3aYa/AhNO8xVK5F6q4FlmtNds3YL0olg/ubsb5zksyC5QMfF
 jBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081416_673383_D1452114 
X-CRM114-Status: GOOD (  11.71  )
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


