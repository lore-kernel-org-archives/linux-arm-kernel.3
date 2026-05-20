Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D4DCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DgGODNadjgGJsoo1ylpwBE577qTB7GC2dApkXhqSvs=; b=y7N+qgVmADxscJ5Q2feJQlpKbt
	2Dv23LbnMS4nOXKibEW0ldz5F+yeRJdM60ZD/4N1otzRKEwQ+ADbkB8MgC6SaGWsxyFqIHhyAwJgc
	jNvkyaivi9TjP1OfVwQC4194ohuddgh54cEljZTE9TDKaikdf5Dho39PPOzzUVNsBwTfSAYcu6HAY
	2MvpGiYLRPV9gy13tv2hCmdpTJyA9GY3Fu+PUdXMSzEe3mRI6HbXNBxBOfk1FdsdwQBB4YQTJnp1H
	Ms8qjpfccE547ymRxHM7lgpGdkMdIDfRy3zAPCDcGBgBFdcaR2hg6xy3NqpDZqQdqULYDbD0u+pJz
	Bx7RKxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN0H-0000000AUvQ-3AE3;
	Fri, 22 May 2026 10:21:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN0F-0000000AUv2-3Cuw;
	Fri, 22 May 2026 10:21:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58A7243AF9;
	Fri, 22 May 2026 10:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D741F00A3D;
	Fri, 22 May 2026 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445275;
	bh=2DgGODNadjgGJsoo1ylpwBE577qTB7GC2dApkXhqSvs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NhkcvpWU504XJCVZIPuxMhF+fcN7kh6dOwSwL+rQUWKSJFrMBp8taYuFNrkdISKN/
	 abWD5h50FvIuX7UjOZBUywR0mZaC6RXN5MpJ47RVaprIPPQ6N7FNhkaHL4fy9oLWE2
	 bNk3b8Rq1182L+j1Wb/k0lWztKC0eXWY4KfGYS6NfFSOBNPb1ZeeE6lFNwtMkEk3Mb
	 Kb0wvQDuYU0JB/n1n35ItS+VZmCk1aVZe3osldYV/ScWkqlRUqfXn3vCJyE/GOXg/r
	 pqFht5RWvoOULbjItGw3YXezQHj6JQEvAzJeI3PTUU0i4hq7bKqsxctyEzIScCRifk
	 TVuxXgR+11pSg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260514091520.2718987-1-wenst@chromium.org>
References: <20260514091520.2718987-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v4 0/6] regulator: mt6359: cleanup and add
 supplies
Message-Id: <177929384264.56665.1047692628146708628.b4-ty@b4>
Date: Wed, 20 May 2026 17:17:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S86o6RsskkHWtZ3c4SAC2I3qNeFXbs4tllWVFU88BEU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4YxSKtcKDBHMtlwOBWiLs/4dlCeUfDdAjCo
 bwUG1Bb2ReJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuGAAKCRAk1otyXVSH
 0BmQB/0ebTYeZ/V6SuHqtRkYGeTSKGRrPgmho05X8NIN9HYgS6LDOcttuTZCuNG7WN/j7BPMUsi
 V33UcE8/EW3SjzddG9h6BCurQ+IgT+chjLN3BeRpgIYUV6A5rui0Xlw+8+2quWAGyJVPi9UfamL
 ri8PPkEbzP8Oe5d1dxr3n3f+QfntPP8GOcCI4ZtreI/suhmwcuoQU/Q1Q26PPB0tng25HF44k/G
 S2r7dIDussmXd5sp1EzyEax09lMGi4f8vDJuwItc3uCH6SUvd3YGFax5zN20+Sm8HVOn0W4VL/+
 Gru5baz35mbj0LYOpAVvdj0FXNolFpFUedwdsc+QNqfNudnG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_032115_846254_D9F93A5D 
X-CRM114-Status: GOOD (  11.36  )
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

On Thu, 14 May 2026 17:15:13 +0800, Chen-Yu Tsai wrote:
> regulator: mt6359: cleanup and add supplies
> 
> Hi,
> 
> This is v4 of my "MT6359 PMIC cleanup and add supplies" series. This
> version addresses review comments from Sashiko.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[2/6] regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
      https://git.kernel.org/broonie/regulator/c/cdc517688ffa
[3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
      https://git.kernel.org/broonie/regulator/c/beb4fe279989
[4/6] regulator: mt6359: const-ify regulator descriptions
      https://git.kernel.org/broonie/regulator/c/eb17a319f1c9
[5/6] regulator: mt6359: Add regulator supply names
      https://git.kernel.org/broonie/regulator/c/10be8fc1d534
[6/6] regulator: mt6359: Add proper ldo_vcn33_[12] regulators
      https://git.kernel.org/broonie/regulator/c/fb6a6297acfa

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


