Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3EACCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOiFmH8IcpAAycagiDhvMebDsaH97fid1dP1cj7j5ro=; b=AP/haLJF7Cp2kU46dTtyCCbWi1
	Znp/K5TwXhDhH1gTzPMPyFM2+9H2Oq7DkH0k6TUJGXzSljfTxzyroinHmMh8cueUJyEgoWldu3ffF
	h45Tj5mO2OSSGFm5GgJkmPqYGUSaIeBlCrQzGiF/UVFoCojLXhwPXgAWFRvwa1/5bIIgdXsNscuy+
	TT3xc8Ua1M5eogB3CWOEmR5ygbn2j3ahbWMqHtTKGv2f2LIhAoYyFyJdHJzX9CIKW5qlaKybc4GPM
	q1KwAJcf2MWrdD288CNyogjKpddnMUsONs9mMuxkbAJnFmyV2f7/8deJfmjzvjJ/3eKGnP7qNkQl0
	FVuzXSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu0u-00000007gRd-2WaD;
	Tue, 11 Nov 2025 19:26:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu0m-00000007gPh-3ZSm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:26:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2957850c63bso17055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 11:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889200; x=1763494000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOiFmH8IcpAAycagiDhvMebDsaH97fid1dP1cj7j5ro=;
        b=J0v/C7IIHP8cjWEiSCLhwqx8yJPVXViiqrV4Wk5sABzaB7f3Hzmn5BAkupV+srcKDk
         7l0KNPAkdGtTOSsZtM/K6UYlD4rgCkk12HGfGYBB1HftIppHlmArvoSsyVlg5P3ps2xS
         +SI/gCxoia40/mtnhUhsprO1cR5PHd3MXpMa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889200; x=1763494000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOiFmH8IcpAAycagiDhvMebDsaH97fid1dP1cj7j5ro=;
        b=JIbMSUb0lO1zzUUho4wGMx2/v59g+8AzlaidEBhxeQ3cpL8cm/CBN4pm0xCFQUxhw9
         Gz9nW0KKBBu+L+NWOZEw2L6oUOhDtbxbTL8RD1Of5QpzHjq7V3cGlVYWZ2QcEG2lpK+v
         IOhjtSTPjmbvta5nd87dTJv7r5U7PGPOUpl6TdolCz0k58Ehub9c5I/yOPfnGr5i0yzT
         5oimx4NUA51qwNVqPoc2RKJwCw7a5RNn4sXWZ1OEGrzopW3ZC5ks25VutrPSAVO0YFH0
         ZLDlyHmp/T6WfGChuUDr+VeqbbNA8M2xmScJTOWbY4fuX5C45Wp7Rgs31IR6rFDW5cj0
         SGqA==
X-Forwarded-Encrypted: i=1; AJvYcCWnL1gTJuqbddGzQjKZRJgcYV58NUwTfCouMIau0b062NLyac6gUFkWYdNagneStCVcpYzBINzFS9+bjWMd3JR/@lists.infradead.org
X-Gm-Message-State: AOJu0YwvYfgQMnhn/7h739EOE0YUag2oHI9zi87SVSXM36rk6p8fXVqU
	hn8aDtYe2uGzOcEPhn43Ldx3oganDNDttYKSYf6yT04ZEXQShq4eWLbJe7O5NtIz/g==
X-Gm-Gg: ASbGncuJc1593OJLGBMUTT48DIjBHfX9s7EzQfcxJz4Z6IJ+NFmNG4GMzvTt3mr9S9J
	my8QWZ0I015EyMEPgldimbKNZ+lce4+wU5OVS0nMNNNqqdoYyUYT5Y4+I99MySbOr3c8ESm6kHS
	2MSz4vk5yj/sRwB6xDbrLQwEBWYUYpCQDHOL4N0ZFaH6yJyv1+cchoxu62edpafaOzdI295L6NL
	rneLeYZenESHCd5gkCwPlAfd1mDTDaBVLrH8hGEbdVMxab5NxyIYdlrrp1FzU+b92njaFfxOWSv
	7VMcfMqgFY6aZQUW8CcJ1BjfjpHP0yCnScO3DQonVGybJ3o8bnzD8Z3I7/hrKAZRkS+t01thmMo
	VgPIe3XBrU21jrfp8j9OEBskpnY82aQ/pt+50GOaEspvMKjdyz5Mne1jXypA2CdXba5d0jF6rR+
	N6WjAWo8+1FE8Ay54+a4L+fDPmE73cVPG1azCec5xJzAPqM+BIG/n4NCqhjyY=
X-Google-Smtp-Source: AGHT+IExodWlioL1RP371Naq0b/EutoicCgiE5LxahmeztexeT56t42134E6a4LSJf3+oS+yxTk0Jg==
X-Received: by 2002:a17:903:234d:b0:296:5ebe:8fa with SMTP id d9443c01a7336-2984094a5bcmr45666845ad.23.1762889200005;
        Tue, 11 Nov 2025 11:26:40 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:39 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
