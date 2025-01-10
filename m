Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB2E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go6Mt8yoM+PNbuAKxnovA/CqAwsRZWr0IjEkGgkxoZ0=; b=MXFzzOXNsgcyn5sGu3E33PQEah
	zkhiUg41J1eIU1GSaZp4F6Z+NnraVbArOZtMIKeDNN4Tw+UYDxUtgcb/X5Gy1XkRTwHhU5QzqEBob
	FO6FGedlLllE6ta5C93c4rOtTZn20Ib44DTRt73gbLVDeHL1HDgvhDU4P5vnOLZ0kqB2IoaiX/3pu
	3yLDNebJpoWe5sdkL6aE9qd3zIbKM7eiUcNoZy3KXw5FqpiI0IBz4ZFoJjOZUXDQaEocWvAeBsysY
	dqUay0gygEfO60x2HPKd27ouxK9NDA0Z++fgmuwugQW/etm15BHs9Iejd6JtJhOGqF+eyPn/DP5Z8
	4QIGX+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIiP-0000000GPCU-1FhT;
	Fri, 10 Jan 2025 17:22:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHC4-0000000G3cl-2Uyb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C2DDA4255C;
	Fri, 10 Jan 2025 15:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143C8C4CED6;
	Fri, 10 Jan 2025 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523903;
	bh=OTGkN3XvR9yS3XjEo4HOuIC3KncL4iFmKtSsBY8wwy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCQa0pdg2qxKVtHtTkJ4SGoINH4HtU7FC0jf6BspFQquH/vW75BYx+9A5FEStYCBQ
	 E9JxXVi5iN71mutTaOOXYnQOT2oRUN9f4IAA8zQnPkTUAT+IFiIsoDMc75hRAe3/mQ
	 RJ3i+SA0ugZ/4I04jr7lzzWM6IjPSfwYfS+ZvVkKMRCtfu6bMvkaK6DgBZhUH428gN
	 6+8cSmkG63Gu95c4is8beF+nx5sMV1NKT30rMOnUyX48jfAQ/wCXNVVUtdo7lb/+dH
	 FiwoRnp9ge/xuuiuc1Ihc3S8ozZWKgatnci64pA03MaKC9qvewi3Wz78cjpP6E4KfP
	 gquUU5DOldO0A==
Date: Fri, 10 Jan 2025 09:45:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tianping Fang <tianping.fang@mediatek.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-aspeed@lists.ozlabs.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-kernel@vger.kernel.org, Al Cooper <alcooperx@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Justin Chen <justin.chen@broadcom.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-tegra@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
Message-ID: <173652390194.2924780.6221015444062586872.robh@kernel.org>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074504_768161_8241F9E8 
X-CRM114-Status: GOOD (  12.81  )
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


On Tue, 07 Jan 2025 14:10:13 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>  .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----
>  .../devicetree/bindings/usb/cypress,hx3.yaml  | 24 +++++------
>  .../devicetree/bindings/usb/dwc2.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 20 +++++-----
>  .../bindings/usb/intel,keembay-dwc3.yaml      | 30 +++++++-------
>  .../devicetree/bindings/usb/ite,it5205.yaml   | 18 ++++-----
>  .../bindings/usb/maxim,max3420-udc.yaml       | 28 ++++++-------
>  .../bindings/usb/nvidia,tegra210-xusb.yaml    |  4 +-
>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 36 ++++++++---------
>  .../bindings/usb/renesas,usb3-peri.yaml       | 24 +++++------
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 38 +++++++++---------
>  .../bindings/usb/ti,tusb73x0-pci.yaml         |  6 +--
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 20 +++++-----
>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 16 ++++----
>  15 files changed, 161 insertions(+), 161 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


