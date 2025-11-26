Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDBCCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvwO2B91MSoJzjUbG+aFdaY1a90YF3q4uxdd57PU4fg=; b=BEcnYoCX2gBf+5NP8/ZqFxBXNd
	C6a3/+2oIUjFIGyKhNHwHGVbZdr8sIsy8CoL1ABi8I06wz7EEVHrbCEjwvPWml1To8B8of9NWBsYH
	71RuGu/0YQzhLy+G7y/xQ8aWG5wc6znBCgIGeP1lA0uGe20GdtyTnD5oV01G2/RYKeN0oCWo7qe00
	JhxA3tYIPF1gNs+iFDj4jHAbbSbeRolWeKMTj6V13NbSutAlEt/Ksd7yqCCGgtq3LMI6vjdnZyv/n
	XbgO46tAWgq2O9ApiorIjoxOIGYxP344Gswk7jWUEWfjQZl/ZgzbY/X792TPkw1lpU4uyBO1mfRA8
	uBPGrKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONdf-0000000FhVx-2DJC;
	Wed, 26 Nov 2025 22:05:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONdd-0000000FhVA-2Zv8;
	Wed, 26 Nov 2025 22:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D77DC404B5;
	Wed, 26 Nov 2025 22:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09DBC4CEF7;
	Wed, 26 Nov 2025 22:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764194724;
	bh=qjypqAhSdHEv0LGJSOTuNEGmIHFAdFLubLTiD2vfKh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hQjUTUTioHpjSn3KWvOSVDRP5yBj9Ei9rzYGZ02nf0cp2wYg20DdIRCiy3j65sm7/
	 2KcPaygyNgF50QidfArsgNDNi3xAlVju+aC9gOKirWUxzJNrslqqNrW2hz89Wyffgw
	 Sd67zPOe+jz2lw5C4bbvgel1bVz5m15SRo7KMupDqD8g0LyWbRvJWXjmYyzt0rp+oF
	 +pGtuuPCrukGrGXcy+h8EpLlwEYfeXocLfCtE4h949uXdYYxbljSkg6U+CaT5ItrH4
	 DO9I5QDSRnw0EqLtAR1fzZLutAZoEjJxYNUZsUQaigCohTRNfjUawP5Uw+pNR4RIpV
	 VjTln1jq4nbQw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Samuel Kayode <samkay014@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
Subject: Re: [PATCH 0/8] regulator: Use container_of_const() when all types
 are const
Message-Id: <176419472245.151653.5849861246383246238.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 22:05:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_140525_697922_187319A3 
X-CRM114-Status: GOOD (  12.77  )
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

On Wed, 26 Nov 2025 17:58:43 +0100, Krzysztof Kozlowski wrote:
> Use container_of_const(), which is preferred over container_of(), when
> the argument 'ptr' and returned pointer are already const, for better
> code safety and readability.
> 
> Some drivers already have const everywhere, so container_of_const can be
> directly used. In few other drivers, the final pointer can be constified
> that way.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/8] regulator: Use container_of_const() when all types are const
      commit: ac1530cdea9846c6bff31827c0c4dffcbc186e6a
[2/8] regulator: bd71815: Constify pointers to 'regulator_desc' wrap struct
      commit: 788915a22bdfde0925c074056056e7d408c242d0
[3/8] regulator: bd71828: Constify pointers to 'regulator_desc' wrap struct
      commit: d02ea816cccae6c02c7c026b5a74bf99a784c9c8
[4/8] regulator: bd718x7: Constify pointers to 'regulator_desc' wrap struct
      commit: 7a7e1ed307de6cc68639f602f3fa247ec0903354
[5/8] regulator: bd96801: Constify pointers to 'regulator_desc' wrap struct
      commit: 50011cacaeb9556d65067ec8e757e3987ecf0f2b
[6/8] regulator: mt6358: Constify pointers to 'regulator_desc' wrap struct
      commit: 438e90a287c86253dbb47e7fa43c4474f91ee7eb
[7/8] regulator: pca9450: Constify pointers to 'regulator_desc' wrap struct
      commit: 03c3bdebaad23d6698a3cb8a11a915d8bdebf28f
[8/8] regulator: pf9453: Constify pointers to 'regulator_desc' wrap struct
      commit: 6341646f7225343f57c8cbcb6a4d25b3270f4111

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


