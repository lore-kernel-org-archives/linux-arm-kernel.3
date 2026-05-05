Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F96FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpJqzpWUly5zqR090DThUi0uytJaPFdWlQrLLHbrP7o=; b=4JIKCRt1gtib3e2WN90rIjNHoP
	DIbEQxkV+3O+HQtPRjHJOYSest2IoGOAy+DVmVQXCk/fs1S0mBD49/ElMb3M7Yo0iFnn+625mWgA5
	KNUu2ZtUcI4li3sJ7KCjf4XJkALIZxy0+WHpe0kThWXA5NJYhAv9JvwQq8hBqgYNTt+PaVNwheavX
	JX/2hvt4VJ4u7qOGKzQR8PN88NAJpFC8XqDHNuMFn9UqKnpJPindst9ZfkGEORzBP6MMmrU91ph/J
	nICAvlpEBzhf0fKSl0ZdH1LrLhrIq3T2fKcnQFNOKkZ3x0a91ccU5OBdkCWp7COP4b5cFpajb53uP
	moDDEMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFk2-0000000GKWV-2KWE;
	Tue, 05 May 2026 13:23:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFk1-0000000GKWD-2Tuy;
	Tue, 05 May 2026 13:23:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBFA760154;
	Tue,  5 May 2026 13:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97E4C2BCB4;
	Tue,  5 May 2026 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987392;
	bh=cefudk32snOl/nbbvFdfp5Vnw/EQCTWqq5PCVaxb3Qo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rkYpK2pRxq7d9ml/8BrXHNIVzBelWfsJF2TH3LPXWtB2cV99dAyBvB8zTqqJXZnMY
	 MzHCKiIqtcRuCca4DVRjOlq24BbpNH8loMORCuNiLuidLcuyfq8fMWYLwVlH+cc+tn
	 7TOhhYZZNerTdS6IAH071Sefz4k1vRepSAf1aO9bFGH+F2H3Vxe3BpJfeTYbAcEsXD
	 UYZiG38zX72VdeyPFbEd9XK6Klt52t2oiZRzQmbjcnVcfw0ZaclgMXLjly2uVhuryc
	 FPcb9uNNExz1rcKi68iJgudygnnibYVnBZd7/Ee2XjrwByZ01X6MPPx6rN1OJDY3p6
	 FgYTwwru7c00w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ASoC: tegra: Move MODULE_DEVICE_TABLE next to the
 table itself
Message-Id: <177798325040.568329.5475184475659729159.b4-ty@b4>
Date: Tue, 05 May 2026 21:14:10 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cefudk32snOl/nbbvFdfp5Vnw/EQCTWqq5PCVaxb3Qo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+e88pPymfwqltCc9XAr3YDRsUA7DBlqSCA6Is
 JH013PlTkaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafnvPAAKCRAk1otyXVSH
 0IFdB/wM8EiD0jprJ3GQuxIGKno9/xqIRj95icFwM4m1Ni+Xe9fgCyCV0qOqEv2oLeAfHUmypV2
 pB5UfRncjVuIpLh07vtuCI2wDBP91FZOLI31oSWi31Zt0nHoQ8AFOPpifk6jRY/eaPQjrd0PyqT
 8wz9pBYX+fxyPMXbi8emdbChfpZqtaGdd6L+4uwMH2bdFBTBGj15A/IA+QKf+3Tmx7he98vHZH0
 Czk3cuNpRDfyLgS4EgHv5pK2wiXMRpHBbpAn0Qwbh04h6gNQIfkvixhLUHkSX7VlheOOo1IWwjm
 QYXgcnoo6ACsHm4/+Oqz8fCEUxz1EHkBqH092FhhNUIjRpl5
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

On Tue, 05 May 2026 12:28:04 +0200, Krzysztof Kozlowski wrote:
> ASoC: tegra: Move MODULE_DEVICE_TABLE next to the table itself

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: tegra: Move MODULE_DEVICE_TABLE next to the table itself
      https://git.kernel.org/broonie/sound/c/a28d17fdd3f7
[2/2] ASoC: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
      https://git.kernel.org/broonie/sound/c/7ed0e11bea0e

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


