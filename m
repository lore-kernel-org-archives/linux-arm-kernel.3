Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDBCD339AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BosgQ+kD0H5BJCs43wOOr0oQ/yjsIN/cdckDvbryFCI=; b=N+UWloW/jtuDJ8WMN7DX5FltLc
	teIq4hN1ckFUg92CXzWGsfE9MlfDAX7L2srlml4cfUTK1Bv3C4XMJw+5JiRz3p0hHMvUqKKpwefSb
	zVCpRAT/DhJfwCoTKISqNYmNfl5MYB7lO7/otEubJlg173IE3BpIg9G+4iCwFe+hTn+p5cRqVNk3l
	V7DsR4TxF7UDg2Qwnkwlhjk7I/Jkx2zLIT8XF+keqdUg+p0DISMp09sKqD1FZa5Qk5pcsdFarLWAa
	N9PQ3Ti1QBJqCiM8dohfDZOZKv0bpRrfFKvbygX8Ge0b3cxGTeh15O5IG+pMzpny3VeCIkuihNfE5
	lxQXsscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TmF-0000000Bgne-1RGM;
	Mon, 28 Oct 2024 17:43:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tj3-0000000Bg4p-47sl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43158625112so46544675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137220; x=1730742020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BosgQ+kD0H5BJCs43wOOr0oQ/yjsIN/cdckDvbryFCI=;
        b=dVo3DdisWlMS7BHfHKVffTUtVpF2X69jhyAD3CCKrwa44xGh9QXZC18toWhEKxaBtX
         lPe5dUgWky1yaXE1qXQxkSe6iSUXtZNr+o2cSReryRWypwR90rKIfEN3NwbVurQ7C2qH
         38x7hj+EqzEwhmNJz98PAtyAhi5wRoDkFE93t+4bDdMLF1lIOat3xkVGBPCmhHE3n00y
         PlU6JZY+iwj1bHxQarBaSYZjpbLFly3FouacK5raWsT5q3jwEA3NXFYdvR6SK1trU0fJ
         2efg29Rt9HnWcEv8UAaZus1azjUM6muKkJFv1ahec3h37yYp+t9/jbarQ5/FUrjY7h76
         4ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137220; x=1730742020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BosgQ+kD0H5BJCs43wOOr0oQ/yjsIN/cdckDvbryFCI=;
        b=RNudljZvV/4rwwtFmTa/hYhEBvOBadf2CwPoOK0rxO5fe9pxoOZbYxflPO8Hlr4F74
         jpPVB+g4CTwWpttfPceNWpoR00oRJD7Bqkk2leacDo7IhIbTW7YMlmIjQgOXYp50ORz4
         5/Nr6obecrakm8U5XCRsuA4MXql1T3idlh/vI+uLrHVAdBiKPze/vhopcv0kQmCilkG6
         iodiw+NYhuO5eWcMt376LNLxQ0DMZWxjVOfKhWdMF1TxvdNmmQkCx3VfMRPyFSfcEevx
         O4z+kSiPlOQwvYVV2gUS518lewybmq5hSmR6bage5RBVsjkLDuB9oYKhBx33OhzeAMpR
         4+0A==
X-Forwarded-Encrypted: i=1; AJvYcCUcYZ50/OzULR9gOZjJqtLGKIoeKToQXnW8f15ew//MNaPoQyRjH3yyXI3B49cnCJiUxno0STsdjh2oVScUK35y@lists.infradead.org
X-Gm-Message-State: AOJu0YzrEy4l7P1qK8eQlA0mH4+wwLGwOq3J4dYkBebB/G/d6nokSNlc
	BfFHoiEUxY49y8Tjg1O73VRPksQuigRXNgvS9ONp2K0Z06TyPyQ+Wrt0nLoP54c=
X-Google-Smtp-Source: AGHT+IEqqisyDCHRMO2yXr3fzu1rVySxQSqDU1ltOdB1gBn9xls9XzEdxtAs+MNmhWUihFO/tSzfJQ==
X-Received: by 2002:a05:600c:4ecb:b0:42d:a024:d6bb with SMTP id 5b1f17b1804b1-4319acb8145mr62323225e9.20.1730137220010;
        Mon, 28 Oct 2024 10:40:20 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5431c9sm147417555e9.0.2024.10.28.10.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:19 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:07 +0100
Subject: [PATCH v5 1/9] dt-bindings: can: m_can: Add wakeup properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-1-33edc0aba629@baylibre.com>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Jw+WdBzdeJ1ejN6JFooZdebJTss0hVEiqW0IkRTOyf4=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlzwSUGSpPS0vrUKo/MalQaG9c6eXD7a217xauk64xV
 vQ8/XFnRykLgxgHg6yYIsvdDwvf1cldXxCx7pEjzBxWJpAhDFycAjCRkxGMDPtK5r8O7H7EI3f9
 tZXC1OXX9n22mT9R+OvnC/Pbwmd+WxXLyHA8SLDz636BllYXl6eGgh6izRv5wh6Un0/dE2Pd9P/
 gOkYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104022_062943_D60C761A 
X-CRM114-Status: GOOD (  12.47  )
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

m_can can be a wakeup source on some devices. Especially on some of the
am62* SoCs pins, connected to m_can in the mcu, can be used to wakeup
the SoC.

The wakeup-source property defines on which devices m_can can be used
for wakeup.

The pins associated with m_can have to have a special configuration to
be able to wakeup the SoC. This configuration is described in the wakeup
pinctrl state while the default state describes the default
configuration.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../devicetree/bindings/net/can/bosch,m_can.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index c4887522e8fe97c3947357b4dbd4ecf20ee8100a..0c1f9fa7371897d45539ead49c9d290fb4966f30 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -106,6 +106,22 @@ properties:
         maximum: 32
     minItems: 1
 
+  pinctrl-0:
+    description: Default pinctrl state
+
+  pinctrl-1:
+    description: Wakeup pinctrl state
+
+  pinctrl-names:
+    description:
+      When present should contain at least "default" describing the default pin
+      states. The second state called "wakeup" describes the pins in their
+      wakeup configuration required to exit sleep states.
+    minItems: 1
+    items:
+      - const: default
+      - const: wakeup
+
   power-domains:
     description:
       Power domain provider node and an args specifier containing
@@ -122,6 +138,8 @@ properties:
     minItems: 1
     maxItems: 2
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg

-- 
2.45.2


