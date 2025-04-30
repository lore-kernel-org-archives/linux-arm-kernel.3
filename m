Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB769C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X6J/wP60qX9EMmv9DuzGd9/gCNPLEX86V7P6R5wq8+M=; b=at5+vsB9vL1opcJdn05OxS82Vk
	uyvXjJv/vGn5o8PkiY9//sPHa9+drTm5KNftvPY81BuLCIYi83kbgYNYMIoGCPMieI5/fh7/hfR84
	JmLqFXqQGDmIQEgOUDWB6ebpPTKKovwCX9oRx1c7AFcFhAIF0QzKeZayY2N03zuMOgL/e+gxCiz06
	+3vwbjkN6I5WFAgfWwHomOYlOllKcylPszWgQ93GQuS3mxHOwxV4vWLAXCffoO70SOTyn4z/3tHON
	UPSenMI3utlgIO+UP+WXW27ahFin3WLodeZ6rcpT5z/GvxdrPq77MbYPKz0i2Vr4yiBDl+m4lHQ2r
	PEOADePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5PZ-0000000CeXx-1nrc;
	Wed, 30 Apr 2025 11:15:33 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4kA-0000000CXdt-3uoC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:32:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac25d2b2354so1079252366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009164; x=1746613964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6J/wP60qX9EMmv9DuzGd9/gCNPLEX86V7P6R5wq8+M=;
        b=kxQNAZFT6NRAw3rxgJZslxTcanUe96hk7KJnf+1FE8aqhMjIG9cBqPfcpTvfFXx8Vh
         YluOD7pOR2lvZ7/jjS/N1GliwNWB+PHuWhwHSaxXAZwqtAIoOuLsyw3p860vgUoSJfri
         qfyTRqtpHnlF9NYJRhtVbV8VAOPyHWC3CFRccrKh3ZOvayuYUEaxLkgV2JADgcLMXm1x
         DDnJIeXm4V1AdZYnrvDmebIk8fCWnQNKiJIIWJM4teq4y54LRDr7TjHewGljfY3I5b5y
         jW/fIj9ZIw+I31G9lf75eXoMHES0Zzfi9rbuEs8WEQ5VzxVWzjazxhASoGn+uGx6haGe
         qISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009164; x=1746613964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6J/wP60qX9EMmv9DuzGd9/gCNPLEX86V7P6R5wq8+M=;
        b=mhpGgo48LffQYxQzYTb9xYklkLZt1djuXmNVDXsXM0NY9/oCoBA1Wp8GjHw1KU4K30
         yUXUvE1W6578UCCpzezRTKNLLly2WxP+OxqD35vL93bODrZVYKEiLCDnQAXZIxYz/aOU
         QPOkQLkcpiLSAiUBKz1bnToQ3Ai/P2gJreFtdn1tylembXOUbk055xajQN+zI3Y6RhiL
         qkEKoo+w0wWWxOlqo9/Ijqc2F8nISTnJC9yH8YJjNsQm+AzUk8JnapzKNhLk53RimDFV
         OLoHqjPDfdKjfc3J50vUwDc/EjrlTiEZSldcuspC4LvQl0paYaEoxt8+Z4lWuNVl/yT+
         agng==
X-Forwarded-Encrypted: i=1; AJvYcCWuUVmVKqbEO4M+cltSkPp8yrDb375FkdGxD+1KgtDGcaFAiXFQajJ8AF42eefE/Qkk7xLFZnH0t3TrT+jPQ09B@lists.infradead.org
X-Gm-Message-State: AOJu0YxjAQmlDxJmENRNCxSdlaHVgHzxERB1eaLIsXjQAhWjTIuuDwwi
	4/eQ1L0WQGnNtitfTA7hkU5xX5f3vjXTD/Fq7Iz6KXhtAfJcK1L0vpGM/+CvqTo=
X-Gm-Gg: ASbGncvVdyKIX+9wVv13N4X7c6zWTdBPVPW0erR6Rtp0KSdT0HpjAtk985p/qKWmY3Q
	52KCO37jwnKX/OIRF04P3H4QLnsi2Cw8L2d/em2Q2r/svZH6ck1Dz+IBUQZuBnBDCx/L8vVpxAM
	kF21Ovxs4APgaGCDdZuVTGFrIdXfKSEzlkz+xF5oDoP1cHAg9wATUQjivuMtWojBlk07eh3UTI+
	Qu7Nnol0WJDl2QUjev0ot53URXMZFV8E263Syke+SkWbtIqmJnXrhBYq/4X3wibirtn1tO9Vr7W
	C2CZ8be1o+StBMwNwDAZx1J/EaxcinjxSTaLzG/tgB/Km19biix8uwaxlyqp5xYo0crUvZg=
X-Google-Smtp-Source: AGHT+IEOvbi2uWkiYWLZUKj6dkW3LeitEy0mXflUVZbtvIN6vYaH2BYKpM0Qfawxgrnw/YhMKetmjg==
X-Received: by 2002:a17:906:dc8c:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-acedc575056mr227019766b.8.1746009164440;
        Wed, 30 Apr 2025 03:32:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:32:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/8] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Wed, 30 Apr 2025 13:32:28 +0300
Message-ID: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033247_091966_FEBEBF16 
X-CRM114-Status: GOOD (  14.64  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds a PCIe driver for the Renesas RZ/G3S SoC.
It is split as follows:
- patch 1/8:		updates the max register offset for RZ/G3S SYSC;
			this is necessary as the PCIe need to setup the
			SYSC for proper functioning
- patch 2/8:		adds clock, reset and power domain support for
			the PCIe IP
- patch 3/8:		exports of_irq_count() symbol; this is used by the
			proposed driver to get the number of INTx interrupts
- patches 4-5/8:	add PCIe support for the RZ/G3S SoC
- patches 6-8/8:	add device tree support

Please provide your feedback.

Merge strategy, if any:
- patches 1-2,6-8/8 can go through the Renesas tree
- patches 4-5/8 can go through the PCI tree; these depends on patch 3/8,
  proper sync will be needed b/w PCI tree and Rob's tree

Thank you,
Claudiu Beznea

Claudiu Beznea (8):
  soc: renesas: r9a08g045-sysc: Add max reg offset
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the PCIe
  of/irq: Export of_irq_count()
  dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add documentation for the
    PCIe IP on Renesas RZ/G3S
  PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045s33: Add PCIe node
  arm64: dts: renesas: rzg3s-smarc: Enable PCIe
  arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

 .../pci/renesas,r9a08g045s33-pcie.yaml        |  242 +++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi |   70 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   11 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   19 +
 drivers/of/irq.c                              |    1 +
 drivers/pci/controller/Kconfig                |    7 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-rzg3s-host.c      | 1561 +++++++++++++++++
 drivers/soc/renesas/r9a08g045-sysc.c          |    1 +
 11 files changed, 1922 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c

-- 
2.43.0


