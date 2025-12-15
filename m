Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D974D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1Tuoz1VdP8HCKEI7nDFghitcggF+sDNI9eHqZa6eGY=; b=Sht+KOioWi+VOd193e/s/fm7Vl
	iJiFwTK33Gliakm7uiH0eEaw3RldGlk3nmNJD37w0+5XvTswNAfsOFkoOsNB7gOY2T4VZfo88zgFl
	N6l9AAUH2Cd/sY0nr1r7hmo/suwzNSGmiF2sy2uddcRjsfL+0s0vyf025uGXFC9lN+A6TNNxwjtma
	HOgQyfO8aZCoxAKWBaehvzNdurnkmqeMTyLtcIaUiPsP5ZiIuZNXfmwR+GUznrUVDvDoQ0s3A+ASI
	82izBtj4by5rzLtRw0oIV8mvrNGn/fhJzoB+AFcpiJbOStHsrXWsnKOxhmsL1I59tSfRu7dFcqmfh
	oYcfG22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96D-00000003iqg-3OCK;
	Mon, 15 Dec 2025 13:58:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96B-00000003ipX-2A8i;
	Mon, 15 Dec 2025 13:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96B0C6019C;
	Mon, 15 Dec 2025 13:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3224EC4CEF5;
	Mon, 15 Dec 2025 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807130;
	bh=m82WsvRRZfI3omoyvVudU1ntkd1y7W+CAVgLo4GxqLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fr9tgQucU7dN/hImWXrVU6vFjfZAVw0RQykau6Kb7hXxG/vU0cylNgNmhK9rMt9xa
	 RLx4xgwifdAGBpBQgGkc8FSFwJoDPH1MHbyd1fKiEhYwn1jz/xyVSPcj27qI6SBO+T
	 ffbvsKb0YvE5JnmfE/1QgV2Weu1sFthmtM52A38MNw9bzWVMEeZBq09yECVMWXAC17
	 LoSuvJ1wld7gYSIJkS2+gHPn1NqiLu3tC8R/6S/PAfi1IHR4DX949g2tWIa8EAf2gX
	 hV6vupUealSGh/+H5A+JO2DAql6/fjtKSI+SqlNY4M0pO79CYlpCUjwiVY25W6wxwa
	 6ffTo/3q6+zSQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, hariconscious@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, khalid@kernel.org, shuah@kernel.org, 
 david.hunter.linux@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251212044408.1286-2-hariconscious@gmail.com>
References: <20251212044408.1286-2-hariconscious@gmail.com>
Subject: Re: [PATCH RESEND] ASoC: mediatek: mt8195: optimize property
 formatting error handling by using scnprintf()
Message-Id: <176580712756.161056.16246291831827319109.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:47 +0900
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

On Fri, 12 Dec 2025 10:14:09 +0530, hariconscious@gmail.com wrote:
> Replace snprintf() with scnprintf() when constructing the property
> and remove negative return error handling as scnprintf() returns the
> actual number of bytes written to buffer.
> 
> snprintf() as defined by the C99 standard,returns the number of
> characters that *would have been* written if enough space were
> available.Use scnprintf() that returns the actual number of
> characters written.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
      commit: 180cdb96e821e30528b02708b927c93daa0ed40b

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


