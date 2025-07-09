Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14712C83F16
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZBacsAQBX8UWzqVWjMPS9DMvOiMHF6pkbpAf6eXFvs=; b=CzHa7WWF15WcGkXxCo6ZsYyNxR
	EXo/ZfFG3ZYeAdVVQloQY5mNRGe/EslYiTe05nf0NelBYQ9Cfy/0R8cvpUEveEUTVR9PnnV7/hpWV
	Lv80ejMjYTjtgsiS7uxabxP8UsyTqWABEMSbC5xOWKddcPqaseIVFiyVc5kuRuGrzDof0ZILUDc7O
	gsIJv4HcBm4bdRiC3b+HiC+EhPOGVsTTuzmQELvklCvCmo8oLIhRZxjSst8mMR9IJFRlTsddTcRYT
	Wve9j5Z0am7ddJsYnD5fIiX5DdLrfYOFU8r3UI7wAgtvaOxnWw+S8DjVpCAENCzqtSmqr0p0DA6u4
	QSmoCD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFF-00000009fWX-2vcu;
	Wed, 09 Jul 2025 19:14:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWq9-00000009BYj-1vq8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:36:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B872661148;
	Wed,  9 Jul 2025 15:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F52C4CEEF;
	Wed,  9 Jul 2025 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752075368;
	bh=z5R0g5bRaFcE+byBEvAYFxwzxwtN+sL10BzKO0308UM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kJaOkhdxWi9qV5vWcFnJ+JHTiQSlubZYl18mUsLG/pSBYdw+T1NKtWF5028TxIiFZ
	 wZfpISsYz6qDXmz2TI9Vt2XUjIKX936nTToXVpxLwiDoaCgB6R4T9SzqBhHgJFfpBd
	 DUjk1wdx3vSPwyZIM2EFvrhSQPqiWhpnXIU+dEh09EHx2ZObNI3mOIZsCcG9pdYe8q
	 BC4Z5NY1XOLoQTFEXD6LRKGjWkLN/mitCQSJ4wZRDpY40o5N+wT3fnKdwgpqCDUsHx
	 JG9DsmlWMhj+0erNX6r8khQZ4MuvF5NJtd+TeRO4St5FF7gaDqAbNdZh8u/V4dEqHi
	 8bPTgLe8qW+Og==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250709021638.2047365-1-robh@kernel.org>
References: <20250709021638.2047365-1-robh@kernel.org>
Subject: Re: [PATCH v2] spi: stm32-ospi: Use
 of_reserved_mem_region_to_resource() for "memory-region"
Message-Id: <175207536585.695960.5730567147905543825.b4-ty@kernel.org>
Date: Wed, 09 Jul 2025 16:36:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-07fe9
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

On Tue, 08 Jul 2025 21:16:37 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region"
      commit: defe01abfb7f5c5bd53c723b8577d4fcd64faa5a

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


