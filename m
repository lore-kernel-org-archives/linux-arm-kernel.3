Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C39EC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=; b=U/4uqxk64ZWBsO37sBzKdLpF4w
	w/vB7f28jRJ5arXTwmmUCsLeTOcQM9HEUvRw+8e4MPtlKyauJX/txfaGABV/efwfdIIC2S+HzM4XP
	UGTFaq8xEAnrgeyRpLLSqOpwq+Y8XUkb69lUTPxEzD0Qatup7UZLBXjhe06Drj8UDmkwyQNfhK3hI
	Kw7Ti9U54Y5gQr8ybs2cNlpXDo+LP/FFlGOh0YLykMbTuanGFHBkQEqiNWrDCHg/+fQqsAK419Hoq
	92PP/O0Fobo6BBEQb2xqF65ub/CfPdEksdFqm6XyUGveYMXVtA6IaUT6+D4cx1iWYBnK9kY6TV5ce
	1GqCk2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Lo-00000006GPI-1Lkb;
	Thu, 06 Aug 2026 16:53:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Ll-00000006GNm-31DK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 16:53:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f84023916so2207163f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 09:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786035224; x=1786640024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=;
        b=UBaM78OUBvEdnR8sL8bdtZf8p0U9MdOwoiCdhqm5wuYQ52UU+AHHjkW9OLeXiClSW0
         xw2VkDPHyC/dFYpk7yHPda1f6CWFAoGn2+B9G8/wlpzInt+bsua6eYuNFAzMynHjia08
         z5pAoC5PHQ1bJX2J852Xra3neAk0pZc6ztG4w8Kfk/LLYEtRNY90QRkiYWPvGvxQ3lV1
         pKTEydP/VzTJFKFalyLkY+Q1r+qI9JDCb8lMj/h0J3k/JfKK0e7X4Czyhb+V03Sk7OLA
         MzkyrrAyitXcIo2yL2Y8YkGgooUzAwJvpKJQfn3ZHtxU3ITR1gPrQaJIPNphJud5/Gpd
         l7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035224; x=1786640024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+KE+qyKBRfV7lzyByYvfu7OS66sfgFGM8oKCG0fWclA=;
        b=mQLQk5Nupj/7yjto4XwP+Uq9Z1kRL9bcJ3yDIcATwWYhGQUomPwYhvlH/Enl4DKp8M
         kBL6XgD8Yfgi9WoG/XI4TiWYDdcxA+56LEmrTWgsevfT/i2LxLiQgrejzAJklrP493Tp
         tA55wmbjFVgVDjkdhBJQcJbKhLdyud4g+we5tkhHErr7LjC+1I0fuKzsTalCbzwJrXUn
         2wDWPG8jKTLeNu2zJA54vDfMOUi3lDoeLle77YpiEt/rlSsZGXfqgRjURDlAMQ05hS4o
         fGCegig8U9NoMDqeNBpqyIKE2NBfznajjo2w5p9nuyTLWzt/9UuhvdaQ6jOZK2Ri3e2k
         PERA==
X-Forwarded-Encrypted: i=1; AHgh+RonNc9dZDSKUadbTR6W5JFnEuSmk7MI5ZVZ0+ArpsPjUGO5q/I2I8mazVkTrQ0Z/YcHD+YMNODwzBgZhv+5YORW@lists.infradead.org
X-Gm-Message-State: AOJu0YxsvRBD4gsdb1uS0fQs0qR0pMS4qvmoKBkstlkDxK9PYSy3fZY9
	qJNTZ65HpQMGsTFJnfh7bd4d8uraa28KuYvWGnqJCHpOpFq7BgWNjp9g
X-Gm-Gg: AR+sD11PKomTtNGCq84Pg5GjbnfWEJRyCo2aJr5AFYl1fhAwFLhczhlepizenjYs3Jv
	cUmtxGNTvazCmTBU5sFm/m5hNQn6cwEEKJYiccQ+UPVq8oJp1JmC01zhfICzFNajswjL4wm4ssC
	sixPWueSiDY6JaFidU6W9F3tEw5GOaXWN7KC7MblCTQ2f3HpbhkE+Qr0ySI7P/acDJKd6xSZjNN
	gERCszy2PnUthWFWe9wohIFwfO/OCMJ492Tgh1DH9RtKSCxsnRcEqGYRcbD3ifLTuGDGdcx3kXP
	lC/dop7U1I+vHHws0dF20BVJte7Sq2rME9L5Q8EKF/eaMPXmzRwZnt6C3BrQdMOqf5B2YTphCxg
	kQSzlXxrml8TvLiQ6QsYkd0KaspDrA7jF20LAzDITmFY7DZbqJz6wOImnz1wZwvGXoFmxmkroC0
	oSpwzPwxSpkhw0WG4uLUdISZEV42Jmb+fnfZUE/3EIk98uyaQuQxUb3S4Cn1mYySihwzGdcEakV
	gpL3xA1qOmYT5Zcdi6mxTe/cv4tW+nK5evwKh1G9rF1FDo9Bb6tt4b0CgLrDg1z
X-Received: by 2002:a05:6000:2988:20b0:47f:eb80:ff42 with SMTP id ffacd0b85a97d-47fec4e2975mr23732729f8f.4.1786035223457;
        Thu, 06 Aug 2026 09:53:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-42-255-151.retail.telecomitalia.it. [79.42.255.151])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47ff79a7f07sm8070586f8f.8.2026.08.06.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:53:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Thu,  6 Aug 2026 18:53:30 +0200
Message-ID: <20260806165334.7328-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_095345_765566_385A6BC2 
X-CRM114-Status: GOOD (  15.58  )
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

Changes v5:
- Address formal comments from Bjorn
- Drop clk patch (handled in separate series)
- Add reference to clk changes
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

Christian Marangi (2):
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
 3 files changed, 338 insertions(+), 89 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


