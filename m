Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC805FCC9DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeH7XPZJStq0X0OCAxKVN7P1u+yWEiPTCZ7NPbPQGPQ=; b=XSb1GQR94l5NEiUrnvq9vxAyVh
	dyQ2wmcL4yjUfGZDEJ5ojYJi+zWEgsAPeVwr2vte1UpLFFITZWRhOrI2SPszw9CvxxEnKHpeXMPdI
	5wuUss+Q6JHAHY5zBaU5Ygqdd5TUZY3lmENsHZ5sTB4jYqTTfbQo1uo63Owe1AmhcW35f2XvN4Hvt
	NEALisa5Und0UwhWpfF7t98o0s/s+EH3h6KywNq0f25DihPZGlNdctJ38duK4Yi14tZxxzSD4Os87
	bpf+i//sbNXP6iFJfAn65Lv8mRCRQjfG4ZSFu9QaYlYWfi+5y9JWMBCbrUkWzv6gunnqAsX/Tr2m+
	2OJIvpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsPU-00000008wRa-1HqN;
	Tue, 10 Mar 2026 08:25:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsPS-00000008wR7-3pQQ;
	Tue, 10 Mar 2026 08:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57F1560054;
	Tue, 10 Mar 2026 08:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E43C19423;
	Tue, 10 Mar 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773131146;
	bh=cuyXodzCUJDUciuTuMLZ7yq7kwx0PZeH+CANPawJXyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JieQepDVERwVWnitXD9N0MA2AcgB0PzHHytY/SxYWvP2Xligm3ViBnsiU8IYik0dR
	 +GgsBzXMC+1Sb674F/+Vrzicw7e4nnJCBVRozia6Zw2unGpEwFwYkdSKoHMJQs0Rnl
	 1WnAIDL8Y0AMpElTrVqOgd4qcLzL4Iryfv8XC2vObnJLBhLpPYFvOzMyG3Mb0+kI9E
	 ZVi7cuwk/TJp5wf9lfyGHBWhPFvmGQpVWSg48WyYdJMC8xgBxEUhCMBnJAeWLSpAvu
	 TMlz+ZnNkCKWW4b3G0MEbyElarMvt/40ChM9TztCXTpysEDuaBfNFGdV+Q12NVj7Sz
	 Aza/AOg1DwWmg==
Date: Tue, 10 Mar 2026 09:25:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/8] dt-bindings: PCI: mediatek: Add support for
 EcoNet EN7528
Message-ID: <20260310-onyx-ibex-of-progress-fdf1bf@quoll>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-6-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309131818.74467-6-cjd@cjdns.fr>
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

On Mon, Mar 09, 2026 at 01:18:15PM +0000, Caleb James DeLisle wrote:
> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
> binding.
> 
> EcoNet PCIe controller has the same configuration model as
> Mediatek v2 but is initiallized more similarly to an MT7621
> PCIe.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie.yaml | 1 +
> 	 1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> index 0b8c78ec4f91..57cbfbff7a31 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - enum:
>            - airoha,an7583-pcie
> +          - econet,en7528-pcie

Patch is heavily incomplete - why do you have variable number of clocks?
1, 2, 3 ... or 6 at the same time?

Look at the rest of this file to understand what you need to write.

Best regards,
Krzysztof


