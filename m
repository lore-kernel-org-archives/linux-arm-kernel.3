Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13C4C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e6j3hHRJCAXjbnkzKw0InC59a2Jr/wtnnQ/J/lnUnRI=; b=OfcicDyvDS+aiL6CbGWGRcXUuu
	AF/aI+RSX1YnTozS2K5jUVWAGL7we1h4GhOgZ74K7tp6FruiZUj1lq1eVUlIwJhXrKK6rreuOwqWS
	UYCA/8wGU4iF0QW8j/WD9kQIPkl/65ttI+ls1VCDQ9hkqIXyTFBoK+LFY7D5xZnDGcViE6jeb/5QK
	i/BVNqSZa29a+KAvOsaMfi8C2NthvqJSTQRSQsw+Ceifk+UhR7hJTQn1E20E5VamDidDCK2wfll6o
	mnsdPe1Qo60LFJyA+j67V0aE2/nwGJEznEpEnIO1Ei/UJ2tSurjbQ5EwbTVw4oqZrNNIqoDHQLGhv
	mjiWJEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppoC-0000000CxeI-1QEc;
	Fri, 31 Jul 2026 16:10:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppo8-0000000CxdS-1lI9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:10:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1c26d7e951so173511966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785514198; x=1786118998; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e6j3hHRJCAXjbnkzKw0InC59a2Jr/wtnnQ/J/lnUnRI=;
        b=e8s0RkU/LXUdLRnVyVR52emlEPu4rU7ecl8ogWA93e+4TKQaqx2AEcF4UrKzdPxjYf
         BqwLwtXcGADHxJ1XTKplfApHe5n5MPIzh5CLPThsXyk/pymB/BD1xyket7ZrkyfQ9Lt3
         G05PIbZy1rO1k8hJ30ZGocEl6iObPAYZoSOgqo39qCYrStLRzh1g2W+rgw9t54+lwoyi
         QC8SS/ItO3UC2Ez9GVn+BmWqXDqvuoxa4iB++FYF03dz2dYEAoFmHyDvbw2nUi4LPX1z
         iF+y1Wap2g3DnjOzdZ9oddknaIVsEZuTwg8ko9uv3eY5YDoFnJXKY5MxONtcK+dA/fcK
         6iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514198; x=1786118998;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e6j3hHRJCAXjbnkzKw0InC59a2Jr/wtnnQ/J/lnUnRI=;
        b=FqVyT4tX8xeRA1UF2UF0b1UGVcUH2qvucyKPqxxXBmniqIhJSf2KBAVmxzmh8g8D9O
         fIdLwhMt8p7xlRO8sw4IqnFxBntCbc+qleEEcChsSVJ2fznM0NkRQCuC7r6gTeLHnLpo
         gCKHOolXoCF4HK8x53Nna1R8dsQN9QxihGy8XE6SfPMqGkFQtIMZb+EdgmlUJycK024h
         QQMjNq+5NHDthmn6yT2nm2+jZ9F5H8OdTNSwLRZXLMgfpuoSnm36m5RJH1SgnUHv6Rgv
         QtR0SbUTe/iCTVcKw9MlleDBKZjZHbfAuMzAqBsgHWvP3yqcS4hrXTiYjH9BUc/MtDl7
         rFBw==
X-Forwarded-Encrypted: i=1; AHgh+RpydMjzQeX3cQ6QWl/czgjasPPVhWztLNtd7UczsGwoarqHaO9ZiVm9g+jOzedmlbOrgxAKyJrlh/FbCTfm6ldD@lists.infradead.org
X-Gm-Message-State: AOJu0YyA51k2duSKRp+mUNDWyyzzHqlA0GrD8QAMtIod8GqCPrhbyKHq
	IJHhMbED/PK0Uu+WYa6Aj3nWAk0xqkPhn0M2AQ+xS0crUtwiFe1AgXru6FiYL02+vTk=
