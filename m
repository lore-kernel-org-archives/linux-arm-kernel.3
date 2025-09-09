Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3248ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=; b=n8VVHTP99gRHJMXfvi3hqwSz0v
	cJXTDyhENrfVF+wjG1CIZXkEn/2n0rYSWxuWUf29m3IIpltgpxZb0I8wkBs/qAQK2E+GQUdnfGjym
	cfr56MwNscBI+5pkwHT08C8lXi4vd6XA3r+kOv813OSPVoJCcdkE+Iw2E+rlKNapivoUyKjIb6aDc
	Ahoj5DCXfrsL7JLGddFXF1qSJUlyE8ARYBKeo4J34WY9OAq4k8uXej3gZRM0RiYLUhdNKm7/wQStG
	LjOT8au+9TawrLd4/H+oSwc7wyGYYW8i+cFGKA47t8ft/Gi3Jkpovdd4AvuaYlO+SyQRaFuVyIC+8
	raaSeBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0U5-00000008CSv-2a6i;
	Tue, 09 Sep 2025 15:42:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKz-00000006Hh8-21fx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso2762665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412752; x=1758017552; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=U4Af66VlmBQr+48DW8VWnombA2xj2bYIJ7bTb3eEM/OqCNf7OS9PdDSdYLa/80hCHj
         u+E30ylHNoi3NUKL4Ehx2RqKe4j9tt2fWcEYzFDt+8KHnC+1/s25LDtR5j0RIvkzKDVF
         X1qXNDhULVx22QGxf84GBOyieZgS9kpboFStjp9Oh3BXs1BLdw5n4Eg8a7ODZzvKxEhv
         v/ocVRMLl6kMk93DntlUZ2vWWQo8x3H42mUVNhlMpZHPfTB9b3RSYvVskU87lr585MVr
         kRLHl9MxzZlUKFKQgVt3AHZPIUMLjaf4zDtLH5LELmfqCDy00/MJwgVrWQEelojkmOIw
         DBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412752; x=1758017552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsYAjCVZTAgTbKUVHs9DAPmJO/mDOJAtaWrMK8+sbis=;
        b=w7KW4eTONehTH8AA7xf+mBH+ULY/oKO5f/W81vru4uuPQY2a3afIgq12A5zVesaY19
         esLPDUlQFqqMx9nm4fhjCOy/D5+Lks3arA5YP4MV5EA7BAIyIuiKRegfmLCMfKGkv3U4
         fIH179Q9Zb41A6SO0cLg8AHeiM9iX3mYUn8PhUq8O9dHz+pieLe9hCtSymnqvuQOEYo2
         FnkilosD/FAQcV/iyhtuyYDpZUJC6qBM5Yt8d6G2OuJJsPVRcOXJ4aFVnMjRIi4zF1mW
         iumTWrIMllPffg9TNZ7hh2G/8FA7jCvFknoOQTGb+/1Z3UBDvw9lK6AzLqiZW5Bt6BAZ
         YZsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+plGZ4mkqLmGXxtbiR7D6eE8O16/k8BPMKcr/luggWrP5GytlKyAWgL3aLJttHOTEPePiEm3j5pKT2GfCOqFC@lists.infradead.org
X-Gm-Message-State: AOJu0YwFpnf2Y1kubfkrm3rhAFRupcuSU3heQX4cBDxWp/8J/kJIBbON
	ESujXkcFhZDJ86b5Bfz8goEuU7i3qpBRq8gmJc8NavzNqw0lR7iKwHad
X-Gm-Gg: ASbGncth8BehxQgYVXpMa3/E78iLEWMomXj4CsefPNoQkHRIE5pKlRV7Kn/NVCnzyv3
	SR+X+dEccCrFIItelXT8VRadAi1f/4adtwem/eYPVypxd5CIudhRiPulxqHgr/lFy2c/VNm1RU7
	fo/+T69JX1AzadJWDpiCJV92MhYEl1BU/CpJFI9H0cjzOUazJK3Gct6KoWkXVA5QoKWNBrp1DBd
	lShsIit4lwmC7sj6tyrZPSLaGkGOkf7YQFPfrNwJmP0rO0s/TBjws8l9KocLk+UqozexkCbmy80
	4VruPPqT6yVurQfnBYyCKaDmPaineW1oFB5zOy7JT550h45My+MJmKfb0IMxVfAqAYc4zGRHire
	NDuHnQCGTW6y0Eb08x2/1Db8wd0mX9SOj9QBiGFuOKKs2SSSiHQ9nIMKcAPpCMxvP4dO1rI8j2w
	k0SONqYNb3fQXepUE=
X-Google-Smtp-Source: AGHT+IGFWj1csfftMrTtbBzav0aJP8+tqV8mMQwZl+VGz1A+6Wfp7GkhRRrJnvAXOv1+MxZTXBPtKg==
X-Received: by 2002:a05:600c:1912:b0:45d:d099:873 with SMTP id 5b1f17b1804b1-45de2547b9emr85467345e9.6.1757412751881;
        Tue, 09 Sep 2025 03:12:31 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb5693921sm289241375e9.0.2025.09.09.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:31 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:15 +0200
Subject: [PATCH v6 08/20] dt-binding: memory: add DDR4 channel compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-8-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031235_270243_5CE9D0D7 
X-CRM114-Status: GOOD (  10.22  )
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

Add in the memory channel binding the DDR4 compatible to support DDR4
memory channel.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 9892da520fe4..866af40b654d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -19,6 +19,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - jedec,ddr4-channel
       - jedec,lpddr2-channel
       - jedec,lpddr3-channel
       - jedec,lpddr4-channel
@@ -61,6 +62,15 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: jedec,ddr4-channel
+    then:
+      patternProperties:
+        "^rank@[0-9]+$":
+          $ref: /schemas/memory-controllers/ddr/jedec,ddr4.yaml#
   - if:
       properties:
         compatible:

-- 
2.43.0


