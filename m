Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421A8D609BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMLDB3ZAy0heGshb1usPj/zo5r0+rneIo+qRSkekrLg=; b=SF9kDHMxDkUVVqDFcxIqXVYZYt
	p0wBXxG7CwDOPUbLNSyxdMys6jPAg9ELZQM4oh8xPKq1T9VaLMkNUgVf02WCyPZV8z4bpFv2KCCZi
	TACJYulYUMPez1+Gb2GKPiok6acfekD3U9hkTdyUfn0oxfjlwjVTcAV9xCHafmsqNG+AGVNw8YnVN
	XEvtvnAByHoQYcC2s4gapYGegtTqj+H+xkhxdyd4kdyvl92XVe99WdcGW4DP+pVuo4iw+mP9pUKbv
	Nh8sXxB046T8P+itAClRRHSTheEMDL2Y76HW0lxbL9Ti+Yw/90fQYUBQGhClRDlVKfpGdgbK/H5YZ
	Sa7VCneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYC7-00000005YUj-3Gyt;
	Tue, 16 Dec 2025 16:46:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYC6-00000005YUb-15GZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BF446017B;
	Tue, 16 Dec 2025 16:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A850C4CEF1;
	Tue, 16 Dec 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903597;
	bh=UNSRNeBiaj3Rry5J7rpo+9jk7tXOJzVaBHlmdHHL6GQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aMz7uwpDOS8jcT7ByQo/F0gSxOsvd3ADD8dn4twiU3VojJjZqFs6Cliu1+bbKhuFN
	 DWT/B4oPIjpJqLuuyVLw+IPFazTOgHJqF627ME1nKW3tk6LU0mcBh2qNgDCmBGWxn6
	 2HzNigE1thZRsDbMRwI7IIXOtcHa+ZwMZkhTXESFX5x7BpIP3xeqzObs7kDdSvurWh
	 dU69Kkj0RwfHiV9KVz61JOQjtW58Bg1gLQOTdmHqgX5eJfNUcln8+IDemVDOcn9/h1
	 4MV0UExndT1dZ9UoLsNGm9VEjELK9LXeaXVt3PgoUzzFYctdxxq6fQRwU4mtIUf4p7
	 8TAVib8cccv6Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Erwan Leray <erwan.leray@foss.st.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251215-stm32-spi-mp2x-dt-updates-v1-0-464a5fd20f13@foss.st.com>
References: <20251215-stm32-spi-mp2x-dt-updates-v1-0-464a5fd20f13@foss.st.com>
Subject: Re: (subset) [PATCH 0/3] spi: st: add power-domains on stm32mp2x
Message-Id: <176590359301.183097.12758319202580831902.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 16:46:33 +0000
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

On Mon, 15 Dec 2025 13:26:19 +0100, Alain Volmat wrote:
> This series add the possibility to indicate a power-domains for an spi
> instance and set the related property for all spi instances on
> stm32mp2x.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: st,stm32-spi: add 'power-domains' property
      commit: f4acea9eef704607d1a950909ce3a52a770d6be2

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


