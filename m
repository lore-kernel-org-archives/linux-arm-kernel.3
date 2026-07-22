Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CB7C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPjciZgu6lIAEUFV6/Ka2KEfnA2GxcOi/d9Jo5kmH/M=; b=Hv+2e1vnF3c+XuNVe4IWCFYzS9
	EIJqnkxTgGC7i6jxr0cXcJulGkKxrVPONFmR0b2Ilg7Gapx90cF8HlOKFR4bbI0PSzUZP4Oz8GqbZ
	q1fBMUauCqRQHaKuNjCrNrFrLPAuEqMxSdkJ1+J4JoM6n/rI1X15PBdpB+8RA2Cfw/rwWrwpkYKhl
	B7oxcKrd8hjCydM1UAFZEMpRSiEdKja6boGG3/jZdc1mFgLBXhfF9Zk+538DqJ55i0x9JB7UnZayx
	LwUVSRlbbqfvcWFoq3lsUyyBkg0KRLvl6Q9PIOA0UuWom0okD25hbkJSo4kVRlJz4eauXUY8LIiAB
	ypPgImPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYno-0000000C8y3-3fmk;
	Wed, 22 Jul 2026 15:24:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYnn-0000000C8xf-021s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BF0E600AB;
	Wed, 22 Jul 2026 15:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C211F000E9;
	Wed, 22 Jul 2026 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784733845;
	bh=EPjciZgu6lIAEUFV6/Ka2KEfnA2GxcOi/d9Jo5kmH/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NznqlKVcbnI5yXI0tPxRHoYPbEq02xDWAarChyV/EZhc6njhQN0757P+csA/GPdx2
	 28frovJhXFnC/3oesqAe62Pzt+CXMWzfLxpDjczPQBWmklAqwrOAH43de87I02MGf5
	 +fykRtDCiwcunahouDbYgHsYrNmoldyOfPNhkPBcOyP2Nog7R35uG9Q0nAaB0w6aag
	 tScpfVlUSm2iaOFZarMpMF8eCYcCAuReUGvht5am6Ah+qkaUCtEnnc3GVj+TmnBtKw
	 W+xY3MWg8trvuEQaW/+7/snNl+E4ra800Lug/mw/GOFLzCjLsJGXXKbxEnLetZn9y3
	 hLU5RRDwZoSMg==
Date: Wed, 22 Jul 2026 10:24:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: clocking-wizard: Add
 static-config mode support
Message-ID: <178473384283.951931.3125163724375199734.robh@kernel.org>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-2-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709111403.1579159-2-shubhrajyoti.datta@amd.com>
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


On Thu, 09 Jul 2026 16:43:56 +0530, Shubhrajyoti Datta wrote:
> Static-config MMCM/PLL ratios are fixed at IP build time, so the kernel
> cannot read per-output multiply/divide from registers and needs DT pairs
> to register fixed-factor clocks. Also add the tuples by pair in example.
> 
> In static-config mode the IP exposes only fixed-factor clock outputs and
> has no runtime-programmable registers, so reg is not required.
> Make reg optional for static-config
> 
> In static-config mode the AXI bus interface is unused, so s_axi_aclk
> is not required. Allow clocks/clock-names to have only one entry
> (clk_in1) when xlnx,static-config is present and enforce two entries
> otherwise. Update the static-config example accordingly.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> Merged the similar patches
> Allow check for current dt even if it is unused.
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml  | 53 +++++++++++++++++--
>  1 file changed, 48 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


