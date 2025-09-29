Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A17CCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRFGCABCLXwEyWrlsO0Qq+AzjRnRQjbLGashvrpUfXo=; b=deumGKZQoiKb05Ss0VAJlZa2FN
	+Vtj8W2jkbV06GrM9yX4BW2doJOI+k82qlPWiUSlHHNoE8DfkBf/eO4wJ7NYf0/e/J7nnxy2u5p0+
	U7YpUoQka7IVcA5c1VqHZ1qGavuZkvGv4L4mUHebXJ0ZlXLfdtuTdsWqsnL3f8xCaJg+wSfi151B8
	1xDb4e1LhudOc6U4hUmONUquq70BD5+FjpJ5n3GWtUfXa1iXNTAt+C+S2KkjHhyt5sdulu6RbmNUr
	zf1gCS/XYVdDd4RnSsEw1DMBt6ZzrZSbX7OGK2rghTM7Xi+bZlMi1N5eGekR1U8yMtqSDva9UAwSk
	h27D/K1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCx-00000002MJl-0Qga;
	Mon, 29 Sep 2025 11:38:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCu-00000002MII-2umC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:38:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso29233755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759145894; x=1759750694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRFGCABCLXwEyWrlsO0Qq+AzjRnRQjbLGashvrpUfXo=;
        b=R+qLQxw09ofZqWz4EctseoW0UqrQlBB7k4ez7dLrF5csjR8HDA14afva1tZC9OjvTy
         tMhulU7kAlJPOM/AC5imiGf3yiRyPEtcu8G9xenALf6umKvgybH2PeTVqkuqFwRMFZmB
         WWTfBDTzYAqhlxmR9SYoRJ+fQWeuiqgshX4JOD4fLIbIluZ81NqIVcbMfV8sAlyXb6jq
         d/7y+vh5iqYRj/Bf8oODsS/eUK800OvMciGKe3nTmyxv4LUzkdyxXnKYQwNh7qk/n8zh
         7A9cvKct/EbmF7TUmD/fkxxwhXQntLEQFfvzWDCjhmlhdyiHt2PbhMO7/bu1QE7WYT7s
         uHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145894; x=1759750694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRFGCABCLXwEyWrlsO0Qq+AzjRnRQjbLGashvrpUfXo=;
        b=HkCpWKetFqPr0DkjUyfsEiTRtLgI7S18UwdYXjV27hLm/LE3kx1PxSkybfLfq/cX00
         8Z707c+eiuFg7/IahpbOirHl6WVbsERWp9hhEmKC0zi0uX2GAars++VyuE8ht+CLOHE/
         0N5hfPtGn20x5Y2EoMwXIoJRKkDlxmCQwYigwJAijuXuz+YIAbG5uf7yywm9jx/Np9mc
         MXTOZT5XOIciZGSNLtgT9pqBA5hp5yrjrp2BSTE7tPhlySMEbe78jfAj9GjDdlnE89v/
         BOUscMe+/gXFlnLnEiyx2UriBGuXUzvtKFdSee50ewqKn6w2do2khoC3S+p7k+yAHKdH
         VRYw==
X-Forwarded-Encrypted: i=1; AJvYcCWdHIyehOcAH3XM+oioeyTa7zPJG2RChAYPBoAUZ2UF85sFjQ9bSt7tUsppWxcmW1EUadX9aZUTvC/GsS2WZ9zN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh1z2AZ9qLyaBwuU3t+C1sSdK3nQL/KPlDV6xgJk9NvF+Nackl
	aSEaRRKetZyHZs9FxxdvrThZCP8lxvdEUHbiyPWpQJAFWeVidye1kEYr
X-Gm-Gg: ASbGncsPgmLhnb2UZNs57vizPcJOD//PA7+VlVvgdeXrDh3l2B4qBtbpYtHZZCqH6bp
	+tvmAdNw2+dBI4d1joVkC0IuW7odZzQWFxb34OBSNfu9sSiWJjmZ2HDba5sls2nyPVPcTurL99+
	7GHRmnkLoL/I/C4vTzCbeniEwzDQChqvc5gc7gkf3R+SNU7S6zubTT3cTWT0CinJ0FgOeBvm827
	YYdEfZ17jz85jagXI88YnVeVW6jHDh0aTrAjdvPdTdKa80+pdnJNMmfYUi44MveFLQsy/5OXMDX
	EJ+9KLuv57ymxNGVCD4wpU1q+xxtOdkWm/kUT5jzeDm+nzlqnPwuiBnd+bhcBgGsY0KOmdsXQEF
	nuIw0msfFWs3ItNV2sqsZtdZxbFzqQ/O8BJN3vqi55Kb9rOIysslEXhIWFq9fMV4M10dxDoegVy
	iWwggnoCQcIf1YAZ+G
X-Google-Smtp-Source: AGHT+IGWicOdrTmQIVdHUSxqrzMHPdo3nASeyojQE1e0iNlPBEVxWIA083+LVJHlm20d4gbGv51hSg==
X-Received: by 2002:a05:600c:8289:b0:46e:4a2b:d351 with SMTP id 5b1f17b1804b1-46e4a2bd52amr57340655e9.28.1759145894386;
        Mon, 29 Sep 2025 04:38:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f53596sm9502465e9.7.2025.09.29.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:38:13 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/5] PCI: mediatek: add support AN7583 + YAML rework
Date: Mon, 29 Sep 2025 13:37:59 +0200
Message-ID: <20250929113806.2484-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043816_742608_0453256F 
X-CRM114-Status: GOOD (  12.07  )
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
 .../bindings/pci/mediatek-pcie.yaml           | 428 ++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |   2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |   3 +-
 drivers/pci/controller/pcie-mediatek.c        | 120 +++--
 6 files changed, 680 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


