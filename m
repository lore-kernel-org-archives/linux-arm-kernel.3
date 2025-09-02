Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F9ECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/8bnMdkcwBrzdormqUmLTK3k80g92+lN3p1s60KZ+k=; b=0rCnYof0PaVDPKVXOdfTz3Ee1M
	tkGM2STr6CaIBrmCNwqZxxEmSw/KVCfltcTuNoBhZiZeVnMzV+rL51hEYmDUSlXkAD0+HhTSv9T1a
	Eu/lUe4XKZr9brYJnFlGUy1OSe9v6a0yvIoA33EgpLWiCqavRYA5woSrsPVZ0LofeM4gCRkPCWGLj
	oucuLf1y5K6uRf4FHFC52d2J2yB9wVqEqmSGb03M13HAmaIo+5uFsaZ6qHuD7drDtuKeERIxm5yQP
	uaKhW9oYN2Vt8AUgG6FqdWNpsrV+jqcZri/E0/XJ1g6r1XS0lyFJifqn5hICTg3SnxJU6Hedzaon7
	uXVDSvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6v-0000000HEG5-3ofb;
	Tue, 02 Sep 2025 12:27:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN77-0000000GIxU-1MLY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:15:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b041b155a6dso23198266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756804540; x=1757409340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/8bnMdkcwBrzdormqUmLTK3k80g92+lN3p1s60KZ+k=;
        b=d2m2tX9Ze0WZYVeoARyLnxVjNrjoB1J8H7F41X5KTpV15h/smnEUys0TuXfNIV2OcZ
         iXeN++BZSIWCKLbG8RKsjc9ldMAT+SQrX29iRlCBXFHsrt9BrbDxbEpffMXURg/Ftg4z
         AMYqfYVYvGaHxX2WAbRl75KxB0fTV4Hde4ygAZ2UUrJyvBWZdYcu5pKRlfMO37ZRXLZa
         A28MasCeEBpIlWMDXLK/93qHqU3Fj9sKT/VggC3/hGUTs/79SiqBnMt/nAFbIcCA0/+2
         ipDEmEsGb9D9r1ZQYRc5jo6Dslcp1rbVXMmWQUzHmsIxHQrHlo1OFluRNYaixty37k8J
         w41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804540; x=1757409340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/8bnMdkcwBrzdormqUmLTK3k80g92+lN3p1s60KZ+k=;
        b=OLtqGbfODDTM7gMTsnCSQ/4fwuyPqRz8JzowpxSo+5n92h6dVZ8ROBgQ0OGrW5nd25
         z46/KNCTXOBB+U6BJEpoXrfSlkuyyMBdkvvtZbfBloNgZWVUbIB0jZ0U+ijUf3atZkdf
         SZvR3MF//S89ruVD9btZzKs0suPcP7cp+enixplq0YBR4DVPe0dAnr/SmbtV1amEMJtO
         iCUqMZ6HujGhp3VNrBjp9r65KKuqashUgctdIRyFxyd9/OqR9HM68D/D0G/UkwY5JGzJ
         eKJlkHA3eEpTuJZnPiEwLB5y/ISpc+XxxPnN61paHplvHSl0i3Nq0mXcIVTz2sMoO9NI
         DITw==
X-Forwarded-Encrypted: i=1; AJvYcCWfuhElaeb+LJvigEMizHjMFyTiaKTUQismMjrT6vAmCE+knxRlJzjoF5wusXJrKUM9hxMmv2+Ht25xUJ1gRvN6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxi0hRQLI5VVTgUDo4zSKWSJl/h2zlMo7eGa6tb/Cb/7UhvdzA
	14efWdfcuq7pQntKdtJlx5rONSfskBqFScjP2BfhZZO+KaRjgvx93auuTXpQf0LoTOA=
