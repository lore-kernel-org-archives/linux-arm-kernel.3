Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD02CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biM7Bjny+oEtW4RIbzxutTWTNB6Z2cdc0+Z2iihTXdU=; b=CoJKuPVmmt5dsZT2ts48ZOpuur
	Nvs4I5Aw4YeQIYUzdTdPmOrNw5jmxP4h/FuR3zVoOBZewQ5eqfyWSMEAFvxJo0skbtYSgP/cKWCCj
	1wxZRf7idYrmxcQ0N4zXXIvdWaTBDzjcFGoBB9ZcIFd7H7asMW+9KOFYQ1bvAzxc/OuxQz9gYG93w
	abYdp2/yTdwrrZNZs8iAfbPRrEPDDl1qcgZypx2H+SFQraPz/Vt5LYpDWsYP4QUIuXZAwC/Vh/vjL
	R9rUTlFgvz9LA+g8Edqjf7aygjIiOiz3QoZtPCjVZ7En6eHDF8Muv7VJlD+/qTauHuCqrOLPJ2U2a
	lsUupeHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmm-00000002BZm-1AEh;
	Tue, 02 Sep 2025 21:43:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT80-00000000jWz-2b4j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:41:01 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b017e4330c9so20430366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756827659; x=1757432459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biM7Bjny+oEtW4RIbzxutTWTNB6Z2cdc0+Z2iihTXdU=;
        b=iLzR4cDw9gtrAjh1yVgxXFh86pyNG+7YfcAep1sCe+YoQeovEosWo9aT91KArRnp9U
         p5Rj1QyGWIF5MsAbaJCMSBBiw/anSAqHSymhHwyUAu9dNLY1XziUvMlDjJ2ufumcAMku
         74sACw1a0WCuPqxrQ+mMkldtn9RwaFIdHBLTI8fqrFaIbhQeDXDt1BnQaeQ2MOXVaZoD
         EtLomIg0vI990Nmmvfp3wUNRpcsgST/PLNEMIK7DmCc5lau7Cby1g0P1nnpVeUImffh8
         awyIeLLm+BivDzTYjAOg5mqnZoC+IGe2clHzg8SMH0hS+pJE7vqKpWSRqWroHuc37YtJ
         S+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827659; x=1757432459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biM7Bjny+oEtW4RIbzxutTWTNB6Z2cdc0+Z2iihTXdU=;
        b=IgWlL8K0LBeEkWtGl9ySp75ndqywdRwz3rzTZX9EfNDKEFRXkJbFav2lmyeW/Zwwl8
         pVUyiwjR061MdtldTz266UV2j9shJ/sCiF3IVarv89b+BcjJ6PM9z0BAiAJkBHPRycXO
         VTBmv2vEVyN+VnyZQw/Xe+7dXbAWlVH8MAK9iCRQTJWOWmT+O4qTQmRTGaQBmx0t5du9
         mBTo8ajZfMKTeoeOyahPfuPJRIz87zXePvMPBqy7O/GQHQ0fbGdmB3BUwv3xzvqdOrhN
         JpGxoB51YdbP9GHVhgAFBfHuAt5j+WClyMQbKjDkYfzTBnhCgQ7O/K7T05F5zi5ILwzV
         JrOA==
X-Forwarded-Encrypted: i=1; AJvYcCWSs6RDSF3Gb97wcow2OxI1FDmifw3StMJ4jRp5IA9Kkqh2Cj5TlM7BHnkMWo8sZ91RE+wL+cC2hHzUpGW2wbn6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+csWJPlunYC/RpvJRU12ur6qC/qR9NxXxCmV4kc23iKKjeI7w
	RCuk8EVnIhdBxJjGb3QLB04wrP6aNHQitegvvRbPIieZQb4dAp3cHEMSTs1thCzyDBE=
