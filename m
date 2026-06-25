Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CC6CDE013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=; b=bKAJWgeAV8S2IYFRRFFtoviAxB
	tq/i6/mdBvx54k1wuNZn64nJKnUulnYqTQUESympM11fEXyvIJVEEkkOQ6GlSW1pJBISyxKheOe+T
	D3XOY2reRgNszl63fSztDdW+RlwMBTMQj7qGuZMY8AArUlGmBXYiNMZDTqyhGRxqIt6AJu9/IozD1
	CaeZN/BX6KJXefBl7wvTrpFhvoXGG0zGL4oThkrj7A0h3yDvez+2Z7GFadovOfLNSyZKVLSDeqFQs
	ffMs+fzg0q5bS1SVjzZ5mPE+Ys0PlvCMDPcUbQvJEGgNQlu4IoBmLfn4b4EjIuGMpca8pGlKdYH9l
	Rd1jZTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5C-00000009tdj-04UQ;
	Thu, 25 Jun 2026 21:58:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs59-00000009tcG-22kc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so2483235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 14:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424677; x=1783029477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=g15WMTvmk+wBHH5yOqKthlUVbmJpOyaSK0mW4joJUCOMra4uPNXVSszsaaZIfmqC5/
         h1zk7qjrTPibzRtsFFU11uRPK1WB6h9i0XYGRm4fnuFIttDJMA/dNKliJC4qk+B8KV9Y
         eCdB0SHHT/y4Q74Dm9Aj8Kuy6y5PX0Y+Cs2ZaruLNpi6zfqXZHhaZ0+QTWQ7ribwkYJf
         mueiLleyCzTkk6SJU4eCSmKQTAs8dvZuSijykA//S3uhOYPZ71x7a6aF9cV2Iwtp+0G9
         9g3N++0V2pVgaOhg/CnI4uXQTfxy5KoDQZnzc9KQMN/xV5lPdVrC4kkSRS6zqUqYhk63
         vl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424677; x=1783029477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GDPKha/I8hlDx0JY3/FoA06iUy7EbgInPO5kMOUnzM=;
        b=XQlCUyzkw7/a60sJrsDJTJEIiD8H2GZLJ8FR2i/zG5rWQ/rSyNGRHNROI9JIFA8bNj
         /Hh0mS5VoguFcnTOhX4RTjkHNWlLN6YMP/5f2eJZjNWaegvygO90Rtz29jufj0Itdcnu
         Gq7iYFe9+zWAKJKNXPV349lKC51htkiqSzoHiBFAZEzC8FkvKpTmOx4HYB0y/zNYpwsL
         LbhtCwmbv2rnD92lOKcDJf6K3/C4DtYoEjBzMzOz1GiuuhjrPAT5ORU11ajehkM658HL
         9eTgMmLCSp3/IY2srZhVL7QobgnxwKjD652SWBaza9ot8NKiLsNl0oi5urKCECMIsrEf
         6b9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qjWXE25wRw8QgY9QfNJ66vN6cXytCFKvSOXZYUfzX2Lr+THiCdmIG2bp4cHSEkomxlQA/T5js4qVm8mBeruos@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wzT3cuyLoKEpfsCRrhbcW/wd6CDHqcAQQAbdEAYVbNZXd6Yi
	4WPL5dTlH2E5/LH9eaQO/tl0pFmbgXYerMmByRqotWlyQHt/0Z2Wn5YB
X-Gm-Gg: AfdE7cmzEqkMCFEUXuQTv7egUHcst04wtiNjpT8W677nAyUrB19KiVslqR8SOyviBEl
	LUJPC9DO4yOVOL0EbndaWVyO45KqOv4KsOV1gtMLzTaFqTDQoBN1tOPGrKCRJfjYRUaEuvvEC6x
	Zc8HK3zmZ+hdgj/nmHK4pu4EHB7sgX4H+iavc5HnScIZhpc8f+oMtXCMjNWU0foyK8OheYyk2yH
	3jVZd9DZ1R3ZUJkgAYj/I/O0Vx3eIRMKVOl3vQowc4n1HqpoHwjBi8syRFPmli4vl871OVygqYQ
	hbRAnZRbQGJL+l3B5eKEF222B2saZNb/8ECgFztJpASq8XPHv1q/IdaYjY7swAskF5CulqXmY4D
	W9MVcKRPd6ZQioRe01KzL11vf7QG6uGuYib0AvJxZbuf/rMBN0FFiEa34KJ2voFVaJSwmucDVl3
	GzSbgg44fppBVcX4eqeXuYykbrN5k9veWqK1YGYHIOCygdAoliRCzPyfqh4V0tSrf8SlD0Bokxo
	JyZHe4rJZKF
X-Received: by 2002:a05:600c:4353:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-49266893383mr39799415e9.26.1782424676723;
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Thu, 25 Jun 2026 23:57:33 +0200
Message-ID: <20260625215741.3253212-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145759_537348_199158D2 
X-CRM114-Status: GOOD (  15.56  )
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

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  27 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   |  98 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 358 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


