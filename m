Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BB3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+atS6SboLiAaAmyEEdq8bklddraU7Lp81BQSyFnHoM=; b=4B7sSuF42wkJ8p/jptbwH8uFXJ
	fSfT+qGqc2YVDIT8RV117xdAehnTXhbfpHDOb2sJx2k6oLDR6+9x2a12y26Nvh/WpTwr722qNjniN
	YlU0BsPzcga3PJCT73rE15jZ0xR0V0W/CKyjB6nYQoLXfUF7RoB/Ypnhu/0wVWIUF90nBn5qUusI4
	R68AvoxtLlDAaoxvP+hpk1lKG2SewNsl3IRcGbUb0iYBH7jR4GpCmPM9P6kEQ8LImCmALuniZ7eoj
	cg/25wa1yNZ1PoH+k2RaSF/sS+iO3cW2UuaI6mE7wbOSX/zEVX5HoibjVbEY8NDdVr1A2f78oe9Aj
	64cA5/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSVx-00000004oT9-3b00;
	Tue, 04 Mar 2025 13:40:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSUN-00000004oMI-3t49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4521D5C5C20;
	Tue,  4 Mar 2025 13:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF77C4CEE5;
	Tue,  4 Mar 2025 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741095554;
	bh=pGtzFJx1ZV7VYljEhRmiQEQlXe0gsXcMJU8mlXh5y94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ua8SHcs2SV+iodmZpHr+I2lQNiL7Q8nx/hQsIFpPEkKsI+ThVMPFCwdcB9dXNAXZG
	 uDap1cIyhLgPtqblVuCjxNze/7l9dmvSqwi/YH+JrW5GDyBdS8w05gmF8oM9eH81nN
	 q9agxYpZqTqHX39z63T5Rut22F0blaOW2rDVTjm12934Wpx5LmmEbVvP6DqbvBL992
	 Glb4vhxmvUsYQzGUkdFCvs//6EkFyZ28dIJeEec9HsE/IuuHkCpC22loh/gwmGk1tY
	 SKzG5n0zQhOoAftlwossYjeDu/mrz2X451FvKhwgfWrXP7AzxbfX6WExThpjAnakjD
	 5NlRxTA3zPalQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, patrice.chotard@foss.st.com
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 christophe.kerello@foss.st.com
In-Reply-To: <20250219080059.367045-1-patrice.chotard@foss.st.com>
References: <20250219080059.367045-1-patrice.chotard@foss.st.com>
Subject: Re: (subset) [PATCH v5 0/8] Add STM32MP25 SPI NOR support
Message-Id: <174109554967.53872.7193131885074327926.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 13:39:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_053916_025691_B2F2FB44 
X-CRM114-Status: GOOD (  13.70  )
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

On Wed, 19 Feb 2025 09:00:51 +0100, patrice.chotard@foss.st.com wrote:
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
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/8] dt-bindings: spi: Add STM32 OSPI controller
      commit: bed97e35786a7d0141d1ecaaace03c46b5435d75
[2/8] spi: stm32: Add OSPI driver
      commit: 79b8a705e26c08f8f09dd55f1dd56f2375973d2d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


