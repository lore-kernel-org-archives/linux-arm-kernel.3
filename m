Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7025BCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpSLT2lSrMjS4/nGQtH75GJ4kKaVq8BW7kPNmkIy6Do=; b=hckTGk60UB2qDIiLyeyHKN3kj5
	0ZQ2wQ3itevPYgHhsfljN9b0BS2Q6LiXSC5qZ3ilolfyxQRvtvEh4obDulL/SK8lp8LHHYzYGT7fo
	B8H0CV8+jUOfmhquRD9B0Rco05ORnvrS6ETx9KMs5mHpHSAolCww8wjB5qF6+6snB7abkW98bu379
	01T14rWCjAE3TAoAh9AxT8YGsT5KfbFj5R+yNjR8BtcPMmsowKOwL2aKzrCHIRKzwcaEaTVH48l7M
	AOlSpSeaOyjFDT1De7BDmUSeqsorjiABYjfajA/tS2Y7awl2EtBY4/5vkHu2USG1+XdF97CmFiJAR
	JZoQY2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiWq-0000000GV4b-2HHS;
	Mon, 05 Oct 2026 13:14:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiWo-0000000GV3E-1tyf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:14:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E456C431D7;
	Mon,  5 Oct 2026 13:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DF81F000FF;
	Mon,  5 Oct 2026 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791206089;
	bh=hpSLT2lSrMjS4/nGQtH75GJ4kKaVq8BW7kPNmkIy6Do=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=boaxELM5M33wQiy9MeUeyqB4u47btEKyfc8fvzYNQXp/wZMGAtoUJrn882/TkBady
	 OzJ9RBIkOi1UoXKgdS1ljas6O0UKZd9Zd1t7sSqC/JWg7KJQ5wKMzke9eg3v0VIosV
	 RC4KOEwE4EYaMKebV07vIUFU6gs4nHd0rqX6bziX0/EIegVqYQJ5Y/iwF85+E0BIlM
	 44W1QBfxCs5pxmYrEhPT1aYVChmjeJunLxXLon/f1WWpCMrQbnMW8a9iUeMU6kTpyt
	 aU6wDAtL+lmOqzfGZaQTNIQAMlmHRQaYYkjsYcSoXGo2i/a62m8rMWze3Xzueuiwt5
	 YAS7PI3WganOA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cwweng@nuvoton.com
In-Reply-To: <20261001131818.110028-1-cwweng.linux@gmail.com>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
Subject: Re: [PATCH v2 0/3] spi: Add Nuvoton MA35D1 SPI controller support
Message-Id: <179113436271.150114.13644699403660836731.b4-ty@b4>
Date: Sun, 04 Oct 2026 19:19:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=broonie@kernel.org;
 h=from:subject:message-id; bh=c3W0MtA/up0SF1z54fsxCnhLZJH3fgMdhotoyG2wMMU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqw6LEaotzfh7FggJqLqVaFGNDZlmO8pDGEFZ8J
 n10psG9K32JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasOixAAKCRAk1otyXVSH
 0IGkB/9HT8jswSIUFZFJ6w20SnmIJQ6qo4wJjs4mluglo82p0SrulzpmulGBZ4OfvATp3H+9TnZ
 pDpnHO1NrCi+YKkOysf0KrKOJAGyHz0Lewdk7S9neoYkcF0H/0q9aD4ZmZlLsYq2ad3OMXHpSR9
 sCpaWd8pawiZGX/CaaQvvGla3XGjsXKeFzpNB+xg19vbjH6brcfSfZffUa0ZKIbprCLh0wQUnwN
 AohSBpe/hsZSVNPw5FwaFsF0Lrtu3hCUBbK0/Ba0my3KpIpItSqnDkiU0RPlpu0wXw/wDDOA4iA
 eyW3L8RNjT3z6ERj/kzqy8mqMtwIN/EIYozXMFKOANBPKDcY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 01 Oct 2026 21:18:15 +0800, Chi-Wen Weng wrote:
> spi: Add Nuvoton MA35D1 SPI controller support
> 
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> This series adds support for the SPI controller found on the Nuvoton
> MA35D1 SoC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/3] spi: dt-bindings: nuvoton,ma35d1-qspi: Add MA35D1 SPI controller
      https://git.kernel.org/broonie/spi/c/1cdbe8d7c228
[2/3] spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
      https://git.kernel.org/broonie/spi/c/dd3fb3b25952
[3/3] spi: ma35d1-qspi: Add GPIO chip select support
      https://git.kernel.org/broonie/spi/c/8767f4599551

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


