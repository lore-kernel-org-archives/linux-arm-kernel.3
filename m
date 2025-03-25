Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92164C36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 03:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtVG/uS99SSOhyraHwU+MKzi1J+0E+CwVuLdm3mYrbo=; b=aAAdBj9aJWHSi3cZGi4pXOJuTb
	zLZdpUERPOMaO/R3VjXx5uz/3zF4r1TnwR1/gsQBLB8uwNBZVXNQFrwIzk9lS5sVUOoW8k0lM12YM
	r8nbDt7sOagYeapsyzYz5ljOpAlAyZXX26MvsJV2K3lr/ZCsREfh8aGq8gSJLtb6DZnTJUb+LLCAB
	8HI7KK1VKvCk2mzrl2Q+PtMEs3pwYSW2rJTFd75bLGGj20pAKPPChrWp9ka9fr26PKa2pXwAaSJQu
	ZvoGik3eRH4e+VNCXDWLhgVWls/OVvR806YV0T+r+tPc/hX070GrRTxV7QKcBNmxnRPXJjxfIiqLd
	ac2xxiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twuqx-00000004kwm-1g5a;
	Tue, 25 Mar 2025 03:21:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twunf-00000004kab-3h9H;
	Tue, 25 Mar 2025 03:18:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34D295C597B;
	Tue, 25 Mar 2025 03:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E1BC4CEDD;
	Tue, 25 Mar 2025 03:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742872678;
	bh=WcCXntLzQZit3QH6kE07eF3DJST8a8sxgtc9AKLM/C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtR8HaKIzsyqurMH3hl+zowqyTXnZbefgn8nTrqgS6D0JLDXQZJCBx/Bmp5Up9CY1
	 gnw7310T3/E81oCGVOl3M/0h0GT1t0oXtBWhpPdDErgzlmpZeT97ZPwkzPJGPCBVcF
	 yWcry+K4QCr0QrAridbY4k5lNwXkQRUdV1AWce0aAakiTFoZ1DSG/yGqkYCjlkc3KK
	 bH41B4uKAHyFihg0FHXCL/Gj2iHRlhglv3qNRplI4dXwns6PpmRRW2b8Kx2K/7NeFg
	 y0ei9AwlZcdHapHGTMiifYhxh3nzcoJzzVw/6/HBE5LbQYcd7KQQIO9nF/4OVRDC5O
	 C60gLEjrmlbig==
Date: Mon, 24 Mar 2025 22:17:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michal Simek <michal.simek@amd.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jim Quinlan <jim2101024@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Tom Joseph <tjoseph@cadence.com>
Subject: Re: [PATCH 2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include
 placement in DTS example
Message-ID: <174287267578.1624713.1754304673947660629.robh@kernel.org>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
 <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_201759_973480_461F0631 
X-CRM114-Status: UNSURE (   9.54  )
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


On Mon, 24 Mar 2025 13:52:02 +0100, Krzysztof Kozlowski wrote:
> Coding style and common logic dictates that headers should not be
> included in device nodes.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


