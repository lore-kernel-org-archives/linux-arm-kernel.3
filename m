Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDDCC369B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrlq2rYfgBLmHuWsTGNtsJ7KxYne7Xpu0dSG8i28Zdk=; b=A9CdM60Aj+IyuJssEf/m+lAawn
	coBs3/Q1MwC2VbH1jEpX2sYJawfUdjs31epe94yZvyrsJHastTOv/wcdAun8vXPAwmxYwGVn9juuB
	pC2AVpAFjoW+haRQhModmtf+efr/Pa5rIf+lgkI+LsNxABglFqr67cax4KUXTkE+db3VxoYDwplUK
	9vOx+RLmRkGKTNzCjr1AcX6Dz854AxNazZ7ez8dC4+0gdozWXLr58qnCSPCJtuf4wciAHBA9YMHat
	q1rcKSpoQaAtvrQcOvfXVhuEkexjvZt3TMQDc91Woa5ZznV1gNUVOenDIXQ444R7/0xDIm1E4n8UR
	I5NuGupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qPP-00000007bnV-1zKt;
	Wed, 16 Apr 2025 00:13:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qEO-00000007Zdl-2yUs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:02:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22435603572so58977285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761740; x=1745366540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nrlq2rYfgBLmHuWsTGNtsJ7KxYne7Xpu0dSG8i28Zdk=;
        b=G91oVmK0e1CCJZQOHvI6BQGavnyys1iwQfEfwPRHzATeZCEAtsw9yhoiZMnnoFHDOs
         JxLDHRTtdQJSgR8Vn8r073eCLWGeDm2dIQQfGl/O7HTxTauOeZnZGHOCS9KyWWtRuLLO
         kBk8FuYPXEDgHd6FtYx1PAWXuSib987Ny0ohM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761740; x=1745366540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nrlq2rYfgBLmHuWsTGNtsJ7KxYne7Xpu0dSG8i28Zdk=;
        b=d+Z44FutdPxyxa7DD0j/DWbB9EKNVjNKkFCbKCGJxcyQ5O0/VqE5Lne06KwngRT5f1
         +IO4A2Z3gBtu/ytkny6MKrQjSuoPFMKK+Dwfm4D0bvQoJig+B/fR251iClQ8j1XKkdwj
         pU2TJUDG26SfHHuPkfHkheC58ZhUzRKg4hdsTda+Dnd2yQUxEf7lcA3Pyby19He8ZFv+
         WWA7wr6S3jMX7Vj8K2URt6E4KCmZfhq8+yBUFvqucPQ7WKEljIQrf7TzWWwjKsFq9lLT
         wVWJ1owEM5Va+37WTu3WT+GNYO7R/QSvuGAmFFTCRp2EwH6uQjxNaK6WZ+fIn5urZnl/
         CIDw==
X-Forwarded-Encrypted: i=1; AJvYcCWb0PyU+nA8AUOYQcViZCfVgObTR2UF1egTBZeW0HNiPxctvMe9KSBDS+OMdpaMpi/uqAAG06brrzZs4254Hh6J@lists.infradead.org
X-Gm-Message-State: AOJu0YzvXxowKQB0OjkEV5IFa02jqtlcejt3FEM0QdrYmBAO6hmmkxRi
	LLxGAA3UrgWLI9cvXvAT9vV9kAwx/yZk60BGURwlt6ELRr6dgCW09ZuKNLRHNg==
X-Gm-Gg: ASbGncsp5Cug9i3e6z8upFHzhqTRdBIxfRzYJGT9qQ8zKQ154ecUHN/LsF27zhW8dVU
	z8tGaSTRJUSj5eMi2KYZsAC42Px8fMgfp8ag9rLKXZ7JxfCVvOY4AdFqWHvWxGted5C93+aE41l
	WcN+nc/8hlvOku3HiB/yT4uZ032bSR29CBhtkTlaoXwYJXNAwsR8ZH8K8mbKmALosWEKSMQq5G6
	e+EQGenl9BvDa7tjq6qT+DJVmKkEwQaBxEKpcVis+U4JehXvfzjCqcfJuNIQkXy0Cd/tf1Tnu13
	6OBPVEOTqy0WBRj94lpDURyXByT31lvrRtYUgEcGx2b2jPhdz6vUu7hkfKuTg3B9pnJiAlkpcaO
	O1RGNT/KCXh+E
