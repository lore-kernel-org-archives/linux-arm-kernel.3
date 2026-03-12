Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D14106705A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Der2AmEZNJ0NJcW9rSc7hfAjH+ZP+A00AJ4yvvTSgOc=; b=HzsVJ3spsF6VnPWCosK14Bp1KO
	aTUcK+9gk6H4wCHZASjQxKEP2C2i/3LEOKZzZ/SEr91q5yPvtgcD6RSb4TR7vXu8u5d+Ss3anIK0/
	s/OybnFgIJsV6foxl8AtsYTqk8s58fTXTC8kVDbojLrVX8fJshJF1i4gQGwuYWVI3Jt7JSBrG1YRw
	t2P+GaXMajoiIebUKXPtGRaAEPephrWwtxXte/vPk/wQ6BDm+F73QVsol7SxwJ/lkKu4Eitr23mrS
	zZiEUnmx64BCvx1PSXasuyIN+OOQS04Ahjsg/uexX5FRKuJf6xl4jnr1Gs9VQzhWrMcPJ9+P0e8ol
	3CeTR88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIj-0000000ERXg-3w3e;
	Thu, 12 Mar 2026 15:50:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iId-0000000ERTP-1B1J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso11204915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330609; x=1773935409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Der2AmEZNJ0NJcW9rSc7hfAjH+ZP+A00AJ4yvvTSgOc=;
        b=khDq13ShTK64hdd9XJPUb4GlIRZgpq/4lCAxpcCgIGGRolCCBLAwAoUlbe1QVAChGU
         PZ7wRYIpkpiFgUMqyDlNOZ72IO1ILAsUBOOZ0YYf4n6H6B1BfZy74Hge2OJh+mbngZ6C
         V/CQCPYNwXhkktvBrL+0d5tr5/mvV43ul+voS1Q0c9nckbpe1Lcxsu6Q2q8PrrZaJYSz
         ++X0r6LYBVxSncv/0zCD47YYjooyFnhkvEmrpoeCpyNHqHhdV3i0cDsi9nkmIxdwWSJU
         euFNP0rEI5fi5lmbKE4NKgHxasnSte0OFt7Ip8sIoBBs4tTcGqz3ha7uMtftvETlwADN
         7reA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330609; x=1773935409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Der2AmEZNJ0NJcW9rSc7hfAjH+ZP+A00AJ4yvvTSgOc=;
        b=YvdC8bzHLEuS/mXFXPs6P1lKd1V71wDyY6JfN1ibHtQaZtkHCyasURFxXw98144zhL
         XSZ3atnMF9zO3Z+jw4LptS69uwXAnT63cjCFeZZStM+zXfTt9ByNuUwmfdk8jRKt9DnA
         dnufBd4+onTMiDnhio/Vy7C/S0534I2wgQBYi+FweHK31hj9VOYBYFpFfSxNCVT1a/0T
         CIGtZozv6h7h6k7f1ahM6Tj/VYZ9/n1z6DEwGc/tlY2rSzuZFJXMenSQXxrVfxU8m8f4
         cN8Zpu/Qx+ZvX0ci7smXGeTqw8etJ0KE3fQhNQtT9SexlK/3MIE9Ey0xgQtkr6cbOAB1
         3rNA==
X-Forwarded-Encrypted: i=1; AJvYcCXWTDpixCkq0boqYxjevUgYreDufWv02KwGFWhw2dnJSfexsVCJYNtsXIeJ6b5QEH0p5CAR0z/RVJzCSfMbeJDY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+qIkPpDIK4fYefwe5TefFkHO4UOUQtqV/wnCec9N5MzZ+S+RE
	JohIEEzz9ObJAcfcGCTXskZvEOqNVCAY06KJqLPwa1qcmYkAJL+tDI4UI070FY9lzjY=
X-Gm-Gg: ATEYQzyS6XbrGYyUfeUaBHCCq4IdiPrMj7AmOE/WMpLKF50zEefVsK80qx8U7hHcO2W
	wbo96OlyyT6lwi//Pm4hW/rpfDfuFlpjYkFVZEfp95R8l4sp9kLyAOb6h7fTfaywY6Nu/n8de5Y
	qF9MyG8Jbskrji3wvFrJlTwm/FhCvuKsL/jftSuzE0VC9V2wotbKhQxWnp3nbrEjrzb6JsvEwmR
	3qeIqASkVadJ5PPXF2APvRCg9cmJgu7l3GO2ukMmp89ZSHzJd/UKm7jZraC5JO9i8EVvH3d3Ju7
	3Uan8tmqFp5S2BhdYxJsAofjGVnHvzbygb+kLAl602CqyKwCKNNavpyDEm6djlorz+hWQU8Q/0S
	XTS8SkPqcSnXjPjVMPikgMKdaeGPqxZX1LKrvnrpc9DChrUIXkAxlXkcs/OcO5UGOX9Vkj2ir1C
	r3HgG9bG5byAgS7IhtUnkI
X-Received: by 2002:a05:600c:1554:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-4854b12ce27mr109865955e9.30.1773330609205;
        Thu, 12 Mar 2026 08:50:09 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acbbsm9721577f8f.2.2026.03.12.08.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:08 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:56 +0100
Subject: [PATCH v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-2-37cb7ceec658@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=msp@baylibre.com;
 h=from:subject:message-id; bh=QkpJrK0sLsXaJAz/NDwURnTrDOk9cIBtUwllgV38WoA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxNDyoyI9Mi9yr+MDBUsgl6cdb0Q63PjGuG4luMhJcdd
 TrZdf9mRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEyEOZuRoePCtxtuKdIVr+eI
 unJkSYloykzkkliZ89m0IVZLxO+HIsM/+3+l01ILbRfe9VkdsnK6Ux9/bfTKoqns4oIqy93K/9x
 lBgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085011_341131_FD62061C 
X-CRM114-Status: GOOD (  10.76  )
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

Add names to the memory-region-names for easier identification of memory
regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 15e0286e4926865d88b693998e5aa64543ae125d..3f2425e0880f9a516ac10700a218ed035ff07d5a 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -175,6 +175,24 @@ patternProperties:
               - description: LPM FS context data and reserved sections
               - description: DM RM/PM trace and firmware code/data
 
+      memory-region-names:
+        description: |
+          Names for the memory regions specified in the memory-region property.
+          The names must correspond with the entries in memory-region.
+        oneOf:
+          - description: Basic layout
+            items:
+              - const: dma
+              - const: firmware
+          - description: Detailed layout
+            items:
+              - const: dma
+              - const: ipc
+              - const: lpm-stub
+              - const: lpm-metadata
+              - const: lpm-context
+              - const: dm-firmware
+
 # Optional properties:
 # --------------------
 # The following properties are optional properties for each of the R5F cores:
@@ -330,6 +348,7 @@ examples:
                         mboxes = <&mailbox0 &mbox_mcu_r5fss0_core0>;
                         memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
                                         <&mcu_r5fss0_core0_memory_region>;
+                        memory-region-names = "dma", "firmware";
                         sram = <&mcu_r5fss0_core0_sram>;
                     };
 

-- 
2.53.0


