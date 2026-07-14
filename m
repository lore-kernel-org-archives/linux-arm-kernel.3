Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1288C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jU6f3XE2G/RBii05RKcLkrGv0zTxeh52OJEdZ0UzbF4=; b=Yl8RipHg7znMa4AqfpSeMUBnah
	ms5Ksmflya2tRBNKZF6E3ooexqfehiMqs6cZWPe4dztb1N6CtUD1f33UEwadBQla99rBiDz4hgPA6
	7T3M1yi8RGu/hEkd6ieQtAnYxLxNqPvHSSLx+oqLjSs+ZABLReTCzdD6068lIb67tCdhv+ymWyDQA
	UJihqR0+NfaoxYZuAOmcnTPsEBNprwdhTKzjDwUrQ/1OVvAbmtpLchBPcSxmeR8UKg4BCnZfdMjYH
	TbeuBDyLVljcz1atmtW3l/CCe6Wigfx95DMn1gOuqz8KtbhhloV8lpE/kVnAtSClFQE753z+tRSf5
	8ETkXtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmx-0000000Bouw-1ynM;
	Tue, 14 Jul 2026 11:59:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbms-0000000Boqr-0hod
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:59:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso30775675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030336; x=1784635136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU6f3XE2G/RBii05RKcLkrGv0zTxeh52OJEdZ0UzbF4=;
        b=DUWqqF42NpOyanCF/1b1UTB1W2EqOdIp3UCDap/G9qJcfHa/acmCNyjw/6O2oVvUNx
         T/+fsG2K7QqA+6xjWGRXQxLB/SfAZmmW+8R5t8F4TTwVrHzX2GTq5lpiR9Fagsmo7gXx
         lhNvdtGjZhaoQ4pEm+lWBMzPFK0I+EvL2vW2337tEKnFSWIxRdCiyoVQOXfoIjr92pQY
         9gMryof5ycQOqJ6KD0+GSos9UYP4ZQJXknB5WzBZEC7E2bp37Sy+opyiO6PEtgzcG99u
         2F3N1zyH1KKuN8ZVHvMqBAx412WMN85bUAxyT6C8BgdjLDXiCmb7mqVNBP+R3ZminwNy
         9U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030336; x=1784635136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jU6f3XE2G/RBii05RKcLkrGv0zTxeh52OJEdZ0UzbF4=;
        b=KITPh6UO9os8NsvATmZqi2amGkwVCOtS9k/bE6EfxTA+W1vlRZY7+KNdQ/sDXUFaZp
         PN3+ciDgV1X7qOPuFb7LeebJYd8ptyfxa55J4LA7obsUXbXq8DyldMxz9MISd+w7OupZ
         4b45abCeC2Xn+o8Dxz9udi0xQoFt77VVnHjyPE5vOfjXIk5RIvXG9tEhcF+ak8Zcp4/e
         hbd2Yk58vUtGjNnoFKtLULYgjprK9m38SmWSDkJkCyOIKBRQTZboWrl4oo/gSmALGScx
         GzGDK+N/vOvRa3V2JkMt5WHFUHkmyxmLIh+BlBoMbddZpAMCICUxwI8elsz7FtBJmxLi
         /U1w==
X-Forwarded-Encrypted: i=1; AHgh+RpZ6igD2tVYyeVdU84QMGBgGqDluEuqxgcgBpfmV3jCiXvOWtpCq83VC1eQcbvs2CmWVO8x9TDkCnsOxhVP51LK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3eI4sJb5kR2kkvf3dPr5rn1+FwyJTTcebD3fHhG2WPoJ1nlzM
	YiAng1z9lWupwipBYGFMYoLh654hZQ7KWpB5X/hDhtC6etkbvJ147Uga
X-Gm-Gg: AfdE7ck2mqdnQV0H3IiSArhETa69im+hjLNrH4y6NQHz+5kFq3vHhpuz7/fGMX70cwP
	cqNMGnMLLZ1yWiejwd5H9aiPXJ7z5vkwFKFeGG7oOsM33liVdrWnp2bTJbQ5fmzTxjy0ZDPgvlr
	jdW1MyFkWpPW5hce+Kl/ezdbEgv3VBttEWz0Lyf1bCqUVpjE9bIVMMD/7xrOaJrY1Ixod5KXCwq
	vW41rJSGL/PaQnF6JL79bmTZksK4h3Djm+QhnYXLREViEDZMtFdW4wQ1AM3YDt/o2MAoszFXtky
	YqzPHnwCBad0Ltx+r9CmX4Vf4t8U/FrntAIz7gs4fXWNbe6YhcclV6ImZQSFxD5VUUKOfp/TfFp
	KlbaT61pCqT4iTtSeEB7oLFzRSyqbUBsjXhPT4nZmR2SL8j2TrU0wt5T4mgfgWzFMnh8vzFISe1
	hipo03baBmE/uP6h3tx267VS3OTYronOpa4QD56YrxV4xHvfSFQG51s4b8bWkeC6yHnFkcwKSnk
	9OQfjyT
X-Received: by 2002:a05:600c:8705:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-49518312cd6mr37467935e9.32.1784030335841;
        Tue, 14 Jul 2026 04:58:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Tue, 14 Jul 2026 13:58:42 +0200
Message-ID: <20260714115848.8537-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045858_247185_6ECD2BC2 
X-CRM114-Status: GOOD (  16.82  )
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

This small series introduce support for 2-lanes mode for Airoha AN7581
SoC. This is needed for correctly functionality of Eagle WiFi Card
normally attached to this SoC that require a 2-line PCIe card to
correctly work (and give the proper performance)

The first 2 patch address a limitation of the PCIe implementation
where the PERSTOUT reset were indirectly asserted and deasserted
all at the same time (for all the 3 PCIe card) with PCIe
enable and disable.
The 2 patch address this and introduce correct reset to control
reset line for the relevant PCIe line.

The last 2 patch add additional logic and support to assert
and deassert the PERSTOUT and also apply the required configuration
for 2-lanes mode.

2-lanes mode is implemented in DT by adding the required property
and by defining the "num-lanes" to 2.

Changes v4:
- Improve DT split patch (drop unneeded property)
- Handle power_down PERSTOUT
Changes v3:
- Add Ack from Krzysztof
- Improve commit description of PCIe patch
- Use pcie->num_lanes instead of possible uninit variable num_lanes
Changes v2:
- Address typo regs -> reg in Documentation
- Address typo lan -> lane in Documentation
- Apply a suggested fix from Airoha for PCIe MUX configuration
  before PHY init
- Parse secondary reg in probe
- Add missing reset_status handling for inverted bits
- Move SCU to local handling in power_up
- Add check for max num-lanes for EN7581

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 370 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


