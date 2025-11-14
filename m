Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509F9CDE017
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vkMpsltnFXkF+G2EStX6zbbbjFa3ZqX3K9ihfvO02o=; b=ri055dperhZzTGBNu7KfkWMyPH
	u71zPpuueWKmrGAzgVA6l4wpPFZJ02LqfGa62QIUz5bKj5lK1PF22SomqPpdkf/Zdv37hk4KiCX8j
	/Xg06EvmEx43TPmWuQMfmM8mczvG27e8gI4B49LHsyx46oQmnmcG+xsoyhW8nNhoDwKHQO9HuxIfS
	pJFES6+rDXKXJNucvpyYyM1ipmF74OpKmu3RxpkwDOyiXsGbIC9tvT/+o6Eq0Wlk5iEuSiENORuLT
	Nt4O6aLAfiUjho9UFmjQU99JTN3vBCeXeJmz9HB2CIf7pCm4N1KNpK/Y3R02lKczBNHniKS5UlaS/
	LMp8j0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnkS-0000000BhKW-242W;
	Fri, 14 Nov 2025 06:57:32 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnkO-0000000BhJj-0XAV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:57:30 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251114065720epoutp03f14071cce67c847714e107509dcb011a~3zTzZOpuY0259502595epoutp03C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:57:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251114065720epoutp03f14071cce67c847714e107509dcb011a~3zTzZOpuY0259502595epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763103440;
	bh=1vkMpsltnFXkF+G2EStX6zbbbjFa3ZqX3K9ihfvO02o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=AF9eq+cOCo27nmRd0D85k64UWmd+h8PC9krLewVBf8bPetYybViAT+7VXgYXlBUPm
	 D8x+8PS1FCXZnGrTxgWQwl6yqAbO9GQ7ihBF/22K7G3ho8FtJ88fSiCfVxSazWviFP
	 ZtrPDMUbSxBwgZyBDwWkpNH/oycM8oXaZ6B/h0y4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251114065719epcas2p1e8849a097d46ed03d4a15f820d6e3459~3zTy8NAmg1323413234epcas2p1B;
	Fri, 14 Nov 2025 06:57:19 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.211]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d77HM3gHXz3hhTD; Fri, 14 Nov
	2025 06:57:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251114065718epcas2p1f36aa81a248e01e9c78a9064c268b72f~3zTyB67lU1559915599epcas2p1K;
	Fri, 14 Nov 2025 06:57:18 +0000 (GMT)
Received: from KORCO118486 (unknown [12.80.208.104]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251114065718epsmtip16f5e401c43bd4752ad76b10649c268b8~3zTx7Nt-s0134501345epsmtip1i;
	Fri, 14 Nov 2025 06:57:18 +0000 (GMT)
From: "SanghoonBae" <sh86.bae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <vkoul@kernel.org>, <alim.akhtar@samsung.com>,
	<kishon@kernel.org>, <m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<shradha.t@samsung.com>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <ea85d388-c0c1-4b4a-96d6-d3f27622ed54@kernel.org>
Subject: RE: [PATCH 3/4] arm64: dts: ExynosAutov920: add PCIe PHY DT nodes
Date: Fri, 14 Nov 2025 15:57:18 +0900
Message-ID: <001601dc5533$eb0049f0$c100ddd0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQISOccZb2Ez4IvEWuwZme1oXG7+3gLz1TbfAjvUL4UCZHEM87RJTwlQ
Content-Language: ko
X-CMS-MailID: 20251114065718epcas2p1f36aa81a248e01e9c78a9064c268b72f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074021epcas2p36a8dc02c84c9ca11e2318a1a8931d68a
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074021epcas2p36a8dc02c84c9ca11e2318a1a8931d68a@epcas2p3.samsung.com>
	<20250926073921.1000866-4-sh86.bae@samsung.com>
	<ea85d388-c0c1-4b4a-96d6-d3f27622ed54@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_225728_837163_E8E19AA0 
X-CRM114-Status: GOOD (  15.34  )
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

> > +		pcie_2l_phy: pcie-phy2l@161c6000{
> 
> 
> 
> Node names should be generic. See also an explanation and list of examples
> (not exhaustive) in DT specification:
> https://protect2.fireeye.com/v1/url?k=d2bcf1f2-8d273f96-d2bd7abd-
> 000babda0201-1fe7eb4ecd262f65&q=1&e=8522e96d-f1a1-4b6b-baa9-
> 44344340469a&u=https%3A%2F%2Fdevicetree-
> specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-
> basics.html%23generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to DT
> spec repo).
I will rename the node referring the guideline you linked.

> Plus style issues... missing space.
Will add space before left brace.

> I would like to see also PCIe nodes somewhere, because I wonder if num-
> lanes should not be moved to PCI node (phy consumer) instead.
> Current approach feels better, but maybe it just duplicates num-lanes from
> the PCI?
As mentioned earlier, I plan to enable the PCIe nodes later.
However, I can share my prototype PCIe node that I am currently using for
PCIe driver testing:

pcie_0: pcie@163c0000 {
	compatible = "samsung,exynosautov920-pcie";
	gpios = <&gph0 1 0>;	/* PERST */
	reg = <0x163C0000 0x1000>, <0x12000000 0x20000>,
		<0x2fffd000 0x2000>, <0x12600000 0x2000>;
	reg-names = "elbi", "dbi", "config", "atu";
	#address-cells = <3>;
	#size-cells = <2>;
	#interrupt-cells = <1>;
	device_type = "pci";
	interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
	interrupt-map-mask = <0 0 0 0>;
	interrupt-map = <0 0 0 0 &gic GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&xtcxo>;
	clock-names = "ref_clk";
	num-lanes = <1>;
	num-viewport = <3>;
	bus-range = <0x00 0xff>;
	phys = <&pcie_0_phy>;
	samsung,pcie-ch = <0>;
	ranges = <0x82000000 0 0x20000000 0x20000000 0 0x1FFFD000>;
	status = "disabled";
};

As you expected, num-lanes will be defined only in the PCIe node.
Please let me know if this composition of the DT nodes looks appropriate
to you.


