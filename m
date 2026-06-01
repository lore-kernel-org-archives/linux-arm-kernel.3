Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E63CD6E66
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 12:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJA7w3xzgecjwWHwnAUFF6LzuAM1+ne0JePMO4csh+k=; b=E1onbnx+Y3xx7f+VRVTfky7eJt
	JImV4gaWDqLUt7dHSZcjgRolhrym/jl8T4hHj1E3el6KWe3R9mokxdehPCzBb+Pu+dz15VKD+Kskn
	GrtSxOtkHLDEvRO9vv53fEtbQYVKMmL12uYm5z3AydPdGKIJPrm43AiacpT0ktaHyyxcTOiUGjHBW
	W2485SjaGD1TYeZgfzlqYDA9unC0YJIcXvdRR9HGClKdues9rIRpPyzzeYhWC8FEziN4nDiOZxi0f
	RyhVx4utnSQdNmMXL6XlalsFPpTkxVW+A2YMNFldES6gCAYSIDcFKY6h3w0CH5KDOB2yKEle0GhKt
	ivk8pk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNuF-0000000CwM9-0gWY;
	Tue, 02 Jun 2026 12:07:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNuD-0000000CwLt-337G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 12:07:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 087B2601D6;
	Tue,  2 Jun 2026 12:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C5C1F00893;
	Tue,  2 Jun 2026 12:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402056;
	bh=VJA7w3xzgecjwWHwnAUFF6LzuAM1+ne0JePMO4csh+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U7SJ1EsvihMTmUIbqwqlMV2UyhPajkrwaHJaLCKCrWbFhjE0BMxN+ULrqi2etCj+W
	 Y4SuumhdIV9c4MtbmVd/N79E097hMTGO+vqjftranNPbenazA6ZXlgP3LAPZ+LlfXN
	 STy821OavAU7++4XuAYKuZmbA2pyCC22iakkAb93RimZoREF+0i7fwpiWdflHukSYL
	 rkLjRB/G/M3XkiuKBbS0QlmUC6QSnW+zpSk/H2J5zD0WnNLpWC7/zTBm3RruqBZr0T
	 mmTO0C9jyBEEMD8MTcDliSeKN0LleUwNiDVOH8Itl9XD2sHcGzhF3vfaG/LksTLDFo
	 V7wiVuWmBW07w==
From: Mark Brown <broonie@kernel.org>
To: Ryan Wanner <ryan.wanner@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Radu Pirea <radu.pirea@microchip.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260522-atmel-v3-1-23f8c6e6aa43@gmail.com>
References: <20260522-atmel-v3-1-23f8c6e6aa43@gmail.com>
Subject: Re: [PATCH v3] spi: atmel: fix DMA channel and bounce buffer leaks
Message-Id: <178032262266.44654.1407463849398099682.b4-ty@b4>
Date: Mon, 01 Jun 2026 15:03:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fq4MRlSQGyPImcnKwFOCdZ/18ZUwH/RbQ6nxgpZJb80=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHseF2SiZ1uFar3jksgA++98v0V+QfmRiB2btJ
 s3JChwQoyiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HhQAKCRAk1otyXVSH
 0AobB/9FqVimQOidUwQHwlUB99dAoIyNU7QrJDIl9SHeNCTttEs9uhAEvfRPvrOTOlkao14FpiM
 HHw6nBMd9fbq2BLIX5kV7vuhz8LQO/r2pnOlZ8BPKwWTZxoFhfQazRr9udEjTpA0Ggod727Q7e1
 0C3qL+HGo854C4ILPXleB9u8NlTY4rEIK6SLqooSc5Tm2v4NuWAgostEJaPWD+Z3lotgsl1FxWY
 mQQ+KoO4tXjEf9y3bF1+aNG5YzGsXZUr/uSfNj0D2W3zc8zD+Kah0iIjZtoQ6Bpl+a+tUy4O2er
 yaTomfLg19m6qx4dcv8yjPBwWTckm9JVP9XrsPu77Yp/tOFJ
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

On Fri, 22 May 2026 20:40:48 +0800, Felix Gu wrote:
> spi: atmel: fix DMA channel and bounce buffer leaks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[1/1] spi: atmel: fix DMA channel and bounce buffer leaks
      https://git.kernel.org/broonie/spi/c/bd7e9843ec95

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


