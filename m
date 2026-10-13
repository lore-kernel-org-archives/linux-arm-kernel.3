Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F79DCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoYh+wmGkfMuCrYWAfzCPGRay9LfK9IhzqEdYF+ddbs=; b=aPh1G/9udxwB4Btf3hoCntqica
	H34WTXnuPAGFgy+lKT8j/v3/54TWCCazgkVqYNTt0CmvqA+QzbHBnaWxYN+V8IaA4DaAj9DSePyh7
	qh6h4bOhSZNYQqPbI+fujTkXufQjnh5WoSN3vuv92Jx/D+ZE+tyuK/eoMTKu0LhyvU/odAH1k7gvz
	Za5r44JZmBPAgFHrsQWnmGK87bdcq1AnsS2Q8Z9i2oB95MYm+AYFjsaNjWa1LeyMKkNk7FTh4Kzn4
	W+vsZmmTLtUGya6L61sMQe2djAfmmwyNHa3kSLbHBfBCIuO8dTYEGaQL30ZJv5cge4uEgnU7grjo4
	b1f4YSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIjv-0000000HRgA-2wlH;
	Thu, 15 Oct 2026 10:31:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIjs-0000000HRfQ-1ehE;
	Thu, 15 Oct 2026 10:31:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5AEE41078;
	Thu, 15 Oct 2026 10:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EADF1F000C5;
	Thu, 15 Oct 2026 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060267;
	bh=eoYh+wmGkfMuCrYWAfzCPGRay9LfK9IhzqEdYF+ddbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZXqyQrV6Y7qejDD9SlNYEzQBYR5GGe5ROFqdWd53NW2wZQ9yh1ft+y6dpqkI+3uRs
	 qTfJqdBvZTQ5qHICsZjul3pBTF59hlac8Fr8dEDPC2TcmnDVRYEH+RsCUjMYC78C2r
	 YRKjwN2oi8BguEWhyuFdGws2IlgyhBO2/+ohgq0c1oAfkQ1dfYmbU8SF6DigX38KeO
	 ZQxeIadKVXb2qSVKBj65xTLXyGDjY6pLBmx1AgN6ylVv0kfh1V53IxbcEoDlmSrrZ2
	 QPDpjOrijyCUv6X79cx7cO6dqXjMPZdtxmJcOg8fE3kDW7iIF/nMbUSVppXrcssx+J
	 0+UE/oMtoJ8DQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Priyanka Mani <priyankamani2100@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
In-Reply-To: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
References: <403cc04bb103dff096edf72b99ae6868ee91f359.1791782072.git.priyankamani2100@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8365: Fix out-of-bounds read in
 get_iir_coef()
Message-Id: <179192115331.1606900.11418539527267482059.b4-ty@b4>
Date: Tue, 13 Oct 2026 20:52:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OeNecRvAZ2xIg1KwKkSy3lnhgYoQ9dQyV2iwg36Y1C8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurE6P8+r9axAV+TZqMgNber7dtH0Jq1NyvtYzer+5z
 W+2KOt4RykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbC8peRYf8Zj9463o86y/9b
 3S5ZUKJxYc+ZhLMNGks3/YyaJH/e5AkjQ1Odr1Prn7xu2zzfKedVVtivXsYr+C86dd3uQ7v0OE/
 1cgEA
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

On Mon, 12 Oct 2026 05:31:19 +0000, Priyanka Mani wrote:
> ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: mediatek: mt8365: Fix out-of-bounds read in get_iir_coef()
      https://git.kernel.org/broonie/sound/c/e913917febd3

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


