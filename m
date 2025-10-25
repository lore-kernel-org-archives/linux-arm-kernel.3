Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0847CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCUq2M25KYTWZDzntwaNXgEoTEDf7kYbZ48Ei9aFjbI=; b=RpCq7VWyPvG5qz5GOASFaJEkok
	YEFkGWbXK/gFId+ycW8iBK22YiCKYE2IpCZsY9VuTbIygDR3hYxrIzcNJZv3hYBRPKaeaqpfFTZL+
	7H2oannEq2QV2gLVbFk7+XDLfl5jNFWJdgSLi3oii1V8HD3YJyDNoo+nK/C6CNPmH6kiTbQesUMBn
	TtoSOqcW8A9W5Znj4Ugom+xwXapQcHTxzxCcyLHW1gZAgOKbJPkiwKduRpvFYSVuKGNdCQWGKQZJ9
	wtK2Lf7K81Ntn0bn1TUEenAHaPjT6/BHVsQW3RWvSgNyZihsCcCMwMJdOSRzS5tKBWir0u3P5aRZw
	CBHXwvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRos-0000000AhHw-02ax;
	Sat, 25 Oct 2025 00:07:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRop-0000000AhHd-1YPL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10E0D43723;
	Sat, 25 Oct 2025 00:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0AAC4CEF1;
	Sat, 25 Oct 2025 00:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761350857;
	bh=YywZU5wTB4nYHlRvn5ywrvSbODiPXFC1hF9SDgRtOvg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dn65njhfKU//nSpM/HdwU4tKL08l32hcuHzuixi+aBjD0gC0PTsaeWd89QTMAxRuk
	 cYp4Z2YrWrf6mPug22Pw8wBWAtFlLxcLTc5PHjUcAbZrgzYRFdAE4B5kBuLgdRaJ09
	 7V6O9idDND4QHFCif7dq/1igfsRQUwHEHRrzgJkkc1yml8VmhneBL/3j4U/ed2rxP+
	 z9yZau0MEnF3O8sico76jw2wQ7y1O54w8wvJ0AZmjB+HUtvaMqOS3Tc0MctblnfsL0
	 ObUnghY5cwYOW9jj4YRRlw7KmRIPHY+43lXpwvc+S7qRmpJIN6lu/pgmp1eDvdD303
	 4RrDLb4fd9xjw==
Date: Fri, 24 Oct 2025 17:07:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen
 <dinguyen@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthew Gerlach
 <matthew.gerlach@altera.com>, kernel@pengutronix.de,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Teoh Ji Sheng
 <ji.sheng.teoh@intel.com>, Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>,
 Austin Zhang <austin.zhang@intel.com>, "Tham, Mun Yew"
 <mun.yew.tham@intel.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 00/10] arm64: dts: socfpga: agilex5: enable network
 and add new board
Message-ID: <20251024170736.1098eccd@kernel.org>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_170739_450390_8BA09038 
X-CRM114-Status: UNSURE (   9.37  )
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

On Fri, 24 Oct 2025 13:49:52 +0200 Steffen Trumtrar wrote:
> Add an initial devicetree for a new board (Arrow AXE5-Eagle) and all
> needed patches to support the network on current mainline.
> 
> Currently only QSPI and network are functional as all other hardware
> currently lacks mainline support.

Please split out the drivers/net and bindings/net patches to a separate
series. As is this is unmergable to any single tree.

