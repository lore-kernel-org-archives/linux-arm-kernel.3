Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0844BC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2TgS3cUwMsFSczIP+f0XZf0Wu7MoNtnVXcxk06MSaY=; b=h/rp7XHFxhCdF2yZAdS7jUblr/
	qI2VdEMVzAyEGb/NPRWm3WhNP49vurKatpIn8cUcdgeY+EMDY9CLHQMEaa43kRh6vPCliBD4ndJSd
	TrIhngo/yAbyLI1yB20D6/v/PCAwmQtrERIB+DpU1QchTUlb6fXewujePN/bWgCuEYM7emxiEZxAq
	FMImjpwaMJ6729CInpwLO31EAIzxdhzVhcqNw/mjlPMn/DD94qeHUtBqmiUCxJFsK/Dz7EQ+ucmY6
	lEfZ7ICzIRIimCjtgKMEDi//SEiPyy8K+ddYsmvgrv9ad8e2IXwtUh9tpHtI/dnY7HpECsUMnq0Xy
	kCuasgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwv6-00000000axX-3otg;
	Mon, 21 Jul 2025 20:15:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwpE-00000000a1f-11Lf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9980A5C6202;
	Mon, 21 Jul 2025 20:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3ACC4CEED;
	Mon, 21 Jul 2025 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753128567;
	bh=0tI7Ckz46vRExgHt7/KrtPSDrZcdVJNbVoF8HN/Bt+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLNm4FZ5DqGkI0BU+e1MbrutQHnfbD5PddxRwA7qx8WwP7lB0AdvIUP/ThYm8iPFN
	 SzXrVa8azY5hs/h1p1uGNUckSDkGI+j5pLuDgpF1xTD27zOPveIAn/U3TNhXOWxkLh
	 iNa+jVUmuI78lSAg9urGHTuq+UnDFppKmiIM3TgHmxCbNwxN4OAcF8blVRSMn3Q9s2
	 XdaY67ZvK907ChVjCXl2eRgw1fNC/xfInBrQmQYfBSlo30m6JyPTesbV1rgE9LbDoF
	 a2gUXEOWrFnK/RNCSniPEmuDVSgcZIEkvoH+3R7565JMM81xzjMZ8u4JVPdN9I0rkv
	 FLJoxRcsCc4sw==
Date: Mon, 21 Jul 2025 15:09:26 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Le Goffic <legoffic.clement@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 05/16] dt-bindings: memory: add jedec,ddr[3-4]-channel
 binding
Message-ID: <20250721200926.GA1179079-robh@kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_130928_367212_6C61B712 
X-CRM114-Status: GOOD (  21.99  )
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

On Fri, Jul 11, 2025 at 04:48:57PM +0200, Clément Le Goffic wrote:
> Introduce as per jedec,lpddrX-channel binding, jdec,ddr[3-4]-channel
> binding.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../memory-controllers/ddr/jedec,ddr-channel.yaml  | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
> new file mode 100644
> index 000000000000..31daa22bcd4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr-channel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DDR channel with chip/rank topology description
> +
> +description:
> +  A DDR channel is a logical grouping of memory chips that are connected
> +  to a host system. The main purpose of this node is to describe the
> +  overall DDR topology of the system, including the amount of individual
> +  DDR chips.
> +
> +maintainers:
> +  - Clément Le Goffic <legoffic.clement@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - jedec,ddr3-channel
> +      - jedec,ddr4-channel
> +
> +  io-width:
> +    description:
> +      The number of DQ pins in the channel. If this number is different
> +      from (a multiple of) the io-width of the DDR chip, that means that
> +      multiple instances of that type of chip are wired in parallel on this
> +      channel (with the channel's DQ pins split up between the different
> +      chips, and the CA, CS, etc. pins of the different chips all shorted
> +      together).  This means that the total physical memory controlled by a
> +      channel is equal to the sum of the densities of each rank on the
> +      connected DDR chip, times the io-width of the channel divided by
> +      the io-width of the DDR chip.
> +    enum:
> +      - 8
> +      - 16
> +      - 32
> +      - 64
> +      - 128

This is duplicating what's in jedec,lpddr-channel.yaml. Refactor or add 
to it rather than duplicating.

Is there some reason regular DDR3/4 doesn't have ranks? I'm pretty sure 
it can...

Rob

