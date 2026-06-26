Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83847CDE012
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=; b=sCrLv3ctEwlkgE22tXX5M67uGT
	UC/ElBGwvO6ziuvtNee+qx/FdiH+f1ymThs3DaDRZueVXc1I6xRv8lwEoG2hWIGGeeiDQZ39GAaGF
	Wjd1o3UhyQroDtzs5AeIz4ySGUfh6Fjhc+QV9a9i2SneWv9HJFEn9cdrfFE1D8DBwHCvdgpYpdLbR
	GhJ5tWREF3N1aRO0Rfz3RJfKbFWtAdD8qJtXMgARvGnqnJ+dJEQXP9yfRwZGxPz5dZA633Yz+Ot46
	aNr+5FAfO/Szjnl/4AwT9FWtGV5yNhr4JtwWgppJ+rwCxC77EkUaQOu0E+1E215iDyB3qYzdVvxqx
	AqzZM7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2jv-0000000AxgI-3AZZ;
	Fri, 26 Jun 2026 09:20:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2js-0000000AxeK-1edK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:20:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4629051c946so452323f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465642; x=1783070442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=Ht07P0fm2OldG91ho1r1Fa55hG+N8zO1HiASIf2oCNH8qg6wyAJt/vyAI+mnq8jwiE
         y7v+IEH6ce2GPdidSSUSpsURp0RtYc9PKCgRvs8Mv1pFtr0zYrTRmdxEopnsOt1XTIU4
         gEC93X30ZdgKF5EEcxh6Le6lJqOZDdmEXSLXHxdn/v1LuM1T+J7Y8BAvSJyCXWG8SWIz
         X4Vta5evrI65tR+gWabevs1z0aK9Hescn6s1btaY+k7FMXN1mYZKrQMRcKLCmZskJXi+
         VLJMyFvOb+ZIoYUgPF7nKGJAtFu/fTfGvWZDJwoxpyvFJDOyq/dej57ZV9Fi8Jkwmyk6
         PJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465642; x=1783070442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7RIq6wHh9BtCzFgGyY7sK62eHn+d9xSU82SzTr05Co=;
        b=ZU7ZdoOAw6qJli+PpAyeDXsvRPuTKdjCzA+3V/Nx8RukidkOb+TpyTJuR0bpc29J4H
         p46VDKhLe7k81nTM/g+W3QWgcgQX3G9HhCZbJN2bCf7j538IqMn/5Q/qwVCFofRwEINt
         JdFIFSloDJ4iD+ua0kO7/aSLzhsy6eJ4Y5BcLCBpzLkuLOZxT0ZchnDurVIjJzgFJkH+
         vqCx94SF6qQqVqXif+5LkbdM8SFP2MHed3yOwjnqTTj535hyJkCTeqzPh2+ZmPXD/p9r
         eWlsgdvH+GU5/uRZEwMKcZHifOXHvGgo4I4O8xP/rgG3GvbGf5FjtpDnALOtAPNEafgv
         YJGA==
X-Forwarded-Encrypted: i=1; AHgh+RqKc0K7ihW6o7G2/UbOZamiPgCU58ZNhke7HKi+i2J256fPEiMb0SWrNb+i6fe7xquz3CFJ2ZOX9QK+C5Bmg8VL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5sfL8lvQ8M82cv1D9KtjbsJYORkGkH3meJ6498oX0Gv0wA/Hz
	VMsTHAXiWINr+BN7KLxj2CoaM0geRZLcCWu2BvM24O+gAzrG1BNIoifB
X-Gm-Gg: AfdE7cm7/s/pWD3FhPMBdTU3oA5lGew/IsHuISL2eN0NPoDkmRsg4uHCEL1D8fWwH4x
	kOEwz26x7fesWiWCU3DM0gjVmxPagOWLOL5JwytNklOhvASo4jslYjXnFDBs86FgTItZSrqE5UG
	4AaokK3hRcs1lXa2XngsLdLxXWNyrgtCpzAXcgn0hSs66qTQ6Fkt2LL+3IMlBwvGNUuSiqweU4t
	ArRvv2jAyTSAXZIC8+zSlVlydstPZRIv0bR1RRA+DOsdQISG5dCq31IjMNw2fgwqzQmET3KitXo
	8QZbXaKM3AC08SHApvtSbVabkrDfzY96jkAGPeU3v58vkHm+V/1qE9f56V6IMge/lrTj57YOJgM
	FycW6qoqysY/IE7jxvCQc9km0BcYjRCmFG2uY6/SMCsRHLyPavamQk8vU4cOUMg8AzpGbi1u0k4
	ewcdfMqyMCdu5Zhd2VZCjWjP7oe1eSPtM6yhJKaJn6MtpeQi4M3b97NIUsNXaOarCsN/o8qHYtI
	FdOd1WFLnzu
X-Received: by 2002:a05:6000:18a9:b0:461:a15a:4160 with SMTP id ffacd0b85a97d-46da8c5fcb6mr10187397f8f.13.1782465642257;
        Fri, 26 Jun 2026 02:20:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:41 -0700 (PDT)
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
Subject: [PATCH v2 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Fri, 26 Jun 2026 11:20:24 +0200
Message-ID: <20260626092029.3525264-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022044_455324_0361A72B 
X-CRM114-Status: GOOD (  15.39  )
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

 .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 101 +++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 370 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


