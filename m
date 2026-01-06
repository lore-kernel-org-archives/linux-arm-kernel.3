Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8352CEFCF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmBfekrj5zFaf51S+GXFZXIaP2QM+GH2ju6KgqiUkkk=; b=S2q4CM5+zVi36BHkOxmAC1nuOc
	WFOxO/yaPb9U5cQ/DAY1jCzVQKVkDNACUrCmV+T3HXzBdk3uP9W+wmFvAWhKoheEPek262xbXyFI7
	XCDEeoGxOcA3OBJrlN9mnIyroEjRQtbg8CT7zgdMbIlvza6oSOPU4npqkw7sBQo3g3CioEZyWzNS+
	TJ2zIdZs8jIdHN+f/Ynzfmc+ppofVxAOTZYFubF1DFH7PJ1kQr78bzk3SlEx18G4nNK6alnTAT6aF
	00RLV37A5p+I9GgIGGtIVJEw6DpgcL9m+7ZnBQA0gI7D8EqlfkXkV1N0zbLBelV7o8Qv0XmtyMy7s
	dKh3Daow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCJ9-0000000DjKZ-1dsi;
	Tue, 06 Jan 2026 19:01:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCJ6-0000000DjJs-2JQb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 19:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0E6940274;
	Tue,  6 Jan 2026 19:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64BEC116C6;
	Tue,  6 Jan 2026 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767726087;
	bh=mnBxn/Rz2DfcOBFabd4WdQGJtGWiMmCwwVsL6cusnNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6+H7MW4loyEJscRG5Psbu3gmX/Y5UgpqbgG7ATxtlOOdKw3U2y1JPyCyAxtKvEMN
	 UTG2O49hKxgvG+Avk6OJbu4iI2ziQpA8kyUMqIGJA9Wk0YfGcy0EEASCYgVjortKCp
	 F2cfdPwkllaLtN/xkYVdTKTrukryLKs3bIQFutNFv4vrlitPlIBCwPn3rGzd2v8g6f
	 UDcErOxPY0jUl5Ovlb2ke4XAZrxC40h8K3zCXVE+FVOjnz+SqdI3J5xzLi3cbdtxXH
	 WTB12R7tX6mmA0Y1mP9piXA4nfT2EfIfmXd040rjb5QASLy87QZFvcrX1UaVPwXceg
	 dg4w7k9xliGOg==
Date: Tue, 6 Jan 2026 13:01:26 -0600
From: Rob Herring <robh@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mamta Shukla <mamta.shukla@leica-geosystems.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	bsp-development.geo@leica-geosystems.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: net: altr,socfpga-stmmac: deprecate
 'stmmaceth-ocp'
Message-ID: <20260106190126.GA2537154-robh@kernel.org>
References: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
 <20260105-remove_ocp-v2-3-4fa2bda09521@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-remove_ocp-v2-3-4fa2bda09521@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_110128_613118_6AC74FF2 
X-CRM114-Status: GOOD (  18.20  )
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

On Mon, Jan 05, 2026 at 06:08:22AM -0600, Dinh Nguyen wrote:
> Make the reset name 'stmmaceth-ocp' as deprecated and to use 'ahb' going
> forward.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml          | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index fc445ad5a1f1..4ba06a955fe2 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -13,8 +13,6 @@ description:
>    This binding describes the Altera SOCFPGA SoC implementation of the
>    Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
>    families of chips.
> -  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
> -  # does not validate against net/snps,dwmac.yaml.
>  
>  select:
>    properties:
> @@ -84,6 +82,15 @@ properties:
>        - sgmii
>        - 1000base-x
>  
> +  resets:
> +    minItems: 1

That's already the min in the referenced schema.

> +
> +  reset-names:
> +    deprecated: true
> +    items:
> +      - const: stmmaceth-ocp

This says stmmaceth-ocp is the 1st entry, but it is the 2nd.

You can't really fix this to validate a DT using stmmaceth-ocp. I would 
just drop this. So that leaves this with just dropping the TODO.

Rob

