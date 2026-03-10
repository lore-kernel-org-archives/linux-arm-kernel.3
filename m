Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB75FCC9DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+EdR0zABTDzpKdRkxVBKBWKgwCgMDIMcvBY3+wEkoZU=; b=E8UWqJAaKh+vYbWDRYUTTZ7ZVT
	ple4F6sVU6jK1itzMD34KulhToEHs5TrB79rIFaDLg3JVVV1KmPgOjRcHBUx0iOuHQTRMniEbUFQo
	DP/UepbyVzPv11ellbOP5q2LpBqvrOKVUwhpL9GO29rbaLQq76GRu2xHmKRiMm0imxLwGKEHJaRv/
	lKKwkFGjASkRbnXUDOFCLXmGFCalJQ9aHMOh1ZmSIMzXccAyCAaniZIwlNTr5OepzSurLZwWwhsSx
	b98KRgAyp/z2EZ7edUWWqgudirPAWlRRyxU/Zz4EnUpjRyHGUyE5GCFcGlswxhiTmh6ijUisSpN27
	OqJ6ZJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsNx-00000008w84-0SHa;
	Tue, 10 Mar 2026 08:24:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsNw-00000008w7p-0gk6;
	Tue, 10 Mar 2026 08:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B17860054;
	Tue, 10 Mar 2026 08:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45449C19423;
	Tue, 10 Mar 2026 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773131050;
	bh=X93Yxq3bUx636kMPKo1AS2iratZcYw/WWrjo9W6vW9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDZ3AMGNrWWJr5OO/Vv7W7DPwZ840Y/Cw7CurnzVxWroksyoh8Dqe9AaGC4rCwprR
	 NqqY9Axsh71dzpfh/4oGqBvaF+Mn7OjU63cNLDMV2IiIlSl9ByjqLa+7gyOb/wv5nZ
	 iacizi1sBrvWpHv/TDBzI0FP41KgS5/iGVGJ325LoczzcdDF4PTj0OUmmlD60bnk/S
	 QA1dgecDr2zleSU8epPC5M0Hwy1fWWF7EDqo+stAapt5cBUdhxcbJVfsOEBDUJH3I1
	 EMkDhDZBZQv1AXbKrsoGqoxmueiwb3LLHV+6ScLghnJM43vV5vKNlOV9ZyElByVpmF
	 eUdQ3lYXxYQTg==
Date: Tue, 10 Mar 2026 09:24:08 +0100
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
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
 EN751221 and EN7528
Message-ID: <20260310-scrupulous-fat-ara-eab47c@quoll>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-4-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309131818.74467-4-cjd@cjdns.fr>
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

On Mon, Mar 09, 2026 at 01:18:13PM +0000, Caleb James DeLisle wrote:
> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a PHY
> which behaves slightly differently because one slot is Gen1/Gen2 while
> the other is Gen1 only.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Still, four separate subsystems unnecessarily merged into one patchset.
Split independent parts of your work per subsystem. See also submitting
patches.

> ---
>  .../phy/econet,en751221-pcie-phy.yaml         | 50 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


