Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F762FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 23:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO/4bwNz34iosHKb0jZqXY9wdyzeeYCAddgH39le5lo=; b=IdagX6/2fS0+kmC2ul1e9LtlQ6
	ZjBZTUrjnJ7ztPhARLaVWLkx+tzymgEgpqo6ld6Z5QDKXuaapF6QYMIFA24otE2DPl8ldLpII3O/W
	0ZfJj5IzgQD0BgIB9VC0Idceopwj/7yS9bSbmdW6mZlExpinh4dojARyW4aK1PyzpPsseaAwsN/DM
	Sn3+AH284YZ9g8dVUtr9BnT6pgHQQrMKbTEFSu+iK3MNI4rVNY3isPvwln3C30dMNKxhI7cotVkDc
	NVcJEjuAEGXgB1nuRmFf0EG3JDGAyqJOygl0aKh9cu8prUX4m1dZvHHk+0EjerkmbL5CquloaOMYa
	KX4tLf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8nk-0000000FvRv-2ByI;
	Sun, 26 Apr 2026 23:22:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8nh-0000000FvRC-0hQh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 23:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 729804049E;
	Sun, 26 Apr 2026 23:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16ADBC2BCAF;
	Sun, 26 Apr 2026 23:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245728;
	bh=Vb925mdM59mifykWSUAilNqCYymWpBDmg2sRxFVkdAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A0vBkJeQgvCofu1H5cBx1Ulflpzf3POW1hHjIz0TtXPs3+BvUigyvT0LZ9JoxadqG
	 LtaMw3gXRmeL6o/FqHi8aKrkn+dke0cjGLbAW4oQrvKpAktoT7aoUFWYqaMEi4ydDx
	 wNs8UCa+naSa1w8Q8xvalaUt6uEZBVhROODZer8UqG0dhqvYTTvUsXFZ24IXUJZI/D
	 fqVzpLEFAbG1QmlzpOpoJ6bgIM0poi+yIQJuR6+E6WQZaMh5eB0wBcok3Mr6mmunch
	 rc3YWqE0kovZ8yRgMrgFQyouRGBBK3jM5rDJBukPOLLQxIeur4DfiPQnDbdL0V4oNS
	 4YxOQq7Uco4fg==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 "Joao Marinho joao.bcc@usp.br" <joao.bcc@usp.br>
Cc: Micael Vinicius <micael0208@usp.br>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260420203218.15060-1-joao.bcc@usp.br>
References: <20260420203218.15060-1-joao.bcc@usp.br>
Subject: Re: [PATCH] ASoC: mchp-spdifrx: Replace manual bitfield
 manipulations with macros and typo correction
Message-Id: <177724027656.266775.2142649172096596981.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:51:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Vb925mdM59mifykWSUAilNqCYymWpBDmg2sRxFVkdAU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4dObPlaXZsO4jJNaQ+VjfelH62WTdyJitPs
 dcmk5gIqbCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eHQAKCRAk1otyXVSH
 0PojB/9GYTnzHZQFK8TCC2scT21prvmrlQ83JaK+CH3VaODU5Lyv1QQCzXsYuITzbX+KmKYG0uz
 7d/Tmj9WnIXOHBcnGjlM4oxOOCRrrjihgdMjvMh9sOjkYh3037NdodyVR2Y/7uQAlxlqFFR50/o
 JWd/Kobh4zgPUT/x0TNJK74zHI711/nrkpxuSQPgVMjIiEttZcry5jeaZmkQulHYHscY4hKxUey
 t1vAhaaSE7nGN+ZcRPbfD80LnZcG555wePEe9iZMxDZ1qq9UAuMzkk5Wp+eaoBB4dD2yQQ0dhjV
 /qIrfAmgi29aSlzqmTAVfLW7kerm2QEA7JNMIa1gRpSL1orY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_162209_770342_5FB1EC19 
X-CRM114-Status: UNSURE (   7.39  )
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

On Mon, 20 Apr 2026 17:32:03 -0300, Joao Marinho joao.bcc@usp.br wrote:
> ASoC: mchp-spdifrx: Replace manual bitfield manipulations with macros and typo correction

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mchp-spdifrx: Replace manual bitfield manipulations with macros and typo correction
      https://git.kernel.org/broonie/asoc/c/0241d6192a11

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