X-Google-Smtp-Source: AGHT+IF1TOXiHYmZ5Jg3EXQSDRIROqzmWiXyNsBmBpcbZ0pKroNPtY+R3VjCmcQUVeHmUyzQagE5Vg==
X-Received: by 2002:a17:902:e545:b0:224:e33:8896 with SMTP id d9443c01a7336-22c31a0aca5mr15114425ad.11.1744761740162;
        Tue, 15 Apr 2025 17:02:20 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c33f1d392sm1327015ad.99.2025.04.15.17.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:19 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 5/7] dt-bindings: usb: google,cros-ec-typec: Add ports for DP altmode
Date: Tue, 15 Apr 2025 17:02:05 -0700
Message-ID: <20250416000208.3568635-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_170220_767024_CFDFA267 
X-CRM114-Status: GOOD (  21.82  )
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

Add a DT graph binding to google,cros-ec-typec so that it can combine
DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoint
that is connected to the usb-c-connector node's SS endpoint. Allow there
to be multiple 'typec' nodes underneath the EC node so that one DT graph
exists per DP bridge. The EC is actually controlling TCPCs and redrivers
that combine the DP and USB signals together so this more accurately
reflects the hardware design without introducing yet another DT node
underneath the EC for USB type-c "stuff".

If the type-c ports are being shared between a single DP controller then
the ports need to know about each other and determine a policy to drive
DP to one type-c port or the other. If the type-c ports each have their
own dedicated DP controller then they're able to operate independently
and enter/exit DP altmode independently as well. We can't connect the DP
controller's endpoint to one usb-c-connector port@1 endpoint and the USB
controller's endpoint to another usb-c-connector port@1 endpoint either
because the DP muxing case would have DP connected to two
usb-c-connector endpoints which the graph binding doesn't support.

Therefore, one typec node is required per the capabilities of the type-c
port(s) being managed. Add a port to the DisplayPort altmode as well, so
that we can show the connection between the DP controller and the DP
altmode. This lets us indicate which type-c ports the DP controller is
wired to. For example, if DP was connected to ports 0 and 2, while port
1 was connected to another DP controller we wouldn't be able to
implement that without having some other DT property to indicate which
output ports are connected to the DP endpoint.

Furthermore, this supports ChromeOS designs like Corsola where a DP
controller/PHY is split with two lanes going to one connector and the
other two lanes going to another connector. In this case, we wouldn't
have the graph binding under the cros-ec-typec node, but we would have
the graph binding in the DP altmode directly connected to the DP
controller's two output endpoints.

Cc: Rob Herring (Arm) <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Acked-by: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/connector/usb-connector.yaml     |   6 +
 .../bindings/mfd/google,cros-ec.yaml          |   7 +-
 .../bindings/usb/google,cros-ec-typec.yaml    | 165 ++++++++++++++++++
 3 files changed, 175 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 11e40d225b9f..e3d60997c03e 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -179,6 +179,12 @@ properties:
             $ref: /schemas/types.yaml#/definitions/uint32
             description: VDO returned by Discover Modes USB PD command.
 
+          port:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: OF graph bindings modeling a data bus to the
+              DisplayPort altmode from the DisplayPort controller. Used when
+              the altmode switch is part of the port manager.
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: OF graph bindings modeling a data bus to the connector, e.g.
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index ac89696fa649..63d506e88abb 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -98,9 +98,6 @@ properties:
 
   gpio-controller: true
 
-  typec:
-    $ref: /schemas/usb/google,cros-ec-typec.yaml#
-
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
     deprecated: true
@@ -163,6 +160,10 @@ patternProperties:
     type: object
     $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
 
