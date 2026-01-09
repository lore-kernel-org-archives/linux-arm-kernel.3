Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724EDD26D91
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwGYOeRaxC8r7KLQ5MPQHRQIWLWbUCt3JTk1jKiuCXI=; b=si4b14aJaWFiXaYvoffIAhcFrB
	v5tU42cgibW+wzA8w0BpYDZWClbhmf6w7eVdDcQlZIkwxttoMzBn7tUMoJSMuJDDXKGExc0+YMs2i
	taB1K1XgDc8BBpe0GAyM9+CMxHwwoJcFCwM1phiReHAUvWZxRb6L1R9wvw1oTrG56s2+dQglsCsi1
	pZWhSN5f/+3ufJ9rvX9kHyZKdsNkBY58Bnb+VU/qWXMVnUNRRwM+DXtLDBDPVlFseOuKf+IbFRiQG
	rOzqytjR7/Eh59rOD9LGMLBpkTvns9Xuv8PR78LBkfuIOYhveoRv3TLykcaRONAmQJaes5BEriEi3
	BnmsxhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHGb-00000002tM9-2oh4;
	Fri, 09 Jan 2026 18:31:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHGZ-00000002tLr-397R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 18:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EwGYOeRaxC8r7KLQ5MPQHRQIWLWbUCt3JTk1jKiuCXI=; b=COcIW6ipe3pNW3FLUndl9lxole
	p8kA6IAipiGel0bGPkZFc3iT9DHRMCYDVlPe/BHwmOlsOZHjg3xxIW3w7TXTZou1tIeT2KcsH3x0V
	FnOnenbGbAWs4NA4n7Dq5nWHLvTRDKIjGvMGZRm65GhmpmKvcfr4F2WOsA+Eq5U6LJts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1veHGP-0029bk-2U; Fri, 09 Jan 2026 19:31:09 +0100
Date: Fri, 9 Jan 2026 19:31:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH v1 2/2] net: stmmac: eic7700: enable clocks before syscon
 access and correct RX sampling timing
Message-ID: <1f553a6e-ca95-45e2-be14-96557a35e618@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080929.1308-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109080929.1308-1-lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_103119_788714_ACF37093 
X-CRM114-Status: UNSURE (   6.32  )
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

> +	dwc_priv->eic7700_hsp_regmap =
> +			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							"eswin,hsp-sp-csr");
> +	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
>  		return dev_err_probe(&pdev->dev,
> -				PTR_ERR(eic7700_hsp_regmap),
> +				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
>  				"Failed to get hsp-sp-csr regmap\n");

In order to be backwards compatible, you cannot error out here,
because old DT blobs won't have this property.

	Andrew

