Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147B7D31769
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9IpN2FXIOCb/O9tDGTNVg2KhD6troiSDWiZCaqtbaA=; b=mffHLmGYSkOLVmyF+4NY47iU2E
	BpPA1Q7wuF/HG5RYeEJno1eVPpp/DpU1verRJw4+QyxbD2oLHt7qVh7jJAW1Fxu7osaMzFJgBdKW4
	/eoYGDsNr9P9v5VjRS7irlLIkbj4jzOzhLE0O1RoHb3CA5iYSWfhCgOUwyo5Ck+xWO/klbJhpxCr6
	nltoXf2DdUm12bRfQF0yq1ev+idjWIVKSPG0kMoy/+aWmL+G8X0ZPNPIXyJjDKqu/FyQhXsc6MMxX
	3GzAKXzc/oBxQdVxfrrhH4aWBrznxgxDtSuSdXsNumiVuF4k+c7vtS8pDpf5qImafl6NMtdhZrfaB
	YNWela5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8N80-00000000B6h-1LBK;
	Tue, 05 Nov 2024 17:14:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MZb-000000004OG-2sqL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DC255C5500;
	Tue,  5 Nov 2024 16:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED5DC4CED2;
	Tue,  5 Nov 2024 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730824710;
	bh=X3QevZg0rzrXDfQFtVrzDiR/bMaGBDN1CpqsOH1Ja48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aLwZYMYUdbc96SDQl4CZJP7laKG276AROeHoNAb/mbq0JLX8pGH2ErNkqqR3CVg8N
	 wzFnZjVoe4to+XZpY9sJNCkq2NuZWXe7RB+L/RIxQawDz4LpKAaTkQ0Snkp/RocZ92
	 V/JonNjeP1FzhAKY/9P7HCpDQh/8+WkvyZ35K1zzJmsMNtdNDlcPuf0LP39CUwV+Bu
	 vb09gWYSP1T8UGfcjd3qkimmpy3Nfm8anUXei95OTdaq+ceTA+2hAypAq1K2R+2Z90
	 E6USeKTASzsIsUwBQ1cB6RpFrTf+W4JEKSFJS07aA0pLz6ygCAEBzhLvmJHUNIMawB
	 POu5V5s8j3nkg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com>
References: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: fsl-esai: allow fsl,imx8qm-esai
 fallback to fsl,imx6ull-esai
Message-Id: <173082470778.77847.10489834906356614772.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:38:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_083831_806858_A1C80EF6 
X-CRM114-Status: GOOD (  10.70  )
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

On Mon, 28 Oct 2024 15:49:30 -0400, Frank Li wrote:
> Update binding doc to allow fsl,imx8qm-esai fallback to fsl,imx6ull-esai.
> Update dts add fsl,imx6ull-esai fallback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl-esai: allow fsl,imx8qm-esai fallback to fsl,imx6ull-esai
      commit: adf7ea48ce05a6c5c44f0f9d3f81e83e5cb70c3e

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


