Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE93D339AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0ITVZ/ruKG/TLGpfGAwzLMygWSysjucbld18q4vTYY=; b=06Gw/lzhKQdVjYeCD/Tm8LX35S
	WUdnNuFaQ0Q9uFit63tZgOBPDDj37KmAvEC5hojlgG4WMtoxvyWJG0A/dtnlUEX5msEkGp7iBZQKE
	StTckLDAftwG8dW1C0IgSy8Dbbgh0LJbd5K8U8MFvyr4huWZ8ploJVquf/mZyNAWEAt895a+/93I5
	nFi7qL+rm2QoipJXj9+3D9k4J97Lqz9m/XVUmLJ5hvLJu5w3iwNNfwSpGrY508S4I7cLSX30keMrm
	Y95dGVcPY+YSp6xN+1mpxrJaa8Yq/Oc6n/yD8dJ3mzqJTtgQxhvEw3SUrA1oKPJ5BQo4oHdVCwXZK
	pWBh/q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tys-0000000Bj1X-1Uyz;
	Mon, 28 Oct 2024 17:56:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TjE-0000000Bg8C-2BRT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d4ba20075so3169987f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137231; x=1730742031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0ITVZ/ruKG/TLGpfGAwzLMygWSysjucbld18q4vTYY=;
        b=omhia8Tb/W74z+Ql6WmSFkA0Hix73aW3U8tfJAke/aH4Gq61VgvTzUXRqO9bv2ZF6G
         pAlLd4yHvAmxA7EMgCTCsASBG/wYQbj8DbZGC5gaiKIgv2NmiCv91lkuQ2bAXsrcfUKc
         6n18IvGpgDYNoKUCIMi1Bw17EFkC+BpgkGg8zh7gebU0KG+ZwtIF7y4tLufbdnGlZMzJ
         aUFSefaq8COOzIdqKYqUsPMHwdn/Y3yOmXCPM8EfIaK6EfJ5ADi8qlD7zH2962LB95mg
         XH8WhPtFuHwwe5W62/Xa6N2J8iozllpBlIq7/jIK3o8m3eWxaaV02U1RrvXtYP56ai8v
         rccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137231; x=1730742031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0ITVZ/ruKG/TLGpfGAwzLMygWSysjucbld18q4vTYY=;
        b=XhGVj3nsiSrc6SRHCQvgvG3ISxCoYk6/Uxw4sMJ+KDaHDhjZ36peCUpDTnD411gttM
         mPjLiG51kueVtUiAv/2M4Rk81RC0l1LqwzDyexucNYdwJUSChWRLvBk/lu9E3s6ufYHO
         HZInK/SRGXzjHZZkBax0tx6M+ap/paQmk0g1DAwc4J6nQfnzfXrzcecIoHRRdnZgIFKo
         w/3NJ0fcqAM5sdaXsIC3Yblbjp8Wxqlvr5M44aSF8H3FP7sJnDnL0dx0MtJXrPRvA8s2
         GbtXbq2BGELs+6uNkTGswxIlnoY9dv3Rohox2GfKTURf9o76UqLnoQaEmoo+JDS/mMyX
         t8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUUebeo2gJ6/f+Z5nEf2fOyeBeZgo4iq7UW7jskhK7ZEDGGlOG8/ENWnqxXj6KFZkyT9GVU1J795Ufcr2JZAD33@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3uNm6CC0NMDuxvC4+MIg4rfrShxMXiURWra7MIwSsC/4+ePHE
	nrE5gR0tj/mmK5FxtT8/I3W9sWFPX9DHfRYr+ca3Ut6Bk0PFKgm4KrhLVN0pQO4=
X-Google-Smtp-Source: AGHT+IFLz+kMolvcZZxnHsJqfE4G0Nz/GW/Zkf9/d2T203wI1tYzTYM+qzVyQH5oPcQLAmMdMoEp/g==
X-Received: by 2002:a05:6000:dcc:b0:37c:cd71:2b96 with SMTP id ffacd0b85a97d-380612008f1mr6773135f8f.36.1730137230728;
        Mon, 28 Oct 2024 10:40:30 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b928cesm10176299f8f.102.2024.10.28.10.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:30 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:15 +0100
Subject: [PATCH v5 9/9] arm64: dts: ti: k3-am62p-mcu: Mark mcu_mcan0/1 as
 wakeup-source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-9-33edc0aba629@baylibre.com>
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
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Tq/fbr0WhZHR5UVyg7x0DcqyPJVYjETLUN6TQAqpB5E=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz1QyzdQW6Wafxrhl8zL7h8zPPz36vakyx5n/FdNag
 zg23n+SHaUsDGIcDLJiiix3Pyx8Vyd3fUHEukeOMHNYmUCGMHBxCsBEZvAwMpz8YVn959dP51+C
 HlPT9itpm33meOze4jNJ5GlLaqamVgPDb7a0zuifaQx+cmx6H6u+cz6a+NKj7M6J5R/Yog3PWBc
 85AMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104032_598213_46428E24 
X-CRM114-Status: GOOD (  10.94  )
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

From: Vibhore Vardhan <vibhore@ti.com>

mcu_mcan0 and mcu_mcan1 can be wakeup sources for the SoC. Mark them
accordingly in the devicetree. Based on the patch for AM62a.

Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index b33aff0d65c9def755f8dda9eb9feda7bc74e5c8..3afa17e6592f39387a667547835c90f95a9af351 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -173,6 +173,7 @@ mcu_mcan0: can@4e08000 {
 		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "int0", "int1";
+		wakeup-source;
 		status = "disabled";
 	};
 
@@ -188,6 +189,7 @@ mcu_mcan1: can@4e18000 {
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "int0", "int1";
+		wakeup-source;
 		status = "disabled";
 	};
 

-- 
2.45.2


