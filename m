Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049EFD2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R7OJhb8g0EjhhCuJA26lFyiU8IgvSrLJ7+qYcylQpM=; b=iUE/qtPF/J3elqVphfF/KUECCy
	0pjRJSXRE79rp0vRh44CtUNnQr3D89hJc/45q444hB4ma9Py3DyFDAeQiDh62TLNqro4VQmnF7GwN
	ZLQbvWLCmQumAtbSJV73NKrXwZNPQM+rDPXu/hun5jfIvtMC7vc3D9buUKf8M4Wnx4lXN6S1d5lca
	FamflQ7DbHmRTXk7n1wvX8GKbVE/W1Q6ldS393ftu760pDYQXN4Ts3a4gztaanW7vPXv/AJz7BVdh
	5MCfUUIbaeFypnmUKoB+mpo3EXgJD3xh8ENNmmRV4ItjBTKgSpaw+Z1AeKXj8fE36p3zwe5/PRkgM
	UPx8nRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgTr-00000007Oev-27iP;
	Tue, 13 Jan 2026 15:38:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgTo-00000007OeY-3uZ7;
	Tue, 13 Jan 2026 15:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7341403FA;
	Tue, 13 Jan 2026 15:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC28C116C6;
	Tue, 13 Jan 2026 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768318727;
	bh=ljT5os089R8jUo9auIHE9TI3ncsDNdnWjL/OJch4leA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lYi9WhYwgD1Orn9n6DwmOzaGYJX/YkrW8INCxFw2FUtssTuV52T9mNyNFgbdZO1rM
	 m1HDAiuhHpQ3+VaKnZNSzdqadV5nizrxEZmxwMlPsxCERJHprQjR/GF63nchWAgjKG
	 9vA1Oq3zzVBlL2iyBvIlwLv0nGwx2/NEa7u5fshSVEmEX935+uoYgh/ip8ptqawmIo
	 FInWYr/y+tMpjzOuwK2pcgGAXpq/ykIn/I9qv9At+8LNQna1D/DfkwkhYo8KlEO/OM
	 mfB5c+OO9ShzZ66z54hNwnpWJcPdCqNBttcamyWEWKb5OGHCkelO2rR/QEXkrmaeXi
	 tL2N+KJqy5AgQ==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 sen.chu@mediatek.com, sean.wang@mediatek.com, macpaul.lin@mediatek.com, 
 lee@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
References: <20260113110000.36953-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 0/6] Fix dtbs_check warnings for MediaTek
 Helio X10 platform
Message-Id: <176831872457.153367.14622745892314897122.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 15:38:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_073849_017294_7D171B08 
X-CRM114-Status: GOOD (  11.21  )
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

On Tue, 13 Jan 2026 11:59:54 +0100, AngeloGioacchino Del Regno wrote:
> This series fixes various dtbs_check warnings happening on the MediaTek
> Helio X10 platform devicetrees.
> 
> Depending on correctness, either the bindings or the devicetree was
> changed as a dtbs_check warning fix.
> 
> AngeloGioacchino Del Regno (6):
>   dt-bindings: mfd: mediatek,mt8195-scpsys: Add mediatek,mt6795-scpsys
>   dt-bindings: mfd: mediatek: mt6397: Add missing MT6331 regulator
>     compat
>   dt-bindings: regulator: mediatek,mt6331: Add missing ldo-vio28 vreg
>   arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
>   arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
>   arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/6] dt-bindings: regulator: mediatek,mt6331: Add missing ldo-vio28 vreg
      commit: de9f1b1583aecb246b659effb03f2456604fab64

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