X-Gm-Gg: AR+sD10UD4M1kTQ9j26C1IkGY3/9I0k+lLQ7210kCel4zAOX7r7S8RGNwrUxHnz/Qie
	Fpi9AcMdBVbPjcwzMdH3g2U5Ok9jiB4qQ9lKx2R2QsmgYYaWitk5r5AGVan++DjfW9HbFiCEQS0
	MK+E4YyEm3nJz5RTvpA54ePLIEaloTJdSBKqKSIIiPZ8bA5Pj/6M1Lyqqiiw4rr2P21xqqzrvuu
	nIxFYKF5zLEIyiJ4/1Uum1sskmAWqei0WIiFlYbW9FfDj69DbCMEJg1wmOCGIvQiw+ncWd5dT2c
	/YRSmitew006XCo5c50zn6yGqSc7X1Cyh96RvQOufJtcysotyh6UawYYjjnr6WpgawGO77rJuTc
	JFZSppzzlUF4FpnwuU7hPBdYpTjM7PnTTZ4o7fsjluCC/h/M+FkLJKPZt4s+V93cjZsZ9JNknCR
	I6OWBF1YwXjjktZSkersciOBWCa1+IefN7OEY/0vXcXQcQ9ubaE0yvR2uoTA==
X-Received: by 2002:a17:906:f85a:b0:c15:cc30:6c74 with SMTP id a640c23a62f3a-c1fe816fa83mr13218066b.44.1785514198430;
        Fri, 31 Jul 2026 09:09:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd4562667sm6729424f8f.24.2026.07.31.09.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:09:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 31 Jul 2026 18:09:52 +0200
Subject: [PATCH] dt-bindings: irq: sun7i-nmi: Document the Allwinner A733
 NMI controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-allwinner-a733-nmi-support-v1-1-61e4a0825b20@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAM/IbGoC/yXMQQ6CQAxA0auQrm3CMAbEqxgWAxSowTJpQU0Id
 3fU5Ut+/g5GymRwzXZQerLxIgnulEE3BRkJuU+GIi/KvPIOwzy/WIQUQ+U9yoPRthgXXXFoU3Q
 p674+O0iDqDTw+ze/NX/b1t6pW79HOI4PZc8kdX4AAAA=
X-Change-ID: 20260731-allwinner-a733-nmi-support-fb026869d941
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=c1BBB6bs8QkRJGVWb9VKH09aVOOWU4p3wPWDCQ5h4r8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbMjTXlrz8rv5mNapSZHl5WcOPxLnYyYNtyA1v
 pQrskCrQ4GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzI0wAKCRDm/A8cN/La
 hZQED/9s3wGP6F3JuJnfZQb8AMYiff+jEIymztKBJmuUapVpEX1g6yG7VgtcuinzOj50NimCXST
 C5F4G0DVAjSJ0aNNtqfMnpuUHfZRGMers44mqlkR5eaUcs6ivK8NMAwCKfy8dW5HbWSKoEjM2vf
 BlpME3HnSpanmW90H5I7Q/+wYL8nBEtBrb5AwNV8eXjt1GrsVAA+QF2kTVZWNGWWEGTUol7I4mX
 6/9NK6wAnSZj5YFQtLfKH3yT5rO4dASNYXlGymkFjudS2R3LXarLSy/VWib4GF0d8KrQWUVLFeU
 jVQcho5P9+DOn16gFnf98uhRrW8O9Ye2HoP6UL43ICmUjNGuqaDEcA9F1Sja2Kls4G87S8XdewI
 4xT/YCKhbI3kf1JQvExxXe70bMvyqa/E0fE0OaUCT46OpU1s0CJTy05Abs6bHasfjp7SaX0hR6H
 vnvAB9ihBDboKlmfYqfhiLhDzE6rtPQq0PLwmo5VhWKlwGwKLt1myTUJbgFd9JEB0LmBCbDij1n
 GeGD9K/dzURhv7nXn0PDQph8Wde72L4swPxCy+zooa7IJPPUy/jJvtgM97FZA8oUi5EuQyPpvDD
 EbH6AadYG1kzLJOg5KG5/GRL8LK4khnWzPi7CYRQ9JgTna2edissvwBqYS769OE+afxoNzqb/FU
 mQLn7PvJkUM10BA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091000_479269_C93F927F 
X-CRM114-Status: UNSURE (   9.90  )
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

The A733 NMI controller is compatible with the A523 one. Add an
A733-specific compatible string, with the A523 as fallback.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index 06e3621a8c06..bb9273ec2457 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -33,6 +33,9 @@ properties:
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
           - const: allwinner,sun9i-a80-nmi
+      - items:
+          - const: allwinner,sun60i-a733-nmi
+          - const: allwinner,sun55i-a523-nmi
 
   reg:
     maxItems: 1

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-nmi-support-fb026869d941

Best regards,
--  
Jerome