X-Gm-Gg: ASbGncvmdD+WUF8Qz9lX/sh1vuqA4F47Ni63V8lxJDUInXFLan0p8iZvw7Jrd+ol6Z6
	SXfjQz4C8uN6v55Yh/06RrCaIksp4++ygjSZALVJGZJHRUUNUsjrY+QBIrrFJH9AjZqsQgSJhsz
	tZnFiZxHZ/Vg9GUp7HfYaBWe7R5r4IOWWIyTBbaHcIVcAxcAs7SD0a4BlnM4vNBQvBMnn+HZfWl
	G3Sx74cPSnzSc0nZ0X3+BjKYxmVhii43VEZHPc8/mlEkqv/WwEGj8HieKl4oENUpHb42MsQyIWo
	LSBfLqMDeBGbshswvCMbTRNvGjyB5G5JN0K7+4OfnsGNqdgLSlBFxAfGnIOQcin6IAEUgJ1DeaT
	HRdL86y5hZfRVJcWZ26Zg4YOqVcQdoD8BfKwGgD6bAd8SzBRvFqolu40=
X-Google-Smtp-Source: AGHT+IGsSFPfLqX1TSTY7vx9/w5ZifFk746DiQHROlsIAv27SMqvJyUuB9Px6z4DG9dMMXNer8ncTw==
X-Received: by 2002:a17:907:95a2:b0:b01:989f:46d0 with SMTP id a640c23a62f3a-b0198ae8b17mr566468666b.11.1756804539611;
        Tue, 02 Sep 2025 02:15:39 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff15fccb15sm877008866b.98.2025.09.02.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:15:38 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
Date: Tue,  2 Sep 2025 11:15:27 +0200
Message-ID: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=omOLYYYjh3z0DVh1O46NQbX5aRk5HswOved29mAUMag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotrWu6Rq20SlnUGOaA358hH5nv1fnKm5T701YM
 YgxMdCPxreJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLa1rgAKCRDBN2bmhouD
 100DD/9FY3aTCBs5BXmVSlnhJDkPZWHvDYOPI4Ae46T6toYdFe0oHBCT1ivV3pDoDGSKU73VZdG
 4E82JAx/MwQyjQ4F4iyK/iN6J1wXAQ6i61V+oYGoyKS+lR4eroU9Dx8odZXyXbdyVq3lU3sO+MG
 TDML8f+YKLY/tOdjh+vJcUU+n7Ipf9HjXQKFVmWNzWlcopnWLu+hCztmEm523MO/p1nwr7EbwzS
 AE+Q93zwfJEIQvKPuS9HS1E/MCAEVvrv+j8hvLkvmDxui+woZc/NUr111q/CmX1NgYQVyjmtExN
 /BwHQi0xOsvXemvA1ABLngFYG/dTIRx8KEfwl6pEKcqZj6MZrsUok0KLHgP0q0yP0RJEGikumsY
 mXQV/LE1skdf/aP0YwXf/b6CQ7zUG+u7gs7mGvZhYthkIhPxlmSbMsX/+TsZYDGTLu/qSfQYuT5
 WVsC78X2Hv5kVCE3+9mfwv4cuAU8quFWeKWOzdzIvNMX63WhjHv+91/WFpl17WfG6XXdGSlgztf
 R5hp2f+n5jEtt0OlSWeRqSWMezS3EsPt0fbsgR8Jub4XEpAM22Xh5X9nBqMYS2HEBd+j7hbvtib
 2d7ORY8wvGFU4MGzahiBEwPT0rO4qhj4XqcoWUECr78rM46doe2LQeEOP2JfNG/jl5b4jREKBwl 30tClks5II7F44g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_021541_400247_31EE3988 
X-CRM114-Status: UNSURE (   9.61  )
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

STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constrain for
this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index 3a22d35db778..fc445ad5a1f1 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -62,6 +62,13 @@ properties:
       - const: stmmaceth
       - const: ptp_ref
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: macirq
+
   iommus:
     minItems: 1
     maxItems: 2
-- 
2.48.1


