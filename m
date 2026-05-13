Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2EECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO9a9lTw6u/Y6PbEOxbqkftysVjoFRl2g81+sX/pxL0=; b=T5mRekoHkrpnPHA4V14fo0Qz3O
	n7iuUVb1yWAmo00yHjuS7Ynmts74reAMusfDkp14/ZClyahiRMVFjXisakVRUUqKLaixmhWIrsQB6
	h0zox7FnAU9kHCQuStJ3uNPCvmcuzBl3jdBklwIq1AHJjHAyc34gKlxBcSlf3sbzD8BPmNVoerIJ0
	VGc/dk/wRxQxRSm6bE5GldnxcE6AJ5sdbxxYRWoXUnxTfl/FrPuTp7MGB4ea5+uguGjMlXmcisLy8
	w3FMSAKNFZ1MEFui0qLaWbU86343wn7/J5lP7W60OGFRUzjfb+8gXZV98MeHEUntCOwHPhppR/SMI
	8tR5ZCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wND1E-00000003Id8-3TNr;
	Wed, 13 May 2026 17:05:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wND1D-00000003Icq-1LZ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:05:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DD9260126;
	Wed, 13 May 2026 17:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE86DC19425;
	Wed, 13 May 2026 17:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778691910;
	bh=pD2y133+MNgkoNr3quTW76FGiTi0U6sd84qgVAoBu1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oY1+9yFwysb+cDH0n/dgzJTvyWmbhvdAQhddqS44JEXn5L8gVbWcMAo7qTJYusa4X
	 r/3sh6MeRxRbb/ykQhqT4ZMaCHIeI1r2WB8oSPZDj2DkIIaYIUq8w6Xpo4eZfdR6NU
	 dPkcRlY3Sj6KmLLcKIrTTC/L/NZLfQOJ5z+JFeT2B4OpPWRM5W6Y+EsgfqcXkOi+qp
	 fRIe9Qk4lcQ/ACRc02mPTgtwdkh+KllvoFxthMJ31n8R4rWhD/zlyUeM1Aq2LmJAtb
	 dKIBsqe2M+NDEi0415Laq+bwL1YUqa8kKG2NRSxMWc1Tsq6562u7+CR7a9CuZyBTOy
	 WxK16Cg4W+B0Q==
Date: Wed, 13 May 2026 12:05:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>, linux-i2c@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, jk@codeconstruct.com.au,
	andriy.shevchenko@linux.intel.com,
	linux-arm-kernel@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH RESEND v29 1/4] dt-bindings: i2c: Split AST2600 binding
 into a new YAML
Message-ID: <177869190656.1316879.13816659240778800181.robh@kernel.org>
References: <20260513-upstream_i2c-v29-0-fe9926964d55@aspeedtech.com>
 <20260513-upstream_i2c-v29-1-fe9926964d55@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-upstream_i2c-v29-1-fe9926964d55@aspeedtech.com>
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


On Wed, 13 May 2026 13:32:00 +0800, Ryan Chen wrote:
> The AST2600 I2C controller introduces a completely new register layout
> with separate controller and target register blocks, unlike the mixed
> register layout used by AST2400/AST2500.
> 
> Move AST2600 I2C binding from aspeed,i2c.yaml to a dedicated
> aspeed,ast2600-i2c.yaml schema.
> 
> Besides the split, this also adjusts for AST2600-specific requirements.
> - require two reg regions (controller register block + buffer block)
> - use clock-frequency for bus speed description
> - interrupts are required on AST2600
> - use correct DTS coding style in example
> 
> No compatible strings are changed.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v26:
> - commit message: include details of changes from original binding
> - fix example property ordering to follow DTS coding style
> - use consistent "AST2600" naming
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 62 ++++++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml        |  3 +-
>  2 files changed, 63 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


