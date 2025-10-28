Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AEACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsFGdcGHWsIjU0ZjZns7J8dDiN7/XGaIzSulkmNJ754=; b=ymXvBpS/8aWJD0ZePcpwVseP0S
	K8QgFQ+wqeGVplQ8ZMY7W8WnWMinJUnxDbYxiGlNGsKG1rklIR116FSQi0VY8pSJOnPUtJVquvU4E
	zQQjGGtdCkmUGFtzoCunHBOcsfTOrOibLwFIzoS/7vitPv3H8wZh7tCubXKsTHfUWhEPefoDCxHdO
	vGSvaO8Kj+R1g2iu8IFZ0zEqpEDMJYxLH6KU9PH88MqJZqsZvd/m3naG0V/vor5kS/l+nT36uttSD
	BqeHemKb3g16ppc5LzbY6bcqNtJgoQD8WWLeTp4YXHPQ/r440KYcI3HSXFoRQEAeiQlZCUuHBGSxb
	whl4tGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnBN-0000000GNhK-0fdm;
	Tue, 28 Oct 2025 17:08:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnBL-0000000GNh9-2lbG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8EFA602B3;
	Tue, 28 Oct 2025 17:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416F7C4CEE7;
	Tue, 28 Oct 2025 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761671306;
	bh=9eUztxr0c5bs9J7IDIf5az3dpnFzy5BKhJ7flVcVeA4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G3aAavwgwh9gFQLPVh9gLVrbNzRS7vPP3F+iQSp8h7oFGi/a7/yqzJfeel5KMYXsZ
	 KpuDQ0bMz3eRPrsH5hF8bxUgyVuWDZNiuBNnncLYHSskrhU59hpxcbMAs+U/ORnhX4
	 cFViZ0VLpddZJri4lwfTgaoaq4GFjJGin85kOhI0KI7y7XOJdonF9+NA3m+S/rmAR2
	 epCaae+HjNGigmqsb/lLq2jpIbwTzqpg6XVZFmtN6cCesFNPM5hi66tA7KMBQTlYmr
	 iYkt5jKvntMutcqKZt55xBvRKamuIEdVWHAWSULx5ePb6CUpiIn24DYPseHSvXgE53
	 v8MIH7c1UBflA==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 7E3F25F863;
	Wed, 29 Oct 2025 01:08:23 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
Subject: Re: (subset) [PATCH v2 00/10] allwinner: a523: Enable I2S and
 SPDIF TX
Message-Id: <176167130349.1161173.2622009044232312995.b4-ty@kernel.org>
Date: Wed, 29 Oct 2025 01:08:23 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Mon, 27 Oct 2025 20:56:41 +0800, Chen-Yu Tsai wrote:
> This is v2 of my Allwinner A523 family I2S and SPDIF enablement series.
> 
> Changes since v1:
> - Collected tags
> - Dropped clk patches that were merged
> - Added patch for SPDIF pinmux settings that was missing in v1
> - Dropped bogus change to DAI name in SPDIF driver
> - Dropped clk rate message in SPDIF driver
> - Switched my email to kernel.org one
> 
> [...]

Applied to sunxi/dt-for-6.19 in local tree, thanks!

[01/10] dt-bindings: dma: allwinner,sun50i-a64-dma: Add compatibles for A523
        commit: 697fbb43aba6dae48cbe5e1fa0d3023a0b12ab73
[05/10] arm64: dts: allwinner: a523: Add DMA controller device nodes
        commit: 55d43ef77712e3b7fd4c3db5715be1f405afe31e
[06/10] arm64: dts: allwinner: a523: Add device node for SPDIF block
        commit: e51b773798ea1dece229b44854256ec38d35cc41
[07/10] arm64: dts: allwinner: a523: Add device nodes for I2S controllers
        commit: 1fe1e9b67166e304e8c3e46bdd1104519d6d1bd7
[08/10] arm64: dts: allwinner: a523: Add I2S2 pins on PI pin group
        commit: a9050236f81c43fc2eaa2e13098c7fb53c3aba34
[09/10] arm64: dts: allwinner: a523: Add SPDIF TX pin on PB and PI pins
        commit: ae0d3f1e6dd2c6404db2fbd7556b93eddd6c87b8

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


