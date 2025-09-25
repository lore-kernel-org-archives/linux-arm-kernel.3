Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D94CCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MTyvmotOb0/PgMOHsXh4gvDuOiENNfX5B0XL/LoNWUk=; b=cC1eyXOiPProLYFv3FN6l7ayIU
	Cwjz1CPC3UqdXM4V/CnGvOh9vPlpbTs4fesH9z/8Ci7aDParqWlT0Y96WmvnCvxQkZV3OG6sz4vIN
	eol9jrj15PGsGPtMwWGdkVlWaoRg/rH43VScydk+mob3gzxt07J6PUKW8P28Ci8QMXs3bpqsjh5/q
	gaGCW/PXewXOxAeCqUBPQX5McKcHw+oaS6wcanAJqYw4slnrC2JZNqEgx1V9tgg5pFLUnERIApQBq
	Z38XCBmHKLQnAEp4HsEXktj4FEkCEiS3mTZgOvgjcYE51/0mr1tSDq7eDpJnDaSHX8Epx+WCRGe9Z
	iqREXBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol3-0000000B4tj-1iwc;
	Thu, 25 Sep 2025 16:23:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol0-0000000B4qn-3uqB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ee155e0c08so781789f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817425; x=1759422225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTyvmotOb0/PgMOHsXh4gvDuOiENNfX5B0XL/LoNWUk=;
        b=HZVgG5ddq9HyWqzw0bSq3WUihWkthVB9m/uaw5IjApFWMSLKBgLOeDO0CY3e+Sh0vh
         U6a59nThuTxmuNBf6hp0Fyx2sKDnmsPQFFD4wcl52a1aaJ7qxP8Mzdo4Ta9uPzeitk2B
         CGkq2cWxtUAME3RQiSZdw4rsnTON4UYaR3BHIO8C5txrsq5fKfrPJiD7ftHTGqI53y3+
         I7ZiWBCXONBcQjlQ1P4DjPOQyTSCdz61vadIvB8S8VkLTnUwxmqibExxFqDjN0W25IuW
         A2M5kjRCUTKlOvKokkIp2yZUk1cg4Hnw6CnIBJlLiivCJMmO8ua0Tcd5qWEG07pAWMLk
         Htqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817425; x=1759422225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTyvmotOb0/PgMOHsXh4gvDuOiENNfX5B0XL/LoNWUk=;
        b=YonRPK2AXlBSitsHOdD4DFc1oB1LvfHr1Xnxa6uYLml43YPSeRjmsrB62V9v8XdfD7
         Y6htQePX8+Fixm2pcVcL9Tk8irbzhRPQkSSqoopSQzRj9v/J9pCkLibz3qoIA8GxMAFd
         Kb8ASmgdoeYVrAD2z80l9UiYosKZHk/gtwcXoPJEYb4Re9hLrJgBBUE9kkTwMkXIcUMj
         2k1Gp4a2vL8TdOPCJGfvjJwsuvvjesvaq3FgbBO3RAUloTlQ/a7aZC6EXVLq4KTBqsTN
         x90COob57bv1HIIGTHB9tq/a68YT6fz4n+gFof93BkKoilVmsbT+uyIkiBh47H07tSJC
         VSMA==
X-Forwarded-Encrypted: i=1; AJvYcCVMu9PXoYjEkCTYct2No8jrZ+xU8KuyeEBEFKwbY1AkjKnJUSoe+aFdac/5M8+Rtakote8CXt+bypIguhBH9evS@lists.infradead.org
X-Gm-Message-State: AOJu0YyIfbvGGaNPlhaGDLxwV7UEfDeJtYbsENZyN6xrV72spWjW5dUb
	ifAHzUWnPZIf5mbYTajsHKPMwC4MLwmSLCF4L03Zmm7Z2sROUG/CXu94
X-Gm-Gg: ASbGncvuguDCLEPfzu8RcfWDhbxSnYm/bR13wx5aO42l+VW8ps1skmI2SojZEzLPLhZ
	fGyAKUYvv4KUi/LTbmF44Wedcu8citMG8B2mlBRw2H+ZMYOF1Le+QcU38qWSKmIJnaqf91Oco2u
	P9O34onTAhXP44j+3rVhEkRUdyGFdBlQMSA4W7U+OlkwGJBPvCoWhEELSJvABF8IJ1ntYiTQr8U
	q5uLqGfsd0B8MWsSdYXIUNGgmhSWN17AdjrJbeMg/iReeVSiC9S8wk51fUy6RQfnPeHududkAiA
	A3oMtzWK4mlf2rgDl4m7eMIirlbEZeMUKEWjRuVmNq/rfF2y32j5vMXq0RXVbHoCHWFfMyCwRiY
	km4IZQ7uITIq3cUO73cUGq2iLM9tL/hDNSb9lrdrOEvyMB1bNPtdVBllKXlMA01HqAlQjKFM=
X-Google-Smtp-Source: AGHT+IG8wt7D2RVybhrtsXF08OvAI7r2C+qCPryu+R0Ya0aCRRAJKGzbWS2JdRSo8S3uobYjXYxcdw==
X-Received: by 2002:a05:6000:655:b0:40f:288e:996f with SMTP id ffacd0b85a97d-40f288e9f05mr2728379f8f.63.1758817425041;
        Thu, 25 Sep 2025 09:23:45 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm3534819f8f.24.2025.09.25.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:23:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH v3 0/4] PCI: mediatek: add support AN7583 + YAML rework
Date: Thu, 25 Sep 2025 18:23:14 +0200
Message-ID: <20250925162332.9794-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092346_983260_31EC0710 
X-CRM114-Status: GOOD (  11.70  )
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

Changes v3:
- Rework patch 1 to drop syscon compatible
Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (4):
  ARM: dts: mediatek: drop wrong syscon hifsys compatible for
    MT2701/7623
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: add support for Airoha AN7583 SoC

 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 173 ++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ----------
 .../bindings/pci/mediatek-pcie.yaml           | 514 ++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |   2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |   3 +-
 drivers/pci/controller/pcie-mediatek.c        |  85 ++-
 6 files changed, 752 insertions(+), 314 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


