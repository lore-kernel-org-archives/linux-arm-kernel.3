Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FEBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzH8cIjmzkaTbzxcez6NOL9lvuXAy29AjJiZHK2/mzw=; b=j9XLk1HB+69C3++O1iGMoNRh87
	kl16h74GZIGpTMxsTK38Pa7FOb3364/wc3z6LYwJbj49826yt+Qk5gdpMc2lPyB0haMSTybwbJXpO
	wSzbgk/ZTMNoYahXg6ttNRPkaIzs8kmo61VOrW6A4ajSeis7GuGC5/IFLPo6PeeOJw+LQ5GQgHoY9
	sZV56BH7M/VrTeUhIg6yKit2ngmkP62EaUKXy0sl+13s4oWElbZKMnaFszjDF6cQWwF9v5ptcQJ3f
	RMhRxfy+qIYmfNZBs3Yk1iTFxl9XR0GImj+wRuOqoy4QEYqz2aXa/oIQt7WkrviR7rG9dYN5r0Pir
	x8dTrZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1is-00000002yYH-0wzX;
	Wed, 01 Jul 2026 20:39:54 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1ip-00000002yX9-3GbX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:39:53 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4grBhj1pw6z8v1h;
	Wed, 01 Jul 2026 22:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzH8cIjmzkaTbzxcez6NOL9lvuXAy29AjJiZHK2/mzw=;
	b=rC/gRBAsaZ3PrhN1J5BcUSJngZncbLvZbg0L+VBsOlTrptly9QIX6J2YB+MAZO51VtdfT+
	H6cdyD7ue5oqmMMl9KHSlkhjzsLOSLbjBYbM135cmHXj1FO764BElba7op3R1y8YvzjD4X
	MDc+p9y+vgwDVtiRjAFVqfdhiYmjM2z9LOW/2aoTuqijMl/hbuNwRwRuhLZ/7rmEu78IFV
	8FgJbRFhjPyO0pnE2qmxZVaAtoHxqtiZXXEQDnd0aPEjpczduAU8XEc3ADTY+Jz584iFjc
	xgRI/1GFmO22zWJ3NVS653QI8vXtCmsNwPj1pSuf8i5ESpmaSJPMXssOMvXTrw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=UMooT3WC;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782938388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzH8cIjmzkaTbzxcez6NOL9lvuXAy29AjJiZHK2/mzw=;
	b=UMooT3WC3YZwbPvyoOa8L8tzBx/dhNGaKQMoZzUF8WTt9uWCu/0g7RxL5S0g0I5YfuvSgl
	Oz5Ps719Y/qvwaIE0gePP4DrNdSWqyiuboO3PKtmnXKBCDdGHOz2MFzp9gfOjl60UKDJKW
	Nb29BdQFmKt58EWfpP1RR2wsAMBN041viyzt8Vm6qhOfbfpfhP1TH16gXYuC/bolj4kZhD
	gD4ef0oxhJ0do/Qh+XHu70T1ABB8PSe/FT5RYTPWVikFvxGc1jXW+5GBTeuqiEijAzYsjW
	YTb1DxsZOSUySpBZ3fuESBRgPsV8q80o71nPbxBgnEgLQBixNmvcp2jtjpnGxQ==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/5] PCI: dwc: Determine whether iMSI is used before calling .init
Date: Wed,  1 Jul 2026 22:37:44 +0200
Message-ID: <20260701203918.63189-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
References: <20260701203918.63189-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: a1heqr496enipirpo7hddet7dcxqyciw
X-MBO-RS-ID: 08b502b8c3826dfc338
X-Rspamd-Queue-Id: 4grBhj1pw6z8v1h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_133951_959356_757A2E80 
X-CRM114-Status: GOOD (  14.10  )
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

The R-Car Gen4 PCIe controller integration configures MSI registers
in the controller driver .init callback, because those registers
have to be configured while PERST signal is asserted, and the PERST
signal is asserted across the controller driver .init callback.

The registers have to be configured differently in case the iMSI is
or is not used. Assign pp->use_imsi_rx before the controller driver
.init callback is called, so the controller driver .init callback
implementation can use the pp->use_imsi_rx value.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V3: New patch
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 06722259d2e37..f5a38e6fd8d79 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -587,6 +587,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pci_msi_enabled()) {
+		pp->use_imsi_rx = !(pp->ops->msi_init ||
+				    of_property_present(np, "msi-parent") ||
+				    of_property_present(np, "msi-map"));
+	}
+
 	if (pp->ops->init) {
 		ret = pp->ops->init(pp);
 		if (ret)
@@ -594,10 +600,6 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	}
 
 	if (pci_msi_enabled()) {
-		pp->use_imsi_rx = !(pp->ops->msi_init ||
-				     of_property_present(np, "msi-parent") ||
-				     of_property_present(np, "msi-map"));
-
 		/*
 		 * For the use_imsi_rx case the default assignment is handled
 		 * in the dw_pcie_msi_host_init().
-- 
2.53.0


