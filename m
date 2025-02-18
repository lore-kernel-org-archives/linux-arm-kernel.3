Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1231AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1hw6gDziFrNzu+B09LwrkyYT+G67r5LGe0BYt45hm0=; b=0sDeBflXbajpN4EXmuaoaTp6fZ
	d5OcN++vVTbwuOizCjimZki+UQ39Y4pTGpUMrXJUCbBSqLVKsYYkRo87XtlsN9e8thewViLolGUoM
	As7uWJIK3L00JfAlZ+VRe0Dg3zSc+KNxpU8Meoowq3IHp3iBYUmnXf+bMM2Id00dyVFiXaCFxxGlP
	aNPb+wrMvAXvUhgCL6TLtsK2Adun3yDBfkGXcTPj6W0hfscUZCoiukPdu9akI4EVsqEDz9fdlbDrQ
	NeYk2uDZuPyxQP2JRJrV4f/dVnH6rGXLtrARMgOex4xYMPCOpk6U2R3JVhFCQhLvqTxKkr+18ovSP
	juWhelhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVHj-0000000A1wc-0RT7;
	Tue, 18 Feb 2025 21:37:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkV2C-00000009y6R-0xDU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 21:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78F3F5C2570;
	Tue, 18 Feb 2025 21:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6D0C4CEE2;
	Tue, 18 Feb 2025 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739913699;
	bh=B9lSIUKtKaBWlF14BOO6dZrB7G6K1Zk063vl/H8dksY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rRRl3Oft5D1yNq8A/9GdXQlhT4a0/layZcEr6m168EFyUt483vukkReL1VrsLfdVW
	 zOO6npRBlyNM4X9gkvxRqfp6wI453gdsRZlmJofmiL8zFsCY0YRhJuey7zQfw9fWFU
	 xogFI9TFgXaaOcQZYVUhiS3aMAEuqHwyWwWSH0Dzt2B5hsdZV/dN0urTVADAhSk6G0
	 V9Ut2rkKOCfMDY7wY1cEm2cEiHavDVfRO2cvjELFHVIb0Z+e80RwGR/n6Z2ptYlHVt
	 r5EzUyJauBdauhOBLVtjpVAvKiMVdxIfXO/TXeUhmiYpot8O+xydOproUw8+D0zbPb
	 GGcv6XBWrNaOQ==
Date: Tue, 18 Feb 2025 15:21:38 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	christophe.kerello@foss.st.com
Subject: Re: [PATCH v4 0/8] Add STM32MP25 SPI NOR support
Message-ID: <20250218212138.GA1092771-robh@kernel.org>
References: <20250218130000.87889-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218130000.87889-1-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_132140_313041_FBBEE978 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Feb 18, 2025 at 01:59:52PM +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
> 
> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
> the memory area split, the chip select override and the time constraint 
> between its 2 Octo SPI children.
> 
> Due to these depedencies, this series adds support for: 
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 
> The device tree files adds Octo Memory Manager and its 2 associated Octo 
> SPI chidren in stm32mp251.dtsi and adds SPI NOR support in stm32mp257f-ev1
> board.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v4:
>   - Add default value requested by Krzysztof for st,omm-req2ack-ns, 
>     st,omm-cssel-ovr and st,omm-mux properties in st,stm32mp25-omm.yaml
>   - Remove constraint in free form test for st,omm-mux property.
>   - Fix drivers/memory/Kconfig by replacing TEST_COMPILE_ by COMPILE_TEST.
>   - Fix SPDX-License-Identifier for stm32-omm.c.
>   - Fix Kernel test robot by fixing dev_err() format in stm32-omm.c.
>   - Add missing pm_runtime_disable() in the error handling path in
>     stm32-omm.c.
>   - Replace an int by an unsigned int in stm32-omm.c
>   - Remove uneeded "," after terminator in stm32-omm.c.
>   - Update cover letter description to explain dependecies between 
>     Octo Memory Manager and its 2 Octo SPI children.
>   - Add Reviewed-by Krzysztof Kozlowski for patch 1 and 3.

No, you didn't.

