Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52762E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=; b=tFwRquRcvHZ/U8r0gkLXcogM+C
	cEBXjX3YRg/XVn/ROtUllGbHxS6t2pNOHZyArr2f28C9hWDptFEPGsgE9PdGe/bx3MP3p0FL3qsSi
	IxlxJ3gHOMNsWP6z6Wp33a1l9Mi970vgnYyt5hdmbG3DflQSz77kWZIGbcfyAQdqeMozTScNcUSc1
	Zl/clHB+oUumx1ezNZzUFGPTWckDhEKUY5Z9fJ21k9h+gIEM81eluelzpxwMSmKp9u0MpAFr8wZ/M
	NuX6b7tAljCJRVB73wcr9Wbn4jMfgqjSQgVsBuU+20w6cgidSoVqt6bDLMQIAn14OwZiE3G6g1TLV
	rz3eyZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbGQ-00000002AtH-3eoM;
	Fri, 06 Dec 2024 16:33:10 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEO-00000002AD1-2GQr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa53ebdf3caso406227266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502663; x=1734107463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=;
        b=f1/Gb1LVDJ2gygESXZ1YGtEpkj2zaIWqbsfaspr3BGU9ZFUPnjEyFS2o4giyvSsqMF
         Ocjd7zFlzjd4Inr4yC3PQ61oCV1JR2airmMq4W5MlsO0DYOSOI12+KecZLCoddUjfijl
         VSzGQ9JK9oc2GvfNrBx30xjQ23CZBD33gNJ+OLzwBTQS5fiZE8AuATupbczD1k3gb+J0
         mP9BUNGDpNi4lnVol/VkfIIGAOHQPg4ZVBKUrqUYCsreeFgvjDnxH7g8rdou3AJy/fmi
         xfSEfjBKYzOxSrGzaWJpmifjqK0SAwE/rHsNbC7SjkpwqFIUZSY9a6an5de3K3ZBlclN
         XWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502663; x=1734107463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKgkddTbsb36SqzZl1dMALspeUepmvmFxGiaTIa2E3A=;
        b=o74WAeKZD/aPYU3BHIuhvzoON16w3yLJPNx3Q/4z18ZnXxuEwGb/KpTpNbyFyFLpou
         AVIGKE8Hw2bsGTxirDuPpfEAaF4o9sncmbUvFuLbyZMZHq8TYs7AOzWfMQeW5f+RlVuq
         kybTUD+ugqWgxPRgGA922+memms90qlYm/psocdstzhg0o44CMs30MOJbbC2hZpuB6K2
         hJy3chpeHTqiXkQoRFNw3d8JMQImj1XEMM62lUlCkRF2SyLs/vd6zLcaG8VY8InlEdns
         YgTls4WQu++MvY0mgOmjznNXjPz4OAqfgWq8JjDIj30lVnygXQJ8zEU5vRAEFJVC4bkt
         daSg==
X-Forwarded-Encrypted: i=1; AJvYcCVK/ZOrxH+LMFEVxQPoCw48qGiBActLiYZG8trTwEoIzw12ddsuBNR+FxPIqNlb3E3bYlit/juUQNE9I4muez9Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs63xpom+JpwCbPPYwK1HRRal1+WgX+53voLnW1+DNoRl0+QTV
	umzWYD3fPNPOnx/VIj9gDFNrcFPhIhrqStbMI27dExacyiOV4uYrU9r3fbfqAIk=
X-Gm-Gg: ASbGncv1lK3FTEJU6HTYcnmNkJTsho4G64i++Swsmkc6gYCsNDjd3ZEI0ZBW8CxIzOb
	oyEuPS7zGU6isqEpPya2Zwud7fnLkRAZ+Aw5bwYbfexzdbwnhqZR7ieVjD6J2nceq2u7E/JwIPi
	JSp5bOlSbaUGs9qruA0clpsIx0VS0xWIAud16WesvESGOd5Jv23HmtJ9/5yKRAxtR0GFM6oMux2
	8vn8G9b6t5Fzz2IX33K2nCPxFOOXb2MOktLRbEGR4opwWZxisW6eoHt+FXelDHzcUwOW8mcozsf
	TAbifZoWSg1W/Ki0+0P4iugmWv5ZKIEjhw==
X-Google-Smtp-Source: AGHT+IGRlX7BIbgKcq4E8LlKztNa00vBgQAERS4YEdJ5MYW+4Wqp/mGqY/4IqsX/I0DaInCg04SuNg==
X-Received: by 2002:a17:907:7841:b0:aa6:32c0:5d05 with SMTP id a640c23a62f3a-aa639febf00mr320394766b.13.1733502662697;
        Fri, 06 Dec 2024 08:31:02 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:02 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:02 +0000
Subject: [PATCH v4 2/7] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-2-f5961268b149@linaro.org>
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
X-CRM114-CacheID: sfid-20241206_083104_574363_3BB8B373 
X-CRM114-Status: GOOD (  12.38  )
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

orientation-switch is the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation
change messages.

The USB PHY on gs101 needs to be configured based on the orientation of
the connector. For that the DTS needs a link between the phy's port and
a TCPCi, and we'll need to inform the phy driver that it should handle
the orientation (register a handler).

Update the schema to enforce that by requiring the orientation-switch
and port properties on gs101 (only). We disallow orientation-switch on
all other supported platforms, since other versions of this phy (or its
system integration) don't currently support or even need it.

Even though this new required gs101 property is an ABI break, the
intention for the driver is to behave as before if it's missing
(meaning for gs101 it will work in SS mode in one orientation only).
Other platforms are not affected.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* update as per Rob's suggestion (I hope :-)

v2:
* squash original patches #2 and #3
* actually disallow orientation-switch on !gs101 (not just optional) (Conor)
* update commit message to clarify that the intention for the driver is
  to work with old and new DTS (Conor)
* collect tags

foo
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1f8b35917b11..27295acbba76 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -114,6 +114,8 @@ allOf:
           contains:
             const: google,gs101-usb31drd-phy
     then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
       properties:
         clocks:
           items:
@@ -139,6 +141,8 @@ allOf:
 
       required:
         - reg-names
+        - orientation-switch
+        - port
         - pll-supply
         - dvdd-usb20-supply
         - vddh-usb20-supply
@@ -198,7 +202,7 @@ allOf:
         reg-names:
           maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.47.0.338.g60cca15819-goog


