Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3E3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=; b=PDKwlnq8LkeD6H1LQyDpNLH8Ze
	rcNn1BLI+3MFX0tnzbsnW5TVDOdlihkCq34/AwXSFUxzGVmkSAFyOPu6FOHw1DRKZJR8wewhprXOC
	3tVluKFXmOFSZuClhHeCLArAZB70AuKGC3Xnz6b953U4ettsFMK1tWVnaGzizQUJApz7Dk4A82uG8
	mTEfUIu++Noxskv8CMW6p3osN7FRPdTOXoJONoY8er5RKP9EiXv+npGMeYnlCPiu9ymIep048VjLu
	xrk83DUDI/huW70Ik2CXSyeDxZxGHMknDqL9+kRE7uOy1WNlNOdDDzbhMqDgSTQE9I0S4dXQbL6wv
	DBe4BfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbHR-00000002B7e-1z9x;
	Fri, 06 Dec 2024 16:34:13 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEO-00000002ACw-1PQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:06 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so2512155a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502662; x=1734107462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=;
        b=cJiC1N3RpzTfC+2WemAML9EZFB1y/XRY+qAyzWojTtaZ41YVLcwyZ6c8aBjNfCD2uO
         KXI6hAqrHBmIdc3fXyrPJvCcq0ue1iHaBrUgIvaUsjjhLoetJFQjxl7xRAHZG6lLGbwW
         kM7TVfajl63AxERS1cocTamFrXwXxo6ket83EC6/RRuMZIxhYuwMy0AgjTLtdqbfFg5O
         X9fuXaZT9dDPecwklBeZk3yx5Wp+w4447bcRs5TjMOoiQRFd7qvqDXsfc42wZg+/oKgf
         zlNoof3SMannJHHKCVxzST6yCf6pR04cblT/v0UEAU421xwcM8DD5tkp9xY6DajZ0OBn
         ACDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502662; x=1734107462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=;
        b=v0BADBrHI7rpumfgKfLfqTzyrms2dE45R3ieNAVD6qiJLUCx6fjhr8a912+n+RI9xc
         HTBzvxwXEWcX60NII7N/FBZryKIqpKTIDzza4cQQenVZdmFiLK8jmYRMAgPbZjbq7MB/
         sDKWLyb1byMMLQgOYwgUeu2WEYHgkUm/Q+GIVxGYRppUfBM1hTDNwm79oivPOL4Mld5x
         HcIjZRffS+F65sNuuGvnSVg6BGaXFTNLG7TmgngRRBN41Lg18zNvJSiGcLTk+6BQPgc9
         9naG8b2ep7soTKx4kJuKGgUsk2/S7OfaPngIy7hgMhF+gRDT/TV7Uw6L3Kgy3zvwqmzN
         vcTA==
X-Forwarded-Encrypted: i=1; AJvYcCUKq2+rvshAkCKZvQRAAos3HvOjyUkkNsv8YBlyHP/0ah9KstIQyir2+XD9RLvJfNPoxpEK3jvSCw4hEQb6vYC+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0xagFbZhsM0Aqk7FOlXBhYcu2EvmcSmlq/322g8zPT/oeGtS6
	Yc0PiVv040cXOs+TlKRbM0JqF8TKu9iRkQslNF++21el6tlpUGW2tyoUZSMX5Yc=
X-Gm-Gg: ASbGnctf53aXuINO7GUMuZWVRD0t7s0UN2IXXsnz3eKCtz9pJGXSpU1a33RcAsabYkG
	tf3PXouTFd7sH2LSG1PyGukvIthH3LdHbdjCQhs9AqmVLrhQ+AdqGA9scquTne7SZJyiwDu33EN
	eU7uQtLGJ9RlNG3x0+4bCw/jC6EJL5VnlirgQeWXM4uZRDi9FnxKQiBYEd3bnPu3WGEmmvuHh8Q
	3HM373qoBKlbnujeGeQ5KMEDPIlPwUfW3caovL5S0rgVFJQqqJENNo6sRmcj4AVhPB3usRfq2yC
	afazwfx6tD2EzAg4Hhe+N/m3JDASY49iDA==
X-Google-Smtp-Source: AGHT+IEYYMQ/h9d08asabi/0+odqzF/CyOlSqdYyLjSN9hUXcwqfK0GjZYzhh1sXE6LLkhg8iDS+AQ==
X-Received: by 2002:a17:907:9145:b0:aa5:1cdf:7c02 with SMTP id a640c23a62f3a-aa639fa52d3mr294338966b.3.1733502662183;
        Fri, 06 Dec 2024 08:31:02 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:01 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:01 +0000
Subject: [PATCH v4 1/7] dt-bindings: phy: samsung,usb3-drd-phy: add blank
 lines between DT properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-1-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083104_370200_C1677A1C 
X-CRM114-Status: UNSURE (   8.51  )
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

In [1], Rob pointed out that we should really be separating properties
with blank lines in between, which is universal style. Only where
properties are booleans, empty lines are not required.

Do so.

Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.org/ [1]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* update subject line (Rob)
* collect tags

v2:
* collect tags
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4919..1f8b35917b11 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -83,14 +83,19 @@ properties:
 
   pll-supply:
     description: Power supply for the USB PLL.
+
   dvdd-usb20-supply:
     description: DVDD power supply for the USB 2.0 phy.
+
   vddh-usb20-supply:
     description: VDDh power supply for the USB 2.0 phy.
+
   vdd33-usb20-supply:
     description: 3.3V power supply for the USB 2.0 phy.
+
   vdda-usbdp-supply:
     description: VDDa power supply for the USB DP phy.
+
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
@@ -117,6 +122,7 @@ allOf:
             - description: Gate of control interface AXI clock
             - description: Gate of control interface APB clock
             - description: Gate of SCL APB clock
+
         clock-names:
           items:
             - const: phy
@@ -124,10 +130,13 @@ allOf:
             - const: ctrl_aclk
             - const: ctrl_pclk
             - const: scl_pclk
+
         reg:
           minItems: 3
+
         reg-names:
           minItems: 3
+
       required:
         - reg-names
         - pll-supply
@@ -149,6 +158,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 5
+
         clock-names:
           items:
             - const: phy
@@ -156,8 +166,10 @@ allOf:
             - const: phy_utmi
             - const: phy_pipe
             - const: itp
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 
@@ -174,12 +186,15 @@ allOf:
         clocks:
           minItems: 2
           maxItems: 2
+
         clock-names:
           items:
             - const: phy
             - const: ref
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 

-- 
2.47.0.338.g60cca15819-goog


