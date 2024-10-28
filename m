Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D559DD339A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saDUfDEJR0b1bnX4tkk4rHbVAroR4qkyv+y1+fjCTpM=; b=XR8U/WvCXDaMUINQSQqta7InM1
	6+YqhQpU4+07XKSI9dMNvLZy+mNK3ZoZQ1SnY4fgyP25tRhrYHpw3wY8GtNhfd220dxdMgEQAwHnW
	TQMPBY3aRZ3KAvf0psRYapDTdGRkiFN12u6x9H3T/9cmqDSg69TrzRLIz0Rd7a+ivZvtJmvsJ1r5q
	Bw6EiUUmGlbjpX5vn3xlJSoLz+Dum72ztSD9YxTwwtg5UJHO+3YhKcagq2wdIMcSBx601em11FMcv
	WcQKbcLjgmh2EL3rKWrUwL7wK158O0uXKWbSAWxs6dsdj1waaqM8b/8tnQjpn1e26wWBkqSBFNnht
	5QV158/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tnp-0000000BhAC-2OMK;
	Mon, 28 Oct 2024 17:45:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tj4-0000000Bg57-3ggG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so47170555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137221; x=1730742021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saDUfDEJR0b1bnX4tkk4rHbVAroR4qkyv+y1+fjCTpM=;
        b=B2CjRz+SWrLt4ZKqkGz4Cw4cqwhfWxmsQn1HXU9eBelMLcADMOuO11sJzB6Y82fYtA
         zznGS6rKSgp1oPoPgwYCoibnc9a/Y8i/mZIfpBvOxjTkB+hOaGnlqIYWCTf9RvLUMp5W
         DvX4IqruKqejoyiOacSgyfrfBTMQeisAP93bPc5fkIoYM4UkV2GbOzfsu6KZL0n/mNda
         7mqrfEdC/WrOO2pAAdfUL3ypEjkC7EN5HIVPXFewbWZpf50esaddEL/rTo4cv08rMq/k
         NiL3x+zOregelSIBoxubvo3VqV2gKXj6egX8mRzdsS8STGRRNWByqpJcwp6BZbessbjW
         u3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137221; x=1730742021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saDUfDEJR0b1bnX4tkk4rHbVAroR4qkyv+y1+fjCTpM=;
        b=dH3AfJl0IN7C9gkKeuXNHMisvKhEsDuffN+mLhIGanXJi2EgQClaCzwRF0ialYxDSt
         ysszYZbTFSZIqsPmaNKNJwNCTtCix/tb7FYixFgJlg9IkFMUu7c/O3XRXB84JiwtDg7u
         846PqMkWaRxGRuyy2vgjnKVt7zw1Aw4yz2CTBV1z9Y5tL+k+bTOu+kYJubPqGPpudKiA
         rKc44tRozGm0tU2Tamb9Bsk1I39TBNY2p7YPRyhQRDkSvOAsquMnmlGPKchS4B3/ZzAN
         8IXl/Yi4u/uBjQzN5D772/nMlapW8rIMZtOJRgaGh3q9FK5lErjp6m7FmKetdqTivDt+
         YFow==
X-Forwarded-Encrypted: i=1; AJvYcCVlNVMwxSxbyB5Z7rIw4OZprbaiZN3wu9tSb5gM2b0CqDQMkj9rZDjmcex7FXdIgJb8N20Khmv9I5vnJX5FZhDg@lists.infradead.org
X-Gm-Message-State: AOJu0YyV80/Itrrry8wQpG/N7IS4cIL6tB5JDJQKtN1tUH97rZsNEI5P
	DR/n8gK4qLMVnBi4wTSX5AHeLD0nxBuUkT+2ct+V9JgepfPD55wuKzmWPUjt0dU=
X-Google-Smtp-Source: AGHT+IEFgqPvKk7zPEVSc8W/hIxxgLdyl05U2omshsXFU5gMdwFKyPVKfHosWtNHQDrxWACBCsN4Kw==
X-Received: by 2002:adf:ea43:0:b0:37d:633a:b361 with SMTP id ffacd0b85a97d-38061206c0cmr7014723f8f.51.1730137221379;
        Mon, 28 Oct 2024 10:40:21 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b479ffsm10101137f8f.49.2024.10.28.10.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:20 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:08 +0100
Subject: [PATCH v5 2/9] dt-bindings: can: m_can: Add vio-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-2-33edc0aba629@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UPDN5Sq6sr7oOOH4G9BvBLb/9GgPBe4IrDFtGwTay8A=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz4Run/jwReX7GwrBXQwK7SZ2pn9mW29ZJKfoziIyX
 +yHmcGLjlIWBjEOBlkxRZa7Hxa+q5O7viBi3SNHmDmsTCBDGLg4BWAiqVkMf7jENx4SjstJted9
 xanLYlMR9vmuZ992XZeNc/9d45LmPsvI0Nh9nXNu+tu+R2vOqZ7Zc/Hysj/vT72qXLlL2fDqW/4
 3U9gA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104022_956211_4BADAA28 
X-CRM114-Status: GOOD (  10.71  )
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

The m_can unit can be integrated in different ways. For AM62 the unit is
integrated in different parts of the system (MCU or Main domain) and can
be powered by different external power sources. For example on am62-lp-sk
mcu_mcan0 and mcu_mcan1 are powered through VDDSHV_CANUART by an
external regulator. To be able to describe these relationships, add a
vio-supply property to this binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index 0c1f9fa7371897d45539ead49c9d290fb4966f30..aac2add319e240f4f561b755f41bf267b807ebcd 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -140,6 +140,10 @@ properties:
 
   wakeup-source: true
 
+  vio-supply:
+    description:
+      Reference to the main power supply of the unit.
+
 required:
   - compatible
   - reg

-- 
2.45.2


