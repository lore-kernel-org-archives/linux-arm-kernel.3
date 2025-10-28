Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6BACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeKGjbRdQ6RWZHkTCpuQrGG1EsotQAyYeLqXuo9rIPk=; b=ZANblneDGjbiRXM951VRA/9EZ5
	a99kFosWpGBJWMCZJoSSPGJcptjby2FEzGtm5LC6zNQJZ6goYgQtNUKlvZ3qjey6ivu6emh0P1H0f
	9cFFAxulk+MQkWIzMGef2SLMi5g/+ekohKMADoDltRu+aV2+gc0Y5mF9ccf9gOQXCzNj8YzHMK8EP
	qPz5fAx5CwdocJ1XmgCT2yr/WeNz3SX0EeTCG7zOONLM33GVVs+EonRr29+Qj5dCbl0K9ULN3yXvy
	jMg2G6p19VN2zrUiixEEhys2WVvpqBqMmz7pBRMpYOfSlwRZNwVkzALGQoyQjJiFIoinJ7FRhFOW1
	lQ07LJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmGo-0000000GHZB-0ugg;
	Tue, 28 Oct 2025 16:10:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmGl-0000000GHYU-29mT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBD1948FA2;
	Tue, 28 Oct 2025 16:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713ECC113D0;
	Tue, 28 Oct 2025 16:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761667798;
	bh=yS9M85o0R1tVxIA9C9jEiGOV1H8VwCUJawV1LHO0FmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Klvoy4DM0bfRyYdMUJy+zBkWNEL+Q2goNadja/TnrTf4DM91nNMBozc1k89jNw1Of
	 pC7+YdVRhVKTlzhIA5Y38VSaMSCqAJX3RU1Dx9ltV548c6zTJ+UhdQejy919N8WQX2
	 x86YaAuQDf99auJcSlOv9y7wAtAmwKiXSVkTg2mAFOkAiLdcQ5Yfeuctn4bSwtVL2n
	 bL/iCAd35vlxMFBvU1MPX34VzDWiqB9KEde1exDoHxv35O1dF5BBoKNdwWcXuPm4wE
	 Gg7tJ8EZ3KIOFONRcW03HRdTmdN/z8oMvto6rRoIQrdmHD1/LKdQCUUgORlsTIuXkE
	 bhbVwN8bkHmOQ==
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
Subject: Re: (subset) [PATCH v2 00/10] allwinner: a523: Enable I2S and
 SPDIF TX
Message-Id: <176166779616.143847.10303188319180115816.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 16:09:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_090959_582461_3E22079C 
X-CRM114-Status: GOOD (  13.09  )
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

On Mon, 27 Oct 2025 20:56:41 +0800, Chen-Yu Tsai wrote:
> This is v2 of my Allwinner A523 family I2S and SPDIF enablement series.
> 
> Changes since v1:
> - Collected tags
> - Dropped clk patches that were merged
> - Added patch for SPDIF pinmux settings that was missing in v1
> - Dropped bogus change to DAI name in SPDIF driver
> - Dropped clk rate message in SPDIF driver
> - Switched my email to kernel.org one
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[02/10] ASoC: dt-bindings: allwinner,sun4i-a10-i2s: Add compatible for A523
        commit: 67e4b0dfcc6702a31fbb6a3015c0dc867e295eb4
[03/10] ASoC: dt-bindings: allwinner,sun4i-a10-spdif: Add compatible for A523
        commit: 6ddcd78aa7f85e1d94ab7f90c72d1ad0c0c7b6ea
[04/10] ASoC: sun4i-spdif: Support SPDIF output on A523 family
        commit: 4a5ac6cd05a7e54f1585d7779464d6ed6272c134

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


