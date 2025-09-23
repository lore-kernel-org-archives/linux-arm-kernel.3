Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1859CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 20:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=; b=UXXa4v8cFECukBqzZIpbUFp9Al
	YLPmUZfOLs03jJoikb/PFCPKStsL8XJQBKklsU5WOxY7lzKK3wkiZIqtSNW4qlOvU3//wdnQbMrle
	ZW5geQrVuexv7cBjls7h+qzjzdC5HtgGbIp27xEQ+4qz51Z2OVkqsUpp4YpfpHdwNpe6B2yZ+qida
	e+hj7CFHdlRc51R3PKffgujEatFPfvzWbwE9iyMp/YYs3Hk9D16qYjgZ8s3upvXxCJr4abTLs95ii
	bvBXbiheBDr7U6UijmeSWbVi+6TQ6PwlFokV/BBNQuz/KwXtLhc98TEOfsviZyG7ZcTR30K6ytMN4
	AIcAgzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nh-0000000Ejr5-0mTw;
	Tue, 23 Sep 2025 20:12:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nd-0000000EjpO-1svI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 20:12:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4425989f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658372; x=1759263172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=;
        b=YLbBfrrMn9bGOdvw9rhFRrfJF58Sp3ilbgdfZqoRf/72VyudRTG/dlmygLLxq5IsVw
         lGZ00MJqXLu5DOOnCS8zlyAYHaX6Cuax4jGtYv56PgLAMnqEXdKaHsB6pQsusN3A7enn
         3XG3rjNrrTgg1aE7PnWIBWevNCVW4cyjRx1X9Jza1zg+24kJm5YS7sNnqjCoZ+s2OOQF
         zE+UBEuQy092OYhhi9gLcLO4EyWax8SMes4vM+xUFgjBuTEfAPUP/AToSyJF5ufQbUR9
         0l+njIEcqFVlR2v7J3RyYQQ/kE/TCWA+TbXMDgupsNCvQbfdrBNiyXYo57SgOTGCg19j
         Th5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658372; x=1759263172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=;
        b=ATfKGf/HvzErLTB+oDolvtZ+0MhE2vyWBFDwHvrE1RDMtzG+haYO/cRZqmV3KtCNOh
         a79NfXD+tJh8Vs0WcItQGTaPnoE9JOBXM+BnDWK3THz8CdcdqC+KF/LgWSA4yYq5VHUt
         QxcmETx0Om4DZoodl5ifkorOSXPd/o+zELTFM2LJHWImG0TDwqhKuRXxPrStdRzyb0T2
         kiLjQDJ6sSNdVWwH0k7HqPEAcvBTz3eGYehJqTAP9Mic/Jd0nnIf9hoA/+xuaAeJKs7I
         J6yzjoKP1JtIZQuVdcFhUIZd360bsh5kBxyvdcJVB0nPz785kW9eRZ/QHbJClLP6n56u
         /vLA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7FOf39BrQ6uuh/IJM6M9u/KSJe9ks5J08nNgWlUnH29GIdcqLFID1RoA7lUJUyk1xtBRE2a6UGn4dxOyjDgR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf7hu6Jjh7woEbOV5itoCClBrjdpEsq21L2uGxHOHs4QymKMSL
	YMDxARoeFsBu71VZQ6XtV/CdAR9xQhFL51PNuQlkzlmleor3fyZB4PSt
X-Gm-Gg: ASbGncuAcJViDSQ7Y1dkK689tMjgKSQ5T1grniQybcM27BxPMnLTnjixUT3FdSIlz/x
	dRge+eOD20/oxsS0vmvRGHA9tW+VAup71GREOhTygobeG5AOPasb55Xns2k0xfNjVvNjOsu444C
	99inLWuVF9oiJogdRS3ry7joA6MpJiIoYIIOnDe2YB5PekM6R8N1tBoaN8zKm49VPp72ia/3m8P
	WXrW1IKyee+EJYCK9VhUr6L1hRfT5SZdqYXybT8ve/C62hvmw0wTOrHKmsbLgbdHQvdfp5p7J/6
	MwA2T2eAYOnsoSoJgk3eOq3i6bPALzUqOESHFGlXOXuOeH3IhcPDkLsEcLHz9vz8eAiOhQRbMI6
	OTBJavntv/RIyzSa7aj4ubzQnRCV2OwD7pgGBGZoSx/MGaPRokxii9k4vDueja5TBCwbaH7E=
X-Google-Smtp-Source: AGHT+IF016uYkkKzgv+AucFeGyavBjbQS4X5yFh1cvwLL0BVsVqxRwdjObESQ21BrceSWNy2CAZxPg==
X-Received: by 2002:a05:6000:21c8:b0:3fd:bf1d:15ac with SMTP id ffacd0b85a97d-405c6d11630mr2007870f8f.20.1758658371435;
        Tue, 23 Sep 2025 13:12:51 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 0/4] PCI: mediatek: add support AN7583 + YAML rework
Date: Tue, 23 Sep 2025 22:12:28 +0200
Message-ID: <20250923201244.952-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_131253_502211_3935202F 
X-CRM114-Status: GOOD (  11.73  )
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

Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (4):
  dt-bindings: clock: mediatek: Fix wrong compatible list for hifsys
    YAML
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: add support for Airoha AN7583 SoC

 .../clock/mediatek,mt2701-hifsys.yaml         |   8 +-
 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 173 ++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ----------
 .../bindings/pci/mediatek-pcie.yaml           | 514 ++++++++++++++++++
 drivers/pci/controller/pcie-mediatek.c        |  85 ++-
 5 files changed, 755 insertions(+), 314 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


