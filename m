Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B958BD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYexXqsopB/TorltyWtW3DQvmZVEoLO13n0GfiFkuag=; b=neQn+s0K0t5XHbQhmlqp5vFthW
	PADfrfFwGBrj78vns33VkclQJQa7MZ4L45GOyG5WLceB4Rnv+Gkn3BwlCeiv1cdzvY5UCDjp16DpC
	AxL3VjMjwhxtVJWG7sO/6n45ODhrRYYvmZNxjG8hJeYoFtaTA3eMlCaOdYLgzQ1b7w2lcnU4AqLlq
	Wa6FKWS2yW8vTN7Wmj2lLNk+pNAaEFJCO0ZBoLM6OjS8noedcA9MCSGkpohv6jQnVrkougjnbq1ew
	OBfQPPDL0L5wl7oZTg7GETIt1uH4Qk6IGVsrmVVQk2BUV8ArRQ1bFDWLvxYn0D23XBhigTrfES4o0
	ib1/qJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N09-0000000APDR-01qK;
	Mon, 28 Oct 2024 10:29:33 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Mwv-0000000AON1-0Iuk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:26:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e63c8678so4047256e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111171; x=1730715971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYexXqsopB/TorltyWtW3DQvmZVEoLO13n0GfiFkuag=;
        b=pv5arrNDjrbBYSScGvq2gJFqLRssFt8aRN8A/7fB3pszABgu4ACebDprXNDht3yGL6
         z0Gkj1r3nFYofypzvfSfGYJrZtnaOX1jdmOqS4YE/iK2Uzv5mICjZfEvOZ0wHFEgz1Bo
         QSCM5xFniaL4RA8ggC8F/c6UWjD6DKxhAfQD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111171; x=1730715971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYexXqsopB/TorltyWtW3DQvmZVEoLO13n0GfiFkuag=;
        b=UBBi/Qmy6nXTmfZL6op7T0dhWSOZrPczNJhh4FelWeh4YPgBCN1/+oAHm2AbGwu4ZX
         9wcJXY8lJLI0xv056FzZBw6X2HkqcH595DwWWoKK+WFN2d0kKJbobCACIUieGsSoQy04
         7+opPxLNc13Pu2AgFUmDqHBmCi2wBIMixSC9ar36UtZGEi4OTX8KyxtJUcbCCm+9+K9P
         zcAUUHWQiGv4L8nTpGt9WqHrEyZG6hBzyrE9EdFXtC12bYQMh5ipVz5L4wz3vvRvfEvu
         rbRUXh6zAXheyOSZL2L93ueSNop+KqGUUSJe2kGjD6MqwKLTdQNKIeotgIRpivwgupzE
         9sXg==
X-Forwarded-Encrypted: i=1; AJvYcCXLKlerGFcvQy1C0uRaWE1o1LlEGRJ0ct63KLBIFvcLovkbHtYQB8C/yEgufILzvYg7eAQxLwD0HTwu9Ho3/4GL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgk94d/8Zr8M2kBHqQGVW7eP1455upVQAxzJap1xbcGzd/TBGH
	BcQk7PbmdRaGykoSFeuHDvacJXxHteLANZzGpt2N1brj4aFLkB3Yd7WepQHUsQY=
X-Google-Smtp-Source: AGHT+IFPiWSMUJsvLDsFUQKEPXeJtOq9dyzWbF9cm4SlPeUZQ8cIi4gauJvX3gywzP7yEJIBk1InHA==
X-Received: by 2002:ac2:4c46:0:b0:535:82eb:21d1 with SMTP id 2adb3069b0e04-53b34a3516cmr2517575e87.57.1730111171159;
        Mon, 28 Oct 2024 03:26:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 01/10] dt-bindings: soc: imx-blk-ctrl: add 'fsl,power-domains-boot-on' property
Date: Mon, 28 Oct 2024 11:25:24 +0100
Message-ID: <20241028102559.1451383-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032613_133189_59AA8618 
X-CRM114-Status: GOOD (  10.62  )
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

This property lists the state of the power domains, indicating whether
they have been left on or off by the bootloader/firmware.
This information becomes relevant, for example, in the case of supporting
the simple framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
index eeec9965b091..00aa0b8d8ea9 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
@@ -56,6 +56,15 @@ properties:
       - const: csi-aclk
       - const: csi-pclk
 
+  fsl,power-domains-boot-on:
+    description: |
+      Provide the on/off (1/0) status of the power domains. It allows
+      specifying whether one or more power domains have already been
+      initialized and left powered on by the bootloader.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 5
+
 required:
   - compatible
   - reg
-- 
2.43.0


