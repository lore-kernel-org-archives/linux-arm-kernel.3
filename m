Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21460CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yet0G9q2Nul7wE7O4WOA4//yyR5OUJOrXfjDFK6H1h8=; b=dOtyvSdomojuLhjffaQkA1j0pI
	C1RBdO/Njbd6VKdJyEoUQ0EvTzhUsq0VrvIA2hSwBMSnhzT685OMhTaB5Yk7vYOytdOP4L0iQSzy8
	Gb5eFV9KeNH21ts17RqI2+7dfRA7jG4Wga8Pn7w+HbBYhzBIayFHTfLRTzZyMF2WLN6CvMDhDu/U2
	ZcuCzIF4x6b8vVEC9Er4cC9eAe+jM0uSpZLGaWvZmUY4YZwJB2T+rYSZGYpcWBJvkoq/kayokusvD
	vXbJfS5S0eQn6nkGYdkwxNiGOLBdoMI9M4fPDgcMkb6t3bEdTTOB/XOTYxwnIWCZbGA6bCYcH/X6k
	4/3K/uGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839s-0000000BlRV-0k3s;
	Sun, 12 Oct 2025 20:59:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839p-0000000BlQ9-1bCV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso1939173f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302747; x=1760907547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yet0G9q2Nul7wE7O4WOA4//yyR5OUJOrXfjDFK6H1h8=;
        b=S9kk6USIWpMnwawfEywkQhG8dYwFmqkpBINkqXdZFwF+iy83kUuqvOtvYRilouyXk9
         I88ummRzroVwDK8jS1HkjUkOcajihBAOcjRBIUf+kwDD+yP0OfSHKuekx1q3euqeEmcJ
         5mebhqMfcWdwCLv67TFLzUmbIskP0afEi45jvBu3v2JWBP14mkPFVFdN1z0OemVjE+2q
         xjN/TlPqIKXXb3rQSefosDFs5JccXxApdRQadfigVuFDBqYVH9moU9PO+BaUTbQe/5B8
         9fIGPrxivG23hD+a/N6xXrD3ZX0jug23bxxxjS4d94Te+xCv5ScK1gIRBHvtItmqv9Wa
         /l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302747; x=1760907547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yet0G9q2Nul7wE7O4WOA4//yyR5OUJOrXfjDFK6H1h8=;
        b=OckfxZylvtCJwB5rjOGMbWIJF/gQ1k6fPqTaaD2h9TBqHVXUYRrjqRFloqzZNjDJdM
         4uKrVDcoctTAt5PgwMnmnYUK52YB0AXGRivNxee+bsk3f2/0u3vxS53+1D2jywytoXSK
         VHlDH9iL6nBHhDAwtexLiPXrGeO5FWz+lQkzDzlqkOlZG/ZpsMIcqUUrm26n4m7D8WeF
         tDQ32pntSMYsy0iLQFY7gEFiALIU4R9wstEvGdHr+JvNVauowNVQDif2dQEosFvs1X8G
         sa+tg6gLlBVDvvcfRTEE0QIYJ8Bt9jG8QtOPSUhcmB0TDsHha4Ajag4P5Jtvj10djUuw
         xuvA==
X-Forwarded-Encrypted: i=1; AJvYcCWWgs0t3Ti9W2eLGI+8I+aDP0Jn3TrsSrmxcZuzIroKm3+GL7/fcjYVwhV7tSfCe5E3XYTWofPELA5z/aebyyNb@lists.infradead.org
X-Gm-Message-State: AOJu0YyoWUcOLqSp63lQQjWqjt5lnb5RNF2POiSG46K0EzZI9cRQC7mF
	pfS3cSl1oE3pn92fTs87xsQ4YTJYxx2CiUSP7/EyFyBYgCv/lTPW7KCH
X-Gm-Gg: ASbGncuO7DrzyNXgkS/8gm9FOQlLR+tcT0Y5IODYkHWN6ti+5nOEAb+nVg317psA9ss
	YAGxD2C7ntK+1EjbHJwnFUDSpVPCBEkg51a+TtNFHhX2/KQPy52pDY3+M+ye+x8gFs4yUOs4aa3
	v4qFDonP28/SKsEDvAZDb+2RTS56eYk/6oFIBVfgsJ7rvxKi4hO/jLlOT3TR/EFt6nS619x/4Uh
	+T1oHoTSV0QujK35Q0qNxTMZbTy0PYev0RQfPGBxG/TGiwDWC8RfoNSmwHtiH92wklyq58eJ8wo
	kf0nmrKpXc2kGSOPPm/iJ0iWqaw2xJ7QIPqkRN5cNkq1eAUpWhpY163ElydRPHlpO0mvbfQx6pu
	5lia82hEvNPaAJOTAbhLtNoGHOdG3ABYKxujEuuf60JCS/pmkkf1rdOn3OQsXn8WGELbJ1zunhg
	==
X-Google-Smtp-Source: AGHT+IHM3xVI82jB6xdjQEkijldoJ7njelHhMDYQ3r3ZtWre4CsPi70ME2++am1YX6QlYz5/89FVBg==
X-Received: by 2002:a05:6000:2505:b0:3ee:1279:6e68 with SMTP id ffacd0b85a97d-42672425b82mr11691189f8f.47.1760302746815;
        Sun, 12 Oct 2025 13:59:06 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v5 0/5] PCI: mediatek: add support AN7583 + YAML rework
Date: Sun, 12 Oct 2025 22:56:54 +0200
Message-ID: <20251012205900.5948-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135909_438877_B6256F9C 
X-CRM114-Status: GOOD (  12.08  )
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

This little series convert the PCIe GEN2 Documentation to YAML schema
and adds support for Airoha AN7583 GEN2 PCIe Controller.

Changes v5:
- Drop redudant entry from AN7583 patch
- Fix YAML error for AN7583 patch (sorry)
Changes v4:
- Additional fix/improvement for YAML conversion
- Add review tag
- Fix wording on hifsys patch
- Rework PCI driver to flags and improve PBus logic
Changes v3:
- Rework patch 1 to drop syscon compatible
Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (5):
  ARM: dts: mediatek: drop wrong syscon hifsys compatible for
    MT2701/7623
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: convert bool to single flags entry and bitmap
  PCI: mediatek: add support for Airoha AN7583 SoC

 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 164 +++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ------------
 .../bindings/pci/mediatek-pcie.yaml           | 438 ++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |   2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |   3 +-
 drivers/pci/controller/pcie-mediatek.c        | 120 +++--
 6 files changed, 690 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