Date: Tue, 11 Nov 2025 11:22:04 -0800
Message-ID: <20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111192422.4180216-1-dianders@chromium.org>
References: <20251111192422.4180216-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_112640_902021_696141A2 
X-CRM114-Status: GOOD (  35.96  )
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

Add top-level DT bindings useful for Pixel 10 (frankel), Pixel 10 Pro
(blazer), and Pixel 10 Pro XL (mustang).

Since overlays are fairly well-supported these days and the downstream
Pixel bootloader assumes that the SoC is the base overlay and specific
board revisions are overlays, reflect the SoC / board split in the
bindings.

The SoC in the Pixel 10 series has the marketing name of "Tensor
G5". Despite the fact that it sounds very similar to the "Tensor G4",
it's a very different chip. Tensor G4 was, for all intents and
purposes, a Samsung Exynos offshoot whereas Tensor G5 is entirely its
own SoC. This SoC is known internally as "laguna" and canonically
referred to in code as "lga". There are two known revisions of the
SoC: an A0 pre-production variant (ID 0x000500) and a B0 variant (ID
0x000510) used in production. The ID is canonicaly broken up into a
16-bit SoC product ID, a 4-bit major rev, and a 4-bit minor rev.

The dtb for all supported SoC revisions is appended to one of the boot
partitions and the bootloader will look at the device trees and pick
the correct one. The current bootloader uses a downstream
`soc_compatible` node to help it pick the correct device tree. It
looks like this:
  soc_compatible {
    B0 {
      description = "LGA B0";
      product_id = <0x5>;
      major = <0x1>;
      minor = <0x0>;
      pkg_mode = <0x0>;
    };
  };
Note that `pkg_mode` isn't currently part of the ID on the SoC and the
bootloader always assumes 0 for it.

In this patch, put the SoC IDs straight into the compatible. Though
the bootloader doesn't look at the compatible at the moment, this
should be easy to teach the bootloader about.

Boards all know their own platform_id / product_id / stage / major /
minor / variant. For instance, Google Pixel 10 Pro XL MP1 is:
* platform_id (8-bits): 0x07 - frankel/blazer/mustang
* product_id (8-bits):  0x05 - mustang
* stage (4-bits):       0x06 - MP
* major (8-bits):       0x01 - MP 1
* minor (8-bits):       0x00 - MP 1.0
* variant (8-bits):     0x00 - No special variant

When board overlays are packed into the "dtbo" partition, a tool
(`mkdtimg`) extracts a board ID and board rev from the overlay and
stores that as metadata with the overlay. Downstream, the dtso
intended for the Pixel 10 Pro XL MP1 has the following properties at
its top-level:
  board_id = <0x70506>;
  board_rev = <0x010000>;

The use of top-level IDs can probably be used for overlays upstream as
well, but also add the IDs to the compatible string in case it's
useful.

Compatible strings are added for all board revisions known to be
produced based on downstream sources.

A few notes:
* If you look at `/proc/device-tree/compatible` and
  `/proc/device-tree/model` on a running device, that won't
  necessarily be an exact description of the hardware you're running
  on. If the bootloader can't find a device tree that's an exact match
  then it will pick the best match (within reason--it will never pick
  a device tree for a different product--just for different revs of
  the same product).
* There is no merging of the top-level compatible from the SoC and
  board. The compatible string containing IDs for the SoC will not be
  found in the device-tree passed to the OS.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
In the past, attempts to have the SoC as a base device tree and boards
supported as overlays has been NAKed. From a previous discussion [1]
"Nope, boards are not overlays. Boards are DTB." I believe this needs
to be relitigated.

In the previous NAK, I didn't see any links to documentation
explicitly stating that DTBs have to represent boards. It's also
unclear, at least to me, _why_ a DTB would be limited to represent a
"board" nor what the definition of a "board" is.

As at least one stab at why someone might not want an overlay scheme
like this, one could point out that the top-level compatible can be a
bit of a mess. Specifically in this scheme the board "compatible" from
the overlay will fully replace/hide the SoC "compatible" from the base
SoC. If this is truly the main concern, it wouldn't be terribly hard
to add a new semantic (maybe selectable via a new additional
property?) that caused the compatible strings to be merged in a
reasonable way.

Aside from dealing with the compatible string, let's think about what
a "board" is. I will make the argument here that the SoC qualifies as
a "board" and that the main PCB of a phone can be looked at as a
"cape" for this SoC "board". While this may sound like a stretch, I
would invite a reader to propose a definition of "board" that excludes
this. Specifically, it can be noted:
* I have a development board at my desk that is "socketed". That is, I
  can pull the SoC out and put a different one in. I can swap in a
  "rev A0" or a "rev B0" SoC into this socket. Conceivably, I could
  even put a "Tensor G6", G7, G8, or G999 in the socket if it was
  compatible. In this sense, the "SoC" is a standalone thing that can
  be attached to the devboard "cape". The SoC being a standalone thing
  is in the name. It's a "system" on a chip.
* In case the definition of a board somehow needs a PCB involved, I
  can note that on my dev board the CPU socket is soldered onto to a
  CPU daughtercard (a PCB!) that then has a board-to-board connector
  to the main PCB.
