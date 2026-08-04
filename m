Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29EBC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHu7nUoKAcszBoQg8ltjHjQ4D9lctd02DJ/hqPfKriU=; b=QZBdcW0H5v1h4mlDYmdRVXvZUP
	BHZbBh5DFuFiuHA9prXFeb12UoupWeERbDHKoHEjBjULqOMb5Az1J3sAyp9EqM4ZjTi0w8HzOQyUM
	ZUEn3sAN3cQAfQNuVDwoKXlfLt18Pm11SjnSD4Vn+WMcfOOwXHwA79IxfaU7FGZ3OHOOiiG5X8yrO
	zEdov+ZF1Y3tRnp4ZZPItXFXhKRz9EVuFoUHm6UXYyA8WH54ttNUhuFzpsfGmhJ08uQ9NpBf7tiJn
	7XlWWfW/FZD18bgJ3Vtu86tH3aydD3KapI38zcn55+uVUb7f+5QMs0KM5u4jbq3RLAI6+GabJNuvD
	ZM+hspZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYms-00000003jTr-2K1e;
	Wed, 05 Aug 2026 10:23:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYmr-00000003jT1-2EGF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CD5B451BC;
	Wed,  5 Aug 2026 10:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8021F000E9;
	Wed,  5 Aug 2026 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785925425;
	bh=lHu7nUoKAcszBoQg8ltjHjQ4D9lctd02DJ/hqPfKriU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fd8mcH8r8AddVPKSaH4YxveKpsxOR8dGJEZ1s10vErEvIo+8BUkqJP+n6EiRlMevI
	 2XmBI+AGKZznow85/1ssXA1mhdU2czUsVRAKN5EgO+mFSWSYSEA4gh+vEySkCL7kb+
	 c1hecK8xpbnsvlIZvX5RRKiAm7snJsV3LbFnkLD5iTmecv4d4z049diWkcoz9KulCs
	 Ai5Xt39JnTGUB0QtrM+DHnNIU7YwPkpR66YhvQS3sQhng0NhJ/HXYxlmt2LI17cygP
	 oOiN4tCk4J5dWE0smaumZccTKggjHgWy/+pG/xbwsaORzDaeA/4EtPqNpxzaoktNSy
	 AWKxy3980V6aw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michal Simek <michal.simek@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803231823.95147-1-rosenp@gmail.com>
References: <20260803231823.95147-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: xilinx: replace OF with device handlers
Message-Id: <178587305577.111355.14781935298630433831.b4-ty@b4>
Date: Tue, 04 Aug 2026 20:50:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
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

On Mon, 03 Aug 2026 16:18:23 -0700, Rosen Penev wrote:
> ASoC: xilinx: replace OF with device handlers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: xilinx: replace OF with device handlers
      https://git.kernel.org/broonie/sound/c/99ddfbba9e71

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


