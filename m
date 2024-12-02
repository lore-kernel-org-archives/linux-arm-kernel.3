Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06A3D7833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OldYUed7fhz+61jetyuVJDwn3/4kNYMBN423Z577gJU=; b=oRgoU/gL7kXyRONKZziER9yv5n
	opjobx3Cp6E+NMc/X2YdlgmOYdOoLcVatmLU2o20XiltYwYXkoHqEbdzKgEeSSbKmhpHuoFJnu3ML
	QHUBvGA5IV2v5IuR6ME20ru3rPjnywGHsYGqN8NTGlp1PMLn4+buJgnsJaoSmHJ3YvovQ4zSCONH3
	Ch6gWGzmlZ4A10SGnDEkOnsirF6iv+myMvsA+aIJ+fPJcQw/cBfqOSMf/az/24d8NMmUC+chRgaLt
	E4VOCviTpJt2GGMLEQ1mKgQov7S7EsXy9ckKRij/pS5x5ESaL6aBiDNLYTK+MqHtZwtZFuirXb6Kg
	NsEF7gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAja-000000076nO-1kdr;
	Mon, 02 Dec 2024 18:01:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAgl-0000000764m-1NTU;
	Mon, 02 Dec 2024 17:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A7C1A411C9;
	Mon,  2 Dec 2024 17:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920B5C4CED6;
	Mon,  2 Dec 2024 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733162306;
	bh=XJ3XxTSNZkfF19O/ZvNhYW0wKLfXMcF4WWxY1EwSDFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iWGhRa/AoUmERI8dddfKx7Q231RsV7SLE7yM8gmY7/X7Ah3fWhw6jxjPp3wLoE9wz
	 ssLPxgzrMnP3nCngQhPvtAp0ReLEaPQmkOodq9TCGco9jX7kRdDB+bhN4BfUBW4c+C
	 5kuf3gq1C7jpDU1rmV1qfx9M/8YJaJ95wEtIIgLbFA3wDQBjx9ec6MXMwHJubLABu1
	 DnnpjifO4JM6A0ClVe6bdgPr7+FzRvEVziTeaK1oMjUba/sMuK5VvwLAWOuaWc8qmX
	 C+/Dn1Q+0wkkcqN710zRK1Aa/FII7IP3Dt2ZlONoiKv5xOPt7ZUarEO3MdE5rgoASZ
	 zT8T6X6WVxutA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241025080026.2393-1-tangbin@cmss.chinamobile.com>
References: <20241025080026.2393-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with
 local dev variable
Message-Id: <173316230432.189181.14465686239974996213.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 17:58:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_095827_432489_E13C5E1B 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On Fri, 25 Oct 2024 16:00:26 +0800, Tang Bin wrote:
> Simplify the function mt8192_afe_pcm_dev_probe() by
> using local 'dev' instead of '&pdev->dev'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with local dev variable
      commit: 01981565c764c554cc96e2d30a71c42975171416

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


