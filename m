Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BB7C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HakaDQtbNHmC9OTgcAoh2VhG+7+uJ16MZrRld7j6u3w=; b=PjQfTSnyX79qg8WF+Rz1/kTkOR
	xWa5H/SnljOjjXXOFStQAxHAHcJ9itXnOrGO+dQkYD+jUgHFLdXBJSd2Yb3yvyQGce+Lc8FL6T2ym
	9l4ScCRGkGE1Q1DG/lUHLZLOWP00bpHKu9nJSliwkep+wfsjakK0CyAaeRTeyJhEPuXZI1YT7Bo7F
	jIzHfMO8kCUIlHXIOpdcwvxJlIJE/svTz7t0Z5U5LenTuZYB/m4JsTwvRAV6QsSmvdhAb+zvFHnR2
	6b7kS4jRKgfQc+kZD4YEIN++3RmZkJ0z8QgmI+3BgePLinY03Pl7CMdezE0CURCBIMHVYxW9EyLZk
	1ts5oFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8Xr-0000000Ang5-0oaS;
	Sun, 23 Feb 2025 09:45:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8WI-0000000AnWn-2Mrt;
	Sun, 23 Feb 2025 09:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B860A5C6671;
	Sun, 23 Feb 2025 09:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C96CC4CEDD;
	Sun, 23 Feb 2025 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740303809;
	bh=n3VmuDkahaRSXSSONIGxA6K3sJl+bXqC/Tuu5fPag6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSUUKBfaBVt20BCaE2r4RGaUbqvbpZAtRTPBl99e3OjmAUd3O/MxP/xt7JwAZVX5K
	 ASSWS6hMqB4DFthWyh/373e6K4DDXdhdUF4WUjEMUb/q8LIe2+FRc1EBfNNJTCTqga
	 kau5tCytLK1rOe3QMF3k+LR2E4Z7YuWg0e4BIyV3N+TDFVEjikyzeFCvfoPo6shAZ4
	 Z7eJuiS0WrYL5I8mtAYgh6DXqjWc2uGRS8pYTsUCO+Nkk+v6A8+PgMvzvR0pRVWXop
	 VoBn1u6JZksCjMtB4006IMgP3NJfFNikGliU4Grk3Btu3eoYIyVNG0YuvT7K91ibiQ
	 sqOKU8UXP5XDw==
Date: Sun, 23 Feb 2025 10:43:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: mediatek-gen3: Add
 mediatek,pbus-csr phandle array property
Message-ID: <20250223-hulking-goldfish-of-symmetry-cbfed4@krzk-bin>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250222-en7581-pcie-pbus-csr-v3-1-e0cca1f4d394@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_014330_662787_DE7847E1 
X-CRM114-Status: GOOD (  10.20  )
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

On Sat, Feb 22, 2025 at 11:43:44AM +0100, Lorenzo Bianconi wrote:
> Introduce the mediatek,pbus-csr property for the pbus-csr syscon node
> available on EN7581 SoC. The airoha pbus-csr block provides a configuration
> interface for the PBUS controller used to detect if a given address is
> accessible on PCIe controller.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

You got review tag, so if you decided to skip it, this should be
mentioned why.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


