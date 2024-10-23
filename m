Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAD1CF5365
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BpUiMybXWWR5QAYbcPi83nzo0UAvC/Ct51dVMXRm7k=; b=dqx8r8iBdOVyQorDbPmRENXhWg
	/Udcy7OU7tn7xYcV4zovfYB2plPnyrl1lM5PSL/lZcVsZ/zcpF7/vYebb7dRpiiDKZEfNLvd9U1Yg
	xZ6zz42HmCBmDeAjjm8tI7Y2DFI3y9UrhKup74I37a9OtObuNUZaj0DSNPtTrLIZaDx/6dk6azvng
	1M2FlKnpmbKvMSgLUlaEk7q0w37E5BIunHw/VHPHzfWhewBMGh+pIvHfGghmUeG5nrXtyT8c2NnFu
	VgXGxvVxRUzCXPEWP8cAEjHlaida4x5lAWOpvCp5p+s4hRtiE2ZWYedtEojFCCRNNGaLQdcFIejq/
	JSrWzTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLI-0000000EIJL-2G2x;
	Wed, 23 Oct 2024 12:20:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zu9-0000000EEI3-0LcQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:51:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04EE5A44BD3;
	Wed, 23 Oct 2024 11:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19307C4CEC6;
	Wed, 23 Oct 2024 11:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729684315;
	bh=/Q04rYD6s7mKlKohcnk5dUrsgTRIpLrVCMnNLencu9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B52nSJJvrk1x+Gm0WVd0QtrTt/kQAvg/gTJ5WwFkgpFnvCqXP5vXAa9xWfhJRb2+4
	 ppDiNnThGGu6LXR6bTNjcn5bH2C8Kq3wGB6QmUZ0QdISGv6CQrOR6y7X21kY6E9zJa
	 9vwrkUKckGRCLSchL3a5y6cDW2TNeYoTIQE0aWjIGeXRlzKhrvc+kXlYhAPuj0JDwz
	 qhw55fAMdhqHsZ6URpq3buwIcdr2m1Shl1xm3G9qYbZ8zFlYgzIRQuHkxW4kSLROxn
	 6qKqFa2Oz8NydKeOPgDa/pEWFF8sJ1/ELLBaBrVy05NynUER+qvuA/ufPiyhtHwppd
	 e+0BeWtVyKong==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, hayashi.kunihiko@socionext.com, 
 mhiramat@kernel.org, 
 =?utf-8?q?=28=ED=95=99=EC=83=9D=29_=EC=9E=A5=EC=9D=B8=EA=B7=9C_=28=EC=BB=B4=ED=93=A8=ED=84=B0=EA=B3=B5=ED=95=99=EA=B3=BC=29?= <ingyujang25@unist.ac.kr>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <SE1P216MB2287962B462AE91B26248D19FD7E2@SE1P216MB2287.KORP216.PROD.OUTLOOK.COM>
References: <SE1P216MB2287962B462AE91B26248D19FD7E2@SE1P216MB2287.KORP216.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] ASoc: uniphier: Handle regmap_write errors in
 aio_iecout_set_enable()
Message-Id: <172968431380.31331.15335444902728869740.b4-ty@kernel.org>
Date: Wed, 23 Oct 2024 12:51:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_045157_212140_5B55B75D 
X-CRM114-Status: GOOD (  13.63  )
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

On Tue, 08 Oct 2024 05:20:30 +0000, (학생) 장인규 (컴퓨터공학과) wrote:
> The aio_oport_set_stream_type() function did not previously check the
> return values of regmap_write().
> If these functions fail, it could lead to silent failures when
> configuring the audio playback port, causing improper behavior in audio
> stream output via S/PDIF without any indication of an error.
> 
> This patch modifies aio_oport_set_stream_type() to check the return
> values of regmap_write().
> If regmap_write() fails, the error code is propagated back to the caller
> to ensure proper error handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: uniphier: Handle regmap_write errors in aio_iecout_set_enable()
      commit: 9b0c65115acdcb6fd6bbeb360c1f4f7b14c9a610

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


