Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1688D3566B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0y+UG75sSnBholJwsz8A8vhVkFDSj7rmoHqw6plfuw=; b=HSbw1/aRRK3Rx9llPhRtuYbSKw
	BkuNhbi+5hxkXOo4NRN6Jkc7txLqEWN+cjC/ePoYR+A4z6EMM1qXfK+2B8HpuFJXaeVbUFpL44itI
	CIBetETxujuaJLe+HdAThDCkZu4YJdUP0vo4lIRBN9CrCvF9FSpXBVyuxbOqn4Uptc/XbbpMISow1
	u97pGbkjdWkjW2ZjzDkghd+udBvj1QYVaZodKAbh3TtJSCRqWkjXdZBWhAcpjS8e8EdF5d4d/9Cur
	TpHh60SDJnyjgg+GzyomRLJwx3s+zGK7J2YghSsi3TQQrwz1dX/ekjEQhhXcmlgwYBW9tYOrfjMaa
	9jKIyqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKIh-0000000HFtb-3HO9;
	Thu, 29 Jan 2026 05:10:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKIg-0000000HFt8-2Bap
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF81D60125;
	Thu, 29 Jan 2026 05:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB9FC116D0;
	Thu, 29 Jan 2026 05:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769663437;
	bh=/QRvDVT9GAiToi3v8vcF+/vGPRfAWiWi238lSh1gI44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c6V3DB04Gz6boAr8Vs3t5FEeQjtRG5O84q1Ij/YXCv8c2F0w+MP9w1Tl2kPB0FcD4
	 Xl/KgTLm0SxwSQJXbGYJ6tfseKUXZ+CFjkOf/nUEoHgjuj7x/FKMxVShY+7j4ttbhZ
	 5+sfRBkBxbb962nCJs7GbfVtdy768H2Exifqa8Ha+bB7KZvUd4Xo/aKskK81XNQGkw
	 lnlgJId6jwxkrazRSAnNzK8/QoGifKaPigQScm3ox0Q/GRuIa18M4rZWDdeRxfa2zP
	 LTWyvIAL7Ydpp1ig4pj/yLFBMNtFHQ+unTB2PyaqFIOEAul1W7rReRwo/4Dg3LnP0r
	 jlcHsRNYrgHlw==
From: Jakub Kicinski <kuba@kernel.org>
To: dan.carpenter@linaro.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	jan.petrous@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	imx@lists.linux.dev,
	chester62515@gmail.com,
	mbrugger@suse.com,
	netdev@vger.kernel.org,
	s32@nxp.com,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	kernel@pengutronix.de,
	linux-stm32@st-md-mailman.stormreply.com,
	shawnguo@kernel.org,
	linux-kernel@vger.kernel.org,
	ghennadi.procopciuc@oss.nxp.com,
	linaro-s32@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	alexandre.torgue@foss.st.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	s.hauer@pengutronix.de
Subject: Re: [v5,2/3] dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
Date: Wed, 28 Jan 2026 21:10:35 -0800
Message-ID: <20260129051035.375905-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <939fdaf94038613486bdbba510a92a1e57e18c71.1769592679.git.dan.carpenter@linaro.org>
References: <939fdaf94038613486bdbba510a92a1e57e18c71.1769592679.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon

This commit adds the nxp,phy-sel property to the S32 DWMAC binding,
allowing access to the GMAC_0_CTRL_STS register via a syscon interface
instead of the previous ad-hoc direct register mapping.

> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> index 2b8b74c5feec..65633b10e49e 100644
> --- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml

[ ... ]

> +  nxp,phy-sel:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the GPR syscon node
> +          - description: offset of PHY selection register
> +    description:
> +      This phandle points to the GMAC_0_CTRL_STS register which controls the
> +      GMAC_0 configuration options.  The register lets you select the PHY
> +      interface and the PHY mode.  It also controls if the FTM_0 or FTM_1
> +      FlexTimer Modules connect to GMAC_O.
                                       ^^^^^^

Should this be GMAC_0 (with a zero) instead of GMAC_O (with a letter O)?
The rest of the description uses GMAC_0_CTRL_STS and GMAC_0 consistently.
-- 
pw-bot: cr

