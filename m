Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F9EC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e+DgFYFBUC1JfQz2ac791s6PLHOH76kUTC4Uk6Yz1q0=; b=qus2b6pLNckJOVcZxv6FaOsIqu
	ei/ZTWqbk3zoJPGByrAtBa4YUkjJofSDvWv+Se6w1peOa8BEpPbeVTvnIH4UxdxsrhvKllG951OVr
	wgC+SfYTsD9sxht1YdBVf5NYGkUdK/hl6EoJwep4hwMdbvgG/AmXewv+2VWOiHCYoZ4bB4OijN1M2
	QnLnTblwgqJDse+4EeOTaL9sGAKNOuMy158GZ+POMoL7cn+LQ4+9OLBfXq76T68y0qrNWf9XNRVdo
	uy38/r/uF4fhCJ4X4dYIzJNTXE8uszHoDTxjfi967HkDPVy3ScaJ8jY0aoun/OF6+Fdh8yQrIcga9
	v7kygTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyypW-0000000Gcqi-0FV9;
	Sun, 30 Mar 2025 20:00:26 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyynk-0000000GcTT-32Xr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 19:58:38 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZQlSQ2VPJz9vKQ;
	Sun, 30 Mar 2025 21:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743364710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e+DgFYFBUC1JfQz2ac791s6PLHOH76kUTC4Uk6Yz1q0=;
	b=W4wWM/8HXm/dUmCtiZelwrogbXO8+QsqDg551MA7BbwA/BQbD1ZPRumqNps9/+Kwc+J+w4
	AOUN7NSuCmpzG1aIvoyflZX9H0psX177BxcyE6q8vA23IzcJiY5jr5jHlWv+OulRHo3xnd
	3cZzIeOQuSkkHWpbOM8vOs0zPd8q0/fT4m8wl2nVlF0nZKpcKlzT/Lx2+VJFTzzdOi5RGP
	WI3UzO3csBfwPppKDWUkY9GzNfsxNfnWd7ahlxc8EOaXjNEEaLYLbVoOpa/LFhtfA5L+YB
	QfobxB1X7WVoFYNKnBoMoRTMGbgWtFXDCRwtcWN8iUzzN3obru/wNymfJFrwQA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743364708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e+DgFYFBUC1JfQz2ac791s6PLHOH76kUTC4Uk6Yz1q0=;
	b=W+nTWuoDcqty3Vnpq5gzNRsu9xLWYbPPnClczDtderzm2izRpt9O2oa+fqm/rMj2XaVNWp
	suJTQvQv677BQROHd1ptz/xxyruwmWrEwrS+V+SVazp5p5NLhlPT5Tr2Jcg3NRVTyJJZDq
	4703B8SuNKGdqmv8zJxM/jLpYyO6C4Ty1RNlzUc0ulHwwgkTFMbNWB5oVNUq4fm7s+nVfE
	QWSWjMgW+P6kB4cvVhy/BvvMntq7RF23rv+KnY6FOPGqelgoxgBMHNfkzr4uluQhrNA3ZK
	v+Lo08hA+LIt5tSakYe70zFiPPXcmTyscomIw16/ipD1/U4TbDWfir8L3OtotQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H Sparrow Hawk board support
Date: Sun, 30 Mar 2025 21:56:08 +0200
Message-ID: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 411346d026a677b7e90
X-MBO-RS-META: 43y5k787afq3cee6iy5rounnewkzdcey
X-Rspamd-Queue-Id: 4ZQlSQ2VPJz9vKQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_125836_941439_984AD207 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

Add Renesas R-Car V4H Sparrow Hawk board based on R-Car V4H ES3.0 (R8A779G3)
SoC. This is a single-board computer with single gigabit ethernet, DSI-to-eDP
bridge, DSI and two CSI2 interfaces, audio codec, two CANFD ports, micro SD
card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe SSD, debug
UART and JTAG.

The board uses split clock for PCIe controller and device, which requires
slight extension of rcar-gen4-pci-host.yaml DT schema, to cover this kind
of description. The DWC PCIe controller driver already supports this mode
of clock operation, hence no driver change is needed.

Marek Vasut (4):
  dt-bindings: PCI: rcar-gen4-pci-host: Document optional aux clock
  dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
  dt-bindings: soc: renesas: Document Renesas R-Car V4H Sparrow Hawk
    board support
  arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H Sparrow Hawk
    board support

 .../bindings/pci/rcar-gen4-pci-host.yaml      |   8 +-
 .../bindings/soc/renesas/renesas.yaml         |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 671 ++++++++++++++++++
 5 files changed, 687 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts

---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Rafał Miłecki" <rafal@milecki.pl>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.47.2


