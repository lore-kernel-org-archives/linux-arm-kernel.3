Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CAEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjTpjO/eAAujXffRyUSyF8un0MfzSAvVmCK7iBS8208=; b=vNuoO49iiqJLZ5r7dQntmAS1YZ
	zvggHnm0i0Ad4Ut40xmB+d6KZex6C/SMWHrn2dGggX8CQjPh6RqmV651MsFs77cb8pbmWxasfSo9F
	uIyxfHF07ijs43YWu+roqvK/MfS/MbKwjCRHYlKTEa9wfxB0Acp2FT/ch8JbcS12WZ+2rCSXwga+p
	+jLRVL6Obesqf8+IdD+BemDLxS3T272rufp6gyVITRjRGWHsxp0ZQNk9S4AhWJDgT8SWb4BnBGt34
	kZO560H6YkjKKp+6YGr0eKGvAyo3Pu2h/h6GoOZldTNl0Xq23X383FE+zUPvzmJ1TDN6mBaGiYlAj
	gV8VG3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAxU-0000000DdpS-0s73;
	Fri, 28 Mar 2025 14:45:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyA03-0000000DTSz-3ksa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB7425C62ED;
	Fri, 28 Mar 2025 13:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60BCC4CEE4;
	Fri, 28 Mar 2025 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743169434;
	bh=ul/qEY26VKNyougTofT/6PHrPo6+tNe7ZZ1BlHAgJNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eWiVe1Jfqjym650rfl44EBMdv58+aYsdeSS/MIbcrMVnTDSoAeCRSNEOMYYSFKENm
	 Xd/G1tYkgon6J4UFQSphD7SXSLRs1IZKC5GwJcwvXorvNrooYNonImw+z9cguYn/Y+
	 qoQYBxmdsiKwqXnSV/PcebdLje1m2Pr2KDoJ4DErCNnr+yPy2B8BIRMQdRz6LN2RJh
	 vqX1FV1eqD5xX5N9AM9Wa+hwiohOtDXEPpVo+b1bxt9SXuIQpFmvB5pbD/h6X2dBZe
	 HfudkBrVZA7qgzBAgyYZGK38JEnNg0bzHWyIuIrwuVQ8Wo0nm5OC2zg3DMbcfZ2ToG
	 VuAMTyDhwxuJA==
Date: Fri, 28 Mar 2025 06:43:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] net: mtip: Add support for MTIP imx287 L2 switch
 driver
Message-ID: <20250328064353.33828cd2@kernel.org>
In-Reply-To: <20250328133544.4149716-1-lukma@denx.de>
References: <20250328133544.4149716-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_064355_979576_55D5CE1F 
X-CRM114-Status: UNSURE (   9.11  )
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

On Fri, 28 Mar 2025 14:35:40 +0100 Lukasz Majewski wrote:
> This patch series adds support for More Than IP's L2 switch driver embedded
> in some NXP's SoCs.

## Form letter - net-next-closed

Linus already pulled net-next material v6.15 and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are currently
accepting bug fixes only.

Please repost when net-next reopens after Apr 7th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