* Perhaps one could argue that a dev board like I have describe would
  qualify for this SoC/board overlay scheme but that a normal cell
  phone wouldn't because the SoC isn't removable. Perhaps removability
  is a requirement here? If so, imagine if some company took a
  Raspberry Pi, soldered some components directly onto the "expansion"
  pins, and resold that to consumers. Does this mean they can't use
  overlays?

To me, the above arguments justify why SoC DTBs + "board" overlays
should be accepted. As far as I can tell, there is no downside and
many people who would be made happy with this.

[1] https://lore.kernel.org/all/dbeb28be-1aac-400b-87c1-9764aca3a799@kernel.org/

 .../devicetree/bindings/arm/google.yaml       | 87 +++++++++++++++----
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index 99961e5282e5..f9f9ea1c8050 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -13,27 +13,18 @@ description: |
   ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
   devices.
 
-  Currently upstream this is devices using "gs101" SoC which is found in Pixel
-  6, Pixel 6 Pro and Pixel 6a.
+  These bindings for older Pixel devices don't use device tree overlays so
+  no separate SoC entry is added. This may change in the future.
 
-  Google have a few different names for the SoC:
-  - Marketing name ("Tensor")
-  - Codename ("Whitechapel")
-  - SoC ID ("gs101")
-  - Die ID ("S5P9845")
-
-  Likewise there are a couple of names for the actual device
-  - Marketing name ("Pixel 6")
-  - Codename ("Oriole")
-
-  Devicetrees should use the lowercased SoC ID and lowercased board codename,
-  e.g. gs101 and gs101-oriole.
+  Newer Pixel devices are expected to have the SoC device tree as the base
+  and specific board device trees as overlays.
 
 properties:
   $nodename:
     const: '/'
   compatible:
     oneOf:
+      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 boards
       - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
@@ -41,13 +32,71 @@ properties:
               - google,gs101-raven
           - const: google,gs101
 
+      # Google Tensor G5 AKA lga (laguna) SoC and boards
+      - description: Tensor G5 SoC (laguna)
+        items:
+          - enum:
+              - google,soc-id-0005-rev-00  # A0
+              - google,soc-id-0005-rev-10  # B0
+          - const: google,lga
+      - description: Google Pixel 10 Board (Frankel)
+        items:
+          - enum:
+              - google,pixel-id-070302-rev-000000  # Proto 0
+              - google,pixel-id-070302-rev-010000  # Proto 1
+              - google,pixel-id-070302-rev-010100  # Proto 1.1
+              - google,pixel-id-070303-rev-010000  # EVT 1
+              - google,pixel-id-070303-rev-010100  # EVT 1.1
+              - google,pixel-id-070303-rev-010101  # EVT 1.1 Wingboard
+              - google,pixel-id-070304-rev-010000  # DVT 1
+              - google,pixel-id-070305-rev-010000  # PVT 1
+              - google,pixel-id-070306-rev-010000  # MP 1
+          - const: google,lga-frankel
+          - const: google,lga
+      - description: Google Pixel 10 Pro Board (Blazer)
+        items:
+          - enum:
+              - google,pixel-id-070402-rev-000000  # Proto 0
+              - google,pixel-id-070402-rev-010000  # Proto 1
+              - google,pixel-id-070402-rev-010100  # Proto 1.1
+              - google,pixel-id-070403-rev-010000  # EVT 1
+              - google,pixel-id-070403-rev-010100  # EVT 1.1
+              - google,pixel-id-070404-rev-010000  # DVT 1
+              - google,pixel-id-070405-rev-010000  # PVT 1
+              - google,pixel-id-070406-rev-010000  # MP 1
+          - const: google,lga-blazer
+          - const: google,lga
+      - description: Google Pixel 10 Pro XL Board (Mustang)
+        items:
+          - enum:
+              - google,pixel-id-070502-rev-000000  # Proto 0
+              - google,pixel-id-070502-rev-010000  # Proto 1
+              - google,pixel-id-070502-rev-010100  # Proto 1.1
+              - google,pixel-id-070502-rev-010101  # Proto 1.1 Wingboard
+              - google,pixel-id-070503-rev-010000  # EVT 1
+              - google,pixel-id-070503-rev-010100  # EVT 1.1
+              - google,pixel-id-070503-rev-010101  # EVT 1.1 Wingboard
+              - google,pixel-id-070504-rev-010000  # DVT 1
+              - google,pixel-id-070505-rev-010000  # PVT 1
+              - google,pixel-id-070506-rev-010000  # MP 1
+          - const: google,lga-mustang
+          - const: google,lga
+
+allOf:
   # Bootloader requires empty ect node to be present
-  ect:
-    type: object
-    additionalProperties: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101
+    then:
+      properties:
+        ect:
+          type: object
+          additionalProperties: false
 
-required:
-  - ect
+      required:
+        - ect
 
 additionalProperties: true
 
-- 
2.51.2.1041.gc1ab5b90ca-goog


