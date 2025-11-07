Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C463ECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmmK07uJmCxTZrY5gYcFC8E6l65cokdknoUuvrxHG/Y=; b=AhUcVAB9S5fEqL3wKqRtrb5fNs
	h4OymfMFxNZwX3N48p//o1W8Lq2XQU6FOBLyo+QsA6J15Bp6LHw7f+iKqyjgZ38/UTlpdIybmkYQY
	LYYNg0iVrN+/nAJHvWxzb2MMaJIkW4gHC1VRKjXulusOU62zukxkI06XEFaWPTfd/TsxBuiHKLzAs
	/O6mokVyBhcCbRhUr65k0jUHIGE7z46EL0T73CwoBYnmjeLHdnONDEJMJ+nRSsBP7XCljA7T4em4H
	3rjiCgDAOZYIahgYrn4nceVu4+Cxka62bFkZqCrI8+FwwKoTC71l3cfoLAlV7tE7Lc6o9kds7s/6O
	xauggEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIrZ-0000000Gxw0-3aVv;
	Fri, 07 Nov 2025 09:34:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIrY-0000000Gxv3-0IUa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDC5F618FC;
	Fri,  7 Nov 2025 09:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C38C116C6;
	Fri,  7 Nov 2025 09:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762508070;
	bh=NtX+5fn+kE5HkWQvbOADti+9aZQIyL4Npwg2RYFPXmc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=koCdZds9yXGyuaAF7TL5P29yTmWzu4zDko5m6Zm6K7xhvAD2Wr2tUXMXbSBe56IjA
	 R8+/rLbgfrEbihBBMjJKEOkEzCn7veYpBXFfhAgGyFdKPTjPVRKp1mzrPNQBFGI3GP
	 1b9GFs5PT5ZcBcwG9gdUjKTnb8XFpzNt4o5Z7cikBwuy+wAq4vDud4GZE7AJxJRRGj
	 lCxn0YcK1izSOclHMxnZjN4vaw/orLZsnD0UUETXf7O0dglJruRySPALQlACmbblRV
	 sevhOG2VrslPfEZCY9KkScWZx7oKfIijzALVemZS+Sg0O+QUlzv3FSspi1SKGWplaF
	 uXt1Jc+0L6Lkw==
From: Mark Brown <broonie@kernel.org>
To: mkl@pengutronix.de, frank.li@nxp.com, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 carlos.song@nxp.com
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251027110256.543314-1-carlos.song@nxp.com>
References: <20251027110256.543314-1-carlos.song@nxp.com>
Subject: Re: [PATCH v2] spi: imx: add i.MX51 ECSPI target mode support
Message-Id: <176250806608.2489052.17181780089794986836.b4-ty@kernel.org>
Date: Fri, 07 Nov 2025 09:34:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3
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

On Mon, 27 Oct 2025 19:02:56 +0800, carlos.song@nxp.com wrote:
> ECSPI in i.MX51 and i.MX53 support target mode. Current code only support
> i.MX53. Remove is_imx53_ecspi() check for target mode to support i.MX51.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: imx: add i.MX51 ECSPI target mode support
      commit: 4e92abd0a11b91af3742197a9ca962c3c00d0948

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


