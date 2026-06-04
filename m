Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4746ACD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLUAaZps1w8Jl8h4U5vkB2L5GVDJaAP0Yeaa4HLYIr8=; b=Uvw1PmpRomuRj52qtEYnpEA3xa
	MNhxY49WhhPOJAC/Bo8VS5EReCyakAggKLzjnfHeHiRFmORaPLkgRbsV8Abwdxlp9tQhY4xRaDgmX
	qn+9pNvW9GgMHUfvo/yjLQrn15uL5v25mCMrmostkq47+PFY436IH6mpXjFru8ZNuEE5IG0yAXtv5
	udLaD8T468h48AK+qi8DJCny5OXy3LQmQ4xCjTwZP/VKaYv0YUk+ahwxw1hBXBXlith9jx0a9K7Wh
	pLtCRGohNdFubz15GlaORptCuipnC0504/0u3vDj2/M/jAbCurgvYHgyzyGGcnMJkpNEUyvuvBZkD
	hUAoVzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VW-0000000Gq3J-3BO5;
	Thu, 04 Jun 2026 13:53:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VP-0000000GpnR-2hTS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 13:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WLUAaZps1w8Jl8h4U5vkB2L5GVDJaAP0Yeaa4HLYIr8=; b=VgMcGZeWaq4KHLXbzad1ndS9+J
	5r7IBZ9+MB7dewegLMB7Xanebawq6kseSN8KNJJLcwoiWvhCTw4hCR3dnVvIKdU2Bv6V8X2/ZbdJ7
	FIKAL/oTijc6sO10ZcDIqWEaLouIPFGffjRxstw1jA3CJG1etd9U321CmrByEjzkz++cIibVlYwO6
	ljSz99C4GQT09Hs4QH3Dk46IetsHOLs4vM37jhzdhaj5u4ZlZx66F0heFgdnG54uwX2qv1t9+4QIO
	A2Zr5L0fLIBxjC2RtdxbIl0KNiFqeISMtUS1hGhFgSCJ4IKP/mcNu1lFAerWrqIXGhIFxlO4dGFKD
	A5fpXyPQ==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV8VM-0000000EOtC-2WpP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so580472f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581183; x=1781185983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLUAaZps1w8Jl8h4U5vkB2L5GVDJaAP0Yeaa4HLYIr8=;
        b=hYxBYHGF4Ztr2aF4EgtKRGS21eNaPZMRY2ABklSuYwI0D5VhmqfgBvkyIqvfG2/9Or
         l2rmejNxQXrUam7RfCeGui7mb+rTLr3ChERghkJ6NdZndDemT6b3Zp4063j6571HjbbQ
         KoAGbChHzN/vp2UihrpCGVQv4gKaDRnFqERRUeUi2rUDbOJx/fI0oGf45158L1saj0Jx
         OjPzDDapzbbDP3YXLaaxj4fXB8Ry7ssLkYO3JOIztKFE+vMUjIfS6HLvQ2I5PxRq16Ff
         ab3+2JHGhHpnWXg1v45dm2jWAbbHlPiDHFTjfkIID0hLaHpGFOxdDtMOjRCtk2og1jMH
         pIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581183; x=1781185983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLUAaZps1w8Jl8h4U5vkB2L5GVDJaAP0Yeaa4HLYIr8=;
        b=OAurO5evhIktLSZAeepyAkpDT2opMETL/zpQf2rWQFYOIoby0vKia4ZiikgqoX1GVG
         JGpWx1qRgZre1gFcDYDdIJCK+/V6tgQfvdWYE0+7hggqmqqti2ihXBiq+kJniBzNnS0U
         NR2ypvkT2Uz2WkyXXQAXhzHgm8eahAKfb+s7xk2fmpSogmxOqI5HTAN2EF/XqH/Z5tJz
         YLhJrMo3OOrXlPvA6mzp0zDe6lZNAD/R6wBwJDAgjZQVjApkGm6PARljz1+Mi8dN3deV
         F9qJ6cJPkzK9dHyGE31VAMTWsS9XIzghNqa1ljUH93BUTTus3VoNUr0G0SnbY30r5SuD
         oTOg==
X-Forwarded-Encrypted: i=1; AFNElJ8KIXcSJZ9yQ+P5J616oLhzgPLMm26+NR22sOlMWfstQFH93yIUAG6bcqSaybXwB7x7CNu87UP4BmJF8yzSkiDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxvrZjJsT3IkT8KRGuaP2WWhStuQjZ+nu8FP3CGs/m1gm8Me86e
	A5pyfjvZmojM3S+NRMwLLRVQK40quuW8eHrrxSEXCvw9w1W23etpecd8
X-Gm-Gg: Acq92OEJo0+TVu7T3ouCsPVoa1+UKcgTgCUxJqj5XV3i9ozsX7etxtkRt8skhxvidPq
	5dHkJJbY0gLLgS6JsFDCmQVazkTIFm65KC2SWHOOcis56L8LyZfbV2VC5tQFYFqUGERDY4eo+k/
	LUv1gVEeRVJGHGS87y0P2YXljAqm1c0dFCItthh0j4yc1dSxn0CxnhjQD1+0A40pWS7GSDEQF+9
	sKPiapWeQdzV2DM8qWQUBx/8JuBJHTMc79YGuKqcWbOj1wa9NU5CCHTUseisThrGw4Rl1FOrnzR
	+457vx6zOGRiBpprx+BMnnbc4+H8EpGua75lW9qZPLq7g+gTyyXhVlpBvXx3AzjrEecbRbxrKjl
	cGSIMwFI11+efJkx66GDTrLMpU5/nhO+q1pF/gWDHkiUk7Hw+GH+4SY7XMKD0YPdOgrc8wh52Kg
	m32w2JnxF3jHPulArWgA4Or/rL6u1p6jevUHGaIXdRil6imoLTihODSgtZid7veqU=
X-Received: by 2002:a05:6000:982:b0:460:2d57:fcf2 with SMTP id ffacd0b85a97d-4602d58034emr3094425f8f.10.1780581182959;
        Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 7/9] dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568
Date: Thu,  4 Jun 2026 13:52:53 +0000
Message-Id: <20260604135255.62682-8-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_145304_741159_9FB0B632 
X-CRM114-Status: GOOD (  10.10  )
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

The RK3568 carries a single core of the same NVDLA-derived NPU IP as the
RK3588.  Add its compatible.

On RK3568 the NPU NOC bus-idle and power gating are controlled through the
system PMU rather than a dedicated register block, so add a rockchip,pmu
phandle to that syscon.  The RK3568 NPU has no dedicated SRAM rail, so
sram-supply is required only on RK3588.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd1..af9936b32e9fe 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3568-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -50,6 +51,13 @@ properties:
 
   npu-supply: true
 
+  rockchip,pmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the PMU syscon.  On RK3568 the NPU's NOC bus-idle and
+      power gating are controlled through the PMU; this points to that
+      syscon so those registers can be reached.
+
   power-domains:
     maxItems: 1
 
@@ -75,7 +83,15 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: rockchip,rk3588-rknn-core
+then:
+  required:
+    - sram-supply
 
 additionalProperties: false
 
-- 
2.39.5


