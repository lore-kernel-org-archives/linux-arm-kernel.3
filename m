Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880ADCAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=; b=tt5zogArYQOmsoWtmKRcXr608c
	5Jh8tqpvhDQhcmr4EYQLnu4AfQ+G1QS7mBake10reJz21wGNRn/yrV35bzI8D++FYFXqy1i0RlXGT
	WusrNTrbnzY8NswfRZfY7qxg7JHf79P8/S+drn3qnKDL5rF6GI+QuAEGGlF8DrBS8ccVdZkJesZLl
	dDHpFwWQ50o2OX03Gc2isKd6o0iXooCC24k4q8IkQfm/rcBiirdp9YCAuMERjmyFitALvHy5qJvev
	CwFhJp16yh5I1ou26BlZCmSUoXha9yESJmOBWyacgQlR10220dYWG99QCXanB/aAfwrCgIuDbUdsQ
	GduonzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0j-00000004gq4-2Scw;
	Tue, 30 Sep 2025 08:47:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0e-00000004gm3-1bu4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:46:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-41174604d88so2885193f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222014; x=1759826814; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=Shw/0TGbTQT7qq0tWQR7tV++nkEHqZ7KQT38aju38Wsj86ON9Shc2l9nRPHDLd+Moz
         zWVkyDX13Lf7rNOLDdVm9d4/3cLwIlW4jLobF0nXqYEAfDxdwkPbPtSlxg5FgSGgHz+U
         GnvbBKQY7N+gga4pkeXogLjbzubuYBl+WjXZ+LmjON5uwxXfWC1rz/RsRIymeQgmpDUt
         PQICCO380rP4tDiBsfQ3lBn2fq9Ge6A9aT/jh0aIaFyOhHWvydfZas+HmOf7i9fyEdCT
         xoNAraEAy1PLhNCI0OwuvItRLo9GRdhZa1lazfcq8SwqjYJhOk3Vfnzz9ryYFknVk8ol
         fyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222014; x=1759826814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=gO5rqI7lpxBZjPL4Xb/qIfI6Ha85r/YUvn0c085DbyhR7z/xIXb2pC9FNjcot52VY2
         QjSvtHD2eB72S/pSCF/IRTV19yKU1y/S8yXflxcF6/Fi/6UwKjeWxSRt5bksxEV2bIKX
         sxk1my4cQlXeGso8BiAtVCd9wRW+CNDtYjpFboetjuWZiUPiQLfEaTfrjtpvwe68/Zvt
         RjvOoB7wcJ5tToQJGfd7mjOcdu17Gy7/GXV+yoAfjHd8b/gl5eeE7akjqQow/izA/vEv
         fN8rzOO2zIJoPODkLgCVpMTbXsJw9SvfxU4SoGAr7aYdn18mCPsTOeMcVSEDCE7X9gDQ
         MMyw==
X-Forwarded-Encrypted: i=1; AJvYcCVEGa7bPXH4Nen9CGATqhbRdHpygFC9PMN5h+4NuG3g4zpnoB82d9aveF1U8aD/B/4omiBKewOV+gWnvtKMNUla@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+MJwSpYD0UjgpSB4wo6hrw1Qj9JWIel8RjCL3xH50LoDMkxXK
	j/jhE9XNhXDZOObqYirBCYzNZhfEQfYftWuEWC/WMgUuBBrzUFn65f5H
X-Gm-Gg: ASbGncskiS8gIh10xAQNoUoskTIbgErzL5+96xpR7ME9YILLQyjFywVgMjQ7aGaNlNG
	lF/KxqLHcZaCb7c+ZvLdIPzyzOb+iZyitcSE66yR6NrWlrAUoZCWJDy15v+oeqfLjrFg2kMWteZ
	Vp4+F6O7MwVgXlmwzJS+USuYUGVV3DOF6RxPTwLKL6iV8KzJ1JA9t/gRSdYQHYfAVxi8zsyrOAe
	Q3ve90EZ1rXjnvadY6O9NAE3wy1zDHWsZkpOly0jeg+lRhuf8sVlj9BjDU++kywQ4RJ9wRNApMv
	E+YIcmbPkD4FOuBquOiSuRbjhhhFHI1yKo4kNIU36n0Or06xKpUUlrpOxcH18db8DTcFcksxcMa
	Onmp12WAdLQl60DRDC3J/ulY2NrdpcfspHDBLogx5EklQXjoR8bkm2+6t7djccD87G2SME6UWDH
	Y74UpNbwEDMDHvISo21R83tF0P9g58+XXeqfctR6M/xgmhvhVNqqM=
X-Google-Smtp-Source: AGHT+IHTFPZzGx4b88SoI+qS9EQDgCRRYbI3BPB4d5PmhtBVYrKjFEQXmYR1LT+gc8Uw7C4dhTNdmA==
X-Received: by 2002:a05:6000:4010:b0:3fb:ddb3:f121 with SMTP id ffacd0b85a97d-40e4b1a079dmr19776194f8f.45.1759222014438;
        Tue, 30 Sep 2025 01:46:54 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc88b0779sm21417757f8f.58.2025.09.30.01.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:46:54 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:46 +0200
Subject: [PATCH v8 3/7] dt-bindings: memory: factorise LPDDR channel
 binding into SDRAM channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-b4-ddr-bindings-v8-3-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014656_455624_0F1742AD 
X-CRM114-Status: GOOD (  14.38  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

LPDDR, DDR and so SDRAM channels exist and share the same properties, they
have a compatible, ranks, and an io-width.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 34b5bd153f63..9892da520fe4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -1,16 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-channel.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,sdram-channel.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LPDDR channel with chip/rank topology description
+title: SDRAM channel with chip/rank topology description
 
 description:
-  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA, CS,
-  CK, etc.) that connect one or more LPDDR chips to a host system. The main
-  purpose of this node is to overall LPDDR topology of the system, including the
-  amount of individual LPDDR chips and the ranks per chip.
+  A memory channel of SDRAM memory like DDR SDRAM or LPDDR SDRAM is a completely
+  independent set of pins (DQ, CA, CS, CK, etc.) that connect one or more memory
+  chips to a host system. The main purpose of this node is to overall memory
+  topology of the system, including the amount of individual memory chips and
+  the ranks per chip.
 
 maintainers:
   - Julius Werner <jwerner@chromium.org>
@@ -26,14 +27,14 @@ properties:
   io-width:
     description:
       The number of DQ pins in the channel. If this number is different
-      from (a multiple of) the io-width of the LPDDR chip, that means that
+      from (a multiple of) the io-width of the SDRAM chip, that means that
       multiple instances of that type of chip are wired in parallel on this
       channel (with the channel's DQ pins split up between the different
       chips, and the CA, CS, etc. pins of the different chips all shorted
       together).  This means that the total physical memory controlled by a
       channel is equal to the sum of the densities of each rank on the
-      connected LPDDR chip, times the io-width of the channel divided by
-      the io-width of the LPDDR chip.
+      connected SDRAM chip, times the io-width of the channel divided by
+      the io-width of the SDRAM chip.
     enum:
       - 8
       - 16
@@ -51,8 +52,8 @@ patternProperties:
   "^rank@[0-9]+$":
     type: object
     description:
-      Each physical LPDDR chip may have one or more ranks. Ranks are
-      internal but fully independent sub-units of the chip. Each LPDDR bus
+      Each physical SDRAM chip may have one or more ranks. Ranks are
+      internal but fully independent sub-units of the chip. Each SDRAM bus
       transaction on the channel targets exactly one rank, based on the
       state of the CS pins. Different ranks may have different densities and
       timing requirements.

-- 
2.43.0