X-Gm-Gg: ASbGncteR4U4E4nBBQ0rAQ/OY5RJS8omnvI4HqNFqYk7ItfOEvvDUXcNSB3vS2Hp4i0
	yKW1m8WxCX5p5MS5cKh9Wr74OgokJy1CDIVCOqotQ2Tlddf42hmxw8IqUUjWc/em2NtH238kXJ2
	RRNsaoizASU7pMd68ZQrjKhkfb/53OURYL7Sq8ZsM84gWd+/UwbWu8ok9BrAuZmLawJCN/hK5ee
	EqDDrWFlPs+tXEIGcG2S6nBURAdz7+BITMZCmMRUtgBBe7m9OFLXZspgbvAFKyNcpPW/ZgK0e7A
	BQ9+rD2iOnBIwKnqKCowOIlr7Rr6p2EWVfflWQVf4DJRh3lx5279wV/RZlRbVqXEoItrrAu8Oy0
	kQYVYzH1iwYwhf/rEYtf2NS7AU2gPXdeYoA==
X-Google-Smtp-Source: AGHT+IHqvfJxZqJi2NLaX1BO2h75+SQL5o+3GXCX6kDD5SLJWDWl9iQlkkXuKU07JA390ij54jHTOw==
X-Received: by 2002:a17:906:161b:b0:b04:3333:7e64 with SMTP id a640c23a62f3a-b04333384c4mr332760066b.4.1756827658993;
        Tue, 02 Sep 2025 08:40:58 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0438102debsm418746666b.66.2025.09.02.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:40:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
Date: Tue,  2 Sep 2025 17:40:53 +0200
Message-ID: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=DD9yXaeypA2hr9FO3qZZJC8IuicCgOmdBNpfeVcWoM0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotxAE2AXqGVkkvcoMa6jmHyX5xtJs6fM/mG12F
 ql3xWH2zgmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLcQBAAKCRDBN2bmhouD
 104RD/9almm968xEPzjvlHGWaEROIstSx2O4TtT+LEnIzl7A7LlYbWUS1bQsIK2CPEsYTNsT5NU
 bxVJoFKk5YoPO3EubhPUUgfdCfiLbkA0AdQwi+sEsXd7HRh6fRyzxZND7F5zC07LZsS0UfpPZpD
 nECB2+rLdtwaN3qCuLT0YlPBFgNeGrf7j8tRuCtVg3VyL8cu9Dw0Xn+/l6K0Tw1z2Sy6x9qY/LL
 uxrDCVCHFkv99Z99VRTIeRo/C20Fr6xq6/NUatv72p5vFaGujQpJLIgXEopsTV62Pr8ljFLfabD
 tecCrVnC6YN4rhQRd4cN4iSYmKbgan5OIlnSneFdXA26T8gunnV9pq8flDPk+C3Pe0UQF5dEgrd
 0hrv/TLGmDsJuxK7375AwcweBBgfao8BlJkWRQoieTDkuI1SkYPbfy+bImFD7FyWLIEuSpiesP/
 KG4Heoz8S8AdFqjFJ8AWAp4z1fhS28qO7ZkOX2mHVujftP3JxueVaIvQ4daAP9PSySXjmrCmPco
 phxcZ753X5HLZ02B+63d30c9Iew0UnRuor9xudACczVOG+PUngW0Kxsj9tX+I6cKZyHUT+akTmV
 Z7OkHSHslLZopuyqVL8FLpyyJkv9aME8QmyaHYmymzjwPjCsK50Ii+ARGaCL42LVETwBhjo227f OwbKy7oAP+avSig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_084100_661727_698DB173 
X-CRM114-Status: GOOD (  10.21  )
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

Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constraint for
this device.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Minor typo in commit msg.
2. one->three interrupts in commit msg
3. Rb tag
---
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
index d9a8d586e260..16dd7a2631ab 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
@@ -30,6 +30,15 @@ properties:
       - const: renesas,rzn1-gmac
       - const: snps,dwmac
 
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+      - const: eth_lpi
+
   pcs-handle:
     description:
       phandle pointing to a PCS sub-node compatible with
-- 
2.48.1


