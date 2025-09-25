Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B0ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ikj1YYbJyMMY0I/qjjfkDNziE+dHmdeEHUJPM2fNZ0w=; b=RTDiKMriDmgwR1dGtb+2Tv26ge
	ipOJXlweY9sjjPqvL9LcRuezSnMtsm5lz+Qz2BvDkhBCgw9KgFrrn2aCZcQZR9TT4xcTdWDrAUAEc
	dqmFCNaQ2nk+1KUITfVw44KLxwMOa0ONt+uwkRb+rbXyVmP0eIMSvqoAPwMB+ILDCq05jOhuEnW0L
	s0y/n0gR39U/ws2h1OSOFiU4Tcz1zTu2hqdGgV2Sptc3iU58qOpldN07PdJ9HZlPYdR46Dg4VXL2J
	TCrjIJUWoUDIHJoaQ9Wa9bpVeBX4kYQ0FCT6xWcsooikNTvC4+iDp1al6kfWLYzGUD+ouqlqsaS5J
	fcc2QYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1luZ-00000009MKi-2Tlt;
	Thu, 25 Sep 2025 13:21:27 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1luX-00000009MHD-0ioC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:21:26 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8030aea5e4bso7324756d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 06:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758806480; x=1759411280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ikj1YYbJyMMY0I/qjjfkDNziE+dHmdeEHUJPM2fNZ0w=;
        b=Z2Pb8yQ/DSA0W+qHXz9lv6b+TeiyhjM0rmkqcOnhc9rhFPkcjhiyBjbBvBhZoXcv8C
         vU4aUv6s0nhefYBguNjzlqFD77Nvi+HkFD/eZPIybIf2hEckPakb+94cCuJ50T5y2rb+
         gnsKEa9EGQVAXOjefQC56ceeMVDzNU1l5kO9x1qLVtNMVdEZirIHoxF0Bd6bxg07QOgT
         T7nei0zV00cdNIH7/fGAUw4o9oxqJ11j7/wgohvFRXfPeB+MCP57yut+Xfn8S/L4ZysZ
         JPUc8YF4YuoDGCYmL+CAxMnbZOjHPpUsdKm6lEm0X2wQJxmpn3RC/BPtVH6X6Tfth6sp
         pavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758806480; x=1759411280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ikj1YYbJyMMY0I/qjjfkDNziE+dHmdeEHUJPM2fNZ0w=;
        b=nrmfRdiu0G81nwUWSuW0+kAMRH/thY6twETE9pSmSWJRTzrFhFcPSHKcfqVYbMKE95
         cSITgb/Fe0cE/KrNI3+iWqnYwBBaOdZRNED0RSNkB4/G+/QeEwS92gBwrdVwkyGQsE50
         BR2nrhwfhDWwzZyDYHPVSY3uJxWLxSA/9EToY5BTrFyGtiAmTZfqhjDw0gLvNcGHPbE/
         oGWU4fnIlMnBdugTQFal4Jj3IJv1+p+sZHQ6Y4hwWbzEaauL4XBjOnL4/uo6PHqz2l5F
         fcVsWtz2/8i5Ja6d5JolB9tsptPB5LzMEvXMORBkoGnon/g4vGsYwFwSinOhyi92c1m6
         078A==
X-Forwarded-Encrypted: i=1; AJvYcCVmaobqtaCXPDHE3wmOAy4pCPBL+mMmuN5wcaD5F0yNmS7g4hoRal+Aow+WMD82Eo1d1A/9I7zxGgvq2Wlw96Rs@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo5L4Ikh5ZRGwZn74aUYIUzvumuXyJnlJJKdMRzoLgXWhrkI5o
	DpUjetvEUbeOj3/jec1zTHPSZWaSeS725z1ghk7t6d9jHmQUMT/V6vDKM78Q52K4zMU=
X-Gm-Gg: ASbGncuoeoyHiRW0j/474k8g9j7+4tw5v1cr1/VgRseZvgUZLaXnilxMgGkGedoVyeq
	5BovI0587lmVdD6Hvrrz/C2yzSAjs1W3a/dhoymo7cg+nZQtKUDB55Zxpmwxce9eujecLNkcnXG
	dhrzJcIxmaOWLLF61Dj4NGQmB1odrJj8ERzWEQIlndpLRVx1ea5JpYpCp6i8gH+B6Aa0Ck3qQDz
	1T0x0HJr+QfGMQiXzX6ldW/FVfdUnKIb/WRSdy8MD+OxdRfe7/4Sy+O1Zwn+pkEdAeYduAKkvJz
	G4gOwiVG4I51f+oVJ08auBsCxpQLUnNQFwwDSYGpAd8AQcAmVJCsvvNI+fKpB9DrgvJOWip0K6L
	vtxA+HEh8nCRGEaJvaRrRxWc5SYIFcmkCo1WYRroNp0M=
X-Google-Smtp-Source: AGHT+IH8XUinRdR3zGGiBp2m82mpBfD/3zmwNXqhrKUwUBHni0a1zJyvS8LqAu4izyJ4awYO1sa/1g==
X-Received: by 2002:ad4:5e89:0:b0:773:292c:4f69 with SMTP id 6a1803df08f44-800e5116d46mr30765656d6.10.1758806480193;
        Thu, 25 Sep 2025 06:21:20 -0700 (PDT)
Received: from fedora (d-zg1-232.globalnet.hr. [213.149.36.246])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4db10872737sm9887351cf.30.2025.09.25.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:21:19 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	lars.povlsen@microchip.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	benjamin.ryzman@canonical.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net] dt-bindings: net: sparx5: correct LAN969x register space windows
Date: Thu, 25 Sep 2025 15:19:49 +0200
Message-ID: <20250925132109.583984-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_062125_229212_BE40B9A0 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

LAN969x needs only 2 register space windows as GCB is already covered by
the "devices" register space window, so expect only 2 "reg" and "reg-names"
properties.

Fixes: 41c6439fdc2b ("dt-bindings: net: add compatible strings for lan969x targets")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/net/microchip,sparx5-switch.yaml | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
index 082982c59a55..5caa3779660d 100644
--- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
@@ -55,12 +55,14 @@ properties:
           - const: microchip,lan9691-switch
 
   reg:
+    minItems: 2
     items:
       - description: cpu target
       - description: devices target
       - description: general control block target
 
   reg-names:
+    minItems: 2
     items:
       - const: cpu
       - const: devices
@@ -168,6 +170,26 @@ required:
   - interrupt-names
   - ethernet-ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,lan9691-switch
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.51.0


