Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DD1EDA682
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/1uzkb2dN7kd3Qkoeot6UDS00kHNcaUEjRCBygzqAo=; b=IXX4rsC5em9jKi0at40VDQ15bx
	3k8j93H22NzK5h/evKs7zaHblgIhjJNghclesLTvHs1/LuCf0KSXEQH36WMGgMVI+jm6iDvzuj0Xv
	WXhR7n8R6GQaKqOoDJcvtzYBBRrAnQ8Lt9/vG8Wx/kn/UwBM85NPRPR76RKNRr3/BRLxHGkE6mgpx
	29KAYuLWIizeLV/QiYxLHaXEWc+Ho9feovMFJOLJl28t8EdH8mo140Gj6A7qUjHugdkZcYC6FQJCG
	5n9WO6+bp1wJZIIWAGccID8ibS+vSH5rdO0YD8VwacLvFOk3Bs8hH67p+06qW5O9QGy0Phx27Su9R
	awkkIAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRb-0000000FOqc-41C2;
	Tue, 03 Mar 2026 15:13:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRZ-0000000FOpe-32kZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:13:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4833115090dso59864725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550832; x=1773155632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/1uzkb2dN7kd3Qkoeot6UDS00kHNcaUEjRCBygzqAo=;
        b=fQbXBbbusRf1vRHs738wJ+iMyeLZTTKJ4o2cQxHKSTgtW3gj6aNTSBbs3te8MdTmAr
         SvVlFpI9/Z8+j7c7m2wmPE/CXusUtmcQDmbzTbjYoabCvTGp9NaMRjpRNj0NoBQZxGXH
         vi5l+sS+6le50AVcfWzFql3VAjIilENIDChHZH263aeOoy/vVO4qlGPzkIhz7Vk4FJyV
         7M0BFwXZwRpeAd3xNNCUeKVnNUj0zolRaBtC4WhGylQxrlQyMTapeOTDdE4dShqgQMa4
         6Hzz4g7PWp/RxynNJsVQBQRdMmeOJvve9VhUgp4bO/rrdznxumQ5tvMdhIa4nZRtGqSa
         YxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550832; x=1773155632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/1uzkb2dN7kd3Qkoeot6UDS00kHNcaUEjRCBygzqAo=;
        b=Y8p15fGctba4i8Eihl0IH1e9yCIO457XH4AM6rc4NAbielgdb/2yC+ZwgFe8QT0OZl
         HkrgSu0Y3VnxVOB/CGMJYs3zJ2c/2noF6VKttXi76sJu+10+NHA3CPL2IG10y8Iyvt44
         VoC4r8END7KKE7r2Js4yyR6LT6MD05wVChYoUwsUm9bZmTZB2SGAPkFU/1OmpiOIHZkK
         iw5PC/5m+mpSJrONGZuTj9ykjAMMRatH7YjRDDkErkjJn0KvDYwf7aMClQMVe2+ubobj
         gBtfuMglhaMI77ZallNRcuI+lXszcO7Li2oibDr2MD+FuSr/MC2FJAGH0aMoGwZMhZHe
         Yvxw==
X-Forwarded-Encrypted: i=1; AJvYcCUU0hX5dgZ37ZvWvuZ0dbh8aP1USHu9AAk8CVyVBYo92CWSfqMMjomJ0o0pppZK7n6QU5/361KJq9m6758VKIyx@lists.infradead.org
X-Gm-Message-State: AOJu0YyvtEb1o/m9LO+GI2VFjfwynmGBFV6AnTsvSnjqCpo73t9xmL3Y
	2AOfyY1cZ0SNR7YfbGSmRGxVklZ/MfGsoSVbHZSd48yVxVx3+mkwFZmj7p6L4TdMUIo=
X-Gm-Gg: ATEYQzwBpVqgKuI1C7qBMInrFRJhfUBYcZ+s+gQpKadXMMmKDKAgFdi/+9ijHcGk1XR
	7QEw7SjXdAmQJX+VNr/9F0UdKMFKXJv6l1grZNXDzfxP5cKpqdPx+psj83qoSG45eqgHqDm7pva
	Ywiduq3pu11HKvLPmiRYr0Gx6YsC+aR+7L5MwJro7HkyYCBaTBb67HfuV9DtJZVTPrCy8OLuAII
	4LaMmSJ2GpH0lqufFlTQ/oC9OdOYdt2cuqiq6k6MQxf+sXHBaCDVSS0FgZU7lcuAjb2LIzE3Ac5
	xSI2LDFQKc+k14HLujVitqZRNffuaiiuMT5jID9jmUDWyDokuDOmReufSC/e9fa+EyaN3EDyHiY
	0uObLlfyvJLzh+38hqC8TaN89v2IJec0Cuf40HIRM8lTCwf65+Jl8K5G3ecGld3krUZ/OamSOrW
	IpnYVW2u6Vx+RSO131HYWf
X-Received: by 2002:a05:600c:c04b:10b0:483:79a6:e7e1 with SMTP id 5b1f17b1804b1-483c9ba7e28mr208421115e9.7.1772550831695;
        Tue, 03 Mar 2026 07:13:51 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48516f74a1dsm10512105e9.2.2026.03.03.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:51 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:12:59 +0100
Subject: [PATCH 1/6] dt-bindings: remoteproc: k3-r5f: Split up memory
 regions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-1-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2494; i=msp@baylibre.com;
 h=from:subject:message-id; bh=u51znr7imJISDF2aAPlKKydu7adw48rtitqrto52OU0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv/qNZCSmsZ19u8ro08pvk1aoWlxdk/vxRE+Hztc3H
 7llXn9k6yhlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJyFsy/HcxFJpW0HDvkyZH
 RE9cdNd1vZNZ9/c2/AiqFHzvdPud0hGG/4nvDyr+UfRbLNv0pW2/VLO77vxZe5yiJqyYfiXD16a
 7hwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_071353_788433_6D32F27E 
X-CRM114-Status: GOOD (  11.56  )
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
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml           | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index a927551356e69d3961b3c5c6b72d027fabe83d3c..6aadc61e20f9f4c27f5b9c87ab2025a02776c5de 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -158,12 +158,28 @@ patternProperties:
           defined. The reserved memory nodes should be carveout nodes, and
           should be defined with a "no-map" property as per the bindings in
           Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+          For IO+DDR low power mode support on AM62x SoCs, additional memory
+          regions may be defined to partition the DDR_LPM_DATA section:
+            [0] DMA allocations (required)
+            [1] IPC resources or firmware image sections
+            [2] LPM FS stub section
+            [3] LPM metadata section containing dmEntryPoint and fsCtxtAddr
+            [4] LPM FS context and reserved sections
+            [5] DM trace and firmware sections
+
+          The LPM metadata region at index 3 allows the bootloader to directly
+          read the LPM metadata address without hardcoded offsets.
         minItems: 2
         maxItems: 8
         items:
           - description: region used for dynamic DMA allocations like vrings and
                          vring buffers
-          - description: region reserved for firmware image sections
+          - description: region reserved for firmware image sections or IPC resources
+          - description: LPM FS stub binary and X.509 certificate
+          - description: LPM metadata (dmEntryPoint, fsCtxtAddr)
+          - description: LPM FS context data and reserved sections
+          - description: DM RM/PM trace and firmware code/data
         additionalItems: true
 
 # Optional properties:

-- 
2.51.0


