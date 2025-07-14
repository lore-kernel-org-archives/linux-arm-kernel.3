Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B12FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtxXcDCqfiGII0Xf9/UXqR9nqnexrG5WzyX4OINKMY4=; b=Q3gC+YnCN8AdAjtJ54aA7nn49F
	qfBKCaTSFFoBj/iIe1iBr6BD8Q7bs0FWhgjia2X1N1MlDvR0DO4dxVfhNcbqt7Yfz3j9IjUNI2Q46
	8/oKFk5rR7BZkisaYZh72SboclYTXCFGPM+5KwiwfBtqGsLHg3Yp1colBswN7R2qNaW2+R5LfQEHQ
	FUvS6dDHElETNVIqwgoFaK6vWjzUyCt+etQRfInxQ6ra2a06igebx5xiJdzFgXtH79GPlPAlGIzAp
	hXjsKpQiXGHJ36VGMja2W2toeG8MvtDxJK4I+OIfHfcLsxEdV4BtiJNyoysZsPEluumg/XTw3xq9w
	xG/XGvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGZD-00000001vQf-177k;
	Mon, 14 Jul 2025 10:37:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGVG-00000001v6v-3asS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 10:33:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 663EE4403D;
	Mon, 14 Jul 2025 10:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B13C4CEED;
	Mon, 14 Jul 2025 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752489225;
	bh=SWVRq9s8qi4vJBJhqL/e4RYaOr864sv/OrB9hMLrPRU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fsheUnp8PcWtoHD4n4iByTCF0+zkJyNJoOSR9CqUIgZwegpP1OvJD5XY5YhXFL0rF
	 C/v3rr28VzO4eWGcz5DwxfY090knqgTsRWL1b6wsVYjeHR44QWVUsm9kNQ9AfhMnUz
	 vhu3bGMrqqQjCcWKZ5/I3DkqJCFgrFNM/x6W/aX+bOO6kBzB5IKDyMXF88or3UzvV1
	 1ajGThnWfNVIimAHj+pfBASJrDXjWwoBXHwNImGC1tbkz64Ooh0hOgj3rEC6wBrWU6
	 PVSKAEpxT5oUa2ntL1oAKRb0UqkhbtwEXNDCid/L/tyewT/9NvON99OGN5iBJzNfn2
	 69HyLmi/jyc7A==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250703183537.2075746-1-robh@kernel.org>
References: <20250703183537.2075746-1-robh@kernel.org>
Subject: Re: [PATCH] spi: stm32-ospi: Use
 of_reserved_mem_region_to_resource() for "memory-region"
Message-Id: <175248922378.18393.12584887132414171200.b4-ty@kernel.org>
Date: Mon, 14 Jul 2025 11:33:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_033346_920651_8581261B 
X-CRM114-Status: UNSURE (   9.82  )
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

On Thu, 03 Jul 2025 13:35:37 -0500, Rob Herring (Arm) wrote:
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


