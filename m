Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F7EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 03:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReeWRcc9S1jLmDL5y3OSETrWJKjvDINQ5XoMkMPPkAk=; b=DoEAFiMUe0U1WVA8apNKsKYpc/
	Y+O67SuzULdzJLK2zpZDjhYdT5rD46oTy5nShLNTDJ9GdvI5BlIYuoTt8J9fQY09TR5QdlAz7fwf6
	yeNF+R4QHicQvOcDJOQMWwETWzlJ6cs46dmIFOOaOo8LH14/4bHzjPPBRweTZoJGUvbDYepPlRCSg
	eIbsmDGfolR+b0DpAz/zz4uaIL8LD8GdX7vQEpXKF0W0Cbe+O9ARq+2oWZVg6nWNMMWPkpm9FMce3
	S7xOsi4X3dQQpziZah2OFolvzWu+IkK1537u9oPCxUBzYv+5MqAb74RpKrmQ8gU1CIItbcqjI5FUM
	H/eKsE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twupF-00000004kk4-30Bd;
	Tue, 25 Mar 2025 03:19:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twunW-00000004kZ4-2pVo;
	Tue, 25 Mar 2025 03:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 115085C597B;
	Tue, 25 Mar 2025 03:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860E5C4CEDD;
	Tue, 25 Mar 2025 03:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742872669;
	bh=gYwpeb2EZNZ+wO6LD2t7gQ6MM0ApL/ziRmZDPDwMe2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBcMZ2azJwZUFWvH0QcEl7V/6CguV/7xugJWN8URvPwSE7X56fmHII3KKBvHKz3ev
	 tZGvpNesO8pAvfXhQRiXS8Yv3BaoepPd/Zc50g/IqtbUpi62Zfu08pSmWDymlIQ1MV
	 GjG6aHi5Q29/ggZtILQlgxEzhWEIgKpNWpdj3C6zcTrbAqdHTNdiOuCPZShVRjrmkX
	 AtjX2uR69bfua9gSwQW1OIVX77eZD8nxQWGAmj+/7Ih2Jjd0JpWzUUJ8i0CVOxasvC
	 r0hJ7pZI2j+pCEXOGgYm0+XjZ30IHODMjjZ9xXmpGwjQKB7Ba3d9BczVrCng7cBc0m
	 SP2c3m691exrg==
Date: Mon, 24 Mar 2025 22:17:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Greentime Hu <greentime.hu@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Tom Joseph <tjoseph@cadence.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-pci@vger.kernel.org, Jim Quinlan <jim2101024@gmail.com>,
	devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	linux-riscv@lists.infradead.org,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: Correct indentation and style in
 DTS example
Message-ID: <174287266828.1624468.7570940248858053984.robh@kernel.org>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_201750_765997_5F3EC6D6 
X-CRM114-Status: GOOD (  11.19  )
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


On Mon, 24 Mar 2025 13:52:01 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/pci/brcm,stb-pcie.yaml           |  81 +++++++------
>  .../bindings/pci/cdns,cdns-pcie-ep.yaml       |  16 +--
>  .../bindings/pci/intel,keembay-pcie-ep.yaml   |  26 ++--
>  .../bindings/pci/intel,keembay-pcie.yaml      |  38 +++---
>  .../bindings/pci/microchip,pcie-host.yaml     |  54 ++++-----
>  .../devicetree/bindings/pci/rcar-pci-ep.yaml  |  34 +++---
>  .../bindings/pci/rcar-pci-host.yaml           |  46 +++----
>  .../bindings/pci/xilinx-versal-cpm.yaml       | 112 +++++++++---------
>  8 files changed, 202 insertions(+), 205 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


