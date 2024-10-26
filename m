Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BC0D10BE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 06:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBuPIS6+ZQ7QZigY7In18BLl6WbtmuNuTaKGdqh3q9A=; b=f/MTHEPfYOf7bdiKz5IJUzmnpT
	X2lRubrLE2/2fzfCppJZBlDrWCFs9KyLLg+pWQwCelVCh1QQGk7E/3jnxNcObdTfFm9DmCFz5YA4K
	S60Ut8PKPNsHROE/+rAVSDwWsWX2h67d1UdYEm5iBRa37s/ldM9flgTSq9fx7ho1Bsi+gxlsrhL1f
	qDoaQIG/u75F1DPAxLlE2UvxEeAZmu1HFdc/mdO5NrpE1lUpV18mCc0JjX+fKs81whZFuMBmsod/3
	zyuBv307PaYyQeNIb8K46ol2fTbl/kbk23+o0rm5DicuIFBCqWsCYzGhXfgoObKNiFdn0L968bPYW
	9Ig0NoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4akt-000000064ol-1qH6;
	Sat, 26 Oct 2024 06:58:35 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ajJ-000000064ed-01Tf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 06:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hBuPIS6+ZQ7QZigY7In18BLl6WbtmuNuTaKGdqh3q9A=; b=ITmC0Ex5SrggdQaW6YOKb7Ora3
	p065txEO3fe8zaxUEzB5syDVDlbkMR897dUbcChSfZQOwwy4906+9/FfcphK60ZHtIuQV8Q3bR63c
	l0F2gn65gYMhLtcg/PkyJK58jMWKzqIsPPosDFrvf3Ohg/ckfoSSwTlssTxBKO6n7V7Oe8O3xdzLb
	Hb3CsvfKC+05bCSherBbM7MuEM/z5oSndRf29XPga+Jx/4O9XMt40PLWLNHvk/7ZhlMZnjAY4Hhq5
	XPWZR4yTfg/BtcYeGinVgh64SBE8rspzFSqw1tn7WQyfZfXDzuWAifFiNCAfjpCIjSDlXifM0jrTk
	qACFhdxA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t4aj1-00CFy1-0p;
	Sat, 26 Oct 2024 14:56:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Oct 2024 14:56:39 +0800
Date: Sat, 26 Oct 2024 14:56:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lionel Debieve <lionel.debieve@foss.st.com>, marex@denx.de,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add support for stm32mp25x RNG
Message-ID: <ZxySp0kkUinBPhjD@gondor.apana.org.au>
References: <20241016-rng-mp25-v2-v4-0-5dca590cb092@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-rng-mp25-v2-v4-0-5dca590cb092@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_235657_068268_ECDBB759 
X-CRM114-Status: GOOD (  19.43  )
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

On Wed, Oct 16, 2024 at 10:04:17AM +0200, Gatien Chevallier wrote:
> This patchset adds support for the Random Number
> Generator(RNG) present on the stm32mp25x platforms.
> On these platforms, the clock management and the RNG
> parameters are different.
> 
> While there, update the RNG max clock frequency on
> stm32mp15 platforms according to the latest specs.
> 
> Tested on the stm32mp257f-ev1 platform with a deep
> power sequence with rngtest before/after the sequence with
> satisfying results.
> 
> Same was done on stm32mp135f-dk to make sure no regression was added.
> 
> On stm32mp157c-dk2, I didn't perform a power sequence but the rngtest
> results were satisfying.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in v4:
> - Changed the restrictions on clock names per compatible
> - Link to v3: https://lore.kernel.org/r/20241015-rng-mp25-v2-v3-0-87630d73e5eb@foss.st.com
> 
> Changes in v3:
> - Add restriction on clock-names some compatibles
> - Use clk_bulk APIs in the RNG driver to avoid manually handling clocks.
> - Link to v2: https://lore.kernel.org/r/20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com
> 
> Changes in V2:
> 	-Fixes in bindings
> 	-Removed MP25 RNG example
> 	-Renamed RNG clocks for mp25 to "core" and "bus"
> 
> ---
> Gatien Chevallier (4):
>       dt-bindings: rng: add st,stm32mp25-rng support
>       hwrng: stm32 - implement support for STM32MP25x platforms
>       hwrng: stm32 - update STM32MP15 RNG max clock frequency
>       arm64: dts: st: add RNG node on stm32mp251
> 
>  .../devicetree/bindings/rng/st,stm32-rng.yaml      | 28 +++++++-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             | 10 +++
>  drivers/char/hw_random/stm32-rng.c                 | 76 ++++++++++++++++------
>  3 files changed, 94 insertions(+), 20 deletions(-)
> ---
> base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
> change-id: 20241011-rng-mp25-v2-b6460ef11e1f
> 
> Best regards,
> -- 
> Gatien Chevallier <gatien.chevallier@foss.st.com>

Patches 1-3 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

