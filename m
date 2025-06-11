Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E060C71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v5qXDIyCABFhOF+Eefpw/XZ56KaBK7MmBqHZIAP9LI0=; b=Tsap5pELJgPctN/OIb4XjtXPqk
	/lQR/1tNjgK+GDnK0XRYtcorB3PFTE+pt7m3xyg0ibfxlwOtynTeMqdlksoBtz5RpPfgJJwKrqDbi
	E56LJ0eXHq5+BI9vi+xMvne6U+d4wVufCrM7DNr3tLv18Ra1ufBtMvzYiRHAx5Np9cmg09hr6c5re
	9vf1MBcPvJSEezsAgpA3D4PtjcHO3yOMWsawccYBh+cUqKt5NlxUyH0yrb9Xohpko3VuejUJ9L9Lv
	rXX3QKVB2YAd5HmwiPQJWFswrHqb6KcOrcFKLyGm/CasEdFyp4EBalP7SZQ7Ngjniuat5q6PgDYA9
	9yNid2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNml-0000000AU9s-11Sw;
	Wed, 11 Jun 2025 15:54:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ3h-00000009fjw-0H3j;
	Wed, 11 Jun 2025 10:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63BD5629C0;
	Wed, 11 Jun 2025 10:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D312BC4CEEE;
	Wed, 11 Jun 2025 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749639112;
	bh=z0f/Wl+RIL7QWDaLPnNb/sYLDEt+cxVqTNutC/oQKZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=rNmCopHTHN4je/LVKOBaApYhwDFxkotPQAy76zchHZCEZ2c/Prph0G1CfR7hCkpoZ
	 lvnXKfkUZfarXm2zOY6F3DXBge++Ih5a4uHUr6pYySjdmDMYE0VXBOIQbKutFgbK+5
	 t4LemLolrVwRPQR+Ery6bhgFDjbz/RMBua/9JpQBIyLQw1gsuJR2cGlYHLJ9gXWocl
	 TDKFmDTmXtsmSS5PyxkwrRP2Ok9LC+gE8znzFMVFRvTDxBfIiYuzjUe37T9gBnRBla
	 d4u/+RGOqe9TfxmGy2HrXO2QPWQ5szxGbGuWFO466TPp6IteWh/ffnWXrIAszz85RB
	 DSR5602ZZsKYw==
From: Niklas Cassel <cassel@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/4] PCI: dwc: Do not enumerate bus before endpoint devices are ready
Date: Wed, 11 Jun 2025 12:51:41 +0200
Message-ID: <20250611105140.1639031-6-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=cassel@kernel.org; h=from:subject; bh=z0f/Wl+RIL7QWDaLPnNb/sYLDEt+cxVqTNutC/oQKZ8=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDI84/d8v9pfETT/yp57mUp7fxjsW6J4bssB9hdKjzTWR 9jxGLdP6ChlYRDjYpAVU2Tx/eGyv7jbfcpxxTs2MHNYmUCGMHBxCsBEhOUYGabv4/c+wnz8l8L/ HbM1DvyP52Sv0Lvwz/e0fP//hxNYNNkZGW5ulbV69i1ps5B1cLWNSOK+P3ySC1hFZ3xncDWIe3/ WmhkA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

Hello all,

The DWC PCIe controller driver currently does not follow the PCIe
specification with regards to the delays after link training, before
sending out configuration requests. This series fixes this.

At the same time, PATCH 1/4 addresses a regression where a Plextor
NVMe drive fails to be configured correctly. With this series, the
Plextor NVMe drive works once again.


Kind regards,
Niklas


Niklas Cassel (4):
  PCI: dw-rockchip: Do not enumerate bus before endpoint devices are
    ready
  PCI: qcom: Do not enumerate bus before endpoint devices are ready
  PCI: dwc: Ensure that dw_pcie_wait_for_link() waits 100 ms after link
    up
  PCI: dwc: Reduce LINK_WAIT_SLEEP_MS

 drivers/pci/controller/dwc/pcie-designware.c  | 13 ++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  | 11 ++++++++---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  7 +++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |  7 +++++++
 4 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.49.0


