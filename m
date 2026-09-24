Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB45C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY+JAmDmWtIQ8nQAOLoeWreSqeSKKZ9GlEGYCiTzBVw=; b=XH2Outh+VAHwL4owD1FoejDdJ5
	DfDENKE4wxC+R1VTmgbyBGbK5QtyxTGiMYsQB+xwD5bI41xhJ4Ysq/QCJ3k/Le9adQfLLPVxpivaQ
	PevKSbQK0XfPkJkxLBhKErA+qOD3XgYjRp2qSwPHilZ85J8JDrbECVmyZzDmc6r0MtsmTgoxCa2mu
	G1yANPqSOqC/+r4wc7i9XRDi0r53C8YkK5Yxfv6jbKUEt7ZTA9lQF+eotoqO/7j8uhbEHTxM9khA3
	d3q1cCl+LIv6Gmd4/5ziefxjm9un2b0zHWaZ4gHazyL2Ruc3t7PEE7sOeml1AUkbMP4Hzm4QeP06f
	Elv32dIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9Rn-0000000E2wY-0Ymv;
	Fri, 25 Sep 2026 17:10:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9RV-0000000E2rm-06MR;
	Fri, 25 Sep 2026 17:10:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1960460136;
	Fri, 25 Sep 2026 17:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBE51F00893;
	Fri, 25 Sep 2026 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790356235;
	bh=ZY+JAmDmWtIQ8nQAOLoeWreSqeSKKZ9GlEGYCiTzBVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lIC+TS1r64GhqZtFkfmCigk1hjosRIX061L6K5cF+BPEwCRYpjdqz4Ln0COS4tOPS
	 94wL7/3xYqFbYeHI87Z8kZfD1UvrnFqJxNz60hux26d0t1TUq9E9uLsGaRRJJStXrp
	 4zRbds65I03aBTW2g/q2PiMln3Js9V7iGbDcnMCjEuOOZ5QoyXByz9K53bvXBt8q8t
	 JrfzR0VSRzK42JJAgmbvvQgyeuYucCfB36XtpIdDADgBLe7V9Bp03bvZev+Gkap+Dy
	 CJ/Fr1jXZcH6ZDtQioEZ3eBQ6k3VvjSiy+EViVUmOgkZCER58IUfh3gyQf9Bpux1r/
	 Ho7EjK6pp9kPA==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260924083420.461715-1-peng.fan@oss.nxp.com>
References: <20260924083420.461715-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] ASoC: use regmap_assign_bits() for conditional
 set/clear
Message-Id: <179029244481.149798.12087901953016730058.b4-ty@b4>
Date: Fri, 25 Sep 2026 00:27:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=btAJTGQM17nfINWzcM50CcOirwQ19hxLz8BOtzLcA/4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtqsGQa3KIOzA11v0aMkbM/3taweh3nHNDOqXK
 AAibBZBC0SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCararBgAKCRAk1otyXVSH
 0N4wB/97dJj9Hb3yE5W3Pex5aZp39b0z9qdn81f1AIzfdST/6WhThVQiD4g6s8ASSEuZVonETLW
 y+6NKn2YLYrx4NOLTIkB9C+aPVQnX9DR5ImwcbskduGdmau5yhY6+PoLs8m2/h7WHqCVZbbSWm/
 cofCyi3KOsmAO2IhDSMHqe/7PW+NOyQnsed8VYpyzAgZAT9lhbD3Pmafc7E8iewke8OKw5be+Yi
 OqT/PNwBAIwMCl/SYUAfQD2TS4Frk2LNncRRd8xgw2KcFDMAoS9vxTDMO/yDNHeUa8RtaWLdoyq
 9Efk4Cu4eYqbHcWiXY8ztpQwzngPTY0WjSvF061FZZIzKXw6
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

On Thu, 24 Sep 2026 16:34:12 +0800, Peng Fan (OSS) wrote:
> ASoC: use regmap_assign_bits() for conditional set/clear

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: use regmap_assign_bits() for conditional set/clear
      https://git.kernel.org/broonie/sound/c/286ece639c37

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


