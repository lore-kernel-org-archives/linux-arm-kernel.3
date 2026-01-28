Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7D9D2FEFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 00:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lM3VVjMakcNXtXN+jhKBoLNXSYMHaDJhmkZXcU+Jk8=; b=uxGi8IRVtD0mDrfuaH+KS7dAsi
	hQwo2ZC/8DlqKtuSgVSVMveZws1OMKXAysP8FGzM8wBD7IXtJW09PT+aQvt8mnYBRimGR3eW4aXlE
	ihSsrm7N0qmDDlbxAemKbWyx5xjg+WovBbqnw2fwNKkJtxI8e4eY7Uf3dD3bndzGi3ntQaKgcMazx
	mWvMq7Fyl0QUsddLWUxpH31QQl+KE24wFTrCJ4hjsp42ixLqEwj5rYb6q8aB5GmQ3m9PpdutZdP5I
	UE6edlgUAoFZXFxjAcqO+JLwq+FydiDkEjBpibh+j/lqK6WvlHit3fQ1SZaak06aab/uaDqBjnwuk
	Ch6HKxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktYl-0000000FDPS-39Rq;
	Wed, 28 Jan 2026 00:37:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vktYi-0000000FDOk-00Bj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 00:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1935760121;
	Wed, 28 Jan 2026 00:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E1CC19425;
	Wed, 28 Jan 2026 00:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769560642;
	bh=oKNI+M3reVqWWwDmRdcVKum/qWaajHKiFykIl2BlOdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UxZ+WIWSwChTfPoISMK5xndaB6CL2Fp4/61xB8jEkBJrOF2g//+/IFqFaGRdMGFDw
	 Ii6RxH7jq4y7sjia+y1+BUlvndzj5IELQQBCpPZQacuKIsLmLKcxZDaWsxYMVcCF76
	 vUR0jWvj0NKLQLAOHciZE+8kXMH50nwcYIWcZMYZMRHes3JbHZTYL16XDXQcJrp/YA
	 5qnjupx6qmAbgwmc2hxpnym9W2SQf7YBqEd8PdqpvoPvbN9CuUJhzxPdC8WTd9L7Y4
	 O5xotqlNpIlkKpr2zQtaU1hQh57Ir0GTbnO8dNCmdHlARAMtzyPBZ3do7DAM3WMNvb
	 BIV/RQZPcaLIA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, wens@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 ckeepax@opensource.cirrus.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260127034025.2044669-1-nichen@iscas.ac.cn>
References: <20260127034025.2044669-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Add missing check for
 devm_regmap_init_mmio
Message-Id: <176956064035.1483098.7074605449256070119.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 00:37:20 +0000
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

On Tue, 27 Jan 2026 11:40:25 +0800, Chen Ni wrote:
> Add check for the return value of devm_regmap_init_mmio() and return the
> error if it fails in order to catch the error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sun4i-spdif: Add missing check for devm_regmap_init_mmio
      commit: 8ef73c0fbd1e15ead401a74e7114d8d4614a74cf

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