+  "^typec(-[0-9])*$":
+    type: object
+    $ref: /schemas/usb/google,cros-ec-typec.yaml#
+
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
index 3272d0e01f7e..611345bbe884 100644
--- a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
@@ -26,6 +26,55 @@ properties:
   '#size-cells':
     const: 0
 
+  mux-gpios:
+    description: GPIOs indicating which way the DisplayPort mux is steered
+    minItems: 1
+    maxItems: 3
+
+  no-hpd:
+    description: Indicates this device doesn't signal HPD for DisplayPort
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Port for DisplayPort (DP) data
+
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Input DP port
+
+        patternProperties:
+          '^endpoint@[1-8]$':
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Output to the usb-c connector's DP altmode
+
+        required:
+          - endpoint@0
+
+        anyOf:
+          - required:
+              - endpoint@1
+          - required:
+              - endpoint@2
+          - required:
+              - endpoint@3
+          - required:
+              - endpoint@4
+          - required:
+              - endpoint@5
+          - required:
+              - endpoint@6
+          - required:
+              - endpoint@7
+          - required:
+              - endpoint@8
+
 patternProperties:
   '^connector@[0-9a-f]+$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -35,10 +84,30 @@ patternProperties:
 required:
   - compatible
 
+allOf:
+  - if:
+      required:
+        - no-hpd
+    then:
+      properties:
+        ports:
+          required:
+            - port@0
+  - if:
+      required:
+        - mux-gpios
+    then:
+      properties:
+        ports:
+          required:
+            - port@0
+
 additionalProperties: false
 
 examples:
   - |+
+    #include <dt-bindings/gpio/gpio.h>
+
     spi {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -47,6 +116,8 @@ examples:
         compatible = "google,cros-ec-spi";
         reg = <0>;
         interrupts = <35 0>;
+        #gpio-cells = <2>;
+        gpio-controller;
 
         typec {
           compatible = "google,cros-ec-typec";
@@ -54,12 +125,106 @@ examples:
           #address-cells = <1>;
           #size-cells = <0>;
 
+          mux-gpios = <&cros_ec 42 GPIO_ACTIVE_HIGH>, <&cros_ec 3 GPIO_ACTIVE_HIGH>;
+
           connector@0 {
             compatible = "usb-c-connector";
             reg = <0>;
             power-role = "dual";
             data-role = "dual";
             try-power-role = "source";
+
+            altmodes {
+              displayport {
+                port {
+                  usbc0_dp: endpoint {
+                    remote-endpoint = <&dp_out0>;
+                  };
+                };
+              };
+            };
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                usb_c0_hs: endpoint {
+                  remote-endpoint = <&usb_hub_dfp3_hs>;
+                };
+              };
+
+              port@1 {
+                reg = <1>;
+                usb_c0_ss: endpoint {
+                  remote-endpoint = <&usb_hub_dfp3_ss>;
+                };
+              };
+            };
+          };
+
+          connector@1 {
+            compatible = "usb-c-connector";
+            reg = <1>;
+            power-role = "dual";
+            data-role = "dual";
+            try-power-role = "source";
+
+            altmodes {
+              displayport {
+                port {
+                  usbc1_dp: endpoint {
+                    remote-endpoint = <&dp_out1>;
+                  };
+                };
+              };
+            };
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                usb_c1_hs: endpoint {
+                  remote-endpoint = <&usb_hub_dfp2_hs>;
+                };
+              };
+
+              port@1 {
+                reg = <1>;
+                usb_c1_ss: endpoint {
+                  remote-endpoint = <&usb_hub_dfp2_ss>;
+                };
+              };
+            };
+          };
+
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+              reg = <0>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              dp_in: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&dp_phy>;
+              };
+
+              dp_out0: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&usbc0_dp>;
+              };
+
+              dp_out1: endpoint@2 {
+                reg = <2>;
+                remote-endpoint = <&usbc1_dp>;
+              };
+            };
           };
         };
       };
-- 
https://chromeos.dev


