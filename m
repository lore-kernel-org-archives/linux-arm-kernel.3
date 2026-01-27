Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF610D2F002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCAl3SXzA7e6M/NAQATKpjRJBfyq5LG2WTtHOBQor5w=; b=qdB/XBWuabBFJAZxvFYbFhdbGY
	FShbGL4yzUmFmD8zYzo3La1voFNLTn/ysH7Ov6IQVJIYFk50vcN49cQIpRzPRc3XZk6DAo+Heikbb
	ovI+wD4umgWwABFBIzprtW0Pp2iiavmXNs7HNueop1oBg9W6Rz4MvXdH+s+zg53HRZdw3iyK0CmWL
	hGqAMt+UgmJs09OInVht4n6k8KT+0UtmulbVqyAQMPcQhvQ3L2pqxmffPNKuHbbp5w1/lUaiac589
	M5aelzfc94bqhX0uNLNUTk6W3oR4JUFl15dmH9eCRNzLgtLtHRCGqSl47XgEdpsjGztmv6+WJZjqa
	iSVvv8BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhsf-0000000ECu2-22if;
	Tue, 27 Jan 2026 12:09:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhsc-0000000ECtP-0PQW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A67E60007;
	Tue, 27 Jan 2026 12:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A93C2BC87;
	Tue, 27 Jan 2026 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769515748;
	bh=+zruV0gDKWApjNTlJT7dgyYGbAZ9dVb3+dt9ei8uAN0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jHL5SY2VgWzFxw8WQ0QgYC7bxRlseY3GJjdBU+RdFC3yik/IwyGFqFcQGX6ntHQ0m
	 QyoxIrfGY07O/wjSh7A+HxjN/ne2V4ps4/n4TIJ6bH3l+/fHFsXRJI9/SLvN0ZhXup
	 Gfp2A56AqqEYL//iPS+Pw6xTgQmdS3zHHB26G5Oj9Ju5a8Ogo6DVyCX0u34gtidFZQ
	 q9FtU/P3NGkrn6BQYtQOte1gV3NCL6ZIcuaCRN4Iw+z130UOpMyjMnHtB4PFbpi04j
	 5i7jRhsJ/E6h2Df05nU3pSycPCDGOTfBufe6Ck/Wwp2wkL0uXM8IzroehdMjLI2J1H
	 YpfJXmYWDiLnQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
Subject: Re: (subset) [PATCH v2 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM
 board
Message-Id: <176951574553.80702.13998029904704503397.b4-ty@kernel.org>
Date: Tue, 27 Jan 2026 12:09:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Mon, 26 Jan 2026 06:55:35 -0800, Laurentiu Mihalcea wrote:
> This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
      commit: f80bee70b1938f904d0b12783044d5eebcc6879b

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


